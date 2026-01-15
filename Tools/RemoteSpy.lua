--[[
    FAMYY PRIVATE - Remote Spy
    Version: 1.0
    
    Captures remotes ONLY when YOU perform actions.
    Click a button, convert eons, buy something - it logs the remote call.
    
    Usage:
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/Tools/RemoteSpy.lua"))()
]]

-- ============================================================================
-- SERVICES
-- ============================================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- ============================================================================
-- SETTINGS
-- ============================================================================

local Settings = {
    Enabled = true,
    MaxLogs = 100,
    IgnoreList = {}, -- Remote names to ignore
    ShowArgs = true,
    AutoCopy = false,
}

-- ============================================================================
-- STORAGE
-- ============================================================================

local CapturedRemotes = {}
local Hooks = {}
local OriginalFunctions = {}

-- ============================================================================
-- UTILITIES
-- ============================================================================

local function deepCopy(t)
    if type(t) ~= "table" then return t end
    local copy = {}
    for k, v in pairs(t) do
        copy[k] = deepCopy(v)
    end
    return copy
end

local function formatValue(v, depth)
    depth = depth or 0
    if depth > 3 then return "..." end
    
    local t = typeof(v)
    
    if t == "string" then
        return '"' .. v:gsub('"', '\\"'):sub(1, 100) .. '"'
    elseif t == "number" then
        return tostring(v)
    elseif t == "boolean" then
        return tostring(v)
    elseif t == "nil" then
        return "nil"
    elseif t == "Instance" then
        return v:GetFullName()
    elseif t == "Vector3" then
        return string.format("Vector3.new(%.2f, %.2f, %.2f)", v.X, v.Y, v.Z)
    elseif t == "CFrame" then
        return string.format("CFrame.new(%.2f, %.2f, %.2f)", v.X, v.Y, v.Z)
    elseif t == "Color3" then
        return string.format("Color3.new(%.2f, %.2f, %.2f)", v.R, v.G, v.B)
    elseif t == "UDim2" then
        return string.format("UDim2.new(%.2f, %d, %.2f, %d)", v.X.Scale, v.X.Offset, v.Y.Scale, v.Y.Offset)
    elseif t == "EnumItem" then
        return tostring(v)
    elseif t == "table" then
        local parts = {}
        local count = 0
        for k, val in pairs(v) do
            count = count + 1
            if count > 10 then
                table.insert(parts, "...")
                break
            end
            local key = type(k) == "string" and k or "[" .. formatValue(k, depth + 1) .. "]"
            table.insert(parts, key .. " = " .. formatValue(val, depth + 1))
        end
        return "{" .. table.concat(parts, ", ") .. "}"
    else
        return "<" .. t .. ">"
    end
end

local function formatArgs(args)
    local formatted = {}
    for i, v in ipairs(args) do
        table.insert(formatted, formatValue(v))
    end
    return table.concat(formatted, ", ")
end

local function generateCode(remotePath, remoteType, args)
    local code = ""
    
    if remoteType == "RemoteEvent" then
        code = string.format('game:GetService("ReplicatedStorage")%s:FireServer(%s)', 
            remotePath:gsub("ReplicatedStorage", ""), 
            formatArgs(args))
    elseif remoteType == "RemoteFunction" then
        code = string.format('game:GetService("ReplicatedStorage")%s:InvokeServer(%s)', 
            remotePath:gsub("ReplicatedStorage", ""), 
            formatArgs(args))
    elseif remoteType == "BindableEvent" then
        code = string.format('--%s:Fire(%s)', remotePath, formatArgs(args))
    end
    
    return code
end

-- ============================================================================
-- GUI
-- ============================================================================

