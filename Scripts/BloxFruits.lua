--[[
    ███████╗ █████╗ ███╗   ███╗██╗   ██╗██╗   ██╗    ██████╗ ██████╗ ██╗██╗   ██╗ █████╗ ████████╗███████╗
    ██╔════╝██╔══██╗████╗ ████║╚██╗ ██╔╝╚██╗ ██╔╝    ██╔══██╗██╔══██╗██║██║   ██║██╔══██╗╚══██╔══╝██╔════╝
    █████╗  ███████║██╔████╔██║ ╚████╔╝  ╚████╔╝     ██████╔╝██████╔╝██║██║   ██║███████║   ██║   █████╗  
    ██╔══╝  ██╔══██║██║╚██╔╝██║  ╚██╔╝    ╚██╔╝      ██╔═══╝ ██╔══██╗██║╚██╗ ██╔╝██╔══██║   ██║   ██╔══╝  
    ██║     ██║  ██║██║ ╚═╝ ██║   ██║      ██║       ██║     ██║  ██║██║ ╚████╔╝ ██║  ██║   ██║   ███████╗
    ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝      ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═╝   ╚═╝   ╚══════╝
    
    FAMYY PRIVATE - Blox Fruits Script
    Version: 10.0 (Complete Edition)
    
    Supports: All 3 Seas (First, Second, Third)
    Based on Monster Hub mechanics (with permission)
    
    Features:
    - Auto Farm (Level, Near, Boss)
    - Fruit Mastery / Gun Mastery (Separate Loops)
    - ESP (Mob, Player, Fruit, Chest, Mirage, Gear, Aura, LSD)
    - Teleports (All Areas + Islands)
    - Boss Farm (All Bosses)
    - Material Farm (All Materials)
    - Sea Features (Boat, Mirage, Leviathan, Prehistoric)
    - Item Quests (Dual Katana, Buddy Sword, Rengoku, Yama, Tushita)
    - Race V4 (Full Trial Automation, Moon Detection)
    - Kitsune Island (Shrine TP, Azure Collection)
    - Haki Fortress & Rainbow Haki
    - Elite Hunter Integration
    - And much more!
]]

-- ============================================================================
-- LOAD FAMYYLIB UI (Includes Famy Tab)
-- ============================================================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/FamyyLib.lua"))()
local Window = Library.Window -- Pre-created window with Famy tab

-- ============================================================================
-- SERVICES
-- ============================================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local CollectionService = game:GetService("CollectionService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- ============================================================================
-- GLOBAL SETTINGS
-- ============================================================================

_G.AutoLevel = false
_G.AutoNear = false
_G.AutoBoss = false
_G.AutoCastleRaid = false
_G.AutoCollectChest = false
_G.AutoCollectBerry = false
_G.AutoMasteryFruit = false
_G.AutoMasteryGun = false
_G.AutoMaterial = false
_G.AutoRaid = false
_G.AutoRaceV4 = false
_G.AutoTrials = false
_G.BringMob = true
_G.AutoHaki = true
_G.FastAttack = true
_G.UseSkill = false
_G.UseSkillGun = false
_G.TweenSpeed = 350
_G.Fast_Delay = 0.1
_G.KillPercent = 20

-- ESP Settings
_G.MobESP = false
_G.PlayerESP = false
_G.FruitESP = false
_G.ChestESP = false
_G.FlowerESP = false
_G.IslandESP = false
_G.NpcESP = false
_G.SeaBeastESP = false
_G.MirageIslandESP = false

-- Skill Settings
_G.SkillZ = true
_G.SkillX = true
_G.SkillC = true
_G.SkillV = true
_G.SkillF = false

-- Sea Features Settings
_G.AutoBoat = false
_G.AutoSeaBeast = false
_G.AutoMirageIsland = false
_G.AutoFrozenDimension = false
_G.AutoLeviathan = false
_G.AutoPrehistoric = false
_G.TweenToGear = false
_G.AutoTpAdvanced = false

-- Item Quest Settings
_G.Auto_Saber = false
_G.Auto_PoleV1 = false
_G.Auto_PoleV2 = false
_G.Auto_Saw = false
_G.Auto_Warden = false
_G.AutoYama = false
_G.AutoTushita = false
_G.AutoHallowScythe = false
_G.Auto_DualKatana = false
_G.Auto_BuddySword = false
_G.Auto_Rengoku = false
_G.Auto_HolyTorch = false
_G.Auto_SkullGuitar = false
_G.Auto_MusketeerHat = false
_G.Auto_ObservationV2 = false
_G.Auto_RainbowHaki = false

-- Race V4 Settings
_G.AutoLockMoon = false
_G.AutoQuestRace = false
_G.AutoKillTrial = false
_G.AutoFarmRace = false
MirageStatus = "Not Found"
FullMoonStatus = "0%"

-- Kitsune Settings
_G.AutoKitsuneFarm = false
_G.AutoKitsuneShrine = false
_G.AutoAzureCollection = false

-- Misc Settings
_G.AutoEliteHunter = false
_G.AutoStoreFruit = false
_G.RandomFruit = false
_G.Auto_Sea2 = false
_G.Auto_Sea3 = false
_G.Auto_Law = false
_G.WalkOnWater = true
_G.SpeedRun = true
_G.NoClip = true
_G.EnablePvP = false

-- Stats Settings
_G.Auto_Stats_Melee = false
_G.Auto_Stats_Defense = false
_G.Auto_Stats_Sword = false
_G.Auto_Stats_Gun = false
_G.Auto_Stats_Devil_Fruit = false

-- ============================================================================
-- SEA DETECTION
-- ============================================================================

local Sea1 = game.PlaceId == 2753915549
local Sea2 = game.PlaceId == 4442272183
local Sea3 = game.PlaceId == 7449423635

local CurrentSea = Sea1 and "First Sea" or Sea2 and "Second Sea" or Sea3 and "Third Sea" or "Unknown"

-- ============================================================================
-- VARIABLES
-- ============================================================================

local Ms = ""
local NameQuest = ""
local QuestLv = 1
local NameMon = ""
local CFrameQ = CFrame.new(0, 0, 0)
local CFrameMon = CFrame.new(0, 0, 0)
local Pos = CFrame.new(0, 20, 0)

local SelectWeapon = nil
local ChooseWeapon = "Melee"
local SelectMonster = nil
local SelectBoss = nil
local TypeMastery = "Level"

local BossMon = ""
local NameBoss = ""
local NameQuestBoss = ""
local QuestLvBoss = 1
local CFrameQBoss = CFrame.new(0, 0, 0)
local CFrameBoss = CFrame.new(0, 0, 0)

local FarmPos = CFrame.new(0, 0, 0)
local MonFarm = ""
local bringmob = false

local ESPNumber = math.random(1, 1000000)

-- ============================================================================
-- MOB/BOSS LISTS FOR EACH SEA
-- ============================================================================

local tableMon = {}
local tableBoss = {}
local AreaList = {}

if Sea1 then
    tableMon = {
        "Bandit", "Monkey", "Gorilla", "Pirate", "Brute",
        "Desert Bandit", "Desert Officer", "Snow Bandit", "Snowman",
        "Chief Petty Officer", "Sky Bandit", "Dark Master",
        "Prisoner", "Dangerous Prisoner", "Toga Warrior", "Gladiator",
        "Military Soldier", "Military Spy", "Fishman Warrior", "Fishman Commando",
        "God's Guard", "Shanda", "Royal Squad", "Royal Soldier",
        "Galley Pirate", "Galley Captain"
    }
    tableBoss = {
        "The Gorilla King", "Bobby", "The Saw", "Yeti", "Mob Leader",
        "Vice Admiral", "Saber Expert", "Warden", "Chief Warden", "Swan",
        "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God",
        "Cyborg", "Ice Admiral", "Greybeard"
    }
    AreaList = {
        "Jungle", "Buggy", "Desert", "Snow", "Marine",
        "Sky", "Prison", "Colosseum", "Magma", "Fishman",
        "Sky Island", "Fountain"
    }
elseif Sea2 then
    tableMon = {
        "Raider", "Mercenary", "Swan Pirate", "Factory Staff",
        "Marine Lieutenant", "Marine Captain", "Zombie", "Vampire",
        "Snow Trooper", "Winter Warrior", "Lab Subordinate", "Horned Warrior",
        "Magma Ninja", "Lava Pirate", "Ship Deckhand", "Ship Engineer",
        "Ship Steward", "Ship Officer", "Arctic Warrior", "Snow Lurker",
        "Sea Soldier", "Water Fighter"
    }
    tableBoss = {
        "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral",
        "Awakened Ice Admiral", "Tide Keeper", "Darkbeard",
        "Cursed Captain", "Order"
    }
    AreaList = {
        "Area 1", "Area 2", "Zombie", "Marine", "Snow Mountain",
        "Ice Fire", "Ship", "Frost", "Forgotten"
    }
elseif Sea3 then
    tableMon = {
        "Pirate Millionaire", "Pistol Billionaire", "Dragon Crew Warrior", "Dragon Crew Archer",
        "Hydra Enforcer", "Venomous Assailant", "Marine Commodore", "Marine Rear Admiral",
        "Fishman Raider", "Fishman Captain", "Forest Pirate", "Mythological Pirate",
        "Jungle Pirate", "Musketeer Pirate", "Reborn Skeleton", "Living Zombie",
        "Demonic Soul", "Posessed Mummy", "Peanut Scout", "Peanut President",
        "Ice Cream Chef", "Ice Cream Commander", "Cookie Crafter", "Cake Guard",
        "Baking Staff", "Head Baker", "Cocoa Warrior", "Chocolate Bar Battler",
        "Sweet Thief", "Candy Rebel", "Candy Pirate", "Snow Demon",
        "Isle Outlaw", "Island Boy", "Sun-kissed Warrior", "Isle Champion",
        "Serpent Hunter", "Skull Slayer"
    }
    tableBoss = {
        "Stone", "Hydra Leader", "Kilo Admiral", "Captain Elephant",
        "Beautiful Pirate", "Cake Queen", "Longma", "Soul Reaper",
        "rip_indra True Form"
    }
    AreaList = {
        "Pirate Port", "Amazon", "Marine Tree", "Deep Forest",
        "Haunted Castle", "Nut Island", "Ice Cream Island",
        "Cake Island", "Choco Island", "Candy Island", "Tiki Outpost"
    }
end

-- ============================================================================
-- CHECK LEVEL FUNCTION - AUTO SELECT MOB BY LEVEL
-- ============================================================================

function CheckLevel()
    local level = LocalPlayer.Data.Level.Value
    
    if Sea1 then
        if level >= 1 and level <= 9 or SelectMonster == "Bandit" then
            Ms = "Bandit"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.938, 16.455, 1547.784)
            CFrameMon = CFrame.new(1038.553, 41.296, 1576.509)
        elseif level >= 10 and level <= 14 or SelectMonster == "Monkey" then
            Ms = "Monkey"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(-1601.655, 36.852, 153.388)
            CFrameMon = CFrame.new(-1448.144, 50.851, 63.607)
        elseif level >= 15 and level <= 29 or SelectMonster == "Gorilla" then
            Ms = "Gorilla"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(-1601.655, 36.852, 153.388)
            CFrameMon = CFrame.new(-1142.648, 40.462, -515.392)
        elseif level >= 30 and level <= 39 or SelectMonster == "Pirate" then
            Ms = "Pirate"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(-1140.176, 4.752, 3827.405)
            CFrameMon = CFrame.new(-1201.088, 40.628, 3857.596)
        elseif level >= 40 and level <= 59 or SelectMonster == "Brute" then
            Ms = "Brute"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(-1140.176, 4.752, 3827.405)
            CFrameMon = CFrame.new(-1387.532, 24.592, 4100.957)
        elseif level >= 60 and level <= 74 or SelectMonster == "Desert Bandit" then
            Ms = "Desert Bandit"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.517, 6.438, 4390.149)
            CFrameMon = CFrame.new(984.998, 16.109, 4417.910)
        elseif level >= 75 and level <= 89 or SelectMonster == "Desert Officer" then
            Ms = "Desert Officer"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.517, 6.438, 4390.149)
            CFrameMon = CFrame.new(1547.151, 14.452, 4381.800)
        elseif level >= 90 and level <= 99 or SelectMonster == "Snow Bandit" then
            Ms = "Snow Bandit"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.807, 87.272, -1298.357)
            CFrameMon = CFrame.new(1356.302, 105.768, -1328.241)
        elseif level >= 100 and level <= 119 or SelectMonster == "Snowman" then
            Ms = "Snowman"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.807, 87.272, -1298.357)
            CFrameMon = CFrame.new(1218.795, 138.011, -1488.026)
        elseif level >= 120 and level <= 149 or SelectMonster == "Chief Petty Officer" then
            Ms = "Chief Petty Officer"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(-5035.496, 28.677, 4324.184)
            CFrameMon = CFrame.new(-4931.155, 65.793, 4121.839)
        elseif level >= 150 and level <= 174 or SelectMonster == "Sky Bandit" then
            Ms = "Sky Bandit"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4842.137, 717.695, -2623.048)
            CFrameMon = CFrame.new(-4955.641, 365.463, -2908.186)
        elseif level >= 175 and level <= 189 or SelectMonster == "Dark Master" then
            Ms = "Dark Master"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4842.137, 717.695, -2623.048)
            CFrameMon = CFrame.new(-5148.165, 439.045, -2332.961)
        elseif level >= 190 and level <= 209 or SelectMonster == "Prisoner" then
            Ms = "Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 1
            NameMon = "Prisoner"
            CFrameQ = CFrame.new(5310.605, 0.350, 474.946)
            CFrameMon = CFrame.new(4937.318, 0.332, 649.574)
        elseif level >= 210 and level <= 249 or SelectMonster == "Dangerous Prisoner" then
            Ms = "Dangerous Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 2
            NameMon = "Dangerous Prisoner"
            CFrameQ = CFrame.new(5310.605, 0.350, 474.946)
            CFrameMon = CFrame.new(5099.662, 0.351, 1055.758)
        elseif level >= 250 and level <= 274 or SelectMonster == "Toga Warrior" then
            Ms = "Toga Warrior"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1577.789, 7.415, -2984.483)
            CFrameMon = CFrame.new(-1872.516, 49.080, -2913.810)
        elseif level >= 275 and level <= 299 or SelectMonster == "Gladiator" then
            Ms = "Gladiator"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1577.789, 7.415, -2984.483)
            CFrameMon = CFrame.new(-1521.374, 81.203, -3066.313)
        elseif level >= 300 and level <= 324 or SelectMonster == "Military Soldier" then
            Ms = "Military Soldier"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.115, 12.262, 8517.003)
            CFrameMon = CFrame.new(-5369.000, 61.243, 8556.492)
        elseif level >= 325 and level <= 374 or SelectMonster == "Military Spy" then
            Ms = "Military Spy"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.115, 12.262, 8517.003)
            CFrameMon = CFrame.new(-5787.002, 75.826, 8651.699)
        elseif level >= 375 and level <= 399 or SelectMonster == "Fishman Warrior" then
            Ms = "Fishman Warrior"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.652, 18.497, 1569.399)
            CFrameMon = CFrame.new(60844.105, 98.462, 1298.398)
            if _G.AutoLevel and (CFrameMon.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.851, 11.679, 1819.784))
            end
        elseif level >= 400 and level <= 449 or SelectMonster == "Fishman Commando" then
            Ms = "Fishman Commando"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.652, 18.497, 1569.399)
            CFrameMon = CFrame.new(61738.398, 64.207, 1433.837)
            if _G.AutoLevel and (CFrameMon.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.851, 11.679, 1819.784))
            end
        elseif level >= 450 and level <= 474 or SelectMonster == "God's Guard" then
            Ms = "God's Guard"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.860, 845.302, -1953.848)
            CFrameMon = CFrame.new(-4628.049, 866.928, -1931.235)
            if _G.AutoLevel and (CFrameMon.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.822, 872.542, -1667.556))
            end
        elseif level >= 475 and level <= 524 or SelectMonster == "Shanda" then
            Ms = "Shanda"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.159, 5545.519, -378.422)
            CFrameMon = CFrame.new(-7685.147, 5601.075, -441.388)
            if _G.AutoLevel and (CFrameMon.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.617, 5547.141, -380.291))
            end
        elseif level >= 525 and level <= 549 or SelectMonster == "Royal Squad" then
            Ms = "Royal Squad"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7903.382, 5635.989, -1410.923)
            CFrameMon = CFrame.new(-7654.251, 5637.107, -1407.755)
        elseif level >= 550 and level <= 624 or SelectMonster == "Royal Soldier" then
            Ms = "Royal Soldier"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7903.382, 5635.989, -1410.923)
            CFrameMon = CFrame.new(-7760.410, 5679.907, -1884.811)
        elseif level >= 625 and level <= 649 or SelectMonster == "Galley Pirate" then
            Ms = "Galley Pirate"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.278, 38.526, 4050.044)
            CFrameMon = CFrame.new(5557.168, 152.327, 3998.775)
        elseif level >= 650 or SelectMonster == "Galley Captain" then
            Ms = "Galley Captain"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.278, 38.526, 4050.044)
            CFrameMon = CFrame.new(5677.677, 92.786, 4966.632)
        end
    end
    
    if Sea2 then
        if level >= 700 and level <= 724 or SelectMonster == "Raider" then
            Ms = "Raider"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-427.725, 72.996, 1835.942)
            CFrameMon = CFrame.new(68.874, 93.635, 2429.675)
        elseif level >= 725 and level <= 774 or SelectMonster == "Mercenary" then
            Ms = "Mercenary"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.725, 72.996, 1835.942)
            CFrameMon = CFrame.new(-864.850, 122.471, 1453.150)
        elseif level >= 775 and level <= 799 or SelectMonster == "Swan Pirate" then
            Ms = "Swan Pirate"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.611, 73.096, 917.812)
            CFrameMon = CFrame.new(1065.366, 137.640, 1324.379)
        elseif level >= 800 and level <= 874 or SelectMonster == "Factory Staff" then
            Ms = "Factory Staff"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.611, 73.096, 917.812)
            CFrameMon = CFrame.new(533.220, 128.468, 355.626)
        elseif level >= 875 and level <= 899 or SelectMonster == "Marine Lieutenant" then
            Ms = "Marine Lieutenant"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.993, 73.041, -3217.708)
            CFrameMon = CFrame.new(-2489.262, 84.613, -3151.883)
        elseif level >= 900 and level <= 949 or SelectMonster == "Marine Captain" then
            Ms = "Marine Captain"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.993, 73.041, -3217.708)
            CFrameMon = CFrame.new(-2335.202, 79.786, -3245.867)
        elseif level >= 950 and level <= 974 or SelectMonster == "Zombie" then
            Ms = "Zombie"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.341, 48.505, -794.590)
            CFrameMon = CFrame.new(-5536.497, 101.085, -835.590)
        elseif level >= 975 and level <= 999 or SelectMonster == "Vampire" then
            Ms = "Vampire"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.341, 48.505, -794.590)
            CFrameMon = CFrame.new(-5806.109, 16.722, -1164.438)
        elseif level >= 1000 and level <= 1049 or SelectMonster == "Snow Trooper" then
            Ms = "Snow Trooper"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.059, 401.447, -5370.554)
            CFrameMon = CFrame.new(535.210, 432.742, -5484.916)
        elseif level >= 1050 and level <= 1099 or SelectMonster == "Winter Warrior" then
            Ms = "Winter Warrior"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.059, 401.447, -5370.554)
            CFrameMon = CFrame.new(1234.444, 456.954, -5174.130)
        elseif level >= 1100 and level <= 1124 or SelectMonster == "Lab Subordinate" then
            Ms = "Lab Subordinate"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841, 15.926, -4902.038)
            CFrameMon = CFrame.new(-5720.557, 63.309, -4784.610)
        elseif level >= 1125 and level <= 1174 or SelectMonster == "Horned Warrior" then
            Ms = "Horned Warrior"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841, 15.926, -4902.038)
            CFrameMon = CFrame.new(-6292.751, 91.181, -5502.649)
        elseif level >= 1175 and level <= 1199 or SelectMonster == "Magma Ninja" then
            Ms = "Magma Ninja"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.047, 15.977, -5297.961)
            CFrameMon = CFrame.new(-5461.838, 130.363, -5836.470)
        elseif level >= 1200 and level <= 1249 or SelectMonster == "Lava Pirate" then
            Ms = "Lava Pirate"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.047, 15.977, -5297.961)
            CFrameMon = CFrame.new(-5251.188, 55.164, -4774.409)
        elseif level >= 1250 and level <= 1274 or SelectMonster == "Ship Deckhand" then
            Ms = "Ship Deckhand"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.292, 125.082, 32911.039)
            CFrameMon = CFrame.new(921.123, 125.983, 33088.328)
            if _G.AutoLevel and (CFrameMon.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.212, 126.976, 32852.832))
            end
        elseif level >= 1275 and level <= 1299 or SelectMonster == "Ship Engineer" then
            Ms = "Ship Engineer"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.292, 125.082, 32911.039)
            CFrameMon = CFrame.new(886.281, 40.477, 32800.832)
            if _G.AutoLevel and (CFrameMon.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.212, 126.976, 32852.832))
            end
        elseif level >= 1300 and level <= 1324 or SelectMonster == "Ship Steward" then
            Ms = "Ship Steward"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.420, 125.082, 33245.542)
            CFrameMon = CFrame.new(943.855, 129.581, 33444.367)
            if _G.AutoLevel and (CFrameMon.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.212, 126.976, 32852.832))
            end
        elseif level >= 1325 and level <= 1349 or SelectMonster == "Ship Officer" then
            Ms = "Ship Officer"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.420, 125.082, 33245.542)
            CFrameMon = CFrame.new(955.384, 181.083, 33331.890)
            if _G.AutoLevel and (CFrameMon.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.212, 126.976, 32852.832))
            end
        elseif level >= 1350 and level <= 1374 or SelectMonster == "Arctic Warrior" then
            Ms = "Arctic Warrior"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.137, 28.202, -6484.600)
            CFrameMon = CFrame.new(5935.454, 77.260, -6472.756)
            if _G.AutoLevel and (CFrameMon.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.558, 89.034, -132.839))
            end
        elseif level >= 1375 and level <= 1424 or SelectMonster == "Snow Lurker" then
            Ms = "Snow Lurker"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.137, 28.202, -6484.600)
            CFrameMon = CFrame.new(5628.482, 57.574, -6618.348)
        elseif level >= 1425 and level <= 1449 or SelectMonster == "Sea Soldier" then
            Ms = "Sea Soldier"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.582, 236.872, -10147.790)
            CFrameMon = CFrame.new(-3185.015, 58.789, -9663.606)
        elseif level >= 1450 or SelectMonster == "Water Fighter" then
            Ms = "Water Fighter"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.582, 236.872, -10147.790)
            CFrameMon = CFrame.new(-3262.930, 298.690, -10552.529)
        end
    end
    
    if Sea3 then
        if level >= 1500 and level <= 1524 or SelectMonster == "Pirate Millionaire" then
            Ms = "Pirate Millionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 1
            NameMon = "Pirate Millionaire"
            CFrameQ = CFrame.new(-450.104, 107.681, 5950.726)
            CFrameMon = CFrame.new(-193.992, 56.125, 5755.788)
        elseif level >= 1525 and level <= 1574 or SelectMonster == "Pistol Billionaire" then
            Ms = "Pistol Billionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 2
            NameMon = "Pistol Billionaire"
            CFrameQ = CFrame.new(-450.104, 107.681, 5950.726)
            CFrameMon = CFrame.new(-188.144, 84.496, 6337.041)
        elseif level >= 1575 and level <= 1599 or SelectMonster == "Dragon Crew Warrior" then
            Ms = "Dragon Crew Warrior"
            NameQuest = "DragonCrewQuest"
            QuestLv = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQ = CFrame.new(6735.110, 126.990, -711.097)
            CFrameMon = CFrame.new(6615.233, 50.847, -978.934)
        elseif level >= 1600 and level <= 1624 or SelectMonster == "Dragon Crew Archer" then
            Ms = "Dragon Crew Archer"
            NameQuest = "DragonCrewQuest"
            QuestLv = 2
            NameMon = "Dragon Crew Archer"
            CFrameQ = CFrame.new(6735.110, 126.990, -711.097)
            CFrameMon = CFrame.new(6818.589, 483.718, 512.726)
        elseif level >= 1625 and level <= 1649 or SelectMonster == "Hydra Enforcer" then
            Ms = "Hydra Enforcer"
            NameQuest = "VenomCrewQuest"
            QuestLv = 1
            NameMon = "Hydra Enforcer"
            CFrameQ = CFrame.new(5446.879, 601.629, 749.456)
            CFrameMon = CFrame.new(4547.115, 1001.602, 334.195)
        elseif level >= 1650 and level <= 1699 or SelectMonster == "Venomous Assailant" then
            Ms = "Venomous Assailant"
            NameQuest = "VenomCrewQuest"
            QuestLv = 2
            NameMon = "Venomous Assailant"
            CFrameQ = CFrame.new(5446.879, 601.629, 749.456)
            CFrameMon = CFrame.new(4637.885, 1077.855, 882.418)
        elseif level >= 1700 and level <= 1724 or SelectMonster == "Marine Commodore" then
            Ms = "Marine Commodore"
            NameQuest = "MarineTreeIsland"
            QuestLv = 1
            NameMon = "Marine Commodore"
            CFrameQ = CFrame.new(2179.988, 28.731, -6740.055)
            CFrameMon = CFrame.new(2198.006, 128.710, -7109.504)
        elseif level >= 1725 and level <= 1774 or SelectMonster == "Marine Rear Admiral" then
            Ms = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            QuestLv = 2
            NameMon = "Marine Rear Admiral"
            CFrameQ = CFrame.new(2179.988, 28.731, -6740.055)
            CFrameMon = CFrame.new(3294.314, 385.411, -7048.634)
        elseif level >= 1775 and level <= 1799 or SelectMonster == "Fishman Raider" then
            Ms = "Fishman Raider"
            NameQuest = "DeepForestIsland3"
            QuestLv = 1
            NameMon = "Fishman Raider"
            CFrameQ = CFrame.new(-10582.759, 331.788, -8757.666)
            CFrameMon = CFrame.new(-10553.268, 521.384, -8176.945)
        elseif level >= 1800 and level <= 1824 or SelectMonster == "Fishman Captain" then
            Ms = "Fishman Captain"
            NameQuest = "DeepForestIsland3"
            QuestLv = 2
            NameMon = "Fishman Captain"
            CFrameQ = CFrame.new(-10583.099, 331.788, -8759.463)
            CFrameMon = CFrame.new(-10789.401, 427.186, -9131.442)
        elseif level >= 1825 and level <= 1849 or SelectMonster == "Forest Pirate" then
            Ms = "Forest Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 1
            NameMon = "Forest Pirate"
            CFrameQ = CFrame.new(-13232.662, 332.403, -7626.481)
            CFrameMon = CFrame.new(-13489.397, 400.303, -7770.251)
        elseif level >= 1850 and level <= 1899 or SelectMonster == "Mythological Pirate" then
            Ms = "Mythological Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 2
            NameMon = "Mythological Pirate"
            CFrameQ = CFrame.new(-13232.662, 332.403, -7626.481)
            CFrameMon = CFrame.new(-13508.616, 582.462, -6985.303)
        elseif level >= 1900 and level <= 1924 or SelectMonster == "Jungle Pirate" then
            Ms = "Jungle Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 1
            NameMon = "Jungle Pirate"
            CFrameQ = CFrame.new(-12682.096, 390.886, -9902.124)
            CFrameMon = CFrame.new(-12267.103, 459.752, -10277.200)
        elseif level >= 1925 and level <= 1974 or SelectMonster == "Musketeer Pirate" then
            Ms = "Musketeer Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 2
            NameMon = "Musketeer Pirate"
            CFrameQ = CFrame.new(-12682.096, 390.886, -9902.124)
            CFrameMon = CFrame.new(-13291.507, 520.473, -9904.638)
        elseif level >= 1975 and level <= 1999 or SelectMonster == "Reborn Skeleton" then
            Ms = "Reborn Skeleton"
            NameQuest = "HauntedQuest1"
            QuestLv = 1
            NameMon = "Reborn Skeleton"
            CFrameQ = CFrame.new(-9480.807, 142.130, 5566.373)
            CFrameMon = CFrame.new(-8761.771, 183.431, 6168.333)
        elseif level >= 2000 and level <= 2024 or SelectMonster == "Living Zombie" then
            Ms = "Living Zombie"
            NameQuest = "HauntedQuest1"
            QuestLv = 2
            NameMon = "Living Zombie"
            CFrameQ = CFrame.new(-9480.807, 142.130, 5566.373)
            CFrameMon = CFrame.new(-10103.752, 238.565, 6179.759)
        elseif level >= 2025 and level <= 2049 or SelectMonster == "Demonic Soul" then
            Ms = "Demonic Soul"
            NameQuest = "HauntedQuest2"
            QuestLv = 1
            NameMon = "Demonic Soul"
            CFrameQ = CFrame.new(-9516.993, 178.006, 6078.465)
            CFrameMon = CFrame.new(-9712.031, 204.695, 6193.322)
        elseif level >= 2050 and level <= 2074 or SelectMonster == "Posessed Mummy" then
            Ms = "Posessed Mummy"
            NameQuest = "HauntedQuest2"
            QuestLv = 2
            NameMon = "Posessed Mummy"
            CFrameQ = CFrame.new(-9516.993, 178.006, 6078.465)
            CFrameMon = CFrame.new(-9545.776, 69.619, 6339.561)
        elseif level >= 2075 and level <= 2099 or SelectMonster == "Peanut Scout" then
            Ms = "Peanut Scout"
            NameQuest = "NutsIslandQuest"
            QuestLv = 1
            NameMon = "Peanut Scout"
            CFrameQ = CFrame.new(-2105.531, 37.249, -10195.508)
            CFrameMon = CFrame.new(-2150.587, 122.497, -10358.994)
        elseif level >= 2100 and level <= 2124 or SelectMonster == "Peanut President" then
            Ms = "Peanut President"
            NameQuest = "NutsIslandQuest"
            QuestLv = 2
            NameMon = "Peanut President"
            CFrameQ = CFrame.new(-2105.531, 37.249, -10195.508)
            CFrameMon = CFrame.new(-2150.587, 122.497, -10358.994)
        elseif level >= 2125 and level <= 2149 or SelectMonster == "Ice Cream Chef" then
            Ms = "Ice Cream Chef"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 1
            NameMon = "Ice Cream Chef"
            CFrameQ = CFrame.new(-819.376, 64.925, -10967.283)
            CFrameMon = CFrame.new(-789.941, 209.382, -11009.980)
        elseif level >= 2150 and level <= 2199 or SelectMonster == "Ice Cream Commander" then
            Ms = "Ice Cream Commander"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 2
            NameMon = "Ice Cream Commander"
            CFrameQ = CFrame.new(-819.376, 64.925, -10967.283)
            CFrameMon = CFrame.new(-789.941, 209.382, -11009.980)
        elseif level >= 2200 and level <= 2224 or SelectMonster == "Cookie Crafter" then
            Ms = "Cookie Crafter"
            NameQuest = "CakeQuest1"
            QuestLv = 1
            NameMon = "Cookie Crafter"
            CFrameQ = CFrame.new(-2022.298, 36.927, -12030.976)
            CFrameMon = CFrame.new(-2321.712, 36.699, -12216.787)
        elseif level >= 2225 and level <= 2249 or SelectMonster == "Cake Guard" then
            Ms = "Cake Guard"
            NameQuest = "CakeQuest1"
            QuestLv = 2
            NameMon = "Cake Guard"
            CFrameQ = CFrame.new(-2022.298, 36.927, -12030.976)
            CFrameMon = CFrame.new(-1418.110, 36.671, -12255.732)
        elseif level >= 2250 and level <= 2274 or SelectMonster == "Baking Staff" then
            Ms = "Baking Staff"
            NameQuest = "CakeQuest2"
            QuestLv = 1
            NameMon = "Baking Staff"
            CFrameQ = CFrame.new(-1928.317, 37.729, -12840.626)
            CFrameMon = CFrame.new(-1980.438, 36.671, -12983.841)
        elseif level >= 2275 and level <= 2299 or SelectMonster == "Head Baker" then
            Ms = "Head Baker"
            NameQuest = "CakeQuest2"
            QuestLv = 2
            NameMon = "Head Baker"
            CFrameQ = CFrame.new(-1928.317, 37.729, -12840.626)
            CFrameMon = CFrame.new(-2251.579, 52.271, -13033.396)
        elseif level >= 2300 and level <= 2324 or SelectMonster == "Cocoa Warrior" then
            Ms = "Cocoa Warrior"
            NameQuest = "ChocQuest1"
            QuestLv = 1
            NameMon = "Cocoa Warrior"
            CFrameQ = CFrame.new(231.75, 23.900, -12200.292)
            CFrameMon = CFrame.new(167.978, 26.225, -12238.874)
        elseif level >= 2325 and level <= 2349 or SelectMonster == "Chocolate Bar Battler" then
            Ms = "Chocolate Bar Battler"
            NameQuest = "ChocQuest1"
            QuestLv = 2
            NameMon = "Chocolate Bar Battler"
            CFrameQ = CFrame.new(231.75, 23.900, -12200.292)
            CFrameMon = CFrame.new(701.312, 25.582, -12708.214)
        elseif level >= 2350 and level <= 2374 or SelectMonster == "Sweet Thief" then
            Ms = "Sweet Thief"
            NameQuest = "ChocQuest2"
            QuestLv = 1
            NameMon = "Sweet Thief"
            CFrameQ = CFrame.new(151.198, 23.890, -12774.617)
            CFrameMon = CFrame.new(-140.258, 25.582, -12652.311)
        elseif level >= 2375 and level <= 2400 or SelectMonster == "Candy Rebel" then
            Ms = "Candy Rebel"
            NameQuest = "ChocQuest2"
            QuestLv = 2
            NameMon = "Candy Rebel"
            CFrameQ = CFrame.new(151.198, 23.890, -12774.617)
            CFrameMon = CFrame.new(47.923, 25.582, -13029.240)
        elseif level >= 2400 and level <= 2424 or SelectMonster == "Candy Pirate" then
            Ms = "Candy Pirate"
            NameQuest = "CandyQuest1"
            QuestLv = 1
            NameMon = "Candy Pirate"
            CFrameQ = CFrame.new(-1149.328, 13.575, -14445.614)
            CFrameMon = CFrame.new(-1437.563, 17.148, -14385.693)
        elseif level >= 2425 and level <= 2449 or SelectMonster == "Snow Demon" then
            Ms = "Snow Demon"
            NameQuest = "CandyQuest1"
            QuestLv = 2
            NameMon = "Snow Demon"
            CFrameQ = CFrame.new(-1149.328, 13.575, -14445.614)
            CFrameMon = CFrame.new(-916.222, 17.148, -14638.812)
        elseif level >= 2450 and level <= 2474 or SelectMonster == "Isle Outlaw" then
            Ms = "Isle Outlaw"
            NameQuest = "TikiQuest1"
            QuestLv = 1
            NameMon = "Isle Outlaw"
            CFrameQ = CFrame.new(-16549.890, 55.686, -179.913)
            CFrameMon = CFrame.new(-16162.819, 11.686, -96.454)
        elseif level >= 2475 and level <= 2499 or SelectMonster == "Island Boy" then
            Ms = "Island Boy"
            NameQuest = "TikiQuest1"
            QuestLv = 2
            NameMon = "Island Boy"
            CFrameQ = CFrame.new(-16549.890, 55.686, -179.913)
            CFrameMon = CFrame.new(-16357.312, 20.632, 1005.648)
        elseif level >= 2500 and level <= 2524 or SelectMonster == "Sun-kissed Warrior" then
            Ms = "Sun-kissed Warrior"
            NameQuest = "TikiQuest2"
            QuestLv = 1
            NameMon = "Sun-kissed Warrior"
            CFrameQ = CFrame.new(-16541.021, 54.770, 1051.461)
            CFrameMon = CFrame.new(-16357.312, 20.632, 1005.648)
        elseif level >= 2525 and level <= 2549 or SelectMonster == "Isle Champion" then
            Ms = "Isle Champion"
            NameQuest = "TikiQuest2"
            QuestLv = 2
            NameMon = "Isle Champion"
            CFrameQ = CFrame.new(-16541.021, 54.770, 1051.461)
            CFrameMon = CFrame.new(-16848.941, 21.686, 1041.449)
        elseif level >= 2550 and level <= 2574 or SelectMonster == "Serpent Hunter" then
            Ms = "Serpent Hunter"
            NameQuest = "TikiQuest3"
            QuestLv = 1
            NameMon = "Serpent Hunter"
            CFrameQ = CFrame.new(-16665.191, 104.596, 1579.694)
            CFrameMon = CFrame.new(-16621.414, 121.406, 1290.688)
        elseif level >= 2575 or SelectMonster == "Skull Slayer" then
            Ms = "Skull Slayer"
            NameQuest = "TikiQuest3"
            QuestLv = 2
            NameMon = "Skull Slayer"
            CFrameQ = CFrame.new(-16665.191, 104.596, 1579.694)
            CFrameMon = CFrame.new(-16811.570, 84.625, 1542.235)
        end
    end
