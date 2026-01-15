--[[
    ███████╗ █████╗ ███╗   ███╗██╗   ██╗██╗   ██╗    ██████╗ ██████╗ ██╗██╗   ██╗ █████╗ ████████╗███████╗
    ██╔════╝██╔══██╗████╗ ████║╚██╗ ██╔╝╚██╗ ██╔╝    ██╔══██╗██╔══██╗██║██║   ██║██╔══██╗╚══██╔══╝██╔════╝
    █████╗  ███████║██╔████╔██║ ╚████╔╝  ╚████╔╝     ██████╔╝██████╔╝██║██║   ██║███████║   ██║   █████╗  
    ██╔══╝  ██╔══██║██║╚██╔╝██║  ╚██╔╝    ╚██╔╝      ██╔═══╝ ██╔══██╗██║╚██╗ ██╔╝██╔══██║   ██║   ██╔══╝  
    ██║     ██║  ██║██║ ╚═╝ ██║   ██║      ██║       ██║     ██║  ██║██║ ╚████╔╝ ██║  ██║   ██║   ███████╗
    ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝      ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═╝   ╚═╝   ╚══════╝
    
    FAMYY PRIVATE - Blox Fruits Script
    Version: 7.0 (With FamyyLib UI)
    
    Supports: All 3 Seas (First, Second, Third)
    Executor: Solara compatible
]]

-- ============================================================================
-- LOAD FAMYYLIB UI
-- ============================================================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/FamyyLib.lua"))()

-- ============================================================================
-- SERVICES
-- ============================================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- ============================================================================
-- SETTINGS
-- ============================================================================

_G.AutoLevel = false
_G.AutoNear = false
_G.AutoBoss = false
_G.BringMob = true
_G.AutoHaki = true
_G.FastAttack = true
_G.FastDelay = 0.1
_G.TweenSpeed = 350

-- ============================================================================
-- SEA DETECTION
-- ============================================================================

local Sea1 = game.PlaceId == 2753915549
local Sea2 = game.PlaceId == 4442272183
local Sea3 = game.PlaceId == 7449423635

local CurrentSea = Sea1 and "First Sea" or Sea2 and "Second Sea" or Sea3 and "Third Sea" or "Unknown"

print("[Famyy] Detected Sea:", CurrentSea)

-- ============================================================================
-- VARIABLES
-- ============================================================================

local Ms = "" -- Monster display name
local NameQuest = "" -- Quest name
local QuestLv = 1 -- Quest level
local NameMon = "" -- Monster name for checking
local CFrameQ = CFrame.new(0, 0, 0) -- Quest NPC position
local CFrameMon = CFrame.new(0, 0, 0) -- Monster spawn position
local Pos = CFrame.new(0, 20, 0) -- Offset above mob

local SelectWeapon = nil
local SelectedMob = nil -- For manual mob selection

-- ============================================================================
-- MOB LIST FOR EACH SEA
-- ============================================================================

local MobList = {}

if Sea1 then
    MobList = {
        "Auto (By Level)",
        "Bandit", "Monkey", "Gorilla", "Pirate", "Brute",
        "Desert Bandit", "Desert Officer", "Snow Bandit", "Snowman",
        "Chief Petty Officer", "Sky Bandit", "Dark Master",
        "Prisoner", "Dangerous Prisoner", "Toga Warrior", "Gladiator",
        "Military Soldier", "Military Spy", "Fishman Warrior", "Fishman Commando",
        "God's Guard", "Shanda", "Royal Squad", "Royal Soldier",
        "Galley Pirate", "Galley Captain"
    }
elseif Sea2 then
    MobList = {
        "Auto (By Level)",
        "Raider", "Mercenary", "Swan Pirate", "Factory Staff",
        "Marine Lieutenant", "Marine Captain", "Zombie", "Vampire",
        "Snow Trooper", "Winter Warrior", "Lab Subordinate", "Horned Warrior",
        "Magma Ninja", "Lava Pirate", "Ship Deckhand", "Ship Engineer",
        "Ship Steward", "Ship Officer", "Arctic Warrior", "Snow Lurker",
        "Sea Soldier", "Water Fighter"
    }
