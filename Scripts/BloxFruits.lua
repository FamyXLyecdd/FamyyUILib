--[[
    ██████╗ ██╗      ██████╗ ██╗  ██╗    ███████╗██████╗ ██╗   ██╗██╗████████╗███████╗
    ██╔══██╗██║     ██╔═══██╗╚██╗██╔╝    ██╔════╝██╔══██╗██║   ██║██║╚══██╔══╝██╔════╝
    ██████╔╝██║     ██║   ██║ ╚███╔╝     █████╗  ██████╔╝██║   ██║██║   ██║   ███████╗
    ██╔══██╗██║     ██║   ██║ ██╔██╗     ██╔══╝  ██╔══██╗██║   ██║██║   ██║   ╚════██║
    ██████╔╝███████╗╚██████╔╝██╔╝ ██╗    ██║     ██║  ██║╚██████╔╝██║   ██║   ███████║
    ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝   ╚═╝   ╚══════╝
    
    FAMYY PRIVATE - Blox Fruits Sea 1 Complete Script v4.0
    
    ================================================================================
    COMPLETE SEA 1 FEATURES - NO FRAGMENTS/MICROCHIPS (Sea 2+ content excluded)
    ================================================================================
    
    [MAIN FARM] Auto Farm, Quest System, Mastery, Fighting Styles
    [SEA 1 ITEMS] Saber, Pole, Trident, Accessories, Haki
    [STATS] Auto allocate stats
    [COMBAT] Kill Aura, Aimbot, Infinite Energy
    [TELEPORT] All Sea 1 Islands
    [ESP] Players, Mobs, Fruits, Chests, Bosses
    [PLAYER] Speed, Jump, Fly, NoClip
    [MISC] Chest Farm, Fruit Sniper, Server Hop
    
    ================================================================================
]]

-- ============================================================================
-- SERVICES
-- ============================================================================

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer

-- ============================================================================
-- WAIT FOR GAME TO LOAD
-- ============================================================================

repeat task.wait() until LocalPlayer.Character
repeat task.wait() until LocalPlayer:FindFirstChild("Data")
repeat task.wait() until Workspace:FindFirstChild("Enemies")

-- ============================================================================
-- LOAD UI LIBRARY
-- ============================================================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/FamyyLib.lua"))()
local Window = Library.Window

-- ============================================================================
-- CORE GAME REFERENCES
-- ============================================================================

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_ = Remotes:WaitForChild("CommF_")
local CommE = Remotes:FindFirstChild("CommE")

-- Safe remote invoke
local function invokeRemote(arg1, arg2, arg3, arg4, arg5)
    local success, result = pcall(function()
        return CommF_:InvokeServer(arg1, arg2, arg3, arg4, arg5)
    end)
    return success and result or nil
end

-- Safe remote fire
local function fireRemote(remote, arg1, arg2, arg3)
    pcall(function()
        remote:FireServer(arg1, arg2, arg3)
    end)
end

-- Get player data value
local function getDataValue(name)
    local data = LocalPlayer:FindFirstChild("Data")
    if data then
        local value = data:FindFirstChild(name)
        if value then return value.Value end
    end
    return nil
end

local function getLevel() return getDataValue("Level") or 1 end
local function getBeli() return getDataValue("Beli") or 0 end
local function getExp() return getDataValue("Exp") or 0 end
local function getPoints() return getDataValue("Points") or 0 end
local function getRace() return getDataValue("Race") or "Human" end
local function getDevilFruit() return getDataValue("DevilFruit") or "" end

-- ============================================================================
-- COMPLETE SEA 1 DATABASE
-- ============================================================================

-- Quest and Mob Data (Level Min, Level Max, Quest Name, Mob Name, Quest NPC Position, Mob Spawn Area)
local Sea1Quests = {
    {Min = 0, Max = 10, Quest = "Bandit", Mob = "Bandit", QuestNPC = CFrame.new(1059, 17, 1547), MobArea = CFrame.new(1096, 17, 1602)},
    {Min = 10, Max = 15, Quest = "Monkey", Mob = "Monkey", QuestNPC = CFrame.new(-1600, 36, 150), MobArea = CFrame.new(-1448, 51, 53)},
    {Min = 15, Max = 30, Quest = "Gorilla", Mob = "Gorilla", QuestNPC = CFrame.new(-1139, 14, -520), MobArea = CFrame.new(-1091, 14, -577)},
    {Min = 30, Max = 60, Quest = "Pirate", Mob = "Pirate", QuestNPC = CFrame.new(-1141, 4, 3830), MobArea = CFrame.new(-1105, 4, 3873)},
    {Min = 60, Max = 90, Quest = "BuggyPirate", Mob = "Brute", QuestNPC = CFrame.new(-1141, 4, 3830), MobArea = CFrame.new(-1164, 4, 3874)},
    {Min = 90, Max = 120, Quest = "DesertBandit", Mob = "Desert Bandit", QuestNPC = CFrame.new(894, 7, 4391), MobArea = CFrame.new(1079, 6, 4128)},
    {Min = 120, Max = 150, Quest = "DesertOfficer", Mob = "Desert Officer", QuestNPC = CFrame.new(894, 7, 4391), MobArea = CFrame.new(1542, 12, 4436)},
    {Min = 150, Max = 180, Quest = "SnowBandit", Mob = "Snow Bandit", QuestNPC = CFrame.new(1386, 87, -1296), MobArea = CFrame.new(1364, 87, -1274)},
    {Min = 180, Max = 210, Quest = "SnowOfficer", Mob = "Snowman", QuestNPC = CFrame.new(1386, 87, -1296), MobArea = CFrame.new(1238, 139, -1487)},
    {Min = 210, Max = 250, Quest = "MarineCadet", Mob = "Marine Rear Admiral", QuestNPC = CFrame.new(-4914, 50, 4279), MobArea = CFrame.new(-4847, 56, 4334)},
    {Min = 250, Max = 275, Quest = "MarineRecruit", Mob = "Marine Captain", QuestNPC = CFrame.new(-4914, 50, 4279), MobArea = CFrame.new(-4915, 78, 4388)},
    {Min = 275, Max = 300, Quest = "SkyBandit", Mob = "Sky Bandit", QuestNPC = CFrame.new(-4841, 717, -2623), MobArea = CFrame.new(-4944, 717, -2804)},
    {Min = 300, Max = 330, Quest = "DarkMaster", Mob = "Dark Master", QuestNPC = CFrame.new(-4841, 717, -2623), MobArea = CFrame.new(-5126, 304, -2863)},
    {Min = 330, Max = 375, Quest = "Prisoner", Mob = "Prisoner", QuestNPC = CFrame.new(4878, 6, 745), MobArea = CFrame.new(4949, 6, 735)},
    {Min = 375, Max = 400, Quest = "DangerousPrisoner", Mob = "Dangerous Prisoner", QuestNPC = CFrame.new(5228, 1, 479), MobArea = CFrame.new(5190, 1, 558)},
    {Min = 400, Max = 450, Quest = "TorturedPrisoner", Mob = "Scared Prisoner", QuestNPC = CFrame.new(5228, 1, 479), MobArea = CFrame.new(5365, 1, 476)},
    {Min = 450, Max = 475, Quest = "Gladiator", Mob = "Toga Warrior", QuestNPC = CFrame.new(-1581, 7, -2986), MobArea = CFrame.new(-1430, 8, -2823)},
    {Min = 475, Max = 525, Quest = "MagmaNinja", Mob = "Military Soldier", QuestNPC = CFrame.new(-5314, 12, 8516), MobArea = CFrame.new(-5471, 12, 8520)},
    {Min = 525, Max = 550, Quest = "MagmaSoldier", Mob = "Military Spy", QuestNPC = CFrame.new(-5314, 12, 8516), MobArea = CFrame.new(-5657, 46, 8640)},
    {Min = 550, Max = 625, Quest = "FishmanWarrior", Mob = "Fishman Warrior", QuestNPC = CFrame.new(61076, 12, 1580), MobArea = CFrame.new(61235, 12, 1585)},
    {Min = 625, Max = 675, Quest = "FishmanCommando", Mob = "Fishman Commando", QuestNPC = CFrame.new(61509, 12, 1241), MobArea = CFrame.new(61634, 12, 1298)},
    {Min = 675, Max = 700, Quest = "GodGuard", Mob = "God's Guard", QuestNPC = CFrame.new(-7862, 5546, -380), MobArea = CFrame.new(-7920, 5546, -507)},
    {Min = 700, Max = 750, Quest = "Shanda", Mob = "Shanda", QuestNPC = CFrame.new(-7862, 5546, -380), MobArea = CFrame.new(-7950, 5546, -600)},
}