end

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

local function round(num)
    return math.floor(tonumber(num) + 0.5)
end

local function isnil(val)
    return val == nil
end

local function GetCharacter()
    Character = LocalPlayer.Character
    return Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Humanoid")
end

local function Tween(targetCFrame)
    if not GetCharacter() then return end
    
    local hrp = Character.HumanoidRootPart
    local distance = (targetCFrame.Position - hrp.Position).Magnitude
    local tweenTime = distance / _G.TweenSpeed
    
    local tweenInfo = TweenInfo.new(tweenTime, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
    tween:Play()
end

local function Tween2(targetCFrame)
    if not GetCharacter() then return end
    
    local hrp = Character.HumanoidRootPart
    local distance = (targetCFrame.Position - hrp.Position).Magnitude
    local tweenTime = distance / 350
    
    local tweenInfo = TweenInfo.new(tweenTime, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
    tween:Play()
    wait(tweenTime)
end

local function EquipTool(weaponName)
    if not GetCharacter() then return end
    if not weaponName then return end
    
    local backpack = LocalPlayer.Backpack
    local tool = backpack:FindFirstChild(weaponName)
    
    if tool and tool:IsA("Tool") and not Character:FindFirstChild(tool.Name) then
        Character.Humanoid:EquipTool(tool)
    end
end

local function AutoHaki()
    if not GetCharacter() then return end
    
    pcall(function()
        if not Character:FindFirstChild("HasBuso") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
        end
    end)
end

local function AttackNoCoolDown()
    if not GetCharacter() then return end
    
    pcall(function()
        local tool = Character:FindFirstChildOfClass("Tool")
        if tool then
            local remote = tool:FindFirstChild("LeftClickRemote") or tool:FindFirstChild("RemoteEvent")
            if remote then
                remote:FireServer()
            end
            tool:Activate()
        end
        
        if _G.FastAttack then
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            task.wait()
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
        end
    end)
end

local function BringMob(mob)
    if not _G.BringMob then return end
    if not mob or not mob:FindFirstChild("HumanoidRootPart") then return end
    
    pcall(function()
        mob.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        mob.HumanoidRootPart.Transparency = 1
        mob.HumanoidRootPart.CanCollide = false
        if mob:FindFirstChild("Humanoid") then
            mob.Humanoid.JumpPower = 0
            mob.Humanoid.WalkSpeed = 0
        end
    end)
end

local function FindMob(mobName)
    if not Workspace:FindFirstChild("Enemies") then return nil end
    
    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
        if mob.Name == mobName and mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") then
            if mob.Humanoid.Health > 0 then
                return mob
            end
        end
    end
    return nil
end

-- ============================================================================
-- ANTI-AFK
-- ============================================================================

spawn(function()
    LocalPlayer.Idled:Connect(function()
        pcall(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            task.wait()
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    end)
end)

-- ============================================================================
-- BODY VELOCITY FOR NO CLIP
-- ============================================================================

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoLevel or _G.AutoNear or _G.AutoBoss or _G.AutoCastleRaid or _G.AutoMasteryFruit or _G.AutoMasteryGun or _G.AutoMaterial or _G.AutoRaid then
                if GetCharacter() then
                    if not Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                        local bv = Instance.new("BodyVelocity")
                        bv.Name = "BodyClip"
                        bv.Parent = Character.HumanoidRootPart
                        bv.MaxForce = Vector3.new(100000, 100000, 100000)
                        bv.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            else
                if GetCharacter() and Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    Character.HumanoidRootPart.BodyClip:Destroy()
                end
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        RunService.Stepped:Connect(function()
            if _G.AutoLevel or _G.AutoNear or _G.AutoBoss or _G.AutoCastleRaid or _G.AutoMasteryFruit or _G.AutoMasteryGun or _G.AutoMaterial or _G.AutoRaid then
                if GetCharacter() then
                    for _, part in pairs(Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end
        end)
    end)
end)

-- ============================================================================
-- WEAPON SELECTION LOOP
-- ============================================================================

spawn(function()
    while wait() do
        pcall(function()
            if ChooseWeapon == "Melee" then
                for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if tool.ToolTip == "Melee" then
                        SelectWeapon = tool.Name
                    end
                end
            elseif ChooseWeapon == "Sword" then
                for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if tool.ToolTip == "Sword" then
                        SelectWeapon = tool.Name
                    end
                end
            elseif ChooseWeapon == "Blox Fruit" then
                for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if tool.ToolTip == "Blox Fruit" then
                        SelectWeapon = tool.Name
                    end
                end
            end
        end)
    end
end)

-- ============================================================================
-- AUTO LEVEL FARM LOOP
-- ============================================================================

spawn(function()
    while task.wait(_G.Fast_Delay) do
        if _G.AutoLevel then
            pcall(function()
                if not GetCharacter() then return end
                
                CheckLevel()
                
                local questUI = LocalPlayer.PlayerGui:FindFirstChild("Main")
                local hasQuest = questUI and questUI:FindFirstChild("Quest") and questUI.Quest.Visible
                local correctQuest = hasQuest and string.find(questUI.Quest.Container.QuestTitle.Title.Text, NameMon)
                
                if not hasQuest or not correctQuest then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                    Tween(CFrameQ)
                    if (CFrameQ.Position - Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                    end
                else
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 and mob.Name == Ms then
                            repeat
                                if not _G.AutoLevel then break end
                                if not GetCharacter() then break end
                                if not mob or not mob.Parent then break end
                                if mob.Humanoid.Health <= 0 then break end
                                
                                task.wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(mob)
                                Tween(mob.HumanoidRootPart.CFrame * Pos)
                                FarmPos = mob.HumanoidRootPart.CFrame
                                MonFarm = mob.Name
                            until not _G.AutoLevel or not mob.Parent or mob.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- AUTO NEAR MOB LOOP
-- ============================================================================

spawn(function()
    while task.wait(_G.Fast_Delay) do
        if _G.AutoNear then
            pcall(function()
                if not GetCharacter() then return end
                
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if not _G.AutoNear then break end
                    
                    if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                        local dist = (Character.HumanoidRootPart.Position - mob.HumanoidRootPart.Position).Magnitude
                        
                        if dist <= 5000 then
                            repeat
                                if not _G.AutoNear then break end
                                if not GetCharacter() then break end
                                if not mob or not mob.Parent then break end
                                if mob.Humanoid.Health <= 0 then break end
                                
                                task.wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(mob)
                                Tween(mob.HumanoidRootPart.CFrame * Pos)
                                FarmPos = mob.HumanoidRootPart.CFrame
                                MonFarm = mob.Name
                            until not _G.AutoNear or not mob.Parent or mob.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- AUTO CASTLE RAID (PIRATES)
-- ============================================================================

spawn(function()
    while wait() do
        if _G.AutoCastleRaid then
            pcall(function()
                local raidPos = CFrame.new(-5496.174, 313.768, -2841.530)
                
                if (CFrame.new(-5539.311, 313.800, -2972.372).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if _G.AutoCastleRaid and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and (mob.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                            repeat
                                if not _G.AutoCastleRaid then break end
                                if mob.Humanoid.Health <= 0 then break end
                                if not mob.Parent then break end
                                
                                task.wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                mob.HumanoidRootPart.CanCollide = false
                                mob.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                Tween(mob.HumanoidRootPart.CFrame * Pos)
                            until not _G.AutoCastleRaid or mob.Humanoid.Health <= 0 or not mob.Parent
                        end
                    end
                else
                    Tween(raidPos)
                end
            end)
        end
    end
end)

-- ============================================================================
-- AUTO COLLECT CHEST
-- ============================================================================

spawn(function()
    while wait() do
        if _G.AutoCollectChest then
            pcall(function()
                local playerPos = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):GetPivot().Position
                local chests = CollectionService:GetTagged("_ChestTagged")
                local closest = math.huge
                local target = nil
                
                for i = 1, #chests do
                    local chest = chests[i]
                    local dist = (chest:GetPivot().Position - playerPos).Magnitude
                    if not chest:GetAttribute("IsDisabled") and dist < closest then
                        target = chest
                        closest = dist
                    end
                end
                
                if target then
                    Tween2(CFrame.new(target:GetPivot().Position))
                end
            end)
        end
    end
end)

-- ============================================================================
-- CREATE UI TABS
-- ============================================================================

-- Main Farm Tab
local FarmTab = Window:CreateTab("Farm")

local FarmSection = FarmTab:CreateSection("Auto Farm", true)

FarmSection:AddDropdown({
    Label = "Weapon Type",
    Options = {"Melee", "Sword", "Blox Fruit"},
    Default = "Melee",
    Callback = function(v)
        ChooseWeapon = v
    end
})

FarmSection:AddToggle({
    Label = "Auto Level",
    Default = false,
    Callback = function(v)
        _G.AutoLevel = v
    end
})

FarmSection:AddToggle({
    Label = "Auto Near Mob",
    Default = false,
    Callback = function(v)
        _G.AutoNear = v
    end
})

FarmSection:AddToggle({
    Label = "Farm Pirates (Castle Raid)",
    Default = false,
    Callback = function(v)
        _G.AutoCastleRaid = v
    end
})

FarmSection:AddToggle({
    Label = "Collect Chests",
    Default = false,
    Callback = function(v)
        _G.AutoCollectChest = v
    end
})

-- Combat Section
local CombatSection = FarmTab:CreateSection("Combat Settings", true)

CombatSection:AddToggle({
    Label = "Bring Mob",
    Default = true,
    Callback = function(v)
        _G.BringMob = v
    end
})

CombatSection:AddToggle({
    Label = "Auto Haki",
    Default = true,
    Callback = function(v)
        _G.AutoHaki = v
    end
})

CombatSection:AddToggle({
    Label = "Fast Attack",
    Default = true,
    Callback = function(v)
        _G.FastAttack = v
    end
})

-- Mastery Tab
local MasteryTab = Window:CreateTab("Mastery")

local MasterySection = MasteryTab:CreateSection("Mastery Farm", true)

MasterySection:AddDropdown({
    Label = "Mastery Type",
    Options = {"Level", "Level No Quest", "Near Mob", "Bone", "Cake", "Ectoplasm"},
    Default = "Level",
    Callback = function(v)
        TypeMastery = v
    end
})

MasterySection:AddToggle({
    Label = "Fruit Mastery",
    Default = false,
    Callback = function(v)
        _G.AutoMasteryFruit = v
    end
})

MasterySection:AddToggle({
    Label = "Gun Mastery",
    Default = false,
    Callback = function(v)
        _G.AutoMasteryGun = v
    end
})

MasterySection:AddSlider({
    Label = "Kill at % HP",
    Min = 5,
    Max = 100,
    Default = 20,
    Suffix = "%",
    Callback = function(v)
        _G.KillPercent = v
    end
})

-- Skill Section
local SkillSection = MasteryTab:CreateSection("Skills", true)

SkillSection:AddToggle({
    Label = "Use Skill Z",
    Default = true,
    Callback = function(v) _G.SkillZ = v end
})

SkillSection:AddToggle({
    Label = "Use Skill X",
    Default = true,
    Callback = function(v) _G.SkillX = v end
})

SkillSection:AddToggle({
    Label = "Use Skill C",
    Default = true,
    Callback = function(v) _G.SkillC = v end
})

SkillSection:AddToggle({
    Label = "Use Skill V",
    Default = true,
    Callback = function(v) _G.SkillV = v end
})

SkillSection:AddToggle({
    Label = "Use Skill F",
    Default = false,
    Callback = function(v) _G.SkillF = v end
})

-- ESP Tab
local ESPTab = Window:CreateTab("ESP")

local ESPSection = ESPTab:CreateSection("ESP Options", true)

ESPSection:AddToggle({
    Label = "Mob ESP",
    Default = false,
    Callback = function(v) _G.MobESP = v end
})

ESPSection:AddToggle({
    Label = "Player ESP",
    Default = false,
    Callback = function(v) _G.PlayerESP = v end
})

ESPSection:AddToggle({
    Label = "Devil Fruit ESP",
    Default = false,
    Callback = function(v) _G.FruitESP = v end
})

ESPSection:AddToggle({
    Label = "Chest ESP",
    Default = false,
    Callback = function(v) _G.ChestESP = v end
})

ESPSection:AddToggle({
    Label = "Flower ESP",
    Default = false,
    Callback = function(v) _G.FlowerESP = v end
})

ESPSection:AddToggle({
    Label = "Island ESP",
    Default = false,
    Callback = function(v) _G.IslandESP = v end
})

ESPSection:AddToggle({
    Label = "NPC ESP",
    Default = false,
    Callback = function(v) _G.NpcESP = v end
})

ESPSection:AddToggle({
    Label = "Sea Beast ESP",
    Default = false,
    Callback = function(v) _G.SeaBeastESP = v end
})

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings")

local SpeedSection = SettingsTab:CreateSection("Speed Settings", true)

SpeedSection:AddSlider({
    Label = "Tween Speed",
    Min = 100,
    Max = 500,
    Default = 350,
    Callback = function(v)
        _G.TweenSpeed = v
    end
})

SpeedSection:AddSlider({
    Label = "Farm Delay",
    Min = 0.01,
    Max = 0.5,
    Default = 0.1,
    Step = 0.01,
    Suffix = "s",
    Callback = function(v)
        _G.Fast_Delay = v
    end
})

-- Info Section
local InfoSection = SettingsTab:CreateSection("Info", true)

InfoSection:AddLabel({Text = "Sea: " .. CurrentSea, Bold = true})
InfoSection:AddLabel({Text = "Version: 9.0", Color = Library:GetTheme().Colors.Accent})

InfoSection:AddButton({
    Label = "Copy Discord Link",
    Style = "primary",
    Callback = function()
        pcall(function()
            if setclipboard then
                setclipboard("https://discord.gg/wkkgT7a57U")
            end
        end)
        Window.Notify("Copied!", "Discord link copied to clipboard", 2, "success")
    end
})

-- ============================================================================
-- ESP LOOPS
-- ============================================================================

-- Mob ESP
spawn(function()
    while wait() do
        pcall(function()
            if _G.MobESP then
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("HumanoidRootPart") then
                        if not mob:FindFirstChild("MobEsp") then
                            local billboard = Instance.new("BillboardGui")
                            local label = Instance.new("TextLabel")
                            billboard.Parent = mob
                            billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            billboard.Active = true
                            billboard.Name = "MobEsp"
                            billboard.AlwaysOnTop = true
                            billboard.LightInfluence = 1
                            billboard.Size = UDim2.new(0, 200, 0, 50)
                            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                            label.Parent = billboard
                            label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            label.BackgroundTransparency = 1
                            label.Size = UDim2.new(0, 200, 0, 50)
                            label.Font = Enum.Font.GothamBold
                            label.TextColor3 = Color3.fromRGB(7, 236, 240)
                            label.TextSize = 14
                        end
                        if mob:FindFirstChild("MobEsp") then
                            mob.MobEsp.TextLabel.Text = mob.Name .. " - " .. math.floor((LocalPlayer.Character.HumanoidRootPart.Position - mob.HumanoidRootPart.Position).Magnitude) .. "m"
                        end
                    end
                end
            else
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("MobEsp") then
                        mob.MobEsp:Destroy()
                    end
                end
            end
        end)
    end
end)

-- Fruit ESP
spawn(function()
    while wait() do
        pcall(function()
            if _G.FruitESP then
                for _, item in pairs(Workspace:GetChildren()) do
                    if string.find(item.Name, "Fruit") and item:FindFirstChild("Handle") then
                        if not item.Handle:FindFirstChild("FruitEsp" .. ESPNumber) then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "FruitEsp" .. ESPNumber
                            billboard.ExtentsOffset = Vector3.new(0, 1, 0)
                            billboard.Size = UDim2.new(1, 200, 1, 30)
                            billboard.Adornee = item.Handle
                            billboard.AlwaysOnTop = true
                            billboard.Parent = item.Handle
                            
                            local label = Instance.new("TextLabel")
                            label.Font = Enum.Font.GothamSemibold
                            label.TextSize = 14
                            label.TextWrapped = true
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.TextYAlignment = Enum.TextYAlignment.Top
                            label.BackgroundTransparency = 1
                            label.TextStrokeTransparency = 0.5
                            label.TextColor3 = Color3.fromRGB(255, 255, 255)
                            label.Text = item.Name .. "\n" .. round((LocalPlayer.Character.Head.Position - item.Handle.Position).Magnitude / 3) .. "m"
                            label.Parent = billboard
                        else
                            item.Handle["FruitEsp" .. ESPNumber].TextLabel.Text = item.Name .. "\n" .. round((LocalPlayer.Character.Head.Position - item.Handle.Position).Magnitude / 3) .. "m"
                        end
                    end
                end
            else
                for _, item in pairs(Workspace:GetChildren()) do
                    if string.find(item.Name, "Fruit") and item:FindFirstChild("Handle") and item.Handle:FindFirstChild("FruitEsp" .. ESPNumber) then
                        item.Handle["FruitEsp" .. ESPNumber]:Destroy()
                    end
                end
            end
        end)
    end
end)

-- Sea Beast ESP
spawn(function()
    while wait() do
        pcall(function()
            if _G.SeaBeastESP then
                for _, beast in pairs(Workspace.SeaBeasts:GetChildren()) do
                    if beast:FindFirstChild("HumanoidRootPart") then
                        if not beast:FindFirstChild("SeaEsp") then
                            local billboard = Instance.new("BillboardGui")
                            local label = Instance.new("TextLabel")
                            billboard.Parent = beast
                            billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            billboard.Active = true
                            billboard.Name = "SeaEsp"
                            billboard.AlwaysOnTop = true
                            billboard.LightInfluence = 1
                            billboard.Size = UDim2.new(0, 200, 0, 50)
                            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                            label.Parent = billboard
                            label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            label.BackgroundTransparency = 1
                            label.Size = UDim2.new(0, 200, 0, 50)
                            label.Font = Enum.Font.GothamBold
                            label.TextColor3 = Color3.fromRGB(7, 236, 240)
                            label.TextSize = 14
                        end
                        beast.SeaEsp.TextLabel.Text = beast.Name .. " - " .. math.floor((LocalPlayer.Character.HumanoidRootPart.Position - beast.HumanoidRootPart.Position).Magnitude) .. "m"
                    end
                end
            else
                for _, beast in pairs(Workspace.SeaBeasts:GetChildren()) do
                    if beast:FindFirstChild("SeaEsp") then
                        beast.SeaEsp:Destroy()
                    end
                end
            end
        end)
    end
end)

-- NPC ESP
spawn(function()
    while wait() do
        pcall(function()
            if _G.NpcESP then
                for _, npc in pairs(Workspace.NPCs:GetChildren()) do
                    if npc:FindFirstChild("HumanoidRootPart") then
                        if not npc:FindFirstChild("NpcEsp") then
                            local billboard = Instance.new("BillboardGui")
                            local label = Instance.new("TextLabel")
                            billboard.Parent = npc
                            billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            billboard.Active = true
                            billboard.Name = "NpcEsp"
                            billboard.AlwaysOnTop = true
                            billboard.LightInfluence = 1
                            billboard.Size = UDim2.new(0, 200, 0, 50)
                            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                            label.Parent = billboard
                            label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            label.BackgroundTransparency = 1
                            label.Size = UDim2.new(0, 200, 0, 50)
                            label.Font = Enum.Font.GothamBold
                            label.TextColor3 = Color3.fromRGB(0, 255, 0)
                            label.TextSize = 14
                        end
                        npc.NpcEsp.TextLabel.Text = npc.Name .. " - " .. math.floor((LocalPlayer.Character.HumanoidRootPart.Position - npc.HumanoidRootPart.Position).Magnitude) .. "m"
                    end
                end
            else
                for _, npc in pairs(Workspace.NPCs:GetChildren()) do
                    if npc:FindFirstChild("NpcEsp") then
                        npc.NpcEsp:Destroy()
                    end
                end
            end
        end)
    end
end)

-- ============================================================================
-- BOSS DATA FUNCTION
-- ============================================================================

function CheckBossQuest()
    if Sea1 then
        if SelectBoss == "The Gorilla King" then
            BossMon = "The Gorilla King"
            NameBoss = "The Gorrila King"
            NameQuestBoss = "JungleQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-1601.655, 36.852, 153.388)
            CFrameBoss = CFrame.new(-1088.759, 8.134, -488.559)
        elseif SelectBoss == "Bobby" then
            BossMon = "Bobby"
            NameBoss = "Bobby"
            NameQuestBoss = "BuggyQuest1"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-1140.176, 4.752, 3827.405)
            CFrameBoss = CFrame.new(-1087.376, 46.949, 4040.146)
        elseif SelectBoss == "The Saw" then
            BossMon = "The Saw"
            NameBoss = "The Saw"
            CFrameBoss = CFrame.new(-784.897, 72.427, 1603.582)
        elseif SelectBoss == "Yeti" then
            BossMon = "Yeti"
            NameBoss = "Yeti"
            NameQuestBoss = "SnowQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(1386.807, 87.272, -1298.357)
            CFrameBoss = CFrame.new(1218.795, 138.011, -1488.026)
        elseif SelectBoss == "Mob Leader" then
            BossMon = "Mob Leader"
            NameBoss = "Mob Leader"
            CFrameBoss = CFrame.new(-2844.730, 7.418, 5356.672)
        elseif SelectBoss == "Vice Admiral" then
            BossMon = "Vice Admiral"
            NameBoss = "Vice Admiral"
            NameQuestBoss = "MarineQuest2"
            QuestLvBoss = 2
            CFrameQBoss = CFrame.new(-5036.246, 28.677, 4324.566)
            CFrameBoss = CFrame.new(-5006.545, 88.032, 4353.162)
        elseif SelectBoss == "Saber Expert" then
            BossMon = "Saber Expert"
            NameBoss = "Saber Expert"
            CFrameBoss = CFrame.new(-1458.895, 29.887, -50.633)
        elseif SelectBoss == "Warden" then
            BossMon = "Warden"
            NameBoss = "Warden"
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 1
            CFrameQBoss = CFrame.new(5191.861, 2.840, 686.438)
            CFrameBoss = CFrame.new(5278.049, 2.151, 944.101)
        elseif SelectBoss == "Chief Warden" then
            BossMon = "Chief Warden"
            NameBoss = "Chief Warden"
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 2
            CFrameQBoss = CFrame.new(5191.861, 2.840, 686.438)
            CFrameBoss = CFrame.new(5206.925, 0.997, 814.976)
        elseif SelectBoss == "Swan" then
            BossMon = "Swan"
            NameBoss = "Swan"
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(5191.861, 2.840, 686.438)
            CFrameBoss = CFrame.new(5325.096, 7.039, 719.570)
        elseif SelectBoss == "Magma Admiral" then
            BossMon = "Magma Admiral"
            NameBoss = "Magma Admiral"
            NameQuestBoss = "MagmaQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-5314.622, 12.262, 8517.279)
            CFrameBoss = CFrame.new(-5765.896, 82.920, 8718.304)
        elseif SelectBoss == "Fishman Lord" then
            BossMon = "Fishman Lord"
            NameBoss = "Fishman Lord"
            NameQuestBoss = "FishmanQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(61122.652, 18.497, 1569.399)
            CFrameBoss = CFrame.new(61260.152, 30.950, 1193.432)
        elseif SelectBoss == "Wysper" then
            BossMon = "Wysper"
            NameBoss = "Wysper"
            NameQuestBoss = "SkyExp1Quest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-7861.947, 5545.517, -379.859)
            CFrameBoss = CFrame.new(-7866.133, 5576.431, -546.748)
        elseif SelectBoss == "Thunder God" then
            BossMon = "Thunder God"
            NameBoss = "Thunder God"
            NameQuestBoss = "SkyExp2Quest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-7903.382, 5635.989, -1410.923)
            CFrameBoss = CFrame.new(-7994.984, 5761.025, -2088.647)
        elseif SelectBoss == "Cyborg" then
            BossMon = "Cyborg"
            NameBoss = "Cyborg"
            NameQuestBoss = "FountainQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(5258.278, 38.526, 4050.044)
            CFrameBoss = CFrame.new(6094.024, 73.770, 3825.734)
        elseif SelectBoss == "Ice Admiral" then
            BossMon = "Ice Admiral"
            NameBoss = "Ice Admiral"
            CFrameBoss = CFrame.new(1266.089, 26.175, -1399.576)
        elseif SelectBoss == "Greybeard" then
            BossMon = "Greybeard"
            NameBoss = "Greybeard"
            CFrameBoss = CFrame.new(-5081.345, 85.221, 4257.358)
        end
    end
    
    if Sea2 then
        if SelectBoss == "Diamond" then
            BossMon = "Diamond"
            NameBoss = "Diamond"
            NameQuestBoss = "Area1Quest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-427.566, 73.313, 1835.420)
            CFrameBoss = CFrame.new(-1576.716, 198.592, 13.724)
        elseif SelectBoss == "Jeremy" then
            BossMon = "Jeremy"
            NameBoss = "Jeremy"
            NameQuestBoss = "Area2Quest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(636.799, 73.413, 918.004)
            CFrameBoss = CFrame.new(2006.926, 448.956, 853.982)
        elseif SelectBoss == "Fajita" then
            BossMon = "Fajita"
            NameBoss = "Fajita"
            NameQuestBoss = "MarineQuest3"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-2441.986, 73.359, -3217.532)
            CFrameBoss = CFrame.new(-2172.739, 103.322, -4015.025)
        elseif SelectBoss == "Don Swan" then
            BossMon = "Don Swan"
            NameBoss = "Don Swan"
            CFrameBoss = CFrame.new(2286.200, 15.177, 863.838)
        elseif SelectBoss == "Smoke Admiral" then
            BossMon = "Smoke Admiral"
            NameBoss = "Smoke Admiral"
            NameQuestBoss = "IceSideQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-5429.047, 15.977, -5297.961)
            CFrameBoss = CFrame.new(-5275.198, 20.757, -5260.666)
        elseif SelectBoss == "Awakened Ice Admiral" then
            BossMon = "Awakened Ice Admiral"
            NameBoss = "Awakened Ice Admiral"
            NameQuestBoss = "FrostQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(5668.978, 28.519, -6483.352)
            CFrameBoss = CFrame.new(6403.543, 340.297, -6894.559)
        elseif SelectBoss == "Tide Keeper" then
            BossMon = "Tide Keeper"
            NameBoss = "Tide Keeper"
            NameQuestBoss = "ForgottenQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-3053.981, 237.189, -10145.039)
            CFrameBoss = CFrame.new(-3795.642, 105.888, -11421.307)
        elseif SelectBoss == "Darkbeard" then
            BossMon = "Darkbeard"
            NameBoss = "Darkbeard"
            CFrameBoss = CFrame.new(3677.082, 62.751, -3144.833)
        elseif SelectBoss == "Cursed Captain" then
            BossMon = "Cursed Captain"
            NameBoss = "Cursed Captain"
            CFrameBoss = CFrame.new(916.928, 181.092, 33422)
        elseif SelectBoss == "Order" then
            BossMon = "Order"
            NameBoss = "Order"
            CFrameBoss = CFrame.new(-6217.202, 28.047, -5053.135)
        end
    end
    
    if Sea3 then
        if SelectBoss == "Stone" then
            BossMon = "Stone"
            NameBoss = "Stone"
            NameQuestBoss = "PiratePortQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-289.767, 43.819, 5579.938)
            CFrameBoss = CFrame.new(-1027.651, 92.404, 6578.853)
        elseif SelectBoss == "Hydra Leader" then
            BossMon = "Hydra Leader"
            NameBoss = "Hydra Leader"
            NameQuestBoss = "VenomCrewQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(5445.954, 601.629, 751.437)
            CFrameBoss = CFrame.new(5543.863, 668.973, 199.034)
        elseif SelectBoss == "Kilo Admiral" then
            BossMon = "Kilo Admiral"
            NameBoss = "Kilo Admiral"
            NameQuestBoss = "MarineTreeIsland"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(2179.301, 28.731, -6739.974)
            CFrameBoss = CFrame.new(2764.223, 432.461, -7144.458)
        elseif SelectBoss == "Captain Elephant" then
            BossMon = "Captain Elephant"
            NameBoss = "Captain Elephant"
            NameQuestBoss = "DeepForestIsland"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-13232.682, 332.403, -7626.011)
            CFrameBoss = CFrame.new(-13376.757, 433.286, -8071.392)
        elseif SelectBoss == "Beautiful Pirate" then
            BossMon = "Beautiful Pirate"
            NameBoss = "Beautiful Pirate"
            NameQuestBoss = "DeepForestIsland2"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-12682.096, 390.886, -9902.124)
            CFrameBoss = CFrame.new(5283.609, 22.562, -110.782)
        elseif SelectBoss == "Cake Queen" then
            BossMon = "Cake Queen"
            NameBoss = "Cake Queen"
            NameQuestBoss = "IceCreamIslandQuest"
            QuestLvBoss = 3
            CFrameQBoss = CFrame.new(-819.376, 64.925, -10967.283)
            CFrameBoss = CFrame.new(-678.648, 381.353, -11114.201)
        elseif SelectBoss == "Longma" then
            BossMon = "Longma"
            NameBoss = "Longma"
            CFrameBoss = CFrame.new(-10238.875, 389.791, -9549.793)
        elseif SelectBoss == "Soul Reaper" then
            BossMon = "Soul Reaper"
            NameBoss = "Soul Reaper"
            CFrameBoss = CFrame.new(-9524.789, 315.804, 6655.719)
        elseif SelectBoss == "rip_indra True Form" then
            BossMon = "rip_indra True Form"
            NameBoss = "rip_indra True Form"
            CFrameBoss = CFrame.new(-5415.392, 505.741, -2814.016)
        end
    end
end

-- ============================================================================
-- MATERIAL FARMING DATA
-- ============================================================================

local MaterialList = {
    "Radioactive Material", "Mystic Droplet", "Magma Ore", "Angel Wings",
    "Leather", "Scrap Metal", "Fish Tail", "Demonic Wisp", "Vampire Fang",
    "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Mini Tusk"
}

local SelectMaterial = nil
local MMon = ""
local MPos = CFrame.new(0, 0, 0)

function MaterialMon()
    if SelectMaterial == "Radioactive Material" then
        MMon = "Factory Staff"
        MPos = CFrame.new(295, 73, -56)
    elseif SelectMaterial == "Mystic Droplet" then
        MMon = "Water Fighter"
        MPos = CFrame.new(-3385, 239, -10542)
    elseif SelectMaterial == "Magma Ore" then
        if Sea1 then
            MMon = "Military Spy"
            MPos = CFrame.new(-5815, 84, 8820)
        elseif Sea2 then
            MMon = "Magma Ninja"
            MPos = CFrame.new(-5428, 78, -5959)
        end
    elseif SelectMaterial == "Angel Wings" then
        MMon = "God's Guard"
        MPos = CFrame.new(-4698, 845, -1912)
    elseif SelectMaterial == "Leather" then
        if Sea1 then
            MMon = "Brute"
            MPos = CFrame.new(-1145, 15, 4350)
        elseif Sea2 then
            MMon = "Marine Captain"
            MPos = CFrame.new(-2010.505, 73.001, -3326.620)
        elseif Sea3 then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-11975.785, 331.773, -10620.030)
        end
    elseif SelectMaterial == "Scrap Metal" then
        if Sea1 then
            MMon = "Brute"
            MPos = CFrame.new(-1145, 15, 4350)
        elseif Sea2 then
            MMon = "Swan Pirate"
            MPos = CFrame.new(878, 122, 1235)
        elseif Sea3 then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-12107, 332, -10549)
        end
    elseif SelectMaterial == "Fish Tail" then
        if Sea3 then
            MMon = "Fishman Raider"
            MPos = CFrame.new(-10993, 332, -8940)
        elseif Sea1 then
            MMon = "Fishman Warrior"
            MPos = CFrame.new(61123, 19, 1569)
        end
    elseif SelectMaterial == "Demonic Wisp" then
        MMon = "Demonic Soul"
        MPos = CFrame.new(-9507, 172, 6158)
    elseif SelectMaterial == "Vampire Fang" then
        MMon = "Vampire"
        MPos = CFrame.new(-6033, 7, -1317)
    elseif SelectMaterial == "Conjured Cocoa" then
        MMon = "Chocolate Bar Battler"
        MPos = CFrame.new(620.634, 78.936, -12581.369)
    elseif SelectMaterial == "Dragon Scale" then
        MMon = "Dragon Crew Archer"
        MPos = CFrame.new(6827.914, 609.412, 252.353)
    elseif SelectMaterial == "Gunpowder" then
        MMon = "Pistol Billionaire"
        MPos = CFrame.new(-469, 74, 5904)
    elseif SelectMaterial == "Mini Tusk" then
        MMon = "Mythological Pirate"
        MPos = CFrame.new(-13508.616, 582.462, -6985.303)
    end
end

-- ============================================================================
-- TELEPORT LOCATIONS
-- ============================================================================

local TeleportLocations = {}

if Sea1 then
    TeleportLocations = {
        ["Starter Island"] = CFrame.new(1060.938, 16.455, 1547.784),
        ["Jungle"] = CFrame.new(-1601.655, 36.852, 153.388),
        ["Buggy's Island"] = CFrame.new(-1140.176, 4.752, 3827.405),
        ["Desert"] = CFrame.new(896.517, 6.438, 4390.149),
        ["Snow Island"] = CFrame.new(1386.807, 87.272, -1298.357),
        ["Marine Base"] = CFrame.new(-5035.496, 28.677, 4324.184),
        ["Sky Island"] = CFrame.new(-4842.137, 717.695, -2623.048),
        ["Prison"] = CFrame.new(5310.605, 0.350, 474.946),
        ["Colosseum"] = CFrame.new(-1577.789, 7.415, -2984.483),
        ["Magma Village"] = CFrame.new(-5316.115, 12.262, 8517.003),
        ["Underwater City"] = CFrame.new(61122.652, 18.497, 1569.399),
        ["Upper Sky Island 1"] = CFrame.new(-4721.860, 845.302, -1953.848),
        ["Upper Sky Island 2"] = CFrame.new(-7863.159, 5545.519, -378.422),
        ["Fountain City"] = CFrame.new(5258.278, 38.526, 4050.044),
        ["Mob Island"] = CFrame.new(-2844.730, 7.418, 5356.672),
        ["Pirate Village"] = CFrame.new(-1116.315, 4.750, 3936.877),
    }
elseif Sea2 then
    TeleportLocations = {
        ["Area 1 (Kingdom)"] = CFrame.new(-427.725, 72.996, 1835.942),
        ["Area 2 (Factory)"] = CFrame.new(635.611, 73.096, 917.812),
        ["Marine Base"] = CFrame.new(-2440.993, 73.041, -3217.708),
        ["Zombie Island"] = CFrame.new(-5494.341, 48.505, -794.590),
        ["Snow Mountain"] = CFrame.new(607.059, 401.447, -5370.554),
        ["Ice/Fire Island"] = CFrame.new(-6061.841, 15.926, -4902.038),
        ["Cursed Ship"] = CFrame.new(1040.292, 125.082, 32911.039),
        ["Frost Island"] = CFrame.new(5668.137, 28.202, -6484.600),
        ["Forgotten Island"] = CFrame.new(-3054.582, 236.872, -10147.790),
        ["Don Swan Mansion"] = CFrame.new(2286.200, 15.177, 863.838),
        ["Cafe"] = CFrame.new(-379.476, 73.001, 253.694),
        ["Usoap's Island"] = CFrame.new(4842.894, 7.452, 717.895),
        ["Colosseum"] = CFrame.new(-1932.959, 46.801, 1338.685),
    }
elseif Sea3 then
    TeleportLocations = {
        ["Pirate Port"] = CFrame.new(-450.104, 107.681, 5950.726),
        ["Hydra Island"] = CFrame.new(6735.110, 126.990, -711.097),
        ["Great Tree"] = CFrame.new(2179.988, 28.731, -6740.055),
        ["Mansion"] = CFrame.new(-12682.096, 390.886, -9902.124),
        ["Floating Turtle"] = CFrame.new(-13232.662, 332.403, -7626.481),
        ["Haunted Castle"] = CFrame.new(-9480.807, 142.130, 5566.373),
        ["Nut Island"] = CFrame.new(-2105.531, 37.249, -10195.508),
        ["Ice Cream Island"] = CFrame.new(-819.376, 64.925, -10967.283),
        ["Cake Island"] = CFrame.new(-2022.298, 36.927, -12030.976),
        ["Choco Island"] = CFrame.new(231.75, 23.900, -12200.292),
        ["Candy Island"] = CFrame.new(-1149.328, 13.575, -14445.614),
        ["Tiki Outpost"] = CFrame.new(-16549.890, 55.686, -179.913),
        ["Castle on the Sea"] = CFrame.new(-5415.392, 505.741, -2814.016),
        ["Sea of Treats"] = CFrame.new(-1928.317, 37.729, -12840.626),
    }
end

-- ============================================================================
-- AUTO BOSS FARM LOOP
-- ============================================================================

spawn(function()
    while task.wait(_G.Fast_Delay) do
        if _G.AutoBoss then
            pcall(function()
                if not GetCharacter() then return end
                
                CheckBossQuest()
                
                -- Check if boss has quest
                if NameQuestBoss and NameQuestBoss ~= "" then
                    local questUI = LocalPlayer.PlayerGui:FindFirstChild("Main")
                    local hasQuest = questUI and questUI:FindFirstChild("Quest") and questUI.Quest.Visible
                    local correctQuest = hasQuest and string.find(questUI.Quest.Container.QuestTitle.Title.Text, NameBoss)
                    
                    if not hasQuest or not correctQuest then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                        Tween(CFrameQBoss)
                        if (CFrameQBoss.Position - Character.HumanoidRootPart.Position).Magnitude <= 5 then
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss)
                        end
                    else
                        -- Find and kill boss
                        for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                            if boss:FindFirstChild("Humanoid") and boss:FindFirstChild("HumanoidRootPart") and boss.Humanoid.Health > 0 and boss.Name == BossMon then
                                repeat
                                    if not _G.AutoBoss then break end
                                    if not GetCharacter() then break end
                                    if not boss or not boss.Parent then break end
                                    if boss.Humanoid.Health <= 0 then break end
                                    
                                    task.wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    BringMob(boss)
                                    Tween(boss.HumanoidRootPart.CFrame * Pos)
                                until not _G.AutoBoss or not boss.Parent or boss.Humanoid.Health <= 0
                            end
                        end
                        
                        -- Boss not spawned, go to spawn location
                        local bossFound = false
                        for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                            if boss.Name == BossMon and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                                bossFound = true
                                break
                            end
                        end
                        
                        if not bossFound then
                            Tween(CFrameBoss)
                        end
                    end
                else
                    -- Boss without quest (like The Saw, Mob Leader, etc.)
                    for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                        if boss:FindFirstChild("Humanoid") and boss:FindFirstChild("HumanoidRootPart") and boss.Humanoid.Health > 0 and boss.Name == BossMon then
                            repeat
                                if not _G.AutoBoss then break end
                                if not GetCharacter() then break end
                                if not boss or not boss.Parent then break end
                                if boss.Humanoid.Health <= 0 then break end
                                
                                task.wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(boss)
                                Tween(boss.HumanoidRootPart.CFrame * Pos)
                            until not _G.AutoBoss or not boss.Parent or boss.Humanoid.Health <= 0
                        end
                    end
                    
                    -- Go to boss spawn
                    local bossFound = false
                    for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                        if boss.Name == BossMon and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                            bossFound = true
                            break
                        end
                    end
                    
                    if not bossFound then
                        Tween(CFrameBoss)
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- AUTO MATERIAL FARM LOOP
-- ============================================================================

spawn(function()
    while task.wait(_G.Fast_Delay) do
        if _G.AutoMaterial then
            pcall(function()
                if not GetCharacter() then return end
                if not SelectMaterial then return end
                
                MaterialMon()
                
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 and mob.Name == MMon then
                        repeat
                            if not _G.AutoMaterial then break end
                            if not GetCharacter() then break end
                            if not mob or not mob.Parent then break end
                            if mob.Humanoid.Health <= 0 then break end
                            
                            task.wait(_G.Fast_Delay)
                            AttackNoCoolDown()
                            AutoHaki()
                            EquipTool(SelectWeapon)
                            BringMob(mob)
                            Tween(mob.HumanoidRootPart.CFrame * Pos)
                        until not _G.AutoMaterial or not mob.Parent or mob.Humanoid.Health <= 0
                    end
                end
                
                -- Go to mob location
                local mobFound = false
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if mob.Name == MMon and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                        mobFound = true
                        break
                    end
                end
                
                if not mobFound then
                    Tween(MPos * CFrame.new(0, 20, 0))
                end
            end)
        end
    end
end)

-- ============================================================================
-- BOSS TAB UI
-- ============================================================================

local BossTab = Window:CreateTab("Boss")

local BossSection = BossTab:CreateSection("Boss Farm", true)

BossSection:AddDropdown({
    Label = "Select Boss",
    Options = tableBoss,
    Default = tableBoss[1] or "",
    Callback = function(v)
        SelectBoss = v
    end
})

BossSection:AddToggle({
    Label = "Auto Boss Farm",
    Default = false,
    Callback = function(v)
        _G.AutoBoss = v
    end
})

-- ============================================================================
-- TELEPORT TAB UI
-- ============================================================================

local TeleportTab = Window:CreateTab("Teleport")

local TeleportSection = TeleportTab:CreateSection("Area Teleport", true)

local TeleportLocationNames = {}
for name, _ in pairs(TeleportLocations) do
    table.insert(TeleportLocationNames, name)
end
table.sort(TeleportLocationNames)

local SelectedTeleport = TeleportLocationNames[1] or ""

TeleportSection:AddDropdown({
    Label = "Select Location",
    Options = TeleportLocationNames,
    Default = SelectedTeleport,
    Callback = function(v)
        SelectedTeleport = v
    end
})

TeleportSection:AddButton({
    Label = "Teleport",
    Style = "primary",
    Callback = function()
        if SelectedTeleport and TeleportLocations[SelectedTeleport] then
            if GetCharacter() then
                Tween2(TeleportLocations[SelectedTeleport])
                Window.Notify("Teleported!", "Teleported to " .. SelectedTeleport, 2, "success")
            end
        end
    end
})

TeleportSection:AddButton({
    Label = "Instant Teleport",
    Style = "secondary",
    Callback = function()
        if SelectedTeleport and TeleportLocations[SelectedTeleport] then
            if GetCharacter() then
                Character.HumanoidRootPart.CFrame = TeleportLocations[SelectedTeleport]
                Window.Notify("Teleported!", "Instant TP to " .. SelectedTeleport, 2, "success")
            end
        end
    end
})

-- Special Teleports Section
local SpecialTPSection = TeleportTab:CreateSection("Special Teleports", true)

SpecialTPSection:AddButton({
    Label = "Safe Zone",
    Style = "secondary",
    Callback = function()
        if GetCharacter() then
            if Sea1 then
                Character.HumanoidRootPart.CFrame = CFrame.new(-1116.315, 4.750, 3936.877)
            elseif Sea2 then
                Character.HumanoidRootPart.CFrame = CFrame.new(-379.476, 73.001, 253.694)
            elseif Sea3 then
                Character.HumanoidRootPart.CFrame = CFrame.new(-450.104, 107.681, 5950.726)
            end
        end
    end
})

SpecialTPSection:AddButton({
    Label = "Dealer (Sword/Fruit)",
    Style = "secondary",
    Callback = function()
        if GetCharacter() then
            if Sea1 then
                Character.HumanoidRootPart.CFrame = CFrame.new(-32.831, 5.243, -1655.143)
            elseif Sea2 then
                Character.HumanoidRootPart.CFrame = CFrame.new(-564.437, 72.997, 1431.859)
            elseif Sea3 then
                Character.HumanoidRootPart.CFrame = CFrame.new(-420.024, 26.002, -107.888)
            end
        end
    end
})

-- ============================================================================
-- MATERIAL TAB UI
-- ============================================================================

local MaterialTab = Window:CreateTab("Material")

local MaterialSection = MaterialTab:CreateSection("Material Farm", true)

MaterialSection:AddDropdown({
    Label = "Select Material",
    Options = MaterialList,
    Default = MaterialList[1],
    Callback = function(v)
        SelectMaterial = v
    end
})

MaterialSection:AddToggle({
    Label = "Auto Farm Material",
    Default = false,
    Callback = function(v)
        _G.AutoMaterial = v
    end
})

MaterialSection:AddLabel({Text = "Tip: Materials drop from specific mobs", Color = Color3.fromRGB(200, 200, 200)})

-- ============================================================================
-- RACE V4 TAB UI
-- ============================================================================

local RaceTab = Window:CreateTab("Race V4")

local RaceSection = RaceTab:CreateSection("Race Evolution", true)

_G.AutoRaceV4 = false
_G.AutoTrials = false

RaceSection:AddToggle({
    Label = "Auto Race V4 Quest",
    Default = false,
    Callback = function(v)
        _G.AutoRaceV4 = v
    end
})

RaceSection:AddToggle({
    Label = "Auto Kill Trials",
    Default = false,
    Callback = function(v)
        _G.AutoTrials = v
    end
})

RaceSection:AddButton({
    Label = "TP to Alchemist",
    Style = "secondary",
    Callback = function()
        if GetCharacter() then
            Character.HumanoidRootPart.CFrame = CFrame.new(-5389.178, 424.359, -2666.784)
        end
    end
})

RaceSection:AddButton({
    Label = "TP to Temple of Time",
    Style = "secondary",
    Callback = function()
        if GetCharacter() then
            Character.HumanoidRootPart.CFrame = CFrame.new(-5495.396, 314.714, -2961.853)
        end
    end
})

local MirageSection = RaceTab:CreateSection("Mirage Island", true)

_G.MirageIslandESP = false

MirageSection:AddToggle({
    Label = "Mirage Island ESP",
    Default = false,
    Callback = function(v) _G.MirageIslandESP = v end
})

MirageSection:AddButton({
    Label = "TP to Mirage (if spawned)",
    Style = "primary",
    Callback = function()
        if GetCharacter() then
            local mirage = Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")
            if mirage then
                Character.HumanoidRootPart.CFrame = CFrame.new(mirage.Position) + Vector3.new(0, 50, 0)
                Window.Notify("Success!", "Teleported to Mirage Island", 2, "success")
            else
                Window.Notify("Error", "Mirage Island not spawned", 2, "error")
            end
        end
    end
})

-- ============================================================================
-- RAID TAB UI
-- ============================================================================

local RaidTab = Window:CreateTab("Raid")

local RaidSection = RaidTab:CreateSection("Raid Options", true)

_G.AutoRaid = false

local RaidFruits = {"Flame", "Ice", "Quake", "Buddha", "Sand", "Dark", "Light", "Magma", "String", "Phoenix", "Rumble", "Gravity", "Dough", "Shadow", "Venom", "Control", "Spirit", "Dragon", "Leopard"}

local SelectedRaid = "Flame"

RaidSection:AddDropdown({
    Label = "Raid Type",
    Options = RaidFruits,
    Default = "Flame",
    Callback = function(v)
        SelectedRaid = v
    end
})

RaidSection:AddToggle({
    Label = "Auto Raid",
    Default = false,
    Callback = function(v)
        _G.AutoRaid = v
    end
})

RaidSection:AddButton({
    Label = "TP to Raid NPC",
    Style = "secondary",
    Callback = function()
        if GetCharacter() then
            if Sea1 then
                Character.HumanoidRootPart.CFrame = CFrame.new(-5029.802, 28.350, 4324.932)
            elseif Sea2 then
                Character.HumanoidRootPart.CFrame = CFrame.new(-6511.541, 6.286, -5141.168)
            elseif Sea3 then
                Character.HumanoidRootPart.CFrame = CFrame.new(-5350.496, 424.441, -2663.025)
            end
        end
    end
})

-- ============================================================================
-- MIRAGE ISLAND ESP LOOP
-- ============================================================================

spawn(function()
    while wait() do
        pcall(function()
            if _G.MirageIslandESP then
                for _, loc in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
                    if loc.Name == "Mirage Island" then
                        if not loc:FindFirstChild("MirageEsp") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "MirageEsp"
                            billboard.ExtentsOffset = Vector3.new(0, 1, 0)
                            billboard.Size = UDim2.new(1, 200, 1, 30)
                            billboard.Adornee = loc
                            billboard.AlwaysOnTop = true
                            billboard.Parent = loc
                            
                            local label = Instance.new("TextLabel")
                            label.Font = Enum.Font.GothamBold
                            label.TextSize = 14
                            label.TextWrapped = true
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.TextYAlignment = Enum.TextYAlignment.Top
                            label.BackgroundTransparency = 1
                            label.TextStrokeTransparency = 0.5
                            label.TextColor3 = Color3.fromRGB(80, 245, 245)
                            label.Parent = billboard
                        else
                            loc.MirageEsp.TextLabel.Text = "Mirage Island\n" .. round((LocalPlayer.Character.Head.Position - loc.Position).Magnitude / 3) .. "m"
                        end
                    end
                end
            else
                for _, loc in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
                    if loc:FindFirstChild("MirageEsp") then
                        loc.MirageEsp:Destroy()
                    end
                end
            end
        end)
    end
end)

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

-- ============================================================================
-- ITEMS TAB UI (Saber, Pole V1, Saw, Warden, Hallow Scythe, Yama, Tushita, etc.)
-- ============================================================================

local ItemsTab = Window:CreateTab("Items")

local ItemsSection = ItemsTab:CreateSection("Quest Items", true)

_G.Auto_Saber = false
_G.Auto_PoleV1 = false
_G.Auto_Saw = false
_G.Auto_Warden = false
_G.AutoHallowScythe = false
_G.AutoYama = false
_G.AutoTushita = false
_G.Auto_Holy_Torch = false
_G.Auto_Canvander = false

-- Saber Quest
ItemsSection:AddToggle({
    Label = "Auto Saber Quest",
    Default = false,
    Callback = function(v) _G.Auto_Saber = v end
})

-- Pole V1 (Thunder God)
ItemsSection:AddToggle({
    Label = "Auto Pole V1 (Thunder God)",
    Default = false,
    Callback = function(v) _G.Auto_PoleV1 = v end
})

-- Saw (The Saw boss)
ItemsSection:AddToggle({
    Label = "Auto Saw",
    Default = false,
    Callback = function(v) _G.Auto_Saw = v end
})

-- Warden Sword (Chief Warden)
ItemsSection:AddToggle({
    Label = "Auto Warden Sword",
    Default = false,
    Callback = function(v) _G.Auto_Warden = v end
})

if Sea3 then
    -- Hallow Scythe (Soul Reaper)
    ItemsSection:AddToggle({
        Label = "Auto Hallow Scythe",
        Default = false,
        Callback = function(v) _G.AutoHallowScythe = v end
    })
    
    -- Yama (Elite Hunter 30 kills)
    ItemsSection:AddToggle({
        Label = "Auto Yama",
        Default = false,
        Callback = function(v) _G.AutoYama = v end
    })
    
    -- Tushita (Longma boss)
    ItemsSection:AddToggle({
        Label = "Auto Tushita (Longma)",
        Default = false,
        Callback = function(v) _G.AutoTushita = v end
    })
    
    -- Holy Torch
    ItemsSection:AddToggle({
        Label = "Auto Holy Torch",
        Default = false,
        Callback = function(v) _G.Auto_Holy_Torch = v end
    })
    
    -- Canvander (Beautiful Pirate)
    ItemsSection:AddToggle({
        Label = "Auto Canvander",
        Default = false,
        Callback = function(v) _G.Auto_Canvander = v end
    })
end

-- ============================================================================
-- SABER QUEST LOOP
-- ============================================================================

spawn(function()
    while task.wait() do
        if _G.Auto_Saber then
            pcall(function()
                if not GetCharacter() then return end
                if LocalPlayer.Data.Level.Value < 200 then return end
                
                -- Check if door is still closed
                local doorClosed = Workspace.Map.Jungle.Final.Part.Transparency == 0
                local puzzleDoorClosed = Workspace.Map.Jungle.QuestPlates.Door.Transparency == 0
                
                if doorClosed then
                    if puzzleDoorClosed then
                        -- Do puzzle
                        local puzzlePos = CFrame.new(-1612.558, 36.977, 148.719)
                        if (puzzlePos.Position - Character.HumanoidRootPart.Position).Magnitude <= 100 then
                            Tween(Character.HumanoidRootPart.CFrame)
                            wait(1)
                            Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame
                            wait(1)
                            Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame
                            wait(1)
                            Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame
                            wait(1)
                            Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame
                            wait(1)
                            Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame
                            wait(1)
                        else
                            Tween(puzzlePos)
                        end
                    elseif Workspace.Map.Desert.Burn.Part.Transparency == 0 then
                        -- Need to burn the cup
                        if LocalPlayer.Backpack:FindFirstChild("Torch") or Character:FindFirstChild("Torch") then
                            EquipTool("Torch")
                            Tween(CFrame.new(1114.614, 5.046, 4350.228))
                        else
                            Tween(CFrame.new(-1610.007, 11.504, 164.001))
                        end
                    elseif ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0 then
                        -- Sick man quest
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                        wait(0.5)
                        EquipTool("Cup")
                        wait(0.5)
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", Character.Cup)
                        wait()
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                    elseif ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                    elseif ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
                        -- Kill Mob Leader
                        if Workspace.Enemies:FindFirstChild("Mob Leader") then
                            for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                                if mob.Name == "Mob Leader" and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                                    repeat
                                        if not _G.Auto_Saber then break end
                                        task.wait(_G.Fast_Delay)
                                        AutoHaki()
                                        EquipTool(SelectWeapon)
                                        BringMob(mob)
                                        Tween(mob.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCoolDown()
                                    until not _G.Auto_Saber or mob.Humanoid.Health <= 0
                                end
                            end
                        else
                            Tween(CFrame.new(-2967.595, -4.910, 5328.707))
                        end
                    elseif ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                        wait(0.5)
                        EquipTool("Relic")
                        wait(0.5)
                        Tween(CFrame.new(-1404.915, 29.977, 3.805))
                    end
                else
                    -- Kill Saber Expert
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 and mob.Name == "Saber Expert" then
                            repeat
                                if not _G.Auto_Saber then break end
                                task.wait(_G.Fast_Delay)
                                EquipTool(SelectWeapon)
                                BringMob(mob)
                                Tween(mob.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Saber or mob.Humanoid.Health <= 0
                            
                            if mob.Humanoid.Health <= 0 then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- POLE V1 (THUNDER GOD) LOOP
-- ============================================================================

spawn(function()
    while wait() do
        if _G.Auto_PoleV1 then
            pcall(function()
                if not GetCharacter() then return end
                
                local thunderGodPos = CFrame.new(-7748.018, 5606.806, -2305.898)
                
                if Workspace.Enemies:FindFirstChild("Thunder God") then
                    for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                        if boss.Name == "Thunder God" and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                            repeat
                                if not _G.Auto_PoleV1 then break end
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(boss)
                                Tween(boss.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_PoleV1 or boss.Humanoid.Health <= 0 or not boss.Parent
                        end
                    end
                else
                    Tween(thunderGodPos)
                end
                
                if ReplicatedStorage:FindFirstChild("Thunder God") then
                    Tween(ReplicatedStorage:FindFirstChild("Thunder God").HumanoidRootPart.CFrame * Pos)
                end
            end)
        end
    end
end)

-- ============================================================================
-- SAW (THE SAW) LOOP
-- ============================================================================

spawn(function()
    while wait() do
        if _G.Auto_Saw then
            pcall(function()
                if not GetCharacter() then return end
                
                local sawPos = CFrame.new(-690.330, 15.094, 1582.238)
                
                if Workspace.Enemies:FindFirstChild("The Saw") then
                    for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                        if boss.Name == "The Saw" and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                            repeat
                                if not _G.Auto_Saw then break end
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(boss)
                                Tween(boss.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Saw or boss.Humanoid.Health <= 0 or not boss.Parent
                        end
                    end
                else
                    Tween(sawPos)
                end
            end)
        end
    end
end)

-- ============================================================================
-- WARDEN SWORD (CHIEF WARDEN) LOOP
-- ============================================================================

spawn(function()
    while wait() do
        if _G.Auto_Warden then
            pcall(function()
                if not GetCharacter() then return end
                
                local wardenPos = CFrame.new(5186.146, 24.866, 832.188)
                
                if Workspace.Enemies:FindFirstChild("Chief Warden") then
                    for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                        if boss.Name == "Chief Warden" and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                            repeat
                                if not _G.Auto_Warden then break end
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(boss)
                                Tween(boss.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Warden or boss.Humanoid.Health <= 0 or not boss.Parent
                        end
                    end
                else
                    Tween(wardenPos)
                end
            end)
        end
    end
end)

-- ============================================================================
-- HALLOW SCYTHE (SOUL REAPER + BONE PURCHASE) LOOP
-- ============================================================================

spawn(function()
    while wait() do
        if _G.AutoHallowScythe then
            pcall(function()
                if not GetCharacter() then return end
                if not Sea3 then return end
                
                if Workspace.Enemies:FindFirstChild("Soul Reaper") then
                    for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                        if string.find(boss.Name, "Soul Reaper") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                            repeat
                                if not _G.AutoHallowScythe then break end
                                wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(boss)
                                Tween(boss.HumanoidRootPart.CFrame * Pos)
                            until not _G.AutoHallowScythe or boss.Humanoid.Health <= 0
                        end
                    end
                elseif LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or Character:FindFirstChild("Hallow Essence") then
                    -- Have essence, go to NPC
                    repeat
                        Tween(CFrame.new(-8932.322, 146.831, 6062.550))
                        wait()
                    until (CFrame.new(-8932.322, 146.831, 6062.550).Position - Character.HumanoidRootPart.Position).Magnitude <= 8
                    wait()
                    EquipTool("Hallow Essence")
                elseif ReplicatedStorage:FindFirstChild("Soul Reaper") then
                    Tween(ReplicatedStorage:FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * Pos)
                end
            end)
        end
    end
end)

-- Auto buy bones for Hallow Scythe
spawn(function()
    while wait() do
        if _G.AutoHallowScythe then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
        end
    end
end)

-- ============================================================================
-- YAMA (ELITE HUNTER 30 KILLS) LOOP
-- ============================================================================

spawn(function()
    while wait() do
        if _G.AutoYama then
            pcall(function()
                if not Sea3 then return end
                
                local progress = ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
                if progress >= 30 then
                    wait()
                    pcall(function()
                        fireclickdetector(Workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
                    end)
                    if LocalPlayer.Backpack:FindFirstChild("Yama") then
                        _G.AutoYama = false
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- TUSHITA (LONGMA BOSS) LOOP
-- ============================================================================

spawn(function()
    while wait() do
        if _G.AutoTushita then
            pcall(function()
                if not GetCharacter() then return end
                if not Sea3 then return end
                
                local longmaPos = CFrame.new(-10238.875, 389.791, -9549.793)
                
                if Workspace.Enemies:FindFirstChild("Longma") then
                    for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                        if boss.Name == "Longma" and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                            repeat
                                if not _G.AutoTushita then break end
                                wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(boss)
                                Tween(boss.HumanoidRootPart.CFrame * Pos)
                            until not _G.AutoTushita or boss.Humanoid.Health <= 0 or not boss.Parent
                        end
                    end
                else
                    Tween(longmaPos)
                end
            end)
        end
    end
end)

-- ============================================================================
-- HOLY TORCH LOOP
-- ============================================================================

spawn(function()
    while wait() do
        if _G.Auto_Holy_Torch then
            pcall(function()
                if not GetCharacter() then return end
                if not Sea3 then return end
                
                local torchLocations = {
                    CFrame.new(-10752, 417, -9366),
                    CFrame.new(-11672, 334, -9474),
                    CFrame.new(-12132, 521, -10655),
                    CFrame.new(-13336, 486, -6985),
                    CFrame.new(-13489, 332, -7925)
                }
                
                for _, pos in ipairs(torchLocations) do
                    if not _G.Auto_Holy_Torch then break end
                    repeat
                        if not _G.Auto_Holy_Torch then break end
                        Tween(pos)
                        wait()
                    until (Character.HumanoidRootPart.Position - pos.Position).Magnitude <= 10
                    wait(0.5)
                end
            end)
        end
    end
end)

-- ============================================================================
-- CANVANDER (BEAUTIFUL PIRATE) LOOP
-- ============================================================================

spawn(function()
    while wait() do
        if _G.Auto_Canvander then
            pcall(function()
                if not GetCharacter() then return end
                
                local piratePos = CFrame.new(5311.074, 426.024, 165.127)
                
                if Workspace.Enemies:FindFirstChild("Beautiful Pirate") then
                    for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                        if boss.Name == "Beautiful Pirate" and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                            repeat
                                if not _G.Auto_Canvander then break end
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(boss)
                                Tween(boss.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Canvander or boss.Humanoid.Health <= 0 or not boss.Parent
                        end
                    end
                else
                    Tween(piratePos)
                end
            end)
        end
    end
end)

-- ============================================================================
-- STATS TAB UI
-- ============================================================================

local StatsTab = Window:CreateTab("Stats")

local StatsSection = StatsTab:CreateSection("Auto Stats", true)

_G.AutoMelee = false
_G.AutoDefense = false
_G.AutoSword = false
_G.AutoGun = false
_G.AutoFruit = false

StatsSection:AddToggle({
    Label = "Auto Melee",
    Default = false,
    Callback = function(v) _G.AutoMelee = v end
})

StatsSection:AddToggle({
    Label = "Auto Defense",
    Default = false,
    Callback = function(v) _G.AutoDefense = v end
})

StatsSection:AddToggle({
    Label = "Auto Sword",
    Default = false,
    Callback = function(v) _G.AutoSword = v end
})

StatsSection:AddToggle({
    Label = "Auto Gun",
    Default = false,
    Callback = function(v) _G.AutoGun = v end
})

StatsSection:AddToggle({
    Label = "Auto Demon Fruit",
    Default = false,
    Callback = function(v) _G.AutoFruit = v end
})

-- Stats distribution loops
spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.AutoMelee then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Melee", 3)
            end
        end)
    end
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.AutoDefense then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Defense", 3)
            end
        end)
    end
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.AutoSword then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Sword", 3)
            end
        end)
    end
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.AutoGun then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Gun", 3)
            end
        end)
    end
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.AutoFruit then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", 3)
            end
        end)
    end
end)

-- ============================================================================
-- PLAYER TAB UI
-- ============================================================================

local PlayerTab = Window:CreateTab("Player")

local PlayerSection = PlayerTab:CreateSection("Player Options", true)

_G.WalkSpeed = 16
_G.JumpPower = 50
_G.NoClip = false
_G.InfiniteJump = false

PlayerSection:AddSlider({
    Label = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(v)
        _G.WalkSpeed = v
        if GetCharacter() and Character:FindFirstChild("Humanoid") then
            Character.Humanoid.WalkSpeed = v
        end
    end
})

PlayerSection:AddSlider({
    Label = "Jump Power",
    Min = 50,
    Max = 200,
    Default = 50,
    Callback = function(v)
        _G.JumpPower = v
        if GetCharacter() and Character:FindFirstChild("Humanoid") then
            Character.Humanoid.JumpPower = v
        end
    end
})

PlayerSection:AddToggle({
    Label = "No-Clip",
    Default = false,
    Callback = function(v)
        _G.NoClip = v
    end
})

PlayerSection:AddToggle({
    Label = "Infinite Jump",
    Default = false,
    Callback = function(v)
        _G.InfiniteJump = v
    end
})

-- No-Clip Loop
spawn(function()
    RunService.Stepped:Connect(function()
        if _G.NoClip and GetCharacter() then
            for _, part in pairs(Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

-- Infinite Jump
spawn(function()
    UserInputService.JumpRequest:Connect(function()
        if _G.InfiniteJump and GetCharacter() and Character:FindFirstChild("Humanoid") then
            Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)

-- Player Teleport Section
local TPPlayerSection = PlayerTab:CreateSection("Teleport to Player", true)

local PlayerNames = {}
for _, p in pairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then
        table.insert(PlayerNames, p.Name)
    end
end

local SelectedPlayer = PlayerNames[1] or ""

if #PlayerNames > 0 then
    TPPlayerSection:AddDropdown({
        Label = "Select Player",
        Options = PlayerNames,
        Default = SelectedPlayer,
        Callback = function(v)
            SelectedPlayer = v
        end
    })
    
    TPPlayerSection:AddButton({
        Label = "Teleport to Player",
        Style = "primary",
        Callback = function()
            pcall(function()
                local target = Players:FindFirstChild(SelectedPlayer)
                if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    if GetCharacter() then
                        Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
                        Window.Notify("Teleported!", "Teleported to " .. SelectedPlayer, 2, "success")
                    end
                end
            end)
        end
    })
end

-- ============================================================================
-- SERVER TAB UI
-- ============================================================================

local ServerTab = Window:CreateTab("Server")

local ServerInfoSection = ServerTab:CreateSection("Server Info", true)

ServerInfoSection:AddLabel({Text = "Sea: " .. CurrentSea, Bold = true})
ServerInfoSection:AddLabel({Text = "Place ID: " .. game.PlaceId})
ServerInfoSection:AddLabel({Text = "Job ID: " .. game.JobId})

local ServerActionsSection = ServerTab:CreateSection("Server Actions", true)

ServerActionsSection:AddButton({
    Label = "Rejoin Server",
    Style = "secondary",
    Callback = function()
        pcall(function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
        end)
    end
})

ServerActionsSection:AddButton({
    Label = "Server Hop",
    Style = "primary",
    Callback = function()
        pcall(function()
            local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
            for _, server in pairs(servers.data) do
                if server.id ~= game.JobId and server.playing < server.maxPlayers then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                    break
                end
            end
        end)
    end
})

-- ============================================================================
-- SHOP TAB UI
-- ============================================================================

local ShopTab = Window:CreateTab("Shop")

local AbilitySection = ShopTab:CreateSection("Buy Abilities", true)

AbilitySection:AddButton({
    Label = "Buy Geppo (Sky Jump)",
    Style = "secondary",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
        Window.Notify("Shop", "Attempted to buy Geppo", 2, "info")
    end
})

AbilitySection:AddButton({
    Label = "Buy Buso (Armament Haki)",
    Style = "secondary",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
        Window.Notify("Shop", "Attempted to buy Buso Haki", 2, "info")
    end
})

AbilitySection:AddButton({
    Label = "Buy Soru (Flash Step)",
    Style = "secondary",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
        Window.Notify("Shop", "Attempted to buy Soru", 2, "info")
    end
})

AbilitySection:AddButton({
    Label = "Buy Ken Haki (Observation)",
    Style = "secondary",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyHaki", "Ken")
        Window.Notify("Shop", "Attempted to buy Ken Haki", 2, "info")
    end
})

-- ============================================================================
-- SEA EVENTS TAB UI
-- ============================================================================

local SeaTab = Window:CreateTab("Sea Events")

local SeaEventsSection = SeaTab:CreateSection("Events", true)

_G.AutoEliteHunter = false
_G.AutoTpAdvanced = false

SeaEventsSection:AddToggle({
    Label = "Auto Elite Hunter",
    Default = false,
    Callback = function(v)
        _G.AutoEliteHunter = v
    end
})

SeaEventsSection:AddToggle({
    Label = "TP to Advanced Dealer",
    Default = false,
    Callback = function(v)
        _G.AutoTpAdvanced = v
    end
})

-- Elite Hunter Loop
spawn(function()
    while wait() do
        if _G.AutoEliteHunter then
            pcall(function()
                if not GetCharacter() then return end
                
                local progress = ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter")
                if progress and progress ~= 0 then
                    -- Find and kill elite hunters
                    local eliteNames = {"Diablo", "Deandre", "Urban"}
                    for _, name in ipairs(eliteNames) do
                        if Workspace.Enemies:FindFirstChild(name) then
                            for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                                if mob.Name == name and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                                    repeat
                                        if not _G.AutoEliteHunter then break end
                                        task.wait(_G.Fast_Delay)
                                        AutoHaki()
                                        EquipTool(SelectWeapon)
                                        BringMob(mob)
                                        Tween(mob.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCoolDown()
                                    until not _G.AutoEliteHunter or mob.Humanoid.Health <= 0 or not mob.Parent
                                end
                            end
                        elseif ReplicatedStorage:FindFirstChild(name) then
                            Tween2(ReplicatedStorage:FindFirstChild(name).HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                else
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter")
                end
            end)
        end
    end
end)

-- Advanced Dealer Teleport Loop
spawn(function()
    while wait() do
        if _G.AutoTpAdvanced then
            pcall(function()
                local dealer = ReplicatedStorage.NPCs:FindFirstChild("Advanced Fruit Dealer")
                if dealer and dealer:IsA("Model") then
                    local pos = dealer.PrimaryPart and dealer.PrimaryPart.Position
                    if pos then
                        Tween2(CFrame.new(pos))
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- FRUIT MASTERY LOOP WITH SKILL USAGE
-- ============================================================================

local PositionSkillMasteryDevilFruit = Vector3.new(0, 0, 0)

spawn(function()
    while task.wait() do
        if _G.UseSkill then
            pcall(function()
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if mob.Name == MonFarm and mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") then
                        if mob.Humanoid.Health <= mob.Humanoid.MaxHealth * _G.KillPercent / 100 then
                            repeat
                                if not _G.UseSkill then break end
                                RunService.Heartbeat:Wait()
                                
                                local fruitName = LocalPlayer.Data.DevilFruit.Value
                                EquipTool(fruitName)
                                Tween(mob.HumanoidRootPart.CFrame * Pos)
                                PositionSkillMasteryDevilFruit = mob.HumanoidRootPart.Position
                                
                                local tool = Character:FindFirstChild(fruitName)
                                if tool then
                                    tool.MousePos.Value = PositionSkillMasteryDevilFruit
                                    local skillLevel = tool.Level.Value
                                    
                                    if _G.SkillZ and skillLevel >= 1 then
                                        VirtualInputManager:SendKeyEvent(true, "Z", false, game)
                                        wait()
                                        VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                                    end
                                    
                                    if _G.SkillX and skillLevel >= 1 then
                                        VirtualInputManager:SendKeyEvent(true, "X", false, game)
                                        wait()
                                        VirtualInputManager:SendKeyEvent(false, "X", false, game)
                                    end
                                    
                                    if _G.SkillC and skillLevel >= 1 then
                                        VirtualInputManager:SendKeyEvent(true, "C", false, game)
                                        wait()
                                        VirtualInputManager:SendKeyEvent(false, "C", false, game)
                                    end
                                    
                                    if _G.SkillV and skillLevel >= 1 then
                                        VirtualInputManager:SendKeyEvent(true, "V", false, game)
                                        wait()
                                        VirtualInputManager:SendKeyEvent(false, "V", false, game)
                                    end
                                    
                                    if _G.SkillF and skillLevel >= 1 then
                                        VirtualInputManager:SendKeyEvent(true, "F", false, game)
                                        wait()
                                        VirtualInputManager:SendKeyEvent(false, "F", false, game)
                                    end
                                end
                            until not _G.UseSkill or mob.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

-- Fruit Mastery with Level farming
spawn(function()
    while wait() do
        if _G.AutoMasteryFruit and TypeMastery == "Level" then
            pcall(function()
                if not GetCharacter() then return end
                
                CheckLevel()
                
                local questUI = LocalPlayer.PlayerGui:FindFirstChild("Main")
                local hasQuest = questUI and questUI:FindFirstChild("Quest") and questUI.Quest.Visible
                local correctQuest = hasQuest and string.find(questUI.Quest.Container.QuestTitle.Title.Text, NameMon)
                
                if not hasQuest or not correctQuest then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                    Tween(CFrameQ)
                    if (CFrameQ.Position - Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                    end
                end
                
                if Workspace.Enemies:FindFirstChild(Ms) then
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Name == Ms then
                            repeat
                                if not _G.AutoMasteryFruit then break end
                                if TypeMastery ~= "Level" then break end
                                wait(_G.Fast_Delay)
                                
                                if mob.Humanoid.Health <= mob.Humanoid.MaxHealth * _G.KillPercent / 100 then
                                    _G.UseSkill = true
                                else
                                    _G.UseSkill = false
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    BringMob(mob)
                                    Tween(mob.HumanoidRootPart.CFrame * Pos)
                                    FarmPos = mob.HumanoidRootPart.CFrame
                                    MonFarm = mob.Name
                                    AttackNoCoolDown()
                                end
                            until not _G.AutoMasteryFruit or TypeMastery ~= "Level" or mob.Humanoid.Health <= 0 or not mob.Parent
                            _G.UseSkill = false
                        end
                    end
                end
            end)
        end
    end
end)

-- Fruit Mastery with Bone farming (Haunted Castle)
spawn(function()
    while wait() do
        if _G.AutoMasteryFruit and TypeMastery == "Bone" then
            pcall(function()
                if not GetCharacter() then return end
                if not Sea3 then return end
                
                Tween(CFrame.new(-9508.567, 142.139, 5737.360))
                
                local boneMobs = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
                
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") then
                        for _, boneName in ipairs(boneMobs) do
                            if mob.Name == boneName then
                                repeat
                                    if not _G.AutoMasteryFruit then break end
                                    if TypeMastery ~= "Bone" then break end
                                    wait(_G.Fast_Delay)
                                    
                                    if mob.Humanoid.Health <= mob.Humanoid.MaxHealth * _G.KillPercent / 100 then
                                        _G.UseSkill = true
                                    else
                                        _G.UseSkill = false
                                        AutoHaki()
                                        EquipTool(SelectWeapon)
                                        BringMob(mob)
                                        Tween(mob.HumanoidRootPart.CFrame * Pos)
                                        FarmPos = mob.HumanoidRootPart.CFrame
                                        MonFarm = mob.Name
                                        AttackNoCoolDown()
                                    end
                                until not _G.AutoMasteryFruit or TypeMastery ~= "Bone" or mob.Humanoid.Health <= 0 or not mob.Parent
                                _G.UseSkill = false
                                break
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Fruit Mastery with Cake farming
spawn(function()
    while wait() do
        if _G.AutoMasteryFruit and TypeMastery == "Cake" then
            pcall(function()
                if not GetCharacter() then return end
                if not Sea3 then return end
                
                Tween(CFrame.new(-9508.567, 142.139, 5737.360))
                
                local cakeMobs = {"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
                
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") then
                        for _, cakeName in ipairs(cakeMobs) do
                            if mob.Name == cakeName then
                                repeat
                                    if not _G.AutoMasteryFruit then break end
                                    if TypeMastery ~= "Cake" then break end
                                    wait(_G.Fast_Delay)
                                    
                                    if mob.Humanoid.Health <= mob.Humanoid.MaxHealth * _G.KillPercent / 100 then
                                        _G.UseSkill = true
                                    else
                                        _G.UseSkill = false
                                        AutoHaki()
                                        EquipTool(SelectWeapon)
                                        BringMob(mob)
                                        Tween(mob.HumanoidRootPart.CFrame * Pos)
                                        FarmPos = mob.HumanoidRootPart.CFrame
                                        MonFarm = mob.Name
                                        AttackNoCoolDown()
                                    end
                                until not _G.AutoMasteryFruit or TypeMastery ~= "Cake" or mob.Humanoid.Health <= 0 or not mob.Parent
                                _G.UseSkill = false
                                break
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Fruit Mastery with Ectoplasm farming (Ship)
spawn(function()
    while wait() do
        if _G.AutoMasteryFruit and TypeMastery == "Ectoplasm" then
            pcall(function()
                if not GetCharacter() then return end
                if not Sea2 then return end
                
                local shipPos = CFrame.new(904.407, 181.057, 33341.386)
                
                if (shipPos.Position - Character.HumanoidRootPart.Position).Magnitude > 20000 then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.212, 126.976, 32852.832))
                end
                
                Tween(shipPos)
                
                local shipMobs = {"Ship Steward", "Ship Engineer", "Ship Deckhand", "Ship Officer"}
                
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") then
                        for _, shipName in ipairs(shipMobs) do
                            if mob.Name == shipName then
                                repeat
                                    if not _G.AutoMasteryFruit then break end
                                    if TypeMastery ~= "Ectoplasm" then break end
                                    wait(_G.Fast_Delay)
                                    
                                    if mob.Humanoid.Health <= mob.Humanoid.MaxHealth * _G.KillPercent / 100 then
                                        _G.UseSkill = true
                                    else
                                        _G.UseSkill = false
                                        AutoHaki()
                                        EquipTool(SelectWeapon)
                                        BringMob(mob)
                                        Tween(mob.HumanoidRootPart.CFrame * Pos)
                                        FarmPos = mob.HumanoidRootPart.CFrame
                                        MonFarm = mob.Name
                                        AttackNoCoolDown()
                                    end
                                until not _G.AutoMasteryFruit or TypeMastery ~= "Ectoplasm" or mob.Humanoid.Health <= 0 or not mob.Parent
                                _G.UseSkill = false
                                break
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- AUTO RAID LOOP
-- ============================================================================

spawn(function()
    while wait() do
        if _G.AutoRaid then
            pcall(function()
                if not GetCharacter() then return end
                
                -- Check if in raid
                local inRaid = Workspace:FindFirstChild("_WorldOrigin") and Workspace._WorldOrigin:FindFirstChild("Raid")
                
                if inRaid then
                    -- Farm raid mobs
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                            repeat
                                if not _G.AutoRaid then break end
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(mob)
                                Tween(mob.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.AutoRaid or mob.Humanoid.Health <= 0 or not mob.Parent
                        end
                    end
                    
                    -- Check for next island portal
                    if Workspace:FindFirstChild("_WorldOrigin") and Workspace._WorldOrigin:FindFirstChild("Raid") then
                        local portal = Workspace._WorldOrigin.Raid:FindFirstChild("Portal")
                        if portal then
                            Tween(portal.CFrame)
                        end
                    end
                else
                    -- Go to raid NPC
                    if Sea1 then
                        Tween(CFrame.new(-5029.802, 28.350, 4324.932))
                    elseif Sea2 then
                        Tween(CFrame.new(-6511.541, 6.286, -5141.168))
                    elseif Sea3 then
                        Tween(CFrame.new(-5350.496, 424.441, -2663.025))
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- RACE V4 AUTOMATION LOOPS
-- ============================================================================

spawn(function()
    while wait() do
        if _G.AutoRaceV4 then
            pcall(function()
                if not GetCharacter() then return end
                if not Sea3 then return end
                
                -- Get player race
                local race = LocalPlayer.Data.Race.Value
                local racePositions = {
                    ["Human"] = CFrame.new(-5495.396, 314.714, -2961.853),
                    ["Shark"] = CFrame.new(-5495.396, 314.714, -2961.853),
                    ["Angel"] = CFrame.new(-5495.396, 314.714, -2961.853),
                    ["Rabbit"] = CFrame.new(-5495.396, 314.714, -2961.853),
                    ["Ghoul"] = CFrame.new(-5495.396, 314.714, -2961.853),
                    ["Cyborg"] = CFrame.new(-5495.396, 314.714, -2961.853)
                }
                
                local targetPos = racePositions[race] or CFrame.new(-5495.396, 314.714, -2961.853)
                Tween(targetPos)
            end)
        end
    end
end)

-- Kill Trial Players
spawn(function()
    while wait() do
        if _G.AutoTrials then
            pcall(function()
                if not GetCharacter() then return end
                if not Sea3 then return end
                
                -- Find trial players
                for _, npc in pairs(Workspace.Enemies:GetChildren()) do
                    if npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") and npc.Humanoid.Health > 0 then
                        if string.find(npc.Name, "Trial") or string.find(npc.Name, "trial") then
                            repeat
                                if not _G.AutoTrials then break end
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(npc)
                                Tween(npc.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.AutoTrials or npc.Humanoid.Health <= 0 or not npc.Parent
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- MISC TAB UI
-- ============================================================================

local MiscTab = Window:CreateTab("Misc")

local MiscSection = MiscTab:CreateSection("Misc Features", true)

_G.AutoMusketeerHat = false
_G.AutoObsV2 = false
_G.AutoRainbowHaki = false

MiscSection:AddToggle({
    Label = "Auto Musketeer Hat",
    Default = false,
    Callback = function(v) _G.AutoMusketeerHat = v end
})

MiscSection:AddToggle({
    Label = "Auto Observation V2",
    Default = false,
    Callback = function(v) _G.AutoObsV2 = v end
})

MiscSection:AddToggle({
    Label = "Auto Rainbow Haki",
    Default = false,
    Callback = function(v) _G.AutoRainbowHaki = v end
})

-- Musketeer Hat Loop
spawn(function()
    while wait(0.1) do
        if _G.AutoMusketeerHat then
            pcall(function()
                if not GetCharacter() then return end
                if not Sea3 then return end
                if LocalPlayer.Data.Level.Value < 1800 then return end
                
                local progress = ReplicatedStorage.Remotes.CommF_:InvokeServer("CitizenQuestProgress")
                if progress and progress.KilledBandits == false then
                    -- Kill bandits on Tiki Outpost
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                            if string.find(mob.Name, "Isle") or string.find(mob.Name, "Pirate") then
                                repeat
                                    if not _G.AutoMusketeerHat then break end
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    BringMob(mob)
                                    Tween(mob.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()
                                until not _G.AutoMusketeerHat or mob.Humanoid.Health <= 0 or not mob.Parent
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- FLOWER ESP
-- ============================================================================

spawn(function()
    while wait() do
        pcall(function()
            if _G.FlowerESP then
                for _, flower in pairs(Workspace:GetChildren()) do
                    if flower.Name == "Flower1" or flower.Name == "Flower2" then
                        if not flower:FindFirstChild("FlowerEsp" .. ESPNumber) then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "FlowerEsp" .. ESPNumber
                            billboard.ExtentsOffset = Vector3.new(0, 1, 0)
                            billboard.Size = UDim2.new(1, 200, 1, 30)
                            billboard.Adornee = flower
                            billboard.AlwaysOnTop = true
                            billboard.Parent = flower
                            
                            local label = Instance.new("TextLabel")
                            label.Font = Enum.Font.GothamSemibold
                            label.TextSize = 14
                            label.TextWrapped = true
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.TextYAlignment = Enum.TextYAlignment.Top
                            label.BackgroundTransparency = 1
                            label.TextStrokeTransparency = 0.5
                            
                            if flower.Name == "Flower1" then
                                label.TextColor3 = Color3.fromRGB(0, 0, 255)
                                label.Text = "Blue Flower\n" .. round((LocalPlayer.Character.Head.Position - flower.Position).Magnitude / 3) .. "m"
                            else
                                label.TextColor3 = Color3.fromRGB(255, 0, 0)
                                label.Text = "Red Flower\n" .. round((LocalPlayer.Character.Head.Position - flower.Position).Magnitude / 3) .. "m"
                            end
                            label.Parent = billboard
                        else
                            local flowerType = flower.Name == "Flower1" and "Blue Flower" or "Red Flower"
                            flower["FlowerEsp" .. ESPNumber].TextLabel.Text = flowerType .. "\n" .. round((LocalPlayer.Character.Head.Position - flower.Position).Magnitude / 3) .. "m"
                        end
                    end
                end
            else
                for _, flower in pairs(Workspace:GetChildren()) do
                    if flower:FindFirstChild("FlowerEsp" .. ESPNumber) then
                        flower["FlowerEsp" .. ESPNumber]:Destroy()
                    end
                end
            end
        end)
    end
end)

-- ============================================================================
-- ISLAND ESP
-- ============================================================================

spawn(function()
    while wait() do
        pcall(function()
            if _G.IslandESP then
                for _, loc in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
                    if loc.Name ~= "Sea" then
                        if not loc:FindFirstChild("IslandEsp") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "IslandEsp"
                            billboard.ExtentsOffset = Vector3.new(0, 1, 0)
                            billboard.Size = UDim2.new(1, 200, 1, 30)
                            billboard.Adornee = loc
                            billboard.AlwaysOnTop = true
                            billboard.Parent = loc
                            
                            local label = Instance.new("TextLabel")
                            label.Font = Enum.Font.GothamBold
                            label.TextSize = 14
                            label.TextWrapped = true
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.TextYAlignment = Enum.TextYAlignment.Top
                            label.BackgroundTransparency = 1
                            label.TextStrokeTransparency = 0.5
                            label.TextColor3 = Color3.fromRGB(7, 236, 240)
                            label.Parent = billboard
                        end
                        loc.IslandEsp.TextLabel.Text = loc.Name .. "\n" .. round((LocalPlayer.Character.Head.Position - loc.Position).Magnitude / 3) .. "m"
                    end
                end
            else
                for _, loc in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
                    if loc:FindFirstChild("IslandEsp") then
                        loc.IslandEsp:Destroy()
                    end
                end
            end
        end)
    end
end)

-- ============================================================================
-- CHEST ESP
-- ============================================================================

spawn(function()
    while wait() do
        pcall(function()
            if _G.ChestESP then
                for _, item in pairs(Workspace:GetChildren()) do
                    if string.find(item.Name, "Chest") and item:IsA("BasePart") then
                        if not item:FindFirstChild("ChestEsp" .. ESPNumber) then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ChestEsp" .. ESPNumber
                            billboard.ExtentsOffset = Vector3.new(0, 1, 0)
                            billboard.Size = UDim2.new(1, 200, 1, 30)
                            billboard.Adornee = item
                            billboard.AlwaysOnTop = true
                            billboard.Parent = item
                            
                            local label = Instance.new("TextLabel")
                            label.Font = Enum.Font.GothamSemibold
                            label.TextSize = 14
                            label.TextWrapped = true
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.TextYAlignment = Enum.TextYAlignment.Top
                            label.BackgroundTransparency = 1
                            label.TextStrokeTransparency = 0.5
                            
                            if item.Name == "Chest1" then
                                label.TextColor3 = Color3.fromRGB(109, 109, 109)
                            elseif item.Name == "Chest2" then
                                label.TextColor3 = Color3.fromRGB(173, 158, 21)
                            elseif item.Name == "Chest3" then
                                label.TextColor3 = Color3.fromRGB(85, 255, 255)
                            else
                                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                            end
                            label.Parent = billboard
                        end
                        item["ChestEsp" .. ESPNumber].TextLabel.Text = item.Name .. "\n" .. round((LocalPlayer.Character.Head.Position - item.Position).Magnitude / 3) .. "m"
                    end
                end
            else
                for _, item in pairs(Workspace:GetChildren()) do
                    if item:FindFirstChild("ChestEsp" .. ESPNumber) then
                        item["ChestEsp" .. ESPNumber]:Destroy()
                    end
                end
            end
        end)
    end
end)

-- ============================================================================
-- PLAYER ESP
-- ============================================================================

spawn(function()
    while wait() do
        pcall(function()
            if _G.PlayerESP then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                        local head = player.Character.Head
                        if not head:FindFirstChild("PlayerEsp" .. ESPNumber) then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "PlayerEsp" .. ESPNumber
                            billboard.ExtentsOffset = Vector3.new(0, 1, 0)
                            billboard.Size = UDim2.new(1, 200, 1, 30)
                            billboard.Adornee = head
                            billboard.AlwaysOnTop = true
                            billboard.Parent = head
                            
                            local label = Instance.new("TextLabel")
                            label.Font = Enum.Font.GothamSemibold
                            label.TextSize = 14
                            label.TextWrapped = true
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.TextYAlignment = Enum.TextYAlignment.Top
                            label.BackgroundTransparency = 1
                            label.TextStrokeTransparency = 0.5
                            
                            if player.Team == LocalPlayer.Team then
                                label.TextColor3 = Color3.fromRGB(0, 255, 0)
                            else
                                label.TextColor3 = Color3.fromRGB(255, 0, 0)
                            end
                            label.Parent = billboard
                        end
                        
                        local health = player.Character:FindFirstChild("Humanoid") and round(player.Character.Humanoid.Health * 100 / player.Character.Humanoid.MaxHealth) or 0
                        head["PlayerEsp" .. ESPNumber].TextLabel.Text = player.Name .. "\n" .. round((LocalPlayer.Character.Head.Position - head.Position).Magnitude / 3) .. "m\nHP: " .. health .. "%"
                    end
                end
            else
                for _, player in pairs(Players:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("Head") then
                        if player.Character.Head:FindFirstChild("PlayerEsp" .. ESPNumber) then
                            player.Character.Head["PlayerEsp" .. ESPNumber]:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

-- ============================================================================
-- REAL FRUIT ESP (Apple, Banana, Pineapple)
-- ============================================================================

spawn(function()
    while wait() do
        pcall(function()
            local spawners = {"AppleSpawner", "BananaSpawner", "PineappleSpawner"}
            
            for _, spawnerName in ipairs(spawners) do
                local spawner = Workspace:FindFirstChild(spawnerName)
                if spawner then
                    for _, fruit in pairs(spawner:GetChildren()) do
                        if fruit:IsA("Tool") and fruit:FindFirstChild("Handle") then
                            if _G.FruitESP then
                                if not fruit.Handle:FindFirstChild("RealFruitEsp" .. ESPNumber) then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "RealFruitEsp" .. ESPNumber
                                    billboard.ExtentsOffset = Vector3.new(0, 1, 0)
                                    billboard.Size = UDim2.new(1, 200, 1, 30)
                                    billboard.Adornee = fruit.Handle
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = fruit.Handle
                                    
                                    local label = Instance.new("TextLabel")
                                    label.Font = Enum.Font.GothamSemibold
                                    label.TextSize = 14
                                    label.TextWrapped = true
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.TextYAlignment = Enum.TextYAlignment.Top
                                    label.BackgroundTransparency = 1
                                    label.TextStrokeTransparency = 0.5
                                    
                                    if spawnerName == "AppleSpawner" then
                                        label.TextColor3 = Color3.fromRGB(255, 0, 0)
                                    elseif spawnerName == "BananaSpawner" then
                                        label.TextColor3 = Color3.fromRGB(251, 255, 0)
                                    else
                                        label.TextColor3 = Color3.fromRGB(255, 174, 0)
                                    end
                                    label.Parent = billboard
                                end
                                fruit.Handle["RealFruitEsp" .. ESPNumber].TextLabel.Text = fruit.Name .. "\n" .. round((LocalPlayer.Character.Head.Position - fruit.Handle.Position).Magnitude / 3) .. "m"
                            else
                                if fruit.Handle:FindFirstChild("RealFruitEsp" .. ESPNumber) then
                                    fruit.Handle["RealFruitEsp" .. ESPNumber]:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

-- ============================================================================
-- SEA FEATURES
-- ============================================================================

-- Mirage Island Detection Status
spawn(function()
    while task.wait() do
        pcall(function()
            if game.Workspace.Map:FindFirstChild("MysticIsland") then
                MirageStatus = "Found!"
            else
                MirageStatus = "Not Found"
            end
        end)
    end
end)

-- Full Moon Detection
spawn(function()
    while task.wait() do
        pcall(function()
            local moonId = game:GetService("Lighting").Sky.MoonTextureId
            if moonId == "http://www.roblox.com/asset/?id=9709149431" then
                FullMoonStatus = "100%"
            elseif moonId == "http://www.roblox.com/asset/?id=9709149052" then
                FullMoonStatus = "75%"
            elseif moonId == "http://www.roblox.com/asset/?id=9709143733" then
                FullMoonStatus = "50%"
            elseif moonId == "http://www.roblox.com/asset/?id=9709150401" then
                FullMoonStatus = "25%"
            elseif moonId == "http://www.roblox.com/asset/?id=9709149680" then
                FullMoonStatus = "15%"
            else
                FullMoonStatus = "0%"
            end
        end)
    end
end)

-- Tween to Mirage Island Gear
spawn(function()
    while wait() do
        pcall(function()
            if _G.TweenToGear then
                if Workspace.Map:FindFirstChild("MysticIsland") then
                    for _, part in pairs(Workspace.Map.MysticIsland:GetChildren()) do
                        if part:IsA("MeshPart") and part.Material == Enum.Material.Neon then
                            Tween2(part.CFrame)
                        end
                    end
                end
            end
        end)
    end
end)

-- Get Highest Point on Mirage
local function getHighestPoint()
    if not Workspace.Map:FindFirstChild("MysticIsland") then return nil end
    for _, part in pairs(Workspace.Map.MysticIsland:GetDescendants()) do
        if part:IsA("MeshPart") and part.MeshId == "rbxassetid://6745037796" then
            return part
        end
    end
    return nil
end

local function TweenToHighestPoint()
    local highest = getHighestPoint()
    if highest then
        Tween2(highest.CFrame * CFrame.new(0, 211.88, 0))
    end
end

-- Lock Moon + Use Race Ability
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoLockMoon then
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(
                    game.Workspace.CurrentCamera.CFrame.p,
                    game.Workspace.CurrentCamera.CFrame.p + game.Lighting:GetMoonDirection() * 100
                )
                ReplicatedStorage.Remotes.CommE:FireServer("ActivateAbility")
            end
        end)
    end
end)

-- Sea Beast Farm
spawn(function()
    while wait() do
        if _G.AutoSeaBeast then
            pcall(function()
                if Workspace:FindFirstChild("SeaBeasts") then
                    for _, beast in pairs(Workspace.SeaBeasts:GetChildren()) do
                        if beast:FindFirstChild("HumanoidRootPart") and beast:FindFirstChild("Humanoid") then
                            if beast.Humanoid.Health > 0 then
                                repeat
                                    if not _G.AutoSeaBeast then break end
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(beast.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()
                                until not _G.AutoSeaBeast or beast.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- ITEM QUESTS
-- ============================================================================

-- Auto Saber Quest
spawn(function()
    while task.wait() do
        if _G.Auto_Saber then
            pcall(function()
                if LocalPlayer.Data.Level.Value >= 200 then
                    if Workspace.Map.Jungle.Final.Part.Transparency == 0 then
                        if Workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame
                            wait(1)
                            LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame
                            wait(1)
                            LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame
                            wait(1)
                            LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame
                            wait(1)
                            LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame
                        elseif Workspace.Map.Desert.Burn.Part.Transparency == 0 then
                            if LocalPlayer.Backpack:FindFirstChild("Torch") or LocalPlayer.Character:FindFirstChild("Torch") then
                                EquipTool("Torch")
                                Tween(CFrame.new(1114.614, 5.046, 4350.228))
                            else
                                Tween(CFrame.new(-1610.007, 11.504, 164.001))
                            end
                        elseif ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
                            if Workspace.Enemies:FindFirstChild("Mob Leader") then
                                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                                    if mob.Name == "Mob Leader" and mob.Humanoid.Health > 0 then
                                        repeat
                                            task.wait(_G.Fast_Delay)
                                            AutoHaki()
                                            EquipTool(SelectWeapon)
                                            BringMob(mob)
                                            Tween(mob.HumanoidRootPart.CFrame * Pos)
                                            AttackNoCoolDown()
                                        until not _G.Auto_Saber or mob.Humanoid.Health <= 0
                                    end
                                end
                            else
                                Tween(CFrame.new(-2967.595, -4.910, 5328.707))
                            end
                        end
                    elseif Workspace.Enemies:FindFirstChild("Saber Expert") then
                        for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                            if mob.Name == "Saber Expert" and mob.Humanoid.Health > 0 then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    EquipTool(SelectWeapon)
                                    Tween(mob.HumanoidRootPart.CFrame * Pos)
                                    BringMob(mob)
                                    AttackNoCoolDown()
                                until not _G.Auto_Saber or mob.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Auto Pole V1
spawn(function()
    while wait() do
        if _G.Auto_PoleV1 then
            pcall(function()
                if Workspace.Enemies:FindFirstChild("Thunder God") then
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob.Name == "Thunder God" and mob.Humanoid.Health > 0 then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(mob)
                                Tween(mob.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_PoleV1 or mob.Humanoid.Health <= 0
                        end
                    end
                else
                    Tween(CFrame.new(-7748.018, 5606.806, -2305.898))
                end
            end)
        end
    end
end)

-- Auto Shark Saw
spawn(function()
    while wait() do
        if _G.Auto_Saw then
            pcall(function()
                if Workspace.Enemies:FindFirstChild("The Saw") then
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob.Name == "The Saw" and mob.Humanoid.Health > 0 then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(mob)
                                Tween(mob.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Saw or mob.Humanoid.Health <= 0
                        end
                    end
                else
                    Tween(CFrame.new(-690.330, 15.094, 1582.238))
                end
            end)
        end
    end
end)

-- Auto Warden Sword
spawn(function()
    while wait() do
        if _G.Auto_Warden then
            pcall(function()
                if Workspace.Enemies:FindFirstChild("Chief Warden") then
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob.Name == "Chief Warden" and mob.Humanoid.Health > 0 then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                BringMob(mob)
                                Tween(mob.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Warden or mob.Humanoid.Health <= 0
                        end
                    end
                else
                    Tween(CFrame.new(5186.146, 24.866, 832.188))
                end
            end)
        end
    end
end)

-- Third Sea Items
if Sea3 then
    -- Auto Hallow Scythe
    spawn(function()
        while wait() do
            if _G.AutoHallowScythe then
                pcall(function()
                    if Workspace.Enemies:FindFirstChild("Soul Reaper") then
                        for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                            if string.find(mob.Name, "Soul Reaper") then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    mob.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(mob.HumanoidRootPart.CFrame * Pos)
                                until not _G.AutoHallowScythe or mob.Humanoid.Health <= 0
                            end
                        end
                    elseif LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
                        Tween(CFrame.new(-8932.322, 146.831, 6062.550))
                        wait(1)
                        EquipTool("Hallow Essence")
                    end
                end)
            end
        end
    end)
    
    -- Auto Yama
    spawn(function()
        while wait() do
            if _G.AutoYama then
                local progress = ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
                if progress >= 30 then
                    pcall(function() fireclickdetector(Workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector) end)
                    if LocalPlayer.Backpack:FindFirstChild("Yama") then _G.AutoYama = false end
                end
            end
        end
    end)
    
    -- Auto Tushita
    spawn(function()
        while wait() do
            if _G.AutoTushita then
                pcall(function()
                    if Workspace.Enemies:FindFirstChild("Longma") then
                        for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                            if mob.Name == "Longma" and mob.Humanoid.Health > 0 then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    BringMob(mob)
                                    Tween(mob.HumanoidRootPart.CFrame * Pos)
                                until not _G.AutoTushita or mob.Humanoid.Health <= 0
                            end
                        end
                    else
                        Tween(CFrame.new(-10238.875, 389.791, -9549.793))
                    end
                end)
            end
        end
    end)
end

-- ============================================================================
-- RACE V4 FEATURES
-- ============================================================================

-- Auto Trial (All Races)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
                local race = LocalPlayer.Data.Race.Value
                if race == "Human" or race == "Ghoul" then
                    for _, mob in pairs(Workspace.Enemies:GetDescendants()) do
                        if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                            pcall(function()
                                repeat
                                    wait()
                                    mob.Humanoid.Health = 0
                                    mob.HumanoidRootPart.CanCollide = false
                                    pcall(function() sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge) end)
                                until not _G.AutoQuestRace or mob.Humanoid.Health <= 0
                            end)
                        end
                    end
                elseif race == "Skypiea" then
                    for _, part in pairs(Workspace.Map.SkyTrial.Model:GetDescendants()) do
                        if part.Name == "snowisland_Cylinder.081" then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame
                        end
                    end
                elseif race == "Fishman" then
                    for _, beast in pairs(Workspace.SeaBeasts.SeaBeast1:GetDescendants()) do
                        if beast.Name == "HumanoidRootPart" then
                            Tween(beast.CFrame * Pos)
                            VirtualInputManager:SendKeyEvent(true, 122, false, LocalPlayer.Character.HumanoidRootPart)
                            VirtualInputManager:SendKeyEvent(false, 122, false, LocalPlayer.Character.HumanoidRootPart)
                            wait(0.2)
                            VirtualInputManager:SendKeyEvent(true, 120, false, LocalPlayer.Character.HumanoidRootPart)
                            VirtualInputManager:SendKeyEvent(false, 120, false, LocalPlayer.Character.HumanoidRootPart)
                        end
                    end
                elseif race == "Cyborg" then
                    Tween(CFrame.new(28654, 14898.783, -30))
                elseif race == "Mink" then
                    for _, part in pairs(Workspace:GetDescendants()) do
                        if part.Name == "StartPoint" then
                            Tween(part.CFrame * CFrame.new(0, 10, 0))
                        end
                    end
                end
            end
        end
    end)
end)

-- Kill Players in Trial
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKillTrial then
                for _, player in pairs(Players:GetChildren()) do
                    if player.Name ~= LocalPlayer.Name and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        if (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                            if player.Character.Humanoid.Health > 0 then
                                repeat
                                    wait(_G.Fast_Delay)
                                    EquipTool(SelectWeapon)
                                    AutoHaki()
                                    Tween(player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
                                    player.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    AttackNoCoolDown()
                                until not _G.AutoKillTrial or player.Character.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)

-- Race Door Teleport Function
local function TeleportToRaceDoor()
    ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35, 14895.30, 102.62))
    local race = LocalPlayer.Data.Race.Value
    local raceDoors = {
        Human = CFrame.new(29221.822, 14890.975, -205.991),
        Skypiea = CFrame.new(28960.158, 14919.624, 235.039),
        Fishman = CFrame.new(28231.175, 14890.975, -211.641),
        Cyborg = CFrame.new(28502.681, 14895.975, -423.727),
        Ghoul = CFrame.new(28674.244, 14890.676, 445.431),
        Mink = CFrame.new(29012.341, 14890.975, -380.149)
    }
    if raceDoors[race] then Tween2(raceDoors[race]) end
end

-- ============================================================================
-- RAINBOW HAKI QUEST
-- ============================================================================

spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Auto_RainbowHaki then
                if not LocalPlayer.PlayerGui.Main.Quest.Visible then
                    Tween(CFrame.new(-11892.070, 930.576, -8760.159))
                    if (Vector3.new(-11892.070, 930.576, -8760.159) - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        wait(1.5)
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                    end
                else
                    local questText = LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    local bosses = {"Stone", "Hydra Leader", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate"}
                    local bossPositions = {
                        ["Stone"] = CFrame.new(-1086.116, 38.842, 6768.714),
                        ["Hydra Leader"] = CFrame.new(5713.988, 601.922, 202.751),
                        ["Kilo Admiral"] = CFrame.new(2877.617, 423.558, -7207.310),
                        ["Captain Elephant"] = CFrame.new(-13485.028, 331.709, -8012.487),
                        ["Beautiful Pirate"] = CFrame.new(5312.359, 20.141, -10.158)
                    }
                    for _, boss in ipairs(bosses) do
                        if string.find(questText, boss) then
                            if Workspace.Enemies:FindFirstChild(boss) then
                                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                                    if mob.Name == boss then
                                        local oldCFrame = mob.HumanoidRootPart.CFrame
                                        repeat
                                            task.wait(_G.Fast_Delay)
                                            EquipTool(SelectWeapon)
                                            Tween(mob.HumanoidRootPart.CFrame * Pos)
                                            mob.HumanoidRootPart.CFrame = oldCFrame
                                            mob.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            AttackNoCoolDown()
                                        until not _G.Auto_RainbowHaki or mob.Humanoid.Health <= 0 or not LocalPlayer.PlayerGui.Main.Quest.Visible
                                    end
                                end
                            else
                                Tween(bossPositions[boss])
                            end
                            break
                        end
                    end
                end
            end
        end
    end)
end)

-- ============================================================================
-- ELITE HUNTER
-- ============================================================================

spawn(function()
    while wait() do
        if _G.AutoEliteHunter then
            pcall(function()
                local progress = ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
                if progress and progress < 30 then
                    local targets = {"Diablo", "Deandre", "Urban"}
                    for _, name in ipairs(targets) do
                        if Workspace.Enemies:FindFirstChild(name) then
                            for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                                if mob.Name == name and mob.Humanoid.Health > 0 then
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        AutoHaki()
                                        EquipTool(SelectWeapon)
                                        BringMob(mob)
                                        Tween(mob.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCoolDown()
                                    until not _G.AutoEliteHunter or mob.Humanoid.Health <= 0
                                end
                            end
                        elseif ReplicatedStorage:FindFirstChild(name) then
                            Tween2(ReplicatedStorage:FindFirstChild(name).HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                    if not Workspace.Enemies:FindFirstChild("Diablo") and not Workspace.Enemies:FindFirstChild("Deandre") and not Workspace.Enemies:FindFirstChild("Urban") then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter")
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- LAW RAID (ORDER BOSS)
-- ============================================================================

spawn(function()
    pcall(function()
        while wait() do
            if _G.Auto_Law then
                if not Workspace.Enemies:FindFirstChild("Order") and not ReplicatedStorage:FindFirstChild("Order") then
                    if LocalPlayer.Character:FindFirstChild("Microchip") or LocalPlayer.Backpack:FindFirstChild("Microchip") then
                        pcall(function() fireclickdetector(Workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector) end)
                    else
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
                    end
                end
                if Workspace.Enemies:FindFirstChild("Order") then
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob.Name == "Order" then
                            repeat
                                wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                Tween(mob.HumanoidRootPart.CFrame * Pos)
                                mob.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            until not _G.Auto_Law or mob.Humanoid.Health <= 0
                        end
                    end
                elseif ReplicatedStorage:FindFirstChild("Order") then
                    Tween(CFrame.new(-6217.202, 28.047, -5053.135))
                end
            end
        end
    end)
end)

-- ============================================================================
-- ADDITIONAL ESP TYPES
-- ============================================================================

-- Gear ESP (Mirage Island)
spawn(function()
    while wait() do
        pcall(function()
            if _G.GearESP then
                if Workspace.Map:FindFirstChild("MysticIsland") then
                    for _, part in pairs(Workspace.Map.MysticIsland:GetChildren()) do
                        if part:IsA("MeshPart") and part.Material == Enum.Material.Neon then
                            if not part:FindFirstChild("GearEsp" .. ESPNumber) then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "GearEsp" .. ESPNumber
                                billboard.ExtentsOffset = Vector3.new(0, 1, 0)
                                billboard.Size = UDim2.new(1, 200, 1, 30)
                                billboard.Adornee = part
                                billboard.AlwaysOnTop = true
                                billboard.Parent = part
                                local label = Instance.new("TextLabel")
                                label.Font = Enum.Font.GothamSemibold
                                label.TextSize = 14
                                label.Size = UDim2.new(1, 0, 1, 0)
                                label.BackgroundTransparency = 1
                                label.TextStrokeTransparency = 0.5
                                label.TextColor3 = Color3.fromRGB(255, 0, 255)
                                label.Parent = billboard
                            end
                            part["GearEsp" .. ESPNumber].TextLabel.Text = "⚙️ Gear\n" .. round((LocalPlayer.Character.Head.Position - part.Position).Magnitude / 3) .. "m"
                        end
                    end
                end
            else
                if Workspace.Map:FindFirstChild("MysticIsland") then
                    for _, part in pairs(Workspace.Map.MysticIsland:GetChildren()) do
                        if part:FindFirstChild("GearEsp" .. ESPNumber) then
                            part["GearEsp" .. ESPNumber]:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

-- Sea Beast ESP
spawn(function()
    while wait() do
        pcall(function()
            if _G.SeaBeastESP then
                if Workspace:FindFirstChild("SeaBeasts") then
                    for _, beast in pairs(Workspace.SeaBeasts:GetChildren()) do
                        if beast:FindFirstChild("HumanoidRootPart") and beast:FindFirstChild("Humanoid") then
                            if not beast.HumanoidRootPart:FindFirstChild("SeaBeastEsp" .. ESPNumber) then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "SeaBeastEsp" .. ESPNumber
                                billboard.ExtentsOffset = Vector3.new(0, 3, 0)
                                billboard.Size = UDim2.new(1, 200, 1, 30)
                                billboard.Adornee = beast.HumanoidRootPart
                                billboard.AlwaysOnTop = true
                                billboard.Parent = beast.HumanoidRootPart
                                local label = Instance.new("TextLabel")
                                label.Font = Enum.Font.GothamSemibold
                                label.TextSize = 14
                                label.Size = UDim2.new(1, 0, 1, 0)
                                label.BackgroundTransparency = 1
                                label.TextStrokeTransparency = 0.5
                                label.TextColor3 = Color3.fromRGB(0, 200, 255)
                                label.Parent = billboard
                            end
                            local health = round(beast.Humanoid.Health * 100 / beast.Humanoid.MaxHealth)
                            beast.HumanoidRootPart["SeaBeastEsp" .. ESPNumber].TextLabel.Text = "🐙 Sea Beast\nHP: " .. health .. "%\n" .. round((LocalPlayer.Character.Head.Position - beast.HumanoidRootPart.Position).Magnitude / 3) .. "m"
                        end
                    end
                end
            else
                if Workspace:FindFirstChild("SeaBeasts") then
                    for _, beast in pairs(Workspace.SeaBeasts:GetChildren()) do
                        if beast:FindFirstChild("HumanoidRootPart") and beast.HumanoidRootPart:FindFirstChild("SeaBeastEsp" .. ESPNumber) then
                            beast.HumanoidRootPart["SeaBeastEsp" .. ESPNumber]:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

-- Mirage Island ESP
spawn(function()
    while wait() do
        pcall(function()
            if _G.MirageIslandESP then
                if Workspace.Map:FindFirstChild("MysticIsland") then
                    local island = Workspace.Map.MysticIsland
                    local mainPart = island:FindFirstChildWhichIsA("BasePart")
                    if mainPart and not mainPart:FindFirstChild("MirageEsp" .. ESPNumber) then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "MirageEsp" .. ESPNumber
                        billboard.ExtentsOffset = Vector3.new(0, 50, 0)
                        billboard.Size = UDim2.new(1, 200, 1, 30)
                        billboard.Adornee = mainPart
                        billboard.AlwaysOnTop = true
                        billboard.Parent = mainPart
                        local label = Instance.new("TextLabel")
                        label.Font = Enum.Font.GothamBold
                        label.TextSize = 16
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.TextStrokeTransparency = 0.5
                        label.TextColor3 = Color3.fromRGB(170, 0, 255)
                        label.Parent = billboard
                    end
                    if mainPart then
                        mainPart["MirageEsp" .. ESPNumber].TextLabel.Text = "🏝️ MIRAGE ISLAND\n" .. round((LocalPlayer.Character.Head.Position - mainPart.Position).Magnitude / 3) .. "m"
                    end
                end
            else
                if Workspace.Map:FindFirstChild("MysticIsland") then
                    for _, part in pairs(Workspace.Map.MysticIsland:GetDescendants()) do
                        if part:FindFirstChild("MirageEsp" .. ESPNumber) then
                            part["MirageEsp" .. ESPNumber]:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

-- ============================================================================
-- STATS AUTO ALLOCATION
-- ============================================================================

spawn(function()
    while wait() do
        if _G.Auto_Stats_Devil_Fruit then ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", 3) end
        if _G.Auto_Stats_Gun then ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Gun", 3) end
        if _G.Auto_Stats_Sword then ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Sword", 3) end
        if _G.Auto_Stats_Defense then ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Defense", 3) end
        if _G.Auto_Stats_Melee then ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Melee", 3) end
    end
end)

-- ============================================================================
-- AUTO STORE FRUIT
-- ============================================================================

local FruitList = {
    {name = "Bomb Fruit", id = "Bomb-Bomb"}, {name = "Spike Fruit", id = "Spike-Spike"},
    {name = "Chop Fruit", id = "Chop-Chop"}, {name = "Spring Fruit", id = "Spring-Spring"},
    {name = "Kilo Fruit", id = "Rocket-Rocket"}, {name = "Smoke Fruit", id = "Smoke-Smoke"},
    {name = "Spin Fruit", id = "Spin-Spin"}, {name = "Flame Fruit", id = "Flame-Flame"},
    {name = "Ice Fruit", id = "Ice-Ice"}, {name = "Sand Fruit", id = "Sand-Sand"},
    {name = "Dark Fruit", id = "Dark-Dark"}, {name = "Light Fruit", id = "Light-Light"},
    {name = "Love Fruit", id = "Love-Love"}, {name = "Rubber Fruit", id = "Rubber-Rubber"},
    {name = "Barrier Fruit", id = "Barrier-Barrier"}, {name = "Magma Fruit", id = "Magma-Magma"},
    {name = "Portal Fruit", id = "Door-Door"}, {name = "Quake Fruit", id = "Quake-Quake"},
    {name = "Buddha Fruit", id = "Buddha"}, {name = "Phoenix Fruit", id = "Phoenix"},
    {name = "Rumble Fruit", id = "Rumble-Rumble"}, {name = "Pain Fruit", id = "Pain-Pain"},
    {name = "Gravity Fruit", id = "Gravity-Gravity"}, {name = "Dough Fruit", id = "Dough-Dough"},
    {name = "Shadow Fruit", id = "Shadow-Shadow"}, {name = "Venom Fruit", id = "Venom-Venom"},
    {name = "Control Fruit", id = "Control-Control"}, {name = "Spirit Fruit", id = "Soul-Soul"},
    {name = "Dragon Fruit", id = "Dragon-Dragon"}, {name = "Leopard Fruit", id = "Leopard-Leopard"}
}

spawn(function()
    while wait() do
        if _G.AutoStoreFruit then
            pcall(function()
                for _, fruit in ipairs(FruitList) do
                    if LocalPlayer.Character:FindFirstChild(fruit.name) or LocalPlayer.Backpack:FindFirstChild(fruit.name) then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StoreFruit", fruit.id, LocalPlayer.Backpack:FindFirstChild(fruit.name))
                    end
                end
            end)
        end
    end
end)

-- Random Fruit Spin
spawn(function()
    while wait() do
        if _G.RandomFruit then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Cousin", "Buy")
        end
    end
end)

-- ============================================================================
-- PLAYER FEATURES
-- ============================================================================

-- Walk on Water
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.WalkOnWater then
                Workspace.Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
            else
                Workspace.Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
            end
        end)
    end
end)

-- No Clip
spawn(function()
    pcall(function()
        RunService.Stepped:Connect(function()
            if _G.NoClip then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

-- Enable PvP
spawn(function()
    while wait() do
        if _G.EnablePvP then
            if LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("EnablePvp")
            end
        end
    end
end)

-- ============================================================================
-- SEA TRAVEL FUNCTIONS
-- ============================================================================

local function TravelToSea1() ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelMain") end
local function TravelToSea2() ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa") end
local function TravelToSea3() ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou") end

-- ============================================================================
-- UI ADDITIONS - SEA TAB
-- ============================================================================

local SeaTab = Window:CreateTab("Sea")
local SeaSection = SeaTab:CreateSection("Sea Features", true)

SeaSection:AddLabel("Mirage: " .. MirageStatus .. " | Moon: " .. FullMoonStatus)

SeaSection:AddToggle({
    Label = "Tween to Gear",
    Default = false,
    Callback = function(v) _G.TweenToGear = v end
})

SeaSection:AddToggle({
    Label = "Lock Moon + Use Race",
    Default = false,
    Callback = function(v) _G.AutoLockMoon = v end
})

SeaSection:AddButton({
    Label = "Tween to High Point",
    Callback = function() TweenToHighestPoint() end
})

SeaSection:AddToggle({
    Label = "Farm Sea Beast",
    Default = false,
    Callback = function(v) _G.AutoSeaBeast = v end
})

-- ============================================================================
-- UI ADDITIONS - ITEM TAB
-- ============================================================================

local ItemTab = Window:CreateTab("Items")
local ItemSection = ItemTab:CreateSection("Item Quests [Sea 1]", true)

ItemSection:AddToggle({ Label = "Auto Saber", Default = false, Callback = function(v) _G.Auto_Saber = v end })
ItemSection:AddToggle({ Label = "Auto Pole V1", Default = false, Callback = function(v) _G.Auto_PoleV1 = v end })
ItemSection:AddToggle({ Label = "Auto Shark Saw", Default = false, Callback = function(v) _G.Auto_Saw = v end })
ItemSection:AddToggle({ Label = "Auto Warden Sword", Default = false, Callback = function(v) _G.Auto_Warden = v end })

if Sea3 then
    local Item3Section = ItemTab:CreateSection("Item Quests [Sea 3]", true)
    Item3Section:AddToggle({ Label = "Auto Hallow Scythe", Default = false, Callback = function(v) _G.AutoHallowScythe = v end })
    Item3Section:AddToggle({ Label = "Auto Yama", Default = false, Callback = function(v) _G.AutoYama = v end })
    Item3Section:AddToggle({ Label = "Auto Tushita", Default = false, Callback = function(v) _G.AutoTushita = v end })
    Item3Section:AddToggle({ Label = "Auto Rainbow Haki", Default = false, Callback = function(v) _G.Auto_RainbowHaki = v end })
    Item3Section:AddToggle({ Label = "Auto Elite Hunter", Default = false, Callback = function(v) _G.AutoEliteHunter = v end })
end

-- ============================================================================
-- UI ADDITIONS - RACE TAB
-- ============================================================================

local RaceTab = Window:CreateTab("Race V4")
local RaceSection = RaceTab:CreateSection("Time Dimension", true)

RaceSection:AddButton({
    Label = "Enter Time Dimension",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35, 14895.30, 102.62))
    end
})

RaceSection:AddButton({
    Label = "Race Door",
    Callback = function() TeleportToRaceDoor() end
})

local TrialSection = RaceTab:CreateSection("Trials", true)
TrialSection:AddToggle({ Label = "Auto Complete Trial", Default = false, Callback = function(v) _G.AutoQuestRace = v end })
TrialSection:AddToggle({ Label = "Kill Players in Trial", Default = false, Callback = function(v) _G.AutoKillTrial = v end })

-- ============================================================================
-- UI ADDITIONS - MISC TAB
-- ============================================================================

local MiscTab2 = Window:CreateTab("Misc+")

local StatsSection = MiscTab2:CreateSection("Auto Stats", true)
StatsSection:AddToggle({ Label = "Melee", Default = false, Callback = function(v) _G.Auto_Stats_Melee = v end })
StatsSection:AddToggle({ Label = "Defense", Default = false, Callback = function(v) _G.Auto_Stats_Defense = v end })
StatsSection:AddToggle({ Label = "Sword", Default = false, Callback = function(v) _G.Auto_Stats_Sword = v end })
StatsSection:AddToggle({ Label = "Gun", Default = false, Callback = function(v) _G.Auto_Stats_Gun = v end })
StatsSection:AddToggle({ Label = "Devil Fruit", Default = false, Callback = function(v) _G.Auto_Stats_Devil_Fruit = v end })

local FruitSection = MiscTab2:CreateSection("Fruit Features", true)
FruitSection:AddToggle({ Label = "Auto Store Fruit", Default = false, Callback = function(v) _G.AutoStoreFruit = v end })
FruitSection:AddToggle({ Label = "Random Fruit Spin", Default = false, Callback = function(v) _G.RandomFruit = v end })

local PlayerSection = MiscTab2:CreateSection("Player", true)
PlayerSection:AddToggle({ Label = "Walk on Water", Default = true, Callback = function(v) _G.WalkOnWater = v end })
PlayerSection:AddToggle({ Label = "No Clip", Default = true, Callback = function(v) _G.NoClip = v end })
PlayerSection:AddToggle({ Label = "Enable PvP", Default = false, Callback = function(v) _G.EnablePvP = v end })

local TravelSection = MiscTab2:CreateSection("Sea Travel", true)
TravelSection:AddButton({ Label = "Go to Sea 1", Callback = function() TravelToSea1() end })
TravelSection:AddButton({ Label = "Go to Sea 2", Callback = function() TravelToSea2() end })
TravelSection:AddButton({ Label = "Go to Sea 3", Callback = function() TravelToSea3() end })

local RaidSection = MiscTab2:CreateSection("Raids", true)
RaidSection:AddToggle({ Label = "Auto Law Raid", Default = false, Callback = function(v) _G.Auto_Law = v end })

-- Additional ESP Toggles
ESPSection:AddToggle({ Label = "Gear ESP", Default = false, Callback = function(v) _G.GearESP = v end })
ESPSection:AddToggle({ Label = "Sea Beast ESP", Default = false, Callback = function(v) _G.SeaBeastESP = v end })
ESPSection:AddToggle({ Label = "Mirage Island ESP", Default = false, Callback = function(v) _G.MirageIslandESP = v end })

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

print("")
print("============================================")
print("       FAMYY PRIVATE v10.0 - Blox Fruits")
print("============================================")
print("  Sea: " .. CurrentSea)
print("  Press RightShift to toggle UI")
print("  Based on Monster Hub mechanics")
print("============================================")
print("  Features:")
print("   - Auto Level / Near / Boss Farm")
print("   - Fruit Mastery with Skills")
print("   - ESP (Mob, Player, Fruit, Gear, etc.)")
print("   - Quest Items (Saber, Pole V1, etc.)")
print("   - Race V4 / Raids / Materials")
print("   - Teleports / Stats / Server Hop")
print("   - Sea Features / Item Quests")
print("   - Rainbow Haki / Elite Hunter")
print("============================================")
print("")

Window.Notify("Loaded!", "Famyy Private v10.0 - " .. CurrentSea, 3, "success")
