--[[
    ██████╗ ██╗      ██████╗ ██╗  ██╗    ███████╗██████╗ ██╗   ██╗██╗████████╗███████╗
    ██╔══██╗██║     ██╔═══██╗╚██╗██╔╝    ██╔════╝██╔══██╗██║   ██║██║╚══██╔══╝██╔════╝
    ██████╔╝██║     ██║   ██║ ╚███╔╝     █████╗  ██████╔╝██║   ██║██║   ██║   ███████╗
    ██╔══██╗██║     ██║   ██║ ██╔██╗     ██╔══╝  ██╔══██╗██║   ██║██║   ██║   ╚════██║
    ██████╔╝███████╗╚██████╔╝██╔╝ ██╗    ██║     ██║  ██║╚██████╔╝██║   ██║   ███████║
    ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝   ╚═╝   ╚══════╝
    
    FAMYY PRIVATE - Blox Fruits Sea 1 Script v5.0
    COMPLETE REWRITE - Based on working script mechanics
    
    SEA 1 ONLY - No fragments, microchips, or Sea 2+ content
]]

-- ============================================================================
-- ANTI-AFK (Disable idle connections - with fallback)
-- ============================================================================
pcall(function()
    if getconnections then
        for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
            v:Disable()
        end
    end
end)

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
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

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
-- GLOBAL FLAGS (for toggle states)
-- ============================================================================
_G.AutoFarm = false
_G.AutoFarmNearest = false
_G.AutoBoss = false
_G.BringMobs = true
_G.FreezeMobs = true
_G.KillAura = true
_G.AutoHaki = true
_G.AutoObsHaki = false
_G.InfiniteEnergy = true
_G.HitboxExpander = true
_G.FastAttack = true
_G.SafeMode = false
_G.AntiStuck = true
_G.DoubleQuest = false

_G.AutoMasterySwrd = false
_G.AutoMasteryGun = false
_G.AutoMasteryFruit = false

_G.AutoSaber = false
_G.AutoPole = false
_G.AutoTrident = false
_G.AutoSaw = false
_G.AutoGreybeard = false
_G.AutoBlackCape = false
_G.AutoTomoeRing = false
_G.AutoPipe = false
_G.AutoGeppo = false
_G.AutoSoru = false

_G.AutoStatsMelee = false
_G.AutoStatsDefense = false
_G.AutoStatsSword = false
_G.AutoStatsGun = false
_G.AutoStatsFruit = false

_G.PlayerKillAura = false
_G.ClickTP = false
_G.NoCooldown = false
_G.AutoBounty = false

_G.MobESP = false
_G.FruitESP = false
_G.ChestESP = false
_G.PlayerESP = false
_G.BossESP = false

_G.InfiniteJump = false
_G.Fly = false
_G.NoClip = false
_G.SpinBot = false
_G.WalkOnWater = false

_G.ChestFarm = false
_G.FruitSniper = false
_G.RemoveFog = false
_G.FPSBoost = false

-- Settings
_G.SelectedWeapon = nil
_G.SelectedBoss = nil
_G.SelectedIsland = nil
_G.AttackDelay = 0
_G.TweenSpeed = 300
_G.HitboxSize = 60
_G.BringRadius = 150
_G.KillAuraRange = 50
_G.FarmHeight = 20
_G.StatPoints = 3
_G.WalkSpeed = 16
_G.JumpPower = 50
_G.FlySpeed = 100
_G.ChestsBeforeReset = 3
_G.MasteryHealthThreshold = 30