-- All Sea 1 Bosses
local Sea1Bosses = {
    {Name = "Gorilla King", Level = 25, CFrame = CFrame.new(-1129, 16, -605), SpawnTime = 0},
    {Name = "Bobby", Level = 55, CFrame = CFrame.new(-1175, 5, 3810), SpawnTime = 0},
    {Name = "Yeti", Level = 110, CFrame = CFrame.new(1195, 138, -1355), SpawnTime = 0},
    {Name = "Mob Leader", Level = 120, CFrame = CFrame.new(-1134, 136, 5175), SpawnTime = 0},
    {Name = "Vice Admiral", Level = 130, CFrame = CFrame.new(-4847, 78, 4349), SpawnTime = 0},
    {Name = "Warden", Level = 175, CFrame = CFrame.new(5299, 1, 474), SpawnTime = 0},
    {Name = "Chief Warden", Level = 200, CFrame = CFrame.new(5579, 1, 314), SpawnTime = 0},
    {Name = "Swan", Level = 225, CFrame = CFrame.new(5522, 66, 869), SpawnTime = 0},
    {Name = "Saber Expert", Level = 200, CFrame = CFrame.new(-1447, 30, -30), SpawnTime = 0},
    {Name = "Magma Admiral", Level = 350, CFrame = CFrame.new(-5765, 49, 8882), SpawnTime = 0},
    {Name = "Fishman Lord", Level = 425, CFrame = CFrame.new(61365, 23, 1113), SpawnTime = 0},
    {Name = "Wysper", Level = 500, CFrame = CFrame.new(-7946, 5635, -1211), SpawnTime = 0},
    {Name = "Thunder God", Level = 575, CFrame = CFrame.new(-7920, 5635, -1427), SpawnTime = 0},
    -- Rare Bosses
    {Name = "The Saw", Level = 100, CFrame = CFrame.new(-292, 72, 2076), SpawnTime = 75*60, Rare = true},
    {Name = "Greybeard", Level = 750, CFrame = CFrame.new(-4988, 78, 4380), SpawnTime = 6*60*60, Rare = true},
    {Name = "Ice Admiral", Level = 700, CFrame = CFrame.new(1579, -480, -528), SpawnTime = 20*60, Rare = true},
}

-- Sea 1 Islands (from dump)
local Sea1Islands = {
    {Name = "Starter Island", CFrame = CFrame.new(1085, 62, 1237)},
    {Name = "Jungle", CFrame = CFrame.new(-1761, 28, -271)},
    {Name = "Pirate Village", CFrame = CFrame.new(-1321, 59, 3958)},
    {Name = "Desert", CFrame = CFrame.new(907, 49, 4134)},
    {Name = "Frozen Village", CFrame = CFrame.new(1336, 84, -1332)},
    {Name = "Marine Fortress", CFrame = CFrame.new(-5296, 81, 4456)},
    {Name = "Middle Island", CFrame = CFrame.new(-2880, 46, 5292)},
    {Name = "Skylands", CFrame = CFrame.new(-4851, 763, -2633)},
    {Name = "Upper Skylands", CFrame = CFrame.new(-8034, 5651, -1994)},
    {Name = "Prison", CFrame = CFrame.new(4878, 47, 685)},
    {Name = "Colosseum", CFrame = CFrame.new(-1544, 51, -3018)},
    {Name = "Magma Village", CFrame = CFrame.new(-5446, 113, 8806)},
    {Name = "Underwater City", CFrame = CFrame.new(61352, 64, 1502)},
    {Name = "Fountain City", CFrame = CFrame.new(6191, 53, 3945)},
    {Name = "Blox Fruit Dealer", CFrame = CFrame.new(-2534, 5, 2060)},
    {Name = "Blox Fruit Gacha", CFrame = CFrame.new(-1442, 61, 4)},
}

-- Special NPCs and Items locations
local SpecialLocations = {
    -- Haki
    {Name = "Buso Trainer (Armament)", CFrame = CFrame.new(-1138, 14, -520), Cost = 25000, Level = 80},
    {Name = "Ken Trainer (Observation)", CFrame = CFrame.new(-7894, 5580, -380), Cost = 750000, Level = 300},
    -- Abilities
    {Name = "Ability Teacher (Geppo/Soru)", CFrame = CFrame.new(-5314, 12, 8516), GeppoCost = 10000, SoruCost = 100000},
    -- Fighting Styles
    {Name = "Dark Step Trainer", CFrame = CFrame.new(-1141, 4, 3830), Cost = 150000},
    {Name = "Electric Trainer", CFrame = CFrame.new(-4841, 717, -2623), Cost = 500000},
    {Name = "Water Kung Fu Trainer", CFrame = CFrame.new(61076, -50, 1580), Cost = 750000},
    -- Accessories
    {Name = "Black Cape", CFrame = CFrame.new(-379, 85, 2088)},
    {Name = "Tomoe Ring", CFrame = CFrame.new(-4900, 100, 4350)},
    {Name = "Pipe", CFrame = CFrame.new(-1280, 50, 3950)},
}

-- Weapon types for auto-equip
local WeaponTypes = {
    Melee = {"Combat", "Dark Step", "Electro", "Water Kung Fu", "Dragon Breath", "Superhuman", "Death Step", "Sharkman Karate", "Electric Claw", "Dragon Talon", "Godhuman"},
    Sword = {"Cutlass", "Katana", "Pipe", "Dual Katana", "Iron Mace", "Triple Katana", "Dual-Headed Blade", "Bisento", "Trident", "Soul Cane", "Saber", "Pole (1st Form)", "Pole (2nd Form)", "Shisui", "Saddi", "Wando", "Shark Saw"},
    Gun = {"Slingshot", "Musket", "Flintlock", "Cannon", "Refined Slingshot", "Refined Flintlock", "Kabucha", "Serpent Bow"},
    Fruit = {}, -- Will be filled dynamically
}

-- ============================================================================
-- STATE & SETTINGS
-- ============================================================================

local State = {
    -- Main Farm
    AutoFarm = false,
    AutoFarmNearest = false,
    AutoQuest = true,
    BringMobs = true, -- ON by default
    FreezeMobs = true, -- ON by default
    KillAura = true, -- ON by default
    HitboxExpand = true, -- ON by default
    SafeMode = false,
    FastAttack = true,
    AntiStuck = true,
    
    -- Weapon
    SelectedWeaponType = "Melee",
    AutoEquip = true,
    
    -- Mastery
    MasteryFarmSword = false,
    MasteryFarmGun = false,
    MasteryFarmFruit = false,
    MasteryHealthThreshold = 30,
    
    -- Fighting Styles
    AutoSuperhuman = false,
    AutoDeathStep = false,
    AutoSharkman = false,
    AutoElectricClaw = false,
    AutoDragonTalon = false,
    AutoGodhuman = false,
    
    -- Boss
    AutoBoss = false,
    SelectedBoss = nil,
    ServerHopBoss = false,
    
    -- Sea 1 Items
    AutoSaber = false,
    AutoPole = false,
    AutoTrident = false,
    AutoSaw = false,
    AutoGreybeard = false,
    AutoBlackCape = false,
    AutoTomoeRing = false,
    AutoPipe = false,
    AutoObsHaki = false,
    AutoArmHaki = true, -- ON by default
    AutoGeppo = false,
    AutoSoru = false,
    
    -- Stats
    AutoStats = false,
    StatPriority = "Melee",
    PointsPerAdd = 3,
    
    -- Combat/PVP
    PlayerKillAura = false,
    KillAuraRange = 50,
    Aimbot = false,
    SilentAim = false,
    SilentAimFOV = 100,
    ShowFOV = false,
    SafeZone = false,
    SafeZoneHP = 30,
    ClickTP = false,
    InfiniteEnergy = true, -- ON by default
    NoCooldown = false,
    
    -- ESP
    PlayerESP = false,
    MobESP = false,
    BossESP = false,
    FruitESP = false,
    ChestESP = false,
    IslandESP = false,
    ESPBox = false,
    ESPTracers = false,
    ESPHealth = true,
    ESPDistance = true,
    
    -- Player Mods
    WalkSpeed = 16,
    JumpPower = 50,
    InfiniteJump = false,
    Fly = false,
    FlySpeed = 100,
    NoClip = false,
    SpinBot = false,
    
    -- Misc
    ChestFarm = false,
    FruitSniper = false,
    RemoveFog = false,
    FPSBoost = false,
    AntiAFK = true,
    AutoTeam = nil, -- "Pirate" or "Marine"
    DiscordWebhook = "",
}

