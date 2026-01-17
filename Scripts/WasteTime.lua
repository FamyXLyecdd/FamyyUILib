--[[
    ██╗    ██╗ █████╗ ███████╗████████╗███████╗    ████████╗██╗███╗   ███╗███████╗
    ██║    ██║██╔══██╗██╔════╝╚══██╔══╝██╔════╝    ╚══██╔══╝██║████╗ ████║██╔════╝
    ██║ █╗ ██║███████║███████╗   ██║   █████╗         ██║   ██║██╔████╔██║█████╗  
    ██║███╗██║██╔══██║╚════██║   ██║   ██╔══╝         ██║   ██║██║╚██╔╝██║██╔══╝  
    ╚███╔███╔╝██║  ██║███████║   ██║   ███████╗       ██║   ██║██║ ╚═╝ ██║███████╗
     ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝       ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝
    
    FAMYY PRIVATE - Waste Time Script v2.0
    
    UPDATED FEATURES:
    - Auto Convert (Teleport & Return)
    - Targeted Auto Click (Red/Green at coords)
    - Auto Farm (Convert -> Highest Area)
    - Auto Universe
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
        {Name = "10M Need", Pos = Vector3.new(3.34, 51.12, 31.20), Req = 1e7},
        {Name = "1Sx Need", Pos = Vector3.new(2043.22, 1391.01, -2877.51), Req = 1e21},
        {Name = "1Td Need", Pos = Vector3.new(1491.23, 1348.27, -2120.77), Req = 1e42},
        {Name = "1Tvg Need", Pos = Vector3.new(1676.76, 381.59, -2850.33), Req = 1e72}
    }
}

-- ============================================================================
-- REMOTES
-- ============================================================================
local Remotes = {
    PlayerEvent = ReplicatedStorage:FindFirstChild("PlayerEvent"),
    ClientHeartbeat = ReplicatedStorage:FindFirstChild("ClientHeartbeat"),
    UpgradeEvent = ReplicatedStorage:FindFirstChild("UpgradeEvent"),
    TeleportToZone = ReplicatedStorage:FindFirstChild("TeleportToZone"),
    RankUpEvent = ReplicatedStorage:FindFirstChild("RankUpEvent"),
    GlobalEonsFX = ReplicatedStorage:FindFirstChild("GlobalEonsFX"),
    ButtonParticles = ReplicatedStorage:FindFirstChild("ButtonParticles"),
    AuraRequest = ReplicatedStorage:FindFirstChild("AuraRequest"),
}

-- ============================================================================
-- STATE
-- ============================================================================
_G.AutoClickRed = false
_G.AutoClickGreen = false
_G.AutoConvert = false
_G.AutoFarm = false
_G.AutoUniverse = false
_G.AutoUpgrade = false
_G.ClickSpeed = 0 -- 0 = max speed
_G.Fly = false
_G.NoClip = false
_G.Speed = 16
_G.SelectedArea = LOCATIONS.Areas[1]
_G.ConvertInterval = 1

