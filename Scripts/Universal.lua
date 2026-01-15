--[[
    FAMYY PRIVATE - Universal Script
    
    Features that work in any Roblox game:
    - Anti-AFK
    - FPS Unlocker (client-side)
    - Walk Speed / Jump Power
    - Noclip
    - Fly
    - Infinite Jump
    - ESP (Players)
    - Fullbright
    
    Usage:
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/Scripts/Universal.lua"))()
]]

-- Load the UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/FamyyLib.lua"))()

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Window = Library.Window

-- ============================================================================
-- STATE VARIABLES
-- ============================================================================

local Toggles = {
    AntiAFK = false,
    Noclip = false,
    Fly = false,
    InfiniteJump = false,
    PlayerESP = false,
    Fullbright = false,
}

local Settings = {
    WalkSpeed = 16,
    JumpPower = 50,
    FlySpeed = 50,
}

-- Store original values
local OriginalLighting = {
    Ambient = Lighting.Ambient,
    Brightness = Lighting.Brightness,
    OutdoorAmbient = Lighting.OutdoorAmbient,
}

local Connections = {}
local ESPObjects = {}

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function getHumanoid()
    local char = getCharacter()
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function getHumanoidRootPart()
    local char = getCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function cleanupConnection(name)
    if Connections[name] then
        Connections[name]:Disconnect()
        Connections[name] = nil
    end
end

local function cleanupAllConnections()
    for name, conn in pairs(Connections) do
        if conn and conn.Connected then
            conn:Disconnect()
        end
    end
    Connections = {}
end

-- ============================================================================
-- ANTI-AFK
-- ============================================================================

local function startAntiAFK()
    cleanupConnection("AntiAFK")
    
    local VirtualUser = game:GetService("VirtualUser")
    
    Connections["AntiAFK"] = LocalPlayer.Idled:Connect(function()
        if Toggles.AntiAFK then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
            print("[Universal] Anti-AFK triggered")
        end
    end)
end

local function stopAntiAFK()
    cleanupConnection("AntiAFK")
end

-- ============================================================================
-- NOCLIP
-- ============================================================================