local function createGUI()
    -- Remove old GUI
    if CoreGui:FindFirstChild("FamyyRemoteSpy") then
        CoreGui:FindFirstChild("FamyyRemoteSpy"):Destroy()
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FamyyRemoteSpy"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Try CoreGui, fallback to PlayerGui
    pcall(function()
        ScreenGui.Parent = CoreGui
    end)
    if not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 500, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = MainFrame
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 35)
    TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 8)
    TitleCorner.Parent = TitleBar
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -100, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "FAMYY REMOTE SPY - DO ACTIONS TO CAPTURE"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar
    
    -- Status indicator
    local StatusDot = Instance.new("Frame")
    StatusDot.Name = "StatusDot"
    StatusDot.Size = UDim2.new(0, 10, 0, 10)
    StatusDot.Position = UDim2.new(1, -80, 0.5, -5)
    StatusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    StatusDot.Parent = TitleBar
    
    local StatusCorner = Instance.new("UICorner")
    StatusCorner.CornerRadius = UDim.new(1, 0)
    StatusCorner.Parent = StatusDot
    
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(0, 60, 1, 0)
    StatusLabel.Position = UDim2.new(1, -65, 0, 0)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "RECORDING"
    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
    StatusLabel.TextSize = 11
    StatusLabel.Font = Enum.Font.GothamBold
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatusLabel.Parent = TitleBar
    
    -- Close button
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 25, 0, 25)
    CloseBtn.Position = UDim2.new(1, -30, 0, 5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 14
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Parent = TitleBar
    
    local CloseBtnCorner = Instance.new("UICorner")
    CloseBtnCorner.CornerRadius = UDim.new(0, 4)
    CloseBtnCorner.Parent = CloseBtn
    
    -- Button container
    local ButtonContainer = Instance.new("Frame")
    ButtonContainer.Size = UDim2.new(1, -20, 0, 30)
    ButtonContainer.Position = UDim2.new(0, 10, 0, 40)
    ButtonContainer.BackgroundTransparency = 1
    ButtonContainer.Parent = MainFrame
    
    local function createButton(text, pos, color)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 80, 1, 0)
        btn.Position = pos
        btn.BackgroundColor3 = color
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 12
        btn.Font = Enum.Font.GothamBold
        btn.Parent = ButtonContainer
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 4)
        corner.Parent = btn
        
        return btn
    end
    
    local ClearBtn = createButton("CLEAR", UDim2.new(0, 0, 0, 0), Color3.fromRGB(80, 80, 90))
    local PauseBtn = createButton("PAUSE", UDim2.new(0, 85, 0, 0), Color3.fromRGB(200, 150, 50))
    local ExportBtn = createButton("EXPORT", UDim2.new(0, 170, 0, 0), Color3.fromRGB(50, 150, 200))
    local CopyLastBtn = createButton("COPY LAST", UDim2.new(0, 255, 0, 0), Color3.fromRGB(100, 180, 100))
    
    -- Scroll Frame for logs
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Name = "LogsScroll"
    ScrollFrame.Size = UDim2.new(1, -20, 1, -85)
    ScrollFrame.Position = UDim2.new(0, 10, 0, 75)
    ScrollFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.ScrollBarThickness = 6
    ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 100)
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollFrame.Parent = MainFrame
    
    local ScrollCorner = Instance.new("UICorner")
    ScrollCorner.CornerRadius = UDim.new(0, 6)
    ScrollCorner.Parent = ScrollFrame
    
    local LogLayout = Instance.new("UIListLayout")
    LogLayout.SortOrder = Enum.SortOrder.LayoutOrder
    LogLayout.Padding = UDim.new(0, 5)
    LogLayout.Parent = ScrollFrame
    
    local LogPadding = Instance.new("UIPadding")
    LogPadding.PaddingTop = UDim.new(0, 5)
    LogPadding.PaddingBottom = UDim.new(0, 5)
    LogPadding.PaddingLeft = UDim.new(0, 5)
    LogPadding.PaddingRight = UDim.new(0, 5)
    LogPadding.Parent = ScrollFrame
    
    -- Make draggable
    local dragging, dragStart, startPos
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    
    TitleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    -- Close button
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
        -- Unhook everything
        for _, hook in pairs(Hooks) do
            pcall(function() hook:Disconnect() end)
        end
    end)
    
    -- Clear button
    ClearBtn.MouseButton1Click:Connect(function()
        CapturedRemotes = {}
        for _, child in pairs(ScrollFrame:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
        ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    end)
    
    -- Pause button
    PauseBtn.MouseButton1Click:Connect(function()
        Settings.Enabled = not Settings.Enabled
        if Settings.Enabled then
            PauseBtn.Text = "PAUSE"
            PauseBtn.BackgroundColor3 = Color3.fromRGB(200, 150, 50)
            StatusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
            StatusLabel.Text = "RECORDING"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
        else
            PauseBtn.Text = "RESUME"
            PauseBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
            StatusDot.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
            StatusLabel.Text = "PAUSED"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 150, 50)
        end
    end)
    
    -- Export button
    ExportBtn.MouseButton1Click:Connect(function()
        local output = "-- FAMYY Remote Spy Export\n"
        output = output .. "-- Captured " .. #CapturedRemotes .. " remote calls\n\n"
        
        for i, capture in ipairs(CapturedRemotes) do
            output = output .. "-- [" .. i .. "] " .. capture.Name .. " (" .. capture.Type .. ")\n"
            output = output .. capture.Code .. "\n\n"
        end
        
        -- Create export window
        local ExportGui = Instance.new("ScreenGui")
        ExportGui.Name = "FamyyExport"
        ExportGui.Parent = ScreenGui.Parent
        
        local ExportFrame = Instance.new("Frame")
        ExportFrame.Size = UDim2.new(0, 500, 0, 300)
        ExportFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
        ExportFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        ExportFrame.Parent = ExportGui
        
        local ExportCorner = Instance.new("UICorner")
        ExportCorner.CornerRadius = UDim.new(0, 8)
        ExportCorner.Parent = ExportFrame
        
        local ExportBox = Instance.new("TextBox")
        ExportBox.Size = UDim2.new(1, -20, 1, -50)
        ExportBox.Position = UDim2.new(0, 10, 0, 10)
        ExportBox.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
        ExportBox.Text = output
        ExportBox.TextColor3 = Color3.fromRGB(200, 200, 200)
        ExportBox.TextSize = 11
        ExportBox.Font = Enum.Font.Code
        ExportBox.TextXAlignment = Enum.TextXAlignment.Left
        ExportBox.TextYAlignment = Enum.TextYAlignment.Top
        ExportBox.TextWrapped = true
        ExportBox.ClearTextOnFocus = false
        ExportBox.MultiLine = true
        ExportBox.Parent = ExportFrame
        
        local ExportBoxCorner = Instance.new("UICorner")
        ExportBoxCorner.CornerRadius = UDim.new(0, 4)
        ExportBoxCorner.Parent = ExportBox
        
        local SelectAllBtn = Instance.new("TextButton")
        SelectAllBtn.Size = UDim2.new(0, 100, 0, 30)
        SelectAllBtn.Position = UDim2.new(0.5, -110, 1, -40)
        SelectAllBtn.BackgroundColor3 = Color3.fromRGB(100, 150, 200)
        SelectAllBtn.Text = "SELECT ALL"
        SelectAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        SelectAllBtn.TextSize = 12
        SelectAllBtn.Font = Enum.Font.GothamBold
        SelectAllBtn.Parent = ExportFrame
        
        local SelectCorner = Instance.new("UICorner")
        SelectCorner.CornerRadius = UDim.new(0, 4)
        SelectCorner.Parent = SelectAllBtn
        
        local CloseExportBtn = Instance.new("TextButton")
        CloseExportBtn.Size = UDim2.new(0, 100, 0, 30)
        CloseExportBtn.Position = UDim2.new(0.5, 10, 1, -40)
        CloseExportBtn.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
        CloseExportBtn.Text = "CLOSE"
        CloseExportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        CloseExportBtn.TextSize = 12
        CloseExportBtn.Font = Enum.Font.GothamBold
        CloseExportBtn.Parent = ExportFrame
        
        local CloseExportCorner = Instance.new("UICorner")
        CloseExportCorner.CornerRadius = UDim.new(0, 4)
        CloseExportCorner.Parent = CloseExportBtn
        
        SelectAllBtn.MouseButton1Click:Connect(function()
            ExportBox:CaptureFocus()
            ExportBox.SelectionStart = 1
            ExportBox.CursorPosition = #ExportBox.Text + 1
        end)
        
        CloseExportBtn.MouseButton1Click:Connect(function()
            ExportGui:Destroy()
        end)
    end)
    
    -- Copy last button
    CopyLastBtn.MouseButton1Click:Connect(function()
        if #CapturedRemotes > 0 then
            local last = CapturedRemotes[#CapturedRemotes]
            
            -- Try clipboard
            pcall(function()
                setclipboard(last.Code)
            end)
            
            -- Show copied notification
            CopyLastBtn.Text = "COPIED!"
            CopyLastBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
            task.delay(1, function()
                CopyLastBtn.Text = "COPY LAST"
                CopyLastBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
            end)
        end
    end)
    
    return ScreenGui, ScrollFrame, LogLayout
end

-- ============================================================================
-- ADD LOG ENTRY
-- ============================================================================

local GUI, ScrollFrame, LogLayout

local function addLogEntry(remoteName, remoteType, remotePath, args, code)
    if not GUI or not GUI.Parent then return end
    
    -- Store capture
    table.insert(CapturedRemotes, {
        Name = remoteName,
        Type = remoteType,
        Path = remotePath,
        Args = args,
        Code = code,
        Time = os.time()
    })
    
    -- Limit logs
    if #CapturedRemotes > Settings.MaxLogs then
        table.remove(CapturedRemotes, 1)
        local firstChild = ScrollFrame:FindFirstChildOfClass("Frame")
        if firstChild then firstChild:Destroy() end
    end
    
    -- Create log entry
    local Entry = Instance.new("Frame")
    Entry.Name = "Entry_" .. #CapturedRemotes
    Entry.Size = UDim2.new(1, -10, 0, 60)
    Entry.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    Entry.LayoutOrder = #CapturedRemotes
    Entry.Parent = ScrollFrame
    
    local EntryCorner = Instance.new("UICorner")
    EntryCorner.CornerRadius = UDim.new(0, 4)
    EntryCorner.Parent = Entry
    
    -- Remote type indicator
    local TypeIndicator = Instance.new("Frame")
    TypeIndicator.Size = UDim2.new(0, 4, 1, -10)
    TypeIndicator.Position = UDim2.new(0, 5, 0, 5)
    TypeIndicator.BackgroundColor3 = remoteType == "RemoteEvent" and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(100, 100, 255)
    TypeIndicator.Parent = Entry
    
    local TypeCorner = Instance.new("UICorner")
    TypeCorner.CornerRadius = UDim.new(0, 2)
    TypeCorner.Parent = TypeIndicator
    
    -- Remote name
    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(1, -80, 0, 18)
    NameLabel.Position = UDim2.new(0, 15, 0, 5)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = remoteName .. " [" .. remoteType .. "]"
    NameLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    NameLabel.TextSize = 12
    NameLabel.Font = Enum.Font.GothamBold
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    NameLabel.Parent = Entry
    
    -- Args preview
    local ArgsLabel = Instance.new("TextLabel")
    ArgsLabel.Size = UDim2.new(1, -80, 0, 32)
    ArgsLabel.Position = UDim2.new(0, 15, 0, 23)
    ArgsLabel.BackgroundTransparency = 1
    ArgsLabel.Text = formatArgs(args):sub(1, 200)
    ArgsLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    ArgsLabel.TextSize = 10
    ArgsLabel.Font = Enum.Font.Code
    ArgsLabel.TextXAlignment = Enum.TextXAlignment.Left
    ArgsLabel.TextYAlignment = Enum.TextYAlignment.Top
    ArgsLabel.TextWrapped = true
    ArgsLabel.TextTruncate = Enum.TextTruncate.AtEnd
    ArgsLabel.Parent = Entry
    
    -- Copy button
    local CopyBtn = Instance.new("TextButton")
    CopyBtn.Size = UDim2.new(0, 50, 0, 50)
    CopyBtn.Position = UDim2.new(1, -55, 0, 5)
    CopyBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 180)
    CopyBtn.Text = "COPY"
    CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyBtn.TextSize = 10
    CopyBtn.Font = Enum.Font.GothamBold
    CopyBtn.Parent = Entry
    
    local CopyBtnCorner = Instance.new("UICorner")
    CopyBtnCorner.CornerRadius = UDim.new(0, 4)
    CopyBtnCorner.Parent = CopyBtn
    
    CopyBtn.MouseButton1Click:Connect(function()
        pcall(function()
            setclipboard(code)
        end)
        CopyBtn.Text = "OK!"
        CopyBtn.BackgroundColor3 = Color3.fromRGB(80, 180, 80)
        task.delay(1, function()
            if CopyBtn and CopyBtn.Parent then
                CopyBtn.Text = "COPY"
                CopyBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 180)
            end
        end)
    end)
    
    -- Update canvas size
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, LogLayout.AbsoluteContentSize.Y + 10)
    
    -- Auto scroll to bottom
    ScrollFrame.CanvasPosition = Vector2.new(0, ScrollFrame.CanvasSize.Y.Offset)
    
    print("[RemoteSpy] Captured:", remoteName, "(" .. remoteType .. ")")
