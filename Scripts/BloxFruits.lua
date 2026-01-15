--[[
    ███████╗ █████╗ ███╗   ███╗██╗   ██╗██╗   ██╗    ██████╗ ██████╗ ██╗██╗   ██╗ █████╗ ████████╗███████╗
    ██╔════╝██╔══██╗████╗ ████║╚██╗ ██╔╝╚██╗ ██╔╝    ██╔══██╗██╔══██╗██║██║   ██║██╔══██╗╚══██╔══╝██╔════╝
    █████╗  ███████║██╔████╔██║ ╚████╔╝  ╚████╔╝     ██████╔╝██████╔╝██║██║   ██║███████║   ██║   █████╗  
    ██╔══╝  ██╔══██║██║╚██╔╝██║  ╚██╔╝    ╚██╔╝      ██╔═══╝ ██╔══██╗██║╚██╗ ██╔╝██╔══██║   ██║   ██╔══╝  
    ██║     ██║  ██║██║ ╚═╝ ██║   ██║      ██║       ██║     ██║  ██║██║ ╚████╔╝ ██║  ██║   ██║   ███████╗
    ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝      ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═╝   ╚═╝   ╚══════╝
    
    FAMYY PRIVATE - Blox Fruits Script
    Version: 6.0 (Based on proven Monster Hub mechanics)
    
    Supports: All 3 Seas (First, Second, Third)
    Executor: Solara compatible
]]

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
local IsRunning = false

-- ============================================================================
-- QUEST DATABASE - ALL 3 SEAS
-- ============================================================================