-- ============================================================================
-- COMPLETE SEA 1 QUEST DATABASE (Correct format from working scripts)
-- ============================================================================
local Sea1Quests = {
    -- Pirate Starter (Lv. 0-9)
    {Min = 0, Max = 9, Quest = "BanditQuest1", LQ = 1, MobDisplay = "Bandit [Lv. 5]", Mob = "Bandit", QuestNPC = CFrame.new(1060.49, 15.35, 1547.46), MobArea = CFrame.new(1095, 17, 1602)},
    
    -- Jungle (Lv. 10-29)
    {Min = 10, Max = 14, Quest = "MonkeyQuest1", LQ = 1, MobDisplay = "Monkey [Lv. 14]", Mob = "Monkey", QuestNPC = CFrame.new(-1600.51, 36.85, 154.23), MobArea = CFrame.new(-1448, 51, 53)},
    {Min = 15, Max = 29, Quest = "GorillaQuest1", LQ = 1, MobDisplay = "Gorilla [Lv. 20]", Mob = "Gorilla", QuestNPC = CFrame.new(-1600.51, 36.85, 154.23), MobArea = CFrame.new(-1091, 14, -577)},
    
    -- Pirate Village (Lv. 30-59)
    {Min = 30, Max = 39, Quest = "PirateQuest1", LQ = 1, MobDisplay = "Pirate [Lv. 35]", Mob = "Pirate", QuestNPC = CFrame.new(-1139.59, 4.75, 3824.98), MobArea = CFrame.new(-1105, 4, 3873)},
    {Min = 40, Max = 59, Quest = "BruteQuest1", LQ = 1, MobDisplay = "Brute [Lv. 45]", Mob = "Brute", QuestNPC = CFrame.new(-1139.59, 4.75, 3824.98), MobArea = CFrame.new(-1164, 4, 3874)},
    
    -- Desert (Lv. 60-89)
    {Min = 60, Max = 74, Quest = "DesertBanditQuest1", LQ = 1, MobDisplay = "Desert Bandit [Lv. 60]", Mob = "Desert Bandit", QuestNPC = CFrame.new(892.17, 6.52, 4389.63), MobArea = CFrame.new(1079, 6, 4128)},
    {Min = 75, Max = 89, Quest = "DesertOfficerQuest1", LQ = 1, MobDisplay = "Desert Officer [Lv. 70]", Mob = "Desert Officer", QuestNPC = CFrame.new(892.17, 6.52, 4389.63), MobArea = CFrame.new(1542, 12, 4436)},
    
    -- Frozen Village (Lv. 90-119)
    {Min = 90, Max = 99, Quest = "SnowBanditQuest1", LQ = 1, MobDisplay = "Snow Bandit [Lv. 90]", Mob = "Snow Bandit", QuestNPC = CFrame.new(1384.77, 87.30, -1296.08), MobArea = CFrame.new(1364, 87, -1274)},
    {Min = 100, Max = 119, Quest = "SnowmanQuest1", LQ = 1, MobDisplay = "Snowman [Lv. 100]", Mob = "Snowman", QuestNPC = CFrame.new(1384.77, 87.30, -1296.08), MobArea = CFrame.new(1238, 139, -1487)},
    
    -- Marine Fortress (Lv. 120-149)
    {Min = 120, Max = 129, Quest = "ChiefPettyOfficerQuest1", LQ = 1, MobDisplay = "Chief Petty Officer [Lv. 120]", Mob = "Chief Petty Officer", QuestNPC = CFrame.new(-5035.42, 28.85, 4324.50), MobArea = CFrame.new(-4847, 56, 4334)},
    {Min = 130, Max = 149, Quest = "MarineCaptainQuest1", LQ = 1, MobDisplay = "Marine Captain [Lv. 130]", Mob = "Marine Captain", QuestNPC = CFrame.new(-5035.42, 28.85, 4324.50), MobArea = CFrame.new(-4915, 78, 4388)},
    
    -- Skylands (Lv. 150-189)
    {Min = 150, Max = 174, Quest = "SkyBanditQuest1", LQ = 1, MobDisplay = "Sky Bandit [Lv. 150]", Mob = "Sky Bandit", QuestNPC = CFrame.new(-4840.36, 717.67, -2623.89), MobArea = CFrame.new(-4944, 717, -2804)},
    {Min = 175, Max = 189, Quest = "DarkMasterQuest1", LQ = 1, MobDisplay = "Dark Master [Lv. 175]", Mob = "Dark Master", QuestNPC = CFrame.new(-4840.36, 717.67, -2623.89), MobArea = CFrame.new(-5126, 304, -2863)},
    
    -- Prison (Lv. 190-249)
    {Min = 190, Max = 209, Quest = "PrisonerQuest1", LQ = 1, MobDisplay = "Prisoner [Lv. 190]", Mob = "Prisoner", QuestNPC = CFrame.new(4852.40, 5.65, 739.50), MobArea = CFrame.new(4949, 6, 735)},
    {Min = 210, Max = 229, Quest = "DangerousPrisonerQuest1", LQ = 1, MobDisplay = "Dangerous Prisoner [Lv. 210]", Mob = "Dangerous Prisoner", QuestNPC = CFrame.new(5232.17, 5.65, 479.60), MobArea = CFrame.new(5190, 1, 558)},
    {Min = 230, Max = 249, Quest = "ScaredPrisonerQuest1", LQ = 1, MobDisplay = "Scared Prisoner [Lv. 230]", Mob = "Scared Prisoner", QuestNPC = CFrame.new(5232.17, 5.65, 479.60), MobArea = CFrame.new(5365, 1, 476)},
    
    -- Colosseum (Lv. 250-299)
    {Min = 250, Max = 274, Quest = "TogaWarriorQuest1", LQ = 1, MobDisplay = "Toga Warrior [Lv. 250]", Mob = "Toga Warrior", QuestNPC = CFrame.new(-1575.73, 7.39, -2983.13), MobArea = CFrame.new(-1430, 8, -2823)},
    {Min = 275, Max = 299, Quest = "GladiatorQuest1", LQ = 1, MobDisplay = "Gladiator [Lv. 275]", Mob = "Gladiator", QuestNPC = CFrame.new(-1575.73, 7.39, -2983.13), MobArea = CFrame.new(-1500, 8, -2900)},
    
    -- Magma Village (Lv. 300-374)
    {Min = 300, Max = 324, Quest = "MilitarySoldierQuest1", LQ = 1, MobDisplay = "Military Soldier [Lv. 300]", Mob = "Military Soldier", QuestNPC = CFrame.new(-5316.55, 12.00, 8517.80), MobArea = CFrame.new(-5471, 12, 8520)},
    {Min = 325, Max = 374, Quest = "MilitarySpyQuest1", LQ = 1, MobDisplay = "Military Spy [Lv. 330]", Mob = "Military Spy", QuestNPC = CFrame.new(-5316.55, 12.00, 8517.80), MobArea = CFrame.new(-5657, 46, 8640)},
    
    -- Underwater City (Lv. 375-449)
    {Min = 375, Max = 399, Quest = "FishmanWarriorQuest1", LQ = 1, MobDisplay = "Fishman Warrior [Lv. 375]", Mob = "Fishman Warrior", QuestNPC = CFrame.new(61097.86, 11.43, 1571.68), MobArea = CFrame.new(61235, 12, 1585)},
    {Min = 400, Max = 449, Quest = "FishmanCommandoQuest1", LQ = 1, MobDisplay = "Fishman Commando [Lv. 400]", Mob = "Fishman Commando", QuestNPC = CFrame.new(61097.86, 11.43, 1571.68), MobArea = CFrame.new(61634, 12, 1298)},
    
    -- Upper Skylands (Lv. 450-574)
    {Min = 450, Max = 474, Quest = "GodsGuardQuest1", LQ = 1, MobDisplay = "God's Guard [Lv. 450]", Mob = "God's Guard", QuestNPC = CFrame.new(-4721.32, 843.85, -1949.29), MobArea = CFrame.new(-7920, 5546, -507)},
    {Min = 475, Max = 524, Quest = "ShandaQuest1", LQ = 1, MobDisplay = "Shanda [Lv. 475]", Mob = "Shanda", QuestNPC = CFrame.new(-7862.65, 5545.52, -379.83), MobArea = CFrame.new(-7950, 5546, -600)},
    {Min = 525, Max = 549, Quest = "RoyalSquadQuest1", LQ = 1, MobDisplay = "Royal Squad [Lv. 525]", Mob = "Royal Squad", QuestNPC = CFrame.new(-7862.65, 5545.52, -379.83), MobArea = CFrame.new(-7900, 5546, -500)},
    {Min = 550, Max = 574, Quest = "RoyalSoldierQuest1", LQ = 1, MobDisplay = "Royal Soldier [Lv. 550]", Mob = "Royal Soldier", QuestNPC = CFrame.new(-7862.65, 5545.52, -379.83), MobArea = CFrame.new(-7920, 5546, -550)},
    
    -- Fountain City (Lv. 625-699)
    {Min = 625, Max = 649, Quest = "GalleyPirateQuest1", LQ = 1, MobDisplay = "Galley Pirate [Lv. 625]", Mob = "Galley Pirate", QuestNPC = CFrame.new(5254.98, 38.26, 4049.27), MobArea = CFrame.new(5300, 40, 4100)},
    {Min = 650, Max = 674, Quest = "GalleyCaptainQuest1", LQ = 1, MobDisplay = "Galley Captain [Lv. 650]", Mob = "Galley Captain", QuestNPC = CFrame.new(5254.98, 38.26, 4049.27), MobArea = CFrame.new(5350, 40, 4150)},
    {Min = 675, Max = 699, Quest = "CyborgQuest1", LQ = 1, MobDisplay = "Cyborg [Lv. 675]", Mob = "Cyborg", QuestNPC = CFrame.new(5254.98, 38.26, 4049.27), MobArea = CFrame.new(5400, 40, 4200)},
    
    -- Level 700 cap for Sea 1
    {Min = 700, Max = 9999, Quest = "CyborgQuest1", LQ = 1, MobDisplay = "Cyborg [Lv. 675]", Mob = "Cyborg", QuestNPC = CFrame.new(5254.98, 38.26, 4049.27), MobArea = CFrame.new(5400, 40, 4200)},
}

