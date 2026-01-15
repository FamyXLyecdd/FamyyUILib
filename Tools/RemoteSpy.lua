--[[
    FAMYY PRIVATE - Remote Browser
    Version: 2.0
    
    Works on ALL executors including Solara!
    Lists all remotes, lets you explore and test them.
    
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
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- ============================================================================
-- STORAGE
-- ============================================================================

local AllRemotes = {}
local SelectedRemote = nil

-- ============================================================================
-- UTILITIES
-- ============================================================================

local function formatValue(v, depth)
    depth = depth or 0
    if depth > 2 then return "..." end
    
    local t = typeof(v)
    
    if t == "string" then
        return '"' .. v:sub(1, 50) .. '"'
    elseif t == "number" or t == "boolean" then
        return tostring(v)
    elseif t == "nil" then
        return "nil"
    elseif t == "Instance" then
        return v:GetFullName()
    elseif t == "Vector3" then
        return string.format("Vector3.new(%.1f, %.1f, %.1f)", v.X, v.Y, v.Z)
    elseif t == "CFrame" then
        return string.format("CFrame.new(%.1f, %.1f, %.1f)", v.X, v.Y, v.Z)
    elseif t == "table" then
        local parts = {}
        local count = 0
        for k, val in pairs(v) do
            count = count + 1
            if count > 5 then
                table.insert(parts, "...")
                break
            end
            table.insert(parts, tostring(k) .. "=" .. formatValue(val, depth + 1))
        end
        return "{" .. table.concat(parts, ", ") .. "}"
    else
        return "<" .. t .. ">"
    end
end

-- ============================================================================
-- SCAN REMOTES
-- ============================================================================

local function scanRemotes()
    AllRemotes = {}
    
    local function scan(parent, path)
        for _, child in pairs(parent:GetChildren()) do
            local childPath = path .. "." .. child.Name
            
            if child:IsA("RemoteEvent") then
                table.insert(AllRemotes, {
                    Instance = child,
                    Name = child.Name,
                    Path = childPath,
                    Type = "RemoteEvent",
                    FullName = child:GetFullName()
                })
            elseif child:IsA("RemoteFunction") then
                table.insert(AllRemotes, {
                    Instance = child,
                    Name = child.Name,
                    Path = childPath,
                    Type = "RemoteFunction",
                    FullName = child:GetFullName()
                })
            end
            
            -- Recurse
            if #child:GetChildren() > 0 then
                scan(child, childPath)
            end
        end
    end
    
    -- Scan common locations
    pcall(function() scan(ReplicatedStorage, "ReplicatedStorage") end)
    pcall(function() scan(game:GetService("Workspace"), "Workspace") end)
    pcall(function() scan(LocalPlayer.PlayerScripts, "PlayerScripts") end)
    pcall(function() scan(LocalPlayer.PlayerGui, "PlayerGui") end)
    
    -- Sort by name
    table.sort(AllRemotes, function(a, b) return a.Name < b.Name end)
    
    return AllRemotes
end

-- ============================================================================
-- GUI
-- ============================================================================

local function createGUI()
    -- Remove old GUI
    pcall(function()
        if CoreGui:FindFirstChild("FamyyRemoteBrowser") then
            CoreGui:FindFirstChild("FamyyRemoteBrowser"):Destroy()
        end
    end)
    pcall(function()
        if LocalPlayer.PlayerGui:FindFirstChild("FamyyRemoteBrowser") then
            LocalPlayer.PlayerGui:FindFirstChild("FamyyRemoteBrowser"):Destroy()
        end
    end)
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FamyyRemoteBrowser"
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
    MainFrame.Size = UDim2.new(0, 550, 0, 450)
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -225)
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
    TitleLabel.Size = UDim2.new(1, -40, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "FAMYY REMOTE BROWSER - " .. #AllRemotes .. " REMOTES FOUND"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar
    
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
    
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Search Box
    local SearchBox = Instance.new("TextBox")
    SearchBox.Size = UDim2.new(1, -20, 0, 30)
    SearchBox.Position = UDim2.new(0, 10, 0, 40)
    SearchBox.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    SearchBox.Text = ""
    SearchBox.PlaceholderText = "Search remotes... (e.g. 'click', 'buy', 'convert')"
    SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
    SearchBox.TextSize = 12
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.ClearTextOnFocus = false
    SearchBox.Parent = MainFrame
    
    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 4)
    SearchCorner.Parent = SearchBox
    
    -- Left Panel (Remote List)
    local LeftPanel = Instance.new("Frame")
    LeftPanel.Size = UDim2.new(0.5, -15, 1, -125)
    LeftPanel.Position = UDim2.new(0, 10, 0, 75)
    LeftPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    LeftPanel.BorderSizePixel = 0
    LeftPanel.Parent = MainFrame
    
    local LeftCorner = Instance.new("UICorner")
    LeftCorner.CornerRadius = UDim.new(0, 6)
    LeftCorner.Parent = LeftPanel
    
    local RemoteScroll = Instance.new("ScrollingFrame")
    RemoteScroll.Size = UDim2.new(1, 0, 1, 0)
    RemoteScroll.BackgroundTransparency = 1
    RemoteScroll.ScrollBarThickness = 4
    RemoteScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 100)
    RemoteScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    RemoteScroll.Parent = LeftPanel
    
    local RemoteLayout = Instance.new("UIListLayout")
    RemoteLayout.SortOrder = Enum.SortOrder.LayoutOrder
    RemoteLayout.Padding = UDim.new(0, 2)
    RemoteLayout.Parent = RemoteScroll
    
    local RemotePadding = Instance.new("UIPadding")
    RemotePadding.PaddingTop = UDim.new(0, 5)
    RemotePadding.PaddingBottom = UDim.new(0, 5)
    RemotePadding.PaddingLeft = UDim.new(0, 5)
    RemotePadding.PaddingRight = UDim.new(0, 5)
    RemotePadding.Parent = RemoteScroll
    
    -- Right Panel (Details)
    local RightPanel = Instance.new("Frame")
    RightPanel.Size = UDim2.new(0.5, -15, 1, -125)
    RightPanel.Position = UDim2.new(0.5, 5, 0, 75)
    RightPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    RightPanel.BorderSizePixel = 0
    RightPanel.Parent = MainFrame
    
    local RightCorner = Instance.new("UICorner")
    RightCorner.CornerRadius = UDim.new(0, 6)
    RightCorner.Parent = RightPanel
    
    -- Details Title
    local DetailsTitle = Instance.new("TextLabel")
    DetailsTitle.Size = UDim2.new(1, -10, 0, 25)
    DetailsTitle.Position = UDim2.new(0, 5, 0, 5)
    DetailsTitle.BackgroundTransparency = 1
    DetailsTitle.Text = "SELECT A REMOTE"
    DetailsTitle.TextColor3 = Color3.fromRGB(255, 200, 100)
    DetailsTitle.TextSize = 12
    DetailsTitle.Font = Enum.Font.GothamBold
    DetailsTitle.TextXAlignment = Enum.TextXAlignment.Left
    DetailsTitle.Parent = RightPanel
    
    -- Details Info
    local DetailsInfo = Instance.new("TextLabel")
    DetailsInfo.Size = UDim2.new(1, -10, 0, 80)
    DetailsInfo.Position = UDim2.new(0, 5, 0, 30)
    DetailsInfo.BackgroundTransparency = 1
    DetailsInfo.Text = "Click a remote on the left to see details"
    DetailsInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    DetailsInfo.TextSize = 10
    DetailsInfo.Font = Enum.Font.Code
    DetailsInfo.TextXAlignment = Enum.TextXAlignment.Left
    DetailsInfo.TextYAlignment = Enum.TextYAlignment.Top
    DetailsInfo.TextWrapped = true
    DetailsInfo.Parent = RightPanel
    
    -- Code Box
    local CodeBox = Instance.new("TextBox")
    CodeBox.Size = UDim2.new(1, -10, 0, 80)
    CodeBox.Position = UDim2.new(0, 5, 0, 115)
    CodeBox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    CodeBox.Text = "-- Code will appear here"
    CodeBox.TextColor3 = Color3.fromRGB(100, 255, 100)
    CodeBox.TextSize = 10
    CodeBox.Font = Enum.Font.Code
    CodeBox.TextXAlignment = Enum.TextXAlignment.Left
    CodeBox.TextYAlignment = Enum.TextYAlignment.Top
    CodeBox.TextWrapped = true
    CodeBox.ClearTextOnFocus = false
    CodeBox.MultiLine = true
    CodeBox.Parent = RightPanel
    
    local CodeCorner = Instance.new("UICorner")
    CodeCorner.CornerRadius = UDim.new(0, 4)
    CodeCorner.Parent = CodeBox
    
    -- Buttons
    local function createBtn(text, posY, color)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.48, 0, 0, 28)
        btn.Position = posY
        btn.BackgroundColor3 = color
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 11
        btn.Font = Enum.Font.GothamBold
        btn.Parent = RightPanel
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 4)
        corner.Parent = btn
        
        return btn
    end
    
    local CopyBtn = createBtn("COPY CODE", UDim2.new(0, 5, 0, 200), Color3.fromRGB(80, 120, 180))
    local SelectAllBtn = createBtn("SELECT ALL", UDim2.new(0.52, 0, 0, 200), Color3.fromRGB(100, 100, 120))
    local FireBtn = createBtn("FIRE (NO ARGS)", UDim2.new(0, 5, 0, 232), Color3.fromRGB(200, 100, 50))
    local FireWithBtn = createBtn("FIRE WITH ARGS", UDim2.new(0.52, 0, 0, 232), Color3.fromRGB(180, 80, 80))
    
    -- Args input
    local ArgsInput = Instance.new("TextBox")
    ArgsInput.Size = UDim2.new(1, -10, 0, 50)
    ArgsInput.Position = UDim2.new(0, 5, 0, 265)
    ArgsInput.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    ArgsInput.Text = ""
    ArgsInput.PlaceholderText = 'Args: "arg1", 123, true (comma separated)'
    ArgsInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    ArgsInput.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
    ArgsInput.TextSize = 10
    ArgsInput.Font = Enum.Font.Code
    ArgsInput.TextXAlignment = Enum.TextXAlignment.Left
    ArgsInput.TextYAlignment = Enum.TextYAlignment.Top
    ArgsInput.ClearTextOnFocus = false
    ArgsInput.MultiLine = true
    ArgsInput.Parent = RightPanel
    
    local ArgsCorner = Instance.new("UICorner")
    ArgsCorner.CornerRadius = UDim.new(0, 4)
    ArgsCorner.Parent = ArgsInput
    
    -- Bottom info
    local BottomInfo = Instance.new("TextLabel")
    BottomInfo.Size = UDim2.new(1, -20, 0, 40)
    BottomInfo.Position = UDim2.new(0, 10, 1, -45)
    BottomInfo.BackgroundTransparency = 1
    BottomInfo.Text = "TIP: Search for 'click', 'button', 'convert', 'buy', 'upgrade' to find useful remotes!\nFire remotes to test what they do. Check console for results."
    BottomInfo.TextColor3 = Color3.fromRGB(100, 100, 100)
    BottomInfo.TextSize = 10
    BottomInfo.Font = Enum.Font.Gotham
    BottomInfo.TextWrapped = true
    BottomInfo.Parent = MainFrame
    
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
    
    -- Populate remote list
    local function populateList(filter)
        -- Clear existing
        for _, child in pairs(RemoteScroll:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        local count = 0
        for i, remote in ipairs(AllRemotes) do
            -- Filter
            local show = true
            if filter and filter ~= "" then
                if not remote.Name:lower():find(filter:lower()) and not remote.Path:lower():find(filter:lower()) then
                    show = false
                end
            end
            
            if show then
            
            count = count + 1
            
            local btn = Instance.new("TextButton")
            btn.Name = "Remote_" .. i
            btn.Size = UDim2.new(1, -10, 0, 35)
            btn.BackgroundColor3 = remote.Type == "RemoteEvent" and Color3.fromRGB(40, 30, 30) or Color3.fromRGB(30, 30, 45)
            btn.Text = ""
            btn.LayoutOrder = i
            btn.Parent = RemoteScroll
            
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 4)
            btnCorner.Parent = btn
            
            -- Type indicator
            local typeInd = Instance.new("Frame")
            typeInd.Size = UDim2.new(0, 3, 1, -6)
            typeInd.Position = UDim2.new(0, 3, 0, 3)
            typeInd.BackgroundColor3 = remote.Type == "RemoteEvent" and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(100, 100, 255)
            typeInd.Parent = btn
            
            local typeCorner = Instance.new("UICorner")
            typeCorner.CornerRadius = UDim.new(0, 2)
            typeCorner.Parent = typeInd
            
            -- Name
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, -15, 0, 18)
            nameLabel.Position = UDim2.new(0, 12, 0, 2)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = remote.Name
            nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            nameLabel.TextSize = 11
            nameLabel.Font = Enum.Font.GothamBold
            nameLabel.TextXAlignment = Enum.TextXAlignment.Left
            nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
            nameLabel.Parent = btn
            
            -- Type label
            local typeLabel = Instance.new("TextLabel")
            typeLabel.Size = UDim2.new(1, -15, 0, 14)
            typeLabel.Position = UDim2.new(0, 12, 0, 18)
            typeLabel.BackgroundTransparency = 1
            typeLabel.Text = remote.Type
            typeLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
            typeLabel.TextSize = 9
            typeLabel.Font = Enum.Font.Gotham
            typeLabel.TextXAlignment = Enum.TextXAlignment.Left
            typeLabel.Parent = btn
            
            -- Click handler
            btn.MouseButton1Click:Connect(function()
                SelectedRemote = remote
                
                -- Update details
                DetailsTitle.Text = remote.Name
                DetailsInfo.Text = "Type: " .. remote.Type .. "\n\nPath: " .. remote.FullName
                
                -- Generate code
                local code
                if remote.Type == "RemoteEvent" then
                    code = 'game:GetService("ReplicatedStorage")' .. remote.Path:gsub("ReplicatedStorage", "") .. ':FireServer()'
                else
                    code = 'game:GetService("ReplicatedStorage")' .. remote.Path:gsub("ReplicatedStorage", "") .. ':InvokeServer()'
                end
                CodeBox.Text = code
                
                -- Highlight selected
                for _, child in pairs(RemoteScroll:GetChildren()) do
                    if child:IsA("TextButton") then
                        child.BackgroundColor3 = child.Name == "Remote_" .. i and Color3.fromRGB(60, 50, 50) or (remote.Type == "RemoteEvent" and Color3.fromRGB(40, 30, 30) or Color3.fromRGB(30, 30, 45))
                    end
                end
                btn.BackgroundColor3 = Color3.fromRGB(80, 60, 60)
            end)
            
            end -- end if show
        end
        
        -- Update canvas
        RemoteScroll.CanvasSize = UDim2.new(0, 0, 0, RemoteLayout.AbsoluteContentSize.Y + 10)
        TitleLabel.Text = "FAMYY REMOTE BROWSER - " .. count .. "/" .. #AllRemotes .. " REMOTES"
    end
    
    -- Initial populate
    populateList("")
    
    -- Search handler
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        populateList(SearchBox.Text)
    end)
    
    -- Copy button
    CopyBtn.MouseButton1Click:Connect(function()
        if SelectedRemote then
            pcall(function()
                setclipboard(CodeBox.Text)
            end)
            CopyBtn.Text = "COPIED!"
            task.delay(1, function()
                CopyBtn.Text = "COPY CODE"
            end)
        end
    end)
    
    -- Select all button
    SelectAllBtn.MouseButton1Click:Connect(function()
        CodeBox:CaptureFocus()
        CodeBox.SelectionStart = 1
        CodeBox.CursorPosition = #CodeBox.Text + 1
    end)
    
    -- Fire button (no args)
    FireBtn.MouseButton1Click:Connect(function()
        if SelectedRemote then
            local remote = SelectedRemote.Instance
            local result
            
            if SelectedRemote.Type == "RemoteEvent" then
                pcall(function()
                    remote:FireServer()
                end)
                print("[RemoteBrowser] Fired:", SelectedRemote.Name)
                FireBtn.Text = "FIRED!"
            else
                local success, res = pcall(function()
                    return remote:InvokeServer()
                end)
                if success then
                    print("[RemoteBrowser] Result:", formatValue(res))
                else
                    warn("[RemoteBrowser] Error:", res)
                end
                FireBtn.Text = "INVOKED!"
            end
            
            task.delay(1, function()
                FireBtn.Text = "FIRE (NO ARGS)"
            end)
        end
    end)
    
    -- Fire with args button
    FireWithBtn.MouseButton1Click:Connect(function()
        if SelectedRemote then
            local argsText = ArgsInput.Text
            local remote = SelectedRemote.Instance
            
            -- Parse args (simple parsing)
            local args = {}
            if argsText ~= "" then
                -- Try to load as Lua
                local func, err = loadstring("return {" .. argsText .. "}")
                if func then
                    local success, result = pcall(func)
                    if success then
                        args = result
                    else
                        warn("[RemoteBrowser] Args parse error:", result)
                    end
                else
                    warn("[RemoteBrowser] Args syntax error:", err)
                end
            end
            
            if SelectedRemote.Type == "RemoteEvent" then
                pcall(function()
                    remote:FireServer(unpack(args))
                end)
                print("[RemoteBrowser] Fired with args:", SelectedRemote.Name, unpack(args))
                FireWithBtn.Text = "FIRED!"
            else
                local success, res = pcall(function()
                    return remote:InvokeServer(unpack(args))
                end)
                if success then
                    print("[RemoteBrowser] Result:", formatValue(res))
                else
                    warn("[RemoteBrowser] Error:", res)
                end
                FireWithBtn.Text = "INVOKED!"
            end
            
            task.delay(1, function()
                FireWithBtn.Text = "FIRE WITH ARGS"
            end)
        end
    end)
    
    return ScreenGui
end

-- ============================================================================
-- MAIN
-- ============================================================================

local function main()
    print("")
    print("============================================")
    print("     FAMYY REMOTE BROWSER v2.0             ")
    print("============================================")
    print("  Scanning for remotes...                  ")
    print("")
    
    -- Scan remotes
    scanRemotes()
    
    print("  Found " .. #AllRemotes .. " remotes!")
    print("")
    print("  TIP: Search for keywords like:")
    print("    - click, button, tap")
    print("    - convert, buy, sell")
    print("    - upgrade, unlock")
    print("    - time, eon, currency")
    print("")
    
    -- Create GUI
    createGUI()
    
    print("[RemoteBrowser] Ready! Click remotes to explore.")
end

main()
