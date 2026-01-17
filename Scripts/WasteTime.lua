--[[
    ██╗    ██╗ █████╗ ███████╗████████╗███████╗    ████████╗██╗███╗   ███╗███████╗
    ██║    ██║██╔══██╗██╔════╝╚══██╔══╝██╔════╝    ╚══██╔══╝██║████╗ ████║██╔════╝
    ██║ █╗ ██║███████║███████╗   ██║   █████╗         ██║   ██║██╔████╔██║█████╗  
    ██║███╗██║██╔══██║╚════██║   ██║   ██╔══╝         ██║   ██║██║╚██╔╝██║██╔══╝  
    ╚███╔███╔╝██║  ██║███████║   ██║   ███████╗       ██║   ██║██║ ╚═╝ ██║███████╗
     ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝       ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝
    
    FAMYY PRIVATE - Waste Time Script v2.1
    
    UPDATED FEATURES:
    - Auto Farm (Smart Highest Area Detection)
    - Auto Universe (Logic: 100 Qitg + Scaling)
    - Consolidated Auto Farm Tab
    - Position Check & Re-Teleport
]]

-- ============================================================================
-- SERVICES
-- ============================================================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- ============================================================================
-- CONFIGURATION & LOCATIONS
-- ============================================================================
local LOCATIONS = {
    Convert = Vector3.new(16.22, 1.63, 1.40),
    ButtonRed = Vector3.new(-76.95, 3.79, 12.18),
    ButtonGreen = Vector3.new(-93.95, 2.62, 32.50),
    Universe = Vector3.new(1220.26, 86.92, -2841.28),
    Areas = {
        -- Base Areas (Sorted by Requirement Ascending)
        {Name = "1M Need",   Pos = Vector3.new(3.34, 51.12, 31.20),        Req = 1e6},
        {Name = "1Sx Need",  Pos = Vector3.new(2043.22, 1391.01, -2877.51), Req = 1e21},
        {Name = "1Td Need",  Pos = Vector3.new(1491.23, 1348.27, -2120.77), Req = 1e42},
        {Name = "1Tvg Need", Pos = Vector3.new(1676.76, 381.59, -2850.33),  Req = 1e72},
    }
}

-- ============================================================================
-- STATE
-- ============================================================================
_G.AutoClickRed = false
_G.AutoClickGreen = false
_G.ExperimentalClick = false
_G.AutoFarm = false
_G.AutoUniverse = false
_G.ClickSpeed = 0 -- 0 = max speed
_G.Fly = false
_G.NoClip = false
_G.Speed = 16
_G.ConvertInterval = 5

-- ============================================================================
-- HELPER FUNCTIONS
-- ============================================================================
local function ParseValue(val)
    if type(val) == "number" then return val end
    if type(val) == "string" then
        local clean = val:gsub(",", "")
        
        -- Remove trailing 'B' if present (bug fix/compatibility)
        if clean:sub(-1) == "B" then
            clean = clean:sub(1, -2)
        end
        
        -- Check for standard scientific notation first (e.g. 2.01e+28)
        if clean:find("e%+") or clean:find("e%-") then
            return tonumber(clean) or 0
        end

        -- Check for game suffixes
        local suffixes = {
            k = 1e3, m = 1e6, b = 1e9, t = 1e12, qa = 1e15, qi = 1e18, sx = 1e21, sp = 1e24, oc = 1e27, no = 1e30, dc = 1e33,
            ud = 1e36, dd = 1e39, td = 1e42, qatu = 1e45, qitu = 1e48, sxtu = 1e51, sptu = 1e54, octu = 1e57, notu = 1e60,
            vg = 1e63, uvg = 1e66, dvg = 1e69, tvg = 1e72, qavg = 1e75, qivg = 1e78, sxvg = 1e81, spvg = 1e84, ocvg = 1e87, novg = 1e90,
            tg = 1e93, utg = 1e96, dtg = 1e99, ttg = 1e102, qatg = 1e105, qitg = 1e108,
            -- Add more from screenshot if needed
            octg = 1e243, -- Estimation based on standard suffix logic
            uqag = 1e246,
            qiqag = 1e258,
            ocqag = 1e267,
            dqig = 1e279, -- ??
            sxqig = 1e282, -- ??
            sxg = 1e303, -- ??
            tsxg = 1e306 -- ??
        }
        
        -- Extract numeric part and suffix
        local numStr, suffix = clean:match("([%d%.]+)(%a+)")
        if not numStr then numStr = clean:match("([%d%.]+)") end
        
        local num = tonumber(numStr) or 0
        if suffix then
            local mul = suffixes[suffix:lower()]
            if mul then num = num * mul end
        end
        return num
    end
    return 0