-- Sea 1 Bosses
local Sea1Bosses = {
    {Name = "Gorilla King", Level = 25, CFrame = CFrame.new(-1129, 16, -605)},
    {Name = "Bobby", Level = 55, CFrame = CFrame.new(-1175, 5, 3810)},
    {Name = "Yeti", Level = 110, CFrame = CFrame.new(1195, 138, -1355)},
    {Name = "Mob Leader", Level = 120, CFrame = CFrame.new(-2880, 46, 5292)},
    {Name = "Vice Admiral", Level = 130, CFrame = CFrame.new(-4847, 78, 4349)},
    {Name = "Warden", Level = 220, CFrame = CFrame.new(5299, 1, 474)},
    {Name = "Chief Warden", Level = 230, CFrame = CFrame.new(5579, 1, 314)},
    {Name = "Swan", Level = 240, CFrame = CFrame.new(5522, 66, 869)},
    {Name = "Saber Expert", Level = 200, CFrame = CFrame.new(-1447, 30, -30)},
    {Name = "Magma Admiral", Level = 350, CFrame = CFrame.new(-5765, 49, 8882)},
    {Name = "Fishman Lord", Level = 425, CFrame = CFrame.new(61365, 23, 1113)},
    {Name = "Wysper", Level = 500, CFrame = CFrame.new(-7946, 5635, -1211)},
    {Name = "Thunder God", Level = 575, CFrame = CFrame.new(-7920, 5635, -1427)},
    -- Rare
    {Name = "The Saw", Level = 100, CFrame = CFrame.new(-292, 72, 2076), Rare = true},
    {Name = "Greybeard", Level = 750, CFrame = CFrame.new(-4988, 78, 4380), Rare = true},
    {Name = "Ice Admiral", Level = 700, CFrame = CFrame.new(1579, -480, -528), Rare = true},
}

-- Sea 1 Islands
local Sea1Islands = {
    {Name = "Starter Island", CFrame = CFrame.new(1041.89, 16.27, 1424.94)},
    {Name = "Marine Starter", CFrame = CFrame.new(-2896.69, 41.49, 2009.27)},
    {Name = "Jungle", CFrame = CFrame.new(-1615.19, 36.85, 150.80)},
    {Name = "Pirate Village", CFrame = CFrame.new(-1146.43, 4.75, 3818.50)},
    {Name = "Desert", CFrame = CFrame.new(1094.32, 6.57, 4231.64)},
    {Name = "Frozen Village", CFrame = CFrame.new(1100.36, 5.29, -1151.54)},
    {Name = "Marine Fortress", CFrame = CFrame.new(-4846.15, 20.65, 4393.65)},
    {Name = "Middle Town", CFrame = CFrame.new(-705.99, 7.85, 1547.52)},
    {Name = "Skylands", CFrame = CFrame.new(-4967.84, 717.67, -2623.84)},
    {Name = "Upper Skylands", CFrame = CFrame.new(-7876.08, 5545.58, -381.20)},
    {Name = "Prison", CFrame = CFrame.new(4841.84, 5.65, 741.33)},
    {Name = "Colosseum", CFrame = CFrame.new(-1541.09, 7.39, -2987.41)},
    {Name = "Magma Village", CFrame = CFrame.new(-5248.27, 8.70, 8452.89)},
    {Name = "Underwater City", CFrame = CFrame.new(61135.29, 18.47, 1597.68)},
    {Name = "Fountain City", CFrame = CFrame.new(5529.72, 429.36, 4245.55)},
    {Name = "Blox Fruit Dealer", CFrame = CFrame.new(-2534, 5, 2060)},
    {Name = "Blox Fruit Gacha", CFrame = CFrame.new(-1442, 61, 4)},
}

-- Get tools from backpack
local function getTools()
    local tools = {}
    for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(tools, v.Name)
        end
    end
    local char = LocalPlayer.Character
    if char then
        for _, v in pairs(char:GetChildren()) do
            if v:IsA("Tool") then
                table.insert(tools, v.Name)
            end
        end
    end
    return tools
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

local function isAlive()
    local hum = getHumanoid()
    return hum and hum.Health > 0
end

local function getLevel()
    local data = LocalPlayer:FindFirstChild("Data")
    if data and data:FindFirstChild("Level") then
        return data.Level.Value
    end
    return 1
end

local function getBeli()
    local data = LocalPlayer:FindFirstChild("Data")
    if data and data:FindFirstChild("Beli") then
        return data.Beli.Value
    end
    return 0
end

-- ============================================================================
-- TELEPORT / TWEEN FUNCTIONS (From working script)
-- ============================================================================

local CurrentTween = nil

local function TP(targetCFrame)
    local hrp = getHRP()
    if not hrp then return end
    
    local distance = (targetCFrame.Position - hrp.Position).Magnitude
    local speed = _G.TweenSpeed
    
    -- Adaptive speed based on distance
    if distance < 10 then
        speed = 1000
    elseif distance < 170 then
        hrp.CFrame = targetCFrame
        return
    elseif distance < 1000 then
        speed = 350
    else
        speed = 300
    end
    
    if CurrentTween then
        CurrentTween:Cancel()
    end
    
    CurrentTween = TweenService:Create(
        hrp,
        TweenInfo.new(distance / speed, Enum.EasingStyle.Linear),
        {CFrame = targetCFrame}
    )
    CurrentTween:Play()
end

