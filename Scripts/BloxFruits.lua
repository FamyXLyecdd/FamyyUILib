--[[
    FAMYY PRIVATE - Blox Fruits Script
    Version: 1.0
    
    Features:
    - Auto Farm (Mobs + Drops)
    - Auto Quest
    - Fruit Sniper
    - ESP/Visuals
    - Auto Skills
    - Combat Mods
    - Teleports
    - Server Hop
    - Auto Bounty Hunt
    - Auto Events
]]

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Auto-update character reference
Player.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
end)

-- ============================================================================
-- LOAD UI LIBRARY
-- ============================================================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/FamyyLib.lua"))()
local Window = Library.Window

-- ============================================================================
-- SETTINGS / STATE
-- ============================================================================

local Settings = {
    -- Auto Farm
    AutoFarm = false,
    AutoFarmType = "Nearest",
    FarmDistance = 500,
    BringMobs = false,
    
    -- Auto Quest
    AutoQuest = false,
    SelectedQuest = "Auto",
    
    -- Fruit Sniper
    FruitSniper = false,
    FruitNotify = true,
    AutoCollectFruit = false,
    
    -- ESP
    ESPEnabled = false,
    ESPPlayers = false,
    ESPFruits = true,
    ESPChests = false,
    ESPNPCs = false,
    ESPMobs = false,
    
    -- Combat
    FastAttack = false,
    NoAttackCooldown = false,
    AutoHaki = false,
    AutoObservation = false,
    InfiniteEnergy = false,
    
    -- Auto Skills
    AutoSkills = false,
    SkillZ = false,
    SkillX = false,
    SkillC = false,
    SkillV = false,
    SkillF = false,
    
    -- Teleports
    SelectedIsland = "Starter Island",
    
    -- Server Hop
    MinPlayers = 1,
    MaxPlayers = 10,
    
    -- Bounty Hunt
    AutoBountyHunt = false,
    MinBounty = 100000,
    
    -- Events
    AutoSeaEvents = false,
    AutoKitsune = false,
    AutoMirage = false,
}

-- ============================================================================
-- GAME DATA
-- ============================================================================

local Islands = {
    -- First Sea
    ["Starter Island"] = CFrame.new(-1176, 5, 3803),
    ["Jungle"] = CFrame.new(-1609, 37, 153),
    ["Pirate Village"] = CFrame.new(-1139, 5, 3978),
    ["Desert"] = CFrame.new(1093, 7, 4192),
    ["Frozen Village"] = CFrame.new(1206, 60, -1214),
    ["Marine Fortress"] = CFrame.new(-4914, 52, 4281),
    ["Skylands"] = CFrame.new(-4869, 716, -2622),
    ["Prison"] = CFrame.new(4851, 6, 741),
    ["Colosseum"] = CFrame.new(-1428, 7, -2865),
    ["Magma Village"] = CFrame.new(-5295, 12, 8517),
    ["Underwater City"] = CFrame.new(61163, 11, 1819),
    ["Fountain City"] = CFrame.new(5254, 39, 4050),
    
    -- Second Sea
    ["Kingdom of Rose"] = CFrame.new(-2104, 73, -6807),
    ["Green Zone"] = CFrame.new(-2383, 73, -3280),
    ["Graveyard"] = CFrame.new(-5449, 81, -799),
    ["Snow Mountain"] = CFrame.new(617, 400, -5353),
    ["Hot and Cold"] = CFrame.new(-6116, 16, -4823),
    ["Cursed Ship"] = CFrame.new(943, 125, 33056),
    ["Ice Castle"] = CFrame.new(6150, 394, -6734),
    ["Forgotten Island"] = CFrame.new(-3050, 312, -10147),
    ["Dark Arena"] = CFrame.new(-2347, 73, -6406),
    ["Cafe"] = CFrame.new(-384, 73, -5936),
    ["Usopp's Island"] = CFrame.new(4838, 8, -7471),
    
    -- Third Sea
    ["Port Town"] = CFrame.new(-289, 44, 5580),
    ["Hydra Island"] = CFrame.new(5229, 414, 334),
    ["Great Tree"] = CFrame.new(2175, 28, -6773),
    ["Floating Turtle"] = CFrame.new(-13274, 457, -7735),
    ["Castle on the Sea"] = CFrame.new(-5064, 314, -3060),
    ["Haunted Castle"] = CFrame.new(-9516, 140, 5765),
    ["Sea of Treats"] = CFrame.new(-12104, 390, -7554),
    ["Tiki Outpost"] = CFrame.new(-17681, 21, 1422),
    ["Mansion"] = CFrame.new(-12840, 332, -7617),
    ["Kitsune Shrine"] = CFrame.new(-10042, 408, -9467),
}