-- ============================================================================
-- HELPER FUNCTIONS
-- ============================================================================
local function ParseValue(val)
    if type(val) == "number" then return val end
    if type(val) == "string" then
        local clean = val:gsub(",", "")
        -- Check for suffixes
        local suffixes = {
            k = 1e3, m = 1e6, b = 1e9, t = 1e12, qa = 1e15, qi = 1e18, sx = 1e21, sp = 1e24, oc = 1e27, no = 1e30, dc = 1e33,
            ud = 1e36, dd = 1e39, td = 1e42, qatu = 1e45, qitu = 1e48, sxtu = 1e51, sptu = 1e54, octu = 1e57, notu = 1e60,
            vg = 1e63, uvg = 1e66, dvg = 1e69, tvg = 1e72, qavg = 1e75, qivg = 1e78, sxvg = 1e81, spvg = 1e84, ocvg = 1e87, novg = 1e90,
            tg = 1e93, utg = 1e96, dtg = 1e99, ttg = 1e102, qatg = 1e105, qitg = 1e108 -- Quinquatrigintillion?
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

-- ============================================================================
-- FIND BUTTONS
-- ============================================================================
local RedButtonObj = nil
local GreenButtonObj = nil

local function FindButtons()
    -- Search by coordinates
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            if (obj.Position - LOCATIONS.ButtonRed).Magnitude < 5 then
                RedButtonObj = obj
                print("[FAMYY] Found Red Button at coords: " .. obj:GetFullName())
            elseif (obj.Position - LOCATIONS.ButtonGreen).Magnitude < 5 then
                GreenButtonObj = obj
                print("[FAMYY] Found Green Button at coords: " .. obj:GetFullName())
            end
        end
    end
end

-- ============================================================================
-- CLICK FUNCTIONS
-- ============================================================================
local function ClickButton(button)
    if not button then return end
    
    -- Method 1: ClickDetector
    local clickDetector = button:FindFirstChildOfClass("ClickDetector") or 
                          (button:IsA("Model") and button:FindFirstChildOfClass("ClickDetector", true)) or
                          (button.Parent and button.Parent:FindFirstChildOfClass("ClickDetector"))
    if clickDetector then
        pcall(function()
            fireclickdetector(clickDetector)
        end)
    end
    
    -- Method 2: TouchInterest
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
    if RedButtonObj then
        ClickButton(RedButtonObj)
    else
        -- Fallback if object not found (try blindly firing nearby)
        -- Can't really do much without the object instance for ClickDetector
    end
end

local function ClickGreen()
    if GreenButtonObj then
        ClickButton(GreenButtonObj)
    end
end

-- ============================================================================
-- AUTO CLICK LOOPS (ULTRA FAST)
-- ============================================================================
local Connections = {}

local function StartAutoClickRed()
    if Connections.Red then return end
    
    -- RenderStepped for frame-perfect clicks
    Connections.Red = RunService.RenderStepped:Connect(function()
        if _G.AutoClickRed then
            ClickRed()
        end
    end)
    
    -- Parallel Loop for speed
    Connections.RedLoop = task.spawn(function()
        while _G.AutoClickRed do
            ClickRed()
            if _G.ClickSpeed > 0 then
                task.wait(_G.ClickSpeed / 1000)
            else
                RunService.Heartbeat:Wait() -- Minimum wait if 0 to prevent crash, or just execute
            end
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
        if _G.AutoClickGreen then
            ClickGreen()
        end
    end)
    
    Connections.GreenLoop = task.spawn(function()
        while _G.AutoClickGreen do
            ClickGreen()
            if _G.ClickSpeed > 0 then
                task.wait(_G.ClickSpeed / 1000)
            else
                RunService.Heartbeat:Wait()
            end
        end
    end)
end

local function StopAutoClickGreen()
    if Connections.Green then Connections.Green:Disconnect() Connections.Green = nil end
    if Connections.GreenLoop then task.cancel(Connections.GreenLoop) Connections.GreenLoop = nil end
end

-- ============================================================================
-- AUTO FARM (CONVERT -> SELECTED AREA)
-- ============================================================================
local function StartAutoFarm()
    if Connections.AutoFarm then return end
    
    Connections.AutoFarm = task.spawn(function()
        while _G.AutoFarm do
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                -- 1. Teleport to Convert
                hrp.CFrame = CFrame.new(LOCATIONS.Convert)
                
                -- Wait for configured interval (for conversion to happen/accumulate)
                local steps = math.floor(_G.ConvertInterval * 10)
                for i = 1, steps do
                    if not _G.AutoFarm then break end
                    task.wait(0.1)
                end
                
                if not _G.AutoFarm then break end
                
                -- 2. Teleport to Selected Area
                if _G.SelectedArea and _G.SelectedArea.Pos then
                    hrp.CFrame = CFrame.new(_G.SelectedArea.Pos)
                end
                
                -- Wait 1 second at the area before loop restarts (teleporting back to convert)
                task.wait(1)
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
-- LOAD UI LIBRARY
-- ============================================================================
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/FamyyLib.lua"))()
local Window = Library.Window

-- ============================================================================
-- UI SETUP
-- ============================================================================

-- Auto Click Tab
local ClickTab = Window:CreateTab("Auto Click")

local ClickSection = ClickTab:CreateSection("Button Clicker", true)

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

local ConvertSection = ClickTab:CreateSection("Convert & Farm", true)

-- Removed Auto Convert (Teleport & Return) as requested

-- Area Dropdown for Auto Farm
local areaNames = {}
for _, area in ipairs(LOCATIONS.Areas) do
    table.insert(areaNames, area.Name)
end

ConvertSection:AddDropdown({
    Label = "Select Highest Area",
    Options = areaNames,
    Default = areaNames[1],
    Callback = function(v)
        for _, area in ipairs(LOCATIONS.Areas) do
            if area.Name == v then
                _G.SelectedArea = area
                break
            end
        end
    end
})

ConvertSection:AddSlider({
    Label = "Convert Interval (s)",
    Min = 1,
    Max = 120,
    Default = 1,
    Callback = function(v)
        _G.ConvertInterval = v
    end
})

ConvertSection:AddToggle({
    Label = "Auto Farm (Convert -> Area)",
    Default = false,
    Callback = function(v)
        _G.AutoFarm = v
        if v then StartAutoFarm() else StopAutoFarm() end
    end
})

-- Removed Stats Monitor as requested

-- Universe Tab
local UniverseTab = Window:CreateTab("Universe")
local UniverseSection = UniverseTab:CreateSection("Universe / Godliness", true)

UniverseSection:AddLabel({Text = "Teleports when > 100 Qitg * (1 + Univ*0.0005)", Bold = false})

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

-- Keep speed updated
RunService.Heartbeat:Connect(function()
    if _G.Speed > 16 then
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = _G.Speed end
    end
end)

-- Character respawn handler
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    task.wait(1)
    FindButtons()
    if _G.Fly then StartFly() end
    if _G.NoClip then StartNoClip() end
end)

Window.Notify("FAMYY PRIVATE", "Waste Time Script Updated!", 3, "success")

return Library