elseif Sea3 then
    MobList = {
        "Auto (By Level)",
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
end

-- ============================================================================
-- WEAPON LIST
-- ============================================================================

local function GetWeaponList()
    local weapons = {"None"}
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            table.insert(weapons, tool.Name)
        end
    end
    return weapons
end

-- ============================================================================
-- QUEST DATABASE - ALL 3 SEAS (Complete from Monster Hub)
-- ============================================================================

local QuestData = {
    -- First Sea
    ["Bandit"] = {Quest = "BanditQuest1", Lv = 1, QuestPos = CFrame.new(1060.938, 16.455, 1547.784), MobPos = CFrame.new(1038.553, 41.296, 1576.509)},
    ["Monkey"] = {Quest = "JungleQuest", Lv = 1, QuestPos = CFrame.new(-1601.655, 36.852, 153.388), MobPos = CFrame.new(-1448.144, 50.851, 63.607)},
    ["Gorilla"] = {Quest = "JungleQuest", Lv = 2, QuestPos = CFrame.new(-1601.655, 36.852, 153.388), MobPos = CFrame.new(-1142.648, 40.462, -515.392)},
    ["Pirate"] = {Quest = "BuggyQuest1", Lv = 1, QuestPos = CFrame.new(-1140.176, 4.752, 3827.405), MobPos = CFrame.new(-1201.088, 40.628, 3857.596)},
    ["Brute"] = {Quest = "BuggyQuest1", Lv = 2, QuestPos = CFrame.new(-1140.176, 4.752, 3827.405), MobPos = CFrame.new(-1387.532, 24.592, 4100.957)},
    ["Desert Bandit"] = {Quest = "DesertQuest", Lv = 1, QuestPos = CFrame.new(896.517, 6.438, 4390.149), MobPos = CFrame.new(984.998, 16.109, 4417.910)},
    ["Desert Officer"] = {Quest = "DesertQuest", Lv = 2, QuestPos = CFrame.new(896.517, 6.438, 4390.149), MobPos = CFrame.new(1547.151, 14.452, 4381.800)},
    ["Snow Bandit"] = {Quest = "SnowQuest", Lv = 1, QuestPos = CFrame.new(1386.807, 87.272, -1298.357), MobPos = CFrame.new(1356.302, 105.768, -1328.241)},
    ["Snowman"] = {Quest = "SnowQuest", Lv = 2, QuestPos = CFrame.new(1386.807, 87.272, -1298.357), MobPos = CFrame.new(1218.795, 138.011, -1488.026)},
    ["Chief Petty Officer"] = {Quest = "MarineQuest2", Lv = 1, QuestPos = CFrame.new(-5035.496, 28.677, 4324.184), MobPos = CFrame.new(-4931.155, 65.793, 4121.839)},
    ["Sky Bandit"] = {Quest = "SkyQuest", Lv = 1, QuestPos = CFrame.new(-4842.137, 717.695, -2623.048), MobPos = CFrame.new(-4955.641, 365.463, -2908.186)},
    ["Dark Master"] = {Quest = "SkyQuest", Lv = 2, QuestPos = CFrame.new(-4842.137, 717.695, -2623.048), MobPos = CFrame.new(-5148.165, 439.045, -2332.961)},
    ["Prisoner"] = {Quest = "PrisonerQuest", Lv = 1, QuestPos = CFrame.new(5310.605, 0.350, 474.946), MobPos = CFrame.new(4937.318, 0.332, 649.574)},
    ["Dangerous Prisoner"] = {Quest = "PrisonerQuest", Lv = 2, QuestPos = CFrame.new(5310.605, 0.350, 474.946), MobPos = CFrame.new(5099.662, 0.351, 1055.758)},
    ["Toga Warrior"] = {Quest = "ColosseumQuest", Lv = 1, QuestPos = CFrame.new(-1577.789, 7.415, -2984.483), MobPos = CFrame.new(-1872.516, 49.080, -2913.810)},
    ["Gladiator"] = {Quest = "ColosseumQuest", Lv = 2, QuestPos = CFrame.new(-1577.789, 7.415, -2984.483), MobPos = CFrame.new(-1521.374, 81.203, -3066.313)},
    ["Military Soldier"] = {Quest = "MagmaQuest", Lv = 1, QuestPos = CFrame.new(-5316.115, 12.262, 8517.003), MobPos = CFrame.new(-5369.000, 61.243, 8556.492)},
    ["Military Spy"] = {Quest = "MagmaQuest", Lv = 2, QuestPos = CFrame.new(-5316.115, 12.262, 8517.003), MobPos = CFrame.new(-5787.002, 75.826, 8651.699)},
    ["Fishman Warrior"] = {Quest = "FishmanQuest", Lv = 1, QuestPos = CFrame.new(61122.652, 18.497, 1569.399), MobPos = CFrame.new(60844.105, 98.462, 1298.398)},
    ["Fishman Commando"] = {Quest = "FishmanQuest", Lv = 2, QuestPos = CFrame.new(61122.652, 18.497, 1569.399), MobPos = CFrame.new(61738.398, 64.207, 1433.837)},
    ["God's Guard"] = {Quest = "SkyExp1Quest", Lv = 1, QuestPos = CFrame.new(-4721.860, 845.302, -1953.848), MobPos = CFrame.new(-4628.049, 866.928, -1931.235)},
    ["Shanda"] = {Quest = "SkyExp1Quest", Lv = 2, QuestPos = CFrame.new(-7863.159, 5545.519, -378.422), MobPos = CFrame.new(-7685.147, 5601.075, -441.388)},
    ["Royal Squad"] = {Quest = "SkyExp2Quest", Lv = 1, QuestPos = CFrame.new(-7903.382, 5635.989, -1410.923), MobPos = CFrame.new(-7654.251, 5637.107, -1407.755)},
    ["Royal Soldier"] = {Quest = "SkyExp2Quest", Lv = 2, QuestPos = CFrame.new(-7903.382, 5635.989, -1410.923), MobPos = CFrame.new(-7760.410, 5679.907, -1884.811)},
    ["Galley Pirate"] = {Quest = "FountainQuest", Lv = 1, QuestPos = CFrame.new(5258.278, 38.526, 4050.044), MobPos = CFrame.new(5557.168, 152.327, 3998.775)},
    ["Galley Captain"] = {Quest = "FountainQuest", Lv = 2, QuestPos = CFrame.new(5258.278, 38.526, 4050.044), MobPos = CFrame.new(5677.677, 92.786, 4966.632)},
    
    -- Second Sea
    ["Raider"] = {Quest = "Area1Quest", Lv = 1, QuestPos = CFrame.new(-427.725, 72.996, 1835.942), MobPos = CFrame.new(68.874, 93.635, 2429.675)},
    ["Mercenary"] = {Quest = "Area1Quest", Lv = 2, QuestPos = CFrame.new(-427.725, 72.996, 1835.942), MobPos = CFrame.new(-864.850, 122.471, 1453.150)},
    ["Swan Pirate"] = {Quest = "Area2Quest", Lv = 1, QuestPos = CFrame.new(635.611, 73.096, 917.812), MobPos = CFrame.new(1065.366, 137.640, 1324.379)},
    ["Factory Staff"] = {Quest = "Area2Quest", Lv = 2, QuestPos = CFrame.new(635.611, 73.096, 917.812), MobPos = CFrame.new(533.220, 128.468, 355.626)},
    ["Marine Lieutenant"] = {Quest = "MarineQuest3", Lv = 1, QuestPos = CFrame.new(-2440.993, 73.041, -3217.708), MobPos = CFrame.new(-2489.262, 84.613, -3151.883)},
    ["Marine Captain"] = {Quest = "MarineQuest3", Lv = 2, QuestPos = CFrame.new(-2440.993, 73.041, -3217.708), MobPos = CFrame.new(-2335.202, 79.786, -3245.867)},
    ["Zombie"] = {Quest = "ZombieQuest", Lv = 1, QuestPos = CFrame.new(-5494.341, 48.505, -794.590), MobPos = CFrame.new(-5536.497, 101.085, -835.590)},
    ["Vampire"] = {Quest = "ZombieQuest", Lv = 2, QuestPos = CFrame.new(-5494.341, 48.505, -794.590), MobPos = CFrame.new(-5806.109, 16.722, -1164.438)},
    ["Snow Trooper"] = {Quest = "SnowMountainQuest", Lv = 1, QuestPos = CFrame.new(607.059, 401.447, -5370.554), MobPos = CFrame.new(535.210, 432.742, -5484.916)},
    ["Winter Warrior"] = {Quest = "SnowMountainQuest", Lv = 2, QuestPos = CFrame.new(607.059, 401.447, -5370.554), MobPos = CFrame.new(1234.444, 456.954, -5174.130)},
    ["Lab Subordinate"] = {Quest = "IceSideQuest", Lv = 1, QuestPos = CFrame.new(-6061.841, 15.926, -4902.038), MobPos = CFrame.new(-5720.557, 63.309, -4784.610)},
    ["Horned Warrior"] = {Quest = "IceSideQuest", Lv = 2, QuestPos = CFrame.new(-6061.841, 15.926, -4902.038), MobPos = CFrame.new(-6292.751, 91.181, -5502.649)},
    ["Magma Ninja"] = {Quest = "FireSideQuest", Lv = 1, QuestPos = CFrame.new(-5429.047, 15.977, -5297.961), MobPos = CFrame.new(-5461.838, 130.363, -5836.470)},
    ["Lava Pirate"] = {Quest = "FireSideQuest", Lv = 2, QuestPos = CFrame.new(-5429.047, 15.977, -5297.961), MobPos = CFrame.new(-5251.188, 55.164, -4774.409)},
    ["Ship Deckhand"] = {Quest = "ShipQuest1", Lv = 1, QuestPos = CFrame.new(1040.292, 125.082, 32911.039), MobPos = CFrame.new(921.123, 125.983, 33088.328)},
    ["Ship Engineer"] = {Quest = "ShipQuest1", Lv = 2, QuestPos = CFrame.new(1040.292, 125.082, 32911.039), MobPos = CFrame.new(886.281, 40.477, 32800.832)},
    ["Ship Steward"] = {Quest = "ShipQuest2", Lv = 1, QuestPos = CFrame.new(971.420, 125.082, 33245.542), MobPos = CFrame.new(943.855, 129.581, 33444.367)},
    ["Ship Officer"] = {Quest = "ShipQuest2", Lv = 2, QuestPos = CFrame.new(971.420, 125.082, 33245.542), MobPos = CFrame.new(955.384, 181.083, 33331.890)},
    ["Arctic Warrior"] = {Quest = "FrostQuest", Lv = 1, QuestPos = CFrame.new(5668.137, 28.202, -6484.600), MobPos = CFrame.new(5935.454, 77.260, -6472.756)},
    ["Snow Lurker"] = {Quest = "FrostQuest", Lv = 2, QuestPos = CFrame.new(5668.137, 28.202, -6484.600), MobPos = CFrame.new(5628.482, 57.574, -6618.348)},
    ["Sea Soldier"] = {Quest = "ForgottenQuest", Lv = 1, QuestPos = CFrame.new(-3054.582, 236.872, -10147.790), MobPos = CFrame.new(-3185.015, 58.789, -9663.606)},
    ["Water Fighter"] = {Quest = "ForgottenQuest", Lv = 2, QuestPos = CFrame.new(-3054.582, 236.872, -10147.790), MobPos = CFrame.new(-3262.930, 298.690, -10552.529)},
    
    -- Third Sea
    ["Pirate Millionaire"] = {Quest = "PiratePortQuest", Lv = 1, QuestPos = CFrame.new(-450.104, 107.681, 5950.726), MobPos = CFrame.new(-193.992, 56.125, 5755.788)},
    ["Pistol Billionaire"] = {Quest = "PiratePortQuest", Lv = 2, QuestPos = CFrame.new(-450.104, 107.681, 5950.726), MobPos = CFrame.new(-188.144, 84.496, 6337.041)},
    ["Dragon Crew Warrior"] = {Quest = "DragonCrewQuest", Lv = 1, QuestPos = CFrame.new(6735.110, 126.990, -711.097), MobPos = CFrame.new(6615.233, 50.847, -978.934)},
    ["Dragon Crew Archer"] = {Quest = "DragonCrewQuest", Lv = 2, QuestPos = CFrame.new(6735.110, 126.990, -711.097), MobPos = CFrame.new(6818.589, 483.718, 512.726)},
    ["Hydra Enforcer"] = {Quest = "VenomCrewQuest", Lv = 1, QuestPos = CFrame.new(5446.879, 601.629, 749.456), MobPos = CFrame.new(4547.115, 1001.602, 334.195)},
    ["Venomous Assailant"] = {Quest = "VenomCrewQuest", Lv = 2, QuestPos = CFrame.new(5446.879, 601.629, 749.456), MobPos = CFrame.new(4637.885, 1077.855, 882.418)},
    ["Marine Commodore"] = {Quest = "MarineTreeIsland", Lv = 1, QuestPos = CFrame.new(2179.988, 28.731, -6740.055), MobPos = CFrame.new(2198.006, 128.710, -7109.504)},
    ["Marine Rear Admiral"] = {Quest = "MarineTreeIsland", Lv = 2, QuestPos = CFrame.new(2179.988, 28.731, -6740.055), MobPos = CFrame.new(3294.314, 385.411, -7048.634)},
    ["Fishman Raider"] = {Quest = "DeepForestIsland3", Lv = 1, QuestPos = CFrame.new(-10582.759, 331.788, -8757.666), MobPos = CFrame.new(-10553.268, 521.384, -8176.945)},
    ["Fishman Captain"] = {Quest = "DeepForestIsland3", Lv = 2, QuestPos = CFrame.new(-10583.099, 331.788, -8759.463), MobPos = CFrame.new(-10789.401, 427.186, -9131.442)},
    ["Forest Pirate"] = {Quest = "DeepForestIsland", Lv = 1, QuestPos = CFrame.new(-13232.662, 332.403, -7626.481), MobPos = CFrame.new(-13489.397, 400.303, -7770.251)},
    ["Mythological Pirate"] = {Quest = "DeepForestIsland", Lv = 2, QuestPos = CFrame.new(-13232.662, 332.403, -7626.481), MobPos = CFrame.new(-13508.616, 582.462, -6985.303)},
    ["Jungle Pirate"] = {Quest = "DeepForestIsland2", Lv = 1, QuestPos = CFrame.new(-12682.096, 390.886, -9902.124), MobPos = CFrame.new(-12267.103, 459.752, -10277.200)},
    ["Musketeer Pirate"] = {Quest = "DeepForestIsland2", Lv = 2, QuestPos = CFrame.new(-12682.096, 390.886, -9902.124), MobPos = CFrame.new(-13291.507, 520.473, -9904.638)},
    ["Reborn Skeleton"] = {Quest = "HauntedQuest1", Lv = 1, QuestPos = CFrame.new(-9480.807, 142.130, 5566.373), MobPos = CFrame.new(-8761.771, 183.431, 6168.333)},
    ["Living Zombie"] = {Quest = "HauntedQuest1", Lv = 2, QuestPos = CFrame.new(-9480.807, 142.130, 5566.373), MobPos = CFrame.new(-10103.752, 238.565, 6179.759)},
    ["Demonic Soul"] = {Quest = "HauntedQuest2", Lv = 1, QuestPos = CFrame.new(-9516.993, 178.006, 6078.465), MobPos = CFrame.new(-9712.031, 204.695, 6193.322)},
    ["Posessed Mummy"] = {Quest = "HauntedQuest2", Lv = 2, QuestPos = CFrame.new(-9516.993, 178.006, 6078.465), MobPos = CFrame.new(-9545.776, 69.619, 6339.561)},
    ["Peanut Scout"] = {Quest = "NutsIslandQuest", Lv = 1, QuestPos = CFrame.new(-2105.531, 37.249, -10195.508), MobPos = CFrame.new(-2150.587, 122.497, -10358.994)},
    ["Peanut President"] = {Quest = "NutsIslandQuest", Lv = 2, QuestPos = CFrame.new(-2105.531, 37.249, -10195.508), MobPos = CFrame.new(-2150.587, 122.497, -10358.994)},
    ["Ice Cream Chef"] = {Quest = "IceCreamIslandQuest", Lv = 1, QuestPos = CFrame.new(-819.376, 64.925, -10967.283), MobPos = CFrame.new(-789.941, 209.382, -11009.980)},
    ["Ice Cream Commander"] = {Quest = "IceCreamIslandQuest", Lv = 2, QuestPos = CFrame.new(-819.376, 64.925, -10967.283), MobPos = CFrame.new(-789.941, 209.382, -11009.980)},
    ["Cookie Crafter"] = {Quest = "CakeQuest1", Lv = 1, QuestPos = CFrame.new(-2022.298, 36.927, -12030.976), MobPos = CFrame.new(-2321.712, 36.699, -12216.787)},
    ["Cake Guard"] = {Quest = "CakeQuest1", Lv = 2, QuestPos = CFrame.new(-2022.298, 36.927, -12030.976), MobPos = CFrame.new(-1418.110, 36.671, -12255.732)},
    ["Baking Staff"] = {Quest = "CakeQuest2", Lv = 1, QuestPos = CFrame.new(-1928.317, 37.729, -12840.626), MobPos = CFrame.new(-1980.438, 36.671, -12983.841)},
    ["Head Baker"] = {Quest = "CakeQuest2", Lv = 2, QuestPos = CFrame.new(-1928.317, 37.729, -12840.626), MobPos = CFrame.new(-2251.579, 52.271, -13033.396)},
    ["Cocoa Warrior"] = {Quest = "ChocQuest1", Lv = 1, QuestPos = CFrame.new(231.75, 23.900, -12200.292), MobPos = CFrame.new(167.978, 26.225, -12238.874)},
    ["Chocolate Bar Battler"] = {Quest = "ChocQuest1", Lv = 2, QuestPos = CFrame.new(231.75, 23.900, -12200.292), MobPos = CFrame.new(701.312, 25.582, -12708.214)},
    ["Sweet Thief"] = {Quest = "ChocQuest2", Lv = 1, QuestPos = CFrame.new(151.198, 23.890, -12774.617), MobPos = CFrame.new(-140.258, 25.582, -12652.311)},
    ["Candy Rebel"] = {Quest = "ChocQuest2", Lv = 2, QuestPos = CFrame.new(151.198, 23.890, -12774.617), MobPos = CFrame.new(47.923, 25.582, -13029.240)},
    ["Candy Pirate"] = {Quest = "CandyQuest1", Lv = 1, QuestPos = CFrame.new(-1149.328, 13.575, -14445.614), MobPos = CFrame.new(-1437.563, 17.148, -14385.693)},
    ["Snow Demon"] = {Quest = "CandyQuest1", Lv = 2, QuestPos = CFrame.new(-1149.328, 13.575, -14445.614), MobPos = CFrame.new(-916.222, 17.148, -14638.812)},
    ["Isle Outlaw"] = {Quest = "TikiQuest1", Lv = 1, QuestPos = CFrame.new(-16549.890, 55.686, -179.913), MobPos = CFrame.new(-16162.819, 11.686, -96.454)},
    ["Island Boy"] = {Quest = "TikiQuest1", Lv = 2, QuestPos = CFrame.new(-16549.890, 55.686, -179.913), MobPos = CFrame.new(-16357.312, 20.632, 1005.648)},
    ["Sun-kissed Warrior"] = {Quest = "TikiQuest2", Lv = 1, QuestPos = CFrame.new(-16541.021, 54.770, 1051.461), MobPos = CFrame.new(-16357.312, 20.632, 1005.648)},
    ["Isle Champion"] = {Quest = "TikiQuest2", Lv = 2, QuestPos = CFrame.new(-16541.021, 54.770, 1051.461), MobPos = CFrame.new(-16848.941, 21.686, 1041.449)},
    ["Serpent Hunter"] = {Quest = "TikiQuest3", Lv = 1, QuestPos = CFrame.new(-16665.191, 104.596, 1579.694), MobPos = CFrame.new(-16621.414, 121.406, 1290.688)},
    ["Skull Slayer"] = {Quest = "TikiQuest3", Lv = 2, QuestPos = CFrame.new(-16665.191, 104.596, 1579.694), MobPos = CFrame.new(-16811.570, 84.625, 1542.235)},
}

-- Level to Mob mapping
local LevelToMob = {
    -- Sea 1
    {MaxLevel = 9, Mob = "Bandit"},
    {MaxLevel = 14, Mob = "Monkey"},
    {MaxLevel = 29, Mob = "Gorilla"},
    {MaxLevel = 39, Mob = "Pirate"},
    {MaxLevel = 59, Mob = "Brute"},
    {MaxLevel = 74, Mob = "Desert Bandit"},
    {MaxLevel = 89, Mob = "Desert Officer"},
    {MaxLevel = 99, Mob = "Snow Bandit"},
    {MaxLevel = 119, Mob = "Snowman"},
    {MaxLevel = 149, Mob = "Chief Petty Officer"},
    {MaxLevel = 174, Mob = "Sky Bandit"},
    {MaxLevel = 189, Mob = "Dark Master"},
    {MaxLevel = 209, Mob = "Prisoner"},
    {MaxLevel = 249, Mob = "Dangerous Prisoner"},
    {MaxLevel = 274, Mob = "Toga Warrior"},
    {MaxLevel = 299, Mob = "Gladiator"},
    {MaxLevel = 324, Mob = "Military Soldier"},
    {MaxLevel = 374, Mob = "Military Spy"},
    {MaxLevel = 399, Mob = "Fishman Warrior"},
    {MaxLevel = 449, Mob = "Fishman Commando"},
    {MaxLevel = 474, Mob = "God's Guard"},
    {MaxLevel = 524, Mob = "Shanda"},
    {MaxLevel = 549, Mob = "Royal Squad"},
    {MaxLevel = 624, Mob = "Royal Soldier"},
    {MaxLevel = 649, Mob = "Galley Pirate"},
    {MaxLevel = 699, Mob = "Galley Captain"},
    -- Sea 2
    {MaxLevel = 724, Mob = "Raider"},
    {MaxLevel = 774, Mob = "Mercenary"},
    {MaxLevel = 799, Mob = "Swan Pirate"},
    {MaxLevel = 874, Mob = "Factory Staff"},
    {MaxLevel = 899, Mob = "Marine Lieutenant"},
    {MaxLevel = 949, Mob = "Marine Captain"},
    {MaxLevel = 974, Mob = "Zombie"},
    {MaxLevel = 999, Mob = "Vampire"},
    {MaxLevel = 1049, Mob = "Snow Trooper"},
    {MaxLevel = 1099, Mob = "Winter Warrior"},
    {MaxLevel = 1124, Mob = "Lab Subordinate"},
    {MaxLevel = 1174, Mob = "Horned Warrior"},
    {MaxLevel = 1199, Mob = "Magma Ninja"},
    {MaxLevel = 1249, Mob = "Lava Pirate"},
    {MaxLevel = 1274, Mob = "Ship Deckhand"},
    {MaxLevel = 1299, Mob = "Ship Engineer"},
    {MaxLevel = 1324, Mob = "Ship Steward"},
    {MaxLevel = 1349, Mob = "Ship Officer"},
    {MaxLevel = 1374, Mob = "Arctic Warrior"},
    {MaxLevel = 1424, Mob = "Snow Lurker"},
    {MaxLevel = 1449, Mob = "Sea Soldier"},
    {MaxLevel = 1499, Mob = "Water Fighter"},
    -- Sea 3
    {MaxLevel = 1524, Mob = "Pirate Millionaire"},
    {MaxLevel = 1574, Mob = "Pistol Billionaire"},
    {MaxLevel = 1599, Mob = "Dragon Crew Warrior"},
    {MaxLevel = 1624, Mob = "Dragon Crew Archer"},
    {MaxLevel = 1649, Mob = "Hydra Enforcer"},
    {MaxLevel = 1699, Mob = "Venomous Assailant"},
    {MaxLevel = 1724, Mob = "Marine Commodore"},
    {MaxLevel = 1774, Mob = "Marine Rear Admiral"},
    {MaxLevel = 1799, Mob = "Fishman Raider"},
    {MaxLevel = 1824, Mob = "Fishman Captain"},
    {MaxLevel = 1849, Mob = "Forest Pirate"},
    {MaxLevel = 1899, Mob = "Mythological Pirate"},
    {MaxLevel = 1924, Mob = "Jungle Pirate"},
    {MaxLevel = 1974, Mob = "Musketeer Pirate"},
    {MaxLevel = 1999, Mob = "Reborn Skeleton"},
    {MaxLevel = 2024, Mob = "Living Zombie"},
    {MaxLevel = 2049, Mob = "Demonic Soul"},
    {MaxLevel = 2074, Mob = "Posessed Mummy"},
    {MaxLevel = 2099, Mob = "Peanut Scout"},
    {MaxLevel = 2124, Mob = "Peanut President"},
    {MaxLevel = 2149, Mob = "Ice Cream Chef"},
    {MaxLevel = 2199, Mob = "Ice Cream Commander"},
    {MaxLevel = 2224, Mob = "Cookie Crafter"},
    {MaxLevel = 2249, Mob = "Cake Guard"},
    {MaxLevel = 2274, Mob = "Baking Staff"},
    {MaxLevel = 2299, Mob = "Head Baker"},
    {MaxLevel = 2324, Mob = "Cocoa Warrior"},
    {MaxLevel = 2349, Mob = "Chocolate Bar Battler"},
    {MaxLevel = 2374, Mob = "Sweet Thief"},
    {MaxLevel = 2400, Mob = "Candy Rebel"},
    {MaxLevel = 2424, Mob = "Candy Pirate"},
    {MaxLevel = 2449, Mob = "Snow Demon"},
    {MaxLevel = 2474, Mob = "Isle Outlaw"},
    {MaxLevel = 2499, Mob = "Island Boy"},
    {MaxLevel = 2524, Mob = "Sun-kissed Warrior"},
    {MaxLevel = 2549, Mob = "Isle Champion"},
    {MaxLevel = 2574, Mob = "Serpent Hunter"},
    {MaxLevel = 9999, Mob = "Skull Slayer"},
}

local function GetMobByLevel()
    local level = LocalPlayer.Data.Level.Value
    for _, data in ipairs(LevelToMob) do
        if level <= data.MaxLevel then
            return data.Mob
        end
    end
    return "Skull Slayer"
end

local function SetMobData(mobName)
    local data = QuestData[mobName]
    if data then
        Ms = mobName
        NameQuest = data.Quest
        QuestLv = data.Lv
        NameMon = mobName
        CFrameQ = data.QuestPos
        CFrameMon = data.MobPos
        return true
    end
    return false
end

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

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
    
    local startTime = tick()
    while (hrp.Position - targetCFrame.Position).Magnitude > 5 do
        if not _G.AutoLevel and not _G.AutoNear then
            tween:Cancel()
            return
        end
        if tick() - startTime > tweenTime + 2 then break end
        task.wait(_G.FastDelay)
    end
end

local function EquipWeapon(weaponName)
    if not GetCharacter() then return end
    if not weaponName or weaponName == "None" then return end
    
    local backpack = LocalPlayer.Backpack
    local tool = backpack:FindFirstChild(weaponName) or Character:FindFirstChild(weaponName)
    
    if tool and tool:IsA("Tool") and not Character:FindFirstChild(tool.Name) then
        Character.Humanoid:EquipTool(tool)
    end
end

local function AutoHaki()
    if not _G.AutoHaki then return end
    if not GetCharacter() then return end
    
    if not Character:FindFirstChild("HasBuso") then
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
        end)
    end
