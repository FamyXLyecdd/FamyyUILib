--[[
    ██╗    ██╗ █████╗ ███████╗████████╗███████╗    ████████╗██╗███╗   ███╗███████╗
    ██║    ██║██╔══██╗██╔════╝╚══██╔══╝██╔════╝    ╚══██╔══╝██║████╗ ████║██╔════╝
    ██║ █╗ ██║███████║███████╗   ██║   █████╗         ██║   ██║██╔████╔██║█████╗  
    ██║███╗██║██╔══██║╚════██║   ██║   ██╔══╝         ██║   ██║██║╚██╔╝██║██╔══╝  
    ╚███╔███╔╝██║  ██║███████║   ██║   ███████╗       ██║   ██║██║ ╚═╝ ██║███████╗
     ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝       ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝
    
    FAMYY PRIVATE - Waste Time Script v1.0
    
    FEATURES:
    - Ultra Fast Auto Click (0ms - Remote based, no mouse needed)
    - Auto Click Red Button
    - Auto Click Green Button (Global)
    - Auto Convert Time to Eons
    - Zone Teleporter
    - Auto Upgrade
    - Speed/Fly/NoClip
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
_G.AutoUpgrade = false
_G.ClickSpeed = 0 -- 0 = max speed
_G.Fly = false
_G.NoClip = false
_G.Speed = 16

-- ============================================================================
-- FIND BUTTONS
-- ============================================================================
local RedButton = nil
local GreenButton = nil
local ConvertButton = nil

local function FindButtons()
    -- Find red button (THE BUTTON)
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            if obj.BrickColor == BrickColor.new("Bright red") or obj.Color == Color3.fromRGB(255, 0, 0) then
                if obj.Size.X > 10 then -- Big button
                    RedButton = obj
                    print("[FAMYY] Found Red Button: " .. obj:GetFullName())
                end
            end
            if obj.BrickColor == BrickColor.new("Bright green") or obj.Color == Color3.fromRGB(0, 255, 0) then
                if obj.Size.X > 5 then
                    GreenButton = obj
                    print("[FAMYY] Found Green Button: " .. obj:GetFullName())
                end
            end
        end
    end
    
    -- Find by name patterns
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name:lower():find("button") or obj.Name:lower():find("click") then
            if obj:IsA("BasePart") or obj:IsA("Model") then
                print("[FAMYY] Found button-like object: " .. obj.Name .. " at " .. obj:GetFullName())
            end
        end
        if obj.Name:lower():find("convert") then
            ConvertButton = obj
            print("[FAMYY] Found Convert: " .. obj:GetFullName())
        end
    end
end

-- ============================================================================
-- CLICK FUNCTIONS (Remote-based, no mouse)
-- ============================================================================
local function ClickButton(button)
    if not button then return end
    
    -- Method 1: Fire PlayerEvent remote
    if Remotes.PlayerEvent then
        pcall(function()
            Remotes.PlayerEvent:FireServer("Click")
            Remotes.PlayerEvent:FireServer("ButtonClick")
            Remotes.PlayerEvent:FireServer()
        end)
    end
    
    -- Method 2: Fire touch interest
    if button:IsA("BasePart") then
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp and firetouchinterest then
            pcall(function()
                firetouchinterest(hrp, button, 0)
                firetouchinterest(hrp, button, 1)
            end)
        end
    end
    
    -- Method 3: Fire ClickDetector
    local clickDetector = button:FindFirstChildOfClass("ClickDetector") or 
                          (button:IsA("Model") and button:FindFirstChildOfClass("ClickDetector", true))
    if clickDetector then
        pcall(function()
            fireclickdetector(clickDetector)
        end)
    end
    
    -- Method 4: Fire ProximityPrompt
    local prompt = button:FindFirstChildOfClass("ProximityPrompt") or
                   (button:IsA("Model") and button:FindFirstChildOfClass("ProximityPrompt", true))
    if prompt then
        pcall(function()
            fireproximityprompt(prompt)
        end)
    end
end

local function ClickRed()
    ClickButton(RedButton)
    
    -- Also try specific remotes for clicking
    pcall(function()
        Remotes.PlayerEvent:FireServer("ClickRed")
        Remotes.PlayerEvent:FireServer("RedButton")
        Remotes.PlayerEvent:FireServer("Click", "Red")
    end)
    
    -- Try button particles (might register as click)
    if Remotes.ButtonParticles then
        pcall(function()
            Remotes.ButtonParticles:FireServer()
        end)
    end
end

local function ClickGreen()
    ClickButton(GreenButton)
    
    pcall(function()
        Remotes.PlayerEvent:FireServer("ClickGreen")
        Remotes.PlayerEvent:FireServer("GreenButton")
        Remotes.PlayerEvent:FireServer("Click", "Green")
        Remotes.PlayerEvent:FireServer("GlobalClick")
    end)
end

local function ConvertTime()
    -- Try various convert methods
    pcall(function()
        Remotes.PlayerEvent:FireServer("Convert")
        Remotes.PlayerEvent:FireServer("ConvertTime")
        Remotes.PlayerEvent:FireServer("ConvertToEons")
    end)
    
    -- Click convert button if found
    if ConvertButton then
        ClickButton(ConvertButton)
    end
    
    -- Try upgrade event for convert
    if Remotes.UpgradeEvent then
        pcall(function()
            Remotes.UpgradeEvent:FireServer("Convert")
        end)
    end
end

-- ============================================================================
-- AUTO CLICK LOOPS (ULTRA FAST - 0ms)
-- ============================================================================
local ClickConnections = {}

local function StartAutoClickRed()
    if ClickConnections.Red then return end
    
    -- Use RenderStepped for maximum speed (every frame)
    ClickConnections.Red = RunService.RenderStepped:Connect(function()
        if _G.AutoClickRed then
            ClickRed()
        end
    end)
    
    -- Also spawn a separate loop for even more clicks
    ClickConnections.RedLoop = task.spawn(function()
        while _G.AutoClickRed do
            ClickRed()
            if _G.ClickSpeed > 0 then
                task.wait(_G.ClickSpeed / 1000) -- Convert ms to seconds
            end
            -- No wait = max speed
        end
    end)
end

local function StopAutoClickRed()
    if ClickConnections.Red then
        ClickConnections.Red:Disconnect()
        ClickConnections.Red = nil
    end
    if ClickConnections.RedLoop then
        task.cancel(ClickConnections.RedLoop)
        ClickConnections.RedLoop = nil
    end
end

local function StartAutoClickGreen()
    if ClickConnections.Green then return end
    
    ClickConnections.Green = RunService.RenderStepped:Connect(function()
        if _G.AutoClickGreen then
            ClickGreen()
        end
    end)
    
    ClickConnections.GreenLoop = task.spawn(function()
        while _G.AutoClickGreen do
            ClickGreen()
            if _G.ClickSpeed > 0 then
                task.wait(_G.ClickSpeed / 1000)
            end
        end
    end)
end

local function StopAutoClickGreen()
    if ClickConnections.Green then
        ClickConnections.Green:Disconnect()
        ClickConnections.Green = nil
    end
    if ClickConnections.GreenLoop then
        task.cancel(ClickConnections.GreenLoop)
        ClickConnections.GreenLoop = nil
    end
end

-- ============================================================================
-- AUTO CONVERT
-- ============================================================================
local function StartAutoConvert()
    ClickConnections.Convert = task.spawn(function()
        while _G.AutoConvert do
            ConvertTime()
            task.wait(0.5) -- Convert every 0.5 seconds
        end
    end)
end

local function StopAutoConvert()
    if ClickConnections.Convert then
        task.cancel(ClickConnections.Convert)
        ClickConnections.Convert = nil
    end
end

-- ============================================================================
-- ZONE TELEPORTER
-- ============================================================================
local Zones = {}

local function FindZones()
    Zones = {}
    
    -- Look for zone folder
    local zonesFolder = Workspace:FindFirstChild("Zones") or Workspace:FindFirstChild("Areas") or Workspace:FindFirstChild("Maps")
    if zonesFolder then
        for _, zone in pairs(zonesFolder:GetChildren()) do
            if zone:IsA("Model") or zone:IsA("Folder") then
                local pos = nil
                local part = zone:FindFirstChildWhichIsA("BasePart", true)
                if part then
                    pos = part.Position
                end
                table.insert(Zones, {Name = zone.Name, Position = pos, Object = zone})
            end
        end
    end
    
    -- Also look for spawn points or teleport pads
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name:lower():find("zone") or obj.Name:lower():find("area") or obj.Name:lower():find("world") then
            if obj:IsA("Model") or obj:IsA("BasePart") then
                local pos = obj:IsA("BasePart") and obj.Position or (obj:FindFirstChildWhichIsA("BasePart") and obj:FindFirstChildWhichIsA("BasePart").Position)
                if pos then
                    table.insert(Zones, {Name = obj.Name, Position = pos, Object = obj})
                end
            end
        end
    end
    
    print("[FAMYY] Found " .. #Zones .. " zones")
    return Zones
end

local function TeleportToZone(zoneName)
    -- Try remote first
    if Remotes.TeleportToZone then
        pcall(function()
            Remotes.TeleportToZone:FireServer(zoneName)
        end)
    end
    
    -- Find and teleport directly
    for _, zone in pairs(Zones) do
        if zone.Name:lower():find(zoneName:lower()) then
            if zone.Position then
                local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = CFrame.new(zone.Position + Vector3.new(0, 5, 0))
                    print("[FAMYY] Teleported to: " .. zone.Name)
                    return
                end
            end
        end
    end
end

-- ============================================================================
-- PLAYER MODS
-- ============================================================================
local FlyConnection = nil
local NoClipConnection = nil

local function StartFly()
    if FlyConnection then return end
    
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
    
    FlyConnection = RunService.RenderStepped:Connect(function()
        if not _G.Fly then return end
        
        local camera = Workspace.CurrentCamera
        local moveDir = Vector3.new(0, 0, 0)
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDir = moveDir + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDir = moveDir - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDir = moveDir - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDir = moveDir + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDir = moveDir + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end
        
        bv.Velocity = moveDir.Magnitude > 0 and moveDir.Unit * 100 or Vector3.new(0, 0, 0)
        bg.CFrame = camera.CFrame
    end)
end

local function StopFly()
    if FlyConnection then
        FlyConnection:Disconnect()
        FlyConnection = nil
    end
    
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local bv = hrp:FindFirstChild("FamyyFly")
        local bg = hrp:FindFirstChild("FamyyGyro")
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end
end

local function StartNoClip()
    if NoClipConnection then return end
    
    NoClipConnection = RunService.Stepped:Connect(function()
        if _G.NoClip then
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
    end)
end

local function StopNoClip()
    if NoClipConnection then
        NoClipConnection:Disconnect()
        NoClipConnection = nil
    end
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

ClickSection:AddLabel({Text = "Ultra Fast (0ms) - Remote Based", Bold = true})

ClickSection:AddToggle({
    Label = "Auto Click RED Button",
    Default = false,
    Callback = function(v)
        _G.AutoClickRed = v
        if v then
            StartAutoClickRed()
            Window.Notify("Auto Click", "Red Button - ULTRA FAST!", 2, "success")
        else
            StopAutoClickRed()
        end
    end
})

ClickSection:AddToggle({
    Label = "Auto Click GREEN Button",
    Default = false,
    Callback = function(v)
        _G.AutoClickGreen = v
        if v then
            StartAutoClickGreen()
            Window.Notify("Auto Click", "Green Button - ULTRA FAST!", 2, "success")
        else
            StopAutoClickGreen()
        end
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

local ConvertSection = ClickTab:CreateSection("Convert", true)

ConvertSection:AddToggle({
    Label = "Auto Convert Time to Eons",
    Default = false,
    Callback = function(v)
        _G.AutoConvert = v
        if v then
            StartAutoConvert()
            Window.Notify("Auto Convert", "Converting Time to Eons!", 2, "success")
        else
            StopAutoConvert()
        end
    end
})

ConvertSection:AddButton({
    Label = "Convert Now",
    Style = "primary",
    Callback = function()
        ConvertTime()
        Window.Notify("Convert", "Converted!", 1, "success")
    end
})

-- Teleport Tab
local TeleportTab = Window:CreateTab("Teleport")

local ZoneSection = TeleportTab:CreateSection("Zones", true)

ZoneSection:AddButton({
    Label = "Refresh Zones",
    Style = "secondary",
    Callback = function()
        FindZones()
        Window.Notify("Zones", "Found " .. #Zones .. " zones", 2, "info")
    end
})

-- We'll add zone buttons after finding them
local function AddZoneButtons()
    for _, zone in pairs(Zones) do
        ZoneSection:AddButton({
            Label = zone.Name,
            Style = "secondary",
            Callback = function()
                TeleportToZone(zone.Name)
            end
        })
    end
end

local TeleportSection = TeleportTab:CreateSection("Quick Teleport", true)

TeleportSection:AddButton({
    Label = "Teleport to Red Button",
    Style = "primary",
    Callback = function()
        if RedButton then
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = RedButton.CFrame * CFrame.new(0, 5, 0)
            end
        end
    end
})

TeleportSection:AddButton({
    Label = "Teleport to Green Button",
    Style = "primary",
    Callback = function()
        if GreenButton then
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = GreenButton.CFrame * CFrame.new(0, 5, 0)
            end
        end
    end
})

TeleportSection:AddButton({
    Label = "Teleport to Convert",
    Style = "primary",
    Callback = function()
        if ConvertButton then
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local pos = ConvertButton:IsA("BasePart") and ConvertButton.Position or ConvertButton:FindFirstChildWhichIsA("BasePart").Position
            if hrp and pos then
                hrp.CFrame = CFrame.new(pos + Vector3.new(0, 5, 0))
            end
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
        if hum then
            hum.WalkSpeed = v
        end
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
        if v then
            StartFly()
            Window.Notify("Fly", "Enabled! WASD + Space/Ctrl", 2, "success")
        else
            StopFly()
        end
    end
})

FlySection:AddToggle({
    Label = "NoClip",
    Default = false,
    Callback = function(v)
        _G.NoClip = v
        if v then
            StartNoClip()
        else
            StopNoClip()
        end
    end
})

-- Misc Tab
local MiscTab = Window:CreateTab("Misc")

local UpgradeSection = MiscTab:CreateSection("Upgrades", true)

UpgradeSection:AddToggle({
    Label = "Auto Upgrade",
    Default = false,
    Callback = function(v)
        _G.AutoUpgrade = v
        if v then
            task.spawn(function()
                while _G.AutoUpgrade do
                    pcall(function()
                        Remotes.UpgradeEvent:FireServer()
                        Remotes.UpgradeEvent:FireServer("Upgrade")
                        Remotes.UpgradeEvent:FireServer("Buy")
                    end)
                    task.wait(0.1)
                end
            end)
        end
    end
})

UpgradeSection:AddButton({
    Label = "Upgrade Once",
    Style = "secondary",
    Callback = function()
        pcall(function()
            Remotes.UpgradeEvent:FireServer()
        end)
    end
})

local AuraSection = MiscTab:CreateSection("Auras", true)

AuraSection:AddButton({
    Label = "Request Aura",
    Style = "secondary",
    Callback = function()
        if Remotes.AuraRequest then
            pcall(function()
                Remotes.AuraRequest:FireServer()
            end)
        end
    end
})

local ServerSection = MiscTab:CreateSection("Server", true)

ServerSection:AddButton({
    Label = "Rejoin",
    Style = "secondary",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
})

ServerSection:AddButton({
    Label = "Server Hop",
    Style = "secondary",
    Callback = function()
        local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        for _, server in pairs(servers.data) do
            if server.id ~= game.JobId then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                break
            end
        end
    end
})

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

-- Find game objects
FindButtons()
FindZones()

-- Keep speed updated
RunService.Heartbeat:Connect(function()
    if _G.Speed > 16 then
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = _G.Speed
        end
    end
end)

-- Character respawn handler
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    task.wait(1)
    FindButtons()
    
    if _G.Fly then
        StartFly()
    end
    if _G.NoClip then
        StartNoClip()
    end
end)

-- Notify
Window.Notify("FAMYY PRIVATE", "Waste Time Script Loaded!", 3, "success")
Window.Notify("Auto Click", "0ms = Maximum Speed (per frame)", 4, "info")

print("================================================================================")
print("[FAMYY PRIVATE] Waste Time Script v1.0")
print("================================================================================")
print("Features:")
print("  - Ultra Fast Auto Click (0ms, remote-based)")
print("  - Auto Click Red/Green Button")
print("  - Auto Convert Time to Eons")
print("  - Zone Teleporter")
print("  - Fly, NoClip, Speed")
print("================================================================================")

return Library