local Settings = {
    FarmHeight = 15,
    FarmDistance = 3,
    BringRadius = 150,
    TweenSpeed = 300,
    HitboxSize = 75,
    AttackDelay = 0.1,
    ChestsBeforeReset = 3,
}

-- Runtime
local Connections = {}
local ESPCache = {}
local CurrentTween = nil
local ChestCount = 0
local LastAttack = 0

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

local function isAlive()
    local hum = getHumanoid()
    return hum and hum.Health > 0
end

local function getEnemiesFolder()
    return Workspace:FindFirstChild("Enemies")
end

-- ============================================================================
-- MOVEMENT SYSTEM
-- ============================================================================

local function stopTween()
    if CurrentTween then
        CurrentTween:Cancel()
        CurrentTween = nil
    end
end

-- Smooth tween movement
local function tweenTo(targetCFrame, callback)
    stopTween()
    
    local hrp = getHRP()
    if not hrp then return end
    
    local distance = (hrp.Position - targetCFrame.Position).Magnitude
    local tweenTime = distance / Settings.TweenSpeed
    tweenTime = math.max(tweenTime, 0.1)
    
    local tweenInfo = TweenInfo.new(tweenTime, Enum.EasingStyle.Linear)
    CurrentTween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
    CurrentTween:Play()
    
    if callback then
        CurrentTween.Completed:Connect(function()
            CurrentTween = nil
            callback()
        end)
    else
        CurrentTween.Completed:Wait()
        CurrentTween = nil
    end
end

-- INSTANT teleport (for chests, no delay)
local function instantTP(targetCFrame)
    local hrp = getHRP()
    if hrp then
        hrp.CFrame = targetCFrame
    end
end

-- ============================================================================
-- MOB FUNCTIONS
-- ============================================================================

local function getMobByName(name)
    local enemies = getEnemiesFolder()
    if not enemies then return nil end
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") and mob.Name == name then
            local hum = mob:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                return mob
            end
        end
    end
    return nil
end

local function getNearestMob(targetName, maxDist)
    local hrp = getHRP()
    if not hrp then return nil end
    
    local enemies = getEnemiesFolder()
    if not enemies then return nil end
    
    local nearest = nil
    local nearestDist = maxDist or 9999
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") then
            local hum = mob:FindFirstChildOfClass("Humanoid")
            local mobHRP = mob:FindFirstChild("HumanoidRootPart")
            
            if hum and hum.Health > 0 and mobHRP then
                if not targetName or mob.Name == targetName then
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

local function getAllMobsInRadius(radius, targetName)
    local hrp = getHRP()
    if not hrp then return {} end
    
    local enemies = getEnemiesFolder()
    if not enemies then return {} end
    
    local mobs = {}
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") then
            local hum = mob:FindFirstChildOfClass("Humanoid")
            local mobHRP = mob:FindFirstChild("HumanoidRootPart")
            
            if hum and hum.Health > 0 and mobHRP then
                if not targetName or mob.Name == targetName then
                    local dist = (hrp.Position - mobHRP.Position).Magnitude
                    if dist < radius then
                        table.insert(mobs, {Mob = mob, Distance = dist})
                    end
                end
            end
        end
    end
    
    return mobs
end

-- Bring mob to player (ON by default)
local function bringMob(mob)
    if not mob then return end
    
    local hrp = getHRP()
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    
    if hrp and mobHRP then
        mobHRP.CFrame = hrp.CFrame * CFrame.new(0, -Settings.FarmHeight + 3, Settings.FarmDistance)
    end
end

-- Freeze mob in place (ON by default)
local function freezeMob(mob)
    if not mob then return end
    
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    if mobHRP then
        mobHRP.Anchored = true
        mobHRP.CanCollide = false
    end
end

-- Bring and freeze all mobs in radius
local function bringAndFreezeMobs(targetName)
    local mobs = getAllMobsInRadius(Settings.BringRadius, targetName)
    
    for _, data in ipairs(mobs) do
        local mob = data.Mob
        if State.BringMobs then
            bringMob(mob)
        end
        if State.FreezeMobs then
            freezeMob(mob)
        end
    end
end

-- Expand hitbox (ON by default)
local function expandHitbox(mob, size)
    if not mob then return end
    
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    if mobHRP then
        mobHRP.Size = Vector3.new(size, size, size)
        mobHRP.Transparency = 1
        mobHRP.CanCollide = false
    end
end

local function expandAllHitboxes()
    local enemies = getEnemiesFolder()
    if not enemies then return end
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") then
            expandHitbox(mob, Settings.HitboxSize)
        end
    end
end

-- ============================================================================
-- COMBAT SYSTEM (Remote-Based - No Mouse Interference)
-- ============================================================================

local function getBackpack()
    return LocalPlayer:FindFirstChild("Backpack")
end

local function getEquippedTool()
    local char = getCharacter()
    if char then
        return char:FindFirstChildOfClass("Tool")
    end
    return nil
end

local function equipTool(toolName)
    local backpack = getBackpack()
    local char = getCharacter()
    if not backpack or not char then return false end
    
    local equipped = getEquippedTool()
    if equipped and equipped.Name == toolName then return true end
    
    local tool = backpack:FindFirstChild(toolName)
    if tool then
        local hum = getHumanoid()
        if hum then
            hum:EquipTool(tool)
            return true
        end
    end
    
    return false
end

local function equipBestWeapon()
    if not State.AutoEquip then return end
    
    local backpack = getBackpack()
    if not backpack then return end
    
    local weaponList = WeaponTypes[State.SelectedWeaponType]
    if not weaponList then return end
    
    -- Try to equip in priority order
    for _, weaponName in ipairs(weaponList) do
        if backpack:FindFirstChild(weaponName) then
            equipTool(weaponName)
            return
        end
    end
end

-- Attack using game remotes (not mouse clicks)
local function attackRemote()
    local weapon = getEquippedTool()
    if not weapon then return end
    
    -- Rate limit attacks
    local now = tick()
    if now - LastAttack < Settings.AttackDelay then return end
    LastAttack = now
    
    -- Fire weapon's remote
    local remote = weapon:FindFirstChild("RemoteEvent") or weapon:FindFirstChildOfClass("RemoteEvent")
    if remote then
        pcall(function() remote:FireServer() end)
    end
    
    -- Click remote
    local clickRemote = weapon:FindFirstChild("Click")
    if clickRemote then
        pcall(function() clickRemote:FireServer() end)
    end
    
    -- Alternative: Mouse button remote
    local mouseRemote = weapon:FindFirstChild("MouseButton1Click")
    if mouseRemote then
        pcall(function() mouseRemote:FireServer() end)
    end
end

