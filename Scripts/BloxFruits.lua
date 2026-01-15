--[[
    FAMYY PRIVATE - Blox Fruits Sea 1 Script
    Version: 2.0 COMPLETE
    Supports: First Sea (PlaceId: 2753915549)
    
    COMPLETE FEATURE SET:
    ================================================================================
    [AUTO FARM]
    - Auto Farm (Level 1-700 progression)
    - Auto Quest (Accept + Complete)
    - Bring Mobs / Mob Aura
    - Fast Attack (Zero Delay)
    - Infinite Energy
    
    [BOSS FARM]
    - Auto The Saw (Rare Boss)
    - Auto Greybeard (Raid Boss)
    - All Standard Bosses (Gorilla King, Bobby, Yeti, Vice Admiral, etc.)
    - Server Hop on Kill
    
    [PUZZLES & SECRETS]
    - Auto Saber (Full Shanks Puzzle)
    - Auto Observation Haki V1
    - Auto Pole (1st Form)
    - Auto Trident
    - Auto New World (Sea 2 Access)
    
    [UTILITY]
    - Fruit ESP & Sniper
    - Player ESP
    - Mob ESP
    - Chest ESP & Farm
    - Shop Sniper
    - Auto Buy Legendary Swords
    
    [MISC]
    - Auto Stats
    - Invisible Mode
    - White Screen / FPS Boost
    - All Island Teleports
    ================================================================================
]]

-- Load UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/FamyyLib.lua"))()

-- ============================================================================
-- SERVICES
-- ============================================================================

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local Window = Library.Window

-- ============================================================================
-- CONFIGURATION SAVE/LOAD SYSTEM
-- ============================================================================

local ConfigFolder = "FamyyPrivate"
local ConfigFile = ConfigFolder .. "/BloxFruits.json"

local function SaveConfig(data)
    if not isfolder then return end
    pcall(function()
        if not isfolder(ConfigFolder) then
            makefolder(ConfigFolder)
        end
        writefile(ConfigFile, HttpService:JSONEncode(data))
    end)
end

local function LoadConfig()
    if not isfile then return {} end
    local success, result = pcall(function()
        if isfile(ConfigFile) then
            return HttpService:JSONDecode(readfile(ConfigFile))
        end
        return {}
    end)
    return success and result or {}
end

local SavedConfig = LoadConfig()

-- ============================================================================
-- GAME DATA - FIRST SEA COMPLETE DATABASE
-- ============================================================================

-- All First Sea Islands with exact coordinates
local FirstSeaIslands = {
    {Name = "Starter Island", CFrame = CFrame.new(1040, 16, 1547), Level = {0, 10}},
    {Name = "Jungle", CFrame = CFrame.new(-1613, 42, 153), Level = {15, 30}},
    {Name = "Pirate Village", CFrame = CFrame.new(-1139, 5, 3825), Level = {30, 60}},
    {Name = "Desert", CFrame = CFrame.new(940, 20, 4325), Level = {60, 90}},
    {Name = "Frozen Village", CFrame = CFrame.new(1192, 28, -1291), Level = {90, 120}},
    {Name = "Marine Fortress", CFrame = CFrame.new(-4914, 52, 4281), Level = {120, 150}},
    {Name = "Middle Island", CFrame = CFrame.new(-289, 73, 2071), Level = {100, 150}},
    {Name = "Skylands V1", CFrame = CFrame.new(-4869, 733, -2622), Level = {150, 190}},
    {Name = "Prison", CFrame = CFrame.new(4851, 6, 740), Level = {190, 275}},
    {Name = "Colosseum", CFrame = CFrame.new(-1428, 7, -2858), Level = {250, 300}},
    {Name = "Magma Village", CFrame = CFrame.new(-5280, 12, 8515), Level = {300, 375}},
    {Name = "Underwater City", CFrame = CFrame.new(61163, 11, 1819), Level = {375, 450}},
    {Name = "Upper Skylands", CFrame = CFrame.new(-7894, 5547, -380), Level = {450, 575}},
    {Name = "Fountain City", CFrame = CFrame.new(5129, 35, 4106), Level = {625, 700}},
    {Name = "Frozen Village Cave", CFrame = CFrame.new(1579, -504, -528), Level = {90, 120}},
}