end

local function Attack()
    if not GetCharacter() then return end
    
    pcall(function()
        local tool = Character:FindFirstChildOfClass("Tool")
        if tool then
            local remote = tool:FindFirstChild("LeftClickRemote") or tool:FindFirstChild("RemoteEvent")
            if remote then remote:FireServer() end
            tool:Activate()
        end
    end)
    
    if _G.FastAttack then
        pcall(function()
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            task.wait()
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
        end)
    end
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

local function HasQuest()
    local questUI = LocalPlayer.PlayerGui:FindFirstChild("Main")
    if questUI and questUI:FindFirstChild("Quest") then
        return questUI.Quest.Visible
    end
    return false
end

local function IsCorrectQuest()
    local questUI = LocalPlayer.PlayerGui:FindFirstChild("Main")
    if questUI and questUI:FindFirstChild("Quest") and questUI.Quest:FindFirstChild("Container") then
        local container = questUI.Quest.Container
        if container:FindFirstChild("QuestTitle") and container.QuestTitle:FindFirstChild("Title") then
            return string.find(container.QuestTitle.Title.Text, NameMon) ~= nil
        end
    end
    return false
end

local function StartQuest()
    pcall(function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
    end)
end

local function AbandonQuest()
    pcall(function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
    end)
end

-- ============================================================================
-- MAIN FARMING LOOPS
-- ============================================================================