end

local function GetPlayerStat(statName)
    if LocalPlayer.leaderstats and LocalPlayer.leaderstats:FindFirstChild(statName) then
        return ParseValue(LocalPlayer.leaderstats[statName].Value)
    end
    return 0
end

local function GetBestArea()
    local myTime = GetPlayerStat("Time")
    local best = LOCATIONS.Areas[1]
    
    for _, area in ipairs(LOCATIONS.Areas) do
        if myTime >= area.Req then
            best = area
        end
    end
    return best
end

-- ============================================================================
-- FIND BUTTONS
-- ============================================================================
local RedButtonObj = nil
local GreenButtonObj = nil

local function GetButtonAt(location)
    -- Efficiently find button at location using spatial query
    local parts = Workspace:GetPartBoundsInRadius(location, 5)
    for _, part in ipairs(parts) do
        if part:IsA("BasePart") then
            -- Verify it has a ClickDetector or is named appropriately if needed
            -- For now, consistent with original logic: just proximity
            return part
        end
    end
    return nil
end

local function FindButtons()
    RedButtonObj = GetButtonAt(LOCATIONS.ButtonRed)
    GreenButtonObj = GetButtonAt(LOCATIONS.ButtonGreen)
    
    if RedButtonObj then print("[FAMYY] Found Red Button") end
    if GreenButtonObj then print("[FAMYY] Found Green Button") end
end

-- ============================================================================
-- CLICK FUNCTIONS
-- ============================================================================
local function ClickButton(button)
    if not button or not button.Parent then return end
    
    local clickDetector = button:FindFirstChildOfClass("ClickDetector") or 
                          (button:IsA("Model") and button:FindFirstChildOfClass("ClickDetector", true)) or
                          (button.Parent and button.Parent:FindFirstChildOfClass("ClickDetector"))
    
    if clickDetector then
        pcall(function() fireclickdetector(clickDetector) end)
    end
    
    if button:IsA("BasePart") and firetouchinterest then
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            pcall(function()
                firetouchinterest(hrp, button, 0)
                firetouchinterest(hrp, button, 1)
            end)
        end
    end
end

local function ClickRed()
    -- Re-validate button if missing (e.g. streamed out and back in)
    if not RedButtonObj or not RedButtonObj.Parent then
        RedButtonObj = GetButtonAt(LOCATIONS.ButtonRed)
    end
    if RedButtonObj then ClickButton(RedButtonObj) end
end

local function ClickGreen()
    if not GreenButtonObj or not GreenButtonObj.Parent then
        GreenButtonObj = GetButtonAt(LOCATIONS.ButtonGreen)
    end
    if GreenButtonObj then ClickButton(GreenButtonObj) end
end

-- ============================================================================
-- AUTO CLICK LOOPS (ULTRA FAST)
-- ============================================================================
local Connections = {}

local function StartAutoClickRed()
    if Connections.Red then return end
    Connections.Red = RunService.RenderStepped:Connect(function()
        if _G.AutoClickRed then ClickRed() end
    end)
    Connections.RedLoop = task.spawn(function()
        while _G.AutoClickRed do
            ClickRed()
            if _G.ClickSpeed > 0 then task.wait(_G.ClickSpeed / 1000) else RunService.Heartbeat:Wait() end
        end
    end)
end

local function StopAutoClickRed()
    if Connections.Red then Connections.Red:Disconnect() Connections.Red = nil end
    if Connections.RedLoop then task.cancel(Connections.RedLoop) Connections.RedLoop = nil end
end

local function StartAutoClickGreen()
    if Connections.Green then return end
    Connections.Green = RunService.RenderStepped:Connect(function()
        if _G.AutoClickGreen then ClickGreen() end
    end)
    Connections.GreenLoop = task.spawn(function()
        while _G.AutoClickGreen do
            ClickGreen()
            if _G.ClickSpeed > 0 then task.wait(_G.ClickSpeed / 1000) else RunService.Heartbeat:Wait() end
        end
    end)
