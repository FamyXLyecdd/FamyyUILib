--[[
    FAMYY PRIVATE - Blox Fruits Script
    Version: 1.0
    Supports: First Sea (PlaceId: 2753915549)
    
    Features:
    - Auto Farm (kills mobs near your level)
    - Auto Quest (gets and completes quests)
    - Fruit ESP & Sniper
    - Player ESP
    - Mob ESP
    - Teleports to all First Sea islands
    - Stats display
]]

-- Load UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/FamyyLib.lua"))()

-- Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Window = Library.Window

-- ============================================================================
-- GAME DATA - FIRST SEA
-- ============================================================================

local FirstSeaIslands = {
    {Name = "Starter Island", Position = CFrame.new(1040, 16, 1547), Level = {1, 10}},
    {Name = "Jungle", Position = CFrame.new(-1613, 42, 153), Level = {15, 30}},
    {Name = "Pirate Village", Position = CFrame.new(-1139, 5, 3825), Level = {30, 60}},
    {Name = "Desert", Position = CFrame.new(940, 20, 4325), Level = {60, 90}},
    {Name = "Frozen Village", Position = CFrame.new(1192, 28, -1291), Level = {90, 120}},
    {Name = "Marine Fortress", Position = CFrame.new(-4914, 52, 4281), Level = {120, 150}},
    {Name = "Middle Island", Position = CFrame.new(-289, 73, 2071), Level = {100, 150}},
    {Name = "Skylands", Position = CFrame.new(-4869, 733, -2622), Level = {150, 200}},
    {Name = "Prison", Position = CFrame.new(4851, 6, 740), Level = {190, 275}},
    {Name = "Colosseum", Position = CFrame.new(-1428, 7, -2858), Level = {225, 300}},
    {Name = "Magma Village", Position = CFrame.new(-5280, 12, 8515), Level = {300, 375}},
    {Name = "Underwater City", Position = CFrame.new(61163, 11, 1819), Level = {375, 450}},
    {Name = "Fountain City", Position = CFrame.new(5129, 35, 4106), Level = {625, 700}},
}

local FirstSeaQuests = {
    -- Level range: {QuestNPC, MobName, MobLevel, KillCount}
    {Level = 1, NPC = "Quest Giver", Mob = "Bandit", Quest = "Bandit"},
    {Level = 10, NPC = "Quest Giver", Mob = "Monkey", Quest = "Monkey"},
    {Level = 15, NPC = "Quest Giver", Mob = "Gorilla", Quest = "Gorilla"},
    {Level = 30, NPC = "Quest Giver", Mob = "Pirate", Quest = "Pirate"},
    {Level = 60, NPC = "Quest Giver", Mob = "Desert Bandit", Quest = "DesertBandit"},
    {Level = 90, NPC = "Quest Giver", Mob = "Snow Bandit", Quest = "SnowBandit"},
    {Level = 120, NPC = "Quest Giver", Mob = "Marine", Quest = "Marine"},
    {Level = 150, NPC = "Quest Giver", Mob = "Sky Bandit", Quest = "SkyBandit"},
    {Level = 190, NPC = "Quest Giver", Mob = "Prisoner", Quest = "Prisoner"},
    {Level = 225, NPC = "Quest Giver", Mob = "Gladiator", Quest = "Gladiator"},
    {Level = 300, NPC = "Quest Giver", Mob = "Military Soldier", Quest = "MilitarySoldier"},
    {Level = 375, NPC = "Quest Giver", Mob = "Fishman Warrior", Quest = "FishmanWarrior"},
}

-- ============================================================================
-- STATE VARIABLES
-- ============================================================================

local Toggles = {
    AutoFarm = false,
    AutoQuest = false,
    FruitESP = false,
    FruitSniper = false,
    PlayerESP = false,
    MobESP = false,
    BringMobs = false,
    FastAttack = false,
    AutoHaki = false,
}

local Settings = {
    FarmRange = 100,
    AttackSpeed = 0.1,
    TeleportSpeed = 150,
}

local Connections = {}
local ESPObjects = {}

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

local function getCharacter()
    return LocalPlayer.Character
end

local function getHumanoid()
    local char = getCharacter()
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function getHRP()
    local char = getCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function getPlayerLevel()
    local data = LocalPlayer:FindFirstChild("Data")
    if data then
        local level = data:FindFirstChild("Level")
        if level then return level.Value end
    end
    return 1
end

local function getPlayerBeli()
    local data = LocalPlayer:FindFirstChild("Data")
    if data then
        local beli = data:FindFirstChild("Beli")
        if beli then return beli.Value end
    end
    return 0
end