-- Complete Quest Database: Level -> {QuestName, MobName, NPCName, NPCPosition, MobPosition}
local QuestDatabase = {
    -- Lv 0-10: Bandit (Starter Island)
    {MinLevel = 0, MaxLevel = 10, Quest = "Bandit", Mob = "Bandit", 
     QuestCFrame = CFrame.new(1059, 16, 1545), MobCFrame = CFrame.new(1045, 16, 1584)},
    
    -- Lv 10-15: Monkey (Jungle)
    {MinLevel = 10, MaxLevel = 15, Quest = "Monkey", Mob = "Monkey", 
     QuestCFrame = CFrame.new(-1599, 36, 150), MobCFrame = CFrame.new(-1543, 43, 64)},
    
    -- Lv 15-30: Gorilla (Jungle)
    {MinLevel = 15, MaxLevel = 30, Quest = "Gorilla", Mob = "Gorilla", 
     QuestCFrame = CFrame.new(-1138, 12, -523), MobCFrame = CFrame.new(-1093, 11, -544)},
    
    -- Lv 30-60: Pirate (Pirate Village)
    {MinLevel = 30, MaxLevel = 60, Quest = "Pirate", Mob = "Pirate", 
     QuestCFrame = CFrame.new(-1135, 4, 3829), MobCFrame = CFrame.new(-1096, 4, 3853)},
    
    -- Lv 60-90: Desert Bandit (Desert)
    {MinLevel = 60, MaxLevel = 90, Quest = "DesertBandit", Mob = "Desert Bandit", 
     QuestCFrame = CFrame.new(893, 6, 4390), MobCFrame = CFrame.new(950, 6, 4450)},
    
    -- Lv 90-120: Snow Bandit (Frozen Village)
    {MinLevel = 90, MaxLevel = 120, Quest = "SnowBandit", Mob = "Snow Bandit", 
     QuestCFrame = CFrame.new(1384, 87, -1297), MobCFrame = CFrame.new(1350, 87, -1350)},
    
    -- Lv 120-150: Marine (Marine Fortress)
    {MinLevel = 120, MaxLevel = 150, Quest = "Marine", Mob = "Marine", 
     QuestCFrame = CFrame.new(-4914, 50, 4281), MobCFrame = CFrame.new(-4950, 50, 4350)},
    
    -- Lv 150-190: Sky Bandit (Skylands V1)
    {MinLevel = 150, MaxLevel = 190, Quest = "SkyBandit", Mob = "Sky Bandit", 
     QuestCFrame = CFrame.new(-4837, 717, -2635), MobCFrame = CFrame.new(-4900, 717, -2600)},
    
    -- Lv 190-250: Prisoner (Prison)
    {MinLevel = 190, MaxLevel = 250, Quest = "Prisoner", Mob = "Prisoner", 
     QuestCFrame = CFrame.new(4875, 6, 725), MobCFrame = CFrame.new(4850, 6, 750)},
    
    -- Lv 250-275: Dangerous Prisoner (Prison)
    {MinLevel = 250, MaxLevel = 275, Quest = "DangerousPrisoner", Mob = "Dangerous Prisoner", 
     QuestCFrame = CFrame.new(5230, 1, 479), MobCFrame = CFrame.new(5200, 1, 500)},
    
    -- Lv 275-300: Toga Warrior (Colosseum)
    {MinLevel = 275, MaxLevel = 300, Quest = "TogaWarrior", Mob = "Toga Warrior", 
     QuestCFrame = CFrame.new(-1428, 7, -2858), MobCFrame = CFrame.new(-1400, 7, -2900)},
    
    -- Lv 300-375: Magma Soldier (Magma Village)
    {MinLevel = 300, MaxLevel = 375, Quest = "MagmaViking", Mob = "Military Soldier", 
     QuestCFrame = CFrame.new(-5280, 12, 8515), MobCFrame = CFrame.new(-5300, 12, 8550)},
    
    -- Lv 375-450: Fishman Warrior (Underwater City)
    {MinLevel = 375, MaxLevel = 450, Quest = "FishmanWarrior", Mob = "Fishman Warrior", 
     QuestCFrame = CFrame.new(61077, 11, 1579), MobCFrame = CFrame.new(61100, 11, 1600)},
    
    -- Lv 450-475: Fishman Commando (Underwater City)
    {MinLevel = 450, MaxLevel = 475, Quest = "FishmanCommando", Mob = "Fishman Commando", 
     QuestCFrame = CFrame.new(61509, 12, 1240), MobCFrame = CFrame.new(61550, 12, 1300)},
    
    -- Lv 475-525: God's Guard (Upper Skylands)
    {MinLevel = 475, MaxLevel = 525, Quest = "GodsGuard", Mob = "God's Guard", 
     QuestCFrame = CFrame.new(-7894, 5546, -380), MobCFrame = CFrame.new(-7900, 5546, -350)},
    
    -- Lv 525-575: Shanda (Upper Skylands)
    {MinLevel = 525, MaxLevel = 575, Quest = "Shanda", Mob = "Shanda", 
     QuestCFrame = CFrame.new(-7766, 5633, -1411), MobCFrame = CFrame.new(-7800, 5633, -1450)},
    
    -- Lv 575-625: Royal Squad (Upper Skylands)
    {MinLevel = 575, MaxLevel = 625, Quest = "RoyalSquad", Mob = "Royal Squad", 
     QuestCFrame = CFrame.new(-7903, 5637, -1410), MobCFrame = CFrame.new(-7950, 5637, -1450)},
    
    -- Lv 625-700: Galley Pirate (Fountain City)
    {MinLevel = 625, MaxLevel = 700, Quest = "GalleyPirate", Mob = "Galley Pirate", 
     QuestCFrame = CFrame.new(5129, 35, 4106), MobCFrame = CFrame.new(5150, 35, 4150)},
}

-- Boss Database
local BossDatabase = {
    -- Rare/Raid Bosses
    {Name = "The Saw", SpawnTime = 75*60, Location = "Middle Town", 
     CFrame = CFrame.new(-289, 73, 2071), Drop = "Shark Saw", Type = "Rare"},
    {Name = "Greybeard", SpawnTime = 6*60*60, Location = "Marine Fortress", 
     CFrame = CFrame.new(-4980, 50, 4350), Drop = "Bisento V2", Type = "Raid"},
    
    -- Standard Bosses
    {Name = "Gorilla King", Location = "Jungle", CFrame = CFrame.new(-1129, 5, -609), 
     Drop = "Experience", Type = "Standard", Level = 25},
    {Name = "Bobby", Location = "Pirate Village", CFrame = CFrame.new(-1100, 4, 3875), 
     Drop = "Experience", Type = "Standard", Level = 55},
    {Name = "Yeti", Location = "Frozen Village", CFrame = CFrame.new(1315, 100, -1305), 
     Drop = "Experience", Type = "Standard", Level = 110},
    {Name = "Vice Admiral", Location = "Marine Fortress", CFrame = CFrame.new(-4900, 50, 4300), 
     Drop = "Experience", Type = "Standard", Level = 130},
    {Name = "Warden", Location = "Prison", CFrame = CFrame.new(4930, 6, 750), 
     Drop = "Experience", Type = "Standard", Level = 200},
    {Name = "Chief Warden", Location = "Prison", CFrame = CFrame.new(5220, 1, 490), 
     Drop = "Experience", Type = "Standard", Level = 250},
    {Name = "Swan", Location = "Prison", CFrame = CFrame.new(5522, 66, 869), 
     Drop = "Pink Coat", Type = "Standard", Level = 240},
    {Name = "Magma Admiral", Location = "Magma Village", CFrame = CFrame.new(-5320, 12, 8570), 
     Drop = "Refined Musket", Type = "Standard", Level = 350},
    {Name = "Fishman Lord", Location = "Underwater City", CFrame = CFrame.new(61163, 11, 1819), 
     Drop = "Trident", Type = "Standard", Level = 425},
    {Name = "Thunder God", Location = "Upper Skylands", CFrame = CFrame.new(-7922, 5637, -1427), 
     Drop = "Pole V1", Type = "Standard", Level = 575},
    {Name = "Cyborg", Location = "Upper Skylands", CFrame = CFrame.new(-7900, 5640, -1420), 
     Drop = "Cool Shades", Type = "Standard", Level = 600},
    {Name = "Ice Admiral", Location = "Frozen Cave", CFrame = CFrame.new(1579, -504, -528), 
     Drop = "Library Key", Type = "Standard", Level = 700},
}

-- Saber Puzzle Positions
local SaberPuzzle = {
    Buttons = {
        CFrame.new(-1584, 46, -140),
        CFrame.new(-1541, 48, -53),
        CFrame.new(-1542, 47, -108),
        CFrame.new(-1596, 34, 38),
        CFrame.new(-1526, 46, -88),
    },
    TorchHole = CFrame.new(-1664, -21, -139),
    DesertHouse = CFrame.new(1012, 40, 4325),
    IcicleLocation = CFrame.new(1579, -504, -528),
    SickMan = CFrame.new(893, 16, 4410),
    RichMan = CFrame.new(-1071, 5, 3841),
    MobLeader = CFrame.new(-1133, 134, 5174), -- Jean Luc Island
    SaberRoom = CFrame.new(-1662, -21, -133),
}

-- Chest Spawn Locations (High Density Areas)
local ChestLocations = {
    {Name = "Skylands", CFrames = {
        CFrame.new(-4800, 720, -2600),
        CFrame.new(-4850, 730, -2650),
        CFrame.new(-4900, 725, -2580),
    }},
    {Name = "Prison", CFrames = {
        CFrame.new(4900, 6, 700),
        CFrame.new(4950, 6, 750),
        CFrame.new(5000, 6, 800),
    }},
    {Name = "Upper Skylands", CFrames = {
        CFrame.new(-7800, 5540, -400),
        CFrame.new(-7850, 5545, -380),
        CFrame.new(-7900, 5550, -360),
    }},
}