local function startNoclip()
    cleanupConnection("Noclip")
    
    Connections["Noclip"] = RunService.Stepped:Connect(function()
        if Toggles.Noclip then
            local char = getCharacter()
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

local function stopNoclip()
    cleanupConnection("Noclip")
    
    -- Restore collision
    local char = getCharacter()
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.CanCollide = true
            end
        end
    end
end

-- ============================================================================
-- FLY
-- ============================================================================

local FlyBodyVelocity
local FlyBodyGyro

local function startFly()
    local hrp = getHumanoidRootPart()
    local hum = getHumanoid()
    if not hrp or not hum then return end
    
    -- Create BodyVelocity
    FlyBodyVelocity = Instance.new("BodyVelocity")
    FlyBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    FlyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
    FlyBodyVelocity.Parent = hrp
    
    -- Create BodyGyro
    FlyBodyGyro = Instance.new("BodyGyro")
    FlyBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    FlyBodyGyro.P = 9e4
    FlyBodyGyro.CFrame = hrp.CFrame
    FlyBodyGyro.Parent = hrp
    
    -- Disable humanoid physics
    hum.PlatformStand = true
    
    cleanupConnection("Fly")
    
    Connections["Fly"] = RunService.RenderStepped:Connect(function()
        if not Toggles.Fly then return end
        
        local camera = Workspace.CurrentCamera
        if not camera then return end
        
        local moveDir = Vector3.new()
        
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
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end
        
        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit * Settings.FlySpeed
        end
        
        if FlyBodyVelocity then
            FlyBodyVelocity.Velocity = moveDir
        end
        if FlyBodyGyro then
            FlyBodyGyro.CFrame = camera.CFrame
        end
    end)
end

local function stopFly()
    cleanupConnection("Fly")
    
    if FlyBodyVelocity then
        FlyBodyVelocity:Destroy()
        FlyBodyVelocity = nil
    end
    if FlyBodyGyro then
        FlyBodyGyro:Destroy()
        FlyBodyGyro = nil
    end
    
    local hum = getHumanoid()
    if hum then
        hum.PlatformStand = false
    end
end

-- ============================================================================
-- INFINITE JUMP
-- ============================================================================

local function startInfiniteJump()
    cleanupConnection("InfiniteJump")
    
    Connections["InfiniteJump"] = UserInputService.JumpRequest:Connect(function()
        if Toggles.InfiniteJump then
            local hum = getHumanoid()
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end

local function stopInfiniteJump()
    cleanupConnection("InfiniteJump")
end

-- ============================================================================
-- PLAYER ESP
-- ============================================================================

local function createESPBox(player)
    if player == LocalPlayer then return end
    if ESPObjects[player] then return end
    
    local espData = {}
    
    -- Box highlight
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.7
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.OutlineTransparency = 0
    espData.Highlight = highlight
    
    -- Billboard for name
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    
    local nameLabel = Instance.new("TextLabel", billboard)
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextScaled = true
    
    local distLabel = Instance.new("TextLabel", billboard)
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "0m"
    distLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    distLabel.TextStrokeTransparency = 0
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextScaled = true
    
    espData.Billboard = billboard
    espData.DistLabel = distLabel
    
    ESPObjects[player] = espData
    
    -- Update function
    local function updateESP()
        local char = player.Character
        local myChar = getCharacter()
        
        if char and char:FindFirstChild("HumanoidRootPart") and myChar and myChar:FindFirstChild("HumanoidRootPart") then
            highlight.Parent = char
            billboard.Parent = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
            
            local dist = (char.HumanoidRootPart.Position - myChar.HumanoidRootPart.Position).Magnitude
            distLabel.Text = math.floor(dist) .. "m"
            
            -- Color based on team
            local teamColor = Color3.fromRGB(255, 0, 0) -- Default red (enemy)
            if player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team then
                teamColor = Color3.fromRGB(0, 255, 0) -- Green for teammates
            end
            highlight.FillColor = teamColor
        else
            highlight.Parent = nil
            billboard.Parent = nil
        end
    end
    
    -- Connect to character changes
    espData.CharConn = player.CharacterAdded:Connect(function()
        task.wait(0.5)
        if Toggles.PlayerESP then
            updateESP()
        end
    end)
    
    espData.UpdateFunc = updateESP
    
    return espData
end

local function destroyESP(player)
    local data = ESPObjects[player]
    if data then
        if data.Highlight then data.Highlight:Destroy() end
        if data.Billboard then data.Billboard:Destroy() end
        if data.CharConn then data.CharConn:Disconnect() end
        ESPObjects[player] = nil
    end
end

local function startPlayerESP()
    -- Create ESP for existing players
    for _, player in ipairs(Players:GetPlayers()) do
        createESPBox(player)
    end
    
    -- Connect new players
    cleanupConnection("ESPPlayerAdded")
    Connections["ESPPlayerAdded"] = Players.PlayerAdded:Connect(function(player)
        if Toggles.PlayerESP then
            createESPBox(player)
        end
    end)
    
    cleanupConnection("ESPPlayerRemoving")
    Connections["ESPPlayerRemoving"] = Players.PlayerRemoving:Connect(function(player)
        destroyESP(player)
    end)
    
    -- Update loop
    cleanupConnection("ESPUpdate")
    Connections["ESPUpdate"] = RunService.RenderStepped:Connect(function()
        if Toggles.PlayerESP then
            for player, data in pairs(ESPObjects) do
                if data.UpdateFunc then
                    data.UpdateFunc()
                end
            end
        end
    end)
end

local function stopPlayerESP()
    cleanupConnection("ESPPlayerAdded")
    cleanupConnection("ESPPlayerRemoving")
    cleanupConnection("ESPUpdate")
    
    for player, _ in pairs(ESPObjects) do
        destroyESP(player)
    end
    ESPObjects = {}
end

-- ============================================================================
-- FULLBRIGHT
-- ============================================================================

local function startFullbright()
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.Brightness = 2
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    
    -- Remove effects that cause darkness
    for _, effect in pairs(Lighting:GetDescendants()) do
        if effect:IsA("Atmosphere") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") then
            effect.Enabled = false
        end
    end
end

local function stopFullbright()
    Lighting.Ambient = OriginalLighting.Ambient
    Lighting.Brightness = OriginalLighting.Brightness
    Lighting.OutdoorAmbient = OriginalLighting.OutdoorAmbient
    
    for _, effect in pairs(Lighting:GetDescendants()) do
        if effect:IsA("Atmosphere") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") then
            effect.Enabled = true
        end
    end
end

-- ============================================================================
-- UI SETUP
-- ============================================================================

-- Create Universal Tab
local UniversalTab = Window:CreateTab("Universal")

-- Character Section
local CharSection = UniversalTab:CreateSection("Character", true)

CharSection:AddSlider({
    Label = "Walk Speed",
    Min = 16,
    Max = 500,
    Default = 16,
    Callback = function(value)
        Settings.WalkSpeed = value
        local hum = getHumanoid()
        if hum then
            hum.WalkSpeed = value
        end
    end
})

CharSection:AddSlider({
    Label = "Jump Power",
    Min = 50,
    Max = 500,
    Default = 50,
    Callback = function(value)
        Settings.JumpPower = value
        local hum = getHumanoid()
        if hum then
            hum.JumpPower = value
        end
    end
})

CharSection:AddToggle({
    Label = "Infinite Jump",
    Default = false,
    Callback = function(value)
        Toggles.InfiniteJump = value
        if value then
            startInfiniteJump()
        else
            stopInfiniteJump()
        end
    end
})

CharSection:AddToggle({
    Label = "Noclip",
    Default = false,
    Callback = function(value)
        Toggles.Noclip = value
        if value then
            startNoclip()
        else
            stopNoclip()
        end
    end
})

-- Movement Section
local MoveSection = UniversalTab:CreateSection("Movement", true)

MoveSection:AddToggle({
    Label = "Fly",
    Default = false,
    Callback = function(value)
        Toggles.Fly = value
        if value then
            startFly()
        else
            stopFly()
        end
    end
})

MoveSection:AddSlider({
    Label = "Fly Speed",
    Min = 10,
    Max = 500,
    Default = 50,
    Callback = function(value)
        Settings.FlySpeed = value
    end
})

-- Visuals Section
local VisSection = UniversalTab:CreateSection("Visuals", true)

VisSection:AddToggle({
    Label = "Player ESP",
    Default = false,
    Callback = function(value)
        Toggles.PlayerESP = value
        if value then
            startPlayerESP()
        else
            stopPlayerESP()
        end
    end
})

VisSection:AddToggle({
    Label = "Fullbright",
    Default = false,
    Callback = function(value)
        Toggles.Fullbright = value
        if value then
            startFullbright()
        else
            stopFullbright()
        end
    end
})

-- Misc Section
local MiscSection = UniversalTab:CreateSection("Misc", true)

MiscSection:AddToggle({
    Label = "Anti-AFK",
    Default = true,
    Callback = function(value)
        Toggles.AntiAFK = value
        if value then
            startAntiAFK()
        else
            stopAntiAFK()
        end
    end
})

MiscSection:AddButton({
    Label = "Rejoin Server",
    Style = "secondary",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

MiscSection:AddButton({
    Label = "Server Hop",
    Style = "secondary",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local HttpService = game:GetService("HttpService")
        
        local success, servers = pcall(function()
            local url = "https://games.roblox.com/v1/games/" .. game.GameId .. "/servers/Public?sortOrder=Asc&limit=100"
            return HttpService:JSONDecode(game:HttpGet(url))
        end)
        
        if success and servers and servers.data then
            for _, server in ipairs(servers.data) do
                if server.id ~= game.JobId and server.playing < server.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                    return
                end
            end
        end
        
        Window.Notify("Server Hop", "No available servers found!", 3, "warning")
    end
})

-- Initialize Anti-AFK by default
Toggles.AntiAFK = true
startAntiAFK()

-- Reapply settings on respawn
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    
    local hum = getHumanoid()
    if hum then
        if Settings.WalkSpeed > 16 then
            hum.WalkSpeed = Settings.WalkSpeed
        end
        if Settings.JumpPower > 50 then
            hum.JumpPower = Settings.JumpPower
        end
    end
    
    -- Restart fly if it was enabled
    if Toggles.Fly then
        stopFly()
        task.wait(0.2)
        startFly()
    end
end)

-- Notify loaded
Window.Notify("Universal Script", "Loaded! Anti-AFK enabled by default.", 3, "success")

return Library