local function CheckLevel()
    local Level = LocalPlayer.Data.Level.Value
    
    if Sea1 then
        -- ==================== FIRST SEA ====================
        if Level <= 9 then
            Ms = "Bandit"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.938, 16.455, 1547.784)
            CFrameMon = CFrame.new(1038.553, 41.296, 1576.509)
        elseif Level <= 14 then
            Ms = "Monkey"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(-1601.655, 36.852, 153.388)
            CFrameMon = CFrame.new(-1448.144, 50.851, 63.607)
        elseif Level <= 29 then
            Ms = "Gorilla"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(-1601.655, 36.852, 153.388)
            CFrameMon = CFrame.new(-1142.648, 40.462, -515.392)
        elseif Level <= 39 then
            Ms = "Pirate"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(-1140.176, 4.752, 3827.405)
            CFrameMon = CFrame.new(-1201.088, 40.628, 3857.596)
        elseif Level <= 59 then
            Ms = "Brute"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(-1140.176, 4.752, 3827.405)
            CFrameMon = CFrame.new(-1387.532, 24.592, 4100.957)
        elseif Level <= 74 then
            Ms = "Desert Bandit"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.517, 6.438, 4390.149)
            CFrameMon = CFrame.new(984.998, 16.109, 4417.910)
        elseif Level <= 89 then
            Ms = "Desert Officer"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.517, 6.438, 4390.149)
            CFrameMon = CFrame.new(1547.151, 14.452, 4381.800)
        elseif Level <= 99 then
            Ms = "Snow Bandit"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.807, 87.272, -1298.357)
            CFrameMon = CFrame.new(1356.302, 105.768, -1328.241)
        elseif Level <= 119 then
            Ms = "Snowman"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.807, 87.272, -1298.357)
            CFrameMon = CFrame.new(1218.795, 138.011, -1488.026)
        elseif Level <= 149 then
            Ms = "Chief Petty Officer"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(-5035.496, 28.677, 4324.184)
            CFrameMon = CFrame.new(-4931.155, 65.793, 4121.839)
        elseif Level <= 174 then
            Ms = "Sky Bandit"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4842.137, 717.695, -2623.048)
            CFrameMon = CFrame.new(-4955.641, 365.463, -2908.186)
        elseif Level <= 189 then
            Ms = "Dark Master"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4842.137, 717.695, -2623.048)
            CFrameMon = CFrame.new(-5148.165, 439.045, -2332.961)
        elseif Level <= 209 then
            Ms = "Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 1
            NameMon = "Prisoner"
            CFrameQ = CFrame.new(5310.605, 0.350, 474.946)
            CFrameMon = CFrame.new(4937.318, 0.332, 649.574)
        elseif Level <= 249 then
            Ms = "Dangerous Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 2
            NameMon = "Dangerous Prisoner"
            CFrameQ = CFrame.new(5310.605, 0.350, 474.946)
            CFrameMon = CFrame.new(5099.662, 0.351, 1055.758)
        elseif Level <= 274 then
            Ms = "Toga Warrior"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1577.789, 7.415, -2984.483)
            CFrameMon = CFrame.new(-1872.516, 49.080, -2913.810)
        elseif Level <= 299 then
            Ms = "Gladiator"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1577.789, 7.415, -2984.483)
            CFrameMon = CFrame.new(-1521.374, 81.203, -3066.313)
        elseif Level <= 324 then
            Ms = "Military Soldier"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.115, 12.262, 8517.003)
            CFrameMon = CFrame.new(-5369.000, 61.243, 8556.492)
        elseif Level <= 374 then
            Ms = "Military Spy"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.115, 12.262, 8517.003)
            CFrameMon = CFrame.new(-5787.002, 75.826, 8651.699)
        elseif Level <= 399 then
            Ms = "Fishman Warrior"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.652, 18.497, 1569.399)
            CFrameMon = CFrame.new(60844.105, 98.462, 1298.398)
        elseif Level <= 449 then
            Ms = "Fishman Commando"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.652, 18.497, 1569.399)
            CFrameMon = CFrame.new(61738.398, 64.207, 1433.837)
        elseif Level <= 474 then
            Ms = "God's Guard"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.860, 845.302, -1953.848)
            CFrameMon = CFrame.new(-4628.049, 866.928, -1931.235)
        elseif Level <= 524 then
            Ms = "Shanda"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.159, 5545.519, -378.422)
            CFrameMon = CFrame.new(-7685.147, 5601.075, -441.388)
        elseif Level <= 549 then
            Ms = "Royal Squad"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7903.382, 5635.989, -1410.923)
            CFrameMon = CFrame.new(-7654.251, 5637.107, -1407.755)
        elseif Level <= 624 then
            Ms = "Royal Soldier"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7903.382, 5635.989, -1410.923)
            CFrameMon = CFrame.new(-7760.410, 5679.907, -1884.811)
        elseif Level <= 649 then
            Ms = "Galley Pirate"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.278, 38.526, 4050.044)
            CFrameMon = CFrame.new(5557.168, 152.327, 3998.775)
        else
            Ms = "Galley Captain"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.278, 38.526, 4050.044)
            CFrameMon = CFrame.new(5677.677, 92.786, 4966.632)
        end
        
    elseif Sea2 then
        -- ==================== SECOND SEA ====================
        if Level <= 724 then
            Ms = "Raider"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-427.725, 72.996, 1835.942)
            CFrameMon = CFrame.new(68.874, 93.635, 2429.675)
        elseif Level <= 774 then
            Ms = "Mercenary"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.725, 72.996, 1835.942)
            CFrameMon = CFrame.new(-864.850, 122.471, 1453.150)
        elseif Level <= 799 then
            Ms = "Swan Pirate"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.611, 73.096, 917.812)
            CFrameMon = CFrame.new(1065.366, 137.640, 1324.379)
        elseif Level <= 874 then
            Ms = "Factory Staff"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.611, 73.096, 917.812)
            CFrameMon = CFrame.new(533.220, 128.468, 355.626)
        elseif Level <= 899 then
            Ms = "Marine Lieutenant"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.993, 73.041, -3217.708)
            CFrameMon = CFrame.new(-2489.262, 84.613, -3151.883)
        elseif Level <= 949 then
            Ms = "Marine Captain"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.993, 73.041, -3217.708)
            CFrameMon = CFrame.new(-2335.202, 79.786, -3245.867)
        elseif Level <= 974 then
            Ms = "Zombie"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.341, 48.505, -794.590)
            CFrameMon = CFrame.new(-5536.497, 101.085, -835.590)
        elseif Level <= 999 then
            Ms = "Vampire"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.341, 48.505, -794.590)
            CFrameMon = CFrame.new(-5806.109, 16.722, -1164.438)
        elseif Level <= 1049 then
            Ms = "Snow Trooper"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.059, 401.447, -5370.554)
            CFrameMon = CFrame.new(535.210, 432.742, -5484.916)
        elseif Level <= 1099 then
            Ms = "Winter Warrior"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.059, 401.447, -5370.554)
            CFrameMon = CFrame.new(1234.444, 456.954, -5174.130)
        elseif Level <= 1124 then
            Ms = "Lab Subordinate"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841, 15.926, -4902.038)
            CFrameMon = CFrame.new(-5720.557, 63.309, -4784.610)
        elseif Level <= 1174 then
            Ms = "Horned Warrior"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841, 15.926, -4902.038)
            CFrameMon = CFrame.new(-6292.751, 91.181, -5502.649)
        elseif Level <= 1199 then
            Ms = "Magma Ninja"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.047, 15.977, -5297.961)
            CFrameMon = CFrame.new(-5461.838, 130.363, -5836.470)
        elseif Level <= 1249 then
            Ms = "Lava Pirate"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.047, 15.977, -5297.961)
            CFrameMon = CFrame.new(-5251.188, 55.164, -4774.409)
        elseif Level <= 1274 then
            Ms = "Ship Deckhand"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.292, 125.082, 32911.039)
            CFrameMon = CFrame.new(921.123, 125.983, 33088.328)
        elseif Level <= 1299 then
            Ms = "Ship Engineer"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.292, 125.082, 32911.039)
            CFrameMon = CFrame.new(886.281, 40.477, 32800.832)
        elseif Level <= 1324 then
            Ms = "Ship Steward"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.420, 125.082, 33245.542)
            CFrameMon = CFrame.new(943.855, 129.581, 33444.367)
        elseif Level <= 1349 then
            Ms = "Ship Officer"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.420, 125.082, 33245.542)
            CFrameMon = CFrame.new(955.384, 181.083, 33331.890)
        elseif Level <= 1374 then
            Ms = "Arctic Warrior"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.137, 28.202, -6484.600)
            CFrameMon = CFrame.new(5935.454, 77.260, -6472.756)
        elseif Level <= 1424 then
            Ms = "Snow Lurker"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.137, 28.202, -6484.600)
            CFrameMon = CFrame.new(5628.482, 57.574, -6618.348)
        elseif Level <= 1449 then
            Ms = "Sea Soldier"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.582, 236.872, -10147.790)
            CFrameMon = CFrame.new(-3185.015, 58.789, -9663.606)
        else
            Ms = "Water Fighter"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.582, 236.872, -10147.790)
            CFrameMon = CFrame.new(-3262.930, 298.690, -10552.529)
        end
        
    elseif Sea3 then
        -- ==================== THIRD SEA ====================
        if Level <= 1524 then
            Ms = "Pirate Millionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 1
            NameMon = "Pirate Millionaire"
            CFrameQ = CFrame.new(-450.104, 107.681, 5950.726)
            CFrameMon = CFrame.new(-193.992, 56.125, 5755.788)
        elseif Level <= 1574 then
            Ms = "Pistol Billionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 2
            NameMon = "Pistol Billionaire"
            CFrameQ = CFrame.new(-450.104, 107.681, 5950.726)
            CFrameMon = CFrame.new(-188.144, 84.496, 6337.041)
        elseif Level <= 1599 then
            Ms = "Dragon Crew Warrior"
            NameQuest = "DragonCrewQuest"
            QuestLv = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQ = CFrame.new(6735.110, 126.990, -711.097)
            CFrameMon = CFrame.new(6615.233, 50.847, -978.934)
        elseif Level <= 1624 then
            Ms = "Dragon Crew Archer"
            NameQuest = "DragonCrewQuest"
            QuestLv = 2
            NameMon = "Dragon Crew Archer"
            CFrameQ = CFrame.new(6735.110, 126.990, -711.097)
            CFrameMon = CFrame.new(6818.589, 483.718, 512.726)
        elseif Level <= 1649 then
            Ms = "Hydra Enforcer"
            NameQuest = "VenomCrewQuest"
            QuestLv = 1
            NameMon = "Hydra Enforcer"
            CFrameQ = CFrame.new(5446.879, 601.629, 749.456)
            CFrameMon = CFrame.new(4547.115, 1001.602, 334.195)
        elseif Level <= 1699 then
            Ms = "Venomous Assailant"
            NameQuest = "VenomCrewQuest"
            QuestLv = 2
            NameMon = "Venomous Assailant"
            CFrameQ = CFrame.new(5446.879, 601.629, 749.456)
            CFrameMon = CFrame.new(4637.885, 1077.855, 882.418)
        elseif Level <= 1724 then
            Ms = "Marine Commodore"
            NameQuest = "MarineTreeIsland"
            QuestLv = 1
            NameMon = "Marine Commodore"
            CFrameQ = CFrame.new(2179.988, 28.731, -6740.055)
            CFrameMon = CFrame.new(2198.006, 128.710, -7109.504)
        elseif Level <= 1774 then
            Ms = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            QuestLv = 2
            NameMon = "Marine Rear Admiral"
            CFrameQ = CFrame.new(2179.988, 28.731, -6740.055)
            CFrameMon = CFrame.new(3294.314, 385.411, -7048.634)
        elseif Level <= 1799 then
            Ms = "Fishman Raider"
            NameQuest = "DeepForestIsland3"
            QuestLv = 1
            NameMon = "Fishman Raider"
            CFrameQ = CFrame.new(-10582.759, 331.788, -8757.666)
            CFrameMon = CFrame.new(-10553.268, 521.384, -8176.945)
        elseif Level <= 1824 then
            Ms = "Fishman Captain"
            NameQuest = "DeepForestIsland3"
            QuestLv = 2
            NameMon = "Fishman Captain"
            CFrameQ = CFrame.new(-10583.099, 331.788, -8759.463)
            CFrameMon = CFrame.new(-10789.401, 427.186, -9131.442)
        elseif Level <= 1849 then
            Ms = "Forest Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 1
            NameMon = "Forest Pirate"
            CFrameQ = CFrame.new(-13232.662, 332.403, -7626.481)
            CFrameMon = CFrame.new(-13489.397, 400.303, -7770.251)
        elseif Level <= 1899 then
            Ms = "Mythological Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 2
            NameMon = "Mythological Pirate"
            CFrameQ = CFrame.new(-13232.662, 332.403, -7626.481)
            CFrameMon = CFrame.new(-13508.616, 582.462, -6985.303)
        elseif Level <= 1924 then
            Ms = "Jungle Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 1
            NameMon = "Jungle Pirate"
            CFrameQ = CFrame.new(-12682.096, 390.886, -9902.124)
            CFrameMon = CFrame.new(-12267.103, 459.752, -10277.200)
        elseif Level <= 1974 then
            Ms = "Musketeer Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 2
            NameMon = "Musketeer Pirate"
            CFrameQ = CFrame.new(-12682.096, 390.886, -9902.124)
            CFrameMon = CFrame.new(-13291.507, 520.473, -9904.638)
        elseif Level <= 1999 then
            Ms = "Reborn Skeleton"
            NameQuest = "HauntedQuest1"
            QuestLv = 1
            NameMon = "Reborn Skeleton"
            CFrameQ = CFrame.new(-9480.807, 142.130, 5566.373)
            CFrameMon = CFrame.new(-8761.771, 183.431, 6168.333)
        elseif Level <= 2024 then
            Ms = "Living Zombie"
            NameQuest = "HauntedQuest1"
            QuestLv = 2
            NameMon = "Living Zombie"
            CFrameQ = CFrame.new(-9480.807, 142.130, 5566.373)
            CFrameMon = CFrame.new(-10103.752, 238.565, 6179.759)
        elseif Level <= 2049 then
            Ms = "Demonic Soul"
            NameQuest = "HauntedQuest2"
            QuestLv = 1
            NameMon = "Demonic Soul"
            CFrameQ = CFrame.new(-9516.993, 178.006, 6078.465)
            CFrameMon = CFrame.new(-9712.031, 204.695, 6193.322)
        elseif Level <= 2074 then
            Ms = "Posessed Mummy"
            NameQuest = "HauntedQuest2"
            QuestLv = 2
            NameMon = "Posessed Mummy"
            CFrameQ = CFrame.new(-9516.993, 178.006, 6078.465)
            CFrameMon = CFrame.new(-9545.776, 69.619, 6339.561)
        elseif Level <= 2099 then
            Ms = "Peanut Scout"
            NameQuest = "NutsIslandQuest"
            QuestLv = 1
            NameMon = "Peanut Scout"
            CFrameQ = CFrame.new(-2105.531, 37.249, -10195.508)
            CFrameMon = CFrame.new(-2150.587, 122.497, -10358.994)
        elseif Level <= 2124 then
            Ms = "Peanut President"
            NameQuest = "NutsIslandQuest"
            QuestLv = 2
            NameMon = "Peanut President"
            CFrameQ = CFrame.new(-2105.531, 37.249, -10195.508)
            CFrameMon = CFrame.new(-2150.587, 122.497, -10358.994)
        elseif Level <= 2149 then
            Ms = "Ice Cream Chef"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 1
            NameMon = "Ice Cream Chef"
            CFrameQ = CFrame.new(-819.376, 64.925, -10967.283)
            CFrameMon = CFrame.new(-789.941, 209.382, -11009.980)
        elseif Level <= 2199 then
            Ms = "Ice Cream Commander"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 2
            NameMon = "Ice Cream Commander"
            CFrameQ = CFrame.new(-819.376, 64.925, -10967.283)
            CFrameMon = CFrame.new(-789.941, 209.382, -11009.980)
        elseif Level <= 2224 then
            Ms = "Cookie Crafter"
            NameQuest = "CakeQuest1"
            QuestLv = 1
            NameMon = "Cookie Crafter"
            CFrameQ = CFrame.new(-2022.298, 36.927, -12030.976)
            CFrameMon = CFrame.new(-2321.712, 36.699, -12216.787)
        elseif Level <= 2249 then
            Ms = "Cake Guard"
            NameQuest = "CakeQuest1"
            QuestLv = 2
            NameMon = "Cake Guard"
            CFrameQ = CFrame.new(-2022.298, 36.927, -12030.976)
            CFrameMon = CFrame.new(-1418.110, 36.671, -12255.732)
        elseif Level <= 2274 then
            Ms = "Baking Staff"
            NameQuest = "CakeQuest2"
            QuestLv = 1
            NameMon = "Baking Staff"
            CFrameQ = CFrame.new(-1928.317, 37.729, -12840.626)
            CFrameMon = CFrame.new(-1980.438, 36.671, -12983.841)
        elseif Level <= 2299 then
            Ms = "Head Baker"
            NameQuest = "CakeQuest2"
            QuestLv = 2
            NameMon = "Head Baker"
            CFrameQ = CFrame.new(-1928.317, 37.729, -12840.626)
            CFrameMon = CFrame.new(-2251.579, 52.271, -13033.396)
        elseif Level <= 2324 then
            Ms = "Cocoa Warrior"
            NameQuest = "ChocQuest1"
            QuestLv = 1
            NameMon = "Cocoa Warrior"
            CFrameQ = CFrame.new(231.75, 23.900, -12200.292)
            CFrameMon = CFrame.new(167.978, 26.225, -12238.874)
        elseif Level <= 2349 then
            Ms = "Chocolate Bar Battler"
            NameQuest = "ChocQuest1"
            QuestLv = 2
            NameMon = "Chocolate Bar Battler"
            CFrameQ = CFrame.new(231.75, 23.900, -12200.292)
            CFrameMon = CFrame.new(701.312, 25.582, -12708.214)
        elseif Level <= 2374 then
            Ms = "Sweet Thief"
            NameQuest = "ChocQuest2"
            QuestLv = 1
            NameMon = "Sweet Thief"
            CFrameQ = CFrame.new(151.198, 23.890, -12774.617)
            CFrameMon = CFrame.new(-140.258, 25.582, -12652.311)
        elseif Level <= 2400 then
            Ms = "Candy Rebel"
            NameQuest = "ChocQuest2"
            QuestLv = 2
            NameMon = "Candy Rebel"
            CFrameQ = CFrame.new(151.198, 23.890, -12774.617)
            CFrameMon = CFrame.new(47.923, 25.582, -13029.240)
        elseif Level <= 2424 then
            Ms = "Candy Pirate"
            NameQuest = "CandyQuest1"
            QuestLv = 1
            NameMon = "Candy Pirate"
            CFrameQ = CFrame.new(-1149.328, 13.575, -14445.614)
            CFrameMon = CFrame.new(-1437.563, 17.148, -14385.693)
        elseif Level <= 2449 then
            Ms = "Snow Demon"
            NameQuest = "CandyQuest1"
            QuestLv = 2
            NameMon = "Snow Demon"
            CFrameQ = CFrame.new(-1149.328, 13.575, -14445.614)
            CFrameMon = CFrame.new(-916.222, 17.148, -14638.812)
        elseif Level <= 2474 then
            Ms = "Isle Outlaw"
            NameQuest = "TikiQuest1"
            QuestLv = 1
            NameMon = "Isle Outlaw"
            CFrameQ = CFrame.new(-16549.890, 55.686, -179.913)
            CFrameMon = CFrame.new(-16162.819, 11.686, -96.454)
        elseif Level <= 2499 then
            Ms = "Island Boy"
            NameQuest = "TikiQuest1"
            QuestLv = 2
            NameMon = "Island Boy"
            CFrameQ = CFrame.new(-16549.890, 55.686, -179.913)
            CFrameMon = CFrame.new(-16357.312, 20.632, 1005.648)
        elseif Level <= 2524 then
            Ms = "Sun-kissed Warrior"
            NameQuest = "TikiQuest2"
            QuestLv = 1
            NameMon = "Sun-kissed Warrior"
            CFrameQ = CFrame.new(-16541.021, 54.770, 1051.461)
            CFrameMon = CFrame.new(-16357.312, 20.632, 1005.648)
        elseif Level <= 2549 then
            Ms = "Isle Champion"
            NameQuest = "TikiQuest2"
            QuestLv = 2
            NameMon = "Isle Champion"
            CFrameQ = CFrame.new(-16541.021, 54.770, 1051.461)
            CFrameMon = CFrame.new(-16848.941, 21.686, 1041.449)
        elseif Level <= 2574 then
            Ms = "Serpent Hunter"
            NameQuest = "TikiQuest3"
            QuestLv = 1
            NameMon = "Serpent Hunter"
            CFrameQ = CFrame.new(-16665.191, 104.596, 1579.694)
            CFrameMon = CFrame.new(-16621.414, 121.406, 1290.688)
        else
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
    
    -- Wait for tween or abort if disabled
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