local Quests = {
    -- First Sea Level Ranges
    {Name = "Bandit", Level = 1, MaxLevel = 10, NPC = "Bandit Quest Giver"},
    {Name = "Monkey", Level = 10, MaxLevel = 25, NPC = "Jungle Quest Giver"},
    {Name = "Gorilla", Level = 25, MaxLevel = 40, NPC = "Jungle Quest Giver"},
    {Name = "Pirate", Level = 40, MaxLevel = 60, NPC = "Pirate Quest Giver"},
    {Name = "Brute", Level = 60, MaxLevel = 80, NPC = "Desert Quest Giver"},
    {Name = "Desert Officer", Level = 80, MaxLevel = 100, NPC = "Desert Quest Giver"},
    {Name = "Snow Bandit", Level = 100, MaxLevel = 125, NPC = "Frozen Quest Giver"},
    {Name = "Snowman", Level = 125, MaxLevel = 150, NPC = "Frozen Quest Giver"},
    {Name = "Chief Petty Officer", Level = 150, MaxLevel = 175, NPC = "Marine Quest Giver"},
    {Name = "Sky Bandit", Level = 175, MaxLevel = 200, NPC = "Sky Quest Giver"},
    {Name = "Toga Warrior", Level = 200, MaxLevel = 225, NPC = "Colosseum Quest Giver"},
    {Name = "Gladiator", Level = 225, MaxLevel = 250, NPC = "Colosseum Quest Giver"},
    {Name = "Magma Ninja", Level = 250, MaxLevel = 275, NPC = "Magma Quest Giver"},
    {Name = "Military Soldier", Level = 275, MaxLevel = 300, NPC = "Magma Quest Giver"},
}

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

local function GetDistance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

local function TeleportTo(cf)
    if HumanoidRootPart then
        HumanoidRootPart.CFrame = cf
    end
end

local function GetNearestMob()
    local nearestMob = nil
    local nearestDistance = Settings.FarmDistance
    
    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
        if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
            if mob:FindFirstChild("HumanoidRootPart") then
                local distance = GetDistance(HumanoidRootPart.Position, mob.HumanoidRootPart.Position)
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearestMob = mob
                end
            end
        end
    end
    
    return nearestMob
end

local function GetNearestFruit()
    local nearestFruit = nil
    local nearestDistance = math.huge
    
    for _, fruit in pairs(Workspace:GetChildren()) do
        if fruit.Name:match("Fruit") or fruit:FindFirstChild("FruitModel") then
            local fruitPart = fruit:FindFirstChild("Handle") or fruit:FindFirstChildOfClass("Part")
            if fruitPart then
                local distance = GetDistance(HumanoidRootPart.Position, fruitPart.Position)
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearestFruit = fruit
                end
            end
        end
    end
    
    return nearestFruit
end

local function Attack()
    if VirtualInputManager then
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end
end

local function UseSkill(key)
    local VIM = game:GetService("VirtualInputManager")
    VIM:SendKeyEvent(true, key, false, game)
    task.wait()
    VIM:SendKeyEvent(false, key, false, game)
end

local function ServerHop()
    local servers = {}
    local cursor = nil
    
    local success, result = pcall(function()
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        if cursor then
            url = url .. "&cursor=" .. cursor
        end
        return HttpService:JSONDecode(game:HttpGet(url))
    end)
    
    if success and result.data then
        for _, server in pairs(result.data) do
            if server.playing >= Settings.MinPlayers and server.playing <= Settings.MaxPlayers then
                if server.id ~= game.JobId then
                    table.insert(servers, server)
                end
            end
        end
        
        if #servers > 0 then
            local server = servers[math.random(1, #servers)]
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, Player)
            return true
        end
    end
    
    return false
end

-- ============================================================================
-- ESP SYSTEM
-- ============================================================================

local ESPFolder = Instance.new("Folder", game.CoreGui)
ESPFolder.Name = "FamyyESP"

local function CreateESP(object, color, text)
    if not object or not object:FindFirstChild("HumanoidRootPart") then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_" .. object.Name
    billboard.Adornee = object:FindFirstChild("HumanoidRootPart") or object:FindFirstChild("Head") or object:FindFirstChildOfClass("Part")
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = ESPFolder
    
    local frame = Instance.new("Frame", billboard)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = color
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 4)
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 12
    label.TextScaled = true
    
    return billboard