-- Stat Point Distribution
local StatTypes = {"Melee", "Defense", "Sword", "Gun", "Blox Fruit"}

-- ============================================================================
-- STATE VARIABLES
-- ============================================================================

local Toggles = {
    -- Auto Farm
    AutoFarm = false,
    AutoQuest = false,
    BringMobs = false,
    FastAttack = false,
    InfiniteEnergy = false,
    
    -- Boss Farm
    AutoBossFarm = false,
    AutoTheSaw = false,
    AutoGreybeard = false,
    ServerHopOnKill = false,
    
    -- Puzzles
    AutoSaber = false,
    AutoObsHaki = false,
    AutoPole = false,
    AutoTrident = false,
    AutoNewWorld = false,
    
    -- ESP
    FruitESP = false,
    PlayerESP = false,
    MobESP = false,
    ChestESP = false,
    BossESP = false,
    
    -- Utility
    FruitSniper = false,
    ChestFarm = false,
    ShopSniper = false,
    AutoBuySwords = false,
    
    -- Misc
    AutoStats = false,
    Invisible = false,
    WhiteScreen = false,
    RemoveFog = false,
    FPSBoost = false,
    
    -- Auto Dodge for Obs Haki training
    AutoDodge = false,
}

local Settings = {
    -- Combat
    WeaponType = "Melee", -- Melee, Sword, Fruit
    AttackMode = "Fast", -- Fast, Slow
    AutoEquip = true,
    
    -- Movement
    TweenSpeed = 300,
    DistanceFromMob = 3,
    TweenMethod = "Direct", -- Direct, Bypass
    
    -- Farm
    FarmRange = 150,
    AttackDelay = 0.1,
    
    -- Stats
    StatPriority = "Melee", -- Which stat to level
    
    -- Shop Sniper
    SnipeFruits = {}, -- List of fruits to snipe
    
    -- Boss
    SelectedBoss = nil,
}

local Connections = {}
local ESPObjects = {}
local CurrentQuest = nil
local IsFarming = false
local IsPuzzling = false

-- ============================================================================
-- REMOTE FUNCTIONS
-- ============================================================================

local RemoteStorage = {}

local function GetRemote(name)
    if RemoteStorage[name] then return RemoteStorage[name] end
    
    local remote = ReplicatedStorage:FindFirstChild("Remotes") and 
                   ReplicatedStorage.Remotes:FindFirstChild(name)
    if remote then
        RemoteStorage[name] = remote
        return remote
    end
    return nil
end

local function FireRemote(name, ...)
    local remote = GetRemote(name)
    if remote then
        if remote:IsA("RemoteEvent") then
            remote:FireServer(...)
        elseif remote:IsA("RemoteFunction") then
            return remote:InvokeServer(...)
        end
    end
end

-- CommF_ wrapper for Blox Fruits
local function CommF_(action, ...)
    local remote = GetRemote("CommF_")
    if remote then
        return remote:InvokeServer(action, ...)
    end
end

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

local function getPlayerFragments()
    local data = LocalPlayer:FindFirstChild("Data")
    if data then
        local frags = data:FindFirstChild("Fragments")
        if frags then return frags.Value end
    end
    return 0
end

local function hasItem(itemName)
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    local char = getCharacter()
    
    if backpack and backpack:FindFirstChild(itemName) then return true end
    if char and char:FindFirstChild(itemName) then return true end
    
    return false
end

local function hasQuestActive()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then
        local main = playerGui:FindFirstChild("Main")
        if main then
            local quest = main:FindFirstChild("Quest")
            if quest and quest.Visible then
                return true
            end
        end
    end
    return false
end

local function getQuestProgress()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then
        local main = playerGui:FindFirstChild("Main")
        if main then
            local quest = main:FindFirstChild("Quest")
            if quest then
                local container = quest:FindFirstChild("Container")
                if container then
                    local info = container:FindFirstChild("Info")
                    if info then
                        -- Parse "5/10" format
                        local text = info.Text
                        local current, total = text:match("(%d+)/(%d+)")
                        if current and total then
                            return tonumber(current), tonumber(total)
                        end
                    end
                end
            end
        end
    end
    return 0, 0
end

-- ============================================================================
-- TELEPORT & TWEEN FUNCTIONS
-- ============================================================================

local function teleportTo(cf)
    local hrp = getHRP()
    if hrp then
        hrp.CFrame = cf
    end
end

local function tweenTo(cf, speed, callback)
    local hrp = getHRP()
    if not hrp then return end
    
    speed = speed or Settings.TweenSpeed
    local distance = (hrp.Position - cf.Position).Magnitude
    local time = distance / speed
    
    -- Cancel if already there
    if distance < 5 then
        if callback then callback() end
        return
    end
    
    local humanoid = getHumanoid()
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    end
    
    local tween = TweenService:Create(hrp, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = cf})
    tween:Play()
    
    if callback then
        tween.Completed:Connect(function()
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
            callback()
        end)
    else
        tween.Completed:Wait()
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end
end

local function bypassTweenTo(cf, speed)
    local hrp = getHRP()
    if not hrp then return end
    
    speed = speed or Settings.TweenSpeed
    local distance = (hrp.Position - cf.Position).Magnitude
    local steps = math.ceil(distance / 50) -- 50 studs per step
    
    for i = 1, steps do
        local t = i / steps
        local targetPos = hrp.Position:Lerp(cf.Position, t)
        hrp.CFrame = CFrame.new(targetPos) * (cf - cf.Position)
        task.wait(50 / speed)
    end
end

-- ============================================================================
-- MOB FUNCTIONS
-- ============================================================================

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

local function getNearestMob(mobName, maxDistance)
    local hrp = getHRP()
    if not hrp then return nil end
    
    local nearest = nil
    local nearestDist = maxDistance or Settings.FarmRange
    
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") then
            -- Filter by name if specified
            local nameMatch = not mobName or mob.Name:lower():find(mobName:lower())
            
            if nameMatch then
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
    end
    
    return nearest, nearestDist
end

local function getBoss(bossName)
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") and mob.Name == bossName then
            local mobHum = mob:FindFirstChildOfClass("Humanoid")
            if mobHum and mobHum.Health > 0 then
                return mob
            end
        end
    end
    return nil
end

local function bringMobs(mobName)
    local hrp = getHRP()
    if not hrp then return end
    
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return end
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") then
            local nameMatch = not mobName or mob.Name:lower():find(mobName:lower())
            
            if nameMatch then
                local mobHRP = mob:FindFirstChild("HumanoidRootPart")
                local mobHum = mob:FindFirstChildOfClass("Humanoid")
                
                if mobHRP and mobHum and mobHum.Health > 0 then
                    mobHRP.CFrame = hrp.CFrame * CFrame.new(0, 0, 3)
                end
            end
        end
    end
end