end

-- ============================================================================
-- HOOK REMOTES
-- ============================================================================

local function hookRemote(remote)
    if not remote then return end
    
    local remoteName = remote.Name
    local remotePath = remote:GetFullName()
    local remoteType = remote.ClassName
    
    -- Skip ignored
    for _, ignored in ipairs(Settings.IgnoreList) do
        if remoteName:lower():find(ignored:lower()) then
            return
        end
    end
    
    -- Hook based on type
    if remoteType == "RemoteEvent" then
        local oldFire = remote.FireServer
        
        local hook
        hook = hookfunction and hookfunction(oldFire, function(self, ...)
            if Settings.Enabled and self == remote then
                local args = {...}
                local code = generateCode(remotePath, remoteType, args)
                addLogEntry(remoteName, remoteType, remotePath, args, code)
            end
            return oldFire(self, ...)
        end)
        
        -- Fallback: use namecall hook if hookfunction doesn't exist
        if not hook then
            -- Will use namecall method instead
        end
        
    elseif remoteType == "RemoteFunction" then
        local oldInvoke = remote.InvokeServer
        
        local hook
        hook = hookfunction and hookfunction(oldInvoke, function(self, ...)
            if Settings.Enabled and self == remote then
                local args = {...}
                local code = generateCode(remotePath, remoteType, args)
                addLogEntry(remoteName, remoteType, remotePath, args, code)
            end
            return oldInvoke(self, ...)
        end)
    end