end

local function StopAutoClickGreen()
    if Connections.Green then Connections.Green:Disconnect() Connections.Green = nil end
    if Connections.GreenLoop then task.cancel(Connections.GreenLoop) Connections.GreenLoop = nil end
end

-- ============================================================================
-- EXPERIMENTAL CLICKER (BYPASS & MULTI-THREAD)
-- ============================================================================
local function StartExperimentalClick()
    if Connections.Experimental then return end
    
    -- Attempt to disable client-side cooldown scripts in buttons
    local function DisableCooldowns(btn)
        if not btn then return end
        for _, child in pairs(btn:GetChildren()) do
            if child:IsA("LocalScript") or child:IsA("Script") then
                child.Disabled = true
                -- child:Destroy() -- risky, disabling is safer
            end
        end
    end
    
    if RedButtonObj then DisableCooldowns(RedButtonObj) end
    if GreenButtonObj then DisableCooldowns(GreenButtonObj) end
    
    -- Launch multiple threads to overwhelm any debounces
    local threads = 5
    Connections.Experimental = {}
    
    for i = 1, threads do
        Connections.Experimental[i] = task.spawn(function()
            while _G.ExperimentalClick do
                -- Click both if found (re-validating inside loop)
                ClickRed()
                ClickGreen()
                
                if _G.ClickSpeed > 0 then
                    task.wait(_G.ClickSpeed / 1000)
                else
                    RunService.Heartbeat:Wait()
                end
            end
        end)
    end
end

local function StopExperimentalClick()
    if Connections.Experimental then
        for _, thread in pairs(Connections.Experimental) do
            task.cancel(thread)
        end
        Connections.Experimental = nil
    end
end

-- ============================================================================
-- AUTO FARM (CONVERT -> BEST AREA -> WAIT)
-- ============================================================================
local function StartAutoFarm()
    if Connections.AutoFarm then return end
    
    Connections.AutoFarm = task.spawn(function()
        while _G.AutoFarm do
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                -- 1. Teleport to Convert
                hrp.CFrame = CFrame.new(LOCATIONS.Convert)
                
                -- Wait briefly for convert to register (1 second fixed)
                for i = 1, 10 do 
                    if not _G.AutoFarm then break end
                    task.wait(0.1)
                end
                
                if not _G.AutoFarm then break end
                
                -- 2. Teleport to Highest Area
                local bestArea = GetBestArea()
                if bestArea and bestArea.Pos then
                    hrp.CFrame = CFrame.new(bestArea.Pos)
                    
                    -- 3. Farm for the Configured Interval
                    -- This ensures we stay at the farming area for the set time
                    local endTime = tick() + _G.ConvertInterval
                    
                    while tick() < endTime and _G.AutoFarm do
                        -- Dynamic Update: Check if we unlocked a better area while farming
                        local currentBest = GetBestArea()
                        if currentBest and currentBest.Req > bestArea.Req then
                            bestArea = currentBest -- Update target
                            hrp.CFrame = CFrame.new(bestArea.Pos) -- Teleport immediately
                        end

                        -- Position Check: Enforce position if pushed/drifted
                        if (hrp.Position - bestArea.Pos).Magnitude > 10 then
                            hrp.CFrame = CFrame.new(bestArea.Pos)
                        end
                        task.wait(0.5)
                    end
                else
                    -- If no area found, wait a bit to prevent crashing/spamming
                    task.wait(1)
                end
            else
                task.wait(1)
            end
        end
    end)
end

local function StopAutoFarm()
    if Connections.AutoFarm then task.cancel(Connections.AutoFarm) Connections.AutoFarm = nil end
end