-- Attack specific mob
local function attackMob(mob)
    if not mob or not isAlive() then return end
    
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    local hrp = getHRP()
    
    if not mobHRP or not hrp then return end
    
    -- Look at mob
    hrp.CFrame = CFrame.lookAt(hrp.Position, mobHRP.Position)
    
    -- Attack
    attackRemote()
end

-- Kill Aura - damages all mobs nearby (ON by default for raids)
local function killAura(targetName)
    local hrp = getHRP()
    if not hrp then return end
    
    local mobs = getAllMobsInRadius(State.KillAuraRange, targetName)
    
    for _, data in ipairs(mobs) do
        local mob = data.Mob
        local mobHRP = mob:FindFirstChild("HumanoidRootPart")
        
        if mobHRP then
            -- Teleport mob to weapon range
            if State.BringMobs then
                bringMob(mob)
            end
            
            -- Expand hitbox
            if State.HitboxExpand then
                expandHitbox(mob, Settings.HitboxSize)
            end
            
            -- Attack
            attackRemote()
        end
    end
end

-- ============================================================================
-- QUEST SYSTEM
-- ============================================================================

local function hasQuest()
    local gui = LocalPlayer:FindFirstChild("PlayerGui")
    if gui then
        local main = gui:FindFirstChild("Main")
        if main then
            local quest = main:FindFirstChild("Quest")
            if quest and quest.Visible then
                return true
            end
        end
    end
    return false
end