local function InstantTP(targetCFrame)
    local hrp = getHRP()
    if hrp then
        hrp.CFrame = targetCFrame
    end
end

local function StopTween()
    if CurrentTween then
        CurrentTween:Cancel()
        CurrentTween = nil
    end
end

-- ============================================================================
-- QUEST FUNCTIONS
-- ============================================================================

local function hasQuest()
    local gui = LocalPlayer:FindFirstChild("PlayerGui")
    if gui then
        local main = gui:FindFirstChild("Main")
        if main then
            local quest = main:FindFirstChild("Quest")
            return quest and quest.Visible
        end
    end
    return false
end

local function getQuestForLevel(level)
    for _, quest in ipairs(Sea1Quests) do
        if level >= quest.Min and level <= quest.Max then
            return quest
        end
    end
    return Sea1Quests[#Sea1Quests]
end

local function acceptQuest(questData)
    if not questData then return end
    
    TP(questData.QuestNPC)
    task.wait(0.9)
    
    -- Use correct quest format from working script
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", questData.Quest, questData.LQ)
end

-- ============================================================================
-- ATTACK FUNCTION (VirtualUser method from working script)
-- ============================================================================

local function Attack()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(0, 0))
    end)
end

-- ============================================================================
-- EQUIP WEAPON
-- ============================================================================

local function EquipWeapon(weaponName)
    if not weaponName then return end
    
    local char = getCharacter()
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    
    if not char or not backpack then return end
    
    -- Already equipped?
    local equipped = char:FindFirstChildOfClass("Tool")
    if equipped and equipped.Name == weaponName then return end
    
    -- Find and equip
    local tool = backpack:FindFirstChild(weaponName)
    if tool then
        local hum = getHumanoid()
        if hum then
            hum:EquipTool(tool)
        end
    end
end

-- ============================================================================
-- MOB FUNCTIONS
-- ============================================================================

local function getMobByDisplayName(displayName)
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") and mob.Name == displayName then
            local hum = mob:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                return mob
            end
        end
    end
    return nil
end

local function getMobByName(name)
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") and mob.Name:find(name) then
            local hum = mob:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                return mob
            end
        end
    end
    return nil
end

local function getNearestMob(maxDist)
    local hrp = getHRP()
    if not hrp then return nil end
    
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    
    local nearest = nil
    local nearestDist = maxDist or 9999
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") then
            local hum = mob:FindFirstChildOfClass("Humanoid")
            local mobHRP = mob:FindFirstChild("HumanoidRootPart")
            
            if hum and hum.Health > 0 and mobHRP then
                local dist = (hrp.Position - mobHRP.Position).Magnitude
                if dist < nearestDist then
                    nearest = mob
                    nearestDist = dist
                end
            end
        end
    end
    
    return nearest
end

local function getAllMobsInRadius(targetName, radius)
    local hrp = getHRP()
    if not hrp then return {} end
    
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return {} end
    
    local mobs = {}
    
    for _, mob in ipairs(enemies:GetChildren()) do
        if mob:IsA("Model") then
            local hum = mob:FindFirstChildOfClass("Humanoid")
            local mobHRP = mob:FindFirstChild("HumanoidRootPart")
            
            if hum and hum.Health > 0 and mobHRP then
                if not targetName or mob.Name:find(targetName) or mob.Name == targetName then
                    local dist = (hrp.Position - mobHRP.Position).Magnitude
                    if dist < radius then
                        table.insert(mobs, mob)
                    end
                end
            end
        end
    end
    
    return mobs
end

-- ============================================================================
-- BRING MOBS & FREEZE (Based on working script hitbox method)
-- ============================================================================

local function BringMob(mob)
    if not mob then return end
    
    local hrp = getHRP()
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    
    if hrp and mobHRP then
        mobHRP.CFrame = hrp.CFrame * CFrame.new(0, -_G.FarmHeight + 3, 2)
    end
end

local function FreezeMob(mob)
    if not mob then return end
    
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    if mobHRP then
        mobHRP.Anchored = true
        mobHRP.CanCollide = false
    end
end

local function ExpandHitbox(mob)
    if not mob then return end
    
    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
    if mobHRP then
        mobHRP.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
        mobHRP.Transparency = 1
        mobHRP.CanCollide = false
    end
end

-- ============================================================================
-- AUTO HAKI
-- ============================================================================

local function ActivateBuso()
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end)
end

local function ActivateKen()
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Instinct")
    end)
end

-- ============================================================================
-- INFINITE ENERGY
-- ============================================================================

spawn(function()
    while task.wait(0.1) do
        if _G.InfiniteEnergy then
            local data = LocalPlayer:FindFirstChild("Data")
            if data then
                local energy = data:FindFirstChild("Energy")
                if energy then
                    energy.Value = 100
                end
            end
        end
    end
end)

-- ============================================================================
-- AUTO STATS
-- ============================================================================

local function AddStats(statName, amount)
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", statName, amount or 1)
    end)
end

spawn(function()
    while task.wait(0.5) do
        if _G.AutoStatsMelee then AddStats("Melee", _G.StatPoints) end
        if _G.AutoStatsDefense then AddStats("Defense", _G.StatPoints) end
        if _G.AutoStatsSword then AddStats("Sword", _G.StatPoints) end
        if _G.AutoStatsGun then AddStats("Gun", _G.StatPoints) end
        if _G.AutoStatsFruit then AddStats("Demon Fruit", _G.StatPoints) end
    end
end)

-- ============================================================================
-- MAIN AUTO FARM LOOP (Based on working pastebin script)
-- ============================================================================