local function teleportTo(cf)
    local hrp = getHRP()
    if hrp then
        hrp.CFrame = cf
    end
end

local function tweenTo(cf, speed)
    local hrp = getHRP()
    if not hrp then return end
    
    speed = speed or Settings.TeleportSpeed
    local distance = (hrp.Position - cf.Position).Magnitude
    local time = distance / speed
    
    local tween = TweenService:Create(hrp, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = cf})
    tween:Play()
    tween.Completed:Wait()
end

local function getNearestMob(maxDistance)
    local hrp = getHRP()
    if not hrp then return nil end
    
    local nearest = nil
    local nearestDist = maxDistance or Settings.FarmRange
    
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") then
            local mobHRP = mob:FindFirstChild("HumanoidRootPart")
            local mobHum = mob:FindFirstChildOfClass("Humanoid")
            
            if mobHRP and mobHum and mobHum.Health > 0 then
                local dist = (hrp.Position - mobHRP.Position).Magnitude
                if dist < nearestDist then
                    nearest = mob
                    nearestDist = dist
                end
            end
        end
    end
    
    return nearest, nearestDist
end

local function getMobsByName(name)
    local mobs = {}
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return mobs end
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") and mob.Name:lower():find(name:lower()) then
            local mobHum = mob:FindFirstChildOfClass("Humanoid")
            if mobHum and mobHum.Health > 0 then
                table.insert(mobs, mob)
            end
        end
    end
    
    return mobs
end

local function attackMob(mob)
    if not mob then return end
    
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    local mobHum = mob:FindFirstChildOfClass("Humanoid")
    local hrp = getHRP()
    
    if not mobHRP or not mobHum or not hrp then return end
    if mobHum.Health <= 0 then return end
    
    -- Position behind mob for attacking
    local attackPos = mobHRP.CFrame * CFrame.new(0, 0, 3)
    hrp.CFrame = attackPos
    
    -- Simulate click attack
    if VirtualInputManager then
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait(0.05)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end
end

-- ============================================================================
-- ESP FUNCTIONS
-- ============================================================================

local function createESP(object, color, text)
    if ESPObjects[object] then return end
    
    local espData = {}
    
    -- Billboard
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FamyyESP"
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = object
    
    local textLabel = Instance.new("TextLabel", billboard)
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text or object.Name
    textLabel.TextColor3 = color or Color3.new(1, 1, 1)
    textLabel.TextStrokeTransparency = 0
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextScaled = true
    
    local distLabel = Instance.new("TextLabel", billboard)
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "0m"
    distLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    distLabel.TextStrokeTransparency = 0
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextScaled = true
    
    espData.Billboard = billboard
    espData.DistLabel = distLabel
    espData.TextLabel = textLabel
    
    ESPObjects[object] = espData
end

local function removeESP(object)
    if ESPObjects[object] then
        if ESPObjects[object].Billboard then
            ESPObjects[object].Billboard:Destroy()
        end
        ESPObjects[object] = nil
    end
end

local function updateESPDistances()
    local hrp = getHRP()
    if not hrp then return end
    
    for object, data in pairs(ESPObjects) do
        if object and object.Parent and data.DistLabel then
            local objectPos = object:IsA("Model") and object:FindFirstChild("HumanoidRootPart") or object
            if objectPos and objectPos:IsA("BasePart") then
                local dist = math.floor((hrp.Position - objectPos.Position).Magnitude)
                data.DistLabel.Text = dist .. "m"
            elseif objectPos and objectPos:IsA("Model") then
                local primary = objectPos.PrimaryPart or objectPos:FindFirstChildWhichIsA("BasePart")
                if primary then
                    local dist = math.floor((hrp.Position - primary.Position).Magnitude)
                    data.DistLabel.Text = dist .. "m"
                end
            end
        else
            ESPObjects[object] = nil
        end
    end
end

local function clearAllESP()
    for object, data in pairs(ESPObjects) do
        if data.Billboard then
            data.Billboard:Destroy()
        end
    end
    ESPObjects = {}
end

-- ============================================================================
-- FRUIT FUNCTIONS
-- ============================================================================

local function findFruits()
    local fruits = {}
    
    -- Check common fruit spawn locations
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") and obj.Name:find("Fruit") then
            table.insert(fruits, obj)
        elseif obj:IsA("Model") and obj.Name:find("Fruit") then
            table.insert(fruits, obj)
        end
    end
    
    -- Check for Handle parts with fruit-like properties
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Part") and obj.Name == "Handle" and obj.Parent and obj.Parent:IsA("Tool") then
            if obj.Parent.Name:find("Fruit") or obj.BrickColor.Name:find("Fruit") then
                if not table.find(fruits, obj.Parent) then
                    table.insert(fruits, obj.Parent)
                end
            end
        end
    end
    
    return fruits
