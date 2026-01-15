--[[
    ██████╗ ██╗      ██████╗ ██╗  ██╗    ███████╗██████╗ ██╗   ██╗██╗████████╗███████╗
    ██╔══██╗██║     ██╔═══██╗╚██╗██╔╝    ██╔════╝██╔══██╗██║   ██║██║╚══██╔══╝██╔════╝
    ██████╔╝██║     ██║   ██║ ╚███╔╝     █████╗  ██████╔╝██║   ██║██║   ██║   ███████╗
    ██╔══██╗██║     ██║   ██║ ██╔██╗     ██╔══╝  ██╔══██╗██║   ██║██║   ██║   ╚════██║
    ██████╔╝███████╗╚██████╔╝██╔╝ ██╗    ██║     ██║  ██║╚██████╔╝██║   ██║   ███████║
    ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝   ╚═╝   ╚══════╝
    
    FAMYY PRIVATE - Blox Fruits Sea 1 Script v3.0
    Premium Quality - Researched from Wazure, HoHo Hub, RedzHub, Mango Hub
    
    FEATURES:
    ================================================================================
    [COMBAT] Remote-based attacking (no mouse interference)
    [QUEST]  Proper quest acceptance via game remotes
    [MOBS]   Bring + Freeze mobs (anchored in place)
    [FARM]   Position ABOVE mob (configurable height)
    [MOVE]   All movement via smooth tweening (anti-detection)
    [ESP]    Optimized with throttling (no lag)
    [ENERGY] Proper infinite energy via value hooking
    [HITBOX] NPC/Mob hitbox expansion
    [CHEST]  Collect 3 then reset (anti-kick)
    [MISC]   Kill Aura, Auto Haki, Mastery Farm, No Clip, Anti-AFK
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
-- CORE GAME REFERENCES (Blox Fruits Specific)
-- ============================================================================

-- Remote Function (main communication)
local RemoteFunction = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")

-- Helper to call game remotes safely
local function invokeRemote(...)
    local args = {...}
    local success, result = pcall(function()
        return RemoteFunction:InvokeServer(unpack(args))
    end)
    if success then
        return result
    end
    return nil
end

-- Get player data values
local function getDataValue(name)
    local data = LocalPlayer:FindFirstChild("Data")
    if data then
        local value = data:FindFirstChild(name)
        if value then
            return value.Value
        end
    end
    return nil
end

local function getLevel() return getDataValue("Level") or 1 end
local function getBeli() return getDataValue("Beli") or 0 end
local function getFragments() return getDataValue("Fragments") or 0 end
local function getExp() return getDataValue("Exp") or 0 end

-- ============================================================================
-- COMPLETE SEA 1 DATABASE (Researched & Verified)
-- ============================================================================

-- Quest Database: Exact quest names and mob names from game
local Sea1Quests = {
    -- Level Range, Quest Title (for remote), Mob Name, Quest NPC CFrame, Mob Spawn CFrame
    {Min = 0, Max = 10, Quest = "Bandit", Mob = "Bandit", 
     QuestNPC = CFrame.new(1059.15234, 16.5500031, 1546.81445),
     MobArea = CFrame.new(1095.86, 17.05, 1602.34)},
    
    {Min = 10, Max = 15, Quest = "Monkey", Mob = "Monkey",
     QuestNPC = CFrame.new(-1600.33, 36.35, 149.74),
     MobArea = CFrame.new(-1448.47, 50.85, 53.26)},
    
    {Min = 15, Max = 30, Quest = "Gorilla", Mob = "Gorilla",
     QuestNPC = CFrame.new(-1138.87, 14.35, -520.33),
     MobArea = CFrame.new(-1090.55, 14.05, -577.49)},
    
    {Min = 30, Max = 60, Quest = "Pirate", Mob = "Pirate",
     QuestNPC = CFrame.new(-1140.54, 4.35, 3830.16),
     MobArea = CFrame.new(-1104.76, 4.05, 3872.54)},
    
    {Min = 60, Max = 90, Quest = "BuggyPirate", Mob = "Brute",
     QuestNPC = CFrame.new(-1140.54, 4.35, 3830.16),
     MobArea = CFrame.new(-1163.53, 4.05, 3874.18)},
    
    {Min = 90, Max = 120, Quest = "DesertBandit", Mob = "Desert Bandit",
     QuestNPC = CFrame.new(894.42, 6.52, 4391.11),
     MobArea = CFrame.new(1078.77, 6.42, 4128.16)},
    
    {Min = 120, Max = 150, Quest = "DesertOfficer", Mob = "Desert Officer",
     QuestNPC = CFrame.new(894.42, 6.52, 4391.11),
     MobArea = CFrame.new(1542.02, 11.92, 4436.38)},
    
    {Min = 150, Max = 180, Quest = "SnowBandit", Mob = "Snow Bandit",
     QuestNPC = CFrame.new(1386.09, 87.35, -1296.04),
     MobArea = CFrame.new(1363.96, 87.05, -1273.92)},
    
    {Min = 180, Max = 210, Quest = "SnowOfficer", Mob = "Snowman",
     QuestNPC = CFrame.new(1386.09, 87.35, -1296.04),
     MobArea = CFrame.new(1237.93, 138.55, -1486.86)},
    
    {Min = 210, Max = 250, Quest = "MarineCadet", Mob = "Marine Rear Admiral",
     QuestNPC = CFrame.new(-4914.26, 50.35, 4279.22),
     MobArea = CFrame.new(-4846.62, 56.35, 4334.04)},
    
    {Min = 250, Max = 275, Quest = "MarineRecrut", Mob = "Marine Captain",
     QuestNPC = CFrame.new(-4914.26, 50.35, 4279.22),
     MobArea = CFrame.new(-4914.75, 77.85, 4387.65)},
    
    {Min = 275, Max = 300, Quest = "SkyBandit", Mob = "Sky Bandit",
     QuestNPC = CFrame.new(-4840.76, 716.52, -2622.84),
     MobArea = CFrame.new(-4943.75, 717.35, -2804.06)},
    
    {Min = 300, Max = 330, Quest = "DarkMaster", Mob = "Dark Master",
     QuestNPC = CFrame.new(-4840.76, 716.52, -2622.84),
     MobArea = CFrame.new(-5125.67, 304.35, -2862.72)},
    
    {Min = 330, Max = 375, Quest = "Prisoner", Mob = "Prisoner",
     QuestNPC = CFrame.new(4878.48, 5.52, 744.92),
     MobArea = CFrame.new(4948.54, 5.64, 734.54)},
    
    {Min = 375, Max = 400, Quest = "DangerousPrisoner", Mob = "Dangerous Prisoner",
     QuestNPC = CFrame.new(5227.93, 0.52, 479.41),
     MobArea = CFrame.new(5189.67, 1.05, 557.75)},
    
    {Min = 400, Max = 450, Quest = "TorturedPrisoner", Mob = "Scared Prisoner",
     QuestNPC = CFrame.new(5227.93, 0.52, 479.41),
     MobArea = CFrame.new(5364.62, 1.34, 475.76)},
    
    {Min = 450, Max = 475, Quest = "Gladiator", Mob = "Toga Warrior",
     QuestNPC = CFrame.new(-1580.69, 7.35, -2985.88),
     MobArea = CFrame.new(-1429.77, 7.55, -2823.15)},
    
    {Min = 475, Max = 525, Quest = "MagmaNinja", Mob = "Military Soldier",
     QuestNPC = CFrame.new(-5314.02, 12.35, 8515.71),
     MobArea = CFrame.new(-5471.04, 12.35, 8519.84)},
    
    {Min = 525, Max = 550, Quest = "MagmaSoldier", Mob = "Military Spy",
     QuestNPC = CFrame.new(-5314.02, 12.35, 8515.71),
     MobArea = CFrame.new(-5656.52, 46.05, 8640.29)},
    
    {Min = 550, Max = 625, Quest = "FishmanWarrior", Mob = "Fishman Warrior",
     QuestNPC = CFrame.new(61076.34, 11.50, 1580.42),
     MobArea = CFrame.new(61235.23, 11.50, 1584.75)},
    
    {Min = 625, Max = 675, Quest = "FishmanCommando", Mob = "Fishman Commando",
     QuestNPC = CFrame.new(61509.16, 11.50, 1241.27),
     MobArea = CFrame.new(61633.76, 11.50, 1298.45)},
    
    {Min = 675, Max = 700, Quest = "GodGuard", Mob = "God's Guard",
     QuestNPC = CFrame.new(-7862.28, 5545.55, -379.71),
     MobArea = CFrame.new(-7920.47, 5546.35, -506.85)},
}

-- Boss Database with spawn times
local Sea1Bosses = {
    {Name = "Gorilla King", Level = 25, CFrame = CFrame.new(-1129.09, 15.55, -605.25), SpawnTime = 0},
    {Name = "Bobby", Level = 55, CFrame = CFrame.new(-1174.97, 4.55, 3809.93), SpawnTime = 0},
    {Name = "Yeti", Level = 110, CFrame = CFrame.new(1194.79, 137.55, -1355.08), SpawnTime = 0},
    {Name = "Mob Leader", Level = 120, CFrame = CFrame.new(-1134.30, 135.55, 5174.88), SpawnTime = 0},
    {Name = "Vice Admiral", Level = 130, CFrame = CFrame.new(-4846.98, 77.85, 4349.26), SpawnTime = 0},
    {Name = "Warden", Level = 175, CFrame = CFrame.new(5299.32, 0.55, 473.83), SpawnTime = 0},
    {Name = "Chief Warden", Level = 200, CFrame = CFrame.new(5579.44, 0.55, 314.18), SpawnTime = 0},
    {Name = "Swan", Level = 225, CFrame = CFrame.new(5522.22, 65.55, 869.10), SpawnTime = 0},
    {Name = "Saber Expert", Level = 200, CFrame = CFrame.new(-1447.42, 29.55, -29.94), SpawnTime = 0},
    {Name = "Magma Admiral", Level = 350, CFrame = CFrame.new(-5765.26, 48.55, 8881.88), SpawnTime = 0},
    {Name = "Fishman Lord", Level = 425, CFrame = CFrame.new(61364.95, 23.05, 1113.22), SpawnTime = 0},
    {Name = "Wysper", Level = 500, CFrame = CFrame.new(-7946.10, 5634.55, -1211.03), SpawnTime = 0},
    {Name = "Thunder God", Level = 575, CFrame = CFrame.new(-7920.10, 5634.55, -1426.50), SpawnTime = 0},
    -- Rare Bosses
    {Name = "The Saw", Level = 100, CFrame = CFrame.new(-292.23, 72.05, 2075.95), SpawnTime = 75*60, Rare = true},
    {Name = "Greybeard", Level = 750, CFrame = CFrame.new(-4988.31, 77.85, 4379.52), SpawnTime = 6*60*60, Rare = true},
}

-- Island Teleports
local Sea1Islands = {
    {Name = "Starter Island", CFrame = CFrame.new(1040, 50, 1547)},
    {Name = "Jungle", CFrame = CFrame.new(-1613, 80, 153)},
    {Name = "Pirate Village", CFrame = CFrame.new(-1139, 50, 3825)},
    {Name = "Desert", CFrame = CFrame.new(940, 50, 4325)},
    {Name = "Frozen Village", CFrame = CFrame.new(1192, 120, -1291)},
    {Name = "Marine Fortress", CFrame = CFrame.new(-4914, 90, 4281)},
    {Name = "Middle Island", CFrame = CFrame.new(-289, 100, 2071)},
    {Name = "Skylands", CFrame = CFrame.new(-4869, 750, -2622)},
    {Name = "Prison", CFrame = CFrame.new(4851, 50, 740)},
    {Name = "Colosseum", CFrame = CFrame.new(-1428, 50, -2858)},
    {Name = "Magma Village", CFrame = CFrame.new(-5280, 50, 8515)},
    {Name = "Underwater City", CFrame = CFrame.new(61163, 50, 1819)},
    {Name = "Upper Skylands", CFrame = CFrame.new(-7894, 5580, -380)},
    {Name = "Fountain City", CFrame = CFrame.new(5129, 70, 4106)},
    {Name = "Frozen Cave (Ice Admiral)", CFrame = CFrame.new(1579, -480, -528)},
}

-- ============================================================================
-- STATE & SETTINGS
-- ============================================================================

local State = {
    -- Farming
    AutoFarm = false,
    AutoQuest = false,
    BringMobs = false,
    FreezeMobs = false,
    KillAura = false,
    
    -- Boss
    AutoBoss = false,
    SelectedBoss = nil,
    ServerHopBoss = false,
    
    -- ESP
    MobESP = false,
    BossESP = false,
    PlayerESP = false,
    FruitESP = false,
    ChestESP = false,
    
    -- Utility
    FruitSniper = false,
    ChestFarm = false,
    
    -- Combat
    InfiniteEnergy = false,
    AutoHaki = false,
    HitboxExpand = false,
    
    -- Misc
    AutoStats = false,
    NoClip = false,
    AntiAFK = true,
    
    -- Performance
    FPSBoost = false,
}

local Settings = {
    -- Farm
    FarmHeight = 15, -- Height above mob
    FarmDistance = 3, -- Distance in front
    BringRadius = 100, -- Radius to bring mobs
    
    -- Tween
    TweenSpeed = 200, -- Studs per second
    
    -- Hitbox
    HitboxSize = 50, -- Expanded hitbox size
    
    -- Chest
    ChestsBeforeReset = 3,
    
    -- Stats
    StatPriority = "Melee",
    
    -- Boss
    BossName = nil,
}

-- Runtime
local Connections = {}
local ESPCache = {}
local CurrentTween = nil
local ChestCount = 0

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

-- ============================================================================
-- TWEEN MOVEMENT (Anti-Detection)
-- ============================================================================

local function stopCurrentTween()
    if CurrentTween then
        CurrentTween:Cancel()
        CurrentTween = nil
    end
end

local function tweenTo(targetCFrame, callback)
    stopCurrentTween()
    
    local hrp = getHRP()
    if not hrp then return end
    
    local distance = (hrp.Position - targetCFrame.Position).Magnitude
    local tweenTime = distance / Settings.TweenSpeed
    
    -- Minimum time to prevent instant teleport detection
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

local function tweenToPosition(position, yOffset)
    yOffset = yOffset or Settings.FarmHeight
    local targetCFrame = CFrame.new(position.X, position.Y + yOffset, position.Z)
    tweenTo(targetCFrame)
end

-- ============================================================================
-- MOB FUNCTIONS
-- ============================================================================

local function getEnemiesFolder()
    return Workspace:FindFirstChild("Enemies")
end

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
                -- Filter by name if specified
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

local function bringMob(mob)
    if not mob then return end
    
    local hrp = getHRP()
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    
    if hrp and mobHRP then
        mobHRP.CFrame = hrp.CFrame * CFrame.new(0, -Settings.FarmHeight + 3, Settings.FarmDistance)
    end
end

local function freezeMob(mob)
    if not mob then return end
    
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    if mobHRP then
        mobHRP.Anchored = true
        mobHRP.CanCollide = false
    end
end

local function unfreezeMob(mob)
    if not mob then return end
    
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    if mobHRP then
        mobHRP.Anchored = false
    end
end

local function bringAndFreezeMobs(targetName)
    local hrp = getHRP()
    if not hrp then return end
    
    local enemies = getEnemiesFolder()
    if not enemies then return end
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") then
            local hum = mob:FindFirstChildOfClass("Humanoid")
            local mobHRP = mob:FindFirstChild("HumanoidRootPart")
            
            if hum and hum.Health > 0 and mobHRP then
                if not targetName or mob.Name == targetName then
                    local dist = (hrp.Position - mobHRP.Position).Magnitude
                    if dist < Settings.BringRadius then
                        bringMob(mob)
                        if State.FreezeMobs then
                            freezeMob(mob)
                        end
                    end
                end
            end
        end
    end
end

-- ============================================================================
-- HITBOX EXPANDER
-- ============================================================================

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
-- ATTACK SYSTEM (Remote-Based, No Mouse Interference)
-- ============================================================================

local function equipTool(toolName)
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    local char = getCharacter()
    if not backpack or not char then return end
    
    -- Check if already equipped
    local equipped = char:FindFirstChildOfClass("Tool")
    if equipped and equipped.Name == toolName then return true end
    
    -- Find in backpack
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

local function getEquippedWeapon()
    local char = getCharacter()
    if char then
        return char:FindFirstChildOfClass("Tool")
    end
    return nil
end

local function attackWithWeapon()
    local weapon = getEquippedWeapon()
    if not weapon then return end
    
    -- Fire weapon remote (works for most weapons in Blox Fruits)
    local remote = weapon:FindFirstChild("RemoteEvent") or weapon:FindFirstChildOfClass("RemoteEvent")
    if remote then
        pcall(function()
            remote:FireServer()
        end)
    end
    
    -- Alternative: Use Click remote
    local clickRemote = weapon:FindFirstChild("Click")
    if clickRemote then
        pcall(function()
            clickRemote:FireServer()
        end)
    end
end

local function attackMob(mob)
    if not mob or not isAlive() then return end
    
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    local hrp = getHRP()
    
    if not mobHRP or not hrp then return end
    
    -- Position above mob
    local targetCFrame = mobHRP.CFrame * CFrame.new(0, Settings.FarmHeight, 0)
    hrp.CFrame = targetCFrame
    
    -- Look at mob
    hrp.CFrame = CFrame.lookAt(hrp.Position, mobHRP.Position)
    
    -- Attack using remote
    attackWithWeapon()
end

-- Kill Aura (attacks all nearby mobs)
local function killAura()
    local hrp = getHRP()
    if not hrp then return end
    
    local enemies = getEnemiesFolder()
    if not enemies then return end
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") then
            local hum = mob:FindFirstChildOfClass("Humanoid")
            local mobHRP = mob:FindFirstChild("HumanoidRootPart")
            
            if hum and hum.Health > 0 and mobHRP then
                local dist = (hrp.Position - mobHRP.Position).Magnitude
                if dist < 100 then
                    -- Damage via game mechanics
                    attackWithWeapon()
                end
            end
        end
    end
end

-- ============================================================================
-- QUEST SYSTEM (Proper Remote Calls)
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
    -- Return last quest if over max
    return Sea1Quests[#Sea1Quests]
end

local function acceptQuest(questData)
    if not questData then return false end
    
    -- Tween to NPC
    tweenTo(questData.QuestNPC * CFrame.new(0, 3, 0))
    task.wait(0.3)
    
    -- Accept quest via remote
    local result = invokeRemote("StartQuest", questData.Quest, 1)
    task.wait(0.2)
    
    return hasQuest()
end

local function getQuestMobName()
    -- Read from quest UI what mob we need
    local gui = LocalPlayer:FindFirstChild("PlayerGui")
    if gui then
        local main = gui:FindFirstChild("Main")
        if main then
            local quest = main:FindFirstChild("Quest")
            if quest then
                local container = quest:FindFirstChild("Container")
                if container then
                    local title = container:FindFirstChild("Title")
                    if title then
                        return title.Text
                    end
                end
            end
        end
    end
    return nil
end

-- ============================================================================
-- INFINITE ENERGY
-- ============================================================================

local EnergyHooked = false

local function hookEnergy()
    if EnergyHooked then return end
    
    local data = LocalPlayer:FindFirstChild("Data")
    if data then
        local energy = data:FindFirstChild("Energy")
        if energy then
            -- Keep energy at max
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
-- AUTO HAKI
-- ============================================================================

local function toggleHaki()
    -- Activate Enhancement (Buso) Haki
    invokeRemote("Buso")
end

local function startAutoHaki()
    if Connections.AutoHaki then return end
    
    Connections.AutoHaki = task.spawn(function()
        while State.AutoHaki do
            toggleHaki()
            task.wait(1)
        end
    end)
end

local function stopAutoHaki()
    if Connections.AutoHaki then
        task.cancel(Connections.AutoHaki)
        Connections.AutoHaki = nil
    end
end

-- ============================================================================
-- ESP SYSTEM (Optimized, No Lag)
-- ============================================================================

local ESPUpdateRate = 0.5 -- Update every 0.5 seconds (prevents lag)
local LastESPUpdate = 0

local function createESPBillboard(parent, text, color)
    local existing = parent:FindFirstChild("FamyyESP")
    if existing then return existing end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FamyyESP"
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = parent
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "Name"
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = text
    nameLabel.TextColor3 = color
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextScaled = true
    nameLabel.Parent = billboard
    
    local distLabel = Instance.new("TextLabel")
    distLabel.Name = "Distance"
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "0m"
    distLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    distLabel.TextStrokeTransparency = 0
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextScaled = true
    distLabel.Parent = billboard
    
    return billboard
end

local function removeESP(object)
    local esp = object:FindFirstChild("FamyyESP")
    if esp then
        esp:Destroy()
    end
    ESPCache[object] = nil
end

local function updateESPDistance(billboard)
    local hrp = getHRP()
    if not hrp or not billboard or not billboard.Parent then return end
    
    local parent = billboard.Parent
    local pos
    
    if parent:IsA("BasePart") then
        pos = parent.Position
    elseif parent:IsA("Model") then
        local primaryPart = parent:FindFirstChild("HumanoidRootPart") or parent.PrimaryPart
        if primaryPart then
            pos = primaryPart.Position
        end
    end
    
    if pos then
        local dist = math.floor((hrp.Position - pos).Magnitude)
        local distLabel = billboard:FindFirstChild("Distance")
        if distLabel then
            distLabel.Text = dist .. "m"
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
-- FRUIT SNIPER
-- ============================================================================

local function findFruits()
    local fruits = {}
    
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") and obj.Name:find("Fruit") then
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
    
    tweenTo(handle.CFrame * CFrame.new(0, 3, 0))
    task.wait(0.5)
    
    -- Touch to collect
    local hrp = getHRP()
    if hrp and firetouchinterest then
        firetouchinterest(hrp, handle, 0)
        task.wait(0.1)
        firetouchinterest(hrp, handle, 1)
    end
end

-- ============================================================================
-- CHEST FARM (With Anti-Kick Reset)
-- ============================================================================

local function findChests()
    local chests = {}
    
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj.Name == "Chest" or (obj.Name:find("Chest") and obj:IsA("Model")) then
            table.insert(chests, obj)
        end
    end
    
    return chests
end

local function collectChest(chest)
    if not chest then return false end
    
    local part = chest:IsA("BasePart") and chest or chest:FindFirstChildWhichIsA("BasePart")
    if not part then return false end
    
    tweenTo(part.CFrame * CFrame.new(0, 3, 0))
    task.wait(0.3)
    
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
-- NO CLIP
-- ============================================================================

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

-- ============================================================================
-- ANTI-AFK
-- ============================================================================

local function startAntiAFK()
    if Connections.AntiAFK then return end
    
    Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
        if VirtualUser then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end)
end

-- ============================================================================
-- AUTO STATS
-- ============================================================================

local function addStats()
    local data = LocalPlayer:FindFirstChild("Data")
    if not data then return end
    
    local points = data:FindFirstChild("Points")
    if not points or points.Value <= 0 then return end
    
    invokeRemote("AddPoint", Settings.StatPriority, 1)
end

-- ============================================================================
-- PERFORMANCE / FPS BOOST
-- ============================================================================

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

-- ============================================================================
-- MAIN FARM LOOP
-- ============================================================================

local function startAutoFarm()
    if Connections.AutoFarm then return end
    
    Connections.AutoFarm = task.spawn(function()
        while State.AutoFarm do
            if not isAlive() then
                task.wait(1)
                -- Wait for respawn
                repeat task.wait(0.5) until isAlive()
                task.wait(0.5)
            end
            
            local level = getLevel()
            local questData = getQuestForLevel(level)
            
            if questData then
                -- Accept quest if needed
                if not hasQuest() then
                    acceptQuest(questData)
                    task.wait(0.5)
                end
                
                -- Farm mobs
                if hasQuest() then
                    local mobName = questData.Mob
                    local mob = getNearestMob(mobName, 9999)
                    
                    if mob then
                        local mobHRP = mob:FindFirstChild("HumanoidRootPart")
                        if mobHRP then
                            -- Tween to mob (above it)
                            local targetPos = mobHRP.CFrame * CFrame.new(0, Settings.FarmHeight, 0)
                            tweenTo(targetPos)
                            
                            -- Bring and freeze mobs
                            if State.BringMobs or State.FreezeMobs then
                                bringAndFreezeMobs(mobName)
                            end
                            
                            -- Expand hitbox
                            if State.HitboxExpand then
                                expandHitbox(mob, Settings.HitboxSize)
                            end
                            
                            -- Attack
                            attackMob(mob)
                            
                            -- Kill aura
                            if State.KillAura then
                                killAura()
                            end
                        end
                    else
                        -- No mob found, go to spawn area
                        tweenTo(questData.MobArea * CFrame.new(0, Settings.FarmHeight, 0))
                    end
                end
            end
            
            -- Auto haki
            if State.AutoHaki then
                toggleHaki()
            end
            
            -- Auto stats
            if State.AutoStats then
                addStats()
            end
            
            task.wait(0.1)
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
            
            if Settings.BossName then
                local boss = getMobByName(Settings.BossName)
                
                if boss then
                    local bossHRP = boss:FindFirstChild("HumanoidRootPart")
                    local bossHum = boss:FindFirstChildOfClass("Humanoid")
                    
                    if bossHRP and bossHum then
                        -- Tween to boss
                        tweenTo(bossHRP.CFrame * CFrame.new(0, Settings.FarmHeight, 0))
                        
                        while bossHum and bossHum.Health > 0 and State.AutoBoss do
                            attackMob(boss)
                            task.wait(0.1)
                        end
                        
                        Window.Notify("Boss Farm", Settings.BossName .. " killed!", 2, "success")
                        
                        if State.ServerHopBoss then
                            task.wait(1)
                            -- Server hop
                            TeleportService:Teleport(game.PlaceId, LocalPlayer)
                        end
                    end
                else
                    -- Boss not spawned, wait
                    task.wait(1)
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
                                local esp = createESPBillboard(mob, mob.Name, Color3.fromRGB(255, 100, 100))
                                ESPCache[mob] = esp
                            else
                                updateESPDistance(ESPCache[mob])
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
                    updateESPDistance(ESPCache[fruit])
                end
            end
            task.wait(ESPUpdateRate)
        end
    end)
end

local function stopFruitESP()
    State.FruitESP = false
end

local function startFruitSniper()
    if Connections.FruitSniper then return end
    
    Connections.FruitSniper = task.spawn(function()
        while State.FruitSniper do
            local fruits = findFruits()
            if #fruits > 0 then
                snipeFruit(fruits[1])
            end
            task.wait(1)
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
                    
                    if ChestCount >= Settings.ChestsBeforeReset then
                        Window.Notify("Chest Farm", "Collected " .. ChestCount .. " chests, resetting...", 2, "info")
                        ChestCount = 0
                        resetCharacter()
                        task.wait(3) -- Wait for respawn
                    end
                end
                
                task.wait(0.3)
            end
            
            task.wait(1)
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
local FarmTab = Window:CreateTab("Farm")
local BossTab = Window:CreateTab("Boss")
local ESPTab = Window:CreateTab("ESP")
local UtilityTab = Window:CreateTab("Utility")
local TeleportTab = Window:CreateTab("Teleport")
local SettingsTab = Window:CreateTab("Settings")

-- === FARM TAB ===
local AutoFarmSection = FarmTab:CreateSection("Auto Farm", true)

AutoFarmSection:AddToggle({
    Label = "Auto Farm",
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

AutoFarmSection:AddToggle({
    Label = "Bring Mobs",
    Default = false,
    Callback = function(v)
        State.BringMobs = v
    end
})

AutoFarmSection:AddToggle({
    Label = "Freeze Mobs",
    Default = false,
    Callback = function(v)
        State.FreezeMobs = v
    end
})

AutoFarmSection:AddToggle({
    Label = "Kill Aura",
    Default = false,
    Callback = function(v)
        State.KillAura = v
    end
})

AutoFarmSection:AddToggle({
    Label = "Hitbox Expander",
    Default = false,
    Callback = function(v)
        State.HitboxExpand = v
    end
})

AutoFarmSection:AddSlider({
    Label = "Farm Height",
    Min = 5,
    Max = 50,
    Default = 15,
    Callback = function(v)
        Settings.FarmHeight = v
    end
})

AutoFarmSection:AddSlider({
    Label = "Tween Speed",
    Min = 50,
    Max = 500,
    Default = 200,
    Callback = function(v)
        Settings.TweenSpeed = v
    end
})

AutoFarmSection:AddSlider({
    Label = "Hitbox Size",
    Min = 10,
    Max = 100,
    Default = 50,
    Callback = function(v)
        Settings.HitboxSize = v
    end
})

-- Combat Section
local CombatSection = FarmTab:CreateSection("Combat", true)

CombatSection:AddToggle({
    Label = "Infinite Energy",
    Default = false,
    Callback = function(v)
        State.InfiniteEnergy = v
        if v then
            hookEnergy()
        end
    end
})

CombatSection:AddToggle({
    Label = "Auto Haki",
    Default = false,
    Callback = function(v)
        State.AutoHaki = v
    end
})

CombatSection:AddToggle({
    Label = "No Clip",
    Default = false,
    Callback = function(v)
        State.NoClip = v
        if v then
            startNoClip()
        else
            stopNoClip()
        end
    end
})

-- === BOSS TAB ===
local BossFarmSection = BossTab:CreateSection("Boss Farm", true)

BossFarmSection:AddToggle({
    Label = "Auto Boss",
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

BossFarmSection:AddToggle({
    Label = "Server Hop After Kill",
    Default = false,
    Callback = function(v)
        State.ServerHopBoss = v
    end
})

-- Boss selection buttons instead of dropdown (dropdown has issues)
local BossListSection = BossTab:CreateSection("Select Boss", false)

for _, boss in ipairs(Sea1Bosses) do
    local label = boss.Name .. " [Lv." .. boss.Level .. "]"
    if boss.Rare then
        label = "[RARE] " .. label
    end
    
    BossListSection:AddButton({
        Label = label,
        Style = boss.Rare and "primary" or "secondary",
        Callback = function()
            Settings.BossName = boss.Name
            Window.Notify("Boss Farm", "Selected: " .. boss.Name, 2, "info")
        end
    })
end

-- === ESP TAB ===
local ESPSection = ESPTab:CreateSection("ESP Options", true)

ESPSection:AddToggle({
    Label = "Mob ESP",
    Default = false,
    Callback = function(v)
        State.MobESP = v
        if v then
            startMobESP()
        else
            stopMobESP()
        end
    end
})

ESPSection:AddToggle({
    Label = "Fruit ESP",
    Default = false,
    Callback = function(v)
        State.FruitESP = v
        if v then
            startFruitESP()
        else
            stopFruitESP()
        end
    end
})

ESPSection:AddButton({
    Label = "Clear All ESP",
    Style = "danger",
    Callback = function()
        clearAllESP()
        Window.Notify("ESP", "Cleared all ESP", 2, "info")
    end
})

-- === UTILITY TAB ===
local FruitSection = UtilityTab:CreateSection("Fruits", true)

FruitSection:AddToggle({
    Label = "Fruit Sniper",
    Default = false,
    Callback = function(v)
        State.FruitSniper = v
        if v then
            startFruitSniper()
            Window.Notify("Fruit Sniper", "Active!", 2, "success")
        else
            stopFruitSniper()
        end
    end
})

FruitSection:AddButton({
    Label = "Scan Fruits",
    Style = "secondary",
    Callback = function()
        local fruits = findFruits()
        Window.Notify("Fruit Scan", "Found " .. #fruits .. " fruits", 2, "info")
    end
})

local ChestSection = UtilityTab:CreateSection("Chests", true)

ChestSection:AddToggle({
    Label = "Chest Farm",
    Default = false,
    Callback = function(v)
        State.ChestFarm = v
        if v then
            startChestFarm()
            Window.Notify("Chest Farm", "Started! Resets after 3 chests.", 2, "success")
        else
            stopChestFarm()
        end
    end
})

ChestSection:AddSlider({
    Label = "Chests Before Reset",
    Min = 1,
    Max = 10,
    Default = 3,
    Callback = function(v)
        Settings.ChestsBeforeReset = v
    end
})

-- === TELEPORT TAB ===
local IslandSection = TeleportTab:CreateSection("Islands", true)

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

-- === SETTINGS TAB ===
local StatSection = SettingsTab:CreateSection("Auto Stats", true)

StatSection:AddToggle({
    Label = "Auto Stats",
    Default = false,
    Callback = function(v)
        State.AutoStats = v
    end
})

-- Stat priority buttons
local StatPrioritySection = SettingsTab:CreateSection("Stat Priority", false)

for _, stat in ipairs({"Melee", "Defense", "Sword", "Gun", "Blox Fruit"}) do
    StatPrioritySection:AddButton({
        Label = stat,
        Style = "secondary",
        Callback = function()
            Settings.StatPriority = stat
            Window.Notify("Stats", "Priority: " .. stat, 2, "info")
        end
    })
end

local PerfSection = SettingsTab:CreateSection("Performance", true)

PerfSection:AddToggle({
    Label = "FPS Boost",
    Default = false,
    Callback = function(v)
        State.FPSBoost = v
        if v then
            enableFPSBoost()
        end
    end
})

local MiscSection = SettingsTab:CreateSection("Misc", true)

MiscSection:AddButton({
    Label = "Server Hop",
    Style = "secondary",
    Callback = function()
        Window.Notify("Server Hop", "Finding new server...", 2, "info")
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

MiscSection:AddButton({
    Label = "Rejoin",
    Style = "secondary",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

-- Player info
local InfoSection = SettingsTab:CreateSection("Player Info", true)

local levelLabel = InfoSection:AddLabel({Text = "Level: " .. getLevel(), Bold = true})
local beliLabel = InfoSection:AddLabel({Text = "Beli: $" .. getBeli()})

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            levelLabel:SetText("Level: " .. getLevel())
            beliLabel:SetText("Beli: $" .. getBeli())
        end)
    end
end)

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

-- Start Anti-AFK
startAntiAFK()

-- Hook energy system
hookEnergy()

-- Notify
Window.Notify("Blox Fruits v3.0", "Loaded! Level: " .. getLevel(), 3, "success")

print("================================================================================")
print("[FAMYY PRIVATE] Blox Fruits Sea 1 v3.0")
print("================================================================================")
print("Features:")
print("  - Remote-based attacks (no mouse interference)")
print("  - Proper quest system via game remotes")
print("  - Mob bringing + freezing")
print("  - Tween movement (anti-detection)")
print("  - Optimized ESP (no lag)")
print("  - Hitbox expander")
print("  - Kill aura, Auto Haki, Infinite Energy")
print("  - Chest farm with anti-kick reset")
print("================================================================================")

return Library