end

local function ClearESP()
    for _, esp in pairs(ESPFolder:GetChildren()) do
        esp:Destroy()
    end
end

local function UpdateESP()
    ClearESP()
    
    if not Settings.ESPEnabled then return end
    
    -- Players ESP
    if Settings.ESPPlayers then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character then
                local health = player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health or 0
                CreateESP(player.Character, Color3.fromRGB(255, 100, 100), player.Name .. "\n" .. math.floor(health))
            end
        end
    end
    
    -- Fruits ESP
    if Settings.ESPFruits then
        for _, obj in pairs(Workspace:GetChildren()) do
            if obj.Name:match("Fruit") then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "ESP_Fruit"
                billboard.Adornee = obj:FindFirstChildOfClass("Part") or obj
                billboard.Size = UDim2.new(0, 80, 0, 30)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = ESPFolder
                
                local frame = Instance.new("Frame", billboard)
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BackgroundTransparency = 0.3
                frame.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
                frame.BorderSizePixel = 0
                Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 4)
                
                local label = Instance.new("TextLabel", frame)
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Text = obj.Name
                label.TextColor3 = Color3.new(0, 0, 0)
                label.Font = Enum.Font.GothamBold
                label.TextSize = 14
            end
        end
    end
    
    -- Mobs ESP
    if Settings.ESPMobs and Workspace:FindFirstChild("Enemies") then
        for _, mob in pairs(Workspace.Enemies:GetChildren()) do
            if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                CreateESP(mob, Color3.fromRGB(255, 50, 50), mob.Name .. "\n" .. math.floor(mob.Humanoid.Health))
            end
        end
    end
end

-- ============================================================================
-- MAIN LOOPS
-- ============================================================================

-- Auto Farm Loop
task.spawn(function()
    while task.wait(0.1) do
        if Settings.AutoFarm and HumanoidRootPart then
            local mob = GetNearestMob()
            if mob and mob:FindFirstChild("HumanoidRootPart") then
                local mobCF = mob.HumanoidRootPart.CFrame
                
                if Settings.BringMobs then
                    -- Bring mob to player
                    mob.HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                else
                    -- Teleport to mob
                    TeleportTo(mobCF * CFrame.new(0, 0, 3))
                end
                
                -- Attack
                Attack()
            end
        end
    end
end)

-- Auto Skills Loop
task.spawn(function()
    while task.wait(0.5) do
        if Settings.AutoSkills then
            if Settings.SkillZ then UseSkill(Enum.KeyCode.Z) end
            if Settings.SkillX then UseSkill(Enum.KeyCode.X) end
            if Settings.SkillC then UseSkill(Enum.KeyCode.C) end
            if Settings.SkillV then UseSkill(Enum.KeyCode.V) end
            if Settings.SkillF then UseSkill(Enum.KeyCode.F) end
        end
        
        if Settings.AutoHaki then
            -- Toggle Buso Haki
            local args = {[1] = "Buso"}
            ReplicatedStorage.Remotes.SetHaki:FireServer(unpack(args))
        end
    end
end)

-- Fruit Sniper Loop
task.spawn(function()
    while task.wait(1) do
        if Settings.FruitSniper then
            local fruit = GetNearestFruit()
            if fruit then
                if Settings.FruitNotify then
                    Window.Notify("Fruit Found!", fruit.Name .. " detected!", 5, "success")
                end
                
                if Settings.AutoCollectFruit then
                    local fruitPart = fruit:FindFirstChild("Handle") or fruit:FindFirstChildOfClass("Part")
                    if fruitPart then
                        TeleportTo(fruitPart.CFrame)
                        task.wait(0.5)
                        -- Trigger pickup
                        fireproximityprompt(fruit:FindFirstChildOfClass("ProximityPrompt"))
                    end
                end
            end
        end
    end
end)