spawn(function()
    while task.wait(_G.FastDelay) do
        if _G.AutoLevel then
            pcall(function()
                if not GetCharacter() then return end
                
                -- Update mob based on selection or level
                if SelectedMob and SelectedMob ~= "Auto (By Level)" then
                    SetMobData(SelectedMob)
                else
                    SetMobData(GetMobByLevel())
                end
                
                if not HasQuest() or not IsCorrectQuest() then
                    AbandonQuest()
                    Tween(CFrameQ)
                    if (CFrameQ.Position - Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        StartQuest()
                        task.wait(0.5)
                    end
                else
                    local mob = FindMob(Ms)
                    if mob then
                        repeat
                            if not _G.AutoLevel then break end
                            if not GetCharacter() then break end
                            if not mob or not mob.Parent then break end
                            if mob.Humanoid.Health <= 0 then break end
                            
                            task.wait(_G.FastDelay)
                            AutoHaki()
                            EquipWeapon(SelectWeapon)
                            Attack()
                            BringMob(mob)
                            Tween(mob.HumanoidRootPart.CFrame * Pos)
                        until not _G.AutoLevel or not mob.Parent or mob.Humanoid.Health <= 0
                    else
                        Tween(CFrameMon)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(_G.FastDelay) do
        if _G.AutoNear then
            pcall(function()
                if not GetCharacter() then return end
                
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if not _G.AutoNear then break end
                    
                    if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") then
                        if mob.Humanoid.Health > 0 then
                            local dist = (Character.HumanoidRootPart.Position - mob.HumanoidRootPart.Position).Magnitude
                            
                            if dist <= 5000 then
                                repeat
                                    if not _G.AutoNear then break end
                                    if not GetCharacter() then break end
                                    if not mob or not mob.Parent then break end
                                    if mob.Humanoid.Health <= 0 then break end
                                    
                                    task.wait(_G.FastDelay)
                                    AutoHaki()
                                    EquipWeapon(SelectWeapon)
                                    Attack()
                                    BringMob(mob)
                                    Tween(mob.HumanoidRootPart.CFrame * Pos)
                                until not _G.AutoNear or not mob.Parent or mob.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Anti-AFK
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
-- CREATE UI WITH FAMYYLIB
-- ============================================================================

local Window = Library:CreateWindow({
    Title = "FAMYY PRIVATE",
    Subtitle = "Blox Fruits v7.0 | " .. CurrentSea,
    Size = UDim2.new(0, 300, 0, 500),
    Keybind = Enum.KeyCode.RightShift
})

-- ==================== FARM TAB ====================
local FarmTab = Window:CreateTab("Farm")

local FarmSection = FarmTab:CreateSection("Auto Farm", true)

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

FarmSection:AddDropdown({
    Label = "Select Mob",
    Options = MobList,
    Default = "Auto (By Level)",
    Callback = function(v)
        SelectedMob = v
        if v ~= "Auto (By Level)" then
            SetMobData(v)
        end
    end
})

FarmSection:AddDropdown({
    Label = "Weapon",
    Options = GetWeaponList(),
    Default = "None",
    Callback = function(v)
        SelectWeapon = v
    end
})

local CombatSection = FarmTab:CreateSection("Combat", true)

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

-- ==================== SETTINGS TAB ====================
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
    Min = 0.05,
    Max = 0.5,
    Default = 0.1,
    Step = 0.05,
    Suffix = "s",
    Callback = function(v)
        _G.FastDelay = v
    end
})

local TeleportSection = SettingsTab:CreateSection("Teleport", true)

TeleportSection:AddButton({
    Label = "TP to Quest",
    Style = "primary",
    Callback = function()
        if SelectedMob and SelectedMob ~= "Auto (By Level)" then
            SetMobData(SelectedMob)
        else
            SetMobData(GetMobByLevel())
        end
        if GetCharacter() then
            Character.HumanoidRootPart.CFrame = CFrameQ
        end
    end
})

TeleportSection:AddButton({
    Label = "TP to Mob",
    Style = "secondary",
    Callback = function()
        if SelectedMob and SelectedMob ~= "Auto (By Level)" then
            SetMobData(SelectedMob)
        else
            SetMobData(GetMobByLevel())
        end
        if GetCharacter() then
            Character.HumanoidRootPart.CFrame = CFrameMon
        end
    end
})

-- ==================== INFO TAB ====================
local InfoTab = Window:CreateTab("Info")

local InfoSection = InfoTab:CreateSection("Status", true)

InfoSection:AddLabel({Text = "Level: Loading..."})
InfoSection:AddLabel({Text = "Mob: Loading..."})
InfoSection:AddLabel({Text = "Quest: Loading..."})

-- Update status
spawn(function()
    while task.wait(1) do
        pcall(function()
            local level = LocalPlayer.Data.Level.Value
            local mob = SelectedMob == "Auto (By Level)" and GetMobByLevel() or SelectedMob
            SetMobData(mob)
            
            -- Update labels (simplified since we can't easily update existing labels)
        end)
    end
end)

local CreditsSection = InfoTab:CreateSection("Credits", true)

CreditsSection:AddLabel({Text = "FAMYY PRIVATE v7.0"})
CreditsSection:AddLabel({Text = "Based on Monster Hub mechanics"})
CreditsSection:AddLabel({Text = "Supports all 3 Seas"})

-- ============================================================================
-- INITIALIZE
-- ============================================================================

print("")
print("╔══════════════════════════════════════════╗")
print("║       FAMYY PRIVATE v7.0                 ║")
print("║       Blox Fruits - FamyyLib UI          ║")
print("╠══════════════════════════════════════════╣")
print("║  Sea: " .. CurrentSea .. string.rep(" ", 33 - #CurrentSea) .. "║")
print("║  Press RightShift to toggle UI           ║")
print("╚══════════════════════════════════════════╝")
print("")

Window.Notify("Loaded!", "Famyy Private v7.0 - " .. CurrentSea, 3, "success")