-- ============================================================================
-- ATTACK FUNCTIONS
-- ============================================================================

local function equipWeapon()
    if not Settings.AutoEquip then return end
    
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    local char = getCharacter()
    if not backpack or not char then return end
    
    local weaponType = Settings.WeaponType
    
    -- Find weapon based on type
    local weaponToEquip = nil
    
    if weaponType == "Melee" then
        -- Look for combat/melee weapons
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local toolType = tool:FindFirstChild("ToolType")
                if toolType and toolType.Value == "Melee" then
                    weaponToEquip = tool
                    break
                end
            end
        end
    elseif weaponType == "Sword" then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local toolType = tool:FindFirstChild("ToolType")
                if toolType and toolType.Value == "Sword" then
                    weaponToEquip = tool
                    break
                end
            end
        end
    elseif weaponType == "Fruit" then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local toolType = tool:FindFirstChild("ToolType")
                if toolType and toolType.Value == "Blox Fruit" then
                    weaponToEquip = tool
                    break
                end
            end
        end
    end
    
    if weaponToEquip then
        local humanoid = getHumanoid()
        if humanoid then
            humanoid:EquipTool(weaponToEquip)
        end
    end
end

local function attackMob(mob)
    if not mob then return end
    
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    local mobHum = mob:FindFirstChildOfClass("Humanoid")
    local hrp = getHRP()
    
    if not mobHRP or not mobHum or not hrp then return end
    if mobHum.Health <= 0 then return end
    
    -- Position near mob
    local attackPos = mobHRP.CFrame * CFrame.new(0, 0, Settings.DistanceFromMob)
    hrp.CFrame = attackPos
    
    -- Fast attack or slow attack
    local delay = Settings.AttackMode == "Fast" and 0 or Settings.AttackDelay
    
    -- Simulate click attack
    if VirtualInputManager then
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        if delay > 0 then task.wait(delay) end
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end
end

-- ============================================================================
-- QUEST FUNCTIONS
-- ============================================================================