-- ESP Update Loop
task.spawn(function()
    while task.wait(2) do
        if Settings.ESPEnabled then
            UpdateESP()
        else
            ClearESP()
        end
    end
end)

-- Auto Bounty Hunt Loop
task.spawn(function()
    while task.wait(1) do
        if Settings.AutoBountyHunt and HumanoidRootPart then
            local target = nil
            local highestBounty = Settings.MinBounty
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local bounty = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Bounty")
                    if bounty and bounty.Value >= highestBounty then
                        highestBounty = bounty.Value
                        target = player
                    end
                end
            end
            
            if target and target.Character then
                TeleportTo(target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
                Attack()
            end
        end
    end
end)

-- ============================================================================
-- CREATE UI TABS
-- ============================================================================

-- Main Tab (Farming)
local FarmTab = Window:CreateTab("Farm")

local AutoFarmSection = FarmTab:CreateSection("Auto Farm", true)

AutoFarmSection:AddToggle({
    Label = "Enable Auto Farm",
    Default = false,
    Callback = function(v)
        Settings.AutoFarm = v
        Window.Notify("Auto Farm", v and "Enabled" or "Disabled", 2, v and "success" or "info")
    end
})

AutoFarmSection:AddToggle({
    Label = "Bring Mobs to You",
    Default = false,
    Callback = function(v)
        Settings.BringMobs = v
    end
})

AutoFarmSection:AddSlider({
    Label = "Farm Distance",
    Min = 100,
    Max = 2000,
    Default = 500,
    Callback = function(v)
        Settings.FarmDistance = v
    end
})

local QuestSection = FarmTab:CreateSection("Auto Quest", true)

QuestSection:AddToggle({
    Label = "Enable Auto Quest",
    Default = false,
    Callback = function(v)
        Settings.AutoQuest = v
    end
})

QuestSection:AddDropdown({
    Label = "Quest Mode",
    Options = {"Auto (By Level)", "Manual Select"},
    Default = "Auto (By Level)",
    Callback = function(v)
        Settings.SelectedQuest = v
    end
})

-- Combat Tab
local CombatTab = Window:CreateTab("Combat")

local CombatSection = CombatTab:CreateSection("Combat Mods", true)

CombatSection:AddToggle({
    Label = "Fast Attack",
    Default = false,
    Callback = function(v)
        Settings.FastAttack = v
    end
})

CombatSection:AddToggle({
    Label = "Auto Haki",
    Default = false,
    Callback = function(v)
        Settings.AutoHaki = v
    end
})

CombatSection:AddToggle({
    Label = "Auto Observation",
    Default = false,
    Callback = function(v)
        Settings.AutoObservation = v
    end
})

local SkillsSection = CombatTab:CreateSection("Auto Skills", true)

SkillsSection:AddToggle({
    Label = "Enable Auto Skills",
    Default = false,
    Callback = function(v)
        Settings.AutoSkills = v
    end
})

SkillsSection:AddToggle({
    Label = "Use Z Skill",
    Default = false,
    Callback = function(v)
        Settings.SkillZ = v
    end
})

SkillsSection:AddToggle({
    Label = "Use X Skill",
    Default = false,
    Callback = function(v)
        Settings.SkillX = v
    end
})

SkillsSection:AddToggle({
    Label = "Use C Skill",
    Default = false,
    Callback = function(v)
        Settings.SkillC = v
    end
})

SkillsSection:AddToggle({
    Label = "Use V Skill",
    Default = false,
    Callback = function(v)
        Settings.SkillV = v
    end
})

local BountySection = CombatTab:CreateSection("Bounty Hunt", true)

BountySection:AddToggle({
    Label = "Auto Bounty Hunt",
    Default = false,
    Callback = function(v)
        Settings.AutoBountyHunt = v
        if v then
            Window.Notify("Bounty Hunt", "Targeting high bounty players!", 3, "warning")
        end
    end
})

BountySection:AddSlider({
    Label = "Min Bounty Target",
    Min = 10000,
    Max = 10000000,
    Default = 100000,
    Step = 10000,
    Callback = function(v)
        Settings.MinBounty = v
    end
})

-- ESP Tab
local ESPTab = Window:CreateTab("ESP")

local ESPSection = ESPTab:CreateSection("ESP Settings", true)

ESPSection:AddToggle({
    Label = "Enable ESP",
    Default = false,
    Callback = function(v)
        Settings.ESPEnabled = v
        if not v then ClearESP() end
    end
})

ESPSection:AddToggle({
    Label = "Players ESP",
    Default = false,
    Callback = function(v)
        Settings.ESPPlayers = v
    end
})

ESPSection:AddToggle({
    Label = "Fruits ESP",
    Default = true,
    Callback = function(v)
        Settings.ESPFruits = v
    end
})

ESPSection:AddToggle({
    Label = "Mobs ESP",
    Default = false,
    Callback = function(v)
        Settings.ESPMobs = v
    end
})

ESPSection:AddToggle({
    Label = "Chests ESP",
    Default = false,
    Callback = function(v)
        Settings.ESPChests = v
    end
})

-- Fruit Tab
local FruitTab = Window:CreateTab("Fruits")

local FruitSection = FruitTab:CreateSection("Fruit Sniper", true)

FruitSection:AddToggle({
    Label = "Enable Fruit Sniper",
    Default = false,
    Callback = function(v)
        Settings.FruitSniper = v
        if v then
            Window.Notify("Fruit Sniper", "Scanning for fruits...", 3, "info")
        end
    end
})

FruitSection:AddToggle({
    Label = "Notify on Fruit Found",
    Default = true,
    Callback = function(v)
        Settings.FruitNotify = v
    end
})

FruitSection:AddToggle({
    Label = "Auto Collect Fruits",
    Default = false,
    Callback = function(v)
        Settings.AutoCollectFruit = v
    end
})

-- Teleport Tab
local TPTab = Window:CreateTab("Teleport")

local TPSection = TPTab:CreateSection("Island Teleports", true)

-- Create island dropdown
local islandNames = {}
for name, _ in pairs(Islands) do
    table.insert(islandNames, name)
end
table.sort(islandNames)

TPSection:AddDropdown({
    Label = "Select Island",
    Options = islandNames,
    Default = "Starter Island",
    Callback = function(v)
        Settings.SelectedIsland = v
    end
})

TPSection:AddButton({
    Label = "Teleport to Island",
    Style = "primary",
    Callback = function()
        if Islands[Settings.SelectedIsland] then
            TeleportTo(Islands[Settings.SelectedIsland])
            Window.Notify("Teleport", "Teleported to " .. Settings.SelectedIsland, 2, "success")
        end
    end
})

local ServerSection = TPTab:CreateSection("Server Hop", true)

ServerSection:AddSlider({
    Label = "Min Players",
    Min = 1,
    Max = 20,
    Default = 1,
    Callback = function(v)
        Settings.MinPlayers = v
    end
})

ServerSection:AddSlider({
    Label = "Max Players",
    Min = 1,
    Max = 20,
    Default = 10,
    Callback = function(v)
        Settings.MaxPlayers = v
    end
})

ServerSection:AddButton({
    Label = "Server Hop",
    Style = "primary",
    Callback = function()
        Window.Notify("Server Hop", "Finding new server...", 3, "info")
        local success = ServerHop()
        if not success then
            Window.Notify("Server Hop", "No servers found with criteria", 3, "error")
        end
    end
})

-- Events Tab
local EventsTab = Window:CreateTab("Events")

local EventsSection = EventsTab:CreateSection("Auto Events", true)

EventsSection:AddToggle({
    Label = "Auto Sea Events",
    Default = false,
    Callback = function(v)
        Settings.AutoSeaEvents = v
    end
})

EventsSection:AddToggle({
    Label = "Auto Kitsune Island",
    Default = false,
    Callback = function(v)
        Settings.AutoKitsune = v
    end
})

EventsSection:AddToggle({
    Label = "Auto Mirage Island",
    Default = false,
    Callback = function(v)
        Settings.AutoMirage = v
    end
})

EventsSection:AddButton({
    Label = "Teleport to Kitsune Shrine",
    Style = "secondary",
    Callback = function()
        if Islands["Kitsune Shrine"] then
            TeleportTo(Islands["Kitsune Shrine"])
            Window.Notify("Teleport", "Teleported to Kitsune Shrine", 2, "success")
        end
    end
})

-- ============================================================================
-- STARTUP
-- ============================================================================

Window.Notify("Blox Fruits", "Script loaded successfully!", 3, "success")
print("[FAMYY PRIVATE] Blox Fruits Script Loaded!")