-- ============================================================================
-- AUTO UNIVERSE
-- ============================================================================
local function StartAutoUniverse()
    if Connections.AutoUniverse then return end
    
    Connections.AutoUniverse = task.spawn(function()
        while _G.AutoUniverse do
            local universes = GetPlayerStat("Universes")
            local time = GetPlayerStat("Time")
            
            -- Formula: Target = 100 Qitg * (1 + (Universes * 0.0005))
            -- 100 Qitg = 100 * 1e108 = 1e110
            local baseReq = 1e110 
            local multiplier = 1 + (universes * 0.0005)
            local target = baseReq * multiplier
            
            if time >= target then
                local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = CFrame.new(LOCATIONS.Universe)
                    task.wait(0.5)
                    -- Interact with ProximityPrompt
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj:IsA("ProximityPrompt") then
                            if obj.Parent and obj.Parent:IsA("BasePart") then
                                if (obj.Parent.Position - LOCATIONS.Universe).Magnitude < 15 then
                                    fireproximityprompt(obj)
                                end
                            end
                        end
                    end
                end
            end
            
            task.wait(1) -- Check every second
        end
    end)
end

local function StopAutoUniverse()
    if Connections.AutoUniverse then task.cancel(Connections.AutoUniverse) Connections.AutoUniverse = nil end
end

-- ============================================================================
-- PLAYER MODS
-- ============================================================================
local function StartFly()
    if Connections.Fly then return end
    
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local bv = Instance.new("BodyVelocity")
    bv.Name = "FamyyFly"
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.Parent = hrp
    
    local bg = Instance.new("BodyGyro")
    bg.Name = "FamyyGyro"
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.P = 1000000
    bg.Parent = hrp
    
    Connections.Fly = RunService.RenderStepped:Connect(function()
        if not _G.Fly then return end
        local camera = Workspace.CurrentCamera
        local moveDir = Vector3.new(0, 0, 0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end
        bv.Velocity = moveDir.Magnitude > 0 and moveDir.Unit * 100 or Vector3.new(0, 0, 0)
        bg.CFrame = camera.CFrame
    end)
end

local function StopFly()
    if Connections.Fly then Connections.Fly:Disconnect() Connections.Fly = nil end
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local bv = hrp:FindFirstChild("FamyyFly")
        local bg = hrp:FindFirstChild("FamyyGyro")
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end
end

local function StartNoClip()
    if Connections.NoClip then return end
    Connections.NoClip = RunService.Stepped:Connect(function()
        if _G.NoClip then
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end
    end)
end

local function StopNoClip()
    if Connections.NoClip then Connections.NoClip:Disconnect() Connections.NoClip = nil end
end

-- ============================================================================
-- ANTI AFK
-- ============================================================================
local VirtualUser = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    print("[FAMYY] Anti-AFK triggered")
end)

-- ============================================================================
-- LOAD UI LIBRARY
-- ============================================================================
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/FamyyLib.lua"))()
local Window = Library.Window

-- ============================================================================
-- UI SETUP
-- ============================================================================

-- Auto Farm Tab (Renamed from Auto Click)
local FarmTab = Window:CreateTab("Auto Farm")

-- Auto Farm Section (Moved to top)
local FarmSection = FarmTab:CreateSection("Auto Farm", true)

FarmSection:AddSlider({
    Label = "Convert Interval (s)",
    Min = 1,
    Max = 120,
    Default = 5,
    Callback = function(v)
        _G.ConvertInterval = v
    end
})

FarmSection:AddToggle({
    Label = "Enable Auto Farm",
    Default = false,
    Callback = function(v)
        _G.AutoFarm = v
        if v then StartAutoFarm() else StopAutoFarm() end
    end
})

-- Universe Section (Moved to Farm Tab)
local UniverseSection = FarmTab:CreateSection("Auto Universe", true)

-- Disabled Overlay (Gray layout with lock)
local function CreateDisabledOverlay(parent)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 100)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    frame.BackgroundTransparency = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(60, 60, 65)
    stroke.Thickness = 1
    
    local lock = Instance.new("ImageLabel")
    lock.Size = UDim2.new(0, 32, 0, 32)
    lock.Position = UDim2.new(0.5, -16, 0.5, -20)
    lock.BackgroundTransparency = 1
    lock.Image = "rbxassetid://3926305904" -- Lock icon
    lock.ImageColor3 = Color3.fromRGB(150, 150, 160)
    lock.Parent = frame
    
    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.new(1, 0, 0, 20)
    txt.Position = UDim2.new(0, 0, 0.5, 15)
    txt.BackgroundTransparency = 1
    txt.Text = "FEATURE DISABLED"
    txt.TextColor3 = Color3.fromRGB(150, 150, 160)
    txt.Font = Enum.Font.GothamBold
    txt.TextSize = 12
    txt.Parent = frame
end