spawn(function()
    while task.wait() do
        if _G.AutoFarm then
            if not isAlive() then
                task.wait(1)
                repeat task.wait(0.5) until isAlive()
                task.wait(0.5)
            end
            
            local level = getLevel()
            local questData = getQuestForLevel(level)
            
            if questData then
                -- Equip weapon
                if _G.SelectedWeapon then
                    EquipWeapon(_G.SelectedWeapon)
                end
                
                -- Check if quest active
                if not hasQuest() then
                    TP(questData.QuestNPC)
                    task.wait(0.9)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", questData.Quest, questData.LQ)
                else
                    -- Find mob with display name
                    local enemies = Workspace:FindFirstChild("Enemies")
                    if enemies then
                        for _, mob in ipairs(enemies:GetChildren()) do
                            if mob.Name == questData.MobDisplay then
                                local mobHRP = mob:FindFirstChild("HumanoidRootPart")
                                local hum = mob:FindFirstChildOfClass("Humanoid")
                                
                                if mobHRP and hum and hum.Health > 0 then
                                    -- Teleport above mob
                                    local farmPos = mobHRP.CFrame * CFrame.new(0, _G.FarmHeight, 0)
                                    if _G.SafeMode then
                                        farmPos = mobHRP.CFrame * CFrame.new(0, 100, 0)
                                    end
                                    TP(farmPos)
                                    
                                    -- Expand hitbox
                                    if _G.HitboxExpander then
                                        mobHRP.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                                    end
                                    
                                    -- Bring and freeze
                                    if _G.BringMobs then
                                        BringMob(mob)
                                    end
                                    if _G.FreezeMobs then
                                        FreezeMob(mob)
                                    end
                                end
                            end
                        end
                    end
                end
                
                -- Auto Haki
                if _G.AutoHaki then
                    ActivateBuso()
                end
                if _G.AutoObsHaki then
                    ActivateKen()
                end
            end
        end
    end
end)

-- Attack loop (separate, using RenderStepped like working script)
RunService.RenderStepped:Connect(function()
    if _G.AutoFarm or _G.AutoBoss or _G.AutoFarmNearest then
        if _G.FastAttack then
            Attack()
        end
    end
end)

-- ============================================================================
-- AUTO FARM NEAREST MOB
-- ============================================================================

spawn(function()
    while task.wait() do
        if _G.AutoFarmNearest and not _G.AutoFarm then
            if isAlive() then
                local mob = getNearestMob(9999)
                if mob then
                    local mobHRP = mob:FindFirstChild("HumanoidRootPart")
                    if mobHRP then
                        TP(mobHRP.CFrame * CFrame.new(0, _G.FarmHeight, 0))
                        
                        if _G.HitboxExpander then
                            ExpandHitbox(mob)
                        end
                        if _G.BringMobs then
                            BringMob(mob)
                        end
                        if _G.FreezeMobs then
                            FreezeMob(mob)
                        end
                    end
                end
            end
        end
    end
end)

-- ============================================================================
-- AUTO BOSS FARM
-- ============================================================================

spawn(function()
    while task.wait() do
        if _G.AutoBoss and _G.SelectedBoss then
            if isAlive() then
                local boss = getMobByName(_G.SelectedBoss)
                if boss then
                    local bossHRP = boss:FindFirstChild("HumanoidRootPart")
                    local bossHum = boss:FindFirstChildOfClass("Humanoid")
                    
                    if bossHRP and bossHum and bossHum.Health > 0 then
                        TP(bossHRP.CFrame * CFrame.new(0, _G.FarmHeight, 0))
                        
                        if _G.HitboxExpander then
                            ExpandHitbox(boss)
                        end
                        if _G.BringMobs then
                            BringMob(boss)
                        end
                        if _G.FreezeMobs then
                            FreezeMob(boss)
                        end
                    end
                else
                    -- Boss not spawned, go to location
                    for _, bossData in ipairs(Sea1Bosses) do
                        if bossData.Name == _G.SelectedBoss then
                            TP(bossData.CFrame * CFrame.new(0, 10, 0))
                            break
                        end
                    end
                end
            end
        end
    end
end)

-- ============================================================================
-- KILL AURA (Mob)
-- ============================================================================

spawn(function()
    while task.wait(0.1) do
        if _G.KillAura and (_G.AutoFarm or _G.AutoBoss or _G.AutoFarmNearest) then
            local mobs = getAllMobsInRadius(nil, _G.KillAuraRange)
            for _, mob in ipairs(mobs) do
                if _G.HitboxExpander then
                    ExpandHitbox(mob)
                end
                if _G.BringMobs then
                    BringMob(mob)
                end
                if _G.FreezeMobs then
                    FreezeMob(mob)
                end
            end
        end
    end
end)

-- ============================================================================
-- CHEST FARM (INSTANT TP)
-- ============================================================================

local ChestCount = 0

local function findChests()
    local chests = {}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj.Name:find("Chest") and (obj:IsA("Model") or obj:IsA("BasePart")) then
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

spawn(function()
    while task.wait(0.2) do
        if _G.ChestFarm then
            local chests = findChests()
            for _, chest in ipairs(chests) do
                if not _G.ChestFarm then break end
                
                local part = chest:IsA("BasePart") and chest or chest:FindFirstChildWhichIsA("BasePart")
                if part then
                    InstantTP(part.CFrame * CFrame.new(0, 3, 0))
                    task.wait(0.3)
                    
                    local hrp = getHRP()
                    if hrp and firetouchinterest then
                        firetouchinterest(hrp, part, 0)
                        task.wait(0.1)
                        firetouchinterest(hrp, part, 1)
                        
                        ChestCount = ChestCount + 1
                        if ChestCount >= _G.ChestsBeforeReset then
                            ChestCount = 0
                            local hum = getHumanoid()
                            if hum then hum.Health = 0 end
                            task.wait(3)
                        end
                    end
                end
            end
        end
    end
end)

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

spawn(function()
    while task.wait(0.5) do
        if _G.FruitSniper then
            local fruits = findFruits()
            if #fruits > 0 then
                local fruit = fruits[1]
                local handle = fruit:FindFirstChild("Handle")
                if handle then
                    InstantTP(handle.CFrame * CFrame.new(0, 3, 0))
                    task.wait(0.3)
                    
                    local hrp = getHRP()
                    if hrp and firetouchinterest then
                        firetouchinterest(hrp, handle, 0)
                        task.wait(0.1)
                        firetouchinterest(hrp, handle, 1)
                    end
                end
            end
        end
    end
end)

-- ============================================================================
-- PLAYER MODS
-- ============================================================================