local function Teleport(targetCFrame)
    if not GetCharacter() then return end
    
    local hrp = Character.HumanoidRootPart
    for i = 1, 5 do
        hrp.CFrame = targetCFrame
        task.wait(0.1)
    end
end

local function EquipWeapon(weaponName)
    if not GetCharacter() then return end
    if not weaponName then return end
    
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

-- ============================================================================
-- ATTACK FUNCTION (Using proven methods)
-- ============================================================================

local function Attack()
    if not GetCharacter() then return end
    
    -- Method 1: Try LeftClickRemote (works on most executors)
    pcall(function()
        local tool = Character:FindFirstChildOfClass("Tool")
        if tool then
            local remote = tool:FindFirstChild("LeftClickRemote") or tool:FindFirstChild("RemoteEvent")
            if remote then
                remote:FireServer()
            end
        end
    end)
    
    -- Method 2: Activate tool
    pcall(function()
        local tool = Character:FindFirstChildOfClass("Tool")
        if tool then
            tool:Activate()
        end
    end)
    
    -- Method 3: VirtualInputManager click (fallback)
    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end)
end

-- ============================================================================
-- MOB HANDLING
-- ============================================================================

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
-- QUEST FUNCTIONS
-- ============================================================================

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
-- MAIN FARMING LOOP
-- ============================================================================