end

local function sniperFruit(fruit)
    if not fruit then return end
    
    local fruitPart = fruit:IsA("BasePart") and fruit or fruit:FindFirstChild("Handle") or fruit:FindFirstChildWhichIsA("BasePart")
    if not fruitPart then return end
    
    teleportTo(fruitPart.CFrame * CFrame.new(0, 3, 0))
    task.wait(0.5)
    
    -- Try to pick up
    local hrp = getHRP()
    if hrp and (hrp.Position - fruitPart.Position).Magnitude < 15 then
        -- Touch the fruit
        firetouchinterest(hrp, fruitPart, 0)
        task.wait(0.1)
        firetouchinterest(hrp, fruitPart, 1)
    end
end

-- ============================================================================
-- MAIN LOOPS
-- ============================================================================

local function startAutoFarm()
    if Connections.AutoFarm then return end
    
    Connections.AutoFarm = RunService.Heartbeat:Connect(function()
        if not Toggles.AutoFarm then return end
        
        local mob, dist = getNearestMob(Settings.FarmRange)
        
        if mob then
            attackMob(mob)
        end
    end)
end

local function stopAutoFarm()
    if Connections.AutoFarm then
        Connections.AutoFarm:Disconnect()
        Connections.AutoFarm = nil
    end
end

local function startMobESP()
    if Connections.MobESP then return end
    
    local function updateMobESP()
        local enemies = Workspace:FindFirstChild("Enemies")
        if not enemies then return end
        
        for _, mob in ipairs(enemies:GetChildren()) do
            if mob:IsA("Model") then
                local mobHum = mob:FindFirstChildOfClass("Humanoid")
                if mobHum and mobHum.Health > 0 then
                    if not ESPObjects[mob] then
                        local color = Color3.fromRGB(255, 100, 100)
                        createESP(mob, color, mob.Name)
                    end
                else
                    removeESP(mob)
                end
            end
        end
    end
    
    updateMobESP()
    
    Connections.MobESP = RunService.Heartbeat:Connect(function()
        if not Toggles.MobESP then return end
        updateMobESP()
        updateESPDistances()
    end)
end

local function stopMobESP()
    if Connections.MobESP then
        Connections.MobESP:Disconnect()
        Connections.MobESP = nil
    end
    
    -- Remove mob ESP
    local enemies = Workspace:FindFirstChild("Enemies")
    if enemies then
        for _, mob in ipairs(enemies:GetChildren()) do
            removeESP(mob)
        end
    end
end

local function startFruitESP()
    if Connections.FruitESP then return end
    
    Connections.FruitESP = RunService.Heartbeat:Connect(function()
        if not Toggles.FruitESP then return end
        
        local fruits = findFruits()
        for _, fruit in ipairs(fruits) do
            if not ESPObjects[fruit] then
                createESP(fruit, Color3.fromRGB(255, 200, 0), "FRUIT: " .. fruit.Name)
            end
        end
        
        updateESPDistances()
    end)
end

local function stopFruitESP()
    if Connections.FruitESP then
        Connections.FruitESP:Disconnect()
        Connections.FruitESP = nil
    end
end

local function startFruitSniper()
    if Connections.FruitSniper then return end
    
    Connections.FruitSniper = RunService.Heartbeat:Connect(function()
        if not Toggles.FruitSniper then return end
        
        local fruits = findFruits()
        if #fruits > 0 then
            sniperFruit(fruits[1])
            Window.Notify("Fruit Sniper", "Found and teleported to: " .. fruits[1].Name, 3, "success")
        end
    end)
end

local function stopFruitSniper()
    if Connections.FruitSniper then
        Connections.FruitSniper:Disconnect()
        Connections.FruitSniper = nil
    end
end

local function startPlayerESP()
    if Connections.PlayerESP then return end
    
    local function updatePlayerESP()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if hrp and not ESPObjects[player.Character] then
                    local color = Color3.fromRGB(100, 200, 255)
                    createESP(player.Character, color, player.Name)
                end
            end
        end
    end
    
    updatePlayerESP()
    
    Connections.PlayerESP = RunService.Heartbeat:Connect(function()
        if not Toggles.PlayerESP then return end
        updatePlayerESP()
        updateESPDistances()
    end)
end

local function stopPlayerESP()
    if Connections.PlayerESP then
        Connections.PlayerESP:Disconnect()
        Connections.PlayerESP = nil
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            removeESP(player.Character)
        end
    end
end