local function getQuestForLevel(level)
    for _, quest in ipairs(Sea1Quests) do
        if level >= quest.Min and level < quest.Max then
            return quest
        end
    end
    return Sea1Quests[#Sea1Quests]
end

local function acceptQuest(questData)
    if not questData then return false end
    
    -- Tween to quest NPC
    tweenTo(questData.QuestNPC * CFrame.new(0, 3, 0))
    task.wait(0.3)
    
    -- Accept via remote
    invokeRemote("StartQuest", questData.Quest, 1)
    task.wait(0.2)
    
    return hasQuest()
end

-- ============================================================================
-- HAKI SYSTEM
-- ============================================================================

local function activateArmamentHaki()
    invokeRemote("Buso")
end

local function activateObservationHaki()
    invokeRemote("Instinct")
end

-- ============================================================================
-- INFINITE ENERGY (ON by default)
-- ============================================================================

local EnergyHooked = false

local function hookEnergy()
    if EnergyHooked then return end
    
    local data = LocalPlayer:FindFirstChild("Data")
    if data then
        local energy = data:FindFirstChild("Energy")
        if energy then
            Connections.Energy = RunService.Heartbeat:Connect(function()
                if State.InfiniteEnergy then
                    if energy.Value < 100 then
                        energy.Value = 100
                    end
                end
            end)
            EnergyHooked = true
        end
    end
end

-- ============================================================================
-- AUTO STATS
-- ============================================================================

local function addStats()
    local points = getPoints()
    if points <= 0 then return end
    
    invokeRemote("AddPoint", State.StatPriority, State.PointsPerAdd)
end

-- ============================================================================
-- ESP SYSTEM (Optimized - No Lag)
-- ============================================================================

local ESPUpdateRate = 0.5
local LastESPUpdate = 0

local function createESPBillboard(parent, text, color)
    local existing = parent:FindFirstChild("FamyyESP")
    if existing then return existing end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FamyyESP"
    billboard.Size = UDim2.new(0, 120, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = parent
    
    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.Parent = billboard
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "Name"
    nameLabel.Size = UDim2.new(1, 0, 0.4, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = text
    nameLabel.TextColor3 = color
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextScaled = true
    nameLabel.Parent = container
    
    local healthLabel = Instance.new("TextLabel")
    healthLabel.Name = "Health"
    healthLabel.Size = UDim2.new(1, 0, 0.3, 0)
    healthLabel.Position = UDim2.new(0, 0, 0.4, 0)
    healthLabel.BackgroundTransparency = 1
    healthLabel.Text = ""
    healthLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    healthLabel.TextStrokeTransparency = 0
    healthLabel.Font = Enum.Font.GothamMedium
    healthLabel.TextScaled = true
    healthLabel.Parent = container
    
    local distLabel = Instance.new("TextLabel")
    distLabel.Name = "Distance"
    distLabel.Size = UDim2.new(1, 0, 0.3, 0)
    distLabel.Position = UDim2.new(0, 0, 0.7, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "0m"
    distLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    distLabel.TextStrokeTransparency = 0
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextScaled = true
    distLabel.Parent = container
    
    return billboard
end

local function removeESP(object)
    local esp = object:FindFirstChild("FamyyESP")
    if esp then esp:Destroy() end
    ESPCache[object] = nil
end

local function updateESP(billboard, parent)
    local hrp = getHRP()
    if not hrp or not billboard or not billboard.Parent then return end
    
    local container = billboard:FindFirstChild("Container")
    if not container then return end
    
    -- Get position
    local pos
    if parent:IsA("BasePart") then
        pos = parent.Position
    elseif parent:IsA("Model") then
        local pp = parent:FindFirstChild("HumanoidRootPart") or parent.PrimaryPart
        if pp then pos = pp.Position end
    end
    
    if pos then
        -- Update distance
        if State.ESPDistance then
            local distLabel = container:FindFirstChild("Distance")
            if distLabel then
                local dist = math.floor((hrp.Position - pos).Magnitude)
                distLabel.Text = dist .. "m"
            end
        end
        
        -- Update health
        if State.ESPHealth then
            local hum = parent:FindFirstChildOfClass("Humanoid")
            if hum then
                local healthLabel = container:FindFirstChild("Health")
                if healthLabel then
                    healthLabel.Text = math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth)
                end
            end
        end
    end
end

local function clearAllESP()
    for object, _ in pairs(ESPCache) do
        if object then
            removeESP(object)
        end
    end
    ESPCache = {}
end

-- ============================================================================
-- FRUIT FUNCTIONS
-- ============================================================================

local function findFruits()
    local fruits = {}
    
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") and (obj.Name:find("Fruit") or obj:FindFirstChild("FruitType")) then
            table.insert(fruits, obj)
        end
    end
    
    return fruits
end

local function snipeFruit(fruit)
    if not fruit then return end
    
    local handle = fruit:FindFirstChild("Handle")
    if not handle then return end
    
    Window.Notify("Fruit Sniper", "Found: " .. fruit.Name, 2, "success")
    
    -- INSTANT teleport for fruits
    instantTP(handle.CFrame * CFrame.new(0, 3, 0))
    task.wait(0.2)
    
    -- Collect
    local hrp = getHRP()
    if hrp and firetouchinterest then
        firetouchinterest(hrp, handle, 0)
        task.wait(0.1)
        firetouchinterest(hrp, handle, 1)
    end
end

-- ============================================================================
-- CHEST FARM (INSTANT TELEPORT, Reset After 3)
-- ============================================================================

local function findChests()
    local chests = {}
    
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj.Name:find("Chest") and (obj:IsA("Model") or obj:IsA("BasePart")) then
            -- Check if chest is available (not already collected)
            local isAvailable = true
            if obj:IsA("Model") then
                local part = obj:FindFirstChildWhichIsA("BasePart")
                if part and part.Transparency >= 0.9 then
                    isAvailable = false
                end
            elseif obj.Transparency >= 0.9 then
                isAvailable = false
            end
            
            if isAvailable then
                table.insert(chests, obj)
            end
        end
    end
    
    return chests
end

local function collectChest(chest)
    if not chest then return false end
    
    local part = chest:IsA("BasePart") and chest or chest:FindFirstChildWhichIsA("BasePart")
    if not part then return false end
    
    -- INSTANT teleport (no tween for chests)
    instantTP(part.CFrame * CFrame.new(0, 3, 0))
    task.wait(0.2)
    
    -- Touch to collect
    local hrp = getHRP()
    if hrp and firetouchinterest then
        firetouchinterest(hrp, part, 0)
        task.wait(0.1)
        firetouchinterest(hrp, part, 1)
        return true
    end
    
    return false
end

local function resetCharacter()
    local hum = getHumanoid()
    if hum then
        hum.Health = 0
    end
end

-- ============================================================================
-- PLAYER MODS
-- ============================================================================

local function setWalkSpeed(speed)
    local hum = getHumanoid()
    if hum then
        hum.WalkSpeed = speed
    end
end

local function setJumpPower(power)
    local hum = getHumanoid()
    if hum then
        hum.JumpPower = power
        hum.UseJumpPower = true
    end
end

-- No Clip
local function startNoClip()
    if Connections.NoClip then return end
    
    Connections.NoClip = RunService.Stepped:Connect(function()
        if State.NoClip and isAlive() then
            local char = getCharacter()
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
    end)
end

local function stopNoClip()
    if Connections.NoClip then
        Connections.NoClip:Disconnect()
        Connections.NoClip = nil
    end
end

-- Fly
local Flying = false
local FlyBV = nil
local FlyBG = nil

local function startFly()
    if Flying then return end
    Flying = true
    
    local hrp = getHRP()
    if not hrp then return end
    
    FlyBV = Instance.new("BodyVelocity")
    FlyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    FlyBV.Velocity = Vector3.new(0, 0, 0)
    FlyBV.Parent = hrp
    
    FlyBG = Instance.new("BodyGyro")
    FlyBG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    FlyBG.P = 1000000
    FlyBG.Parent = hrp
    
    Connections.Fly = RunService.RenderStepped:Connect(function()
        if not Flying or not FlyBV then return end
        
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
        
        if moveDir.Magnitude > 0 then
            FlyBV.Velocity = moveDir.Unit * State.FlySpeed
        else
            FlyBV.Velocity = Vector3.new(0, 0, 0)
        end
        
        if FlyBG then
            FlyBG.CFrame = camera.CFrame
        end
    end)
end

local function stopFly()
    Flying = false
    
    if FlyBV then FlyBV:Destroy() FlyBV = nil end
    if FlyBG then FlyBG:Destroy() FlyBG = nil end
    
    if Connections.Fly then
        Connections.Fly:Disconnect()
        Connections.Fly = nil
    end
end

-- Infinite Jump
local function startInfiniteJump()
    if Connections.InfiniteJump then return end
    
    Connections.InfiniteJump = UserInputService.JumpRequest:Connect(function()
        if State.InfiniteJump and isAlive() then
            local hum = getHumanoid()
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end

local function stopInfiniteJump()
    if Connections.InfiniteJump then
        Connections.InfiniteJump:Disconnect()
        Connections.InfiniteJump = nil
    end
end

-- Spin Bot
local function startSpinBot()
    if Connections.SpinBot then return end
    
    Connections.SpinBot = RunService.RenderStepped:Connect(function()
        if State.SpinBot and isAlive() then
            local hrp = getHRP()
            if hrp then
                hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(15), 0)
            end
        end
    end)
end

local function stopSpinBot()
    if Connections.SpinBot then
        Connections.SpinBot:Disconnect()
        Connections.SpinBot = nil
    end
end

-- ============================================================================
-- MISC FUNCTIONS
-- ============================================================================

-- Anti-AFK
local function startAntiAFK()
    if Connections.AntiAFK then return end
    
    Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
        if VirtualUser and State.AntiAFK then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end)
end

-- Remove Fog
local function removeFog()
    Lighting.FogEnd = 9e9
    Lighting.FogStart = 9e9
    
    for _, obj in ipairs(Lighting:GetDescendants()) do
        if obj:IsA("Atmosphere") or obj:IsA("BlurEffect") or obj:IsA("DepthOfFieldEffect") then
            obj.Enabled = false
        end
    end
end

-- FPS Boost
local function enableFPSBoost()
    settings().Rendering.QualityLevel = 1
    Lighting.GlobalShadows = false
    
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
            obj.Enabled = false
        end
        if obj:IsA("Decal") or obj:IsA("Texture") then
            obj.Transparency = 1
        end
    end
end

-- Server Hop
local function serverHop()
    Window.Notify("Server Hop", "Finding new server...", 2, "info")
    
    pcall(function()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        for _, server in ipairs(servers.data) do
            if server.id ~= game.JobId and server.playing < server.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                return
            end
        end
    end)
    
    -- Fallback
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end

-- ============================================================================
-- MAIN FARM LOOP
-- ============================================================================

local function startAutoFarm()
    if Connections.AutoFarm then return end
    
    Connections.AutoFarm = task.spawn(function()
        while State.AutoFarm do
            if not isAlive() then
                task.wait(1)
                repeat task.wait(0.5) until isAlive()
                task.wait(0.5)
            end
            
            -- Equip weapon
            equipBestWeapon()
            
            local level = getLevel()
            local questData = getQuestForLevel(level)
            
            if questData then
                -- Accept quest if needed
                if State.AutoQuest and not hasQuest() then
                    acceptQuest(questData)
                    task.wait(0.5)
                end
                
                -- Farm mobs
                local mobName = questData.Mob
                local mob = getNearestMob(mobName, 9999)
                
                if mob then
                    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
                    if mobHRP then
                        -- Position above mob
                        local farmCFrame = mobHRP.CFrame * CFrame.new(0, Settings.FarmHeight, 0)
                        
                        if State.SafeMode then
                            farmCFrame = mobHRP.CFrame * CFrame.new(0, 100, 0) -- High in sky
                        end
                        
                        tweenTo(farmCFrame)
                        
                        -- Bring and freeze (ON by default)
                        if State.BringMobs or State.FreezeMobs then
                            bringAndFreezeMobs(mobName)
                        end
                        
                        -- Expand hitbox (ON by default)
                        if State.HitboxExpand then
                            expandAllHitboxes()
                        end
                        
                        -- Attack
                        attackMob(mob)
                        
                        -- Kill aura (ON by default)
                        if State.KillAura then
                            killAura(mobName)
                        end
                    end
                else
                    -- Go to mob spawn area
                    tweenTo(questData.MobArea * CFrame.new(0, Settings.FarmHeight, 0))
                end
            end
            
            -- Auto Haki (ON by default)
            if State.AutoArmHaki then
                activateArmamentHaki()
            end
            if State.AutoObsHaki then
                activateObservationHaki()
            end
            
            -- Auto Stats
            if State.AutoStats then
                addStats()
            end
            
            task.wait(Settings.AttackDelay)
        end
    end)
end

local function stopAutoFarm()
    if Connections.AutoFarm then
        task.cancel(Connections.AutoFarm)
        Connections.AutoFarm = nil
    end
end

-- ============================================================================
-- BOSS FARM LOOP
-- ============================================================================

local function startBossFarm()
    if Connections.BossFarm then return end
    
    Connections.BossFarm = task.spawn(function()
        while State.AutoBoss do
            if not isAlive() then
                task.wait(1)
                repeat task.wait(0.5) until isAlive()
            end
            
            if State.SelectedBoss then
                local bossData = nil
                for _, boss in ipairs(Sea1Bosses) do
                    if boss.Name == State.SelectedBoss then
                        bossData = boss
                        break
                    end
                end
                
                if bossData then
                    local boss = getMobByName(bossData.Name)
                    
                    if boss then
                        local bossHRP = boss:FindFirstChild("HumanoidRootPart")
                        local bossHum = boss:FindFirstChildOfClass("Humanoid")
                        
                        if bossHRP and bossHum then
                            tweenTo(bossHRP.CFrame * CFrame.new(0, Settings.FarmHeight, 0))
                            
                            while bossHum and bossHum.Health > 0 and State.AutoBoss do
                                if State.BringMobs then bringMob(boss) end
                                if State.FreezeMobs then freezeMob(boss) end
                                if State.HitboxExpand then expandHitbox(boss, Settings.HitboxSize) end
                                attackMob(boss)
                                task.wait(0.1)
                            end
                            
                            Window.Notify("Boss Farm", bossData.Name .. " defeated!", 2, "success")
                            
                            if State.ServerHopBoss then
                                task.wait(1)
                                serverHop()
                            end
                        end
                    else
                        -- Boss not spawned, go to spawn location
                        tweenTo(bossData.CFrame * CFrame.new(0, 10, 0))
                        task.wait(1)
                    end
                end
            else
                task.wait(1)
            end
        end
    end)
end

local function stopBossFarm()
    if Connections.BossFarm then
        task.cancel(Connections.BossFarm)
        Connections.BossFarm = nil
    end
end

-- ============================================================================
-- ESP LOOPS
-- ============================================================================

local function startMobESP()
    if Connections.MobESP then return end
    
    Connections.MobESP = task.spawn(function()
        while State.MobESP do
            local enemies = getEnemiesFolder()
            if enemies then
                for _, mob in ipairs(enemies:GetChildren()) do
                    if mob:IsA("Model") then
                        local hum = mob:FindFirstChildOfClass("Humanoid")
                        if hum and hum.Health > 0 then
                            if not ESPCache[mob] then
                                local color = Color3.fromRGB(255, 100, 100)
                                -- Check if boss
                                for _, boss in ipairs(Sea1Bosses) do
                                    if mob.Name == boss.Name then
                                        color = Color3.fromRGB(255, 50, 255) -- Purple for bosses
                                        break
                                    end
                                end
                                local esp = createESPBillboard(mob, mob.Name, color)
                                ESPCache[mob] = esp
                            else
                                updateESP(ESPCache[mob], mob)
                            end
                        else
                            removeESP(mob)
                        end
                    end
                end
            end
            task.wait(ESPUpdateRate)
        end
        
        -- Cleanup
        for mob, _ in pairs(ESPCache) do
            if mob and mob:IsA("Model") then
                removeESP(mob)
            end
        end
    end)
end

local function stopMobESP()
    State.MobESP = false
end

local function startFruitESP()
    if Connections.FruitESP then return end
    
    Connections.FruitESP = task.spawn(function()
        while State.FruitESP do
            local fruits = findFruits()
            for _, fruit in ipairs(fruits) do
                if not ESPCache[fruit] then
                    local esp = createESPBillboard(fruit, "[FRUIT] " .. fruit.Name, Color3.fromRGB(255, 215, 0))
                    ESPCache[fruit] = esp
                else
                    updateESP(ESPCache[fruit], fruit)
                end
            end
            task.wait(ESPUpdateRate)
        end
    end)
end

local function stopFruitESP()
    State.FruitESP = false
end

local function startChestESP()
    if Connections.ChestESP then return end
    
    Connections.ChestESP = task.spawn(function()
        while State.ChestESP do
            local chests = findChests()
            for _, chest in ipairs(chests) do
                if not ESPCache[chest] then
                    local esp = createESPBillboard(chest, "[CHEST]", Color3.fromRGB(100, 255, 100))
                    ESPCache[chest] = esp
                else
                    updateESP(ESPCache[chest], chest)
                end
            end
            task.wait(ESPUpdateRate)
        end
    end)
end

local function stopChestESP()
    State.ChestESP = false
end

local function startFruitSniper()
    if Connections.FruitSniper then return end
    
    Connections.FruitSniper = task.spawn(function()
        while State.FruitSniper do
            local fruits = findFruits()
            if #fruits > 0 then
                snipeFruit(fruits[1])
            end
            task.wait(0.5)
        end
    end)
end

local function stopFruitSniper()
    State.FruitSniper = false
end

local function startChestFarm()
    if Connections.ChestFarm then return end
    
    ChestCount = 0
    
    Connections.ChestFarm = task.spawn(function()
        while State.ChestFarm do
            local chests = findChests()
            
            for _, chest in ipairs(chests) do
                if not State.ChestFarm then break end
                
                if collectChest(chest) then
                    ChestCount = ChestCount + 1
                    Window.Notify("Chest Farm", "Collected chest #" .. ChestCount, 1, "success")
                    
                    if ChestCount >= Settings.ChestsBeforeReset then
                        Window.Notify("Chest Farm", "Resetting character...", 2, "info")
                        ChestCount = 0
                        resetCharacter()
                        task.wait(3)
                    end
                end
                
                task.wait(0.2)
            end
            
            task.wait(0.5)
        end
    end)
end

local function stopChestFarm()
    State.ChestFarm = false
end

-- ============================================================================
-- UI SETUP
-- ============================================================================

-- Create Tabs
local MainFarmTab = Window:CreateTab("Main Farm")
local Sea1ItemsTab = Window:CreateTab("Sea 1 Items")
local StatsTab = Window:CreateTab("Stats")
local CombatTab = Window:CreateTab("Combat")
local TeleportTab = Window:CreateTab("Teleport")
local ESPTab = Window:CreateTab("ESP")
local PlayerTab = Window:CreateTab("Player")
local MiscTab = Window:CreateTab("Misc")

-- ============================================================================
-- MAIN FARM TAB
-- ============================================================================

local FarmSection = MainFarmTab:CreateSection("Auto Farm", true)

FarmSection:AddToggle({
    Label = "Auto Farm Level",
    Default = false,
    Callback = function(v)
        State.AutoFarm = v
        if v then
            startAutoFarm()
            Window.Notify("Auto Farm", "Started! Level: " .. getLevel(), 2, "success")
        else
            stopAutoFarm()
            Window.Notify("Auto Farm", "Stopped", 2, "info")
        end
    end
})

FarmSection:AddToggle({
    Label = "Auto Quest",
    Default = true,
    Callback = function(v)
        State.AutoQuest = v
    end
})

local WeaponSection = MainFarmTab:CreateSection("Weapon", true)

WeaponSection:AddDropdown({
    Label = "Weapon Type",
    Options = {"Melee", "Sword", "Gun", "Fruit"},
    Default = "Melee",
    Callback = function(v)
        State.SelectedWeaponType = v
    end
})

WeaponSection:AddToggle({
    Label = "Auto Equip",
    Default = true,
    Callback = function(v)
        State.AutoEquip = v
    end
})

local MobSection = MainFarmTab:CreateSection("Mob Control", true)

MobSection:AddLabel({Text = "These are ON by default for best farming", Bold = false})

MobSection:AddToggle({
    Label = "Bring Mobs",
    Default = true,
    Callback = function(v)
        State.BringMobs = v
    end
})

MobSection:AddToggle({
    Label = "Freeze Mobs",
    Default = true,
    Callback = function(v)
        State.FreezeMobs = v
    end
})

MobSection:AddToggle({
    Label = "Kill Aura",
    Default = true,
    Callback = function(v)
        State.KillAura = v
    end
})

MobSection:AddToggle({
    Label = "Hitbox Expander",
    Default = true,
    Callback = function(v)
        State.HitboxExpand = v
    end
})

MobSection:AddSlider({
    Label = "Bring Radius",
    Min = 50,
    Max = 300,
    Default = 150,
    Callback = function(v)
        Settings.BringRadius = v
    end
})

MobSection:AddSlider({
    Label = "Hitbox Size",
    Min = 25,
    Max = 150,
    Default = 75,
    Callback = function(v)
        Settings.HitboxSize = v
    end
})

local FarmSettingsSection = MainFarmTab:CreateSection("Farm Settings", true)

FarmSettingsSection:AddToggle({
    Label = "Safe Mode (Farm from Sky)",
    Default = false,
    Callback = function(v)
        State.SafeMode = v
    end
})

FarmSettingsSection:AddToggle({
    Label = "Fast Attack",
    Default = true,
    Callback = function(v)
        State.FastAttack = v
    end
})

FarmSettingsSection:AddSlider({
    Label = "Farm Height",
    Min = 5,
    Max = 100,
    Default = 15,
    Callback = function(v)
        Settings.FarmHeight = v
    end
})

FarmSettingsSection:AddSlider({
    Label = "Tween Speed",
    Min = 100,
    Max = 500,
    Default = 300,
    Callback = function(v)
        Settings.TweenSpeed = v
    end
})

FarmSettingsSection:AddSlider({
    Label = "Attack Delay",
    Min = 0.05,
    Max = 0.5,
    Default = 0.1,
    Increment = 0.05,
    Callback = function(v)
        Settings.AttackDelay = v
    end
})

-- Boss Farm Section
local BossSection = MainFarmTab:CreateSection("Boss Farm", true)

BossSection:AddToggle({
    Label = "Auto Boss Farm",
    Default = false,
    Callback = function(v)
        State.AutoBoss = v
        if v then
            startBossFarm()
        else
            stopBossFarm()
        end
    end
})

BossSection:AddToggle({
    Label = "Server Hop After Kill",
    Default = false,
    Callback = function(v)
        State.ServerHopBoss = v
    end
})

local SelectedBossLabel = BossSection:AddLabel({Text = "Selected: None", Bold = true})

local BossSelectSection = MainFarmTab:CreateSection("Select Boss", false)

for _, boss in ipairs(Sea1Bosses) do
    local label = boss.Name .. " [Lv." .. boss.Level .. "]"
    if boss.Rare then
        label = "[RARE] " .. label
    end
    
    BossSelectSection:AddButton({
        Label = label,
        Style = boss.Rare and "primary" or "secondary",
        Callback = function()
            State.SelectedBoss = boss.Name
            SelectedBossLabel:SetText("Selected: " .. boss.Name)
            Window.Notify("Boss Farm", "Selected: " .. boss.Name, 2, "info")
        end
    })
end

-- ============================================================================
-- SEA 1 ITEMS TAB
-- ============================================================================

local HakiSection = Sea1ItemsTab:CreateSection("Haki", true)

HakiSection:AddToggle({
    Label = "Auto Armament Haki (Buso)",
    Default = true,
    Callback = function(v)
        State.AutoArmHaki = v
    end
})

HakiSection:AddToggle({
    Label = "Auto Observation Haki (Ken)",
    Default = false,
    Callback = function(v)
        State.AutoObsHaki = v
    end
})

HakiSection:AddButton({
    Label = "Buy Armament Haki ($25k)",
    Style = "secondary",
    Callback = function()
        Window.Notify("Haki", "Purchasing Buso Haki...", 2, "info")
        invokeRemote("Buso", "Buy")
    end
})

HakiSection:AddButton({
    Label = "Buy Observation Haki ($750k)",
    Style = "secondary",
    Callback = function()
        Window.Notify("Haki", "Purchasing Ken Haki...", 2, "info")
        invokeRemote("Instinct", "Buy")
    end
})

local AbilitiesSection = Sea1ItemsTab:CreateSection("Abilities", true)

AbilitiesSection:AddButton({
    Label = "Buy Sky Jump (Geppo) - $10k",
    Style = "secondary",
    Callback = function()
        invokeRemote("BuyHaki", "Geppo")
        Window.Notify("Abilities", "Purchased Geppo!", 2, "success")
    end
})

AbilitiesSection:AddButton({
    Label = "Buy Flash Step (Soru) - $100k",
    Style = "secondary",
    Callback = function()
        invokeRemote("BuyHaki", "Soru")
        Window.Notify("Abilities", "Purchased Soru!", 2, "success")
    end
})

local QuestItemsSection = Sea1ItemsTab:CreateSection("Quest Items", true)

QuestItemsSection:AddButton({
    Label = "TP to Saber Expert (Lvl 200)",
    Style = "primary",
    Callback = function()
        tweenTo(CFrame.new(-1447, 30, -30))
        Window.Notify("Teleport", "Going to Saber Expert...", 2, "info")
    end
})

QuestItemsSection:AddButton({
    Label = "TP to Thunder God (Pole)",
    Style = "primary",
    Callback = function()
        tweenTo(CFrame.new(-7920, 5635, -1427))
        Window.Notify("Teleport", "Going to Thunder God...", 2, "info")
    end
})

QuestItemsSection:AddButton({
    Label = "TP to Fishman Lord (Trident)",
    Style = "primary",
    Callback = function()
        tweenTo(CFrame.new(61365, 23, 1113))
        Window.Notify("Teleport", "Going to Fishman Lord...", 2, "info")
    end
})

QuestItemsSection:AddButton({
    Label = "TP to The Saw (Shark Saw)",
    Style = "primary",
    Callback = function()
        tweenTo(CFrame.new(-292, 72, 2076))
        Window.Notify("Teleport", "Going to The Saw...", 2, "info")
    end
})

QuestItemsSection:AddButton({
    Label = "TP to Greybeard (Bisento)",
    Style = "primary",
    Callback = function()
        tweenTo(CFrame.new(-4988, 78, 4380))
        Window.Notify("Teleport", "Going to Greybeard...", 2, "info")
    end
})

local AccessoriesSection = Sea1ItemsTab:CreateSection("Accessories", true)

AccessoriesSection:AddButton({
    Label = "TP to Black Cape",
    Style = "secondary",
    Callback = function()
        tweenTo(CFrame.new(-379, 85, 2088))
    end
})

AccessoriesSection:AddButton({
    Label = "TP to Tomoe Ring",
    Style = "secondary",
    Callback = function()
        tweenTo(CFrame.new(-4900, 100, 4350))
    end
})

-- ============================================================================
-- STATS TAB
-- ============================================================================

local AutoStatsSection = StatsTab:CreateSection("Auto Stats", true)

AutoStatsSection:AddToggle({
    Label = "Auto Add Stats",
    Default = false,
    Callback = function(v)
        State.AutoStats = v
    end
})

AutoStatsSection:AddSlider({
    Label = "Points Per Add",
    Min = 1,
    Max = 10,
    Default = 3,
    Callback = function(v)
        State.PointsPerAdd = v
    end
})

local StatPrioritySection = StatsTab:CreateSection("Stat Priority", true)

for _, stat in ipairs({"Melee", "Defense", "Sword", "Gun", "Blox Fruit"}) do
    StatPrioritySection:AddButton({
        Label = stat,
        Style = "secondary",
        Callback = function()
            State.StatPriority = stat
            Window.Notify("Stats", "Priority set to: " .. stat, 2, "info")
        end
    })
end

local ManualStatsSection = StatsTab:CreateSection("Manual Add", true)

ManualStatsSection:AddButton({
    Label = "Add All Points to Selected",
    Style = "primary",
    Callback = function()
        local points = getPoints()
        if points > 0 then
            invokeRemote("AddPoint", State.StatPriority, points)
            Window.Notify("Stats", "Added " .. points .. " to " .. State.StatPriority, 2, "success")
        end
    end
})

local StatsInfoSection = StatsTab:CreateSection("Current Stats", true)

local pointsLabel = StatsInfoSection:AddLabel({Text = "Points: " .. getPoints(), Bold = true})
local levelLabel = StatsInfoSection:AddLabel({Text = "Level: " .. getLevel()})
local beliLabel = StatsInfoSection:AddLabel({Text = "Beli: $" .. getBeli()})

-- ============================================================================
-- COMBAT TAB
-- ============================================================================

local CombatSection = CombatTab:CreateSection("Combat", true)

CombatSection:AddToggle({
    Label = "Infinite Energy",
    Default = true,
    Callback = function(v)
        State.InfiniteEnergy = v
        if v then hookEnergy() end
    end
})

CombatSection:AddToggle({
    Label = "No Clip",
    Default = false,
    Callback = function(v)
        State.NoClip = v
        if v then startNoClip() else stopNoClip() end
    end
})

local KillAuraSection = CombatTab:CreateSection("Kill Aura", true)

KillAuraSection:AddToggle({
    Label = "Mob Kill Aura",
    Default = true,
    Callback = function(v)
        State.KillAura = v
    end
})

KillAuraSection:AddSlider({
    Label = "Kill Aura Range",
    Min = 25,
    Max = 150,
    Default = 50,
    Callback = function(v)
        State.KillAuraRange = v
    end
})

-- ============================================================================
-- TELEPORT TAB
-- ============================================================================

local IslandSection = TeleportTab:CreateSection("Sea 1 Islands", true)

for _, island in ipairs(Sea1Islands) do
    IslandSection:AddButton({
        Label = island.Name,
        Style = "secondary",
        Callback = function()
            tweenTo(island.CFrame)
            Window.Notify("Teleport", "Going to " .. island.Name, 2, "info")
        end
    })
end

local SeaTPSection = TeleportTab:CreateSection("Sea Teleports", true)

SeaTPSection:AddButton({
    Label = "Teleport to Sea 1",
    Style = "primary",
    Callback = function()
        TeleportService:Teleport(2753915549, LocalPlayer)
    end
})

SeaTPSection:AddButton({
    Label = "Teleport to Sea 2",
    Style = "primary",
    Callback = function()
        TeleportService:Teleport(4442272183, LocalPlayer)
    end
})

SeaTPSection:AddButton({
    Label = "Teleport to Sea 3",
    Style = "primary",
    Callback = function()
        TeleportService:Teleport(7449423635, LocalPlayer)
    end
})

local TPControlSection = TeleportTab:CreateSection("Controls", true)

TPControlSection:AddButton({
    Label = "Stop Tween",
    Style = "danger",
    Callback = function()
        stopTween()
        Window.Notify("Teleport", "Stopped movement", 2, "info")
    end
})

-- ============================================================================
-- ESP TAB
-- ============================================================================

local ESPOptionsSection = ESPTab:CreateSection("ESP Options", true)

ESPOptionsSection:AddToggle({
    Label = "Mob ESP",
    Default = false,
    Callback = function(v)
        State.MobESP = v
        if v then startMobESP() else stopMobESP() end
    end
})

ESPOptionsSection:AddToggle({
    Label = "Fruit ESP",
    Default = false,
    Callback = function(v)
        State.FruitESP = v
        if v then startFruitESP() else stopFruitESP() end
    end
})

ESPOptionsSection:AddToggle({
    Label = "Chest ESP",
    Default = false,
    Callback = function(v)
        State.ChestESP = v
        if v then startChestESP() else stopChestESP() end
    end
})

ESPOptionsSection:AddToggle({
    Label = "Show Health",
    Default = true,
    Callback = function(v)
        State.ESPHealth = v
    end
})

ESPOptionsSection:AddToggle({
    Label = "Show Distance",
    Default = true,
    Callback = function(v)
        State.ESPDistance = v
    end
})

ESPOptionsSection:AddButton({
    Label = "Clear All ESP",
    Style = "danger",
    Callback = function()
        clearAllESP()
        Window.Notify("ESP", "Cleared all ESP", 2, "info")
    end
})

-- ============================================================================
-- PLAYER TAB
-- ============================================================================

local SpeedSection = PlayerTab:CreateSection("Speed & Jump", true)

SpeedSection:AddSlider({
    Label = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(v)
        State.WalkSpeed = v
        setWalkSpeed(v)
    end
})

SpeedSection:AddSlider({
    Label = "Jump Power",
    Min = 50,
    Max = 300,
    Default = 50,
    Callback = function(v)
        State.JumpPower = v
        setJumpPower(v)
    end
})

SpeedSection:AddToggle({
    Label = "Infinite Jump",
    Default = false,
    Callback = function(v)
        State.InfiniteJump = v
        if v then startInfiniteJump() else stopInfiniteJump() end
    end
})

local FlySection = PlayerTab:CreateSection("Fly", true)

FlySection:AddToggle({
    Label = "Enable Fly",
    Default = false,
    Callback = function(v)
        State.Fly = v
        if v then startFly() else stopFly() end
    end
})

FlySection:AddSlider({
    Label = "Fly Speed",
    Min = 50,
    Max = 300,
    Default = 100,
    Callback = function(v)
        State.FlySpeed = v
    end
})

local OtherModsSection = PlayerTab:CreateSection("Other Mods", true)

OtherModsSection:AddToggle({
    Label = "Spin Bot",
    Default = false,
    Callback = function(v)
        State.SpinBot = v
        if v then startSpinBot() else stopSpinBot() end
    end
})

-- ============================================================================
-- MISC TAB
-- ============================================================================

local ChestFarmSection = MiscTab:CreateSection("Chest Farm", true)

ChestFarmSection:AddLabel({Text = "Uses INSTANT teleport, resets after 3 chests", Bold = false})

ChestFarmSection:AddToggle({
    Label = "Auto Chest Farm",
    Default = false,
    Callback = function(v)
        State.ChestFarm = v
        if v then
            startChestFarm()
            Window.Notify("Chest Farm", "Started! Instant TP mode.", 2, "success")
        else
            stopChestFarm()
        end
    end
})

local FruitSection = MiscTab:CreateSection("Fruit Sniper", true)

FruitSection:AddToggle({
    Label = "Fruit Sniper",
    Default = false,
    Callback = function(v)
        State.FruitSniper = v
        if v then
            startFruitSniper()
            Window.Notify("Fruit Sniper", "Active! Scanning...", 2, "success")
        else
            stopFruitSniper()
        end
    end
})

FruitSection:AddButton({
    Label = "Scan for Fruits",
    Style = "secondary",
    Callback = function()
        local fruits = findFruits()
        Window.Notify("Fruit Scan", "Found " .. #fruits .. " fruits", 2, "info")
    end
})

local ServerSection = MiscTab:CreateSection("Server", true)

ServerSection:AddButton({
    Label = "Server Hop",
    Style = "secondary",
    Callback = function()
        serverHop()
    end
})

ServerSection:AddButton({
    Label = "Rejoin",
    Style = "secondary",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

local PerformanceSection = MiscTab:CreateSection("Performance", true)

PerformanceSection:AddToggle({
    Label = "Remove Fog",
    Default = false,
    Callback = function(v)
        State.RemoveFog = v
        if v then removeFog() end
    end
})

PerformanceSection:AddToggle({
    Label = "FPS Boost",
    Default = false,
    Callback = function(v)
        State.FPSBoost = v
        if v then enableFPSBoost() end
    end
})

PerformanceSection:AddToggle({
    Label = "Anti-AFK",
    Default = true,
    Callback = function(v)
        State.AntiAFK = v
    end
})

-- Player Info Section
local InfoSection = MiscTab:CreateSection("Player Info", true)

InfoSection:AddLabel({Text = "Level: " .. getLevel(), Bold = true})
InfoSection:AddLabel({Text = "Beli: $" .. getBeli()})
InfoSection:AddLabel({Text = "Race: " .. getRace()})
InfoSection:AddLabel({Text = "Fruit: " .. (getDevilFruit() ~= "" and getDevilFruit() or "None")})

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

-- Start Anti-AFK
startAntiAFK()

-- Hook energy (ON by default)
hookEnergy()

-- Initial notifications
Window.Notify("FAMYY PRIVATE", "Blox Fruits Sea 1 v4.0 Loaded!", 3, "success")
Window.Notify("Defaults ON", "Bring Mobs, Freeze, Kill Aura, Hitbox, Inf Energy", 4, "info")

-- Update player info every second
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            pointsLabel:SetText("Points: " .. getPoints())
            levelLabel:SetText("Level: " .. getLevel())
            beliLabel:SetText("Beli: $" .. getBeli())
        end)
    end
end)

-- Console output
print("================================================================================")
print("[FAMYY PRIVATE] Blox Fruits Sea 1 Complete Script v4.0")
print("================================================================================")
print("DEFAULTS ENABLED:")
print("  - Bring Mobs: ON")
print("  - Freeze Mobs: ON") 
print("  - Kill Aura: ON")
print("  - Hitbox Expander: ON")
print("  - Infinite Energy: ON")
print("  - Auto Armament Haki: ON")
print("================================================================================")
print("FEATURES:")
print("  - Remote-based attacks (no mouse interference)")
print("  - Proper quest system")
print("  - INSTANT teleport for chests")
print("  - Tween movement for farming")
print("  - Optimized ESP (no lag)")
print("  - All Sea 1 bosses, islands, items")
print("================================================================================")

return Library