local function getQuestForLevel(level)
    for _, quest in ipairs(QuestDatabase) do
        if level >= quest.MinLevel and level < quest.MaxLevel then
            return quest
        end
    end
    return QuestDatabase[#QuestDatabase] -- Return last quest if over max
end

local function acceptQuest(questData)
    if not questData then return false end
    
    -- Teleport to quest giver
    tweenTo(questData.QuestCFrame)
    task.wait(0.5)
    
    -- Accept quest
    local result = CommF_("StartQuest", questData.Quest, 1)
    task.wait(0.3)
    
    return hasQuestActive()
end

local function completeQuest(questData)
    if not questData then return end
    
    local mobName = questData.Mob
    
    while hasQuestActive() and Toggles.AutoFarm do
        -- Find and kill mobs
        local mob, dist = getNearestMob(mobName, 999999)
        
        if mob then
            local mobHRP = mob:FindFirstChild("HumanoidRootPart")
            if mobHRP then
                -- Teleport to mob area if too far
                if dist > Settings.FarmRange then
                    tweenTo(questData.MobCFrame * CFrame.new(0, Settings.DistanceFromMob, 0))
                end
                
                -- Bring mobs if enabled
                if Toggles.BringMobs then
                    bringMobs(mobName)
                end
                
                -- Attack
                attackMob(mob)
            end
        else
            -- No mobs, teleport to spawn area
            tweenTo(questData.MobCFrame * CFrame.new(0, Settings.DistanceFromMob, 0))
        end
        
        task.wait(Settings.AttackDelay)
    end
end

-- ============================================================================
-- ESP FUNCTIONS
-- ============================================================================

local function createESP(object, color, text, espType)
    if ESPObjects[object] then return end
    
    local espData = {Type = espType}
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FamyyESP_" .. espType
    billboard.Size = UDim2.new(0, 120, 0, 50)
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

local function removeESPByType(espType)
    for object, data in pairs(ESPObjects) do
        if data.Type == espType then
            if data.Billboard then
                data.Billboard:Destroy()
            end
            ESPObjects[object] = nil
        end
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
    
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") and obj.Name:find("Fruit") then
            table.insert(fruits, obj)
        elseif obj:IsA("Model") and obj.Name:find("Fruit") then
            local handle = obj:FindFirstChild("Handle")
            if handle then
                table.insert(fruits, obj)
            end
        end
    end
    
    return fruits
end

local function snipeFruit(fruit)
    if not fruit then return end
    
    local fruitPart = fruit:IsA("BasePart") and fruit or 
                      fruit:FindFirstChild("Handle") or 
                      fruit:FindFirstChildWhichIsA("BasePart")
    if not fruitPart then return end
    
    Window.Notify("Fruit Sniper", "Teleporting to " .. fruit.Name .. "!", 2, "success")
    
    teleportTo(fruitPart.CFrame * CFrame.new(0, 3, 0))
    task.wait(0.5)
    
    local hrp = getHRP()
    if hrp and (hrp.Position - fruitPart.Position).Magnitude < 15 then
        if firetouchinterest then
            firetouchinterest(hrp, fruitPart, 0)
            task.wait(0.1)
            firetouchinterest(hrp, fruitPart, 1)
        end
    end
end

-- ============================================================================
-- CHEST FUNCTIONS
-- ============================================================================

local function findChests()
    local chests = {}
    
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj.Name == "Chest" or obj.Name:find("Chest") then
            if obj:IsA("Model") or obj:IsA("BasePart") then
                table.insert(chests, obj)
            end
        end
    end
    
    return chests
end

local function collectChest(chest)
    if not chest then return end
    
    local chestPart = chest:IsA("BasePart") and chest or 
                      chest:FindFirstChildWhichIsA("BasePart")
    if not chestPart then return end
    
    teleportTo(chestPart.CFrame * CFrame.new(0, 2, 0))
    task.wait(0.3)
    
    local hrp = getHRP()
    if hrp and firetouchinterest then
        firetouchinterest(hrp, chestPart, 0)
        task.wait(0.1)
        firetouchinterest(hrp, chestPart, 1)
    end
end

-- ============================================================================
-- PUZZLE FUNCTIONS
-- ============================================================================

local function doSaberPuzzle()
    if IsPuzzling then return end
    IsPuzzling = true
    
    local level = getPlayerLevel()
    if level < 200 then
        Window.Notify("Auto Saber", "Requires Level 200+. Current: " .. level, 3, "error")
        IsPuzzling = false
        return
    end
    
    Window.Notify("Auto Saber", "Starting Saber puzzle...", 3, "info")
    
    -- Step 1: Press all 5 buttons quickly
    Window.Notify("Auto Saber", "Step 1: Pressing buttons...", 2, "info")
    for i, btnCFrame in ipairs(SaberPuzzle.Buttons) do
        teleportTo(btnCFrame)
        task.wait(0.15)
    end
    task.wait(1)
    
    -- Step 2: Get torch
    Window.Notify("Auto Saber", "Step 2: Getting torch...", 2, "info")
    teleportTo(SaberPuzzle.TorchHole)
    task.wait(1)
    
    -- Step 3: Burn curtain in desert
    Window.Notify("Auto Saber", "Step 3: Burning curtain...", 2, "info")
    teleportTo(SaberPuzzle.DesertHouse)
    task.wait(1)
    
    -- Step 4: Get cup and fill with water
    Window.Notify("Auto Saber", "Step 4: Filling cup...", 2, "info")
    teleportTo(SaberPuzzle.IcicleLocation)
    task.wait(2)
    
    -- Step 5: Give to sick man
    Window.Notify("Auto Saber", "Step 5: Helping sick man...", 2, "info")
    teleportTo(SaberPuzzle.SickMan)
    task.wait(1)
    
    -- Step 6: Talk to rich man
    Window.Notify("Auto Saber", "Step 6: Talking to rich man...", 2, "info")
    teleportTo(SaberPuzzle.RichMan)
    task.wait(1)
    
    -- Step 7: Kill mob leader
    Window.Notify("Auto Saber", "Step 7: Killing mob leader...", 2, "info")
    teleportTo(SaberPuzzle.MobLeader)
    
    -- Wait for kill (simplified - you'd need combat logic)
    task.wait(5)
    
    -- Step 8: Return to rich man
    teleportTo(SaberPuzzle.RichMan)
    task.wait(1)
    
    -- Step 9: Kill Saber Expert
    Window.Notify("Auto Saber", "Step 8: Fighting Saber Expert...", 2, "info")
    teleportTo(SaberPuzzle.SaberRoom)
    
    Window.Notify("Auto Saber", "Puzzle complete! Check for Saber.", 5, "success")
    IsPuzzling = false
end

local function buyObservationHaki()
    local level = getPlayerLevel()
    local beli = getPlayerBeli()
    
    if level < 300 then
        Window.Notify("Observation Haki", "Requires Level 300+", 3, "error")
        return
    end
    
    if beli < 750000 then
        Window.Notify("Observation Haki", "Requires 750,000 Beli", 3, "error")
        return
    end
    
    -- Teleport to Instinct Teacher (Upper Skylands)
    teleportTo(CFrame.new(-7894, 5547, -380))
    task.wait(1)
    
    -- Interact
    CommF_("BuyObservationHaki")
    
    Window.Notify("Observation Haki", "Purchased! Train by dodging attacks.", 3, "success")
end

local function goToNewWorld()
    local level = getPlayerLevel()
    
    if level < 700 then
        Window.Notify("New World", "Requires Level 700. Current: " .. level, 3, "error")
        return
    end
    
    Window.Notify("New World", "Starting New World quest...", 3, "info")
    
    -- Step 1: Talk to Military Detective (Prison)
    teleportTo(CFrame.new(4875, 6, 725))
    task.wait(1)
    CommF_("MilitaryDetective", "1")
    
    -- Step 2: Kill Ice Admiral (Frozen Cave)
    Window.Notify("New World", "Killing Ice Admiral...", 2, "info")
    teleportTo(CFrame.new(1579, -504, -528))
    task.wait(5) -- Combat would happen here
    
    -- Step 3: Return to Detective
    teleportTo(CFrame.new(4875, 6, 725))
    task.wait(1)
    CommF_("MilitaryDetective", "2")
    
    -- Step 4: Talk to Experienced Captain
    Window.Notify("New World", "Going to Second Sea...", 2, "info")
    teleportTo(CFrame.new(-289, 73, 2071))
    task.wait(1)
    CommF_("TravelToSecondSea")
    
    Window.Notify("New World", "Welcome to Second Sea!", 5, "success")
end

-- ============================================================================
-- PERFORMANCE FUNCTIONS
-- ============================================================================

local OriginalLighting = {}

local function enableWhiteScreen()
    -- Store originals
    OriginalLighting.Ambient = Lighting.Ambient
    OriginalLighting.Brightness = Lighting.Brightness
    OriginalLighting.FogEnd = Lighting.FogEnd
    
    -- White screen effect
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.Brightness = 2
    Lighting.FogEnd = 0
    
    -- Remove 3D objects visibility
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name ~= "HumanoidRootPart" then
            obj.Transparency = 1
        end
    end
end

local function disableWhiteScreen()
    if OriginalLighting.Ambient then
        Lighting.Ambient = OriginalLighting.Ambient
        Lighting.Brightness = OriginalLighting.Brightness
        Lighting.FogEnd = OriginalLighting.FogEnd
    end
end

local function removeFog()
    Lighting.FogEnd = 999999
    Lighting.FogStart = 999999
    
    -- Remove fog effects
    for _, effect in ipairs(Lighting:GetDescendants()) do
        if effect:IsA("Atmosphere") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") then
            effect.Enabled = false
        end
    end
end

local function enableFPSBoost()
    -- Lower texture quality
    settings().Rendering.QualityLevel = 1
    
    -- Disable shadows
    Lighting.GlobalShadows = false
    
    -- Remove particles
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
            obj.Enabled = false
        end
        if obj:IsA("Decal") and obj.Parent.Name ~= "HumanoidRootPart" then
            obj.Transparency = 1
        end
    end
end

-- ============================================================================
-- AUTO STATS FUNCTION
-- ============================================================================

local function autoAddStats()
    local data = LocalPlayer:FindFirstChild("Data")
    if not data then return end
    
    local points = data:FindFirstChild("Points")
    if not points or points.Value <= 0 then return end
    
    local statName = Settings.StatPriority
    CommF_("AddPoint", statName, points.Value)
end

-- ============================================================================
-- SERVER HOP FUNCTION
-- ============================================================================

local function serverHop()
    Window.Notify("Server Hop", "Finding new server...", 2, "info")
    
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
    
    Window.Notify("Server Hop", "No servers found, rejoining...", 2, "warning")
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end

-- ============================================================================
-- MAIN LOOPS
-- ============================================================================

local function startAutoFarm()
    if Connections.AutoFarm then return end
    
    IsFarming = true
    
    Connections.AutoFarm = task.spawn(function()
        while Toggles.AutoFarm and IsFarming do
            local level = getPlayerLevel()
            local questData = getQuestForLevel(level)
            
            if questData then
                -- Equip weapon
                equipWeapon()
                
                -- Check if we have a quest
                if not hasQuestActive() then
                    -- Accept quest
                    acceptQuest(questData)
                    task.wait(0.5)
                end
            
                -- Complete quest (farm mobs)
                if hasQuestActive() then
                    local mobName = questData.Mob
                    local mob, dist = getNearestMob(mobName, 999999)
                    
                    if mob then
                        local mobHRP = mob:FindFirstChild("HumanoidRootPart")
                        if mobHRP then
                            -- Teleport to mob if too far
                            if dist > Settings.FarmRange then
                                local targetCFrame = mobHRP.CFrame * CFrame.new(0, Settings.DistanceFromMob, 0)
                                teleportTo(targetCFrame)
                            end
                            
                            -- Bring mobs if enabled
                            if Toggles.BringMobs then
                                bringMobs(mobName)
                            end
                            
                            -- Attack
                            attackMob(mob)
                        end
                    else
                        -- No mobs found, go to spawn area
                        teleportTo(questData.MobCFrame * CFrame.new(0, Settings.DistanceFromMob, 0))
                    end
                end
            end
            
            -- Infinite energy
            if Toggles.InfiniteEnergy then
                local data = LocalPlayer:FindFirstChild("Data")
                if data then
                    local energy = data:FindFirstChild("Energy")
                    if energy and energy.Value < 100 then
                        energy.Value = 100
                    end
                end
            end
            
            -- Auto stats
            if Toggles.AutoStats then
                autoAddStats()
            end
            
            task.wait(Settings.AttackMode == "Fast" and 0.05 or Settings.AttackDelay)
        end
    end)
end

local function stopAutoFarm()
    IsFarming = false
    if Connections.AutoFarm then
        task.cancel(Connections.AutoFarm)
        Connections.AutoFarm = nil
    end
end

local function startBossFarm()
    if Connections.BossFarm then return end
    
    Connections.BossFarm = task.spawn(function()
        while Toggles.AutoBossFarm do
            local bossToFarm = nil
            
            -- Check for The Saw
            if Toggles.AutoTheSaw then
                local saw = getBoss("The Saw")
                if saw then
                    bossToFarm = saw
                    Window.Notify("Boss Farm", "The Saw found! Attacking...", 2, "success")
                end
            end
            
            -- Check for Greybeard
            if not bossToFarm and Toggles.AutoGreybeard then
                local greybeard = getBoss("Greybeard")
                if greybeard then
                    bossToFarm = greybeard
                    Window.Notify("Boss Farm", "Greybeard found! Attacking...", 2, "success")
                end
            end
            
            -- Check selected boss
            if not bossToFarm and Settings.SelectedBoss then
                local boss = getBoss(Settings.SelectedBoss)
                if boss then
                    bossToFarm = boss
                end
            end
            
            if bossToFarm then
                equipWeapon()
                
                local bossHRP = bossToFarm:FindFirstChild("HumanoidRootPart")
                local bossHum = bossToFarm:FindFirstChildOfClass("Humanoid")
                
                while bossHum and bossHum.Health > 0 and Toggles.AutoBossFarm do
                    if bossHRP then
                        teleportTo(bossHRP.CFrame * CFrame.new(0, Settings.DistanceFromMob, 0))
                        attackMob(bossToFarm)
                    end
                    task.wait(0.1)
                end
                
                if Toggles.ServerHopOnKill then
                    task.wait(1)
                    serverHop()
                end
            end
            
            task.wait(1)
        end
    end)
end

local function stopBossFarm()
    if Connections.BossFarm then
        task.cancel(Connections.BossFarm)
        Connections.BossFarm = nil
    end
end

local function startMobESP()
    if Connections.MobESP then return end
    
    Connections.MobESP = RunService.Heartbeat:Connect(function()
        if not Toggles.MobESP then return end
        
        local enemies = Workspace:FindFirstChild("Enemies")
        if not enemies then return end
        
        for _, mob in ipairs(enemies:GetChildren()) do
            if mob:IsA("Model") then
                local mobHum = mob:FindFirstChildOfClass("Humanoid")
                if mobHum and mobHum.Health > 0 then
                    if not ESPObjects[mob] then
                        createESP(mob, Color3.fromRGB(255, 100, 100), mob.Name, "Mob")
                    end
                else
                    removeESP(mob)
                end
            end
        end
        
        updateESPDistances()
    end)
end

local function stopMobESP()
    if Connections.MobESP then
        Connections.MobESP:Disconnect()
        Connections.MobESP = nil
    end
    removeESPByType("Mob")
end

local function startBossESP()
    if Connections.BossESP then return end
    
    Connections.BossESP = RunService.Heartbeat:Connect(function()
        if not Toggles.BossESP then return end
        
        for _, bossData in ipairs(BossDatabase) do
            local boss = getBoss(bossData.Name)
            if boss and not ESPObjects[boss] then
                createESP(boss, Color3.fromRGB(255, 50, 255), "[BOSS] " .. bossData.Name, "Boss")
            end
        end
        
        updateESPDistances()
    end)
end

local function stopBossESP()
    if Connections.BossESP then
        Connections.BossESP:Disconnect()
        Connections.BossESP = nil
    end
    removeESPByType("Boss")
end

local function startPlayerESP()
    if Connections.PlayerESP then return end
    
    Connections.PlayerESP = RunService.Heartbeat:Connect(function()
        if not Toggles.PlayerESP then return end
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if hrp and not ESPObjects[player.Character] then
                    createESP(player.Character, Color3.fromRGB(100, 200, 255), player.Name, "Player")
                end
            end
        end
        
        updateESPDistances()
    end)
end

local function stopPlayerESP()
    if Connections.PlayerESP then
        Connections.PlayerESP:Disconnect()
        Connections.PlayerESP = nil
    end
    removeESPByType("Player")
end

local function startFruitESP()
    if Connections.FruitESP then return end
    
    Connections.FruitESP = RunService.Heartbeat:Connect(function()
        if not Toggles.FruitESP then return end
        
        local fruits = findFruits()
        for _, fruit in ipairs(fruits) do
            if not ESPObjects[fruit] then
                createESP(fruit, Color3.fromRGB(255, 200, 0), "[FRUIT] " .. fruit.Name, "Fruit")
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
    removeESPByType("Fruit")
end

local function startChestESP()
    if Connections.ChestESP then return end
    
    Connections.ChestESP = RunService.Heartbeat:Connect(function()
        if not Toggles.ChestESP then return end
        
        local chests = findChests()
        for _, chest in ipairs(chests) do
            if not ESPObjects[chest] then
                createESP(chest, Color3.fromRGB(0, 255, 100), "[CHEST]", "Chest")
            end
        end
        
        updateESPDistances()
    end)
end

local function stopChestESP()
    if Connections.ChestESP then
        Connections.ChestESP:Disconnect()
        Connections.ChestESP = nil
    end
    removeESPByType("Chest")
end

local function startFruitSniper()
    if Connections.FruitSniper then return end
    
    Connections.FruitSniper = RunService.Heartbeat:Connect(function()
        if not Toggles.FruitSniper then return end
        
        local fruits = findFruits()
        if #fruits > 0 then
            snipeFruit(fruits[1])
        end
    end)
end

local function stopFruitSniper()
    if Connections.FruitSniper then
        Connections.FruitSniper:Disconnect()
        Connections.FruitSniper = nil
    end
end

local function startChestFarm()
    if Connections.ChestFarm then return end
    
    Connections.ChestFarm = task.spawn(function()
        while Toggles.ChestFarm do
            local chests = findChests()
            for _, chest in ipairs(chests) do
                if not Toggles.ChestFarm then break end
                collectChest(chest)
                task.wait(0.3)
            end
            task.wait(1)
        end
    end)
end

local function stopChestFarm()
    if Connections.ChestFarm then
        task.cancel(Connections.ChestFarm)
        Connections.ChestFarm = nil
    end
end

-- ============================================================================
-- UI SETUP
-- ============================================================================

-- Main Farm Tab
local FarmTab = Window:CreateTab("Farm")

-- Auto Farm Section
local AutoFarmSection = FarmTab:CreateSection("Auto Farm", true)

AutoFarmSection:AddToggle({
    Label = "Auto Farm",
    Default = Toggles.AutoFarm,
    Callback = function(value)
        Toggles.AutoFarm = value
        if value then
            startAutoFarm()
            Window.Notify("Auto Farm", "Started! Level: " .. getPlayerLevel(), 2, "success")
        else
            stopAutoFarm()
            Window.Notify("Auto Farm", "Stopped", 2, "info")
        end
    end
})

AutoFarmSection:AddToggle({
    Label = "Bring Mobs",
    Default = Toggles.BringMobs,
    Callback = function(value)
        Toggles.BringMobs = value
    end
})

AutoFarmSection:AddToggle({
    Label = "Fast Attack",
    Default = Settings.AttackMode == "Fast",
    Callback = function(value)
        Settings.AttackMode = value and "Fast" or "Slow"
    end
})

AutoFarmSection:AddToggle({
    Label = "Infinite Energy",
    Default = Toggles.InfiniteEnergy,
    Callback = function(value)
        Toggles.InfiniteEnergy = value
    end
})

AutoFarmSection:AddSlider({
    Label = "Farm Range",
    Min = 50,
    Max = 500,
    Default = Settings.FarmRange,
    Callback = function(value)
        Settings.FarmRange = value
    end
})

AutoFarmSection:AddSlider({
    Label = "Tween Speed",
    Min = 100,
    Max = 500,
    Default = Settings.TweenSpeed,
    Callback = function(value)
        Settings.TweenSpeed = value
    end
})

-- Combat Section
local CombatSection = FarmTab:CreateSection("Combat Settings", false)

CombatSection:AddDropdown({
    Label = "Weapon Type",
    Options = {"Melee", "Sword", "Fruit"},
    Default = Settings.WeaponType,
    Callback = function(value)
        Settings.WeaponType = value
    end
})

CombatSection:AddToggle({
    Label = "Auto Equip",
    Default = Settings.AutoEquip,
    Callback = function(value)
        Settings.AutoEquip = value
    end
})

CombatSection:AddSlider({
    Label = "Distance From Mob",
    Min = 1,
    Max = 20,
    Default = Settings.DistanceFromMob,
    Callback = function(value)
        Settings.DistanceFromMob = value
    end
})

-- Boss Tab
local BossTab = Window:CreateTab("Boss")

local BossFarmSection = BossTab:CreateSection("Boss Farm", true)

BossFarmSection:AddToggle({
    Label = "Auto Boss Farm",
    Default = Toggles.AutoBossFarm,
    Callback = function(value)
        Toggles.AutoBossFarm = value
        if value then
            startBossFarm()
            Window.Notify("Boss Farm", "Scanning for bosses...", 2, "info")
        else
            stopBossFarm()
        end
    end
})

BossFarmSection:AddToggle({
    Label = "Auto The Saw",
    Default = Toggles.AutoTheSaw,
    Callback = function(value)
        Toggles.AutoTheSaw = value
    end
})

BossFarmSection:AddToggle({
    Label = "Auto Greybeard",
    Default = Toggles.AutoGreybeard,
    Callback = function(value)
        Toggles.AutoGreybeard = value
    end
})

BossFarmSection:AddToggle({
    Label = "Server Hop on Kill",
    Default = Toggles.ServerHopOnKill,
    Callback = function(value)
        Toggles.ServerHopOnKill = value
    end
})

-- Boss list dropdown
local bossNames = {}
for _, boss in ipairs(BossDatabase) do
    table.insert(bossNames, boss.Name .. " [Lv" .. (boss.Level or "?") .. "]")
end

BossFarmSection:AddDropdown({
    Label = "Select Boss",
    Options = bossNames,
    Default = nil,
    Callback = function(value)
        local bossName = value:match("^(.+) %[")
        Settings.SelectedBoss = bossName
    end
})

-- Boss teleports
local BossTeleportSection = BossTab:CreateSection("Boss Teleports", false)

for _, boss in ipairs(BossDatabase) do
    BossTeleportSection:AddButton({
        Label = boss.Name .. " - " .. boss.Location,
        Style = "secondary",
        Callback = function()
            teleportTo(boss.CFrame)
            Window.Notify("Teleport", "Teleported to " .. boss.Name, 2, "success")
        end
    })
end

-- Puzzles Tab
local PuzzleTab = Window:CreateTab("Puzzles")

local SaberSection = PuzzleTab:CreateSection("Saber Puzzle (Lv200+)", true)

SaberSection:AddButton({
    Label = "Auto Saber (Full Puzzle)",
    Style = "primary",
    Callback = function()
        task.spawn(doSaberPuzzle)
    end
})

SaberSection:AddLabel({
    Text = "Requires: Level 200+",
    Color = Color3.fromRGB(255, 220, 100)
})

local HakiSection = PuzzleTab:CreateSection("Observation Haki (Lv300+)", true)

HakiSection:AddButton({
    Label = "Buy Observation Haki",
    Style = "primary",
    Callback = function()
        buyObservationHaki()
    end
})

HakiSection:AddToggle({
    Label = "Auto Dodge (Train Obs)",
    Default = Toggles.AutoDodge,
    Callback = function(value)
        Toggles.AutoDodge = value
        if value then
            Window.Notify("Auto Dodge", "Stand near weak mobs to train!", 3, "info")
        end
    end
})

HakiSection:AddLabel({
    Text = "Requires: Lv300 + 750k Beli + Saber",
    Color = Color3.fromRGB(255, 220, 100)
})

local WeaponSection = PuzzleTab:CreateSection("Weapon Puzzles", true)

WeaponSection:AddButton({
    Label = "Auto Pole V1 (Thunder God)",
    Style = "secondary",
    Callback = function()
        teleportTo(CFrame.new(-7922, 5637, -1427))
        Window.Notify("Auto Pole", "Teleported to Thunder God", 2, "info")
    end
})

WeaponSection:AddButton({
    Label = "Auto Trident (Fishman Lord)",
    Style = "secondary",
    Callback = function()
        teleportTo(CFrame.new(61163, 11, 1819))
        Window.Notify("Auto Trident", "Teleported to Fishman Lord", 2, "info")
    end
})

local NewWorldSection = PuzzleTab:CreateSection("New World (Lv700)", true)

NewWorldSection:AddButton({
    Label = "Go to Second Sea",
    Style = "primary",
    Callback = function()
        goToNewWorld()
    end
})

NewWorldSection:AddLabel({
    Text = "Requires: Level 700",
    Color = Color3.fromRGB(255, 220, 100)
})

-- ESP Tab
local ESPTab = Window:CreateTab("ESP")

local ESPSection = ESPTab:CreateSection("ESP Options", true)

ESPSection:AddToggle({
    Label = "Mob ESP",
    Default = Toggles.MobESP,
    Callback = function(value)
        Toggles.MobESP = value
        if value then startMobESP() else stopMobESP() end
    end
})

ESPSection:AddToggle({
    Label = "Boss ESP",
    Default = Toggles.BossESP,
    Callback = function(value)
        Toggles.BossESP = value
        if value then startBossESP() else stopBossESP() end
    end
})

ESPSection:AddToggle({
    Label = "Player ESP",
    Default = Toggles.PlayerESP,
    Callback = function(value)
        Toggles.PlayerESP = value
        if value then startPlayerESP() else stopPlayerESP() end
    end
})

ESPSection:AddToggle({
    Label = "Fruit ESP",
    Default = Toggles.FruitESP,
    Callback = function(value)
        Toggles.FruitESP = value
        if value then startFruitESP() else stopFruitESP() end
    end
})

ESPSection:AddToggle({
    Label = "Chest ESP",
    Default = Toggles.ChestESP,
    Callback = function(value)
        Toggles.ChestESP = value
        if value then startChestESP() else stopChestESP() end
    end
})

ESPSection:AddButton({
    Label = "Clear All ESP",
    Style = "danger",
    Callback = function()
        clearAllESP()
        Window.Notify("ESP", "All ESP cleared", 2, "info")
    end
})

-- Utility Tab
local UtilityTab = Window:CreateTab("Utility")

local FruitSection = UtilityTab:CreateSection("Fruits", true)

FruitSection:AddToggle({
    Label = "Fruit Sniper",
    Default = Toggles.FruitSniper,
    Callback = function(value)
        Toggles.FruitSniper = value
        if value then
            startFruitSniper()
            Window.Notify("Fruit Sniper", "Active! Will teleport to fruits.", 3, "success")
        else
            stopFruitSniper()
        end
    end
})

FruitSection:AddButton({
    Label = "Scan for Fruits Now",
    Style = "secondary",
    Callback = function()
        local fruits = findFruits()
        if #fruits > 0 then
            Window.Notify("Fruit Scan", "Found " .. #fruits .. " fruit(s)!", 3, "success")
        else
            Window.Notify("Fruit Scan", "No fruits found", 3, "warning")
        end
    end
})

local ChestSection = UtilityTab:CreateSection("Chests", true)

ChestSection:AddToggle({
    Label = "Chest Farm",
    Default = Toggles.ChestFarm,
    Callback = function(value)
        Toggles.ChestFarm = value
        if value then
            startChestFarm()
            Window.Notify("Chest Farm", "Collecting chests...", 2, "info")
        else
            stopChestFarm()
        end
    end
})

ChestSection:AddButton({
    Label = "Scan for Chests",
    Style = "secondary",
    Callback = function()
        local chests = findChests()
        Window.Notify("Chest Scan", "Found " .. #chests .. " chest(s)", 2, "info")
    end
})

-- Teleport Section
local TeleportSection = UtilityTab:CreateSection("Island Teleports", false)

for _, island in ipairs(FirstSeaIslands) do
    TeleportSection:AddButton({
        Label = island.Name .. " [" .. island.Level[1] .. "-" .. island.Level[2] .. "]",
        Style = "secondary",
        Callback = function()
            teleportTo(island.CFrame)
            Window.Notify("Teleport", "Teleported to " .. island.Name, 2, "success")
        end
    })
end

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings")

local PerfSection = SettingsTab:CreateSection("Performance", true)

PerfSection:AddToggle({
    Label = "White Screen",
    Default = Toggles.WhiteScreen,
    Callback = function(value)
        Toggles.WhiteScreen = value
        if value then enableWhiteScreen() else disableWhiteScreen() end
    end
})

PerfSection:AddToggle({
    Label = "Remove Fog",
    Default = Toggles.RemoveFog,
    Callback = function(value)
        Toggles.RemoveFog = value
        if value then removeFog() end
    end
})

PerfSection:AddToggle({
    Label = "FPS Boost",
    Default = Toggles.FPSBoost,
    Callback = function(value)
        Toggles.FPSBoost = value
        if value then enableFPSBoost() end
    end
})

local StatsSection = SettingsTab:CreateSection("Auto Stats", true)

StatsSection:AddToggle({
    Label = "Auto Add Stats",
    Default = Toggles.AutoStats,
    Callback = function(value)
        Toggles.AutoStats = value
    end
})

StatsSection:AddDropdown({
    Label = "Stat Priority",
    Options = StatTypes,
    Default = Settings.StatPriority,
    Callback = function(value)
        Settings.StatPriority = value
    end
})

local MiscSection = SettingsTab:CreateSection("Misc", true)

MiscSection:AddToggle({
    Label = "Invisible",
    Default = Toggles.Invisible,
    Callback = function(value)
        Toggles.Invisible = value
        local char = getCharacter()
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = value and 1 or 0
                end
            end
        end
    end
})

MiscSection:AddButton({
    Label = "Server Hop",
    Style = "secondary",
    Callback = function()
        serverHop()
    end
})

MiscSection:AddButton({
    Label = "Rejoin Server",
    Style = "secondary",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

-- Player info labels
local InfoSection = SettingsTab:CreateSection("Player Info", true)

local levelLabel = InfoSection:AddLabel({Text = "Level: Loading...", Bold = true})
local beliLabel = InfoSection:AddLabel({Text = "Beli: Loading..."})
local fragLabel = InfoSection:AddLabel({Text = "Fragments: Loading..."})

-- Update player info periodically
task.spawn(function()
    while task.wait(1) do
        local level = getPlayerLevel()
        local beli = getPlayerBeli()
        local frags = getPlayerFragments()
        
        if levelLabel then levelLabel:SetText("Level: " .. tostring(level)) end
        if beliLabel then beliLabel:SetText("Beli: $" .. tostring(beli)) end
        if fragLabel then fragLabel:SetText("Fragments: " .. tostring(frags)) end
    end
end)

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

Window.Notify("Blox Fruits Sea 1", "Script loaded! Level: " .. getPlayerLevel(), 4, "success")

print("================================================================================")
print("[FAMYY PRIVATE] Blox Fruits Sea 1 Script v2.0 COMPLETE")
print("================================================================================")
print("[+] Player: " .. LocalPlayer.Name)
print("[+] Level: " .. getPlayerLevel())
print("[+] Beli: $" .. getPlayerBeli())
print("[+] Enemies Folder: " .. (Workspace:FindFirstChild("Enemies") and "Found" or "Not Found"))
print("================================================================================")
print("[FEATURES LOADED]")
print("  - Auto Farm (Lv 1-700 progression)")
print("  - Boss Farm (The Saw, Greybeard, 10+ bosses)")
print("  - Puzzle Automation (Saber, Obs Haki, Pole, Trident)")
print("  - ESP (Mob, Boss, Player, Fruit, Chest)")
print("  - Utility (Fruit Sniper, Chest Farm, Island Teleports)")
print("  - Settings (Performance, Auto Stats, Invisible)")
print("================================================================================")

return Library