spawn(function()
    while task.wait(_G.FastDelay) do
        if _G.AutoLevel then
            pcall(function()
                if not GetCharacter() then return end
                
                CheckLevel()
                
                -- Check if we need to get/switch quest
                if not HasQuest() or not IsCorrectQuest() then
                    AbandonQuest()
                    Tween(CFrameQ)
                    
                    if (CFrameQ.Position - Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        StartQuest()
                        task.wait(0.5)
                    end
                else
                    -- We have correct quest - farm mobs
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
                            
                            -- Position above mob
                            Tween(mob.HumanoidRootPart.CFrame * Pos)
                            
                        until not _G.AutoLevel or not mob.Parent or mob.Humanoid.Health <= 0
                    else
                        -- No mob found, go to spawn area
                        Tween(CFrameMon)
                    end
                end
            end)
        end
    end
end)

-- ============================================================================
-- AUTO NEAR (Farm any nearby mob)
-- ============================================================================

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
-- SIMPLE GUI (Works on all executors)
-- ============================================================================

local function CreateGUI()
    -- Remove old GUI
    pcall(function()
        if game.CoreGui:FindFirstChild("FamyyBloxFruits") then
            game.CoreGui:FindFirstChild("FamyyBloxFruits"):Destroy()
        end
        if LocalPlayer.PlayerGui:FindFirstChild("FamyyBloxFruits") then
            LocalPlayer.PlayerGui:FindFirstChild("FamyyBloxFruits"):Destroy()
        end
    end)
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FamyyBloxFruits"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    pcall(function() ScreenGui.Parent = game.CoreGui end)
    if not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    
    -- Main Frame
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Size = UDim2.new(0, 300, 0, 350)
    Main.Position = UDim2.new(0, 20, 0.5, -175)
    Main.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    Main.BorderSizePixel = 0
    Main.Parent = ScreenGui
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Main
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    Title.Text = "FAMYY PRIVATE v6.0 - " .. CurrentSea
    Title.TextColor3 = Color3.fromRGB(255, 100, 100)
    Title.TextSize = 14
    Title.Font = Enum.Font.GothamBold
    Title.Parent = Main
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 8)
    TitleCorner.Parent = Title
    
    -- Status Label
    local Status = Instance.new("TextLabel")
    Status.Name = "Status"
    Status.Size = UDim2.new(1, -20, 0, 50)
    Status.Position = UDim2.new(0, 10, 0, 45)
    Status.BackgroundTransparency = 1
    Status.Text = "Mob: None\nQuest: None"
    Status.TextColor3 = Color3.fromRGB(200, 200, 200)
    Status.TextSize = 11
    Status.Font = Enum.Font.Gotham
    Status.TextXAlignment = Enum.TextXAlignment.Left
    Status.TextYAlignment = Enum.TextYAlignment.Top
    Status.Parent = Main
    
    -- Buttons
    local function CreateToggle(name, text, posY, default)
        local btn = Instance.new("TextButton")
        btn.Name = name
        btn.Size = UDim2.new(1, -20, 0, 35)
        btn.Position = UDim2.new(0, 10, 0, posY)
        btn.BackgroundColor3 = default and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(80, 80, 90)
        btn.Text = text .. (default and " [ON]" or " [OFF]")
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 12
        btn.Font = Enum.Font.GothamBold
        btn.Parent = Main
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 4)
        corner.Parent = btn
        
        return btn
    end
    
    local AutoLevelBtn = CreateToggle("AutoLevel", "Auto Level", 100, false)
    local AutoNearBtn = CreateToggle("AutoNear", "Auto Near Mob", 140, false)
    local BringMobBtn = CreateToggle("BringMob", "Bring Mob", 180, true)
    local AutoHakiBtn = CreateToggle("AutoHaki", "Auto Haki", 220, true)
    
    -- Weapon dropdown label
    local WeaponLabel = Instance.new("TextLabel")
    WeaponLabel.Size = UDim2.new(1, -20, 0, 20)
    WeaponLabel.Position = UDim2.new(0, 10, 0, 265)
    WeaponLabel.BackgroundTransparency = 1
    WeaponLabel.Text = "Weapon: Click to select"
    WeaponLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    WeaponLabel.TextSize = 11
    WeaponLabel.Font = Enum.Font.Gotham
    WeaponLabel.TextXAlignment = Enum.TextXAlignment.Left
    WeaponLabel.Parent = Main
    
    local WeaponBtn = Instance.new("TextButton")
    WeaponBtn.Name = "Weapon"
    WeaponBtn.Size = UDim2.new(1, -20, 0, 30)
    WeaponBtn.Position = UDim2.new(0, 10, 0, 285)
    WeaponBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 150)
    WeaponBtn.Text = "Select Weapon"
    WeaponBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    WeaponBtn.TextSize = 11
    WeaponBtn.Font = Enum.Font.GothamBold
    WeaponBtn.Parent = Main
    
    local weaponCorner = Instance.new("UICorner")
    weaponCorner.CornerRadius = UDim.new(0, 4)
    weaponCorner.Parent = WeaponBtn
    
    -- Close button
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 25, 0, 25)
    CloseBtn.Position = UDim2.new(1, -30, 0, 7)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 14
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Parent = Title
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 4)
    closeCorner.Parent = CloseBtn
    
    -- Toggle functions
    local function UpdateButton(btn, state, text)
        btn.BackgroundColor3 = state and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(80, 80, 90)
        btn.Text = text .. (state and " [ON]" or " [OFF]")
    end
    
    AutoLevelBtn.MouseButton1Click:Connect(function()
        _G.AutoLevel = not _G.AutoLevel
        UpdateButton(AutoLevelBtn, _G.AutoLevel, "Auto Level")
    end)
    
    AutoNearBtn.MouseButton1Click:Connect(function()
        _G.AutoNear = not _G.AutoNear
        UpdateButton(AutoNearBtn, _G.AutoNear, "Auto Near Mob")
    end)
    
    BringMobBtn.MouseButton1Click:Connect(function()
        _G.BringMob = not _G.BringMob
        UpdateButton(BringMobBtn, _G.BringMob, "Bring Mob")
    end)
    
    AutoHakiBtn.MouseButton1Click:Connect(function()
        _G.AutoHaki = not _G.AutoHaki
        UpdateButton(AutoHakiBtn, _G.AutoHaki, "Auto Haki")
    end)
    
    -- Weapon selector
    local weaponOpen = false
    local weaponFrame = nil
    
    WeaponBtn.MouseButton1Click:Connect(function()
        if weaponOpen and weaponFrame then
            weaponFrame:Destroy()
            weaponOpen = false
            return
        end
        
        weaponFrame = Instance.new("Frame")
        weaponFrame.Size = UDim2.new(1, -20, 0, 150)
        weaponFrame.Position = UDim2.new(0, 10, 1, 5)
        weaponFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
        weaponFrame.Parent = Main
        
        local wfCorner = Instance.new("UICorner")
        wfCorner.CornerRadius = UDim.new(0, 4)
        wfCorner.Parent = weaponFrame
        
        local scroll = Instance.new("ScrollingFrame")
        scroll.Size = UDim2.new(1, -10, 1, -10)
        scroll.Position = UDim2.new(0, 5, 0, 5)
        scroll.BackgroundTransparency = 1
        scroll.ScrollBarThickness = 4
        scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        scroll.Parent = weaponFrame
        
        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0, 3)
        layout.Parent = scroll
        
        for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local toolBtn = Instance.new("TextButton")
                toolBtn.Size = UDim2.new(1, 0, 0, 25)
                toolBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
                toolBtn.Text = tool.Name
                toolBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                toolBtn.TextSize = 10
                toolBtn.Font = Enum.Font.Gotham
                toolBtn.Parent = scroll
                
                local tbCorner = Instance.new("UICorner")
                tbCorner.CornerRadius = UDim.new(0, 3)
                tbCorner.Parent = toolBtn
                
                toolBtn.MouseButton1Click:Connect(function()
                    SelectWeapon = tool.Name
                    WeaponBtn.Text = tool.Name
                    weaponFrame:Destroy()
                    weaponOpen = false
                end)
            end
        end
        
        scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
        weaponOpen = true
    end)
    
    CloseBtn.MouseButton1Click:Connect(function()
        _G.AutoLevel = false
        _G.AutoNear = false
        ScreenGui:Destroy()
    end)
    
    -- Make draggable
    local dragging, dragStart, startPos
    
    Title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
        end
    end)
    
    Title.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    -- Status updater
    spawn(function()
        while ScreenGui.Parent do
            task.wait(0.5)
            pcall(function()
                CheckLevel()
                Status.Text = "Mob: " .. Ms .. "\nQuest: " .. NameQuest .. " (Lv " .. QuestLv .. ")\nLevel: " .. LocalPlayer.Data.Level.Value
            end)
        end
    end)
    
    return ScreenGui
end

-- ============================================================================
-- INITIALIZE
-- ============================================================================

print("")
print("╔══════════════════════════════════════════╗")
print("║       FAMYY PRIVATE v6.0                 ║")
print("║       Blox Fruits Auto Farm              ║")
print("╠══════════════════════════════════════════╣")
print("║  Sea: " .. CurrentSea .. string.rep(" ", 33 - #CurrentSea) .. "║")
print("║  Based on proven Monster Hub mechanics   ║")
print("╚══════════════════════════════════════════╝")
print("")

CreateGUI()

print("[Famyy] Script loaded! Use the GUI to control features.")