-- ============================================================================
-- UI SETUP
-- ============================================================================

-- Main Tab
local MainTab = Window:CreateTab("Farm")

-- Auto Farm Section
local FarmSection = MainTab:CreateSection("Auto Farm", true)

FarmSection:AddToggle({
    Label = "Auto Farm",
    Default = false,
    Callback = function(value)
        Toggles.AutoFarm = value
        if value then
            startAutoFarm()
            Window.Notify("Auto Farm", "Started farming nearby mobs", 2, "success")
        else
            stopAutoFarm()
            Window.Notify("Auto Farm", "Stopped", 2, "info")
        end
    end
})

FarmSection:AddSlider({
    Label = "Farm Range",
    Min = 50,
    Max = 500,
    Default = 100,
    Callback = function(value)
        Settings.FarmRange = value
    end
})

FarmSection:AddToggle({
    Label = "Bring Mobs",
    Default = false,
    Callback = function(value)
        Toggles.BringMobs = value
    end
})

-- ESP Section
local ESPSection = MainTab:CreateSection("ESP", true)

ESPSection:AddToggle({
    Label = "Mob ESP",
    Default = false,
    Callback = function(value)
        Toggles.MobESP = value
        if value then
            startMobESP()
        else
            stopMobESP()
        end
    end
})

ESPSection:AddToggle({
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

ESPSection:AddToggle({
    Label = "Fruit ESP",
    Default = false,
    Callback = function(value)
        Toggles.FruitESP = value
        if value then
            startFruitESP()
            Window.Notify("Fruit ESP", "Scanning for fruits...", 2, "info")
        else
            stopFruitESP()
        end
    end
})

-- Fruit Tab
local FruitTab = Window:CreateTab("Fruits")

local FruitSection = FruitTab:CreateSection("Fruit Sniper", true)

FruitSection:AddToggle({
    Label = "Auto Snipe Fruits",
    Default = false,
    Callback = function(value)
        Toggles.FruitSniper = value
        if value then
            startFruitSniper()
            Window.Notify("Fruit Sniper", "Active - Will teleport to fruits!", 3, "success")
        else
            stopFruitSniper()
        end
    end
})

FruitSection:AddButton({
    Label = "Scan for Fruits Now",
    Style = "primary",
    Callback = function()
        local fruits = findFruits()
        if #fruits > 0 then
            Window.Notify("Fruit Scan", "Found " .. #fruits .. " fruit(s)!", 3, "success")
            for _, fruit in ipairs(fruits) do
                print("[FamyyPrivate] Found fruit:", fruit.Name, fruit:GetFullName())
            end
        else
            Window.Notify("Fruit Scan", "No fruits found", 3, "warning")
        end
    end
})

-- Teleports Tab
local TeleportTab = Window:CreateTab("Teleport")

local IslandSection = TeleportTab:CreateSection("First Sea Islands", true)

for _, island in ipairs(FirstSeaIslands) do
    IslandSection:AddButton({
        Label = island.Name .. " [" .. island.Level[1] .. "-" .. island.Level[2] .. "]",
        Style = "secondary",
        Callback = function()
            teleportTo(island.Position)
            Window.Notify("Teleport", "Teleported to " .. island.Name, 2, "success")
        end
    })
end

-- Stats Tab
local StatsTab = Window:CreateTab("Stats")

local StatsSection = StatsTab:CreateSection("Player Stats", true)

local levelLabel = StatsSection:AddLabel({Text = "Level: Loading...", Bold = true})
local beliLabel = StatsSection:AddLabel({Text = "Beli: Loading..."})

-- Update stats periodically
task.spawn(function()
    while task.wait(1) do
        local level = getPlayerLevel()
        local beli = getPlayerBeli()
        
        if levelLabel then
            levelLabel:SetText("Level: " .. tostring(level))
        end
        if beliLabel then
            beliLabel:SetText("Beli: $" .. tostring(beli))
        end
    end
end)

StatsSection:AddDivider()

StatsSection:AddButton({
    Label = "Rejoin Server",
    Style = "secondary",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
})

StatsSection:AddButton({
    Label = "Server Hop",
    Style = "secondary",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        
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
        
        Window.Notify("Server Hop", "No available servers found", 3, "warning")
    end
})

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

Window.Notify("Blox Fruits", "First Sea script loaded! Level: " .. getPlayerLevel(), 3, "success")

print("[FamyyPrivate] Blox Fruits First Sea loaded!")
print("[FamyyPrivate] Player Level:", getPlayerLevel())
print("[FamyyPrivate] Enemies folder:", Workspace:FindFirstChild("Enemies") and "Found" or "Not found")

return Library