CreateDisabledOverlay(UniverseSection.Container)

--[[ Temporarily Disabled
UniverseSection:AddLabel({Text = "Rebirths when requirements met", Bold = false})

UniverseSection:AddToggle({
    Label = "Auto Universe Loop",
    Default = false,
    Callback = function(v)
        _G.AutoUniverse = v
        if v then StartAutoUniverse() else StopAutoUniverse() end
    end
})

UniverseSection:AddButton({
    Label = "Teleport to Universe Once",
    Style = "primary",
    Callback = function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(LOCATIONS.Universe)
        end
    end
})
]]

-- Clicker Section
local ClickSection = FarmTab:CreateSection("Auto Clicker", true)

ClickSection:AddLabel({Text = "Targets Red/Green buttons at specific coords", Bold = false})

ClickSection:AddToggle({
    Label = "Auto Click RED Button (Ultra Fast)",
    Default = false,
    Callback = function(v)
        _G.AutoClickRed = v
        if v then StartAutoClickRed() else StopAutoClickRed() end
    end
})

ClickSection:AddToggle({
    Label = "Auto Click GREEN Button (Ultra Fast)",
    Default = false,
    Callback = function(v)
        _G.AutoClickGreen = v
        if v then StartAutoClickGreen() else StopAutoClickGreen() end
    end
})

ClickSection:AddSlider({
    Label = "Click Delay (ms) - 0 = MAX",
    Min = 0,
    Max = 100,
    Default = 0,
    Callback = function(v)
        _G.ClickSpeed = v
    end
})

-- Experimental Tab
local ExpTab = Window:CreateTab("Experimental")
local ExpSection = ExpTab:CreateSection("Bypass Clicker", true)

ExpSection:AddLabel({Text = "Bypasses 1s cooldown limit using multi-threading", Bold = false})
ExpSection:AddLabel({Text = "WARNING: Disables standard Auto Clickers", Bold = true, Color = Color3.fromRGB(255, 100, 100)})

ExpSection:AddToggle({
    Label = "Experimental Auto Click (Red & Green)",
    Default = false,
    Callback = function(v)
        if v then
            -- Disable standard clickers to prevent conflicts
            if _G.AutoClickRed then
                _G.AutoClickRed = false
                -- Note: Library might not update visual state if not triggered by UI, 
                -- so we rely on the loop checking the global
                StopAutoClickRed()
            end
            if _G.AutoClickGreen then
                _G.AutoClickGreen = false
                StopAutoClickGreen()
            end
            
            _G.ExperimentalClick = true
            StartExperimentalClick()
        else
            _G.ExperimentalClick = false
            StopExperimentalClick()
        end
    end
})

-- Player Tab
local PlayerTab = Window:CreateTab("Player")
local SpeedSection = PlayerTab:CreateSection("Movement", true)

SpeedSection:AddSlider({
    Label = "Walk Speed",
    Min = 16,
    Max = 500,
    Default = 16,
    Callback = function(v)
        _G.Speed = v
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
})

SpeedSection:AddSlider({
    Label = "Jump Power",
    Min = 50,
    Max = 500,
    Default = 50,
    Callback = function(v)
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.JumpPower = v
            hum.UseJumpPower = true
        end
    end
})

local FlySection = PlayerTab:CreateSection("Fly & NoClip", true)

FlySection:AddToggle({
    Label = "Fly",
    Default = false,
    Callback = function(v)
        _G.Fly = v
        if v then StartFly() else StopFly() end
    end
})

FlySection:AddToggle({
    Label = "NoClip",
    Default = false,
    Callback = function(v)
        _G.NoClip = v
        if v then StartNoClip() else StopNoClip() end
    end
})

-- Misc Tab
local MiscTab = Window:CreateTab("Misc")
local ServerSection = MiscTab:CreateSection("Server", true)

ServerSection:AddButton({
    Label = "Rejoin",
    Style = "secondary",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
})

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

FindButtons()

RunService.Heartbeat:Connect(function()
    if _G.Speed > 16 then
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = _G.Speed end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    task.wait(1)
    FindButtons()
    if _G.Fly then StartFly() end
    if _G.NoClip then StartNoClip() end
end)

Window.Notify("FAMYY PRIVATE", "Waste Time Script Updated!", 3, "success")

return Library