-- No Clip
RunService.Stepped:Connect(function()
    if _G.NoClip and isAlive() then
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

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if _G.InfiniteJump and isAlive() then
        local hum = getHumanoid()
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Walk/Jump Speed
spawn(function()
    while task.wait(0.1) do
        local hum = getHumanoid()
        if hum then
            if _G.WalkSpeed > 16 then
                hum.WalkSpeed = _G.WalkSpeed
            end
            if _G.JumpPower > 50 then
                hum.JumpPower = _G.JumpPower
                hum.UseJumpPower = true
            end
        end
    end
end)

-- Fly
local Flying = false
local FlyBV = nil
local FlyBG = nil

local function StartFly()
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
end

local function StopFly()
    Flying = false
    if FlyBV then FlyBV:Destroy() FlyBV = nil end
    if FlyBG then FlyBG:Destroy() FlyBG = nil end
end

RunService.RenderStepped:Connect(function()
    if _G.Fly and Flying and FlyBV then
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
            FlyBV.Velocity = moveDir.Unit * _G.FlySpeed
        else
            FlyBV.Velocity = Vector3.new(0, 0, 0)
        end
        
        if FlyBG then
            FlyBG.CFrame = camera.CFrame
        end
    end
end)

-- Spin Bot
RunService.RenderStepped:Connect(function()
    if _G.SpinBot and isAlive() then
        local hrp = getHRP()
        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(15), 0)
        end
    end
end)

-- ============================================================================
-- MISC FUNCTIONS
-- ============================================================================

local function RemoveFog()
    Lighting.FogEnd = 9e9
    Lighting.FogStart = 9e9
    for _, obj in ipairs(Lighting:GetDescendants()) do
        if obj:IsA("Atmosphere") or obj:IsA("BlurEffect") or obj:IsA("DepthOfFieldEffect") then
            obj.Enabled = false
        end
    end
end

local function FPSBoost()
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

local function ServerHop()
    pcall(function()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        for _, server in ipairs(servers.data) do
            if server.id ~= game.JobId and server.playing < server.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                return
            end
        end
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end)
end

-- ============================================================================
-- ESP SYSTEM
-- ============================================================================

local ESPCache = {}
local ESPUpdateRate = 0.5

local function CreateESP(parent, text, color)
    local existing = parent:FindFirstChild("FamyyESP")
    if existing then return existing end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FamyyESP"
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.TextStrokeTransparency = 0
    label.Font = Enum.Font.GothamBold
    label.TextScaled = true
    label.Parent = billboard
    
    return billboard
end

local function RemoveESP(obj)
    local esp = obj:FindFirstChild("FamyyESP")
    if esp then esp:Destroy() end
    ESPCache[obj] = nil
end

local function ClearAllESP()
    for obj, _ in pairs(ESPCache) do
        if obj then RemoveESP(obj) end
    end
    ESPCache = {}
end

-- Mob ESP
spawn(function()
    while task.wait(ESPUpdateRate) do
        if _G.MobESP then
            local enemies = Workspace:FindFirstChild("Enemies")
            if enemies then
                for _, mob in ipairs(enemies:GetChildren()) do
                    if mob:IsA("Model") then
                        local hum = mob:FindFirstChildOfClass("Humanoid")
                        if hum and hum.Health > 0 then
                            if not ESPCache[mob] then
                                local esp = CreateESP(mob, mob.Name, Color3.fromRGB(255, 100, 100))
                                ESPCache[mob] = esp
                            end
                        else
                            RemoveESP(mob)
                        end
                    end
                end
            end
        else
            -- Clear mob ESP when disabled
            for obj, _ in pairs(ESPCache) do
                if obj and obj.Parent == Workspace:FindFirstChild("Enemies") then
                    RemoveESP(obj)
                end
            end
        end
    end
end)

-- Fruit ESP
spawn(function()
    while task.wait(ESPUpdateRate) do
        if _G.FruitESP then
            local fruits = findFruits()
            for _, fruit in ipairs(fruits) do
                if not ESPCache[fruit] then
                    local esp = CreateESP(fruit, "[FRUIT] " .. fruit.Name, Color3.fromRGB(255, 215, 0))
                    ESPCache[fruit] = esp
                end
            end
        end
    end
end)

-- Chest ESP
spawn(function()
    while task.wait(ESPUpdateRate) do
        if _G.ChestESP then
            local chests = findChests()
            for _, chest in ipairs(chests) do
                if not ESPCache[chest] then
                    local esp = CreateESP(chest, "[CHEST]", Color3.fromRGB(100, 255, 100))
                    ESPCache[chest] = esp
                end
            end
        end
    end
end)

-- ============================================================================
-- UI SETUP
-- ============================================================================

local tools = getTools()

-- Update tools when inventory changes
LocalPlayer.Backpack.DescendantAdded:Connect(function(tool)
    if tool:IsA("Tool") then
        tools = getTools()
    end
end)
LocalPlayer.Backpack.DescendantRemoving:Connect(function(tool)
    if tool:IsA("Tool") then
        task.wait(0.1)
        tools = getTools()
    end
end)

-- === MAIN FARM TAB ===
local MainFarmTab = Window:CreateTab("Main Farm")

local WeaponSection = MainFarmTab:CreateSection("Weapon", true)

WeaponSection:AddDropdown({
    Label = "Select Weapon",
    Options = tools,
    Default = nil,
    Callback = function(v)
        _G.SelectedWeapon = v
    end
})