end

-- ============================================================================
-- NAMECALL HOOK (MAIN METHOD)
-- ============================================================================

local function setupNamecallHook()
    if not getnamecallmethod then
        warn("[RemoteSpy] getnamecallmethod not available, using alternative method")
        return false
    end
    
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        if Settings.Enabled then
            if method == "FireServer" and self:IsA("RemoteEvent") then
                local remoteName = self.Name
                local remotePath = self:GetFullName()
                local code = generateCode(remotePath, "RemoteEvent", args)
                
                task.defer(function()
                    addLogEntry(remoteName, "RemoteEvent", remotePath, args, code)
                end)
                
            elseif method == "InvokeServer" and self:IsA("RemoteFunction") then
                local remoteName = self.Name
                local remotePath = self:GetFullName()
                local code = generateCode(remotePath, "RemoteFunction", args)
                
                task.defer(function()
                    addLogEntry(remoteName, "RemoteFunction", remotePath, args, code)
                end)
            end
        end
        
        return oldNamecall(self, ...)
    end)
    
    return true
end

-- ============================================================================
-- ALTERNATIVE: CONNECTION-BASED SPY
-- ============================================================================

local function setupConnectionSpy()
    -- This watches for new remotes and tries to hook them
    local function scanRemotes(parent)
        for _, child in pairs(parent:GetDescendants()) do
            if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
                hookRemote(child)
            end
        end
    end
    
    -- Scan existing
    scanRemotes(ReplicatedStorage)
    pcall(function() scanRemotes(game:GetService("Workspace")) end)
    
    -- Watch for new ones
    ReplicatedStorage.DescendantAdded:Connect(function(desc)
        if desc:IsA("RemoteEvent") or desc:IsA("RemoteFunction") then
            hookRemote(desc)
        end
    end)
end

-- ============================================================================
-- MAIN
-- ============================================================================

local function main()
    print("")
    print("╔══════════════════════════════════════════╗")
    print("║       FAMYY REMOTE SPY v1.0              ║")
    print("╠══════════════════════════════════════════╣")
    print("║  Do actions in game to capture remotes   ║")
    print("║  Click buttons, buy items, etc.          ║")
    print("╚══════════════════════════════════════════╝")
    print("")
    
    -- Create GUI
    GUI, ScrollFrame, LogLayout = createGUI()
    
    -- Try namecall hook first (best method)
    local success = pcall(setupNamecallHook)
    
    if not success then
        print("[RemoteSpy] Namecall hook failed, using connection spy...")
        setupConnectionSpy()
    else
        print("[RemoteSpy] Namecall hook active - all remotes will be captured!")
    end
    
    print("[RemoteSpy] Ready! Perform actions to capture remotes.")
end

main()