WeaponSection:AddButton({
    Label = "Refresh Weapons",
    Style = "secondary",
    Callback = function()
        tools = getTools()
        Window.Notify("Weapons", "Refreshed! Found " .. #tools .. " weapons", 2, "info")
    end
})

local FarmSection = MainFarmTab:CreateSection("Auto Farm", true)

FarmSection:AddToggle({
    Label = "Auto Farm Level",
    Default = false,
    Callback = function(v)
        _G.AutoFarm = v
        if v then
            Window.Notify("Auto Farm", "Started! Level: " .. getLevel(), 2, "success")
        end
    end
})

FarmSection:AddToggle({
    Label = "Auto Farm Nearest Mob",
    Default = false,
    Callback = function(v)
        _G.AutoFarmNearest = v
    end
})

FarmSection:AddToggle({
    Label = "Bring Mobs",
    Default = true,
    Callback = function(v)
        _G.BringMobs = v
    end
})

FarmSection:AddToggle({
    Label = "Freeze Mobs",
    Default = true,
    Callback = function(v)
        _G.FreezeMobs = v
    end
})

FarmSection:AddToggle({
    Label = "Kill Aura",
    Default = true,
    Callback = function(v)
        _G.KillAura = v
    end
})

FarmSection:AddToggle({
    Label = "Hitbox Expander",
    Default = true,
    Callback = function(v)
        _G.HitboxExpander = v
    end
})

FarmSection:AddToggle({
    Label = "Fast Attack",
    Default = true,
    Callback = function(v)
        _G.FastAttack = v
    end
})

FarmSection:AddToggle({
    Label = "Safe Mode (Sky Farm)",
    Default = false,
    Callback = function(v)
        _G.SafeMode = v
    end
})

local SettingsSection = MainFarmTab:CreateSection("Settings", true)

SettingsSection:AddSlider({
    Label = "Farm Height",
    Min = 10,
    Max = 100,
    Default = 20,
    Callback = function(v)
        _G.FarmHeight = v
    end
})

SettingsSection:AddSlider({
    Label = "Hitbox Size",
    Min = 30,
    Max = 150,
    Default = 60,
    Callback = function(v)
        _G.HitboxSize = v
    end
})

SettingsSection:AddSlider({
    Label = "Bring Radius",
    Min = 50,
    Max = 300,
    Default = 150,
    Callback = function(v)
        _G.BringRadius = v
    end
})

SettingsSection:AddSlider({
    Label = "Kill Aura Range",
    Min = 25,
    Max = 200,
    Default = 50,
    Callback = function(v)
        _G.KillAuraRange = v
    end
})

SettingsSection:AddSlider({
    Label = "Tween Speed",
    Min = 100,
    Max = 500,
    Default = 300,
    Callback = function(v)
        _G.TweenSpeed = v
    end
})

-- Boss Section
local BossSection = MainFarmTab:CreateSection("Boss Farm", true)

BossSection:AddToggle({
    Label = "Auto Boss Farm",
    Default = false,
    Callback = function(v)
        _G.AutoBoss = v
    end
})

local SelectedBossLabel = BossSection:AddLabel({Text = "Selected: None", Bold = true})

local BossSelectSection = MainFarmTab:CreateSection("Select Boss", false)

for _, boss in ipairs(Sea1Bosses) do
    local label = boss.Name .. " [Lv." .. boss.Level .. "]"
    if boss.Rare then label = "[RARE] " .. label end
    
    BossSelectSection:AddButton({
        Label = label,
        Style = boss.Rare and "primary" or "secondary",
        Callback = function()
            _G.SelectedBoss = boss.Name
            SelectedBossLabel:SetText("Selected: " .. boss.Name)
            Window.Notify("Boss", "Selected: " .. boss.Name, 2, "info")
        end
    })
end

-- === SEA 1 ITEMS TAB ===
local Sea1Tab = Window:CreateTab("Sea 1 Items")

local HakiSection = Sea1Tab:CreateSection("Haki", true)

HakiSection:AddToggle({
    Label = "Auto Armament Haki (Buso)",
    Default = true,
    Callback = function(v)
        _G.AutoHaki = v
    end
})

HakiSection:AddToggle({
    Label = "Auto Observation Haki (Ken)",
    Default = false,
    Callback = function(v)
        _G.AutoObsHaki = v
    end
})

HakiSection:AddButton({
    Label = "Buy Buso Haki ($25k)",
    Style = "secondary",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
        Window.Notify("Haki", "Purchased Buso!", 2, "success")
    end
})

HakiSection:AddButton({
    Label = "Buy Ken Haki ($750k)",
    Style = "secondary",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Instinct")
        Window.Notify("Haki", "Purchased Ken!", 2, "success")
    end
})

local AbilitySection = Sea1Tab:CreateSection("Abilities", true)

AbilitySection:AddButton({
    Label = "Buy Geppo ($10k)",
    Style = "secondary",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyAbility", "Geppo")
    end
})

AbilitySection:AddButton({
    Label = "Buy Soru ($100k)",
    Style = "secondary",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyAbility", "Soru")
    end
})

local BossTeleportSection = Sea1Tab:CreateSection("Boss Teleports", true)

BossTeleportSection:AddButton({
    Label = "Saber Expert (Lv. 200)",
    Style = "primary",
    Callback = function()
        TP(CFrame.new(-1447, 30, -30))
    end
})

BossTeleportSection:AddButton({
    Label = "Thunder God - Pole (Lv. 575)",
    Style = "primary",
    Callback = function()
        TP(CFrame.new(-7920, 5635, -1427))
    end
})

BossTeleportSection:AddButton({
    Label = "Fishman Lord - Trident (Lv. 425)",
    Style = "primary",
    Callback = function()
        TP(CFrame.new(61365, 23, 1113))
    end
})

BossTeleportSection:AddButton({
    Label = "The Saw - Shark Saw (Lv. 100)",
    Style = "primary",
    Callback = function()
        TP(CFrame.new(-292, 72, 2076))
    end
})

BossTeleportSection:AddButton({
    Label = "Greybeard - Bisento (Lv. 750)",
    Style = "primary",
    Callback = function()
        TP(CFrame.new(-4988, 78, 4380))
    end
})

-- === STATS TAB ===
local StatsTab = Window:CreateTab("Stats")

local AutoStatsSection = StatsTab:CreateSection("Auto Stats", true)

AutoStatsSection:AddToggle({
    Label = "Auto Melee",
    Default = false,
    Callback = function(v)
        _G.AutoStatsMelee = v
    end
})

AutoStatsSection:AddToggle({
    Label = "Auto Defense",
    Default = false,
    Callback = function(v)
        _G.AutoStatsDefense = v
    end
})

AutoStatsSection:AddToggle({
    Label = "Auto Sword",
    Default = false,
    Callback = function(v)
        _G.AutoStatsSword = v
    end
})

AutoStatsSection:AddToggle({
    Label = "Auto Gun",
    Default = false,
    Callback = function(v)
        _G.AutoStatsGun = v
    end
})

AutoStatsSection:AddToggle({
    Label = "Auto Fruit",
    Default = false,
    Callback = function(v)
        _G.AutoStatsFruit = v
    end
})

AutoStatsSection:AddSlider({
    Label = "Points Per Add",
    Min = 1,
    Max = 100,
    Default = 3,
    Callback = function(v)
        _G.StatPoints = v
    end
})

local FakeStatsSection = StatsTab:CreateSection("Fake Stats (Visual)", true)

FakeStatsSection:AddTextInput({
    Label = "Fake Level",
    Placeholder = "Enter level...",
    Callback = function(v)
        pcall(function()
            LocalPlayer.Data.Level.Value = tonumber(v) or LocalPlayer.Data.Level.Value
        end)
    end
})

FakeStatsSection:AddTextInput({
    Label = "Fake Beli",
    Placeholder = "Enter beli...",
    Callback = function(v)
        pcall(function()
            LocalPlayer.Data.Beli.Value = tonumber(v) or LocalPlayer.Data.Beli.Value
        end)
    end
})

-- === COMBAT TAB ===
local CombatTab = Window:CreateTab("Combat")

local CombatSection = CombatTab:CreateSection("Combat", true)

CombatSection:AddToggle({
    Label = "Infinite Energy",
    Default = true,
    Callback = function(v)
        _G.InfiniteEnergy = v
    end
})

CombatSection:AddToggle({
    Label = "No Clip",
    Default = false,
    Callback = function(v)
        _G.NoClip = v
    end
})

-- === TELEPORT TAB ===
local TeleportTab = Window:CreateTab("Teleport")

local IslandSection = TeleportTab:CreateSection("Sea 1 Islands", true)

for _, island in ipairs(Sea1Islands) do
    IslandSection:AddButton({
        Label = island.Name,
        Style = "secondary",
        Callback = function()
            TP(island.CFrame)
            Window.Notify("Teleport", "Going to " .. island.Name, 2, "info")
        end
    })
end

local SeaSection = TeleportTab:CreateSection("Sea Teleports", true)

SeaSection:AddButton({
    Label = "Sea 1",
    Style = "primary",
    Callback = function()
        TeleportService:Teleport(2753915549, LocalPlayer)
    end
})

SeaSection:AddButton({
    Label = "Sea 2",
    Style = "primary",
    Callback = function()
        TeleportService:Teleport(4442272183, LocalPlayer)
    end
})

SeaSection:AddButton({
    Label = "Sea 3",
    Style = "primary",
    Callback = function()
        TeleportService:Teleport(7449423635, LocalPlayer)
    end
})

SeaSection:AddButton({
    Label = "Stop Tween",
    Style = "danger",
    Callback = function()
        StopTween()
        Window.Notify("Teleport", "Stopped", 2, "info")
    end
})

-- === ESP TAB ===
local ESPTab = Window:CreateTab("ESP")

local ESPSection = ESPTab:CreateSection("ESP Options", true)

ESPSection:AddToggle({
    Label = "Mob ESP",
    Default = false,
    Callback = function(v)
        _G.MobESP = v
    end
})

ESPSection:AddToggle({
    Label = "Fruit ESP",
    Default = false,
    Callback = function(v)
        _G.FruitESP = v
    end
})

ESPSection:AddToggle({
    Label = "Chest ESP",
    Default = false,
    Callback = function(v)
        _G.ChestESP = v
    end
})

ESPSection:AddButton({
    Label = "Clear All ESP",
    Style = "danger",
    Callback = function()
        ClearAllESP()
    end
})

-- === PLAYER TAB ===
local PlayerTab = Window:CreateTab("Player")

local SpeedSection = PlayerTab:CreateSection("Speed", true)

SpeedSection:AddSlider({
    Label = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(v)
        _G.WalkSpeed = v
    end
})

SpeedSection:AddSlider({
    Label = "Jump Power",
    Min = 50,
    Max = 300,
    Default = 50,
    Callback = function(v)
        _G.JumpPower = v
    end
})

SpeedSection:AddToggle({
    Label = "Infinite Jump",
    Default = false,
    Callback = function(v)
        _G.InfiniteJump = v
    end
})

local FlySection = PlayerTab:CreateSection("Fly", true)

FlySection:AddToggle({
    Label = "Enable Fly",
    Default = false,
    Callback = function(v)
        _G.Fly = v
        if v then StartFly() else StopFly() end
    end
})

FlySection:AddSlider({
    Label = "Fly Speed",
    Min = 50,
    Max = 300,
    Default = 100,
    Callback = function(v)
        _G.FlySpeed = v
    end
})

FlySection:AddToggle({
    Label = "Spin Bot",
    Default = false,
    Callback = function(v)
        _G.SpinBot = v
    end
})

-- === MISC TAB ===
local MiscTab = Window:CreateTab("Misc")

local ChestSection = MiscTab:CreateSection("Chest Farm", true)

ChestSection:AddToggle({
    Label = "Auto Chest Farm (Instant TP)",
    Default = false,
    Callback = function(v)
        _G.ChestFarm = v
        if v then
            Window.Notify("Chest Farm", "Started! Resets after " .. _G.ChestsBeforeReset .. " chests", 2, "success")
        end
    end
})

ChestSection:AddSlider({
    Label = "Chests Before Reset",
    Min = 1,
    Max = 10,
    Default = 3,
    Callback = function(v)
        _G.ChestsBeforeReset = v
    end
})

local FruitSection = MiscTab:CreateSection("Fruit", true)

FruitSection:AddToggle({
    Label = "Fruit Sniper",
    Default = false,
    Callback = function(v)
        _G.FruitSniper = v
        if v then
            Window.Notify("Fruit Sniper", "Active!", 2, "success")
        end
    end
})

local ServerSection = MiscTab:CreateSection("Server", true)

ServerSection:AddButton({
    Label = "Server Hop",
    Style = "secondary",
    Callback = function()
        ServerHop()
    end
})

ServerSection:AddButton({
    Label = "Rejoin",
    Style = "secondary",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

local PerfSection = MiscTab:CreateSection("Performance", true)

PerfSection:AddButton({
    Label = "Remove Fog",
    Style = "secondary",
    Callback = function()
        RemoveFog()
        Window.Notify("Performance", "Fog removed!", 2, "success")
    end
})

PerfSection:AddButton({
    Label = "FPS Boost",
    Style = "secondary",
    Callback = function()
        FPSBoost()
        Window.Notify("Performance", "FPS Boost applied!", 2, "success")
    end
})

-- Info Section
local InfoSection = MiscTab:CreateSection("Info", true)

local levelLabel = InfoSection:AddLabel({Text = "Level: " .. getLevel(), Bold = true})
local beliLabel = InfoSection:AddLabel({Text = "Beli: $" .. getBeli()})

spawn(function()
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

Window.Notify("FAMYY PRIVATE", "Blox Fruits Sea 1 v5.0 Loaded!", 3, "success")
Window.Notify("DEFAULTS ON", "Bring, Freeze, Kill Aura, Hitbox, Haki, Energy", 4, "info")

print("================================================================================")
print("[FAMYY PRIVATE] Blox Fruits Sea 1 v5.0")
print("================================================================================")
print("Based on working script mechanics from pastebin")
print("Correct quest format: BanditQuest1, MonkeyQuest1, etc.")
print("Attack: VirtualUser method")
print("Hitbox: Direct size modification")
print("================================================================================")

return Library
