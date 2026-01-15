local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63, L64_64, L65_65, L66_66, L67_67, L68_68, L69_69, L70_70, L71_71, L72_72, L73_73, L74_74, L75_75, L76_76, L77_77, L78_78, L79_79, L80_80, L81_81, L82_82, L83_83, L84_84, L85_85, L86_86, L87_87, L88_88, L89_89, L90_90, L91_91, L92_92, L93_93, L94_94, L95_95, L96_96
L0_0 = loadstring
L1_1 = game
L2_2 = L1_1
L1_1 = L1_1.HttpGet
L3_3 = "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
L96_96 = L1_1(L2_2, L3_3)
L0_0 = L0_0(L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63, L64_64, L65_65, L66_66, L67_67, L68_68, L69_69, L70_70, L71_71, L72_72, L73_73, L74_74, L75_75, L76_76, L77_77, L78_78, L79_79, L80_80, L81_81, L82_82, L83_83, L84_84, L85_85, L86_86, L87_87, L88_88, L89_89, L90_90, L91_91, L92_92, L93_93, L94_94, L95_95, L96_96, L1_1(L2_2, L3_3))
L0_0 = L0_0()
L2_2 = L0_0
L1_1 = L0_0.CreateWindow
L3_3 = {}
L3_3.Title = "Monster Hub"
L3_3.SubTitle = "By Monster Roblox"
L3_3.TabWidth = 160
L3_3.Theme = "Aqua"
L3_3.Acrylic = false
L4_4 = UDim2
L4_4 = L4_4.fromOffset
L5_5 = 500
L6_6 = 320
L4_4 = L4_4(L5_5, L6_6)
L3_3.Size = L4_4
L4_4 = Enum
L4_4 = L4_4.KeyCode
L4_4 = L4_4.End
L3_3.MinimizeKey = L4_4
L1_1 = L1_1(L2_2, L3_3)
L2_2 = {}
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab Th\195\180ng Tin"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Info = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab C\195\160y"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Main = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab S\225\187\177 Ki\225\187\135n V\195\160 Bi\225\187\131n"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Sea = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab V\225\186\173t Ph\225\186\169m"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Item = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab C\195\160i \196\144\225\186\183t"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Setting = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab M\195\161y Ch\225\187\167"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Status = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab Ch\225\187\137 S\225\187\145"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Stats = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab Ng\198\176\225\187\157i Ch\198\161i"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Player = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab D\225\187\139ch Chuy\225\187\131n"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Teleport = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab Th\225\187\139 Gi\195\161c"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Visual = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab Tr\195\161i V\195\160 \196\144\225\187\139nh V\225\187\139"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Fruit = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab T\225\186\173p K\195\173ch"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Raid = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab T\225\187\153c V4"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Race = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = "Tab C\225\187\173a H\195\160ng"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Shop = L3_3
L4_4 = L1_1
L3_3 = L1_1.AddTab
L5_5 = {}
L5_5.Title = " Tab Kh\195\161c"
L3_3 = L3_3(L4_4, L5_5)
L2_2.Misc = L3_3
L3_3 = L0_0.Options
L4_4 = game
L4_4 = L4_4.PlaceId
if L4_4 == 2753915549 then
  L5_5 = true
  Sea1 = L5_5
elseif L4_4 == 4442272183 then
  L5_5 = true
  Sea2 = L5_5
elseif L4_4 == 7449423635 then
  L5_5 = true
  Sea3 = L5_5
else
  L5_5 = game
  L6_6 = L5_5
  L5_5 = L5_5.Shutdown
  L5_5(L6_6)
end
L5_5 = game
L6_6 = L5_5
L5_5 = L5_5.GetService
L7_7 = "Players"
L5_5 = L5_5(L6_6, L7_7)
L5_5 = L5_5.LocalPlayer
L5_5 = L5_5.Idled
L6_6 = L5_5
L5_5 = L5_5.connect
function L7_7()
  game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
  wait()
  game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end
L5_5(L6_6, L7_7)
L5_5 = false
Sea1 = L5_5
L5_5 = false
Sea2 = L5_5
L5_5 = false
Sea3 = L5_5
L5_5 = game
L5_5 = L5_5.PlaceId
if L5_5 == 2753915549 then
  L6_6 = true
  Sea1 = L6_6
elseif L5_5 == 4442272183 then
  L6_6 = true
  Sea2 = L6_6
elseif L5_5 == 7449423635 then
  L6_6 = true
  Sea3 = L6_6
end
function L6_6()
  if Sea1 then
    if game:GetService("Players").LocalPlayer.Data.Level.Value == 1 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 9 or SelectMonster == "Bandit" then
      Ms = "Bandit"
      NameQuest = "BanditQuest1"
      QuestLv = 1
      NameMon = "Bandit"
      CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
      CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 10 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 14 or SelectMonster == "Monkey" then
      Ms = "Monkey"
      NameQuest = "JungleQuest"
      QuestLv = 1
      NameMon = "Monkey"
      CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
      CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 15 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 29 or SelectMonster == "Gorilla" then
      Ms = "Gorilla"
      NameQuest = "JungleQuest"
      QuestLv = 2
      NameMon = "Gorilla"
      CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
      CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 30 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 39 or SelectMonster == "Pirate" then
      Ms = "Pirate"
      NameQuest = "BuggyQuest1"
      QuestLv = 1
      NameMon = "Pirate"
      CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
      CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 40 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 59 or SelectMonster == "Brute" then
      Ms = "Brute"
      NameQuest = "BuggyQuest1"
      QuestLv = 2
      NameMon = "Brute"
      CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
      CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 60 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 74 or SelectMonster == "Desert Bandit" then
      Ms = "Desert Bandit"
      NameQuest = "DesertQuest"
      QuestLv = 1
      NameMon = "Desert Bandit"
      CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
      CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 75 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 89 or SelectMonster == "Desert Officer" then
      Ms = "Desert Officer"
      NameQuest = "DesertQuest"
      QuestLv = 2
      NameMon = "Desert Officer"
      CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
      CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 90 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 99 or SelectMonster == "Snow Bandit" then
      Ms = "Snow Bandit"
      NameQuest = "SnowQuest"
      QuestLv = 1
      NameMon = "Snow Bandit"
      CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
      CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 100 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 119 or SelectMonster == "Snowman" then
      Ms = "Snowman"
      NameQuest = "SnowQuest"
      QuestLv = 2
      NameMon = "Snowman"
      CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
      CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 120 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 149 or SelectMonster == "Chief Petty Officer" then
      Ms = "Chief Petty Officer"
      NameQuest = "MarineQuest2"
      QuestLv = 1
      NameMon = "Chief Petty Officer"
      CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
      CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 150 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 174 or SelectMonster == "Sky Bandit" then
      Ms = "Sky Bandit"
      NameQuest = "SkyQuest"
      QuestLv = 1
      NameMon = "Sky Bandit"
      CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
      CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 175 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 189 or SelectMonster == "Dark Master" then
      Ms = "Dark Master"
      NameQuest = "SkyQuest"
      QuestLv = 2
      NameMon = "Dark Master"
      CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
      CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 190 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 209 or SelectMonster == "Prisoner" then
      Ms = "Prisoner"
      NameQuest = "PrisonerQuest"
      QuestLv = 1
      NameMon = "Prisoner"
      CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
      CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 210 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 249 or SelectMonster == "Dangerous Prisoner" then
      Ms = "Dangerous Prisoner"
      NameQuest = "PrisonerQuest"
      QuestLv = 2
      NameMon = "Dangerous Prisoner"
      CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
      CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 250 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 274 or SelectMonster == "Toga Warrior" then
      Ms = "Toga Warrior"
      NameQuest = "ColosseumQuest"
      QuestLv = 1
      NameMon = "Toga Warrior"
      CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
      CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 275 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 299 or SelectMonster == "Gladiator" then
      Ms = "Gladiator"
      NameQuest = "ColosseumQuest"
      QuestLv = 2
      NameMon = "Gladiator"
      CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
      CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 300 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 324 or SelectMonster == "Military Soldier" then
      Ms = "Military Soldier"
      NameQuest = "MagmaQuest"
      QuestLv = 1
      NameMon = "Military Soldier"
      CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
      CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 325 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 374 or SelectMonster == "Military Spy" then
      Ms = "Military Spy"
      NameQuest = "MagmaQuest"
      QuestLv = 2
      NameMon = "Military Spy"
      CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
      CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 375 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 399 or SelectMonster == "Fishman Warrior" then
      Ms = "Fishman Warrior"
      NameQuest = "FishmanQuest"
      QuestLv = 1
      NameMon = "Fishman Warrior"
      CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
      CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
      if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
      end
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 400 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 449 or SelectMonster == "Fishman Commando" then
      Ms = "Fishman Commando"
      NameQuest = "FishmanQuest"
      QuestLv = 2
      NameMon = "Fishman Commando"
      CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
      CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
      if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
      end
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 10 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 474 or SelectMonster == "God's Guard" then
      Ms = "God's Guard"
      NameQuest = "SkyExp1Quest"
      QuestLv = 1
      NameMon = "God's Guard"
      CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
      CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
      if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
      end
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 475 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 524 or SelectMonster == "Shanda" then
      Ms = "Shanda"
      NameQuest = "SkyExp1Quest"
      QuestLv = 2
      NameMon = "Shanda"
      CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
      CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
      if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
      end
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 525 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 549 or SelectMonster == "Royal Squad" then
      Ms = "Royal Squad"
      NameQuest = "SkyExp2Quest"
      QuestLv = 1
      NameMon = "Royal Squad"
      CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
      CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 550 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 624 or SelectMonster == "Royal Soldier" then
      Ms = "Royal Soldier"
      NameQuest = "SkyExp2Quest"
      QuestLv = 2
      NameMon = "Royal Soldier"
      CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
      CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 625 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 649 or SelectMonster == "Galley Pirate" then
      Ms = "Galley Pirate"
      NameQuest = "FountainQuest"
      QuestLv = 1
      NameMon = "Galley Pirate"
      CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
      CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 650 or SelectMonster == "Galley Captain" then
      Ms = "Galley Captain"
      NameQuest = "FountainQuest"
      QuestLv = 2
      NameMon = "Galley Captain"
      CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
      CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
    end
  end
  if Sea2 then
    if game:GetService("Players").LocalPlayer.Data.Level.Value == 700 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 724 or SelectMonster == "Raider" then
      Ms = "Raider"
      NameQuest = "Area1Quest"
      QuestLv = 1
      NameMon = "Raider"
      CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
      CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 725 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 774 or SelectMonster == "Mercenary" then
      Ms = "Mercenary"
      NameQuest = "Area1Quest"
      QuestLv = 2
      NameMon = "Mercenary"
      CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
      CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 775 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 799 or SelectMonster == "Swan Pirate" then
      Ms = "Swan Pirate"
      NameQuest = "Area2Quest"
      QuestLv = 1
      NameMon = "Swan Pirate"
      CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
      CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 800 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 874 or SelectMonster == "Factory Staff" then
      Ms = "Factory Staff"
      NameQuest = "Area2Quest"
      QuestLv = 2
      NameMon = "Factory Staff"
      CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
      CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 875 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 899 or SelectMonster == "Marine Lieutenan" then
      Ms = "Marine Lieutenant"
      NameQuest = "MarineQuest3"
      QuestLv = 1
      NameMon = "Marine Lieutenant"
      CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
      CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 900 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 949 or SelectMonster == "Marine Captain" then
      Ms = "Marine Captain"
      NameQuest = "MarineQuest3"
      QuestLv = 2
      NameMon = "Marine Captain"
      CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
      CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 950 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 974 or SelectMonster == "Zombie" then
      Ms = "Zombie"
      NameQuest = "ZombieQuest"
      QuestLv = 1
      NameMon = "Zombie"
      CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
      CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 975 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 999 or SelectMonster == "Vampire" then
      Ms = "Vampire"
      NameQuest = "ZombieQuest"
      QuestLv = 2
      NameMon = "Vampire"
      CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
      CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1000 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1049 or SelectMonster == "Snow Trooper" then
      Ms = "Snow Trooper"
      NameQuest = "SnowMountainQuest"
      QuestLv = 1
      NameMon = "Snow Trooper"
      CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
      CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1050 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1099 or SelectMonster == "Winter Warrior" then
      Ms = "Winter Warrior"
      NameQuest = "SnowMountainQuest"
      QuestLv = 2
      NameMon = "Winter Warrior"
      CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
      CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1100 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1124 or SelectMonster == "Lab Subordinate" then
      Ms = "Lab Subordinate"
      NameQuest = "IceSideQuest"
      QuestLv = 1
      NameMon = "Lab Subordinate"
      CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
      CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1125 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1174 or SelectMonster == "Horned Warrior" then
      Ms = "Horned Warrior"
      NameQuest = "IceSideQuest"
      QuestLv = 2
      NameMon = "Horned Warrior"
      CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
      CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1175 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1199 or SelectMonster == "Magma Ninja" then
      Ms = "Magma Ninja"
      NameQuest = "FireSideQuest"
      QuestLv = 1
      NameMon = "Magma Ninja"
      CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
      CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1200 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1249 or SelectMonster == "Lava Pirate" then
      Ms = "Lava Pirate"
      NameQuest = "FireSideQuest"
      QuestLv = 2
      NameMon = "Lava Pirate"
      CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
      CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1250 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1274 or SelectMonster == "Ship Deckhand" then
      Ms = "Ship Deckhand"
      NameQuest = "ShipQuest1"
      QuestLv = 1
      NameMon = "Ship Deckhand"
      CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
      CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
      if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      end
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1275 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1299 or SelectMonster == "Ship Engineer" then
      Ms = "Ship Engineer"
      NameQuest = "ShipQuest1"
      QuestLv = 2
      NameMon = "Ship Engineer"
      CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
      CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
      if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      end
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1300 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1324 or SelectMonster == "Ship Steward" then
      Ms = "Ship Steward"
      NameQuest = "ShipQuest2"
      QuestLv = 1
      NameMon = "Ship Steward"
      CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
      CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
      if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      end
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1325 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1349 or SelectMonster == "Ship Officer" then
      Ms = "Ship Officer"
      NameQuest = "ShipQuest2"
      QuestLv = 2
      NameMon = "Ship Officer"
      CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
      CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
      if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      end
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1350 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1374 or SelectMonster == "Arctic Warrior" then
      Ms = "Arctic Warrior"
      NameQuest = "FrostQuest"
      QuestLv = 1
      NameMon = "Arctic Warrior"
      CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
      CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
      if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
      end
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1375 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1424 or SelectMonster == "Snow Lurker" then
      Ms = "Snow Lurker"
      NameQuest = "FrostQuest"
      QuestLv = 2
      NameMon = "Snow Lurker"
      CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
      CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1425 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1449 or SelectMonster == "Sea Soldier" then
      Ms = "Sea Soldier"
      NameQuest = "ForgottenQuest"
      QuestLv = 1
      NameMon = "Sea Soldier"
      CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
      CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1450 or SelectMonster == "Water Fighter" then
      Ms = "Water Fighter"
      NameQuest = "ForgottenQuest"
      QuestLv = 2
      NameMon = "Water Fighter"
      CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
      CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
    end
  end
  if Sea3 then
    if game:GetService("Players").LocalPlayer.Data.Level.Value == 1500 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1524 or SelectMonster == "Pirate Millionaire" then
      Ms = "Pirate Millionaire"
      NameQuest = "PiratePortQuest"
      QuestLv = 1
      NameMon = "Pirate Millionaire"
      CFrameQ = CFrame.new(-450.1046447753906, 107.68145751953125, 5950.72607421875)
      CFrameMon = CFrame.new(-193.99227905273438, 56.12502670288086, 5755.7880859375)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1525 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1574 or SelectMonster == "Pistol Billionaire" then
      Ms = "Pistol Billionaire"
      NameQuest = "PiratePortQuest"
      QuestLv = 2
      NameMon = "Pistol Billionaire"
      CFrameQ = CFrame.new(-450.1046447753906, 107.68145751953125, 5950.72607421875)
      CFrameMon = CFrame.new(-188.14462280273438, 84.49613189697266, 6337.0419921875)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1575 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1599 or SelectMonster == "Dragon Crew Warrior" then
      Ms = "Dragon Crew Warrior"
      NameQuest = "DragonCrewQuest"
      QuestLv = 1
      NameMon = "Dragon Crew Warrior"
      CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, -711.0979614257812)
      CFrameMon = CFrame.new(6615.2333984375, 50.847679138183594, -978.93408203125)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1600 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1624 or SelectMonster == "Dragon Crew Archer" then
      Ms = "Dragon Crew Archer"
      NameQuest = "DragonCrewQuest"
      QuestLv = 2
      NameMon = "Dragon Crew Archer"
      CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, -711.0979614257812)
      CFrameMon = CFrame.new(6818.58935546875, 483.718994140625, 512.726806640625)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1625 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1649 or SelectMonster == "Hydra Enforcer" then
      Ms = "Hydra Enforcer"
      NameQuest = "VenomCrewQuest"
      QuestLv = 1
      NameMon = "Hydra Enforcer"
      CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
      CFrameMon = CFrame.new(4547.115234375, 1001.60205078125, 334.1954650878906)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1650 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1699 or SelectMonster == "Venomous Assailant" then
      Ms = "Venomous Assailant"
      NameQuest = "VenomCrewQuest"
      QuestLv = 2
      NameMon = "Venomous Assailant"
      CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
      CFrameMon = CFrame.new(4637.88525390625, 1077.85595703125, 882.4183959960938)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1700 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1724 or SelectMonster == "Marine Commodore" then
      Ms = "Marine Commodore"
      NameQuest = "MarineTreeIsland"
      QuestLv = 1
      NameMon = "Marine Commodore"
      CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
      CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1725 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1774 or SelectMonster == "Marine Rear Admiral" then
      Ms = "Marine Rear Admiral"
      NameQuest = "MarineTreeIsland"
      QuestLv = 2
      NameMon = "Marine Rear Admiral"
      CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
      CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1775 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1799 or SelectMonster == "Fishman Raider" then
      Ms = "Fishman Raider"
      NameQuest = "DeepForestIsland3"
      QuestLv = 1
      NameMon = "Fishman Raider"
      CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
      CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1800 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1824 or SelectMonster == "Fishman Captain" then
      Ms = "Fishman Captain"
      NameQuest = "DeepForestIsland3"
      QuestLv = 2
      NameMon = "Fishman Captain"
      CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
      CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1825 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1849 or SelectMonster == "Forest Pirate" then
      Ms = "Forest Pirate"
      NameQuest = "DeepForestIsland"
      QuestLv = 1
      NameMon = "Forest Pirate"
      CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
      CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1850 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1899 or SelectMonster == "Mythological Pirate" then
      Ms = "Mythological Pirate"
      NameQuest = "DeepForestIsland"
      QuestLv = 2
      NameMon = "Mythological Pirate"
      CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
      CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1900 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1924 or SelectMonster == "Jungle Pirate" then
      Ms = "Jungle Pirate"
      NameQuest = "DeepForestIsland2"
      QuestLv = 1
      NameMon = "Jungle Pirate"
      CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
      CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1925 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1974 or SelectMonster == "Musketeer Pirate" then
      Ms = "Musketeer Pirate"
      NameQuest = "DeepForestIsland2"
      QuestLv = 2
      NameMon = "Musketeer Pirate"
      CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
      CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 1975 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 1999 or SelectMonster == "Reborn Skeleton" then
      Ms = "Reborn Skeleton"
      NameQuest = "HauntedQuest1"
      QuestLv = 1
      NameMon = "Reborn Skeleton"
      CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225E-8, -0.999978542, 2.04920472E-8, 1, 4.51620679E-8, 0.999978542, -2.01955679E-8, -0.00655503059)
      CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732E-5, -0.208259016, -1.08073925E-6, 1, -7.20630269E-5, 0.208259016, 7.07080399E-5, 0.978073597)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2000 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2024 or SelectMonster == "Living Zombie" then
      Ms = "Living Zombie"
      NameQuest = "HauntedQuest1"
      QuestLv = 2
      NameMon = "Living Zombie"
      CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225E-8, -0.999978542, 2.04920472E-8, 1, 4.51620679E-8, 0.999978542, -2.01955679E-8, -0.00655503059)
      CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141E-8, 0.0324240364, -2.58006327E-8, 1, -6.06848474E-8, -0.0324240364, 5.98163865E-8, 0.999474227)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2025 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2049 or SelectMonster == "Demonic Soul" then
      Ms = "Demonic Soul"
      NameQuest = "HauntedQuest2"
      QuestLv = 1
      NameMon = "Demonic Soul"
      CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
      CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2050 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2074 or SelectMonster == "Posessed Mummy" then
      Ms = "Posessed Mummy"
      NameQuest = "HauntedQuest2"
      QuestLv = 2
      NameMon = "Posessed Mummy"
      CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
      CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2075 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2099 or SelectMonster == "Peanut Scout" then
      Ms = "Peanut Scout"
      NameQuest = "NutsIslandQuest"
      QuestLv = 1
      NameMon = "Peanut Scout"
      CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
      CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2100 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2124 or SelectMonster == "Peanut President" then
      Ms = "Peanut President"
      NameQuest = "NutsIslandQuest"
      QuestLv = 2
      NameMon = "Peanut President"
      CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
      CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2125 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2149 or SelectMonster == "Ice Cream Chef" then
      Ms = "Ice Cream Chef"
      NameQuest = "IceCreamIslandQuest"
      QuestLv = 1
      NameMon = "Ice Cream Chef"
      CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
      CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2150 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2199 or SelectMonster == "Ice Cream Commander" then
      Ms = "Ice Cream Commander"
      NameQuest = "IceCreamIslandQuest"
      QuestLv = 2
      NameMon = "Ice Cream Commander"
      CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
      CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2200 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2224 or SelectMonster == "Cookie Crafter" then
      Ms = "Cookie Crafter"
      NameQuest = "CakeQuest1"
      QuestLv = 1
      NameMon = "Cookie Crafter"
      CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
      CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2225 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2249 or SelectMonster == "Cake Guard" then
      Ms = "Cake Guard"
      NameQuest = "CakeQuest1"
      QuestLv = 2
      NameMon = "Cake Guard"
      CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
      CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2250 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2274 or SelectMonster == "Baking Staff" then
      Ms = "Baking Staff"
      NameQuest = "CakeQuest2"
      QuestLv = 1
      NameMon = "Baking Staff"
      CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
      CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2275 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2299 or SelectMonster == "Head Baker" then
      Ms = "Head Baker"
      NameQuest = "CakeQuest2"
      QuestLv = 2
      NameMon = "Head Baker"
      CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
      CFrameMon = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1, 0, 0.126466095, 0, -0.991971016)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2300 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2324 or SelectMonster == "Cocoa Warrior" then
      Ms = "Cocoa Warrior"
      NameQuest = "ChocQuest1"
      QuestLv = 1
      NameMon = "Cocoa Warrior"
      CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
      CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2325 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2349 or SelectMonster == "Chocolate Bar Battler" then
      Ms = "Chocolate Bar Battler"
      NameQuest = "ChocQuest1"
      QuestLv = 2
      NameMon = "Chocolate Bar Battler"
      CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
      CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2350 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2374 or SelectMonster == "Sweet Thief" then
      Ms = "Sweet Thief"
      NameQuest = "ChocQuest2"
      QuestLv = 1
      NameMon = "Sweet Thief"
      CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
      CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2375 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2400 or SelectMonster == "Candy Rebel" then
      Ms = "Candy Rebel"
      NameQuest = "ChocQuest2"
      QuestLv = 2
      NameMon = "Candy Rebel"
      CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
      CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, -0.819156051)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2400 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2424 or SelectMonster == "Candy Pirate" then
      Ms = "Candy Pirate"
      NameQuest = "CandyQuest1"
      QuestLv = 1
      NameMon = "Candy Pirate"
      CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
      CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2425 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2449 or SelectMonster == "Snow Demon" then
      Ms = "Snow Demon"
      NameQuest = "CandyQuest1"
      QuestLv = 2
      NameMon = "Snow Demon"
      CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
      CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2450 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2474 or SelectMonster == "Isle Outlaw" then
      Ms = "Isle Outlaw"
      NameQuest = "TikiQuest1"
      QuestLv = 1
      NameMon = "Isle Outlaw"
      CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632812)
      CFrameMon = CFrame.new(-16162.8193359375, 11.6863374710083, -96.45481872558594)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2475 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2499 or SelectMonster == "Island Boy" then
      Ms = "Island Boy"
      NameQuest = "TikiQuest1"
      QuestLv = 2
      NameMon = "Island Boy"
      CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632812)
      CFrameMon = CFrame.new(-16357.3125, 20.632822036743164, 1005.64892578125)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2500 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2524 or SelectMonster == "Sun-kissed Warrior" then
      Ms = "Sun-kissed Warrior"
      NameQuest = "TikiQuest2"
      QuestLv = 1
      NameMon = "Sun-kissed Warrior"
      CFrameQ = CFrame.new(-16541.021484375, 54.77081298828125, 1051.461181640625)
      CFrameMon = CFrame.new(-16357.3125, 20.632822036743164, 1005.64892578125)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2525 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2549 or SelectMonster == "Isle Champion" then
      Ms = "Isle Champion"
      NameQuest = "TikiQuest2"
      QuestLv = 2
      NameMon = "Isle Champion"
      CFrameQ = CFrame.new(-16541.021484375, 54.77081298828125, 1051.461181640625)
      CFrameMon = CFrame.new(-16848.94140625, 21.68633460998535, 1041.4490966796875)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2550 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2574 or SelectMonster == "Serpent Hunter" then
      Ms = "Serpent Hunter"
      NameQuest = "TikiQuest3"
      QuestLv = 1
      NameMon = "Serpent Hunter"
      CFrameQ = CFrame.new(-16665.19140625, 104.59640502929688, 1579.6943359375)
      CFrameMon = CFrame.new(-16621.4140625, 121.40631103515625, 1290.6881103515625)
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value == 2575 or game:GetService("Players").LocalPlayer.Data.Level.Value <= 2599 or SelectMonster == "Skull Slayer" or game:GetService("Players").LocalPlayer.Data.Level.Value == 2600 then
      Ms = "Skull Slayer"
      NameQuest = "TikiQuest3"
      QuestLv = 2
      NameMon = "Skull Slayer"
      CFrameQ = CFrame.new(-16665.19140625, 104.59640502929688, 1579.6943359375)
      CFrameMon = CFrame.new(-16811.5703125, 84.625244140625, 1542.235107421875)
    end
  end
end
CheckLevel = L6_6
L6_6 = Sea1
if L6_6 then
  L6_6 = {
    L7_7,
    L8_8,
    L9_9,
    L10_10,
    L11_11,
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    L25_25,
    L26_26,
    L27_27,
    L28_28,
    L29_29,
    L30_30,
    L31_31,
    L32_32
  }
  L7_7 = "Bandit"
  L8_8 = "Monkey"
  L9_9 = "Gorilla"
  L10_10 = "Pirate"
  L11_11 = "Brute"
  L12_12 = "Desert Bandit"
  L13_13 = "Desert Officer"
  L14_14 = "Snow Bandit"
  L15_15 = "Snowman"
  L16_16 = "Chief Petty Officer"
  L17_17 = "Sky Bandit"
  L18_18 = "Dark Master"
  L19_19 = "Prisoner"
  L20_20 = "Dangerous Prisoner"
  L21_21 = "Toga Warrior"
  L22_22 = "Gladiator"
  L23_23 = "Military Soldier"
  L24_24 = "Military Spy"
  L25_25 = "Fishman Warrior"
  L26_26 = "Fishman Commando"
  L27_27 = "God's Guard"
  L28_28 = "Shanda"
  L29_29 = "Royal Squad"
  L30_30 = "Royal Soldier"
  L31_31 = "Galley Pirate"
  L32_32 = "Galley Captain"
  tableMon = L6_6
else
  L6_6 = Sea2
  if L6_6 then
    L6_6 = {
      L7_7,
      L8_8,
      L9_9,
      L10_10,
      L11_11,
      L12_12,
      L13_13,
      L14_14,
      L15_15,
      L16_16,
      L17_17,
      L18_18,
      L19_19,
      L20_20,
      L21_21,
      L22_22,
      L23_23,
      L24_24,
      L25_25,
      L26_26,
      L27_27,
      L28_28
    }
    L7_7 = "Raider"
    L8_8 = "Mercenary"
    L9_9 = "Swan Pirate"
    L10_10 = "Factory Staff"
    L11_11 = "Marine Lieutenant"
    L12_12 = "Marine Captain"
    L13_13 = "Zombie"
    L14_14 = "Vampire"
    L15_15 = "Snow Trooper"
    L16_16 = "Winter Warrior"
    L17_17 = "Lab Subordinate"
    L18_18 = "Horned Warrior"
    L19_19 = "Magma Ninja"
    L20_20 = "Lava Pirate"
    L21_21 = "Ship Deckhand"
    L22_22 = "Ship Engineer"
    L23_23 = "Ship Steward"
    L24_24 = "Ship Officer"
    L25_25 = "Arctic Warrior"
    L26_26 = "Snow Lurker"
    L27_27 = "Sea Soldier"
    L28_28 = "Water Fighter"
    tableMon = L6_6
  else
    L6_6 = Sea3
    if L6_6 then
      L6_6 = {
        L7_7,
        L8_8,
        L9_9,
        L10_10,
        L11_11,
        L12_12,
        L13_13,
        L14_14,
        L15_15,
        L16_16,
        L17_17,
        L18_18,
        L19_19,
        L20_20,
        L21_21,
        L22_22,
        L23_23,
        L24_24,
        L25_25,
        L26_26,
        L27_27,
        L28_28,
        L29_29,
        L30_30,
        L31_31,
        L32_32,
        L33_33,
        L34_34,
        L35_35,
        L36_36,
        L37_37,
        L38_38,
        L39_39,
        L40_40,
        L41_41,
        L42_42,
        L43_43
      }
      L7_7 = "Pirate Millionaire"
      L8_8 = "Dragon Crew Warrior"
      L9_9 = "Dragon Crew Archer"
      L10_10 = "Hydra Enforcer"
      L11_11 = "Venomous Assailant"
      L12_12 = "Marine Commodore"
      L13_13 = "Marine Rear Admiral"
      L14_14 = "Fishman Raider"
      L15_15 = "Fishman Captain"
      L16_16 = "Forest Pirate"
      L17_17 = "Mythological Pirate"
      L18_18 = "Jungle Pirate"
      L19_19 = "Musketeer Pirate"
      L20_20 = "Reborn Skeleton"
      L21_21 = "Living Zombie"
      L22_22 = "Demonic Soul"
      L23_23 = "Posessed Mummy"
      L24_24 = "Peanut Scout"
      L25_25 = "Peanut President"
      L26_26 = "Ice Cream Chef"
      L27_27 = "Ice Cream Commander"
      L28_28 = "Cookie Crafter"
      L29_29 = "Cake Guard"
      L30_30 = "Baking Staff"
      L31_31 = "Head Baker"
      L32_32 = "Cocoa Warrior"
      L33_33 = "Chocolate Bar Battler"
      L34_34 = "Sweet Thief"
      L35_35 = "Candy Rebel"
      L36_36 = "Candy Pirate"
      L37_37 = "Snow Demon"
      L38_38 = "Isle Outlaw"
      L39_39 = "Island Boy"
      L40_40 = "Sun-kissed Warrior"
      L41_41 = "Isle Champion"
      L42_42 = "Serpent Hunter"
      L43_43 = "Skull Slayer"
      tableMon = L6_6
    end
  end
end
L6_6 = Sea1
if L6_6 then
  L6_6 = {
    L7_7,
    L8_8,
    L9_9,
    L10_10,
    L11_11,
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18
  }
  L7_7 = "Jungle"
  L8_8 = "Buggy"
  L9_9 = "Desert"
  L10_10 = "Snow"
  L11_11 = "Marine"
  L12_12 = "Sky"
  L13_13 = "Prison"
  L14_14 = "Colosseum"
  L15_15 = "Magma"
  L16_16 = "Fishman"
  L17_17 = "Sky Island"
  L18_18 = "Fountain"
  AreaList = L6_6
else
  L6_6 = Sea2
  if L6_6 then
    L6_6 = {
      L7_7,
      L8_8,
      L9_9,
      L10_10,
      L11_11,
      L12_12,
      L13_13,
      L14_14,
      L15_15
    }
    L7_7 = "Area 1"
    L8_8 = "Area 2"
    L9_9 = "Zombie"
    L10_10 = "Marine"
    L11_11 = "Snow Mountain"
    L12_12 = "Ice fire"
    L13_13 = "Ship"
    L14_14 = "Frost"
    L15_15 = "Forgotten"
    AreaList = L6_6
  else
    L6_6 = Sea3
    if L6_6 then
      L6_6 = {
        L7_7,
        L8_8,
        L9_9,
        L10_10,
        L11_11,
        L12_12,
        L13_13,
        L14_14,
        L15_15,
        L16_16,
        L17_17
      }
      L7_7 = "Pirate Port"
      L8_8 = "Amazon"
      L9_9 = "Marine Tree"
      L10_10 = "Deep Forest"
      L11_11 = "Haunted Castle"
      L12_12 = "Nut Island"
      L13_13 = "Ice Cream Island"
      L14_14 = "Cake Island"
      L15_15 = "Choco Island"
      L16_16 = "Candy Island"
      L17_17 = "Tiki Outpost"
      AreaList = L6_6
    end
  end
end
function L6_6()
  if Sea1 then
    if SelectBoss == "The Gorilla King" then
      BossMon = "The Gorilla King"
      NameBoss = "The Gorrila King"
      NameQuestBoss = "JungleQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$2,000
7,000 Exp.]]
      CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
      CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
    elseif SelectBoss == "Bobby" then
      BossMon = "Bobby"
      NameBoss = "Bobby"
      NameQuestBoss = "BuggyQuest1"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$8,000
35,000 Exp.]]
      CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
      CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
    elseif SelectBoss == "The Saw" then
      BossMon = "The Saw"
      NameBoss = "The Saw"
      CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
    elseif SelectBoss == "Yeti" then
      BossMon = "Yeti"
      NameBoss = "Yeti"
      NameQuestBoss = "SnowQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$10,000
180,000 Exp.]]
      CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
      CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
    elseif SelectBoss == "Mob Leader" then
      BossMon = "Mob Leader"
      NameBoss = "Mob Leader"
      CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
    elseif SelectBoss == "Vice Admiral" then
      BossMon = "Vice Admiral"
      NameBoss = "Vice Admiral"
      NameQuestBoss = "MarineQuest2"
      QuestLvBoss = 2
      RewardBoss = [[
Reward:
$10,000
180,000 Exp.]]
      CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
      CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
    elseif SelectBoss == "Saber Expert" then
      NameBoss = "Saber Expert"
      BossMon = "Saber Expert"
      CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
    elseif SelectBoss == "Warden" then
      BossMon = "Warden"
      NameBoss = "Warden"
      NameQuestBoss = "ImpelQuest"
      QuestLvBoss = 1
      RewardBoss = [[
Reward:
$6,000
850,000 Exp.]]
      CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401E-6, 0.975376427, -1.95412576E-5, 1, 9.03162072E-6, -0.975376427, -2.10519756E-5, 0.220546961)
      CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Chief Warden" then
      BossMon = "Chief Warden"
      NameBoss = "Chief Warden"
      NameQuestBoss = "ImpelQuest"
      QuestLvBoss = 2
      RewardBoss = [[
Reward:
$10,000
1,000,000 Exp.]]
      CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -6.2915677E-4, 0.939684749, 0.00191645394, 0.999998152, -2.80422337E-5, -0.939682961, 0.00181045406, 0.342041939)
      CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Swan" then
      BossMon = "Swan"
      NameBoss = "Swan"
      NameQuestBoss = "ImpelQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$15,000
1,600,000 Exp.]]
      CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
      CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Magma Admiral" then
      BossMon = "Magma Admiral"
      NameBoss = "Magma Admiral"
      NameQuestBoss = "MagmaQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$15,000
2,800,000 Exp.]]
      CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
      CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
    elseif SelectBoss == "Fishman Lord" then
      BossMon = "Fishman Lord"
      NameBoss = "Fishman Lord"
      NameQuestBoss = "FishmanQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$15,000
4,000,000 Exp.]]
      CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
      CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
    elseif SelectBoss == "Wysper" then
      BossMon = "Wysper"
      NameBoss = "Wysper"
      NameQuestBoss = "SkyExp1Quest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$15,000
4,800,000 Exp.]]
      CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
      CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
    elseif SelectBoss == "Thunder God" then
      BossMon = "Thunder God"
      NameBoss = "Thunder God"
      NameQuestBoss = "SkyExp2Quest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$20,000
5,800,000 Exp.]]
      CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
      CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
    elseif SelectBoss == "Cyborg" then
      BossMon = "Cyborg"
      NameBoss = "Cyborg"
      NameQuestBoss = "FountainQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$20,000
7,500,000 Exp.]]
      CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
      CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
    elseif SelectBoss == "Ice Admiral" then
      BossMon = "Ice Admiral"
      NameBoss = "Ice Admiral"
      CFrameBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
    elseif SelectBoss == "Greybeard" then
      BossMon = "Greybeard"
      NameBoss = "Greybeard"
      CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
    end
  end
  if Sea2 then
    if SelectBoss == "Diamond" then
      BossMon = "Diamond"
      NameBoss = "Diamond"
      NameQuestBoss = "Area1Quest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$25,000
9,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
      CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
    elseif SelectBoss == "Jeremy" then
      BossMon = "Jeremy"
      NameBoss = "Jeremy"
      NameQuestBoss = "Area2Quest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$25,000
11,500,000 Exp.]]
      CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
      CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
    elseif SelectBoss == "Fajita" then
      BossMon = "Fajita"
      NameBoss = "Fajita"
      NameQuestBoss = "MarineQuest3"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$25,000
15,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
      CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
    elseif SelectBoss == "Don Swan" then
      BossMon = "Don Swan"
      NameBoss = "Don Swan"
      CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
    elseif SelectBoss == "Smoke Admiral" then
      BossMon = "Smoke Admiral"
      NameBoss = "Smoke Admiral"
      NameQuestBoss = "IceSideQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$20,000
25,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
      CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
    elseif SelectBoss == "Awakened Ice Admiral" then
      BossMon = "Awakened Ice Admiral"
      NameBoss = "Awakened Ice Admiral"
      NameQuestBoss = "FrostQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$20,000
36,000,000 Exp.]]
      CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
      CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
    elseif SelectBoss == "Tide Keeper" then
      BossMon = "Tide Keeper"
      NameBoss = "Tide Keeper"
      NameQuestBoss = "ForgottenQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$12,500
38,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
      CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
    elseif SelectBoss == "Darkbeard" then
      BossMon = "Darkbeard"
      NameBoss = "Darkbeard"
      CFrameMon = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
    elseif SelectBoss == "Cursed Captain" then
      BossMon = "Cursed Captain"
      NameBoss = "Cursed Captain"
      CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
    elseif SelectBoss == "Order" then
      BossMon = "Order"
      NameBoss = "Order"
      CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
    end
  end
  if Sea3 then
    if SelectBoss == "Stone" then
      BossMon = "Stone"
      NameBoss = "Stone"
      NameQuestBoss = "PiratePortQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$25,000
40,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
      CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
    elseif SelectBoss == "Hydra Leader" then
      BossMon = "Hydra Leader"
      NameBoss = "Hydra Leader"
      NameQuestBoss = "VenomCrewQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$30,000
52,000,000 Exp.]]
      CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
      CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
    elseif SelectBoss == "Kilo Admiral" then
      BossMon = "Kilo Admiral"
      NameBoss = "Kilo Admiral"
      NameQuestBoss = "MarineTreeIsland"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$35,000
56,000,000 Exp.]]
      CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
      CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
    elseif SelectBoss == "Captain Elephant" then
      BossMon = "Captain Elephant"
      NameBoss = "Captain Elephant"
      NameQuestBoss = "DeepForestIsland"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$40,000
67,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
      CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
    elseif SelectBoss == "Beautiful Pirate" then
      BossMon = "Beautiful Pirate"
      NameBoss = "Beautiful Pirate"
      NameQuestBoss = "DeepForestIsland2"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$50,000
70,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
      CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
    elseif SelectBoss == "Cake Queen" then
      BossMon = "Cake Queen"
      NameBoss = "Cake Queen"
      NameQuestBoss = "IceCreamIslandQuest"
      QuestLvBoss = 3
      RewardBoss = [[
Reward:
$30,000
112,500,000 Exp.]]
      CFrameQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
      CFrameBoss = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
    elseif SelectBoss == "Longma" then
      BossMon = "Longma"
      NameBoss = "Longma"
      CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
    elseif SelectBoss == "Soul Reaper" then
      BossMon = "Soul Reaper"
      NameBoss = "Soul Reaper"
      CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
    elseif SelectBoss == "rip_indra True Form" then
      BossMon = "rip_indra True Form"
      NameBoss = "rip_indra True Form"
      CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
    end
  end
end
CheckBossQuest = L6_6
function L6_6()
  if SelectMaterial == "Radioactive Material" then
    MMon = "Factory Staff"
    MPos = CFrame.new(295, 73, -56)
    SP = "Default"
  elseif SelectMaterial == "Mystic Droplet" then
    MMon = "Water Fighter"
    MPos = CFrame.new(-3385, 239, -10542)
    SP = "Default"
  elseif SelectMaterial == "Magma Ore" then
    if Sea1 then
      MMon = "Military Spy"
      MPos = CFrame.new(-5815, 84, 8820)
      SP = "Default"
    elseif Sea2 then
      MMon = "Magma Ninja"
      MPos = CFrame.new(-5428, 78, -5959)
      SP = "Default"
    end
  elseif SelectMaterial == "Angel Wings" then
    MMon = "God's Guard"
    MPos = CFrame.new(-4698, 845, -1912)
    SP = "Default"
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7859.09814, 5544.19043, -381.476196))
    end
  elseif SelectMaterial == "Leather" then
    if Sea1 then
      MMon = "Brute"
      MPos = CFrame.new(-1145, 15, 4350)
      SP = "Default"
    elseif Sea2 then
      MMon = "Marine Captain"
      MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
      SP = "Default"
    elseif Sea3 then
      MMon = "Jungle Pirate"
      MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
      SP = "Default"
    end
  elseif SelectMaterial == "Scrap Metal" then
    if Sea1 then
      MMon = "Brute"
      MPos = CFrame.new(-1145, 15, 4350)
      SP = "Default"
    elseif Sea2 then
      MMon = "Swan Pirate"
      MPos = CFrame.new(878, 122, 1235)
      SP = "Default"
    elseif Sea3 then
      MMon = "Jungle Pirate"
      MPos = CFrame.new(-12107, 332, -10549)
      SP = "Default"
    end
  elseif SelectMaterial == "Fish Tail" then
    if Sea3 then
      MMon = "Fishman Raider"
      MPos = CFrame.new(-10993, 332, -8940)
      SP = "Default"
    elseif Sea1 then
      MMon = "Fishman Warrior"
      MPos = CFrame.new(61123, 19, 1569)
      SP = "Default"
      if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
      end
    end
  elseif SelectMaterial == "Demonic Wisp" then
    MMon = "Demonic Soul"
    MPos = CFrame.new(-9507, 172, 6158)
    SP = "Default"
  elseif SelectMaterial == "Vampire Fang" then
    MMon = "Vampire"
    MPos = CFrame.new(-6033, 7, -1317)
    SP = "Default"
  elseif SelectMaterial == "Conjured Cocoa" then
    MMon = "Chocolate Bar Battler"
    MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
    SP = "Default"
  elseif SelectMaterial == "Dragon Scale" then
    MMon = "Dragon Crew Archer"
    MPos = CFrame.new(6827.91455078125, 609.4127197265625, 252.3538055419922)
    SP = "Default"
  elseif SelectMaterial == "Gunpowder" then
    MMon = "Pistol Billionaire"
    MPos = CFrame.new(-469, 74, 5904)
    SP = "Default"
  elseif SelectMaterial == "Mini Tusk" then
    MMon = "Mythological Pirate"
    MPos = CFrame.new()
    SP = "Default"
  end
end
MaterialMon = L6_6
function L6_6()
  local L0_97
  for _FORV_3_, _FORV_4_ in L0_97(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
    pcall(function()
      local L0_98
      L0_98 = IslandESP
      if L0_98 then
        L0_98 = _UPVALUE0_
        L0_98 = L0_98.Name
        if L0_98 ~= "Sea" then
          L0_98 = _UPVALUE0_
          L0_98 = L0_98.FindFirstChild
          L0_98 = L0_98(L0_98, "NameEsp")
          if not L0_98 then
            L0_98 = Instance
            L0_98 = L0_98.new
            L0_98 = L0_98("BillboardGui", _UPVALUE0_)
            L0_98.Name = "NameEsp"
            L0_98.ExtentsOffset = Vector3.new(0, 1, 0)
            L0_98.Size = UDim2.new(1, 200, 1, 30)
            L0_98.Adornee = _UPVALUE0_
            L0_98.AlwaysOnTop = true
            Instance.new("TextLabel", L0_98).Font = "GothamBold"
            Instance.new("TextLabel", L0_98).FontSize = "Size14"
            Instance.new("TextLabel", L0_98).TextWrapped = true
            Instance.new("TextLabel", L0_98).Size = UDim2.new(1, 0, 1, 0)
            Instance.new("TextLabel", L0_98).TextYAlignment = "Top"
            Instance.new("TextLabel", L0_98).BackgroundTransparency = 1
            Instance.new("TextLabel", L0_98).TextStrokeTransparency = 0.5
            Instance.new("TextLabel", L0_98).TextColor3 = Color3.fromRGB(8, 0, 0)
          else
            L0_98 = _UPVALUE0_
            L0_98 = L0_98.NameEsp
            L0_98 = L0_98.TextLabel
            L0_98.Text = _UPVALUE0_.Name .. "   \n" .. round((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
          end
        end
      else
        L0_98 = _UPVALUE0_
        L0_98 = L0_98.FindFirstChild
        L0_98 = L0_98(L0_98, "NameEsp")
        if L0_98 then
          L0_98 = _UPVALUE0_
          L0_98 = L0_98.FindFirstChild
          L0_98 = L0_98(L0_98, "NameEsp")
          L0_98 = L0_98.Destroy
          L0_98(L0_98)
        end
      end
    end)
  end
end
UpdateIslandESP = L6_6
function L6_6(A0_99)
  local L1_100
  L1_100 = A0_99 == nil
end
isnil = L6_6
function L6_6(A0_101)
end
L7_7 = math
L7_7 = L7_7.random
L8_8 = 1
L9_9 = 1000000
L7_7 = L7_7(L8_8, L9_9)
Number = L7_7
function L7_7()
  local L0_102
  for _FORV_3_, _FORV_4_ in L0_102(game:GetService("Players"):GetChildren()) do
    pcall(function()
      local L0_103
      L0_103 = isnil
      L0_103 = L0_103(_UPVALUE0_.Character)
      if not L0_103 then
        L0_103 = ESPPlayer
        if L0_103 then
          L0_103 = isnil
          L0_103 = L0_103(_UPVALUE0_.Character.Head)
          if not L0_103 then
            L0_103 = _UPVALUE0_
            L0_103 = L0_103.Character
            L0_103 = L0_103.Head
            L0_103 = L0_103.FindFirstChild
            L0_103 = L0_103(L0_103, "NameEsp" .. Number)
            if not L0_103 then
              L0_103 = Instance
              L0_103 = L0_103.new
              L0_103 = L0_103("BillboardGui", _UPVALUE0_.Character.Head)
              L0_103.Name = "NameEsp" .. Number
              L0_103.ExtentsOffset = Vector3.new(0, 1, 0)
              L0_103.Size = UDim2.new(1, 200, 1, 30)
              L0_103.Adornee = _UPVALUE0_.Character.Head
              L0_103.AlwaysOnTop = true
              Instance.new("TextLabel", L0_103).Font = Enum.Font.GothamSemibold
              Instance.new("TextLabel", L0_103).FontSize = "Size10"
              Instance.new("TextLabel", L0_103).TextWrapped = true
              Instance.new("TextLabel", L0_103).Text = _UPVALUE0_.Name .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Character.Head.Position).Magnitude / 3) .. " Distance"
              Instance.new("TextLabel", L0_103).Size = UDim2.new(1, 0, 1, 0)
              Instance.new("TextLabel", L0_103).TextYAlignment = "Top"
              Instance.new("TextLabel", L0_103).BackgroundTransparency = 1
              Instance.new("TextLabel", L0_103).TextStrokeTransparency = 0.5
              if _UPVALUE0_.Team == game.Players.LocalPlayer.Team then
                Instance.new("TextLabel", L0_103).TextColor3 = Color3.new(0, 0, 254)
              else
                Instance.new("TextLabel", L0_103).TextColor3 = Color3.new(255, 0, 0)
              end
            end
          else
            L0_103 = _UPVALUE0_
            L0_103 = L0_103.Character
            L0_103 = L0_103.Head
            L0_103 = L0_103["NameEsp" .. Number]
            L0_103 = L0_103.TextLabel
            L0_103.Text = _UPVALUE0_.Name .. " | " .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Character.Head.Position).Magnitude / 3) .. [[
 Distance
Health : ]] .. _UPVALUE1_(_UPVALUE0_.Character.Humanoid.Health * 100 / _UPVALUE0_.Character.Humanoid.MaxHealth) .. "%"
          end
        else
          L0_103 = _UPVALUE0_
          L0_103 = L0_103.Character
          L0_103 = L0_103.Head
          L0_103 = L0_103.FindFirstChild
          L0_103 = L0_103(L0_103, "NameEsp" .. Number)
          if L0_103 then
            L0_103 = _UPVALUE0_
            L0_103 = L0_103.Character
            L0_103 = L0_103.Head
            L0_103 = L0_103.FindFirstChild
            L0_103 = L0_103(L0_103, "NameEsp" .. Number)
            L0_103 = L0_103.Destroy
            L0_103(L0_103)
          end
        end
      end
    end)
  end
end
UpdatePlayerChams = L7_7
function L7_7()
  local L0_104
  for _FORV_3_, _FORV_4_ in L0_104(game.Workspace:GetChildren()) do
    pcall(function()
      local L0_105
      L0_105 = string
      L0_105 = L0_105.find
      L0_105 = L0_105(_UPVALUE0_.Name, "Chest")
      if L0_105 then
        L0_105 = ChestESP
        if L0_105 then
          L0_105 = string
          L0_105 = L0_105.find
          L0_105 = L0_105(_UPVALUE0_.Name, "Chest")
          if L0_105 then
            L0_105 = _UPVALUE0_
            L0_105 = L0_105.FindFirstChild
            L0_105 = L0_105(L0_105, "NameEsp" .. Number)
            if not L0_105 then
              L0_105 = Instance
              L0_105 = L0_105.new
              L0_105 = L0_105("BillboardGui", _UPVALUE0_)
              L0_105.Name = "NameEsp" .. Number
              L0_105.ExtentsOffset = Vector3.new(0, 1, 0)
              L0_105.Size = UDim2.new(1, 200, 1, 30)
              L0_105.Adornee = _UPVALUE0_
              L0_105.AlwaysOnTop = true
              Instance.new("TextLabel", L0_105).Font = Enum.Font.GothamSemibold
              Instance.new("TextLabel", L0_105).FontSize = "Size14"
              Instance.new("TextLabel", L0_105).TextWrapped = true
              Instance.new("TextLabel", L0_105).Size = UDim2.new(1, 0, 1, 0)
              Instance.new("TextLabel", L0_105).TextYAlignment = "Top"
              Instance.new("TextLabel", L0_105).BackgroundTransparency = 1
              Instance.new("TextLabel", L0_105).TextStrokeTransparency = 0.5
              if _UPVALUE0_.Name == "Chest1" then
                Instance.new("TextLabel", L0_105).TextColor3 = Color3.fromRGB(109, 109, 109)
                Instance.new("TextLabel", L0_105).Text = "Chest 1" .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
              end
              if _UPVALUE0_.Name == "Chest2" then
                Instance.new("TextLabel", L0_105).TextColor3 = Color3.fromRGB(173, 158, 21)
                Instance.new("TextLabel", L0_105).Text = "Chest 2" .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
              end
              if _UPVALUE0_.Name == "Chest3" then
                Instance.new("TextLabel", L0_105).TextColor3 = Color3.fromRGB(85, 255, 255)
                Instance.new("TextLabel", L0_105).Text = "Chest 3" .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
              end
            else
              L0_105 = _UPVALUE0_
              L0_105 = L0_105["NameEsp" .. Number]
              L0_105 = L0_105.TextLabel
              L0_105.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
            end
          end
        else
          L0_105 = _UPVALUE0_
          L0_105 = L0_105.FindFirstChild
          L0_105 = L0_105(L0_105, "NameEsp" .. Number)
          if L0_105 then
            L0_105 = _UPVALUE0_
            L0_105 = L0_105.FindFirstChild
            L0_105 = L0_105(L0_105, "NameEsp" .. Number)
            L0_105 = L0_105.Destroy
            L0_105(L0_105)
          end
        end
      end
    end)
  end
end
UpdateChestChams = L7_7
function L7_7()
  local L0_106
  for _FORV_3_, _FORV_4_ in L0_106(game.Workspace:GetChildren()) do
    pcall(function()
      local L0_107
      L0_107 = DevilFruitESP
      if L0_107 then
        L0_107 = string
        L0_107 = L0_107.find
        L0_107 = L0_107(_UPVALUE0_.Name, "Fruit")
        if L0_107 then
          L0_107 = _UPVALUE0_
          L0_107 = L0_107.Handle
          L0_107 = L0_107.FindFirstChild
          L0_107 = L0_107(L0_107, "NameEsp" .. Number)
          if not L0_107 then
            L0_107 = Instance
            L0_107 = L0_107.new
            L0_107 = L0_107("BillboardGui", _UPVALUE0_.Handle)
            L0_107.Name = "NameEsp" .. Number
            L0_107.ExtentsOffset = Vector3.new(0, 1, 0)
            L0_107.Size = UDim2.new(1, 200, 1, 30)
            L0_107.Adornee = _UPVALUE0_.Handle
            L0_107.AlwaysOnTop = true
            Instance.new("TextLabel", L0_107).Font = Enum.Font.GothamSemibold
            Instance.new("TextLabel", L0_107).FontSize = "Size14"
            Instance.new("TextLabel", L0_107).TextWrapped = true
            Instance.new("TextLabel", L0_107).Size = UDim2.new(1, 0, 1, 0)
            Instance.new("TextLabel", L0_107).TextYAlignment = "Top"
            Instance.new("TextLabel", L0_107).BackgroundTransparency = 1
            Instance.new("TextLabel", L0_107).TextStrokeTransparency = 0.5
            Instance.new("TextLabel", L0_107).TextColor3 = Color3.fromRGB(255, 255, 255)
            Instance.new("TextLabel", L0_107).Text = _UPVALUE0_.Name .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Handle.Position).Magnitude / 3) .. " Distance"
          else
            L0_107 = _UPVALUE0_
            L0_107 = L0_107.Handle
            L0_107 = L0_107["NameEsp" .. Number]
            L0_107 = L0_107.TextLabel
            L0_107.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Handle.Position).Magnitude / 3) .. " Distance"
          end
        end
      else
        L0_107 = _UPVALUE0_
        L0_107 = L0_107.Handle
        L0_107 = L0_107.FindFirstChild
        L0_107 = L0_107(L0_107, "NameEsp" .. Number)
        if L0_107 then
          L0_107 = _UPVALUE0_
          L0_107 = L0_107.Handle
          L0_107 = L0_107.FindFirstChild
          L0_107 = L0_107(L0_107, "NameEsp" .. Number)
          L0_107 = L0_107.Destroy
          L0_107(L0_107)
        end
      end
    end)
  end
end
UpdateDevilChams = L7_7
function L7_7()
  local L0_108
  for _FORV_3_, _FORV_4_ in L0_108(game.Workspace:GetChildren()) do
    pcall(function()
      local L0_109
      L0_109 = _UPVALUE0_
      L0_109 = L0_109.Name
      if L0_109 ~= "Flower2" then
        L0_109 = _UPVALUE0_
        L0_109 = L0_109.Name
      elseif L0_109 == "Flower1" then
        L0_109 = FlowerESP
        if L0_109 then
          L0_109 = _UPVALUE0_
          L0_109 = L0_109.FindFirstChild
          L0_109 = L0_109(L0_109, "NameEsp" .. Number)
          if not L0_109 then
            L0_109 = Instance
            L0_109 = L0_109.new
            L0_109 = L0_109("BillboardGui", _UPVALUE0_)
            L0_109.Name = "NameEsp" .. Number
            L0_109.ExtentsOffset = Vector3.new(0, 1, 0)
            L0_109.Size = UDim2.new(1, 200, 1, 30)
            L0_109.Adornee = _UPVALUE0_
            L0_109.AlwaysOnTop = true
            Instance.new("TextLabel", L0_109).Font = Enum.Font.GothamSemibold
            Instance.new("TextLabel", L0_109).FontSize = "Size14"
            Instance.new("TextLabel", L0_109).TextWrapped = true
            Instance.new("TextLabel", L0_109).Size = UDim2.new(1, 0, 1, 0)
            Instance.new("TextLabel", L0_109).TextYAlignment = "Top"
            Instance.new("TextLabel", L0_109).BackgroundTransparency = 1
            Instance.new("TextLabel", L0_109).TextStrokeTransparency = 0.5
            Instance.new("TextLabel", L0_109).TextColor3 = Color3.fromRGB(255, 0, 0)
            if _UPVALUE0_.Name == "Flower1" then
              Instance.new("TextLabel", L0_109).Text = "Blue Flower" .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
              Instance.new("TextLabel", L0_109).TextColor3 = Color3.fromRGB(0, 0, 255)
            end
            if _UPVALUE0_.Name == "Flower2" then
              Instance.new("TextLabel", L0_109).Text = "Red Flower" .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
              Instance.new("TextLabel", L0_109).TextColor3 = Color3.fromRGB(255, 0, 0)
            end
          else
            L0_109 = _UPVALUE0_
            L0_109 = L0_109["NameEsp" .. Number]
            L0_109 = L0_109.TextLabel
            L0_109.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
          end
        else
          L0_109 = _UPVALUE0_
          L0_109 = L0_109.FindFirstChild
          L0_109 = L0_109(L0_109, "NameEsp" .. Number)
          if L0_109 then
            L0_109 = _UPVALUE0_
            L0_109 = L0_109.FindFirstChild
            L0_109 = L0_109(L0_109, "NameEsp" .. Number)
            L0_109 = L0_109.Destroy
            L0_109(L0_109)
          end
        end
      end
    end)
  end
end
UpdateFlowerChams = L7_7
function L7_7()
  local L0_110, L1_111, L2_112, L3_113, L4_114, L5_115
  L5_115 = L1_111(L2_112)
  for L3_113, L4_114 in L0_110(L1_111, L2_112, L3_113, L4_114, L5_115, L1_111(L2_112)) do
    L5_115 = L4_114.IsA
    L5_115 = L5_115(L4_114, "Tool")
    if L5_115 then
      L5_115 = RealFruitESP
      if L5_115 then
        L5_115 = L4_114.Handle
        L5_115 = L5_115.FindFirstChild
        L5_115 = L5_115(L5_115, "NameEsp" .. Number)
        if not L5_115 then
          L5_115 = Instance
          L5_115 = L5_115.new
          L5_115 = L5_115("BillboardGui", L4_114.Handle)
          L5_115.Name = "NameEsp" .. Number
          L5_115.ExtentsOffset = Vector3.new(0, 1, 0)
          L5_115.Size = UDim2.new(1, 200, 1, 30)
          L5_115.Adornee = L4_114.Handle
          L5_115.AlwaysOnTop = true
          Instance.new("TextLabel", L5_115).Font = Enum.Font.GothamSemibold
          Instance.new("TextLabel", L5_115).FontSize = "Size14"
          Instance.new("TextLabel", L5_115).TextWrapped = true
          Instance.new("TextLabel", L5_115).Size = UDim2.new(1, 0, 1, 0)
          Instance.new("TextLabel", L5_115).TextYAlignment = "Top"
          Instance.new("TextLabel", L5_115).BackgroundTransparency = 1
          Instance.new("TextLabel", L5_115).TextStrokeTransparency = 0.5
          Instance.new("TextLabel", L5_115).TextColor3 = Color3.fromRGB(255, 0, 0)
          Instance.new("TextLabel", L5_115).Text = L4_114.Name .. " \n" .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_114.Handle.Position).Magnitude / 3) .. " Distance"
        else
          L5_115 = L4_114.Handle
          L5_115 = L5_115["NameEsp" .. Number]
          L5_115 = L5_115.TextLabel
          L5_115.Text = L4_114.Name .. " " .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_114.Handle.Position).Magnitude / 3) .. " Distance"
        end
      else
        L5_115 = L4_114.Handle
        L5_115 = L5_115.FindFirstChild
        L5_115 = L5_115(L5_115, "NameEsp" .. Number)
        if L5_115 then
          L5_115 = L4_114.Handle
          L5_115 = L5_115.FindFirstChild
          L5_115 = L5_115(L5_115, "NameEsp" .. Number)
          L5_115 = L5_115.Destroy
          L5_115(L5_115)
        end
      end
    end
  end
  L5_115 = L1_111(L2_112)
  for L3_113, L4_114 in L0_110(L1_111, L2_112, L3_113, L4_114, L5_115, L1_111(L2_112)) do
    L5_115 = L4_114.IsA
    L5_115 = L5_115(L4_114, "Tool")
    if L5_115 then
      L5_115 = RealFruitESP
      if L5_115 then
        L5_115 = L4_114.Handle
        L5_115 = L5_115.FindFirstChild
        L5_115 = L5_115(L5_115, "NameEsp" .. Number)
        if not L5_115 then
          L5_115 = Instance
          L5_115 = L5_115.new
          L5_115 = L5_115("BillboardGui", L4_114.Handle)
          L5_115.Name = "NameEsp" .. Number
          L5_115.ExtentsOffset = Vector3.new(0, 1, 0)
          L5_115.Size = UDim2.new(1, 200, 1, 30)
          L5_115.Adornee = L4_114.Handle
          L5_115.AlwaysOnTop = true
          Instance.new("TextLabel", L5_115).Font = Enum.Font.GothamSemibold
          Instance.new("TextLabel", L5_115).FontSize = "Size14"
          Instance.new("TextLabel", L5_115).TextWrapped = true
          Instance.new("TextLabel", L5_115).Size = UDim2.new(1, 0, 1, 0)
          Instance.new("TextLabel", L5_115).TextYAlignment = "Top"
          Instance.new("TextLabel", L5_115).BackgroundTransparency = 1
          Instance.new("TextLabel", L5_115).TextStrokeTransparency = 0.5
          Instance.new("TextLabel", L5_115).TextColor3 = Color3.fromRGB(255, 174, 0)
          Instance.new("TextLabel", L5_115).Text = L4_114.Name .. " \n" .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_114.Handle.Position).Magnitude / 3) .. " Distance"
        else
          L5_115 = L4_114.Handle
          L5_115 = L5_115["NameEsp" .. Number]
          L5_115 = L5_115.TextLabel
          L5_115.Text = L4_114.Name .. " " .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_114.Handle.Position).Magnitude / 3) .. " Distance"
        end
      else
        L5_115 = L4_114.Handle
        L5_115 = L5_115.FindFirstChild
        L5_115 = L5_115(L5_115, "NameEsp" .. Number)
        if L5_115 then
          L5_115 = L4_114.Handle
          L5_115 = L5_115.FindFirstChild
          L5_115 = L5_115(L5_115, "NameEsp" .. Number)
          L5_115 = L5_115.Destroy
          L5_115(L5_115)
        end
      end
    end
  end
  L5_115 = L1_111(L2_112)
  for L3_113, L4_114 in L0_110(L1_111, L2_112, L3_113, L4_114, L5_115, L1_111(L2_112)) do
    L5_115 = L4_114.IsA
    L5_115 = L5_115(L4_114, "Tool")
    if L5_115 then
      L5_115 = RealFruitESP
      if L5_115 then
        L5_115 = L4_114.Handle
        L5_115 = L5_115.FindFirstChild
        L5_115 = L5_115(L5_115, "NameEsp" .. Number)
        if not L5_115 then
          L5_115 = Instance
          L5_115 = L5_115.new
          L5_115 = L5_115("BillboardGui", L4_114.Handle)
          L5_115.Name = "NameEsp" .. Number
          L5_115.ExtentsOffset = Vector3.new(0, 1, 0)
          L5_115.Size = UDim2.new(1, 200, 1, 30)
          L5_115.Adornee = L4_114.Handle
          L5_115.AlwaysOnTop = true
          Instance.new("TextLabel", L5_115).Font = Enum.Font.GothamSemibold
          Instance.new("TextLabel", L5_115).FontSize = "Size14"
          Instance.new("TextLabel", L5_115).TextWrapped = true
          Instance.new("TextLabel", L5_115).Size = UDim2.new(1, 0, 1, 0)
          Instance.new("TextLabel", L5_115).TextYAlignment = "Top"
          Instance.new("TextLabel", L5_115).BackgroundTransparency = 1
          Instance.new("TextLabel", L5_115).TextStrokeTransparency = 0.5
          Instance.new("TextLabel", L5_115).TextColor3 = Color3.fromRGB(251, 255, 0)
          Instance.new("TextLabel", L5_115).Text = L4_114.Name .. " \n" .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_114.Handle.Position).Magnitude / 3) .. " Distance"
        else
          L5_115 = L4_114.Handle
          L5_115 = L5_115["NameEsp" .. Number]
          L5_115 = L5_115.TextLabel
          L5_115.Text = L4_114.Name .. " " .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_114.Handle.Position).Magnitude / 3) .. " Distance"
        end
      else
        L5_115 = L4_114.Handle
        L5_115 = L5_115.FindFirstChild
        L5_115 = L5_115(L5_115, "NameEsp" .. Number)
        if L5_115 then
          L5_115 = L4_114.Handle
          L5_115 = L5_115.FindFirstChild
          L5_115 = L5_115(L5_115, "NameEsp" .. Number)
          L5_115 = L5_115.Destroy
          L5_115(L5_115)
        end
      end
    end
  end
end
UpdateRealFruitChams = L7_7
function L7_7()
  local L0_116
  for _FORV_3_, _FORV_4_ in L0_116(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
    pcall(function()
      local L0_117
      L0_117 = IslandESP
      if L0_117 then
        L0_117 = _UPVALUE0_
        L0_117 = L0_117.Name
        if L0_117 ~= "Sea" then
          L0_117 = _UPVALUE0_
          L0_117 = L0_117.FindFirstChild
          L0_117 = L0_117(L0_117, "NameEsp")
          if not L0_117 then
            L0_117 = Instance
            L0_117 = L0_117.new
            L0_117 = L0_117("BillboardGui", _UPVALUE0_)
            L0_117.Name = "NameEsp"
            L0_117.ExtentsOffset = Vector3.new(0, 1, 0)
            L0_117.Size = UDim2.new(1, 200, 1, 30)
            L0_117.Adornee = _UPVALUE0_
            L0_117.AlwaysOnTop = true
            Instance.new("TextLabel", L0_117).Font = "GothamBold"
            Instance.new("TextLabel", L0_117).FontSize = "Size14"
            Instance.new("TextLabel", L0_117).TextWrapped = true
            Instance.new("TextLabel", L0_117).Size = UDim2.new(1, 0, 1, 0)
            Instance.new("TextLabel", L0_117).TextYAlignment = "Top"
            Instance.new("TextLabel", L0_117).BackgroundTransparency = 1
            Instance.new("TextLabel", L0_117).TextStrokeTransparency = 0.5
            Instance.new("TextLabel", L0_117).TextColor3 = Color3.fromRGB(7, 236, 240)
          else
            L0_117 = _UPVALUE0_
            L0_117 = L0_117.NameEsp
            L0_117 = L0_117.TextLabel
            L0_117.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
          end
        end
      else
        L0_117 = _UPVALUE0_
        L0_117 = L0_117.FindFirstChild
        L0_117 = L0_117(L0_117, "NameEsp")
        if L0_117 then
          L0_117 = _UPVALUE0_
          L0_117 = L0_117.FindFirstChild
          L0_117 = L0_117(L0_117, "NameEsp")
          L0_117 = L0_117.Destroy
          L0_117(L0_117)
        end
      end
    end)
  end
end
UpdateIslandESP = L7_7
function L7_7(A0_118)
  local L1_119
  L1_119 = A0_118 == nil
end
isnil = L7_7
function L7_7(A0_120)
end
L8_8 = math
L8_8 = L8_8.random
L9_9 = 1
L10_10 = 1000000
L8_8 = L8_8(L9_9, L10_10)
Number = L8_8
function L8_8()
  local L0_121
  for _FORV_3_, _FORV_4_ in L0_121(game:GetService("Players"):GetChildren()) do
    pcall(function()
      local L0_122
      L0_122 = isnil
      L0_122 = L0_122(_UPVALUE0_.Character)
      if not L0_122 then
        L0_122 = ESPPlayer
        if L0_122 then
          L0_122 = isnil
          L0_122 = L0_122(_UPVALUE0_.Character.Head)
          if not L0_122 then
            L0_122 = _UPVALUE0_
            L0_122 = L0_122.Character
            L0_122 = L0_122.Head
            L0_122 = L0_122.FindFirstChild
            L0_122 = L0_122(L0_122, "NameEsp" .. Number)
            if not L0_122 then
              L0_122 = Instance
              L0_122 = L0_122.new
              L0_122 = L0_122("BillboardGui", _UPVALUE0_.Character.Head)
              L0_122.Name = "NameEsp" .. Number
              L0_122.ExtentsOffset = Vector3.new(0, 1, 0)
              L0_122.Size = UDim2.new(1, 200, 1, 30)
              L0_122.Adornee = _UPVALUE0_.Character.Head
              L0_122.AlwaysOnTop = true
              Instance.new("TextLabel", L0_122).Font = Enum.Font.GothamSemibold
              Instance.new("TextLabel", L0_122).FontSize = "Size14"
              Instance.new("TextLabel", L0_122).TextWrapped = true
              Instance.new("TextLabel", L0_122).Text = _UPVALUE0_.Name .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Character.Head.Position).Magnitude / 3) .. " Distance"
              Instance.new("TextLabel", L0_122).Size = UDim2.new(1, 0, 1, 0)
              Instance.new("TextLabel", L0_122).TextYAlignment = "Top"
              Instance.new("TextLabel", L0_122).BackgroundTransparency = 1
              Instance.new("TextLabel", L0_122).TextStrokeTransparency = 0.5
              if _UPVALUE0_.Team == game.Players.LocalPlayer.Team then
                Instance.new("TextLabel", L0_122).TextColor3 = Color3.new(0, 255, 0)
              else
                Instance.new("TextLabel", L0_122).TextColor3 = Color3.new(255, 0, 0)
              end
            end
          else
            L0_122 = _UPVALUE0_
            L0_122 = L0_122.Character
            L0_122 = L0_122.Head
            L0_122 = L0_122["NameEsp" .. Number]
            L0_122 = L0_122.TextLabel
            L0_122.Text = _UPVALUE0_.Name .. " | " .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Character.Head.Position).Magnitude / 3) .. [[
 Distance
Health : ]] .. _UPVALUE1_(_UPVALUE0_.Character.Humanoid.Health * 100 / _UPVALUE0_.Character.Humanoid.MaxHealth) .. "%"
          end
        else
          L0_122 = _UPVALUE0_
          L0_122 = L0_122.Character
          L0_122 = L0_122.Head
          L0_122 = L0_122.FindFirstChild
          L0_122 = L0_122(L0_122, "NameEsp" .. Number)
          if L0_122 then
            L0_122 = _UPVALUE0_
            L0_122 = L0_122.Character
            L0_122 = L0_122.Head
            L0_122 = L0_122.FindFirstChild
            L0_122 = L0_122(L0_122, "NameEsp" .. Number)
            L0_122 = L0_122.Destroy
            L0_122(L0_122)
          end
        end
      end
    end)
  end
end
UpdatePlayerChams = L8_8
function L8_8()
  local L0_123
  for _FORV_3_, _FORV_4_ in L0_123(game.Workspace:GetChildren()) do
    pcall(function()
      local L0_124
      L0_124 = string
      L0_124 = L0_124.find
      L0_124 = L0_124(_UPVALUE0_.Name, "Chest")
      if L0_124 then
        L0_124 = ChestESP
        if L0_124 then
          L0_124 = string
          L0_124 = L0_124.find
          L0_124 = L0_124(_UPVALUE0_.Name, "Chest")
          if L0_124 then
            L0_124 = _UPVALUE0_
            L0_124 = L0_124.FindFirstChild
            L0_124 = L0_124(L0_124, "NameEsp" .. Number)
            if not L0_124 then
              L0_124 = Instance
              L0_124 = L0_124.new
              L0_124 = L0_124("BillboardGui", _UPVALUE0_)
              L0_124.Name = "NameEsp" .. Number
              L0_124.ExtentsOffset = Vector3.new(0, 1, 0)
              L0_124.Size = UDim2.new(1, 200, 1, 30)
              L0_124.Adornee = _UPVALUE0_
              L0_124.AlwaysOnTop = true
              Instance.new("TextLabel", L0_124).Font = Enum.Font.GothamSemibold
              Instance.new("TextLabel", L0_124).FontSize = "Size14"
              Instance.new("TextLabel", L0_124).TextWrapped = true
              Instance.new("TextLabel", L0_124).Size = UDim2.new(1, 0, 1, 0)
              Instance.new("TextLabel", L0_124).TextYAlignment = "Top"
              Instance.new("TextLabel", L0_124).BackgroundTransparency = 1
              Instance.new("TextLabel", L0_124).TextStrokeTransparency = 0.5
              if _UPVALUE0_.Name == "Chest1" then
                Instance.new("TextLabel", L0_124).TextColor3 = Color3.fromRGB(109, 109, 109)
                Instance.new("TextLabel", L0_124).Text = "Chest 1" .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
              end
              if _UPVALUE0_.Name == "Chest2" then
                Instance.new("TextLabel", L0_124).TextColor3 = Color3.fromRGB(173, 158, 21)
                Instance.new("TextLabel", L0_124).Text = "Chest 2" .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
              end
              if _UPVALUE0_.Name == "Chest3" then
                Instance.new("TextLabel", L0_124).TextColor3 = Color3.fromRGB(85, 255, 255)
                Instance.new("TextLabel", L0_124).Text = "Chest 3" .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
              end
            else
              L0_124 = _UPVALUE0_
              L0_124 = L0_124["NameEsp" .. Number]
              L0_124 = L0_124.TextLabel
              L0_124.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
            end
          end
        else
          L0_124 = _UPVALUE0_
          L0_124 = L0_124.FindFirstChild
          L0_124 = L0_124(L0_124, "NameEsp" .. Number)
          if L0_124 then
            L0_124 = _UPVALUE0_
            L0_124 = L0_124.FindFirstChild
            L0_124 = L0_124(L0_124, "NameEsp" .. Number)
            L0_124 = L0_124.Destroy
            L0_124(L0_124)
          end
        end
      end
    end)
  end
end
UpdateChestChams = L8_8
function L8_8()
  local L0_125
  for _FORV_3_, _FORV_4_ in L0_125(game.Workspace:GetChildren()) do
    pcall(function()
      local L0_126
      L0_126 = DevilFruitESP
      if L0_126 then
        L0_126 = string
        L0_126 = L0_126.find
        L0_126 = L0_126(_UPVALUE0_.Name, "Fruit")
        if L0_126 then
          L0_126 = _UPVALUE0_
          L0_126 = L0_126.Handle
          L0_126 = L0_126.FindFirstChild
          L0_126 = L0_126(L0_126, "NameEsp" .. Number)
          if not L0_126 then
            L0_126 = Instance
            L0_126 = L0_126.new
            L0_126 = L0_126("BillboardGui", _UPVALUE0_.Handle)
            L0_126.Name = "NameEsp" .. Number
            L0_126.ExtentsOffset = Vector3.new(0, 1, 0)
            L0_126.Size = UDim2.new(1, 200, 1, 30)
            L0_126.Adornee = _UPVALUE0_.Handle
            L0_126.AlwaysOnTop = true
            Instance.new("TextLabel", L0_126).Font = Enum.Font.GothamSemibold
            Instance.new("TextLabel", L0_126).FontSize = "Size14"
            Instance.new("TextLabel", L0_126).TextWrapped = true
            Instance.new("TextLabel", L0_126).Size = UDim2.new(1, 0, 1, 0)
            Instance.new("TextLabel", L0_126).TextYAlignment = "Top"
            Instance.new("TextLabel", L0_126).BackgroundTransparency = 1
            Instance.new("TextLabel", L0_126).TextStrokeTransparency = 0.5
            Instance.new("TextLabel", L0_126).TextColor3 = Color3.fromRGB(255, 255, 255)
            Instance.new("TextLabel", L0_126).Text = _UPVALUE0_.Name .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Handle.Position).Magnitude / 3) .. " Distance"
          else
            L0_126 = _UPVALUE0_
            L0_126 = L0_126.Handle
            L0_126 = L0_126["NameEsp" .. Number]
            L0_126 = L0_126.TextLabel
            L0_126.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Handle.Position).Magnitude / 3) .. " Distance"
          end
        end
      else
        L0_126 = _UPVALUE0_
        L0_126 = L0_126.Handle
        L0_126 = L0_126.FindFirstChild
        L0_126 = L0_126(L0_126, "NameEsp" .. Number)
        if L0_126 then
          L0_126 = _UPVALUE0_
          L0_126 = L0_126.Handle
          L0_126 = L0_126.FindFirstChild
          L0_126 = L0_126(L0_126, "NameEsp" .. Number)
          L0_126 = L0_126.Destroy
          L0_126(L0_126)
        end
      end
    end)
  end
end
UpdateDevilChams = L8_8
function L8_8()
  local L0_127
  for _FORV_3_, _FORV_4_ in L0_127(game.Workspace:GetChildren()) do
    pcall(function()
      local L0_128
      L0_128 = _UPVALUE0_
      L0_128 = L0_128.Name
      if L0_128 ~= "Flower2" then
        L0_128 = _UPVALUE0_
        L0_128 = L0_128.Name
      elseif L0_128 == "Flower1" then
        L0_128 = FlowerESP
        if L0_128 then
          L0_128 = _UPVALUE0_
          L0_128 = L0_128.FindFirstChild
          L0_128 = L0_128(L0_128, "NameEsp" .. Number)
          if not L0_128 then
            L0_128 = Instance
            L0_128 = L0_128.new
            L0_128 = L0_128("BillboardGui", _UPVALUE0_)
            L0_128.Name = "NameEsp" .. Number
            L0_128.ExtentsOffset = Vector3.new(0, 1, 0)
            L0_128.Size = UDim2.new(1, 200, 1, 30)
            L0_128.Adornee = _UPVALUE0_
            L0_128.AlwaysOnTop = true
            Instance.new("TextLabel", L0_128).Font = Enum.Font.GothamSemibold
            Instance.new("TextLabel", L0_128).FontSize = "Size14"
            Instance.new("TextLabel", L0_128).TextWrapped = true
            Instance.new("TextLabel", L0_128).Size = UDim2.new(1, 0, 1, 0)
            Instance.new("TextLabel", L0_128).TextYAlignment = "Top"
            Instance.new("TextLabel", L0_128).BackgroundTransparency = 1
            Instance.new("TextLabel", L0_128).TextStrokeTransparency = 0.5
            Instance.new("TextLabel", L0_128).TextColor3 = Color3.fromRGB(255, 0, 0)
            if _UPVALUE0_.Name == "Flower1" then
              Instance.new("TextLabel", L0_128).Text = "Blue Flower" .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
              Instance.new("TextLabel", L0_128).TextColor3 = Color3.fromRGB(0, 0, 255)
            end
            if _UPVALUE0_.Name == "Flower2" then
              Instance.new("TextLabel", L0_128).Text = "Red Flower" .. " \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
              Instance.new("TextLabel", L0_128).TextColor3 = Color3.fromRGB(255, 0, 0)
            end
          else
            L0_128 = _UPVALUE0_
            L0_128 = L0_128["NameEsp" .. Number]
            L0_128 = L0_128.TextLabel
            L0_128.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " Distance"
          end
        else
          L0_128 = _UPVALUE0_
          L0_128 = L0_128.FindFirstChild
          L0_128 = L0_128(L0_128, "NameEsp" .. Number)
          if L0_128 then
            L0_128 = _UPVALUE0_
            L0_128 = L0_128.FindFirstChild
            L0_128 = L0_128(L0_128, "NameEsp" .. Number)
            L0_128 = L0_128.Destroy
            L0_128(L0_128)
          end
        end
      end
    end)
  end
end
UpdateFlowerChams = L8_8
function L8_8()
  local L0_129, L1_130, L2_131, L3_132, L4_133, L5_134
  L5_134 = L1_130(L2_131)
  for L3_132, L4_133 in L0_129(L1_130, L2_131, L3_132, L4_133, L5_134, L1_130(L2_131)) do
    L5_134 = L4_133.IsA
    L5_134 = L5_134(L4_133, "Tool")
    if L5_134 then
      L5_134 = RealFruitESP
      if L5_134 then
        L5_134 = L4_133.Handle
        L5_134 = L5_134.FindFirstChild
        L5_134 = L5_134(L5_134, "NameEsp" .. Number)
        if not L5_134 then
          L5_134 = Instance
          L5_134 = L5_134.new
          L5_134 = L5_134("BillboardGui", L4_133.Handle)
          L5_134.Name = "NameEsp" .. Number
          L5_134.ExtentsOffset = Vector3.new(0, 1, 0)
          L5_134.Size = UDim2.new(1, 200, 1, 30)
          L5_134.Adornee = L4_133.Handle
          L5_134.AlwaysOnTop = true
          Instance.new("TextLabel", L5_134).Font = Enum.Font.GothamSemibold
          Instance.new("TextLabel", L5_134).FontSize = "Size14"
          Instance.new("TextLabel", L5_134).TextWrapped = true
          Instance.new("TextLabel", L5_134).Size = UDim2.new(1, 0, 1, 0)
          Instance.new("TextLabel", L5_134).TextYAlignment = "Top"
          Instance.new("TextLabel", L5_134).BackgroundTransparency = 1
          Instance.new("TextLabel", L5_134).TextStrokeTransparency = 0.5
          Instance.new("TextLabel", L5_134).TextColor3 = Color3.fromRGB(255, 0, 0)
          Instance.new("TextLabel", L5_134).Text = L4_133.Name .. " \n" .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_133.Handle.Position).Magnitude / 3) .. " Distance"
        else
          L5_134 = L4_133.Handle
          L5_134 = L5_134["NameEsp" .. Number]
          L5_134 = L5_134.TextLabel
          L5_134.Text = L4_133.Name .. " " .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_133.Handle.Position).Magnitude / 3) .. " Distance"
        end
      else
        L5_134 = L4_133.Handle
        L5_134 = L5_134.FindFirstChild
        L5_134 = L5_134(L5_134, "NameEsp" .. Number)
        if L5_134 then
          L5_134 = L4_133.Handle
          L5_134 = L5_134.FindFirstChild
          L5_134 = L5_134(L5_134, "NameEsp" .. Number)
          L5_134 = L5_134.Destroy
          L5_134(L5_134)
        end
      end
    end
  end
  L5_134 = L1_130(L2_131)
  for L3_132, L4_133 in L0_129(L1_130, L2_131, L3_132, L4_133, L5_134, L1_130(L2_131)) do
    L5_134 = L4_133.IsA
    L5_134 = L5_134(L4_133, "Tool")
    if L5_134 then
      L5_134 = RealFruitESP
      if L5_134 then
        L5_134 = L4_133.Handle
        L5_134 = L5_134.FindFirstChild
        L5_134 = L5_134(L5_134, "NameEsp" .. Number)
        if not L5_134 then
          L5_134 = Instance
          L5_134 = L5_134.new
          L5_134 = L5_134("BillboardGui", L4_133.Handle)
          L5_134.Name = "NameEsp" .. Number
          L5_134.ExtentsOffset = Vector3.new(0, 1, 0)
          L5_134.Size = UDim2.new(1, 200, 1, 30)
          L5_134.Adornee = L4_133.Handle
          L5_134.AlwaysOnTop = true
          Instance.new("TextLabel", L5_134).Font = Enum.Font.GothamSemibold
          Instance.new("TextLabel", L5_134).FontSize = "Size14"
          Instance.new("TextLabel", L5_134).TextWrapped = true
          Instance.new("TextLabel", L5_134).Size = UDim2.new(1, 0, 1, 0)
          Instance.new("TextLabel", L5_134).TextYAlignment = "Top"
          Instance.new("TextLabel", L5_134).BackgroundTransparency = 1
          Instance.new("TextLabel", L5_134).TextStrokeTransparency = 0.5
          Instance.new("TextLabel", L5_134).TextColor3 = Color3.fromRGB(255, 174, 0)
          Instance.new("TextLabel", L5_134).Text = L4_133.Name .. " \n" .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_133.Handle.Position).Magnitude / 3) .. " Distance"
        else
          L5_134 = L4_133.Handle
          L5_134 = L5_134["NameEsp" .. Number]
          L5_134 = L5_134.TextLabel
          L5_134.Text = L4_133.Name .. " " .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_133.Handle.Position).Magnitude / 3) .. " Distance"
        end
      else
        L5_134 = L4_133.Handle
        L5_134 = L5_134.FindFirstChild
        L5_134 = L5_134(L5_134, "NameEsp" .. Number)
        if L5_134 then
          L5_134 = L4_133.Handle
          L5_134 = L5_134.FindFirstChild
          L5_134 = L5_134(L5_134, "NameEsp" .. Number)
          L5_134 = L5_134.Destroy
          L5_134(L5_134)
        end
      end
    end
  end
  L5_134 = L1_130(L2_131)
  for L3_132, L4_133 in L0_129(L1_130, L2_131, L3_132, L4_133, L5_134, L1_130(L2_131)) do
    L5_134 = L4_133.IsA
    L5_134 = L5_134(L4_133, "Tool")
    if L5_134 then
      L5_134 = RealFruitESP
      if L5_134 then
        L5_134 = L4_133.Handle
        L5_134 = L5_134.FindFirstChild
        L5_134 = L5_134(L5_134, "NameEsp" .. Number)
        if not L5_134 then
          L5_134 = Instance
          L5_134 = L5_134.new
          L5_134 = L5_134("BillboardGui", L4_133.Handle)
          L5_134.Name = "NameEsp" .. Number
          L5_134.ExtentsOffset = Vector3.new(0, 1, 0)
          L5_134.Size = UDim2.new(1, 200, 1, 30)
          L5_134.Adornee = L4_133.Handle
          L5_134.AlwaysOnTop = true
          Instance.new("TextLabel", L5_134).Font = Enum.Font.GothamSemibold
          Instance.new("TextLabel", L5_134).FontSize = "Size14"
          Instance.new("TextLabel", L5_134).TextWrapped = true
          Instance.new("TextLabel", L5_134).Size = UDim2.new(1, 0, 1, 0)
          Instance.new("TextLabel", L5_134).TextYAlignment = "Top"
          Instance.new("TextLabel", L5_134).BackgroundTransparency = 1
          Instance.new("TextLabel", L5_134).TextStrokeTransparency = 0.5
          Instance.new("TextLabel", L5_134).TextColor3 = Color3.fromRGB(251, 255, 0)
          Instance.new("TextLabel", L5_134).Text = L4_133.Name .. " \n" .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_133.Handle.Position).Magnitude / 3) .. " Distance"
        else
          L5_134 = L4_133.Handle
          L5_134 = L5_134["NameEsp" .. Number]
          L5_134 = L5_134.TextLabel
          L5_134.Text = L4_133.Name .. " " .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_133.Handle.Position).Magnitude / 3) .. " Distance"
        end
      else
        L5_134 = L4_133.Handle
        L5_134 = L5_134.FindFirstChild
        L5_134 = L5_134(L5_134, "NameEsp" .. Number)
        if L5_134 then
          L5_134 = L4_133.Handle
          L5_134 = L5_134.FindFirstChild
          L5_134 = L5_134(L5_134, "NameEsp" .. Number)
          L5_134 = L5_134.Destroy
          L5_134(L5_134)
        end
      end
    end
  end
end
UpdateRealFruitChams = L8_8
L8_8 = spawn
function L9_9()
  while wait() do
    pcall(function()
      local L0_135, L1_136, L2_137, L3_138, L4_139, L5_140
      if L0_135 then
        L3_138 = "Workspace"
        L5_140 = L1_136(L2_137)
        for L3_138, L4_139 in L0_135(L1_136, L2_137, L3_138, L4_139, L5_140, L1_136(L2_137)) do
          L5_140 = L4_139.FindFirstChild
          L5_140 = L5_140(L4_139, "HumanoidRootPart")
          if L5_140 then
            L5_140 = L4_139.FindFirstChild
            L5_140 = L5_140(L4_139, "MobEap")
            if not L5_140 then
              L5_140 = Instance
              L5_140 = L5_140.new
              L5_140 = L5_140("BillboardGui")
              L5_140.Parent = L4_139
              L5_140.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
              L5_140.Active = true
              L5_140.Name = "MobEap"
              L5_140.AlwaysOnTop = true
              L5_140.LightInfluence = 1
              L5_140.Size = UDim2.new(0, 200, 0, 50)
              L5_140.StudsOffset = Vector3.new(0, 2.5, 0)
              Instance.new("TextLabel").Parent = L5_140
              Instance.new("TextLabel").BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              Instance.new("TextLabel").BackgroundTransparency = 1
              Instance.new("TextLabel").Size = UDim2.new(0, 200, 0, 50)
              Instance.new("TextLabel").Font = Enum.Font.GothamBold
              Instance.new("TextLabel").TextColor3 = Color3.fromRGB(7, 236, 240)
              Instance.new("TextLabel").Text.Size = 35
            end
            L5_140 = math
            L5_140 = L5_140.floor
            L5_140 = L5_140((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L4_139.HumanoidRootPart.Position).Magnitude)
            L4_139.MobEap.TextLabel.Text = L4_139.Name .. "-" .. L5_140 .. " Distance"
          end
        end
      else
        L3_138 = "Workspace"
        L5_140 = L1_136(L2_137)
        for L3_138, L4_139 in L0_135(L1_136, L2_137, L3_138, L4_139, L5_140, L1_136(L2_137)) do
          L5_140 = L4_139.FindFirstChild
          L5_140 = L5_140(L4_139, "MobEap")
          if L5_140 then
            L5_140 = L4_139.MobEap
            L5_140 = L5_140.Destroy
            L5_140(L5_140)
          end
        end
      end
    end)
  end
end
L8_8(L9_9)
L8_8 = spawn
function L9_9()
  while wait() do
    pcall(function()
      local L0_141, L1_142, L2_143, L3_144, L4_145, L5_146
      if L0_141 then
        L3_144 = "Workspace"
        L5_146 = L1_142(L2_143)
        for L3_144, L4_145 in L0_141(L1_142, L2_143, L3_144, L4_145, L5_146, L1_142(L2_143)) do
          L5_146 = L4_145.FindFirstChild
          L5_146 = L5_146(L4_145, "HumanoidRootPart")
          if L5_146 then
            L5_146 = L4_145.FindFirstChild
            L5_146 = L5_146(L4_145, "Seaesps")
            if not L5_146 then
              L5_146 = Instance
              L5_146 = L5_146.new
              L5_146 = L5_146("BillboardGui")
              L5_146.Parent = L4_145
              L5_146.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
              L5_146.Active = true
              L5_146.Name = "Seaesps"
              L5_146.AlwaysOnTop = true
              L5_146.LightInfluence = 1
              L5_146.Size = UDim2.new(0, 200, 0, 50)
              L5_146.StudsOffset = Vector3.new(0, 2.5, 0)
              Instance.new("TextLabel").Parent = L5_146
              Instance.new("TextLabel").BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              Instance.new("TextLabel").BackgroundTransparency = 1
              Instance.new("TextLabel").Size = UDim2.new(0, 200, 0, 50)
              Instance.new("TextLabel").Font = Enum.Font.GothamBold
              Instance.new("TextLabel").TextColor3 = Color3.fromRGB(7, 236, 240)
              Instance.new("TextLabel").Text.Size = 35
            end
            L5_146 = math
            L5_146 = L5_146.floor
            L5_146 = L5_146((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L4_145.HumanoidRootPart.Position).Magnitude)
            L4_145.Seaesps.TextLabel.Text = L4_145.Name .. "-" .. L5_146 .. " Distance"
          end
        end
      else
        L3_144 = "Workspace"
        L5_146 = L1_142(L2_143)
        for L3_144, L4_145 in L0_141(L1_142, L2_143, L3_144, L4_145, L5_146, L1_142(L2_143)) do
          L5_146 = L4_145.FindFirstChild
          L5_146 = L5_146(L4_145, "Seaesps")
          if L5_146 then
            L5_146 = L4_145.Seaesps
            L5_146 = L5_146.Destroy
            L5_146(L5_146)
          end
        end
      end
    end)
  end
end
L8_8(L9_9)
L8_8 = spawn
function L9_9()
  while wait() do
    pcall(function()
      local L0_147, L1_148, L2_149, L3_150, L4_151, L5_152
      if L0_147 then
        L3_150 = "Workspace"
        L5_152 = L1_148(L2_149)
        for L3_150, L4_151 in L0_147(L1_148, L2_149, L3_150, L4_151, L5_152, L1_148(L2_149)) do
          L5_152 = L4_151.FindFirstChild
          L5_152 = L5_152(L4_151, "HumanoidRootPart")
          if L5_152 then
            L5_152 = L4_151.FindFirstChild
            L5_152 = L5_152(L4_151, "NpcEspes")
            if not L5_152 then
              L5_152 = Instance
              L5_152 = L5_152.new
              L5_152 = L5_152("BillboardGui")
              L5_152.Parent = L4_151
              L5_152.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
              L5_152.Active = true
              L5_152.Name = "NpcEspes"
              L5_152.AlwaysOnTop = true
              L5_152.LightInfluence = 1
              L5_152.Size = UDim2.new(0, 200, 0, 50)
              L5_152.StudsOffset = Vector3.new(0, 2.5, 0)
              Instance.new("TextLabel").Parent = L5_152
              Instance.new("TextLabel").BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              Instance.new("TextLabel").BackgroundTransparency = 1
              Instance.new("TextLabel").Size = UDim2.new(0, 200, 0, 50)
              Instance.new("TextLabel").Font = Enum.Font.GothamBold
              Instance.new("TextLabel").TextColor3 = Color3.fromRGB(7, 236, 240)
              Instance.new("TextLabel").Text.Size = 35
            end
            L5_152 = math
            L5_152 = L5_152.floor
            L5_152 = L5_152((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L4_151.HumanoidRootPart.Position).Magnitude)
            L4_151.NpcEspes.TextLabel.Text = L4_151.Name .. "-" .. L5_152 .. " Distance"
          end
        end
      else
        L3_150 = "Workspace"
        L5_152 = L1_148(L2_149)
        for L3_150, L4_151 in L0_147(L1_148, L2_149, L3_150, L4_151, L5_152, L1_148(L2_149)) do
          L5_152 = L4_151.FindFirstChild
          L5_152 = L5_152(L4_151, "NpcEspes")
          if L5_152 then
            L5_152 = L4_151.NpcEspes
            L5_152 = L5_152.Destroy
            L5_152(L5_152)
          end
        end
      end
    end)
  end
end
L8_8(L9_9)
function L8_8(A0_153)
  local L1_154
  L1_154 = A0_153 == nil
end
isnil = L8_8
function L8_8(A0_155)
end
L9_9 = math
L9_9 = L9_9.random
L10_10 = 1
L11_11 = 1000000
L9_9 = L9_9(L10_10, L11_11)
Number = L9_9
function L9_9()
  local L0_156
  for _FORV_3_, _FORV_4_ in L0_156(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
    pcall(function()
      local L0_157
      L0_157 = MirageIslandESP
      if L0_157 then
        L0_157 = _UPVALUE0_
        L0_157 = L0_157.Name
        if L0_157 == "Mirage Island" then
          L0_157 = _UPVALUE0_
          L0_157 = L0_157.FindFirstChild
          L0_157 = L0_157(L0_157, "NameEsp")
          if not L0_157 then
            L0_157 = Instance
            L0_157 = L0_157.new
            L0_157 = L0_157("BillboardGui", _UPVALUE0_)
            L0_157.Name = "NameEsp"
            L0_157.ExtentsOffset = Vector3.new(0, 1, 0)
            L0_157.Size = UDim2.new(1, 200, 1, 30)
            L0_157.Adornee = _UPVALUE0_
            L0_157.AlwaysOnTop = true
            Instance.new("TextLabel", L0_157).Font = "Code"
            Instance.new("TextLabel", L0_157).FontSize = "Size14"
            Instance.new("TextLabel", L0_157).TextWrapped = true
            Instance.new("TextLabel", L0_157).Size = UDim2.new(1, 0, 1, 0)
            Instance.new("TextLabel", L0_157).TextYAlignment = "Top"
            Instance.new("TextLabel", L0_157).BackgroundTransparency = 1
            Instance.new("TextLabel", L0_157).TextStrokeTransparency = 0.5
            Instance.new("TextLabel", L0_157).TextColor3 = Color3.fromRGB(80, 245, 245)
          else
            L0_157 = _UPVALUE0_
            L0_157 = L0_157.NameEsp
            L0_157 = L0_157.TextLabel
            L0_157.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " M"
          end
        end
      else
        L0_157 = _UPVALUE0_
        L0_157 = L0_157.FindFirstChild
        L0_157 = L0_157(L0_157, "NameEsp")
        if L0_157 then
          L0_157 = _UPVALUE0_
          L0_157 = L0_157.FindFirstChild
          L0_157 = L0_157(L0_157, "NameEsp")
          L0_157 = L0_157.Destroy
          L0_157(L0_157)
        end
      end
    end)
  end
end
UpdateIslandMirageESP = L9_9
function L9_9()
  local L0_158
  for _FORV_3_, _FORV_4_ in L0_158(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
      local L0_159
      L0_159 = AuraESP
      if L0_159 then
        L0_159 = _UPVALUE0_
        L0_159 = L0_159.Name
        if L0_159 == "Master of Enhancement" then
          L0_159 = _UPVALUE0_
          L0_159 = L0_159.FindFirstChild
          L0_159 = L0_159(L0_159, "NameEsp")
          if not L0_159 then
            L0_159 = Instance
            L0_159 = L0_159.new
            L0_159 = L0_159("BillboardGui", _UPVALUE0_)
            L0_159.Name = "NameEsp"
            L0_159.ExtentsOffset = Vector3.new(0, 1, 0)
            L0_159.Size = UDim2.new(1, 200, 1, 30)
            L0_159.Adornee = _UPVALUE0_
            L0_159.AlwaysOnTop = true
            Instance.new("TextLabel", L0_159).Font = "Code"
            Instance.new("TextLabel", L0_159).FontSize = "Size14"
            Instance.new("TextLabel", L0_159).TextWrapped = true
            Instance.new("TextLabel", L0_159).Size = UDim2.new(1, 0, 1, 0)
            Instance.new("TextLabel", L0_159).TextYAlignment = "Top"
            Instance.new("TextLabel", L0_159).BackgroundTransparency = 1
            Instance.new("TextLabel", L0_159).TextStrokeTransparency = 0.5
            Instance.new("TextLabel", L0_159).TextColor3 = Color3.fromRGB(80, 245, 245)
          else
            L0_159 = _UPVALUE0_
            L0_159 = L0_159.NameEsp
            L0_159 = L0_159.TextLabel
            L0_159.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " M"
          end
        end
      else
        L0_159 = _UPVALUE0_
        L0_159 = L0_159.FindFirstChild
        L0_159 = L0_159(L0_159, "NameEsp")
        if L0_159 then
          L0_159 = _UPVALUE0_
          L0_159 = L0_159.FindFirstChild
          L0_159 = L0_159(L0_159, "NameEsp")
          L0_159 = L0_159.Destroy
          L0_159(L0_159)
        end
      end
    end)
  end
end
UpdateAuraESP = L9_9
function L9_9()
  local L0_160
  for _FORV_3_, _FORV_4_ in L0_160(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
      local L0_161
      L0_161 = LADESP
      if L0_161 then
        L0_161 = _UPVALUE0_
        L0_161 = L0_161.Name
        if L0_161 == "Legendary Sword Dealer" then
          L0_161 = _UPVALUE0_
          L0_161 = L0_161.FindFirstChild
          L0_161 = L0_161(L0_161, "NameEsp")
          if not L0_161 then
            L0_161 = Instance
            L0_161 = L0_161.new
            L0_161 = L0_161("BillboardGui", _UPVALUE0_)
            L0_161.Name = "NameEsp"
            L0_161.ExtentsOffset = Vector3.new(0, 1, 0)
            L0_161.Size = UDim2.new(1, 200, 1, 30)
            L0_161.Adornee = _UPVALUE0_
            L0_161.AlwaysOnTop = true
            Instance.new("TextLabel", L0_161).Font = "Code"
            Instance.new("TextLabel", L0_161).FontSize = "Size14"
            Instance.new("TextLabel", L0_161).TextWrapped = true
            Instance.new("TextLabel", L0_161).Size = UDim2.new(1, 0, 1, 0)
            Instance.new("TextLabel", L0_161).TextYAlignment = "Top"
            Instance.new("TextLabel", L0_161).BackgroundTransparency = 1
            Instance.new("TextLabel", L0_161).TextStrokeTransparency = 0.5
            Instance.new("TextLabel", L0_161).TextColor3 = Color3.fromRGB(80, 245, 245)
          else
            L0_161 = _UPVALUE0_
            L0_161 = L0_161.NameEsp
            L0_161 = L0_161.TextLabel
            L0_161.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " M"
          end
        end
      else
        L0_161 = _UPVALUE0_
        L0_161 = L0_161.FindFirstChild
        L0_161 = L0_161(L0_161, "NameEsp")
        if L0_161 then
          L0_161 = _UPVALUE0_
          L0_161 = L0_161.FindFirstChild
          L0_161 = L0_161(L0_161, "NameEsp")
          L0_161 = L0_161.Destroy
          L0_161(L0_161)
        end
      end
    end)
  end
end
UpdateLSDESP = L9_9
function L9_9()
  local L0_162
  for _FORV_3_, _FORV_4_ in L0_162(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
    pcall(function()
      local L0_163
      L0_163 = GearESP
      if L0_163 then
        L0_163 = _UPVALUE0_
        L0_163 = L0_163.Name
        if L0_163 == "MeshPart" then
          L0_163 = _UPVALUE0_
          L0_163 = L0_163.FindFirstChild
          L0_163 = L0_163(L0_163, "NameEsp")
          if not L0_163 then
            L0_163 = Instance
            L0_163 = L0_163.new
            L0_163 = L0_163("BillboardGui", _UPVALUE0_)
            L0_163.Name = "NameEsp"
            L0_163.ExtentsOffset = Vector3.new(0, 1, 0)
            L0_163.Size = UDim2.new(1, 200, 1, 30)
            L0_163.Adornee = _UPVALUE0_
            L0_163.AlwaysOnTop = true
            Instance.new("TextLabel", L0_163).Font = "Code"
            Instance.new("TextLabel", L0_163).FontSize = "Size14"
            Instance.new("TextLabel", L0_163).TextWrapped = true
            Instance.new("TextLabel", L0_163).Size = UDim2.new(1, 0, 1, 0)
            Instance.new("TextLabel", L0_163).TextYAlignment = "Top"
            Instance.new("TextLabel", L0_163).BackgroundTransparency = 1
            Instance.new("TextLabel", L0_163).TextStrokeTransparency = 0.5
            Instance.new("TextLabel", L0_163).TextColor3 = Color3.fromRGB(80, 245, 245)
          else
            L0_163 = _UPVALUE0_
            L0_163 = L0_163.NameEsp
            L0_163 = L0_163.TextLabel
            L0_163.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " M"
          end
        end
      else
        L0_163 = _UPVALUE0_
        L0_163 = L0_163.FindFirstChild
        L0_163 = L0_163(L0_163, "NameEsp")
        if L0_163 then
          L0_163 = _UPVALUE0_
          L0_163 = L0_163.FindFirstChild
          L0_163 = L0_163(L0_163, "NameEsp")
          L0_163 = L0_163.Destroy
          L0_163(L0_163)
        end
      end
    end)
  end
end
UpdateGeaESP = L9_9
function L9_9(A0_164)
  local L1_165, L2_166, L3_167
  L1_165 = A0_164.Position
  L2_166 = game
  L2_166 = L2_166.Players
  L2_166 = L2_166.LocalPlayer
  L2_166 = L2_166.Character
  L2_166 = L2_166.HumanoidRootPart
  L2_166 = L2_166.Position
  L1_165 = L1_165 - L2_166
  L1_165 = L1_165.Magnitude
  L2_166 = 350
  L3_167 = TweenInfo
  L3_167 = L3_167.new
  L3_167 = L3_167(L1_165 / L2_166, Enum.EasingStyle.Linear)
  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, L3_167, {CFrame = A0_164}):Play()
  if _G.StopTween2 then
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, L3_167, {CFrame = A0_164}):Cancel()
  end
  _G.Clip2 = true
  wait(L1_165 / L2_166)
  _G.Clip2 = false
end
Tween2 = L9_9
function L9_9(A0_168)
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = A0_168
  task.wait()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = A0_168
end
BKP = L9_9
L9_9 = 350
TweenSpeed = L9_9
function L9_9(A0_169)
  local L1_170, L2_171, L3_172
  L1_170 = A0_169.Position
  L2_171 = game
  L2_171 = L2_171.Players
  L2_171 = L2_171.LocalPlayer
  L2_171 = L2_171.Character
  L2_171 = L2_171.HumanoidRootPart
  L2_171 = L2_171.Position
  L1_170 = L1_170 - L2_171
  L1_170 = L1_170.Magnitude
  L2_171 = TweenSpeed
  L3_172 = TweenInfo
  L3_172 = L3_172.new
  L3_172 = L3_172(L1_170 / L2_171, Enum.EasingStyle.Linear)
  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, L3_172, {CFrame = A0_169}):Play()
  if _G.StopTween then
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, L3_172, {CFrame = A0_169}):Cancel()
  end
end
Tween = L9_9
function L9_9(A0_173)
  local L1_174
  L1_174 = game
  L1_174 = L1_174.Players
  L1_174 = L1_174.LocalPlayer
  L1_174 = L1_174.Backpack
  L1_174 = L1_174.FindFirstChild
  L1_174 = L1_174(L1_174, A0_173)
  if L1_174 then
    L1_174 = game
    L1_174 = L1_174.Players
    L1_174 = L1_174.LocalPlayer
    L1_174 = L1_174.Backpack
    L1_174 = L1_174.FindFirstChild
    L1_174 = L1_174(L1_174, A0_173)
    wait()
    game.Players.LocalPlayer.Character.Humanoid:EquipTool(L1_174)
  end
end
EquipTool = L9_9
L9_9 = spawn
function L10_10()
  while task.wait() do
    pcall(function()
      if _G.AutoEvoRace or _G.CastleRaid or _G.CollectAzure or _G.TweenToKitsune or _G.GhostShip or _G.Ship or _G.Auto_Holy_Torch or _G.TeleportPly or _G.Auto_Sea3 or _G.Auto_Sea2 or _G.Tweenfruit or _G.AutoFishCrew or _G.Auto_Saber or _G.AutoShark or _G.Auto_Warden or _G.Auto_RainbowHaki or AutoFarmRace or _G.AutoQuestRace or Auto_Law or AutoTushita or _G.AutoHolyTorch or _G.AutoTerrorshark or _G.farmpiranya or _G.Auto_MusketeerHat or _G.Auto_ObservationV2 or _G.AutoNear or _G.Auto_PoleV1 or _G.Auto_Buddy or _G.Ectoplasm or AutoEvoRace or AutoBartilo or _G.Auto_Canvander or _G.AutoLevel or _G.Auto_DualKatana or Auto_Quest_Yama_3 or Auto_Quest_Yama_2 or Auto_Quest_Yama_1 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or _G.Clip2 or _G.Auto_Regoku or _G.AutoBone or _G.AutoBoneNoQuest or _G.AutoBoss or AutoFarmMasDevilFruit or AutoFarmMasGun or AutoHallowSycthe or AutoTushita or _G.Cake or _G.Auto_SkullGuitar or _G.AutoFarmSwan or _G.AutoEliteor or AutoNextIsland or Musketeer or _G.AutoMaterial or AutoFarmRaceQuest or _G.Factory or _G.Auto_Saw or _G.AutoFrozenDimension or _G.AutoKillTrial or _G.AutoUpgrade or _G.TweenToFrozenDimension then
        if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
          Instance.new("BodyVelocity").Name = "BodyClip"
          Instance.new("BodyVelocity").Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
          Instance.new("BodyVelocity").MaxForce = Vector3.new(100000, 100000, 100000)
          Instance.new("BodyVelocity").Velocity = Vector3.new(0, 0, 0)
        end
      else
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
      end
    end)
  end
end
L9_9(L10_10)
L9_9 = spawn
function L10_10()
  pcall(function()
    game:GetService("RunService").Stepped:Connect(function()
      local L0_175
      if not L0_175 then
      elseif L0_175 then
        for _FORV_3_, _FORV_4_ in L0_175(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
          if _FORV_4_:IsA("BasePart") then
            _FORV_4_.CanCollide = false
          end
        end
      end
    end)
  end)
end
L9_9(L10_10)
L9_9 = task
L9_9 = L9_9.spawn
function L10_10()
  if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
    game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
      pcall(function()
        if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
          game.Players.LocalPlayer.Character.Stun.Value = 0
        end
      end)
    end)
  end
end
L9_9(L10_10)
function L9_9(A0_176)
  local L1_177, L2_178, L3_179, L4_180, L5_181
  L4_180 = "ReplicatedStorage"
  L4_180 = "getInventory"
  L5_181 = L2_178(L3_179, L4_180)
  for L4_180, L5_181 in L1_177(L2_178, L3_179, L4_180, L5_181, L2_178(L3_179, L4_180)) do
    if type(L5_181) == "table" and L5_181.Type == "Material" and L5_181.Name == A0_176 then
      return L5_181.Count
    end
  end
end
CheckMaterial = L9_9
function L9_9(A0_182)
  local L1_183, L2_184, L3_185, L4_186, L5_187
  L4_186 = "ReplicatedStorage"
  L4_186 = "getInventory"
  L5_187 = L2_184(L3_185, L4_186)
  for L4_186, L5_187 in L1_183(L2_184, L3_185, L4_186, L5_187, L2_184(L3_185, L4_186)) do
    if type(L5_187) == "table" and L5_187.Type == "Sword" and L5_187.Name == A0_182 then
      return true
    end
  end
end
GetWeaponInventory = L9_9
L9_9 = game
L9_9 = L9_9.Players
L9_9 = L9_9.LocalPlayer
function L10_10()
  local L0_188, L1_189, L2_190, L3_191, L4_192, L5_193, L6_194, L7_195, L8_196, L9_197, L10_198, L11_199, L12_200, L13_201
  L0_188 = _UPVALUE0_
  L0_188 = L0_188.Character
  if not L0_188 then
    return
  end
  L1_189 = nil
  L13_201 = L3_191(L4_192)
  for L5_193, L6_194 in L2_190(L3_191, L4_192, L5_193, L6_194, L7_195, L8_196, L9_197, L10_198, L11_199, L12_200, L13_201, L3_191(L4_192)) do
    if L7_195 then
      L1_189 = L6_194
      break
    end
  end
  if not L1_189 then
    return
  end
  L5_193 = L1_189
  if L4_192 then
    L5_193 = L3_191
    L5_193 = L5_193(L6_194)
    for L9_197, L10_198 in L6_194(L7_195) do
      L11_199 = L10_198.HumanoidRootPart
      L11_199 = L11_199.Position
      L13_201 = L0_188
      L12_200 = L0_188.GetPivot
      L12_200 = L12_200(L13_201)
      L12_200 = L12_200.Position
      L11_199 = L11_199 - L12_200
      L11_199 = L11_199.Unit
      L12_200 = pcall
      function L13_201()
        _UPVALUE0_.LeftClickRemote:FireServer(_UPVALUE1_, _UPVALUE2_)
      end
      L12_200(L13_201)
    end
  else
    L5_193 = game
    L5_193 = L5_193.GetService
    L5_193 = L5_193(L6_194, L7_195)
    L5_193 = L5_193.Enemies
    L5_193 = L5_193.GetChildren
    L5_193 = L5_193(L6_194)
    for L11_199, L12_200 in L8_196(L9_197) do
      L13_201 = L12_200.GetAttribute
      L13_201 = L13_201(L12_200, "IsBoat")
      if not L13_201 then
        L13_201 = L2_190
        L13_201 = L13_201(L12_200)
        if L13_201 then
          L13_201 = L12_200.FindFirstChild
          L13_201 = L13_201(L12_200, "Head")
          if L13_201 and 60 >= (L6_194 - L13_201.Position).Magnitude then
            table.insert(L4_192, {L12_200, L13_201})
          end
        end
      end
    end
    if not L7_195 then
      return
    end
    L8_196(L9_197)
  end
end
AttackNoCoolDown = L10_10
L10_10 = 1
Type = L10_10
L10_10 = spawn
function L11_11()
  while wait() do
    if Type == 1 then
      Pos = CFrame.new(0, 20, 0)
    end
  end
end
L10_10(L11_11)
L10_10 = spawn
function L11_11()
  while wait() do
    Type = 1
  end
end
L10_10(L11_11)
function L10_10()
  if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
  end
end
AutoHaki = L10_10
function L10_10(A0_202)
  repeat
    wait(_G.Fast_Delay)
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = A0_202
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = A0_202
  until (A0_202.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
end
to = L10_10
function L10_10(A0_203)
  pcall(function()
    if (_UPVALUE0_.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 and not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
      if NameMon == "FishmanQuest" then
        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
      elseif Mon == "God's Guard" then
        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
      elseif NameMon == "SkyExp1Quest" then
        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
      elseif NameMon == "ShipQuest1" then
        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      elseif NameMon == "ShipQuest2" then
        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      elseif NameMon == "FrostQuest" then
        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
      else
        repeat
          wait(_G.Fast_Delay)
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _UPVALUE0_
          wait(0.05)
          game.Players.LocalPlayer.Character.Head:Destroy()
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _UPVALUE0_
        until (_UPVALUE0_.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
        wait()
      end
    end
  end)
end
to = L10_10
L10_10 = Instance
L10_10 = L10_10.new
L11_11 = "ScreenGui"
L10_10 = L10_10(L11_11)
L11_11 = Instance
L11_11 = L11_11.new
L12_12 = "ImageButton"
L11_11 = L11_11(L12_12)
L12_12 = Instance
L12_12 = L12_12.new
L13_13 = "UICorner"
L12_12 = L12_12(L13_13)
L13_13 = Instance
L13_13 = L13_13.new
L14_14 = "ParticleEmitter"
L13_13 = L13_13(L14_14)
L14_14 = game
L15_15 = L14_14
L14_14 = L14_14.GetService
L16_16 = "TweenService"
L14_14 = L14_14(L15_15, L16_16)
L15_15 = game
L15_15 = L15_15.CoreGui
L10_10.Parent = L15_15
L15_15 = Enum
L15_15 = L15_15.ZIndexBehavior
L15_15 = L15_15.Sibling
L10_10.ZIndexBehavior = L15_15
L11_11.Parent = L10_10
L15_15 = Color3
L15_15 = L15_15.fromRGB
L16_16 = 0
L17_17 = 0
L18_18 = 0
L15_15 = L15_15(L16_16, L17_17, L18_18)
L11_11.BackgroundColor3 = L15_15
L11_11.BorderSizePixel = 0
L15_15 = UDim2
L15_15 = L15_15.new
L16_16 = 0.020833336999999993
L17_17 = 0
L18_18 = 0.10528908129999999
L19_19 = 0
L15_15 = L15_15(L16_16, L17_17, L18_18, L19_19)
L11_11.Position = L15_15
L15_15 = UDim2
L15_15 = L15_15.new
L16_16 = 0
L17_17 = 50
L18_18 = 0
L19_19 = 50
L15_15 = L15_15(L16_16, L17_17, L18_18, L19_19)
L11_11.Size = L15_15
L11_11.Draggable = true
L11_11.Image = "http://www.roblox.com/asset/?id=98977023494737"
L12_12.Parent = L11_11
L15_15 = UDim
L15_15 = L15_15.new
L16_16 = 1
L17_17 = 10
L15_15 = L15_15(L16_16, L17_17)
L12_12.CornerRadius = L15_15
L13_13.Parent = L11_11
L13_13.LightEmission = 1
L15_15 = NumberSequence
L15_15 = L15_15.new
L16_16 = {
  L17_17,
  [81] = L18_18(L19_19, L20_20)
}
L17_17 = NumberSequenceKeypoint
L17_17 = L17_17.new
L18_18 = 0
L19_19 = 0.1
L17_17 = L17_17(L18_18, L19_19)
L18_18 = NumberSequenceKeypoint
L18_18 = L18_18.new
L19_19 = 1
L20_20 = 0
L96_96 = L18_18(L19_19, L20_20)
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[2] = L18_18
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[3] = L19_19
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[4] = L20_20
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[5] = L21_21
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[6] = L22_22
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[7] = L23_23
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[8] = L24_24
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[9] = L25_25
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[10] = L26_26
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[11] = L27_27
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[12] = L28_28
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[13] = L29_29
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[14] = L30_30
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[15] = L31_31
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[16] = L32_32
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[17] = L33_33
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[18] = L34_34
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[19] = L35_35
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[20] = L36_36
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[21] = L37_37
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[22] = L38_38
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[23] = L39_39
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[24] = L40_40
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[25] = L41_41
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[26] = L42_42
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[27] = L43_43
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[28] = L44_44
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[29] = L45_45
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[30] = L46_46
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[31] = L47_47
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[32] = L48_48
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[33] = L49_49
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[34] = L50_50
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[35] = L51_51
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[36] = L52_52
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[37] = L53_53
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[38] = L54_54
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[39] = L55_55
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[40] = L56_56
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[41] = L57_57
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[42] = L58_58
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[43] = L59_59
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[44] = L60_60
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[45] = L61_61
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[46] = L62_62
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[47] = L63_63
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[48] = L64_64
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[49] = L65_65
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[50] = L66_66
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[51] = L67_67
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[52] = L68_68
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[53] = L69_69
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[54] = L70_70
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[55] = L71_71
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[56] = L72_72
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[57] = L73_73
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[58] = L74_74
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[59] = L75_75
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[60] = L76_76
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[61] = L77_77
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[62] = L78_78
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[63] = L79_79
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[64] = L80_80
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[65] = L81_81
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[66] = L82_82
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[67] = L83_83
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[68] = L84_84
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[69] = L85_85
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[70] = L86_86
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[71] = L87_87
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[72] = L88_88
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[73] = L89_89
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[74] = L90_90
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[75] = L91_91
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[76] = L92_92
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[77] = L93_93
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[78] = L94_94
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[79] = L95_95
;({
  L17_17,
  [81] = L18_18(L19_19, L20_20)
})[80] = L96_96
L15_15 = L15_15(L16_16)
L13_13.Size = L15_15
L15_15 = NumberRange
L15_15 = L15_15.new
L16_16 = 0.5
L17_17 = 1
L15_15 = L15_15(L16_16, L17_17)
L13_13.Lifetime = L15_15
L15_15 = "Rate"
L16_16 = 0
L13_13[L15_15] = L16_16
L15_15 = "Speed"
L16_16 = NumberRange
L16_16 = L16_16.new
L17_17 = 5
L18_18 = 10
L16_16 = L16_16(L17_17, L18_18)
L13_13[L15_15] = L16_16
L15_15 = "Color"
L16_16 = ColorSequence
L16_16 = L16_16.new
L17_17 = Color3
L17_17 = L17_17.fromRGB
L18_18 = 255
L19_19 = 85
L20_20 = 255
L17_17 = L17_17(L18_18, L19_19, L20_20)
L18_18 = Color3
L18_18 = L18_18.fromRGB
L19_19 = 85
L20_20 = 255
L21_21 = 255
L96_96 = L18_18(L19_19, L20_20, L21_21)
L16_16 = L16_16(L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63, L64_64, L65_65, L66_66, L67_67, L68_68, L69_69, L70_70, L71_71, L72_72, L73_73, L74_74, L75_75, L76_76, L77_77, L78_78, L79_79, L80_80, L81_81, L82_82, L83_83, L84_84, L85_85, L86_86, L87_87, L88_88, L89_89, L90_90, L91_91, L92_92, L93_93, L94_94, L95_95, L96_96, L18_18(L19_19, L20_20, L21_21))
L13_13[L15_15] = L16_16
L17_17 = "Create"
L16_16 = L14_14
L15_15 = L14_14[L17_17]
L17_17 = L11_11
L18_18 = TweenInfo
L18_18 = L18_18.new
L19_19 = 0.5
L20_20 = Enum
L21_21 = "EasingStyle"
L20_20 = L20_20[L21_21]
L21_21 = "Quad"
L20_20 = L20_20[L21_21]
L21_21 = Enum
L22_22 = "EasingDirection"
L21_21 = L21_21[L22_22]
L22_22 = "Out"
L21_21 = L21_21[L22_22]
L18_18 = L18_18(L19_19, L20_20, L21_21)
L19_19 = {}
L20_20 = "Rotation"
L21_21 = 0
L19_19[L20_20] = L21_21
L15_15 = L15_15(L16_16, L17_17, L18_18, L19_19)
L16_16 = "MouseButton1Down"
L16_16 = L11_11[L16_16]
L18_18 = "Connect"
L17_17 = L16_16
L16_16 = L16_16[L18_18]
function L18_18()
  _UPVALUE0_.Rate = 100
  task.delay(1, function()
    _UPVALUE0_.Rate = 0
  end)
  _UPVALUE1_:Play()
  game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
  _UPVALUE1_.Completed:Connect(function()
    _UPVALUE0_.Rotation = 0
  end)
  _UPVALUE3_:Create(_UPVALUE2_, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 60, 0, 60)
  }):Play()
  _UPVALUE3_:Create(_UPVALUE2_, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 60, 0, 60)
  }).Completed:Connect(function()
    _UPVALUE0_:Create(_UPVALUE1_, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
      Size = UDim2.new(0, 50, 0, 50)
    }):Play()
  end)
end
L16_16(L17_17, L18_18)
L16_16 = task
L17_17 = "defer"
L16_16 = L16_16[L17_17]
function L17_17()
  local L0_204
  L0_204 = game
  L0_204 = L0_204.GetService
  L0_204 = L0_204(L0_204, "ReplicatedStorage")
  L0_204 = L0_204.FindFirstChild
  L0_204 = L0_204(L0_204, "Effect")
  if L0_204 then
    L0_204 = game
    L0_204 = L0_204.GetService
    L0_204 = L0_204(L0_204, "ReplicatedStorage")
    L0_204 = L0_204.Effect
    L0_204 = L0_204.FindFirstChild
    L0_204 = L0_204(L0_204, "Container")
    if L0_204 then
      L0_204 = game
      L0_204 = L0_204.GetService
      L0_204 = L0_204(L0_204, "ReplicatedStorage")
      L0_204 = L0_204.Effect
      L0_204 = L0_204.Container
      L0_204 = L0_204.FindFirstChild
      L0_204 = L0_204(L0_204, "Death")
      if L0_204 then
        L0_204 = require
        L0_204 = L0_204(game:GetService("ReplicatedStorage").Effect.Container.Death)
        if require(game:GetService("ReplicatedStorage").Util.CameraShaker) then
          require(game:GetService("ReplicatedStorage").Util.CameraShaker):Stop()
        end
        if hookfunction then
          hookfunction(L0_204, function()
            local L0_205, L1_206
            L1_206 = ...
          end)
        end
      end
    end
  end
end
L16_16(L17_17)
L16_16 = L2_2.Info
L18_18 = "AddButton"
L17_17 = L16_16
L16_16 = L16_16[L18_18]
L18_18 = {}
L18_18.Title = "Monster Hub"
L19_19 = "Description"
L20_20 = "Discord"
L18_18[L19_19] = L20_20
L19_19 = "Callback"
function L20_20()
  local L0_207
  L0_207 = setclipboard
  L0_207(tostring("https://discord.gg/hackercommunity"))
end
L18_18[L19_19] = L20_20
L16_16(L17_17, L18_18)
L16_16 = L2_2.Info
L18_18 = "AddButton"
L17_17 = L16_16
L16_16 = L16_16[L18_18]
L18_18 = {}
L19_19 = "Monster Roblox"
L18_18.Title = L19_19
L19_19 = "Description"
L20_20 = "Youtube"
L18_18[L19_19] = L20_20
L19_19 = "Callback"
function L20_20()
  local L0_208
  L0_208 = setclipboard
  L0_208(tostring("https://youtube.com/@monster_mythic?si=V4mZqAJWeaQLg2nQ"))
end
L18_18[L19_19] = L20_20
L16_16(L17_17, L18_18)
L16_16 = L2_2.Info
L18_18 = "AddButton"
L17_17 = L16_16
L16_16 = L16_16[L18_18]
L18_18 = {}
L19_19 = "Monster Roblox"
L18_18.Title = L19_19
L19_19 = "Description"
L20_20 = "Tiktok"
L18_18[L19_19] = L20_20
L19_19 = "Callback"
function L20_20()
  local L0_209
  L0_209 = setclipboard
  L0_209(tostring("https://www.tiktok.com/@monster_roblox123?_t=ZS-8uVGjEToZmL&_r=1"))
end
L18_18[L19_19] = L20_20
L16_16(L17_17, L18_18)
L16_16 = L2_2.Info
L18_18 = "AddParagraph"
L17_17 = L16_16
L16_16 = L16_16[L18_18]
L18_18 = {}
L19_19 = "Ph\195\161t tri\225\187\131n Monster"
L18_18.Title = L19_19
L19_19 = "Content"
L20_20 = "K\196\169 N\196\131ng: Del c\195\179"
L18_18[L19_19] = L20_20
L16_16(L17_17, L18_18)
L16_16 = nil
L17_17 = identifyexecutor
if L17_17 then
  L17_17 = identifyexecutor
  L17_17 = L17_17()
  L16_16 = L17_17
else
  L17_17 = getexecutorname
  if L17_17 then
    L17_17 = getexecutorname
    L17_17 = L17_17()
    L16_16 = L17_17
  end
end
if L16_16 then
  L17_17 = L2_2.Info
  L19_19 = "AddParagraph"
  L18_18 = L17_17
  L17_17 = L17_17[L19_19]
  L19_19 = {}
  L20_20 = "Client \196\144ang D\195\185ng"
  L19_19.Title = L20_20
  L20_20 = "Content"
  L19_19[L20_20] = L16_16
  L17_17(L18_18, L19_19)
end
L17_17 = L2_2.Info
L19_19 = "AddParagraph"
L18_18 = L17_17
L17_17 = L17_17[L19_19]
L19_19 = {}
L20_20 = "C\225\186\173p Nh\225\186\173t"
L19_19.Title = L20_20
L20_20 = "Content"
L21_21 = "T\195\180i s\225\186\189 C\225\186\173p nh\225\186\173t nhi\225\187\129u t\195\173nh n\196\131ng h\198\161n trong t\198\176\198\161ng lai"
L19_19[L20_20] = L21_21
L17_17(L18_18, L19_19)
L17_17 = L2_2.Info
L19_19 = "AddParagraph"
L18_18 = L17_17
L17_17 = L17_17[L19_19]
L19_19 = {}
L20_20 = "C\195\161c Client Android v\195\160 Ios H\225\187\151 Tr\225\187\163"
L19_19.Title = L20_20
L20_20 = "Content"
L21_21 = "T\225\186\165t C\225\186\163 Client Android v\195\160 Ios "
L19_19[L20_20] = L21_21
L17_17(L18_18, L19_19)
L17_17 = L2_2.Info
L19_19 = "AddParagraph"
L18_18 = L17_17
L17_17 = L17_17[L19_19]
L19_19 = {}
L20_20 = "C\195\161c Client Pc H\225\187\151 Tr\225\187\163"
L19_19.Title = L20_20
L20_20 = "Content"
L21_21 = "T\225\186\165t C\225\186\163 Client Pc"
L19_19[L20_20] = L21_21
L17_17(L18_18, L19_19)
L17_17 = _G
L18_18 = "FastAttackStrix_Mode"
L19_19 = "Super Fast Attack"
L17_17[L18_18] = L19_19
L17_17 = spawn
function L18_18()
  while wait() do
    if _G.FastAttackStrix_Mode then
      pcall(function()
        local L0_210
        L0_210 = _G
        L0_210 = L0_210.FastAttackStrix_Mode
        if L0_210 == "Super Fast Attack" then
          L0_210 = _G
          L0_210.Fast_Delay = 1.0E-9
        end
      end)
    end
  end
end
L17_17(L18_18)
L17_17 = L2_2.Main
L19_19 = "AddDropdown"
L18_18 = L17_17
L17_17 = L17_17[L19_19]
L19_19 = "DropdownSelectWeapon"
L20_20 = {}
L21_21 = "Ch\225\187\141n V\197\169 Kh\195\173"
L20_20.Title = L21_21
L21_21 = "Description"
L22_22 = ""
L20_20[L21_21] = L22_22
L21_21 = "Values"
L22_22 = {
  L23_23,
  L24_24,
  L25_25
}
L23_23 = "Melee"
L24_24 = "Sword"
L25_25 = "Blox Fruit"
L20_20[L21_21] = L22_22
L21_21 = "Multi"
L22_22 = false
L20_20[L21_21] = L22_22
L21_21 = "Default"
L22_22 = 1
L20_20[L21_21] = L22_22
L17_17 = L17_17(L18_18, L19_19, L20_20)
L20_20 = "SetValue"
L19_19 = L17_17
L18_18 = L17_17[L20_20]
L20_20 = "Melee"
L18_18(L19_19, L20_20)
L20_20 = "OnChanged"
L19_19 = L17_17
L18_18 = L17_17[L20_20]
function L20_20(A0_211)
  ChooseWeapon = A0_211
end
L18_18(L19_19, L20_20)
L18_18 = task
L18_18 = L18_18.spawn
function L19_19()
  while wait() do
    pcall(function()
      local L0_212
      if L0_212 == "Melee" then
        for _FORV_3_, _FORV_4_ in L0_212(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if _FORV_4_.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(_FORV_4_.Name)) then
            SelectWeapon = _FORV_4_.Name
          end
        end
      elseif L0_212 == "Sword" then
        for _FORV_3_, _FORV_4_ in L0_212(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if _FORV_4_.ToolTip == "Sword" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(_FORV_4_.Name)) then
            SelectWeapon = _FORV_4_.Name
          end
        end
      elseif L0_212 == "Blox Fruit" then
        for _FORV_3_, _FORV_4_ in L0_212(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if _FORV_4_.ToolTip == "Blox Fruit" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(_FORV_4_.Name)) then
            SelectWeapon = _FORV_4_.Name
          end
        end
      end
    end)
  end
end
L18_18(L19_19)
L18_18 = L2_2.Main
L20_20 = "AddToggle"
L19_19 = L18_18
L18_18 = L18_18[L20_20]
L20_20 = "ToggleLevel"
L21_21 = {}
L22_22 = "C\195\160y C\225\186\165p"
L21_21.Title = L22_22
L22_22 = "Description"
L23_23 = ""
L21_21[L22_22] = L23_23
L22_22 = "Default"
L23_23 = false
L21_21[L22_22] = L23_23
L18_18 = L18_18(L19_19, L20_20, L21_21)
L21_21 = "OnChanged"
L20_20 = L18_18
L19_19 = L18_18[L21_21]
function L21_21(A0_213)
  _G.AutoLevel = A0_213
  if A0_213 == false then
    wait()
    Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
  end
end
L19_19(L20_20, L21_21)
L19_19 = "ToggleLevel"
L19_19 = L3_3[L19_19]
L21_21 = "SetValue"
L20_20 = L19_19
L19_19 = L19_19[L21_21]
L21_21 = false
L19_19(L20_20, L21_21)
L19_19 = spawn
function L20_20()
  while task.wait() do
    if _G.AutoLevel then
      pcall(function()
        CheckLevel()
        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
          Tween(CFrameQ)
          if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
          end
        elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 and _FORV_4_.Name == Ms then
              repeat
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                bringmob = true
                AutoHaki()
                EquipTool(SelectWeapon)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                _FORV_4_.HumanoidRootPart.Transparency = 1
                _FORV_4_.Humanoid.JumpPower = 0
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.CanCollide = false
                FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                MonFarm = _FORV_4_.Name
              until not _G.AutoLevel or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(_FORV_4_.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
              bringmob = false
            end
          end
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren()) do
            if string.find(_FORV_4_.Name, NameMon) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _FORV_4_.Position).Magnitude >= 10 then
              Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
            end
          end
        end
      end)
    end
  end
end
L19_19(L20_20)
L19_19 = L2_2.Main
L21_21 = "AddToggle"
L20_20 = L19_19
L19_19 = L19_19[L21_21]
L21_21 = "ToggleMobAura"
L22_22 = {}
L23_23 = "\239\191\189\195\161nh Qu\195\161i \225\187\158 G\225\186\167n"
L22_22.Title = L23_23
L23_23 = "Description"
L24_24 = ""
L22_22[L23_23] = L24_24
L23_23 = "Default"
L24_24 = false
L22_22[L23_23] = L24_24
L19_19 = L19_19(L20_20, L21_21, L22_22)
L22_22 = "OnChanged"
L21_21 = L19_19
L20_20 = L19_19[L22_22]
function L22_22(A0_214)
  _G.AutoNear = A0_214
  if A0_214 == false then
    wait()
    Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
  end
end
L20_20(L21_21, L22_22)
L20_20 = "ToggleMobAura"
L20_20 = L3_3[L20_20]
L22_22 = "SetValue"
L21_21 = L20_20
L20_20 = L20_20[L22_22]
L22_22 = false
L20_20(L21_21, L22_22)
L20_20 = spawn
function L21_21()
  while wait() do
    if _G.AutoNear then
      pcall(function()
        local L0_215
        for _FORV_3_, _FORV_4_ in L0_215(game.Workspace.Enemies:GetChildren()) do
          if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 and _FORV_4_.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _FORV_4_:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
            repeat
              wait(_G.Fast_Delay)
              AttackNoCoolDown()
              bringmob = true
              AutoHaki()
              EquipTool(SelectWeapon)
              Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
              _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              _FORV_4_.HumanoidRootPart.Transparency = 1
              _FORV_4_.Humanoid.JumpPower = 0
              _FORV_4_.Humanoid.WalkSpeed = 0
              _FORV_4_.HumanoidRootPart.CanCollide = false
              FarmPos = _FORV_4_.HumanoidRootPart.CFrame
              MonFarm = _FORV_4_.Name
            until not _G.AutoNear or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(_FORV_4_.Name)
            bringmob = false
          end
        end
      end)
    end
  end
end
L20_20(L21_21)
L20_20 = L2_2.Main
L22_22 = "AddToggle"
L21_21 = L20_20
L20_20 = L20_20[L22_22]
L22_22 = "ToggleCastleRaid"
L23_23 = {}
L24_24 = "\239\191\189\195\161nh H\225\186\163i T\225\186\183c"
L23_23.Title = L24_24
L24_24 = "Description"
L25_25 = ""
L23_23[L24_24] = L25_25
L24_24 = "Default"
L25_25 = false
L23_23[L24_24] = L25_25
L20_20 = L20_20(L21_21, L22_22, L23_23)
L23_23 = "OnChanged"
L22_22 = L20_20
L21_21 = L20_20[L23_23]
function L23_23(A0_216)
  _G.CastleRaid = A0_216
end
L21_21(L22_22, L23_23)
L21_21 = "ToggleCastleRaid"
L21_21 = L3_3[L21_21]
L23_23 = "SetValue"
L22_22 = L21_21
L21_21 = L21_21[L23_23]
L23_23 = false
L21_21(L22_22, L23_23)
L21_21 = spawn
function L22_22()
  while wait() do
    if _G.CastleRaid then
      pcall(function()
        local L0_217
        L0_217 = CFrame
        L0_217 = L0_217.new
        L0_217 = L0_217(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015E-9, 0.380223751, 3.5881019E-8, 1, -1.06665446E-7, -0.380223751, 1.12297109E-7, 0.924894512)
        if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
          for _FORV_4_, _FORV_5_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _G.CastleRaid and _FORV_5_:FindFirstChild("HumanoidRootPart") and _FORV_5_:FindFirstChild("Humanoid") and _FORV_5_.Humanoid.Health > 0 and (_FORV_5_.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
              repeat
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                AutoHaki()
                EquipTool(SelectWeapon)
                _FORV_5_.HumanoidRootPart.CanCollide = false
                _FORV_5_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
              until _FORV_5_.Humanoid.Health <= 0 or not _FORV_5_.Parent or not _G.CastleRaid
            end
          end
        else
          Tween(L0_217)
        end
      end)
    end
  end
end
L21_21(L22_22)
L21_21 = L2_2.Main
L23_23 = "AddToggle"
L22_22 = L21_21
L21_21 = L21_21[L23_23]
L23_23 = "ToggleHakiFortress"
L24_24 = {}
L25_25 = "B\225\186\173t Haki M\195\160u Ph\195\161o \196\144\195\160i"
L24_24.Title = L25_25
L25_25 = "Description"
L26_26 = ""
L24_24[L25_25] = L26_26
L25_25 = "Default"
L26_26 = false
L24_24[L25_25] = L26_26
L21_21 = L21_21(L22_22, L23_23, L24_24)
L24_24 = "OnChanged"
L23_23 = L21_21
L22_22 = L21_21[L24_24]
function L24_24(A0_218)
  _G.EnableHakiFortress = A0_218
end
L22_22(L23_23, L24_24)
L22_22 = "ToggleHakiFortress"
L22_22 = L3_3[L22_22]
L24_24 = "SetValue"
L23_23 = L22_22
L22_22 = L22_22[L24_24]
L24_24 = false
L22_22(L23_23, L24_24)
function L22_22(A0_219, A1_220)
  local L2_221
  L2_221 = {}
  L2_221[1] = {
    StorageName = A0_219,
    Type = "AuraSkin",
    Context = "Equip"
  }
  game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/FruitCustomizerRF"):InvokeServer(unpack(L2_221))
  Tween2(A1_220)
end
function L23_23(A0_222, A1_223)
  local L2_224
  L2_224 = game
  L2_224 = L2_224.Players
  L2_224 = L2_224.LocalPlayer
  L2_224 = L2_224.Character
  if not L2_224 or not L2_224:FindFirstChild("HumanoidRootPart") then
    return false
  end
end
L24_24 = spawn
function L25_25()
  while true do
    if _G.EnableHakiFortress then
      _UPVALUE0_("Snow White", Vector3.new(-4971.71826171875, 335.9582214355469, -3720.0595703125))
      while not _UPVALUE1_(Vector3.new(-4971.71826171875, 335.9582214355469, -3720.0595703125), 1) do
        wait(0.1)
      end
      wait(0.5)
      _UPVALUE0_("Pure Red", Vector3.new(-5414.92041015625, 314.2582092285156, -2212.20166015625))
      while not _UPVALUE1_(Vector3.new(-5414.92041015625, 314.2582092285156, -2212.20166015625), 1) do
        wait(0.1)
      end
      wait(0.5)
      _UPVALUE0_("Winter Sky", Vector3.new(-5420.26318359375, 1089.3582763671875, -2666.8193359375))
      while not _UPVALUE1_(Vector3.new(-5420.26318359375, 1089.3582763671875, -2666.8193359375), 1) do
        wait(0.1)
      end
      wait(0.5)
      _G.EnableHakiFortress = false
    end
    wait(0.5)
  end
end
L24_24(L25_25)
L24_24 = L2_2.Main
L26_26 = "AddToggle"
L25_25 = L24_24
L24_24 = L24_24[L26_26]
L26_26 = "ToggleCollectChest"
L27_27 = {}
L28_28 = "L\225\187\165m R\198\176\198\161ng"
L27_27.Title = L28_28
L28_28 = "Description"
L29_29 = ""
L27_27[L28_28] = L29_29
L28_28 = "Default"
L29_29 = false
L27_27[L28_28] = L29_29
L24_24 = L24_24(L25_25, L26_26, L27_27)
L27_27 = "OnChanged"
L26_26 = L24_24
L25_25 = L24_24[L27_27]
function L27_27(A0_225)
  _G.AutoCollectChest = A0_225
end
L25_25(L26_26, L27_27)
L25_25 = spawn
function L26_26()
  local L0_226, L1_227, L2_228, L3_229, L4_230, L5_231, L6_232, L7_233, L8_234, L9_235, L10_236, L11_237, L12_238, L13_239
  while true do
    L0_226 = wait
    L0_226 = L0_226()
    if L0_226 then
      L0_226 = _G
      L0_226 = L0_226.AutoCollectChest
      if L0_226 then
        L0_226 = game
        L1_227 = L0_226
        L0_226 = L0_226.GetService
        L2_228 = "Players"
        L0_226 = L0_226(L1_227, L2_228)
        L1_227 = L0_226.LocalPlayer
        L2_228 = L1_227.Character
        if not L2_228 then
          L2_228 = L1_227.CharacterAdded
          L3_229 = L2_228
          L2_228 = L2_228.Wait
          L2_228 = L2_228(L3_229)
        end
        L4_230 = L2_228
        L3_229 = L2_228.GetPivot
        L3_229 = L3_229(L4_230)
        L3_229 = L3_229.Position
        L4_230 = game
        L5_231 = L4_230
        L4_230 = L4_230.GetService
        L6_232 = "CollectionService"
        L4_230 = L4_230(L5_231, L6_232)
        L6_232 = L4_230
        L5_231 = L4_230.GetTagged
        L7_233 = "_ChestTagged"
        L5_231 = L5_231(L6_232, L7_233)
        L6_232 = math
        L6_232 = L6_232.huge
        L7_233 = nil
        for L11_237 = 1, #L5_231 do
          L12_238 = L5_231[L11_237]
          L13_239 = L12_238.GetPivot
          L13_239 = L13_239(L12_238)
          L13_239 = L13_239.Position
          L13_239 = L13_239 - L3_229
          L13_239 = L13_239.Magnitude
          if not L12_238:GetAttribute("IsDisabled") and L6_232 > L13_239 then
            L6_232, L7_233 = L13_239, L12_238
          end
        end
        if L7_233 then
          L11_237 = L9_235
          L10_236(L11_237)
        end
      end
    end
  end
end
L25_25(L26_26)
L25_25 = L2_2.Main
L27_27 = "AddToggle"
L26_26 = L25_25
L25_25 = L25_25[L27_27]
L27_27 = "ToggleCollectBerry"
L28_28 = {}
L29_29 = "Bay \196\144\225\186\191n Khu V\225\187\177c C\195\179 Berry + Hop"
L28_28.Title = L29_29
L29_29 = "Description"
L30_30 = ""
L28_28[L29_29] = L30_30
L29_29 = "Default"
L30_30 = false
L28_28[L29_29] = L30_30
L25_25 = L25_25(L26_26, L27_27, L28_28)
L28_28 = "OnChanged"
L27_27 = L25_25
L26_26 = L25_25[L28_28]
function L28_28(A0_240)
  _G.AutoCollectBerry = A0_240
end
L26_26(L27_27, L28_28)
L26_26 = spawn
function L27_27()
  local L0_241, L1_242, L2_243, L3_244, L4_245, L5_246, L6_247, L7_248, L8_249, L9_250, L10_251, L11_252, L12_253, L13_254, L14_255, L15_256, L16_257, L17_258, L18_259, L19_260
  while true do
    L0_241 = wait
    L0_241 = L0_241()
    if L0_241 then
      L0_241 = _G
      L0_241 = L0_241.AutoCollectBerry
      if L0_241 then
        L0_241 = game
        L1_242 = L0_241
        L0_241 = L0_241.GetService
        L2_243 = "Players"
        L0_241 = L0_241(L1_242, L2_243)
        L1_242 = L0_241.LocalPlayer
        L2_243 = L1_242.Character
        if not L2_243 then
          L2_243 = L1_242.CharacterAdded
          L3_244 = L2_243
          L2_243 = L2_243.Wait
          L2_243 = L2_243(L3_244)
        end
        L4_245 = L2_243
        L3_244 = L2_243.GetPivot
        L3_244 = L3_244(L4_245)
        L3_244 = L3_244.Position
        L4_245 = game
        L5_246 = L4_245
        L4_245 = L4_245.GetService
        L6_247 = "CollectionService"
        L4_245 = L4_245(L5_246, L6_247)
        L6_247 = L4_245
        L5_246 = L4_245.GetTagged
        L7_248 = "BerryBush"
        L5_246 = L5_246(L6_247, L7_248)
        L6_247 = math
        L6_247 = L6_247.huge
        L7_248, L8_249 = nil, nil
        for L12_253 = 1, #L5_246 do
          L13_254 = L5_246[L12_253]
          L19_260 = L15_256(L16_257)
          for L17_258, L18_259 in L14_255(L15_256, L16_257, L17_258, L18_259, L19_260, L15_256(L16_257)) do
            L19_260 = L13_254.Parent
            L19_260 = L19_260.GetPivot
            L19_260 = L19_260(L19_260)
            L19_260 = L19_260.Position
            L19_260 = L19_260 - L3_244
            L19_260 = L19_260.Magnitude
            if L6_247 > L19_260 then
              L6_247, L7_248, L8_249 = L19_260, L13_254, L18_259
            end
          end
        end
        if L7_248 then
          L12_253 = L10_251
          L11_252(L12_253)
          L12_253 = L11_252
          L13_254 = {}
          L13_254.Title = "Strix"
          L13_254.Content = L14_255
          L13_254.Duration = 10
          L11_252(L12_253, L13_254)
        else
          L9_250()
        end
      end
    end
  end
end
L26_26(L27_27)
L26_26 = L2_2.Main
L28_28 = "AddSection"
L27_27 = L26_26
L26_26 = L26_26[L28_28]
L28_28 = "Th\195\180ng Th\225\186\161o"
L26_26 = L26_26(L27_27, L28_28)
L27_27 = L2_2.Main
L29_29 = "AddDropdown"
L28_28 = L27_27
L27_27 = L27_27[L29_29]
L29_29 = "DropdownMastery"
L30_30 = {}
L31_31 = "Ch\225\187\141n Lo\225\186\161i"
L30_30.Title = L31_31
L31_31 = "Description"
L32_32 = ""
L30_30[L31_31] = L32_32
L31_31 = "Values"
L32_32 = {
  L33_33,
  L34_34,
  L35_35,
  L36_36,
  L37_37,
  L38_38
}
L33_33 = "Level"
L34_34 = "Level No Quest"
L35_35 = "Near Mob"
L36_36 = "Bone"
L37_37 = "Cake"
L38_38 = "Ecto"
L30_30[L31_31] = L32_32
L31_31 = "Multi"
L32_32 = false
L30_30[L31_31] = L32_32
L31_31 = "Default"
L32_32 = 1
L30_30[L31_31] = L32_32
L27_27 = L27_27(L28_28, L29_29, L30_30)
L30_30 = "SetValue"
L29_29 = L27_27
L28_28 = L27_27[L30_30]
L30_30 = TypeMastery
L28_28(L29_29, L30_30)
L30_30 = "OnChanged"
L29_29 = L27_27
L28_28 = L27_27[L30_30]
function L30_30(A0_261)
  TypeMastery = A0_261
end
L28_28(L29_29, L30_30)
L28_28 = L2_2.Main
L30_30 = "AddToggle"
L29_29 = L28_28
L28_28 = L28_28[L30_30]
L30_30 = "ToggleMasteryFruit"
L31_31 = {}
L32_32 = "C\195\160y Th\195\180ng Th\225\186\161o Tr\195\161i"
L31_31.Title = L32_32
L32_32 = "Description"
L33_33 = ""
L31_31[L32_32] = L33_33
L32_32 = "Default"
L33_33 = false
L31_31[L32_32] = L33_33
L28_28 = L28_28(L29_29, L30_30, L31_31)
L31_31 = "OnChanged"
L30_30 = L28_28
L29_29 = L28_28[L31_31]
function L31_31(A0_262)
  AutoFarmMasDevilFruit = A0_262
end
L29_29(L30_30, L31_31)
L29_29 = "ToggleMasteryFruit"
L29_29 = L3_3[L29_29]
L31_31 = "SetValue"
L30_30 = L29_29
L29_29 = L29_29[L31_31]
L31_31 = false
L29_29(L30_30, L31_31)
L29_29 = L2_2.Main
L31_31 = "AddToggle"
L30_30 = L29_29
L29_29 = L29_29[L31_31]
L31_31 = "ToggleMasteryGun"
L32_32 = {}
L33_33 = "C\195\160y Th\195\180ng Th\225\186\161o S\195\186ng"
L32_32.Title = L33_33
L33_33 = "Description"
L34_34 = ""
L32_32[L33_33] = L34_34
L33_33 = "Default"
L34_34 = false
L32_32[L33_33] = L34_34
L29_29 = L29_29(L30_30, L31_31, L32_32)
L32_32 = "OnChanged"
L31_31 = L29_29
L30_30 = L29_29[L32_32]
function L32_32(A0_263)
  AutoFarmMasGun = A0_263
end
L30_30(L31_31, L32_32)
L30_30 = L2_2.Main
L32_32 = "AddSlider"
L31_31 = L30_30
L30_30 = L30_30[L32_32]
L32_32 = "SliderHealt"
L33_33 = {}
L34_34 = "Ch\225\187\141n M\195\161u Qu\195\161i"
L33_33.Title = L34_34
L34_34 = "Description"
L35_35 = ""
L33_33[L34_34] = L35_35
L34_34 = "Default"
L35_35 = 20
L33_33[L34_34] = L35_35
L34_34 = "Min"
L35_35 = 0
L33_33[L34_34] = L35_35
L34_34 = "Max"
L35_35 = 100
L33_33[L34_34] = L35_35
L34_34 = "Rounding"
L35_35 = 1
L33_33[L34_34] = L35_35
L34_34 = "Callback"
function L35_35(A0_264)
  KillPercent = A0_264
end
L33_33[L34_34] = L35_35
L30_30 = L30_30(L31_31, L32_32, L33_33)
L33_33 = "OnChanged"
L32_32 = L30_30
L31_31 = L30_30[L33_33]
function L33_33(A0_265)
  KillPercent = A0_265
end
L31_31(L32_32, L33_33)
L33_33 = "SetValue"
L32_32 = L30_30
L31_31 = L30_30[L33_33]
L33_33 = 20
L31_31(L32_32, L33_33)
L31_31 = spawn
function L32_32()
  while task.wait() do
    if _G.UseSkill then
      pcall(function()
        local L0_266
        if L0_266 then
          for _FORV_3_, _FORV_4_ in L0_266(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_.Name == MonFarm and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
              repeat
                game:GetService("RunService").Heartbeat:wait()
                EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                PositionSkillMasteryDevilFruit = _FORV_4_.HumanoidRootPart.Position
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                  game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = PositionSkillMasteryDevilFruit
                  if SkillZ and game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 1 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                    wait()
                    game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                  end
                  if SkillX and game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 1 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                    wait()
                    game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                  end
                  if SkillC and game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 1 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                    wait()
                    game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                  end
                  if SkillV and game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 1 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                    wait()
                    game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                  end
                  if SkillF and game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 1 then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                    wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                  end
                end
              until not AutoFarmMasDevilFruit or not _G.UseSkill or _FORV_4_.Humanoid.Health == 0
            end
          end
        end
      end)
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasDevilFruit and TypeMastery == "Near Mob" then
      pcall(function()
        local L0_267
        for _FORV_3_, _FORV_4_ in L0_267(game.Workspace.Enemies:GetChildren()) do
          if _FORV_4_.Name and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _FORV_4_:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
            repeat
              wait(_G.Fast_Delay)
              if _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
                _G.UseSkill = true
              else
                _G.UseSkill = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                _FORV_4_.HumanoidRootPart.Transparency = 1
                _FORV_4_.Humanoid.JumpPower = 0
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.CanCollide = false
                FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                MonFarm = _FORV_4_.Name
                AttackNoCoolDown()
              end
            until not AutoFarmMasDevilFruit or not MasteryType == "Near Mob" or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health == 0 or not TypeMastery == "Near Mob"
            bringmob = false
            _G.UseSkill = false
          end
        end
      end)
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasDevilFruit and TypeMastery == "Ecto" then
      pcall(function()
        local L0_268
        L0_268 = CFrame
        L0_268 = L0_268.new
        L0_268 = L0_268(904.4072265625, 181.05767822266, 33341.38671875)
        Tween(L0_268)
      end)
      if (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      end
      for _FORV_4_, _FORV_5_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if _FORV_5_:FindFirstChild("Humanoid") and _FORV_5_:FindFirstChild("HumanoidRootPart") and (_FORV_5_.Name == "Ship Steward" or _FORV_5_.Name == "Ship Engineer" or _FORV_5_.Name == "Ship Deckhand" or _FORV_5_.Name == "Ship Officer") then
          repeat
            wait(_G.Fast_Delay)
            if _FORV_5_.Humanoid.Health <= _FORV_5_.Humanoid.MaxHealth * KillPercent / 100 then
              _G.UseSkill = true
            else
              _G.UseSkill = false
              AutoHaki()
              bringmob = true
              EquipTool(SelectWeapon)
              Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
              _FORV_5_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              _FORV_5_.HumanoidRootPart.Transparency = 1
              _FORV_5_.Humanoid.JumpPower = 0
              _FORV_5_.Humanoid.WalkSpeed = 0
              _FORV_5_.HumanoidRootPart.CanCollide = false
              FarmPos = _FORV_5_.HumanoidRootPart.CFrame
              MonFarm = _FORV_5_.Name
              AttackNoCoolDown()
            end
          until not AutoFarmMasDevilFruit or not MasteryType == "Ecto" or not _FORV_5_.Parent or _FORV_5_.Humanoid.Health == 0 or not TypeMastery == "Ecto"
          bringmob = false
          _G.UseSkill = false
        end
      end
      for _FORV_4_, _FORV_5_ in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if _FORV_5_.Name == "Ship Steward" then
          Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_5_.Name == "Ship Engineer" then
          Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_5_.Name == "Ship Deckhand" then
          Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_5_.Name == "Ship Officer" then
          Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
        end
      end
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasDevilFruit and TypeMastery == "Cake" then
      pcall(function()
        local L0_269
        L0_269 = CFrame
        L0_269 = L0_269.new
        L0_269 = L0_269(-9508.5673828125, 142.1398468017578, 5737.3603515625)
        Tween(L0_269)
      end)
      for _FORV_3_, _FORV_4_ in pairs(game.Workspace.Enemies:GetChildren()) do
        if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and (_FORV_4_.Name == "Cookie Crafter" or _FORV_4_.Name == "Cake Guard" or _FORV_4_.Name == "Baking Staff" or _FORV_4_.Name == "Head Baker") then
          repeat
            wait(_G.Fast_Delay)
            if _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
              _G.UseSkill = true
            else
              _G.UseSkill = false
              AutoHaki()
              bringmob = true
              EquipTool(SelectWeapon)
              Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
              _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              _FORV_4_.HumanoidRootPart.Transparency = 1
              _FORV_4_.Humanoid.JumpPower = 0
              _FORV_4_.Humanoid.WalkSpeed = 0
              _FORV_4_.HumanoidRootPart.CanCollide = false
              FarmPos = _FORV_4_.HumanoidRootPart.CFrame
              MonFarm = _FORV_4_.Name
              AttackNoCoolDown()
            end
          until not AutoFarmMasDevilFruit or not MasteryType == "Cake" or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health == 0 or not TypeMastery == "Cake"
          bringmob = false
          _G.UseSkill = false
        end
      end
      for _FORV_3_, _FORV_4_ in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if _FORV_4_.Name == "Cookie Crafter" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Cake Guard" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Baking Staff" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Head Baker" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        end
      end
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasDevilFruit and TypeMastery == "Level No Quest" then
      pcall(function()
        CheckLevel()
        Tween(CFrameQ)
      end)
      for _FORV_3_, _FORV_4_ in pairs(game.Workspace.Enemies:GetChildren()) do
        if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Name == Ms then
          repeat
            wait(_G.Fast_Delay)
            if _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
              _G.UseSkill = true
            else
              _G.UseSkill = false
              AutoHaki()
              bringmob = true
              EquipTool(SelectWeapon)
              Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
              _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              _FORV_4_.HumanoidRootPart.Transparency = 1
              _FORV_4_.Humanoid.JumpPower = 0
              _FORV_4_.Humanoid.WalkSpeed = 0
              _FORV_4_.HumanoidRootPart.CanCollide = false
              FarmPos = _FORV_4_.HumanoidRootPart.CFrame
              MonFarm = _FORV_4_.Name
              AttackNoCoolDown()
            end
          until not AutoFarmMasDevilFruit or not MasteryType == "Level No Quest" or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health == 0 or not TypeMastery == "Level No Quest"
          bringmob = false
          _G.UseSkill = false
        end
      end
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasDevilFruit and TypeMastery == "Level" then
      pcall(function()
        CheckLevel()
        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
          Tween(CFrameQ)
        end
        if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
        end
      end)
      if (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) and game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
        for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
          if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Name == Ms then
            repeat
              wait(_G.Fast_Delay)
              if _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
                _G.UseSkill = true
              else
                _G.UseSkill = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                _FORV_4_.HumanoidRootPart.Transparency = 1
                _FORV_4_.Humanoid.JumpPower = 0
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.CanCollide = false
                FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                MonFarm = _FORV_4_.Name
                AttackNoCoolDown()
              end
            until not AutoFarmMasDevilFruit or not MasteryType == "Level" or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health == 0 or not TypeMastery == "Level"
            bringmob = false
            _G.UseSkill = false
          end
        end
      end
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasDevilFruit and TypeMastery == "Bone" then
      pcall(function()
        local L0_270
        L0_270 = CFrame
        L0_270 = L0_270.new
        L0_270 = L0_270(-9508.5673828125, 142.1398468017578, 5737.3603515625)
        Tween(L0_270)
      end)
      for _FORV_3_, _FORV_4_ in pairs(game.Workspace.Enemies:GetChildren()) do
        if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and (_FORV_4_.Name == "Reborn Skeleton" or _FORV_4_.Name == "Living Zombie" or _FORV_4_.Name == "Demonic Soul" or _FORV_4_.Name == "Posessed Mummy") then
          repeat
            wait(_G.Fast_Delay)
            if _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
              _G.UseSkill = true
            else
              _G.UseSkill = false
              AutoHaki()
              bringmob = true
              EquipTool(SelectWeapon)
              Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
              _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              _FORV_4_.HumanoidRootPart.Transparency = 1
              _FORV_4_.Humanoid.JumpPower = 0
              _FORV_4_.Humanoid.WalkSpeed = 0
              _FORV_4_.HumanoidRootPart.CanCollide = false
              FarmPos = _FORV_4_.HumanoidRootPart.CFrame
              MonFarm = _FORV_4_.Name
              AttackNoCoolDown()
            end
          until not AutoFarmMasDevilFruit or not MasteryType == "Bone" or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health == 0 or not TypeMastery == "Bone"
          bringmob = false
          _G.UseSkill = false
        end
      end
      for _FORV_3_, _FORV_4_ in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if _FORV_4_.Name == "Reborn Skeleton" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Living Zombie" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Demonic Soul" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Posessed Mummy" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        end
      end
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while task.wait() do
    if _G.UseSkillGun then
      pcall(function()
        local L0_271
        if L0_271 then
          for _FORV_3_, _FORV_4_ in L0_271(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_.Name == MonFarm and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
              repeat
                game:GetService("RunService").Heartbeat:wait()
                EquipToolGun()
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                PositionSkillMasteryGun = _FORV_4_.HumanoidRootPart.Position
                if SkillZ then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                  wait()
                  game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                end
                if SkillX then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                  wait()
                  game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                end
                if SkillC then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                  wait()
                  game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                end
                if SkillV then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                  wait()
                  game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                end
                if SkillF then
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                  wait()
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                end
              until not AutoFarmMasGun or not _G.UseSkillGun or _FORV_4_.Humanoid.Health == 0
            end
          end
        end
      end)
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasGun and TypeMastery == "Near Mob" then
      pcall(function()
        local L0_272
        for _FORV_3_, _FORV_4_ in L0_272(game.Workspace.Enemies:GetChildren()) do
          if _FORV_4_.Name and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _FORV_4_:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
            repeat
              wait(_G.Fast_Delay)
              if _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
                _G.UseSkillGun = true
              else
                _G.UseSkillGun = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                _FORV_4_.HumanoidRootPart.Transparency = 1
                _FORV_4_.Humanoid.JumpPower = 0
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.CanCollide = false
                FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                MonFarm = _FORV_4_.Name
                AttackNoCoolDown()
              end
            until not AutoFarmMasGun or not MasteryType == "Near Mob" or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health == 0 or not TypeMastery == "Near Mob"
            bringmob = false
            _G.UseSkillGun = false
          end
        end
      end)
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasGun and TypeMastery == "Ecto" then
      pcall(function()
        local L0_273
        L0_273 = CFrame
        L0_273 = L0_273.new
        L0_273 = L0_273(904.4072265625, 181.05767822266, 33341.38671875)
        Tween(L0_273)
      end)
      if (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      end
      for _FORV_4_, _FORV_5_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if _FORV_5_:FindFirstChild("Humanoid") and _FORV_5_:FindFirstChild("HumanoidRootPart") and (_FORV_5_.Name == "Ship Steward" or _FORV_5_.Name == "Ship Engineer" or _FORV_5_.Name == "Ship Deckhand" or _FORV_5_.Name == "Ship Officer") then
          repeat
            wait(_G.Fast_Delay)
            if _FORV_5_.Humanoid.Health <= _FORV_5_.Humanoid.MaxHealth * KillPercent / 100 then
              _G.UseSkillGun = true
            else
              _G.UseSkillGun = false
              AutoHaki()
              bringmob = true
              EquipTool(SelectWeapon)
              Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
              _FORV_5_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              _FORV_5_.HumanoidRootPart.Transparency = 1
              _FORV_5_.Humanoid.JumpPower = 0
              _FORV_5_.Humanoid.WalkSpeed = 0
              _FORV_5_.HumanoidRootPart.CanCollide = false
              FarmPos = _FORV_5_.HumanoidRootPart.CFrame
              MonFarm = _FORV_5_.Name
              AttackNoCoolDown()
            end
          until not AutoFarmMasGun or not MasteryType == "Ecto" or not _FORV_5_.Parent or _FORV_5_.Humanoid.Health == 0 or not TypeMastery == "Ecto"
          bringmob = false
          _G.UseSkillGun = false
        end
      end
      for _FORV_4_, _FORV_5_ in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if _FORV_5_.Name == "Ship Steward" then
          Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_5_.Name == "Ship Engineer" then
          Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_5_.Name == "Ship Deckhand" then
          Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_5_.Name == "Ship Officer" then
          Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
        end
      end
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasGun and TypeMastery == "Cake" then
      pcall(function()
        local L0_274
        L0_274 = CFrame
        L0_274 = L0_274.new
        L0_274 = L0_274(-1579.9111328125, 329.7358703613281, -12310.365234375)
        Tween(L0_274)
      end)
      for _FORV_3_, _FORV_4_ in pairs(game.Workspace.Enemies:GetChildren()) do
        if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and (_FORV_4_.Name == "Cookie Crafter" or _FORV_4_.Name == "Cake Guard" or _FORV_4_.Name == "Baking Staff" or _FORV_4_.Name == "Head Baker") then
          repeat
            wait(_G.Fast_Delay)
            if _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
              _G.UseSkillGun = true
            else
              _G.UseSkillGun = false
              AutoHaki()
              bringmob = true
              EquipTool(SelectWeapon)
              Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
              _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              _FORV_4_.HumanoidRootPart.Transparency = 1
              _FORV_4_.Humanoid.JumpPower = 0
              _FORV_4_.Humanoid.WalkSpeed = 0
              _FORV_4_.HumanoidRootPart.CanCollide = false
              FarmPos = _FORV_4_.HumanoidRootPart.CFrame
              MonFarm = _FORV_4_.Name
              AttackNoCoolDown()
            end
          until not AutoFarmMasGun or not MasteryType == "Cake" or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health == 0 or not TypeMastery == "Cake"
          bringmob = false
          _G.UseSkillGun = false
        end
      end
      for _FORV_3_, _FORV_4_ in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if _FORV_4_.Name == "Cookie Crafter" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Cake Guard" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Baking Staff" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Head Baker" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        end
      end
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasGun and TypeMastery == "Level" then
      pcall(function()
        CheckLevel()
        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
          Tween(CFrameQ)
        end
        if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
        end
      end)
      if (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) and game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
        for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
          if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Name == Ms then
            repeat
              wait(_G.Fast_Delay)
              if _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
                _G.UseSkillGun = true
              else
                _G.UseSkillGun = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                _FORV_4_.HumanoidRootPart.Transparency = 1
                _FORV_4_.Humanoid.JumpPower = 0
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.CanCollide = false
                FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                MonFarm = _FORV_4_.Name
                AttackNoCoolDown()
              end
            until not AutoFarmMasGun or not MasteryType == "Level" or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health == 0 or not TypeMastery == "Level"
            bringmob = false
            _G.UseSkillGun = false
          end
        end
      end
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasGun and TypeMastery == "Level No Quest" then
      pcall(function()
        CheckLevel()
        Tween(CFrameQ)
      end)
      for _FORV_3_, _FORV_4_ in pairs(game.Workspace.Enemies:GetChildren()) do
        if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Name == Ms then
          repeat
            wait(_G.Fast_Delay)
            if _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
              _G.UseSkillGun = true
            else
              _G.UseSkillGun = false
              AutoHaki()
              bringmob = true
              EquipTool(SelectWeapon)
              Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
              _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              _FORV_4_.HumanoidRootPart.Transparency = 1
              _FORV_4_.Humanoid.JumpPower = 0
              _FORV_4_.Humanoid.WalkSpeed = 0
              _FORV_4_.HumanoidRootPart.CanCollide = false
              FarmPos = _FORV_4_.HumanoidRootPart.CFrame
              MonFarm = _FORV_4_.Name
              AttackNoCoolDown()
            end
          until not AutoFarmMasGun or not MasteryType == "Level No Quest" or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health == 0 or not TypeMastery == "Level No Quest"
          bringmob = false
          _G.UseSkillGun = false
        end
      end
    end
  end
end
L31_31(L32_32)
L31_31 = spawn
function L32_32()
  while wait() do
    if AutoFarmMasGun and TypeMastery == "Bone" then
      pcall(function()
        local L0_275
        L0_275 = CFrame
        L0_275 = L0_275.new
        L0_275 = L0_275(-9508.5673828125, 142.1398468017578, 5737.3603515625)
        Tween(L0_275)
      end)
      for _FORV_3_, _FORV_4_ in pairs(game.Workspace.Enemies:GetChildren()) do
        if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and (_FORV_4_.Name == "Reborn Skeleton" or _FORV_4_.Name == "Living Zombie" or _FORV_4_.Name == "Demonic Soul" or _FORV_4_.Name == "Posessed Mummy") then
          repeat
            wait(_G.Fast_Delay)
            if _FORV_4_.Humanoid.Health <= _FORV_4_.Humanoid.MaxHealth * KillPercent / 100 then
              _G.UseSkillGun = true
            else
              _G.UseSkillGun = false
              AutoHaki()
              bringmob = true
              EquipTool(SelectWeapon)
              Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
              _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              _FORV_4_.HumanoidRootPart.Transparency = 1
              _FORV_4_.Humanoid.JumpPower = 0
              _FORV_4_.Humanoid.WalkSpeed = 0
              _FORV_4_.HumanoidRootPart.CanCollide = false
              FarmPos = _FORV_4_.HumanoidRootPart.CFrame
              MonFarm = _FORV_4_.Name
              AttackNoCoolDown()
            end
          until not AutoFarmMasGun or not MasteryType == "Bone" or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health == 0 or not TypeMastery == "Bone"
          bringmob = false
          _G.UseSkillGun = false
        end
      end
      for _FORV_3_, _FORV_4_ in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if _FORV_4_.Name == "Reborn Skeleton" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Living Zombie" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Demonic Soul" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        elseif _FORV_4_.Name == "Posessed Mummy" then
          Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
        end
      end
    end
  end
end
L31_31(L32_32)
function L31_31()
  pcall(function()
    local L0_276, L1_277, L2_278, L3_279, L4_280, L5_281
    L5_281 = L1_277(L2_278)
    for L3_279, L4_280 in L0_276(L1_277, L2_278, L3_279, L4_280, L5_281, L1_277(L2_278)) do
      L5_281 = L4_280.ToolTip
      if L5_281 == "Gun" then
        L5_281 = L4_280.IsA
        L5_281 = L5_281(L4_280, "Tool")
        if L5_281 then
          L5_281 = game
          L5_281 = L5_281.Players
          L5_281 = L5_281.LocalPlayer
          L5_281 = L5_281.Backpack
          L5_281 = L5_281.FindFirstChild
          L5_281 = L5_281(L5_281, L4_280.Name)
          game.Players.LocalPlayer.Character.Humanoid:EquipTool(L5_281)
        end
      end
    end
  end)
end
EquipToolGun = L31_31
L31_31 = spawn
function L32_32()
  local L0_282
  L0_282 = getrawmetatable
  L0_282 = L0_282(game)
  setreadonly(L0_282, false)
  L0_282.__namecall = newcclosure(function()
    local L0_283, L1_284, L2_285
    L1_284 = getnamecallmethod
    L1_284 = L1_284()
    L2_285 = {
      ...
    }
    if tostring(L1_284) == "FireServer" and tostring(L2_285[1]) == "RemoteEvent" and tostring(L2_285[2]) ~= "true" and tostring(L2_285[2]) ~= "false" then
      if _G.UseSkillGun then
        if type(L2_285[2]) == "vector" then
          L2_285[2] = PositionSkillMasteryGun
        else
          L2_285[2] = CFrame.new(PositionSkillMasteryGun)
        end
        return _UPVALUE0_(unpack(L2_285))
      end
      if _G.UseSkill then
        if type(L2_285[2]) == "vector" then
          L2_285[2] = PositionSkillMasteryDevilFruit
        else
          L2_285[2] = CFrame.new(PositionSkillMasteryDevilFruit)
        end
        return _UPVALUE0_(unpack(L2_285))
      end
    end
  end)
end
L31_31(L32_32)
L31_31 = Sea3
if L31_31 then
  L31_31 = L2_2.Main
  L33_33 = "AddSection"
  L32_32 = L31_31
  L31_31 = L31_31[L33_33]
  L33_33 = "X\198\176\198\161ng"
  L31_31 = L31_31(L32_32, L33_33)
  L32_32 = L2_2.Main
  L34_34 = "AddParagraph"
  L33_33 = L32_32
  L32_32 = L32_32[L34_34]
  L34_34 = {}
  L35_35 = "X\198\176\198\161ng Tr\225\186\161ng Th\195\161i"
  L34_34.Title = L35_35
  L35_35 = "Content"
  L36_36 = ""
  L34_34[L35_35] = L36_36
  L32_32 = L32_32(L33_33, L34_34)
  L33_33 = spawn
  function L34_34()
    pcall(function()
      local L0_286
      while true do
        L0_286 = wait
        L0_286 = L0_286()
        if L0_286 then
          L0_286 = game
          L0_286 = L0_286.GetService
          L0_286 = L0_286(L0_286, "ReplicatedStorage")
          L0_286 = L0_286.Remotes
          L0_286 = L0_286.CommF_
          L0_286 = L0_286.InvokeServer
          L0_286 = L0_286(L0_286, "Bones", "Check")
          _UPVALUE0_:SetDesc("B\225\186\161n C\195\179: " .. tostring(L0_286) .. " X\198\176\198\161ng")
        end
      end
    end)
  end
  L33_33(L34_34)
  L33_33 = L2_2.Main
  L35_35 = "AddToggle"
  L34_34 = L33_33
  L33_33 = L33_33[L35_35]
  L35_35 = "ToggleBone"
  L36_36 = {}
  L37_37 = "C\195\160y X\198\176\198\161ng"
  L36_36.Title = L37_37
  L37_37 = "Description"
  L38_38 = ""
  L36_36[L37_37] = L38_38
  L37_37 = "Default"
  L38_38 = false
  L36_36[L37_37] = L38_38
  L33_33 = L33_33(L34_34, L35_35, L36_36)
  L36_36 = "OnChanged"
  L35_35 = L33_33
  L34_34 = L33_33[L36_36]
  function L36_36(A0_287)
    _G.AutoBone = A0_287
    if A0_287 == false then
      wait()
      Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
      wait()
    end
  end
  L34_34(L35_35, L36_36)
  L34_34 = "ToggleBone"
  L34_34 = L3_3[L34_34]
  L36_36 = "SetValue"
  L35_35 = L34_34
  L34_34 = L34_34[L36_36]
  L36_36 = false
  L34_34(L35_35, L36_36)
  L34_34 = CFrame
  L34_34 = L34_34.new
  L35_35 = -9515.75
  L36_36 = 174.8521728515625
  L37_37 = 6079.40625
  L34_34 = L34_34(L35_35, L36_36, L37_37)
  L35_35 = spawn
  function L36_36()
    while wait() do
      if _G.AutoBone then
        pcall(function()
          local L0_288
          L0_288 = game
          L0_288 = L0_288.GetService
          L0_288 = L0_288(L0_288, "Players")
          L0_288 = L0_288.LocalPlayer
          L0_288 = L0_288.PlayerGui
          L0_288 = L0_288.Main
          L0_288 = L0_288.Quest
          L0_288 = L0_288.Container
          L0_288 = L0_288.QuestTitle
          L0_288 = L0_288.Title
          L0_288 = L0_288.Text
          if not string.find(L0_288, "Demonic Soul") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
          end
          if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
            Tween(_UPVALUE0_)
            if (_UPVALUE0_.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
            end
          else
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")) then
              for _FORV_4_, _FORV_5_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _FORV_5_:FindFirstChild("HumanoidRootPart") and _FORV_5_:FindFirstChild("Humanoid") and _FORV_5_.Humanoid.Health > 0 and (_FORV_5_.Name == "Reborn Skeleton" or _FORV_5_.Name == "Living Zombie" or _FORV_5_.Name == "Demonic Soul" or _FORV_5_.Name == "Posessed Mummy") then
                  if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                    repeat
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      AutoHaki()
                      bringmob = true
                      EquipTool(SelectWeapon)
                      Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
                      _FORV_5_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      _FORV_5_.HumanoidRootPart.Transparency = 1
                      _FORV_5_.Humanoid.JumpPower = 0
                      _FORV_5_.Humanoid.WalkSpeed = 0
                      _FORV_5_.HumanoidRootPart.CanCollide = false
                      FarmPos = _FORV_5_.HumanoidRootPart.CFrame
                      MonFarm = _FORV_5_.Name
                    until not _G.AutoBone or _FORV_5_.Humanoid.Health <= 0 or not _FORV_5_.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                  else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    bringmob = false
                  end
                end
              end
            else
            end
          end
        end)
      end
    end
  end
  L35_35(L36_36)
  L35_35 = CFrame
  L35_35 = L35_35.new
  L36_36 = -9515.75
  L37_37 = 174.8521728515625
  L38_38 = 6079.40625
  L35_35 = L35_35(L36_36, L37_37, L38_38)
  L36_36 = spawn
  function L37_37()
    while wait() do
      if _G.AutoBoneNoQuest then
        pcall(function()
          Tween(_UPVALUE0_)
          if (_UPVALUE0_.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
          end
          if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_.Humanoid.Health > 0 and (_FORV_4_.Name == "Reborn Skeleton" or _FORV_4_.Name == "Living Zombie" or _FORV_4_.Name == "Demonic Soul" or _FORV_4_.Name == "Posessed Mummy") then
                repeat
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  bringmob = true
                  EquipTool(SelectWeapon)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  _FORV_4_.HumanoidRootPart.Transparency = 1
                  _FORV_4_.Humanoid.JumpPower = 0
                  _FORV_4_.Humanoid.WalkSpeed = 0
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                  MonFarm = _FORV_4_.Name
                until not _G.AutoBoneNoQuest or _FORV_4_.Humanoid.Health <= 0 or not _FORV_4_.Parent
              end
            end
          end
        end)
      end
    end
  end
  L36_36(L37_37)
  L36_36 = L2_2.Main
  L38_38 = "AddButton"
  L37_37 = L36_36
  L36_36 = L36_36[L38_38]
  L38_38 = {}
  L39_39 = "C\225\186\167u Nguy\225\187\135n"
  L38_38.Title = L39_39
  L39_39 = "Description"
  L40_40 = ""
  L38_38[L39_39] = L40_40
  L39_39 = "Callback"
  function L40_40()
    local L0_289
    L0_289 = {}
    L0_289[1] = "gravestoneEvent"
    L0_289[2] = 1
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_289))
  end
  L38_38[L39_39] = L40_40
  L36_36(L37_37, L38_38)
  L36_36 = L2_2.Main
  L38_38 = "AddButton"
  L37_37 = L36_36
  L36_36 = L36_36[L38_38]
  L38_38 = {}
  L39_39 = "Th\225\187\173 V\225\186\173n May"
  L38_38.Title = L39_39
  L39_39 = "Description"
  L40_40 = ""
  L38_38[L39_39] = L40_40
  L39_39 = "Callback"
  function L40_40()
    local L0_290
    L0_290 = {}
    L0_290[1] = "gravestoneEvent"
    L0_290[2] = 2
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_290))
  end
  L38_38[L39_39] = L40_40
  L36_36(L37_37, L38_38)
  L36_36 = L2_2.Main
  L38_38 = "AddToggle"
  L37_37 = L36_36
  L36_36 = L36_36[L38_38]
  L38_38 = "ToggleRandomBone"
  L39_39 = {}
  L40_40 = "T\225\187\177 \196\144\225\187\153ng Random X\198\176\198\161ng"
  L39_39.Title = L40_40
  L40_40 = "Description"
  L41_41 = ""
  L39_39[L40_40] = L41_41
  L40_40 = "Default"
  L41_41 = false
  L39_39[L40_40] = L41_41
  L36_36 = L36_36(L37_37, L38_38, L39_39)
  L39_39 = "OnChanged"
  L38_38 = L36_36
  L37_37 = L36_36[L39_39]
  function L39_39(A0_291)
    _G.AutoRandomBone = A0_291
  end
  L37_37(L38_38, L39_39)
  L37_37 = "ToggleRandomBone"
  L37_37 = L3_3[L37_37]
  L39_39 = "SetValue"
  L38_38 = L37_37
  L37_37 = L37_37[L39_39]
  L39_39 = false
  L37_37(L38_38, L39_39)
  L37_37 = spawn
  function L38_38()
    local L0_292
    while true do
      L0_292 = wait
      L0_292 = L0_292()
      if L0_292 then
        L0_292 = _G
        L0_292 = L0_292.AutoRandomBone
        if L0_292 then
          L0_292 = {}
          L0_292[1] = "Bones"
          L0_292[2] = "Buy"
          L0_292[3] = 1
          L0_292[4] = 1
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_292))
        end
      end
    end
  end
  L37_37(L38_38)
end
L31_31 = Sea3
if L31_31 then
  L31_31 = L2_2.Main
  L33_33 = "AddSection"
  L32_32 = L31_31
  L31_31 = L31_31[L33_33]
  L33_33 = "T\198\176 L\225\187\135nh B\195\161nh"
  L31_31 = L31_31(L32_32, L33_33)
  L32_32 = L2_2.Main
  L34_34 = "AddParagraph"
  L33_33 = L32_32
  L32_32 = L32_32[L34_34]
  L34_34 = {}
  L35_35 = "Tr\225\186\161ng Th\195\161i Boss Ra"
  L34_34.Title = L35_35
  L35_35 = "Content"
  L36_36 = ""
  L34_34[L35_35] = L36_36
  L32_32 = L32_32(L33_33, L34_34)
  L33_33 = spawn
  function L34_34()
    while wait() do
      pcall(function()
        if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
          _UPVALUE0_:SetDesc("C\195\178n: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41) .. "")
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
          _UPVALUE0_:SetDesc("C\195\178n: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 40) .. "")
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
          _UPVALUE0_:SetDesc("C\195\178n: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 39) .. " ")
        else
          _UPVALUE0_:SetDesc("T\198\176 L\225\187\135nh B\195\161nh : \226\156\133\239\184\143")
        end
      end)
    end
  end
  L33_33(L34_34)
  L33_33 = L2_2.Main
  L35_35 = "AddToggle"
  L34_34 = L33_33
  L33_33 = L33_33[L35_35]
  L35_35 = "ToggleCake"
  L36_36 = {}
  L37_37 = "C\195\160y T\198\176 L\225\187\135nh B\195\161nh"
  L36_36.Title = L37_37
  L37_37 = "Description"
  L38_38 = ""
  L36_36[L37_37] = L38_38
  L37_37 = "Default"
  L38_38 = false
  L36_36[L37_37] = L38_38
  L33_33 = L33_33(L34_34, L35_35, L36_36)
  L36_36 = "OnChanged"
  L35_35 = L33_33
  L34_34 = L33_33[L36_36]
  function L36_36(A0_293)
    _G.Cake = A0_293
    if A0_293 == false then
      wait()
      Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
      wait()
    end
  end
  L34_34(L35_35, L36_36)
  L34_34 = "ToggleCake"
  L34_34 = L3_3[L34_34]
  L36_36 = "SetValue"
  L35_35 = L34_34
  L34_34 = L34_34[L36_36]
  L36_36 = false
  L34_34(L35_35, L36_36)
  L34_34 = spawn
  function L35_35()
    while wait() do
      if _G.Cake then
        pcall(function()
          if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game.ReplicatedStorage:FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
              for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _FORV_4_.Name == "Cake Prince" or _FORV_4_.Name == "Dough King" then
                  repeat
                    wait(_G.Fast_Delay)
                    AutoHaki()
                    EquipTool(SelectWeapon)
                    _FORV_4_.HumanoidRootPart.CanCollide = false
                    _FORV_4_.Humanoid.WalkSpeed = 0
                    _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                    AttackNoCoolDown()
                  until _G.Cake == false or not _FORV_4_.Parent or 0 >= _FORV_4_.Humanoid.Health
                end
              end
            else
              Tween(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875))
            end
          elseif game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if (_FORV_4_.Name == "Baking Staff" or _FORV_4_.Name == "Head Baker" or _FORV_4_.Name == "Cake Guard" or _FORV_4_.Name == "Cookie Crafter") and 0 < _FORV_4_.Humanoid.Health then
                repeat
                  wait(_G.Fast_Delay)
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  bringmob = true
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  POSCAKE = _FORV_4_.HumanoidRootPart.CFrame
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  AttackNoCoolDown()
                until _G.Cake == false or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or not _FORV_4_.Parent or 0 >= _FORV_4_.Humanoid.Health
              end
            end
          else
            bringmob = false
            Tween(CFrame.new(-1579.9111328125, 329.7358703613281, -12310.365234375))
          end
        end)
      end
    end
  end
  L34_34(L35_35)
  L34_34 = spawn
  function L35_35()
    game:GetService("RunService").Heartbeat:Connect(function()
      pcall(function()
        local L0_294
        for _FORV_3_, _FORV_4_ in L0_294(game:GetService("Workspace").Enemies:GetChildren()) do
          if _G.Cake and bringmob and (_FORV_4_.Name == "Cookie Crafter" or _FORV_4_.Name == "Cake Guard" or _FORV_4_.Name == "Baking Staff" or _FORV_4_.Name == "Head Baker") and (_FORV_4_.HumanoidRootPart.Position - POSCAKE.Position).magnitude <= 350 then
            _FORV_4_.HumanoidRootPart.CFrame = POSCAKE
            _FORV_4_.HumanoidRootPart.CanCollide = false
            _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
            if _FORV_4_.Humanoid:FindFirstChild("Animator") then
              _FORV_4_.Humanoid.Animator:Destroy()
            end
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
          end
        end
      end)
    end)
  end
  L34_34(L35_35)
  L34_34 = spawn
  function L35_35()
    while wait() do
      if _G.Cake then
        pcall(function()
          if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game.ReplicatedStorage:FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
              for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _FORV_4_.Name == "Cake Prince" or _FORV_4_.Name == "Dough King" then
                  repeat
                    wait(_G.Fast_Delay)
                    AutoHaki()
                    EquipTool(SelectWeapon)
                    _FORV_4_.HumanoidRootPart.CanCollide = false
                    _FORV_4_.Humanoid.WalkSpeed = 0
                    _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                    AttackNoCoolDown()
                  until _G.Cake == false or not _FORV_4_.Parent or 0 >= _FORV_4_.Humanoid.Health
                end
              end
            else
              Tween(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875))
            end
          elseif game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if (_FORV_4_.Name == "Baking Staff" or _FORV_4_.Name == "Head Baker" or _FORV_4_.Name == "Cake Guard" or _FORV_4_.Name == "Cookie Crafter") and 0 < _FORV_4_.Humanoid.Health then
                repeat
                  wait(_G.Fast_Delay)
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  bringmob = true
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  POSCAKE = _FORV_4_.HumanoidRootPart.CFrame
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  AttackNoCoolDown()
                until _G.Cake == false or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or not _FORV_4_.Parent or 0 >= _FORV_4_.Humanoid.Health
              end
            end
          else
            bringmob = false
            Tween(CFrame.new(-1579.9111328125, 329.7358703613281, -12310.365234375))
          end
        end)
      end
    end
  end
  L34_34(L35_35)
  L34_34 = L2_2.Main
  L36_36 = "AddToggle"
  L35_35 = L34_34
  L34_34 = L34_34[L36_36]
  L36_36 = "ToggleSpawnCake"
  L37_37 = {}
  L38_38 = "Tri\225\187\135u H\225\187\147i T\198\176 L\225\187\135nh B\195\161nh"
  L37_37.Title = L38_38
  L38_38 = "Description"
  L39_39 = ""
  L37_37[L38_38] = L39_39
  L38_38 = "Default"
  L39_39 = true
  L37_37[L38_38] = L39_39
  L34_34 = L34_34(L35_35, L36_36, L37_37)
  L37_37 = "OnChanged"
  L36_36 = L34_34
  L35_35 = L34_34[L37_37]
  function L37_37(A0_295)
    _G.SpawnCakePrince = A0_295
  end
  L35_35(L36_36, L37_37)
  L35_35 = "ToggleSpawnCake"
  L35_35 = L3_3[L35_35]
  L37_37 = "SetValue"
  L36_36 = L35_35
  L35_35 = L35_35[L37_37]
  L37_37 = true
  L35_35(L36_36, L37_37)
end
L31_31 = spawn
function L32_32()
  local L0_296, L1_297
  while true do
    L0_296 = wait
    L0_296 = L0_296()
    if L0_296 then
      L0_296 = _G
      L0_296 = L0_296.SpawnCakePrince
      if L0_296 then
        L0_296 = {}
        L0_296[1] = "CakePrinceSpawner"
        L0_296[2] = true
        L1_297 = game
        L1_297 = L1_297.GetService
        L1_297 = L1_297(L1_297, "ReplicatedStorage")
        L1_297 = L1_297.Remotes
        L1_297 = L1_297.CommF_
        L1_297 = L1_297.InvokeServer
        L1_297(L1_297, unpack(L0_296))
        L1_297 = {}
        L1_297[1] = "CakePrinceSpawner"
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L1_297))
      end
    end
  end
end
L31_31(L32_32)
L31_31 = Sea2
if L31_31 then
  L31_31 = L2_2.Main
  L33_33 = "AddSection"
  L32_32 = L31_31
  L31_31 = L31_31[L33_33]
  L33_33 = "Ectoplasm Farm"
  L31_31 = L31_31(L32_32, L33_33)
  L32_32 = L2_2.Main
  L34_34 = "AddToggle"
  L33_33 = L32_32
  L32_32 = L32_32[L34_34]
  L34_34 = "ToggleVatChatKiDi"
  L35_35 = {}
  L36_36 = "Auto Farm Ectoplasm"
  L35_35.Title = L36_36
  L36_36 = "Description"
  L37_37 = ""
  L35_35[L36_36] = L37_37
  L36_36 = "Default"
  L37_37 = false
  L35_35[L36_36] = L37_37
  L32_32 = L32_32(L33_33, L34_34, L35_35)
  L35_35 = "OnChanged"
  L34_34 = L32_32
  L33_33 = L32_32[L35_35]
  function L35_35(A0_298)
    _G.Ectoplasm = A0_298
  end
  L33_33(L34_34, L35_35)
  L33_33 = "ToggleVatChatKiDi"
  L33_33 = L3_3[L33_33]
  L35_35 = "SetValue"
  L34_34 = L33_33
  L33_33 = L33_33[L35_35]
  L35_35 = false
  L33_33(L34_34, L35_35)
  L33_33 = spawn
  function L34_34()
    while wait() do
      pcall(function()
        if _G.Ectoplasm then
          if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if (_FORV_4_.Name == "Ship Steward" or _FORV_4_.Name == "Ship Engineer" or _FORV_4_.Name == "Ship Deckhand" or _FORV_4_.Name == "Ship Officer" and _FORV_4_:FindFirstChild("Humanoid")) and _FORV_4_.Humanoid.Health > 0 then
                repeat
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  bringmob = true
                  EquipTool(SelectWeapon)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  _FORV_4_.HumanoidRootPart.Transparency = 1
                  _FORV_4_.Humanoid.JumpPower = 0
                  _FORV_4_.Humanoid.WalkSpeed = 0
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                  MonFarm = _FORV_4_.Name
                until _G.Ectoplasm == false or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(_FORV_4_.Name)
                bringmob = false
              end
            end
          else
            if (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
            Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
          end
        end
      end)
    end
  end
  L33_33(L34_34)
end
L31_31 = L2_2.Main
L33_33 = "AddSection"
L32_32 = L31_31
L31_31 = L31_31[L33_33]
L33_33 = "Tr\195\185m"
L31_31 = L31_31(L32_32, L33_33)
L32_32 = Sea1
if L32_32 then
  L32_32 = {
    L33_33,
    L34_34,
    L35_35,
    L36_36,
    L37_37,
    L38_38,
    L39_39,
    L40_40,
    L41_41,
    L42_42,
    L43_43,
    L44_44,
    L45_45,
    L46_46
  }
  L33_33 = "The Gorilla King"
  L34_34 = "Bobby"
  L35_35 = "Yeti"
  L36_36 = "Mob Leader"
  L37_37 = "Vice Admiral"
  L38_38 = "Warden"
  L39_39 = "Chief Warden"
  L40_40 = "Swan"
  L41_41 = "Magma Admiral"
  L42_42 = "Fishman Lord"
  L43_43 = "Wysper"
  L44_44 = "Thunder God"
  L45_45 = "Cyborg"
  L46_46 = "Saber Expert"
  tableBoss = L32_32
else
  L32_32 = Sea2
  if L32_32 then
    L32_32 = {
      L33_33,
      L34_34,
      L35_35,
      L36_36,
      L37_37,
      L38_38,
      L39_39,
      L40_40,
      L41_41,
      L42_42
    }
    L33_33 = "Diamond"
    L34_34 = "Jeremy"
    L35_35 = "Fajita"
    L36_36 = "Don Swan"
    L37_37 = "Smoke Admiral"
    L38_38 = "Cursed Captain"
    L39_39 = "Darkbeard"
    L40_40 = "Order"
    L41_41 = "Awakened Ice Admiral"
    L42_42 = "Tide Keeper"
    tableBoss = L32_32
  else
    L32_32 = Sea3
    if L32_32 then
      L32_32 = {
        L33_33,
        L34_34,
        L35_35,
        L36_36,
        L37_37,
        L38_38,
        L39_39,
        L40_40,
        L41_41
      }
      L33_33 = "Stone"
      L34_34 = "Hydra Leader"
      L35_35 = "Kilo Admiral"
      L36_36 = "Captain Elephant"
      L37_37 = "Beautiful Pirate"
      L38_38 = "rip_indra True Form"
      L39_39 = "Longma"
      L40_40 = "Soul Reaper"
      L41_41 = "Cake Queen"
      tableBoss = L32_32
    end
  end
end
L32_32 = L2_2.Main
L34_34 = "AddDropdown"
L33_33 = L32_32
L32_32 = L32_32[L34_34]
L34_34 = "DropdownBoss"
L35_35 = {}
L36_36 = "Ch\225\187\141n Tr\195\185m"
L35_35.Title = L36_36
L36_36 = "Description"
L37_37 = ""
L35_35[L36_36] = L37_37
L36_36 = "Values"
L37_37 = tableBoss
L35_35[L36_36] = L37_37
L36_36 = "Multi"
L37_37 = false
L35_35[L36_36] = L37_37
L36_36 = "Default"
L37_37 = 1
L35_35[L36_36] = L37_37
L32_32 = L32_32(L33_33, L34_34, L35_35)
L35_35 = "SetValue"
L34_34 = L32_32
L33_33 = L32_32[L35_35]
L35_35 = _G
L36_36 = "SelectBoss"
L35_35 = L35_35[L36_36]
L33_33(L34_34, L35_35)
L35_35 = "OnChanged"
L34_34 = L32_32
L33_33 = L32_32[L35_35]
function L35_35(A0_299)
  _G.SelectBoss = A0_299
end
L33_33(L34_34, L35_35)
L33_33 = L2_2.Main
L35_35 = "AddToggle"
L34_34 = L33_33
L33_33 = L33_33[L35_35]
L35_35 = "ToggleAutoFarmBoss"
L36_36 = {}
L37_37 = "\239\191\189\195\161nh Tr\195\185m"
L36_36.Title = L37_37
L37_37 = "Description"
L38_38 = ""
L36_36[L37_37] = L38_38
L37_37 = "Default"
L38_38 = false
L36_36[L37_37] = L38_38
L33_33 = L33_33(L34_34, L35_35, L36_36)
L36_36 = "OnChanged"
L35_35 = L33_33
L34_34 = L33_33[L36_36]
function L36_36(A0_300)
  _G.AutoBoss = A0_300
end
L34_34(L35_35, L36_36)
L34_34 = "ToggleAutoFarmBoss"
L34_34 = L3_3[L34_34]
L36_36 = "SetValue"
L35_35 = L34_34
L34_34 = L34_34[L36_36]
L36_36 = false
L34_34(L35_35, L36_36)
L34_34 = spawn
function L35_35()
  while wait() do
    if _G.AutoBoss then
      pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_.Name == _G.SelectBoss and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 then
              repeat
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                AutoHaki()
                EquipTool(SelectWeapon)
                _FORV_4_.HumanoidRootPart.CanCollide = false
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
              until not _G.AutoBoss or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
            end
          end
        elseif game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end
L34_34(L35_35)
L34_34 = L2_2.Main
L36_36 = "AddSection"
L35_35 = L34_34
L34_34 = L34_34[L36_36]
L36_36 = "Nguy\195\170n Li\225\187\135u"
L34_34 = L34_34(L35_35, L36_36)
L35_35 = Sea1
if L35_35 then
  L35_35 = {
    L36_36,
    L37_37,
    L38_38,
    L39_39,
    L40_40
  }
  L36_36 = "Scrap Metal"
  L37_37 = "Leather"
  L38_38 = "Angel Wings"
  L39_39 = "Magma Ore"
  L40_40 = "Fish Tail"
  MaterialList = L35_35
else
  L35_35 = Sea2
  if L35_35 then
    L35_35 = {
      L36_36,
      L37_37,
      L38_38,
      L39_39,
      L40_40,
      L41_41
    }
    L36_36 = "Scrap Metal"
    L37_37 = "Leather"
    L38_38 = "Radioactive Material"
    L39_39 = "Mystic Droplet"
    L40_40 = "Magma Ore"
    L41_41 = "Vampire Fang"
    MaterialList = L35_35
  else
    L35_35 = Sea3
    if L35_35 then
      L35_35 = {
        L36_36,
        L37_37,
        L38_38,
        L39_39,
        L40_40,
        L41_41,
        L42_42,
        L43_43,
        L44_44,
        L45_45
      }
      L36_36 = "Scrap Metal"
      L37_37 = "Leather"
      L38_38 = "Demonic Wisp"
      L39_39 = "Conjured Cocoa"
      L40_40 = "Dragon Scale"
      L41_41 = "Gunpowder"
      L42_42 = "Fish Tail"
      L43_43 = "Mini Tusk"
      L44_44 = "Hydra Enforcer"
      L45_45 = "Venomous Assailant"
      MaterialList = L35_35
    end
  end
end
L35_35 = L2_2.Main
L37_37 = "AddDropdown"
L36_36 = L35_35
L35_35 = L35_35[L37_37]
L37_37 = "DropdownMaterial"
L38_38 = {}
L39_39 = "Ch\225\187\141n Nguy\195\170n Li\225\187\135u"
L38_38.Title = L39_39
L39_39 = "Description"
L40_40 = ""
L38_38[L39_39] = L40_40
L39_39 = "Values"
L40_40 = MaterialList
L38_38[L39_39] = L40_40
L39_39 = "Multi"
L40_40 = false
L38_38[L39_39] = L40_40
L39_39 = "Default"
L40_40 = 1
L38_38[L39_39] = L40_40
L35_35 = L35_35(L36_36, L37_37, L38_38)
L38_38 = "SetValue"
L37_37 = L35_35
L36_36 = L35_35[L38_38]
L38_38 = SelectMaterial
L36_36(L37_37, L38_38)
L38_38 = "OnChanged"
L37_37 = L35_35
L36_36 = L35_35[L38_38]
function L38_38(A0_301)
  SelectMaterial = A0_301
end
L36_36(L37_37, L38_38)
L36_36 = L2_2.Main
L38_38 = "AddToggle"
L37_37 = L36_36
L36_36 = L36_36[L38_38]
L38_38 = "ToggleMaterial"
L39_39 = {}
L40_40 = "C\195\160y Nguy\195\170n Li\225\187\135u"
L39_39.Title = L40_40
L40_40 = "Description"
L41_41 = ""
L39_39[L40_40] = L41_41
L40_40 = "Default"
L41_41 = false
L39_39[L40_40] = L41_41
L36_36 = L36_36(L37_37, L38_38, L39_39)
L39_39 = "OnChanged"
L38_38 = L36_36
L37_37 = L36_36[L39_39]
function L39_39(A0_302)
  _G.AutoMaterial = A0_302
  if A0_302 == false then
    wait()
    Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
  end
end
L37_37(L38_38, L39_39)
L37_37 = "ToggleMaterial"
L37_37 = L3_3[L37_37]
L39_39 = "SetValue"
L38_38 = L37_37
L37_37 = L37_37[L39_39]
L39_39 = false
L37_37(L38_38, L39_39)
L37_37 = spawn
function L38_38()
  while task.wait() do
    if _G.AutoMaterial then
      pcall(function()
        MaterialMon(SelectMaterial)
        Tween(MPos)
        if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
          for _FORV_3_, _FORV_4_ in pairs(game.Workspace.Enemies:GetChildren()) do
            if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 and _FORV_4_.Name == MMon then
              repeat
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                _FORV_4_.HumanoidRootPart.Transparency = 1
                _FORV_4_.Humanoid.JumpPower = 0
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.CanCollide = false
                FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                MonFarm = _FORV_4_.Name
              until not _G.AutoMaterial or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
              bringmob = false
            end
          end
        else
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren()) do
            if string.find(_FORV_4_.Name, Mon) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _FORV_4_.Position).Magnitude >= 10 then
              Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
            end
          end
        end
      end)
    end
  end
end
L37_37(L38_38)
L37_37 = Sea3
if L37_37 then
  L37_37 = L2_2.Sea
  L39_39 = "AddSection"
  L38_38 = L37_37
  L37_37 = L37_37[L39_39]
  L39_39 = "\239\191\189\225\186\163o C\195\161o"
  L37_37 = L37_37(L38_38, L39_39)
  L38_38 = L2_2.Sea
  L40_40 = "AddParagraph"
  L39_39 = L38_38
  L38_38 = L38_38[L40_40]
  L40_40 = {}
  L41_41 = "Tr\225\186\161ng Th\195\161i \196\144\225\186\163o C\195\161o"
  L40_40.Title = L41_41
  L41_41 = "Content"
  L42_42 = ""
  L40_40[L41_41] = L42_42
  L38_38 = L38_38(L39_39, L40_40)
  function L39_39()
    if game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
      _UPVALUE0_:SetDesc("\239\191\189\225\186\163o C\195\161o : \226\156\133\239\184\143")
    else
      _UPVALUE0_:SetDesc("\239\191\189\225\186\163o C\195\161o : \226\157\140\239\184\143")
    end
  end
  UpdateKitsune = L39_39
  L39_39 = spawn
  function L40_40()
    pcall(function()
      while wait() do
        UpdateKitsune()
      end
    end)
  end
  L39_39(L40_40)
  L39_39 = L2_2.Sea
  L41_41 = "AddToggle"
  L40_40 = L39_39
  L39_39 = L39_39[L41_41]
  L41_41 = "ToggleTPKitsune"
  L42_42 = {}
  L43_43 = "Bay V\195\160o \196\144\225\186\163o C\195\161o"
  L42_42.Title = L43_43
  L43_43 = "Description"
  L44_44 = ""
  L42_42[L43_43] = L44_44
  L43_43 = "Default"
  L44_44 = false
  L42_42[L43_43] = L44_44
  L39_39 = L39_39(L40_40, L41_41, L42_42)
  L42_42 = "OnChanged"
  L41_41 = L39_39
  L40_40 = L39_39[L42_42]
  function L42_42(A0_303)
    _G.TweenToKitsune = A0_303
  end
  L40_40(L41_41, L42_42)
  L40_40 = "ToggleTPKitsune"
  L40_40 = L3_3[L40_40]
  L42_42 = "SetValue"
  L41_41 = L40_40
  L40_40 = L40_40[L42_42]
  L42_42 = false
  L40_40(L41_41, L42_42)
  L40_40 = spawn
  function L41_41()
    local L0_304
    while not L0_304 do
      L0_304 = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
      wait(1)
    end
    while wait() do
      if _G.TweenToKitsune and L0_304:FindFirstChild("ShrineActive") then
        for _FORV_5_, _FORV_6_ in pairs(L0_304:FindFirstChild("ShrineActive"):GetDescendants()) do
          if _FORV_6_:IsA("BasePart") and _FORV_6_.Name:find("NeonShrinePart") then
            Tween2(_FORV_6_.CFrame)
          end
        end
      end
    end
  end
  L40_40(L41_41)
  L40_40 = L2_2.Sea
  L42_42 = "AddToggle"
  L41_41 = L40_40
  L40_40 = L40_40[L42_42]
  L42_42 = "ToggleCollectAzure"
  L43_43 = {}
  L44_44 = "Nh\225\186\183t Linh H\225\187\147n"
  L43_43.Title = L44_44
  L44_44 = "Description"
  L45_45 = ""
  L43_43[L44_44] = L45_45
  L44_44 = "Default"
  L45_45 = false
  L43_43[L44_44] = L45_45
  L40_40 = L40_40(L41_41, L42_42, L43_43)
  L43_43 = "OnChanged"
  L42_42 = L40_40
  L41_41 = L40_40[L43_43]
  function L43_43(A0_305)
    _G.CollectAzure = A0_305
  end
  L41_41(L42_42, L43_43)
  L41_41 = "ToggleCollectAzure"
  L41_41 = L3_3[L41_41]
  L43_43 = "SetValue"
  L42_42 = L41_41
  L41_41 = L41_41[L43_43]
  L43_43 = false
  L41_41(L42_42, L43_43)
  L41_41 = spawn
  function L42_42()
    while wait() do
      if _G.CollectAzure then
        pcall(function()
          if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
            Tween(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
          end
        end)
      end
    end
  end
  L41_41(L42_42)
  L41_41 = L2_2.Sea
  L43_43 = "AddButton"
  L42_42 = L41_41
  L41_41 = L41_41[L43_43]
  L43_43 = {}
  L44_44 = "\239\191\189\225\187\149i Linh H\225\187\147n"
  L43_43.Title = L44_44
  L44_44 = "Description"
  L45_45 = ""
  L43_43[L44_44] = L45_45
  L44_44 = "Callback"
  function L45_45()
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer()
  end
  L43_43[L44_44] = L45_45
  L41_41(L42_42, L43_43)
  L41_41 = L2_2.Sea
  L43_43 = "AddSection"
  L42_42 = L41_41
  L41_41 = L41_41[L43_43]
  L43_43 = "Bi\225\187\131n"
  L41_41 = L41_41(L42_42, L43_43)
  L42_42 = game
  L43_43 = L42_42
  L42_42 = L42_42.GetService
  L44_44 = "Players"
  L42_42 = L42_42(L43_43, L44_44)
  L43_43 = game
  L44_44 = L43_43
  L43_43 = L43_43.GetService
  L45_45 = "RunService"
  L43_43 = L43_43(L44_44, L45_45)
  L44_44 = game
  L45_45 = L44_44
  L44_44 = L44_44.GetService
  L46_46 = "VirtualInputManager"
  L44_44 = L44_44(L45_45, L46_46)
  L45_45 = game
  L46_46 = L45_45
  L45_45 = L45_45.GetService
  L47_47 = "Workspace"
  L45_45 = L45_45(L46_46, L47_47)
  L46_46 = L42_42.LocalPlayer
  L47_47 = "Character"
  L47_47 = L46_46[L47_47]
  if not L47_47 then
    L47_47 = "CharacterAdded"
    L47_47 = L46_46[L47_47]
    L49_49 = "Wait"
    L48_48 = L47_47
    L47_47 = L47_47[L49_49]
    L47_47 = L47_47(L48_48)
  end
  L48_48 = 350
  L49_49 = 3000
  L50_50 = Vector3
  L50_50 = L50_50.new
  L51_51 = -16665.191
  L52_52 = 104.596
  L53_53 = 1579.694
  L50_50 = L50_50(L51_51, L52_52, L53_53)
  L51_51 = {
    L52_52,
    L53_53,
    L54_54,
    L55_55
  }
  L52_52 = 80
  L53_53 = -50
  L54_54 = -80
  L55_55 = 50
  L52_52 = 1
  function L53_53()
    local L0_306
    for _FORV_3_, _FORV_4_ in L0_306(_UPVALUE0_.Boats:GetChildren()) do
      if _FORV_4_:FindFirstChild("VehicleSeat") and _FORV_4_:FindFirstChild("VehicleSeat").Occupant == _UPVALUE1_:FindFirstChild("Humanoid") then
        return _FORV_4_
      end
    end
  end
  L54_54 = "RenderStepped"
  L54_54 = L43_43[L54_54]
  L56_56 = "Connect"
  L55_55 = L54_54
  L54_54 = L54_54[L56_56]
  function L56_56()
    local L0_307, L1_308, L2_309, L3_310, L4_311
    L0_307 = _UPVALUE0_
    if L0_307 then
      L0_307 = _UPVALUE0_
      L0_307 = L0_307.PrimaryPart
    elseif not L0_307 then
      return
    end
    L0_307 = _UPVALUE0_
    L0_307 = L0_307.PrimaryPart
    L0_307 = L0_307.Position
    L1_308 = _UPVALUE1_
    L0_307 = L0_307 - L1_308
    L0_307 = L0_307.Magnitude
    L1_308 = math
    L1_308 = L1_308.floor
    L2_309 = L0_307 / 10
    L1_308 = L1_308(L2_309)
    L2_309 = _UPVALUE2_
    if L1_308 >= L2_309 then
      L2_309 = _UPVALUE3_
      L2_309 = L2_309()
      if L2_309 then
        L3_310 = L2_309.PrimaryPart
        if L3_310 then
          L3_310 = _UPVALUE4_
          L4_311 = _UPVALUE5_
          L3_310 = L3_310[L4_311]
          L4_311 = L2_309.PrimaryPart
          L4_311 = L4_311.CFrame
          L4_311 = L4_311 * CFrame.Angles(0, math.rad(L3_310), 0)
          L2_309:SetPrimaryPartCFrame(L4_311)
          _UPVALUE5_ = _UPVALUE5_ + 1
          if _UPVALUE5_ > #_UPVALUE4_ then
            _UPVALUE5_ = 1
          end
          _UPVALUE2_ = _UPVALUE2_ + 1000
        end
      end
    end
  end
  L54_54(L55_55, L56_56)
  L54_54 = {}
  L55_55 = false
  L56_56 = false
  L57_57 = {}
  L58_58 = "Prehistoric"
  L59_59 = {
    L60_60,
    L61_61,
    L62_62,
    L63_63,
    L64_64,
    L65_65,
    L66_66
  }
  L60_60 = "ShipwreckIsland"
  L61_61 = "SandIsland"
  L62_62 = "TreeIsland"
  L63_63 = "TinyIsland"
  L64_64 = "MysticIsland"
  L65_65 = "KitsuneIsland"
  L66_66 = "FrozenDimension"
  L57_57[L58_58] = L59_59
  L58_58 = "Mirage"
  L59_59 = {
    L60_60,
    L61_61,
    L62_62,
    L63_63,
    L64_64,
    L65_65,
    L66_66
  }
  L60_60 = "ShipwreckIsland"
  L61_61 = "SandIsland"
  L62_62 = "TreeIsland"
  L63_63 = "TinyIsland"
  L64_64 = "PrehistoricIsland"
  L65_65 = "KitsuneIsland"
  L66_66 = "FrozenDimension"
  L57_57[L58_58] = L59_59
  L58_58 = "Frozen"
  L59_59 = {
    L60_60,
    L61_61,
    L62_62,
    L63_63,
    L64_64,
    L65_65,
    L66_66
  }
  L60_60 = "ShipwreckIsland"
  L61_61 = "SandIsland"
  L62_62 = "TreeIsland"
  L63_63 = "TinyIsland"
  L64_64 = "MysticIsland"
  L65_65 = "KitsuneIsland"
  L66_66 = "PrehistoricIsland"
  L57_57[L58_58] = L59_59
  function L58_58(A0_312, A1_313, A2_314, A3_315, A4_316)
    _UPVALUE1_[A1_313]:SetValue(false)
    _UPVALUE0_.Sea:AddToggle(A1_313, {Title = A0_312, Default = false}):OnChanged(function(A0_317)
      _G[_UPVALUE0_] = A0_317
    end)
    _UPVALUE2_.RenderStepped:Connect(function()
      local L0_318, L1_319, L2_320, L3_321, L4_322, L5_323, L6_324, L7_325, L8_326
      L0_318 = _G
      L1_319 = _UPVALUE0_
      L0_318 = L0_318[L1_319]
      if not L0_318 then
        L0_318 = false
        _UPVALUE1_ = L0_318
        return
      end
      L0_318 = _UPVALUE2_
      L1_319 = L0_318
      L0_318 = L0_318.FindFirstChild
      L2_320 = "Humanoid"
      L0_318 = L0_318(L1_319, L2_320)
      if not L0_318 then
        return
      end
      function L1_319()
        if _UPVALUE0_ then
          return
        end
        _UPVALUE0_ = true
        for _FORV_3_, _FORV_4_ in pairs(_UPVALUE1_) do
          if _FORV_4_ and _FORV_4_.Parent and _FORV_4_.Name == "VehicleSeat" and not _FORV_4_.Occupant then
            Tween2(_FORV_4_.CFrame)
            break
          end
        end
        _UPVALUE0_ = false
      end
      L2_320 = false
      L3_321 = nil
      L8_326 = L5_323(L6_324)
      for L7_325, L8_326 in L4_322(L5_323, L6_324, L7_325, L8_326, L5_323(L6_324)) do
        if L8_326:FindFirstChild("VehicleSeat") then
          if L8_326:FindFirstChild("VehicleSeat").Occupant == L0_318 then
            L2_320, L3_321 = true, L8_326:FindFirstChild("VehicleSeat")
            _UPVALUE4_[L8_326.Name] = L8_326:FindFirstChild("VehicleSeat")
          elseif L8_326:FindFirstChild("VehicleSeat").Occupant == nil then
            L1_319()
          end
        end
      end
      if not L2_320 then
        return
      end
      L3_321.MaxSpeed = L4_322
      L3_321.CFrame = L4_322
      L7_325 = "W"
      L8_326 = false
      L4_322(L5_323, L6_324, L7_325, L8_326, game)
      L8_326 = L5_323(L6_324)
      for L7_325, L8_326 in L4_322(L5_323, L6_324, L7_325, L8_326, L5_323(L6_324)) do
        if L8_326:IsA("BasePart") then
          L8_326.CanCollide = false
        end
      end
      L8_326 = L5_323(L6_324)
      for L7_325, L8_326 in L4_322(L5_323, L6_324, L7_325, L8_326, L5_323(L6_324)) do
        if L8_326:IsA("BasePart") then
          L8_326.CanCollide = false
        end
      end
      for L7_325, L8_326 in L4_322(L5_323) do
        if _UPVALUE5_.Map:FindFirstChild(L8_326) and _UPVALUE5_.Map:FindFirstChild(L8_326):IsA("Model") then
          _UPVALUE5_.Map:FindFirstChild(L8_326):Destroy()
        end
      end
      if L4_322 then
        L7_325 = false
        L8_326 = "W"
        L5_323(L6_324, L7_325, L8_326, false, game)
        L5_323[L6_324] = false
        if not L5_323 then
          L7_325 = {}
          L7_325.Title = "Strix"
          L8_326 = _UPVALUE11_
          L7_325.Content = L8_326
          L7_325.Duration = 10
          L5_323(L6_324, L7_325)
          _UPVALUE1_ = L5_323
        end
      end
    end)
  end
  L59_59 = L58_58
  L60_60 = "T\195\172m \196\144\225\186\163o Dung Nham"
  L61_61 = "AutoFindPrehistoric"
  L62_62 = "Prehistoric"
  L62_62 = L57_57[L62_62]
  L63_63 = "PrehistoricIsland"
  L64_64 = "\239\191\189\225\186\163o Dung Nham \196\144\195\163 \196\144\198\176\225\187\163c T\195\172m Th\225\186\165y"
  L59_59(L60_60, L61_61, L62_62, L63_63, L64_64)
  L59_59 = L58_58
  L60_60 = "T\195\172m \196\144\225\186\163o B\195\173 \225\186\168n"
  L61_61 = "AutoFindMirage"
  L62_62 = "Mirage"
  L62_62 = L57_57[L62_62]
  L63_63 = "MysticIsland"
  L64_64 = "\239\191\189\225\186\163o B\195\173 \225\186\168n \196\144\195\163 \196\144\198\176\225\187\163c T\195\172m Th\225\186\165y"
  L59_59(L60_60, L61_61, L62_62, L63_63, L64_64)
  L59_59 = L58_58
  L60_60 = "T\195\172m \196\144\225\186\163o Leviathan"
  L61_61 = "AutoFindFrozen"
  L62_62 = "Frozen"
  L62_62 = L57_57[L62_62]
  L63_63 = "FrozenDimension"
  L64_64 = "\239\191\189\225\186\163o Leviathan \196\144\195\163 \196\144\198\176\225\187\163c T\195\172m Th\225\186\165y"
  L59_59(L60_60, L61_61, L62_62, L63_63, L64_64)
  L59_59 = L2_2.Sea
  L61_61 = "AddToggle"
  L60_60 = L59_59
  L59_59 = L59_59[L61_61]
  L61_61 = "AutoComeTiki"
  L62_62 = {}
  L63_63 = "L\195\161i Thuy\225\187\129n V\225\187\129 \196\144\225\186\163o Tiki"
  L62_62.Title = L63_63
  L63_63 = "Description"
  L64_64 = ""
  L62_62[L63_63] = L64_64
  L63_63 = "Default"
  L64_64 = false
  L62_62[L63_63] = L64_64
  L59_59 = L59_59(L60_60, L61_61, L62_62)
  L62_62 = "OnChanged"
  L61_61 = L59_59
  L60_60 = L59_59[L62_62]
  function L62_62(A0_327)
    _G.AutoComeTiki = A0_327
  end
  L60_60(L61_61, L62_62)
  L60_60 = "RenderStepped"
  L60_60 = L43_43[L60_60]
  L62_62 = "Connect"
  L61_61 = L60_60
  L60_60 = L60_60[L62_62]
  function L62_62()
    local L0_328, L1_329, L2_330, L3_331, L4_332, L5_333, L6_334
    L0_328 = _G
    L0_328 = L0_328.AutoComeTiki
    if not L0_328 then
      return
    end
    L0_328 = _UPVALUE0_
    L0_328 = L0_328.LocalPlayer
    L1_329 = L0_328.Character
    if L1_329 then
      L3_331 = L1_329
      L2_330 = L1_329.FindFirstChild
      L2_330 = L2_330(L3_331, L4_332)
    elseif not L2_330 then
      return
    end
    L2_330 = L1_329.Humanoid
    L3_331 = nil
    for _FORV_7_, _FORV_8_ in L4_332(L5_333, L6_334, L5_333(L6_334)) do
      if _FORV_8_:FindFirstChild("VehicleSeat") and _FORV_8_:FindFirstChild("VehicleSeat").Occupant == L2_330 then
        L3_331 = _FORV_8_:FindFirstChild("VehicleSeat")
        break
      end
    end
    if L3_331 then
      L3_331.MaxSpeed = L4_332
      L3_331.CFrame = L3_331.CFrame + (L6_334 - L5_333).unit * L3_331.MaxSpeed * _UPVALUE3_.RenderStepped:Wait()
      L3_331.CFrame = CFrame.new(L3_331.Position, L6_334)
      if (L3_331.Position - L6_334).magnitude < 120 then
        _G.AutoComeTiki = false
        _UPVALUE4_:SendKeyEvent(false, "W", false, game)
      end
    end
  end
  L60_60(L61_61, L62_62)
  L60_60 = L2_2.Sea
  L62_62 = "AddToggle"
  L61_61 = L60_60
  L60_60 = L60_60[L62_62]
  L62_62 = "AutoComeHydra"
  L63_63 = {}
  L64_64 = "L\195\161i Thuy\225\187\129n V\225\187\129 \196\144\225\186\163o Hydra"
  L63_63.Title = L64_64
  L64_64 = "Description"
  L65_65 = ""
  L63_63[L64_64] = L65_65
  L64_64 = "Default"
  L65_65 = false
  L63_63[L64_64] = L65_65
  L60_60 = L60_60(L61_61, L62_62, L63_63)
  L63_63 = "OnChanged"
  L62_62 = L60_60
  L61_61 = L60_60[L63_63]
  function L63_63(A0_335)
    _G.AutoComeHydra = A0_335
  end
  L61_61(L62_62, L63_63)
  L61_61 = "RenderStepped"
  L61_61 = L43_43[L61_61]
  L63_63 = "Connect"
  L62_62 = L61_61
  L61_61 = L61_61[L63_63]
  function L63_63()
    local L0_336, L1_337, L2_338, L3_339, L4_340, L5_341, L6_342
    L0_336 = _G
    L0_336 = L0_336.AutoComeHydra
    if not L0_336 then
      return
    end
    L0_336 = _UPVALUE0_
    L0_336 = L0_336.LocalPlayer
    L1_337 = L0_336.Character
    if L1_337 then
      L3_339 = L1_337
      L2_338 = L1_337.FindFirstChild
      L2_338 = L2_338(L3_339, L4_340)
    elseif not L2_338 then
      return
    end
    L2_338 = L1_337.Humanoid
    L3_339 = nil
    for _FORV_7_, _FORV_8_ in L4_340(L5_341, L6_342, L5_341(L6_342)) do
      if _FORV_8_:FindFirstChild("VehicleSeat") and _FORV_8_:FindFirstChild("VehicleSeat").Occupant == L2_338 then
        L3_339 = _FORV_8_:FindFirstChild("VehicleSeat")
        break
      end
    end
    if L3_339 then
      L3_339.MaxSpeed = L4_340
      L3_339.CFrame = L3_339.CFrame + (L6_342 - L5_341).unit * L3_339.MaxSpeed * _UPVALUE3_.RenderStepped:Wait()
      L3_339.CFrame = CFrame.new(L3_339.Position, L6_342)
      if (L3_339.Position - L6_342).magnitude < 120 then
        _G.AutoComeHydra = false
        _UPVALUE4_:SendKeyEvent(false, "W", false, game)
      end
    end
  end
  L61_61(L62_62, L63_63)
  L61_61 = L2_2.Sea
  L63_63 = "AddButton"
  L62_62 = L61_61
  L61_61 = L61_61[L63_63]
  L63_63 = {}
  L64_64 = "Bay \196\144\225\186\191n Khu V\225\187\177c Mua Thuy\225\187\129n"
  L63_63.Title = L64_64
  L64_64 = "Description"
  L65_65 = ""
  L63_63[L64_64] = L65_65
  L64_64 = "Callback"
  function L65_65()
    local L0_343
    L0_343 = Tween2
    L0_343(CFrame.new(-16917.154296875, 7.757596015930176, 511.8203125))
  end
  L63_63[L64_64] = L65_65
  L61_61(L62_62, L63_63)
  L61_61 = {}
  L62_62 = {
    L63_63,
    L64_64,
    L65_65,
    L66_66,
    L67_67,
    L68_68,
    L69_69,
    L70_70,
    L71_71,
    L72_72,
    L73_73,
    L74_74,
    L75_75
  }
  L63_63 = "Beast Hunter"
  L64_64 = "Sleigh"
  L65_65 = "Miracle"
  L66_66 = "The Sentinel"
  L67_67 = "Guardian"
  L68_68 = "Lantern"
  L69_69 = "Dinghy"
  L70_70 = "PirateSloop"
  L71_71 = "PirateBrigade"
  L72_72 = "PirateGrandBrigade"
  L73_73 = "MarineGrandBrigade"
  L74_74 = "MarineBrigade"
  L75_75 = "MarineSloop"
  L63_63 = L2_2.Sea
  L65_65 = "AddDropdown"
  L64_64 = L63_63
  L63_63 = L63_63[L65_65]
  L65_65 = "DropdownBoat"
  L66_66 = {}
  L67_67 = "Ch\225\187\141n Thuy\225\187\129n"
  L66_66.Title = L67_67
  L67_67 = "Description"
  L68_68 = ""
  L66_66[L67_67] = L68_68
  L67_67 = "Values"
  L66_66[L67_67] = L62_62
  L67_67 = "Multi"
  L68_68 = false
  L66_66[L67_67] = L68_68
  L67_67 = "Default"
  L68_68 = 1
  L66_66[L67_67] = L68_68
  L63_63 = L63_63(L64_64, L65_65, L66_66)
  L66_66 = "SetValue"
  L65_65 = L63_63
  L64_64 = L63_63[L66_66]
  L66_66 = selectedBoat
  L64_64(L65_65, L66_66)
  L66_66 = "OnChanged"
  L65_65 = L63_63
  L64_64 = L63_63[L66_66]
  function L66_66(A0_344)
    selectedBoat = A0_344
  end
  L64_64(L65_65, L66_66)
  function L64_64(A0_345)
    local L1_346
    L1_346 = {}
    L1_346[1] = "BuyBoat"
    L1_346[2] = A0_345
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L1_346))
    task.delay(2, function()
      local L0_347
      for _FORV_3_, _FORV_4_ in L0_347(_UPVALUE0_.Boats:GetChildren()) do
        if _FORV_4_:IsA("Model") and _FORV_4_.Name == _UPVALUE1_ and _FORV_4_:FindFirstChild("VehicleSeat") and not _FORV_4_:FindFirstChild("VehicleSeat").Occupant then
          _UPVALUE2_[_UPVALUE1_] = _FORV_4_:FindFirstChild("VehicleSeat")
        end
      end
    end)
  end
  function L65_65()
    for _FORV_3_, _FORV_4_ in pairs(_UPVALUE0_) do
      if _FORV_4_ and _FORV_4_.Parent and _FORV_4_.Name == "VehicleSeat" and not _FORV_4_.Occupant then
        Tween2(_FORV_4_.CFrame)
      end
    end
  end
  L66_66 = game
  L67_67 = L66_66
  L66_66 = L66_66.GetService
  L68_68 = "RunService"
  L66_66 = L66_66(L67_67, L68_68)
  L67_67 = "RenderStepped"
  L66_66 = L66_66[L67_67]
  L68_68 = "Connect"
  L67_67 = L66_66
  L66_66 = L66_66[L68_68]
  function L68_68()
    for _FORV_3_, _FORV_4_ in pairs(_UPVALUE0_) do
      if _FORV_4_ and _FORV_4_.Parent and _FORV_4_.Name == "VehicleSeat" and not _FORV_4_.Occupant then
        _UPVALUE0_[_FORV_3_] = _FORV_4_
      end
    end
  end
  L66_66(L67_67, L68_68)
  L66_66 = L2_2.Sea
  L68_68 = "AddButton"
  L67_67 = L66_66
  L66_66 = L66_66[L68_68]
  L68_68 = {}
  L69_69 = "Mua Thuy\225\187\129n"
  L68_68.Title = L69_69
  L69_69 = "Description"
  L70_70 = ""
  L68_68[L69_69] = L70_70
  L69_69 = "Callback"
  function L70_70()
    _UPVALUE0_(selectedBoat)
  end
  L68_68[L69_69] = L70_70
  L66_66(L67_67, L68_68)
  L66_66 = L2_2.Sea
  L68_68 = "AddButton"
  L67_67 = L66_66
  L66_66 = L66_66[L68_68]
  L68_68 = {}
  L69_69 = "Bay \196\144\225\186\191n Thuy\225\187\129n"
  L68_68.Title = L69_69
  L69_69 = "Description"
  L70_70 = "Duy Nh\225\186\165t Thuy\225\187\129n B\225\186\161n Mua \225\187\158 Ch\225\187\151 Ch\225\187\141n"
  L68_68[L69_69] = L70_70
  L69_69 = "Callback"
  function L70_70()
    _UPVALUE0_()
  end
  L68_68[L69_69] = L70_70
  L66_66(L67_67, L68_68)
  L66_66 = L2_2.Sea
  L68_68 = "AddToggle"
  L67_67 = L66_66
  L66_66 = L66_66[L68_68]
  L68_68 = "ToggleTerrorshark"
  L69_69 = {}
  L70_70 = "\239\191\189\195\161nh C\195\161 M\225\186\173p T\225\186\173n Th\225\186\191"
  L69_69.Title = L70_70
  L70_70 = "Description"
  L71_71 = ""
  L69_69[L70_70] = L71_71
  L70_70 = "Default"
  L71_71 = false
  L69_69[L70_70] = L71_71
  L66_66 = L66_66(L67_67, L68_68, L69_69)
  L69_69 = "OnChanged"
  L68_68 = L66_66
  L67_67 = L66_66[L69_69]
  function L69_69(A0_348)
    _G.AutoTerrorshark = A0_348
  end
  L67_67(L68_68, L69_69)
  L67_67 = "ToggleTerrorshark"
  L67_67 = L3_3[L67_67]
  L69_69 = "SetValue"
  L68_68 = L67_67
  L67_67 = L67_67[L69_69]
  L69_69 = false
  L67_67(L68_68, L69_69)
  L67_67 = _G
  L68_68 = "IsFlying"
  L69_69 = false
  L67_67[L68_68] = L69_69
  L67_67 = spawn
  function L68_68()
    while wait() do
      if _G.AutoTerrorshark then
        pcall(function()
          local L0_349
          L0_349 = game
          L0_349 = L0_349.Players
          L0_349 = L0_349.LocalPlayer
          L0_349 = L0_349.Character
          if L0_349 and L0_349:FindFirstChild("Humanoid") then
            if L0_349.Humanoid.Health < 6000 and not _G.IsFlying then
              _G.IsFlying = true
              Tween(CFrame.new(L0_349.HumanoidRootPart.Position.X, 360, L0_349.HumanoidRootPart.Position.Z))
            end
            if _G.IsFlying and L0_349.Humanoid.Health >= 8000 then
              _G.IsFlying = false
            end
            if not _G.IsFlying and L0_349.Humanoid.Health >= 8000 then
              if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                for _FORV_4_, _FORV_5_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if _FORV_5_.Name == "Terrorshark" and _FORV_5_:FindFirstChild("Humanoid") and _FORV_5_:FindFirstChild("HumanoidRootPart") and _FORV_5_.Humanoid.Health > 0 then
                    repeat
                      wait(_G.Fast_Delay)
                      if L0_349.Humanoid.Health < 6000 then
                        _G.IsFlying = true
                        Tween(CFrame.new(L0_349.HumanoidRootPart.Position.X, 360, L0_349.HumanoidRootPart.Position.Z))
                        break
                      end
                      AttackNoCoolDown()
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      _FORV_5_.HumanoidRootPart.CanCollide = false
                      _FORV_5_.Humanoid.WalkSpeed = 0
                      _FORV_5_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
                    until not _G.AutoTerrorshark or not _FORV_5_.Parent or _FORV_5_.Humanoid.Health <= 0 or _G.IsFlying
                  end
                end
              elseif game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * Pos)
              end
            end
          end
        end)
      end
    end
  end
  L67_67(L68_68)
  L67_67 = L2_2.Sea
  L69_69 = "AddToggle"
  L68_68 = L67_67
  L67_67 = L67_67[L69_69]
  L69_69 = "TogglePiranha"
  L70_70 = {}
  L71_71 = "\239\191\189\195\161nh Piranha"
  L70_70.Title = L71_71
  L71_71 = "Description"
  L72_72 = ""
  L70_70[L71_71] = L72_72
  L71_71 = "Default"
  L72_72 = false
  L70_70[L71_71] = L72_72
  L67_67 = L67_67(L68_68, L69_69, L70_70)
  L70_70 = "OnChanged"
  L69_69 = L67_67
  L68_68 = L67_67[L70_70]
  function L70_70(A0_350)
    _G.farmpiranya = A0_350
  end
  L68_68(L69_69, L70_70)
  L68_68 = "TogglePiranha"
  L68_68 = L3_3[L68_68]
  L70_70 = "SetValue"
  L69_69 = L68_68
  L68_68 = L68_68[L70_70]
  L70_70 = false
  L68_68(L69_69, L70_70)
  L68_68 = spawn
  function L69_69()
    while wait() do
      if _G.farmpiranya then
        pcall(function()
          if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _FORV_4_.Name == "Piranha" and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 then
                repeat
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  _FORV_4_.Humanoid.WalkSpeed = 0
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                until not _G.farmpiranya or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
              end
            end
          else
            if game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
              Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * Pos)
            else
            end
          end
        end)
      end
    end
  end
  L68_68(L69_69)
  L68_68 = L2_2.Sea
  L70_70 = "AddToggle"
  L69_69 = L68_68
  L68_68 = L68_68[L70_70]
  L70_70 = "ToggleShark"
  L71_71 = {}
  L72_72 = "\239\191\189\195\161nh C\195\161 M\225\186\173p"
  L71_71.Title = L72_72
  L72_72 = "Description"
  L73_73 = ""
  L71_71[L72_72] = L73_73
  L72_72 = "Default"
  L73_73 = false
  L71_71[L72_72] = L73_73
  L68_68 = L68_68(L69_69, L70_70, L71_71)
  L71_71 = "OnChanged"
  L70_70 = L68_68
  L69_69 = L68_68[L71_71]
  function L71_71(A0_351)
    _G.AutoShark = A0_351
  end
  L69_69(L70_70, L71_71)
  L69_69 = "ToggleShark"
  L69_69 = L3_3[L69_69]
  L71_71 = "SetValue"
  L70_70 = L69_69
  L69_69 = L69_69[L71_71]
  L71_71 = false
  L69_69(L70_70, L71_71)
  L69_69 = spawn
  function L70_70()
    while wait() do
      if _G.AutoShark then
        pcall(function()
          if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _FORV_4_.Name == "Shark" and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 then
                repeat
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  _FORV_4_.Humanoid.WalkSpeed = 0
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  game.Players.LocalPlayer.Character.Humanoid.Sit = false
                until not _G.AutoShark or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
              end
            end
          else
            Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
            if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
              Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * Pos)
            else
            end
          end
        end)
      end
    end
  end
  L69_69(L70_70)
  L69_69 = L2_2.Sea
  L71_71 = "AddToggle"
  L70_70 = L69_69
  L69_69 = L69_69[L71_71]
  L71_71 = "ToggleFishCrew"
  L72_72 = {}
  L73_73 = "\239\191\189\195\161nh T\195\160u C\195\161"
  L72_72.Title = L73_73
  L73_73 = "Description"
  L74_74 = ""
  L72_72[L73_73] = L74_74
  L73_73 = "Default"
  L74_74 = false
  L72_72[L73_73] = L74_74
  L69_69 = L69_69(L70_70, L71_71, L72_72)
  L72_72 = "OnChanged"
  L71_71 = L69_69
  L70_70 = L69_69[L72_72]
  function L72_72(A0_352)
    _G.AutoFishCrew = A0_352
  end
  L70_70(L71_71, L72_72)
  L70_70 = "ToggleFishCrew"
  L70_70 = L3_3[L70_70]
  L72_72 = "SetValue"
  L71_71 = L70_70
  L70_70 = L70_70[L72_72]
  L72_72 = false
  L70_70(L71_71, L72_72)
  L70_70 = spawn
  function L71_71()
    while wait() do
      if _G.AutoFishCrew then
        pcall(function()
          if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _FORV_4_.Name == "Fish Crew Member" and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 then
                repeat
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  _FORV_4_.Humanoid.WalkSpeed = 0
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  game.Players.LocalPlayer.Character.Humanoid.Sit = false
                until not _G.AutoFishCrew or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
              end
            end
          else
            Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
            if game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
              Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame * Pos)
            else
            end
          end
        end)
      end
    end
  end
  L70_70(L71_71)
  L70_70 = L2_2.Sea
  L72_72 = "AddToggle"
  L71_71 = L70_70
  L70_70 = L70_70[L72_72]
  L72_72 = "ToggleShip"
  L73_73 = {}
  L74_74 = "\239\191\189\195\161nh T\195\160u"
  L73_73.Title = L74_74
  L74_74 = "Description"
  L75_75 = ""
  L73_73[L74_74] = L75_75
  L74_74 = "Default"
  L75_75 = false
  L73_73[L74_74] = L75_75
  L70_70 = L70_70(L71_71, L72_72, L73_73)
  L73_73 = "OnChanged"
  L72_72 = L70_70
  L71_71 = L70_70[L73_73]
  function L73_73(A0_353)
    _G.Ship = A0_353
  end
  L71_71(L72_72, L73_73)
  L71_71 = "ToggleShip"
  L71_71 = L3_3[L71_71]
  L73_73 = "SetValue"
  L72_72 = L71_71
  L71_71 = L71_71[L73_73]
  L73_73 = false
  L71_71(L72_72, L73_73)
  function L71_71()
    local L0_354
    L0_354 = {
      "PirateGrandBrigade",
      "PirateBrigade"
    }
    for _FORV_4_, _FORV_5_ in next, game:GetService("Workspace").Enemies:GetChildren() do
      if table.find(L0_354, _FORV_5_.Name) and _FORV_5_:FindFirstChild("Health") and _FORV_5_.Health.Value > 0 then
        return _FORV_5_
      end
    end
  end
  CheckPirateBoat = L71_71
  L71_71 = spawn
  function L72_72()
    while wait() do
      if _G.Ship then
        pcall(function()
          if CheckPirateBoat() then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
            wait(0.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
            repeat
              wait()
              spawn(Tween(CheckPirateBoat().Engine.CFrame * CFrame.new(0, -20, 0)), 1)
              AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
              Skillaimbot = true
              AutoSkill = false
            until not CheckPirateBoat() or not CheckPirateBoat().Parent or 0 >= CheckPirateBoat().Health.Value or not CheckPirateBoat()
            Skillaimbot = true
            AutoSkill = false
          end
        end)
      end
    end
  end
  L71_71(L72_72)
  L71_71 = L2_2.Sea
  L73_73 = "AddToggle"
  L72_72 = L71_71
  L71_71 = L71_71[L73_73]
  L73_73 = "ToggleGhostShip"
  L74_74 = {}
  L75_75 = "\239\191\189\195\161nh T\195\160u Ma"
  L74_74.Title = L75_75
  L75_75 = "Description"
  L76_76 = ""
  L74_74[L75_75] = L76_76
  L75_75 = "Default"
  L76_76 = false
  L74_74[L75_75] = L76_76
  L71_71 = L71_71(L72_72, L73_73, L74_74)
  L74_74 = "OnChanged"
  L73_73 = L71_71
  L72_72 = L71_71[L74_74]
  function L74_74(A0_355)
    _G.GhostShip = A0_355
  end
  L72_72(L73_73, L74_74)
  L72_72 = "ToggleGhostShip"
  L72_72 = L3_3[L72_72]
  L74_74 = "SetValue"
  L73_73 = L72_72
  L72_72 = L72_72[L74_74]
  L74_74 = false
  L72_72(L73_73, L74_74)
  function L72_72()
    local L0_356
    L0_356 = {"FishBoat"}
    for _FORV_4_, _FORV_5_ in next, game:GetService("Workspace").Enemies:GetChildren() do
      if table.find(L0_356, _FORV_5_.Name) and _FORV_5_:FindFirstChild("Health") and _FORV_5_.Health.Value > 0 then
        return _FORV_5_
      end
    end
  end
  CheckPirateBoat = L72_72
  L72_72 = spawn
  function L73_73()
    while wait() do
      pcall(function()
        if _G.bjirFishBoat and CheckPirateBoat() then
          game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
          wait()
          game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
          repeat
            wait()
            spawn(Tween(CheckPirateBoat().Engine.CFrame * CFrame.new(0, -20, 0), 1))
            AutoSkill = true
            Skillaimbot = true
            AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
          until CheckPirateBoat().Parent or 0 >= CheckPirateBoat().Health.Value or not CheckPirateBoat()
          AutoSkill = false
          Skillaimbot = false
        end
      end)
    end
  end
  L72_72(L73_73)
  L72_72 = spawn
  function L73_73()
    while wait() do
      if _G.bjirFishBoat then
        pcall(function()
          local L0_357, L1_358, L2_359, L3_360, L4_361
          if L0_357 then
            L0_357()
            L0_357(L1_358)
            L3_360 = 1280
            L4_361 = 672
            L4_361 = L2_359(L3_360, L4_361)
            L0_357(L1_358, L2_359, L3_360, L4_361, L2_359(L3_360, L4_361))
            L4_361 = L1_358(L2_359)
            for L3_360, L4_361 in L0_357(L1_358, L2_359, L3_360, L4_361, L1_358(L2_359)) do
              if L4_361:IsA("Tool") and L4_361.ToolTip == "Melee" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(L4_361)
              end
            end
            L3_360 = 122
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 122
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357(L1_358)
            L3_360 = 120
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 120
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357(L1_358)
            L3_360 = 99
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 99
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357(L1_358)
            L3_360 = "C"
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L4_361 = L1_358(L2_359)
            for L3_360, L4_361 in L0_357(L1_358, L2_359, L3_360, L4_361, L1_358(L2_359)) do
              if L4_361:IsA("Tool") and L4_361.ToolTip == "Blox Fruit" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(L4_361)
              end
            end
            L3_360 = 122
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 122
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357(L1_358)
            L3_360 = 120
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 120
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357(L1_358)
            L3_360 = 99
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 99
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357(L1_358)
            L3_360 = "V"
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = "V"
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357()
            L4_361 = L1_358(L2_359)
            for L3_360, L4_361 in L0_357(L1_358, L2_359, L3_360, L4_361, L1_358(L2_359)) do
              if L4_361:IsA("Tool") and L4_361.ToolTip == "Sword" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(L4_361)
              end
            end
            L3_360 = 122
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 122
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357(L1_358)
            L3_360 = 120
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 120
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357(L1_358)
            L3_360 = 99
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 99
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357()
            L4_361 = L1_358(L2_359)
            for L3_360, L4_361 in L0_357(L1_358, L2_359, L3_360, L4_361, L1_358(L2_359)) do
              if L4_361:IsA("Tool") and L4_361.ToolTip == "Gun" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(L4_361)
              end
            end
            L3_360 = 122
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 122
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357(L1_358)
            L3_360 = 120
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 120
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L0_357(L1_358)
            L3_360 = 99
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
            L3_360 = 99
            L4_361 = false
            L0_357(L1_358, L2_359, L3_360, L4_361, game.Players.LocalPlayer.Character.HumanoidRootPart)
          end
        end)
      end
    end
  end
  L72_72(L73_73)
  L72_72 = L2_2.Main
  L74_74 = "AddSection"
  L73_73 = L72_72
  L72_72 = L72_72[L74_74]
  L74_74 = "Elite"
  L72_72 = L72_72(L73_73, L74_74)
  L73_73 = L2_2.Main
  L75_75 = "AddParagraph"
  L74_74 = L73_73
  L73_73 = L73_73[L75_75]
  L75_75 = {}
  L76_76 = "Tr\225\186\161ng Th\195\161i Elite"
  L75_75.Title = L76_76
  L76_76 = "Content"
  L77_77 = ""
  L75_75[L76_76] = L77_77
  L73_73 = L73_73(L74_74, L75_75)
  L74_74 = spawn
  function L75_75()
    while wait() do
      pcall(function()
        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
          _UPVALUE0_:SetDesc("Elite Boss: \226\156\133\239\184\143 | Killed:  " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        else
          _UPVALUE0_:SetDesc("Elite Boss: \226\157\140\239\184\143 | Killed: " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        end
      end)
    end
  end
  L74_74(L75_75)
  L74_74 = L2_2.Main
  L76_76 = "AddToggle"
  L75_75 = L74_74
  L74_74 = L74_74[L76_76]
  L76_76 = "ToggleElite"
  L77_77 = {}
  L78_78 = "\239\191\189\195\161nh Elite"
  L77_77.Title = L78_78
  L78_78 = "Description"
  L79_79 = ""
  L77_77[L78_78] = L79_79
  L78_78 = "Default"
  L79_79 = false
  L77_77[L78_78] = L79_79
  L74_74 = L74_74(L75_75, L76_76, L77_77)
  L77_77 = "OnChanged"
  L76_76 = L74_74
  L75_75 = L74_74[L77_77]
  function L77_77(A0_362)
    _G.AutoElite = A0_362
  end
  L75_75(L76_76, L77_77)
  L75_75 = "ToggleElite"
  L75_75 = L3_3[L75_75]
  L77_77 = "SetValue"
  L76_76 = L75_75
  L75_75 = L75_75[L77_77]
  L77_77 = false
  L75_75(L76_76, L77_77)
  L75_75 = spawn
  function L76_76()
    while task.wait() do
      if _G.AutoElite then
        pcall(function()
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
          if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") then
              if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 and (_FORV_4_.Name == "Diablo" or _FORV_4_.Name == "Deandre" or _FORV_4_.Name == "Urban") then
                    repeat
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      EquipTool(SelectWeapon)
                      AutoHaki()
                      Tween2(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                      _FORV_4_.Humanoid.WalkSpeed = 0
                      _FORV_4_.HumanoidRootPart.CanCollide = false
                      _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    until _G.AutoElite == false or _FORV_4_.Humanoid.Health <= 0 or not _FORV_4_.Parent
                  end
                end
              elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
              elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
              elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
              end
            end
          else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
          end
        end)
      end
    end
  end
  L75_75(L76_76)
end
L37_37 = Sea3
if L37_37 then
  L37_37 = L2_2.Sea
  L39_39 = "AddSection"
  L38_38 = L37_37
  L37_37 = L37_37[L39_39]
  L39_39 = "\239\191\189\225\186\163o B\195\173 \225\186\168n"
  L37_37 = L37_37(L38_38, L39_39)
  L38_38 = L2_2.Sea
  L40_40 = "AddParagraph"
  L39_39 = L38_38
  L38_38 = L38_38[L40_40]
  L40_40 = {}
  L41_41 = "Tr\225\186\161ng Th\195\161i"
  L40_40.Title = L41_41
  L41_41 = "Content"
  L42_42 = ""
  L40_40[L41_41] = L42_42
  L38_38 = L38_38(L39_39, L40_40)
  L39_39 = task
  L39_39 = L39_39.spawn
  function L40_40()
    while task.wait() do
      pcall(function()
        if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
          FullMoonStatus = "100%"
        elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
          FullMoonStatus = "75%"
        elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
          FullMoonStatus = "50%"
        elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
          FullMoonStatus = "25%"
        elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
          FullMoonStatus = "15%"
        else
          FullMoonStatus = "0%"
        end
      end)
    end
  end
  L39_39(L40_40)
  L39_39 = task
  L39_39 = L39_39.spawn
  function L40_40()
    while task.wait() do
      pcall(function()
        if game.Workspace.Map:FindFirstChild("MysticIsland") then
          MirageStatus = "\239\191\189\239\191\189\239\184\143"
        else
          MirageStatus = "\239\191\189\239\191\189\239\184\143"
        end
      end)
    end
  end
  L39_39(L40_40)
  L39_39 = spawn
  function L40_40()
    pcall(function()
      while wait() do
        _UPVALUE0_:SetDesc("\239\191\189\225\186\163o B\195\173 \225\186\168n: " .. MirageStatus .. " | Tr\196\131ng Tr\195\178n: " .. FullMoonStatus)
      end
    end)
  end
  L39_39(L40_40)
  L39_39 = L2_2.Sea
  L41_41 = "AddButton"
  L40_40 = L39_39
  L39_39 = L39_39[L41_41]
  L41_41 = {}
  L42_42 = "Bay \196\144\225\186\191n Ch\225\187\151 Cao"
  L41_41.Title = L42_42
  L42_42 = "Description"
  L43_43 = ""
  L41_41[L42_42] = L43_43
  L42_42 = "Callback"
  function L43_43()
    TweenToHighestPoint()
  end
  L41_41[L42_42] = L43_43
  L39_39(L40_40, L41_41)
  function L39_39()
    if getHighestPoint() then
      Tween2(getHighestPoint().CFrame * CFrame.new(0, 211.88, 0))
    end
  end
  TweenToHighestPoint = L39_39
  function L39_39()
    if not game.Workspace.Map:FindFirstChild("MysticIsland") then
      return nil
    end
    for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
      if _FORV_4_:IsA("MeshPart") and _FORV_4_.MeshId == "rbxassetid://6745037796" then
        return _FORV_4_
      end
    end
  end
  getHighestPoint = L39_39
end
L37_37 = L2_2.Sea
L39_39 = "AddToggle"
L38_38 = L37_37
L37_37 = L37_37[L39_39]
L39_39 = "ToggleTpAdvanced"
L40_40 = {}
L41_41 = "Bay \196\144\225\186\191n Advanced Fruit Dealer"
L40_40.Title = L41_41
L41_41 = "Description"
L42_42 = ""
L40_40[L41_41] = L42_42
L41_41 = "Default"
L42_42 = false
L40_40[L41_41] = L42_42
L37_37 = L37_37(L38_38, L39_39, L40_40)
L40_40 = "OnChanged"
L39_39 = L37_37
L38_38 = L37_37[L40_40]
function L40_40(A0_363)
  _G.AutoTpAdvanced = A0_363
end
L38_38(L39_39, L40_40)
L38_38 = spawn
function L39_39()
  local L0_364, L1_365
  while true do
    L0_364 = wait
    L0_364 = L0_364()
    if L0_364 then
      L0_364 = _G
      L0_364 = L0_364.AutoTpAdvanced
      if L0_364 then
        L0_364 = game
        L0_364 = L0_364.ReplicatedStorage
        L0_364 = L0_364.NPCs
        L1_365 = L0_364
        L0_364 = L0_364.FindFirstChild
        L0_364 = L0_364(L1_365, "Advanced Fruit Dealer")
        if L0_364 then
          L1_365 = L0_364.IsA
          L1_365 = L1_365(L0_364, "Model")
          if L1_365 then
            L1_365 = L0_364.PrimaryPart
            if L1_365 then
              L1_365 = L0_364.PrimaryPart
              L1_365 = L1_365.Position
            end
            if L1_365 then
              Tween2(CFrame.new(L1_365))
            end
          end
        end
      end
    end
  end
end
L38_38(L39_39)
L38_38 = L2_2.Sea
L40_40 = "AddToggle"
L39_39 = L38_38
L38_38 = L38_38[L40_40]
L40_40 = "ToggleTweenGear"
L41_41 = {}
L42_42 = "Bay \196\144\225\186\191n B\195\161nh R\196\131ng"
L41_41.Title = L42_42
L42_42 = "Description"
L43_43 = ""
L41_41[L42_42] = L43_43
L42_42 = "Default"
L43_43 = false
L41_41[L42_42] = L43_43
L38_38 = L38_38(L39_39, L40_40, L41_41)
L41_41 = "OnChanged"
L40_40 = L38_38
L39_39 = L38_38[L41_41]
function L41_41(A0_366)
  _G.TweenToGear = A0_366
end
L39_39(L40_40, L41_41)
L39_39 = "ToggleTweenGear"
L39_39 = L3_3[L39_39]
L41_41 = "SetValue"
L40_40 = L39_39
L39_39 = L39_39[L41_41]
L41_41 = false
L39_39(L40_40, L41_41)
L39_39 = spawn
function L40_40()
  pcall(function()
    while wait() do
      if _G.TweenToGear and game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
          if _FORV_4_:IsA("MeshPart") and _FORV_4_.Material == Enum.Material.Neon then
            Tween2(_FORV_4_.CFrame)
          end
        end
      end
    end
  end)
end
L39_39(L40_40)
L39_39 = L2_2.Sea
L41_41 = "AddToggle"
L40_40 = L39_39
L39_39 = L39_39[L41_41]
L41_41 = "Togglelockmoon"
L42_42 = {}
L43_43 = "Nh\195\172n Tr\196\131ng V\195\160 D\195\185ng T\225\187\153c"
L42_42.Title = L43_43
L43_43 = "Description"
L44_44 = ""
L42_42[L43_43] = L44_44
L43_43 = "Default"
L44_44 = false
L42_42[L43_43] = L44_44
L39_39 = L39_39(L40_40, L41_41, L42_42)
L42_42 = "OnChanged"
L41_41 = L39_39
L40_40 = L39_39[L42_42]
function L42_42(A0_367)
  _G.AutoLockMoon = A0_367
end
L40_40(L41_41, L42_42)
L40_40 = "Togglelockmoon"
L40_40 = L3_3[L40_40]
L42_42 = "SetValue"
L41_41 = L40_40
L40_40 = L40_40[L42_42]
L42_42 = false
L40_40(L41_41, L42_42)
L40_40 = spawn
function L41_41()
  while wait() do
    pcall(function()
      local L0_368, L1_369
      L0_368 = _G
      L0_368 = L0_368.AutoLockMoon
      if L0_368 then
        L0_368 = game
        L0_368 = L0_368.Lighting
        L1_369 = L0_368
        L0_368 = L0_368.GetMoonDirection
        L0_368 = L0_368(L1_369)
        L1_369 = game
        L1_369 = L1_369.Workspace
        L1_369 = L1_369.CurrentCamera
        L1_369 = L1_369.CFrame
        L1_369 = L1_369.p
        L1_369 = L1_369 + L0_368 * 100
        game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, L1_369)
      end
    end)
  end
end
L40_40(L41_41)
L40_40 = spawn
function L41_41()
  while wait() do
    pcall(function()
      if _G.AutoLockMoon then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
      end
    end)
  end
end
L40_40(L41_41)
L40_40 = L2_2.Item
L42_42 = "AddToggle"
L41_41 = L40_40
L40_40 = L40_40[L42_42]
L42_42 = "ToggleAutoSaber"
L43_43 = {}
L44_44 = "Saber"
L43_43.Title = L44_44
L44_44 = "Description"
L45_45 = ""
L43_43[L44_44] = L45_45
L44_44 = "Default"
L45_45 = false
L43_43[L44_44] = L45_45
L40_40 = L40_40(L41_41, L42_42, L43_43)
L43_43 = "OnChanged"
L42_42 = L40_40
L41_41 = L40_40[L43_43]
function L43_43(A0_370)
  _G.Auto_Saber = A0_370
end
L41_41(L42_42, L43_43)
L41_41 = "ToggleAutoSaber"
L41_41 = L3_3[L41_41]
L43_43 = "SetValue"
L42_42 = L41_41
L41_41 = L41_41[L43_43]
L43_43 = false
L41_41(L42_42, L43_43)
L41_41 = spawn
function L42_42()
  while task.wait() do
    if _G.Auto_Saber and game.Players.LocalPlayer.Data.Level.Value >= 200 then
      pcall(function()
        if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
          if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
            if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151E-9, -0.928667724, 3.97099491E-8, 1, 1.91679348E-8, 0.928667724, -4.39869794E-8, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
              Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
              wait(1)
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
              wait(1)
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
              wait(1)
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
              wait(1)
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
              wait(1)
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
              wait(1)
            else
              Tween(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151E-9, -0.928667724, 3.97099491E-8, 1, 1.91679348E-8, 0.928667724, -4.39869794E-8, 0.37091279))
            end
          elseif game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
              EquipTool("Torch")
              Tween(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094E-9, 0.761243105, -5.70652914E-10, 1, 1.20584542E-9, -0.761243105, 3.47544882E-10, -0.648466587))
            else
              Tween(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805E-5, -0.258850515, 0.965917408))
            end
          elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
            wait(0.5)
            EquipTool("Cup")
            wait(0.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", game:GetService("Players").LocalPlayer.Character.Cup)
            wait(0)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
          elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
          elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
              Tween(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
              for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _FORV_4_.Name == "Mob Leader" then
                  if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and 0 < _FORV_4_.Humanoid.Health then
                    repeat
                      task.wait(_G.Fast_Delay)
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      _FORV_4_.HumanoidRootPart.CanCollide = false
                      _FORV_4_.Humanoid.WalkSpeed = 0
                      _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                      AttackNoCoolDown()
                    until 0 >= _FORV_4_.Humanoid.Health or not _G.Auto_Saber
                  end
                  if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * Pos)
                  end
                end
              end
            end
          elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
            wait(0.5)
            EquipTool("Relic")
            wait(0.5)
            Tween(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877E-9, 0.481375456, 2.53851997E-8, 1, -5.79995607E-8, -0.481375456, 6.30572643E-8, 0.876514494))
          end
        elseif game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and 0 < _FORV_4_.Humanoid.Health and _FORV_4_.Name == "Saber Expert" then
              repeat
                task.wait(_G.Fast_Delay)
                EquipTool(SelectWeapon)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                _FORV_4_.HumanoidRootPart.Transparency = 1
                _FORV_4_.Humanoid.JumpPower = 0
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.CanCollide = false
                bringmob = true
                FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                MonFarm = _FORV_4_.Name
                AttackNoCoolDown()
              until 0 >= _FORV_4_.Humanoid.Health or not _G.Auto_Saber
              bringmob = true
              if 0 >= _FORV_4_.Humanoid.Health then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
              end
            end
          end
        end
      end)
    end
  end
end
L41_41(L42_42)
L41_41 = L2_2.Item
L43_43 = "AddToggle"
L42_42 = L41_41
L41_41 = L41_41[L43_43]
L43_43 = "ToggleAutoPoleV1"
L44_44 = {}
L45_45 = "Pole V1"
L44_44.Title = L45_45
L45_45 = "Description"
L46_46 = ""
L44_44[L45_45] = L46_46
L45_45 = "Default"
L46_46 = false
L44_44[L45_45] = L46_46
L41_41 = L41_41(L42_42, L43_43, L44_44)
L44_44 = "OnChanged"
L43_43 = L41_41
L42_42 = L41_41[L44_44]
function L44_44(A0_371)
  _G.Auto_PoleV1 = A0_371
end
L42_42(L43_43, L44_44)
L42_42 = "ToggleAutoPoleV1"
L42_42 = L3_3[L42_42]
L44_44 = "SetValue"
L43_43 = L42_42
L42_42 = L42_42[L44_44]
L44_44 = false
L42_42(L43_43, L44_44)
L42_42 = CFrame
L42_42 = L42_42.new
L43_43 = -7748.0185546875
L44_44 = 5606.80615234375
L45_45 = -2305.898681640625
L42_42 = L42_42(L43_43, L44_44, L45_45)
L43_43 = spawn
function L44_44()
  while wait() do
    if _G.Auto_PoleV1 then
      pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_.Name == "Thunder God" and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 then
              repeat
                task.wait(_G.Fast_Delay)
                AutoHaki()
                EquipTool(SelectWeapon)
                _FORV_4_.HumanoidRootPart.CanCollide = false
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                AttackNoCoolDown()
              until not _G.Auto_PoleV1 or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
            end
          end
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _UPVALUE0_.Position).Magnitude < 1500 then
          Tween(_UPVALUE0_)
        end
        Tween(CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625))
        if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end
L43_43(L44_44)
L43_43 = L2_2.Item
L45_45 = "AddToggle"
L44_44 = L43_43
L43_43 = L43_43[L45_45]
L45_45 = "ToggleAutoSaw"
L46_46 = {}
L47_47 = "C\198\176a C\195\161 M\225\186\173p"
L46_46.Title = L47_47
L47_47 = "Description"
L48_48 = ""
L46_46[L47_47] = L48_48
L47_47 = "Default"
L48_48 = false
L46_46[L47_47] = L48_48
L43_43 = L43_43(L44_44, L45_45, L46_46)
L46_46 = "OnChanged"
L45_45 = L43_43
L44_44 = L43_43[L46_46]
function L46_46(A0_372)
  _G.Auto_Saw = A0_372
end
L44_44(L45_45, L46_46)
L44_44 = "ToggleAutoSaw"
L44_44 = L3_3[L44_44]
L46_46 = "SetValue"
L45_45 = L44_44
L44_44 = L44_44[L46_46]
L46_46 = false
L44_44(L45_45, L46_46)
L44_44 = CFrame
L44_44 = L44_44.new
L45_45 = -690.33081054688
L46_46 = 15.09425163269
L47_47 = 1582.2380371094
L44_44 = L44_44(L45_45, L46_46, L47_47)
L45_45 = spawn
function L46_46()
  while wait() do
    if _G.Auto_Saw then
      pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_.Name == "The Saw" and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 then
              repeat
                task.wait(_G.Fast_Delay)
                AutoHaki()
                EquipTool(SelectWeapon)
                _FORV_4_.HumanoidRootPart.CanCollide = false
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                AttackNoCoolDown()
              until not _G.Auto_Saw or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
            end
          end
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _UPVALUE0_.Position).Magnitude < 1500 then
          Tween(_UPVALUE0_)
        end
        Tween(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
        if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end
L45_45(L46_46)
L45_45 = L2_2.Item
L47_47 = "AddToggle"
L46_46 = L45_45
L45_45 = L45_45[L47_47]
L47_47 = "ToggleAutoWarden"
L48_48 = {}
L49_49 = "Ki\225\186\191m Qu\225\186\163n Ng\225\187\165c"
L48_48.Title = L49_49
L49_49 = "Description"
L50_50 = ""
L48_48[L49_49] = L50_50
L49_49 = "Default"
L50_50 = false
L48_48[L49_49] = L50_50
L45_45 = L45_45(L46_46, L47_47, L48_48)
L48_48 = "OnChanged"
L47_47 = L45_45
L46_46 = L45_45[L48_48]
function L48_48(A0_373)
  _G.Auto_Warden = A0_373
end
L46_46(L47_47, L48_48)
L46_46 = "ToggleAutoWarden"
L46_46 = L3_3[L46_46]
L48_48 = "SetValue"
L47_47 = L46_46
L46_46 = L46_46[L48_48]
L48_48 = false
L46_46(L47_47, L48_48)
L46_46 = CFrame
L46_46 = L46_46.new
L47_47 = 5186.14697265625
L48_48 = 24.86684226989746
L49_49 = 832.1885375976562
L46_46 = L46_46(L47_47, L48_48, L49_49)
L47_47 = spawn
function L48_48()
  while wait() do
    if _G.Auto_Warden then
      pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_.Name == "Chief Warden" and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 then
              repeat
                task.wait(_G.Fast_Delay)
                AutoHaki()
                EquipTool(SelectWeapon)
                _FORV_4_.HumanoidRootPart.CanCollide = false
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                AttackNoCoolDown()
              until not _G.Auto_Warden or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
            end
          end
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _UPVALUE0_.Position).Magnitude < 1500 then
          Tween(_UPVALUE0_)
        end
        Tween(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562))
        if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end
L47_47(L48_48)
L47_47 = Sea3
if L47_47 then
  L47_47 = L2_2.Item
  L49_49 = "AddToggle"
  L48_48 = L47_47
  L47_47 = L47_47[L49_49]
  L49_49 = "ToggleHallow"
  L50_50 = {}
  L51_51 = "L\198\176\225\187\161i H\195\161i"
  L50_50.Title = L51_51
  L51_51 = "Description"
  L52_52 = ""
  L50_50[L51_51] = L52_52
  L51_51 = "Default"
  L52_52 = false
  L50_50[L51_51] = L52_52
  L47_47 = L47_47(L48_48, L49_49, L50_50)
  L50_50 = "OnChanged"
  L49_49 = L47_47
  L48_48 = L47_47[L50_50]
  function L50_50(A0_374)
    AutoHallowSycthe = A0_374
  end
  L48_48(L49_49, L50_50)
  L48_48 = "ToggleHallow"
  L48_48 = L3_3[L48_48]
  L50_50 = "SetValue"
  L49_49 = L48_48
  L48_48 = L48_48[L50_50]
  L50_50 = false
  L48_48(L49_49, L50_50)
  L48_48 = spawn
  function L49_49()
    while wait() do
      if AutoHallowSycthe then
        pcall(function()
          if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if string.find(_FORV_4_.Name, "Soul Reaper") then
                repeat
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  _FORV_4_.HumanoidRootPart.Transparency = 1
                  sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                until _FORV_4_.Humanoid.Health <= 0 or AutoHallowSycthe == false
              end
            end
          elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
            repeat
              Tween(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
              wait()
            until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
            wait()
            EquipTool("Hallow Essence")
          else
            if game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
              Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * Pos)
            else
            end
          end
        end)
      end
    end
  end
  L48_48(L49_49)
  L48_48 = spawn
  function L49_49()
    local L0_375
    while true do
      L0_375 = wait
      L0_375 = L0_375()
      if L0_375 then
        L0_375 = AutoHallowSycthe
        if L0_375 then
          L0_375 = {}
          L0_375[1] = "Bones"
          L0_375[2] = "Buy"
          L0_375[3] = 1
          L0_375[4] = 1
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_375))
        end
      end
    end
  end
  L48_48(L49_49)
  L48_48 = L2_2.Item
  L50_50 = "AddToggle"
  L49_49 = L48_48
  L48_48 = L48_48[L50_50]
  L50_50 = "ToggleYama"
  L51_51 = {}
  L52_52 = "Yama"
  L51_51.Title = L52_52
  L52_52 = "Description"
  L53_53 = ""
  L51_51[L52_52] = L53_53
  L52_52 = "Default"
  L53_53 = false
  L51_51[L52_52] = L53_53
  L48_48 = L48_48(L49_49, L50_50, L51_51)
  L51_51 = "OnChanged"
  L50_50 = L48_48
  L49_49 = L48_48[L51_51]
  function L51_51(A0_376)
    _G.AutoYama = A0_376
  end
  L49_49(L50_50, L51_51)
  L49_49 = "ToggleYama"
  L49_49 = L3_3[L49_49]
  L51_51 = "SetValue"
  L50_50 = L49_49
  L49_49 = L49_49[L51_51]
  L51_51 = false
  L49_49(L50_50, L51_51)
  L49_49 = spawn
  function L50_50()
    repeat
      while wait() do
        if _G.AutoYama and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
          wait()
          fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
        end
      end
    until not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") and _G.AutoYama
  end
  L49_49(L50_50)
  L49_49 = L2_2.Item
  L51_51 = "AddToggle"
  L50_50 = L49_49
  L49_49 = L49_49[L51_51]
  L51_51 = "ToggleTushita"
  L52_52 = {}
  L53_53 = "Tushita"
  L52_52.Title = L53_53
  L53_53 = "Description"
  L54_54 = ""
  L52_52[L53_53] = L54_54
  L53_53 = "Default"
  L54_54 = false
  L52_52[L53_53] = L54_54
  L49_49 = L49_49(L50_50, L51_51, L52_52)
  L52_52 = "OnChanged"
  L51_51 = L49_49
  L50_50 = L49_49[L52_52]
  function L52_52(A0_377)
    AutoTushita = A0_377
  end
  L50_50(L51_51, L52_52)
  L50_50 = "ToggleTushita"
  L50_50 = L3_3[L50_50]
  L52_52 = "SetValue"
  L51_51 = L50_50
  L50_50 = L50_50[L52_52]
  L52_52 = false
  L50_50(L51_51, L52_52)
  L50_50 = spawn
  function L51_51()
    while wait() do
      if AutoTushita then
        if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_.Name == ("Longma" or _FORV_4_.Name == "Longma") and _FORV_4_.Humanoid.Health > 0 and _FORV_4_:IsA("Model") and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") then
              repeat
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                AutoHaki()
                if not game.Players.LocalPlayer.Character:FindFirstChild(SelectWeapon) then
                  wait()
                  EquipTool(SelectWeapon)
                end
                FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                _FORV_4_.Humanoid.JumpPower = 0
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.CanCollide = false
                _FORV_4_.Humanoid:ChangeState(11)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
              until not AutoTushita or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
            end
          end
        else
          Tween(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
        end
      end
    end
  end
  L50_50(L51_51)
  L50_50 = L2_2.Item
  L52_52 = "AddToggle"
  L51_51 = L50_50
  L50_50 = L50_50[L52_52]
  L52_52 = "ToggleHoly"
  L53_53 = {}
  L54_54 = "\239\191\189\225\187\145t \196\144u\225\187\145c"
  L53_53.Title = L54_54
  L54_54 = "Description"
  L55_55 = ""
  L53_53[L54_54] = L55_55
  L54_54 = "Default"
  L55_55 = false
  L53_53[L54_54] = L55_55
  L50_50 = L50_50(L51_51, L52_52, L53_53)
  L53_53 = "OnChanged"
  L52_52 = L50_50
  L51_51 = L50_50[L53_53]
  function L53_53(A0_378)
    _G.Auto_Holy_Torch = A0_378
  end
  L51_51(L52_52, L53_53)
  L51_51 = "ToggleHoly"
  L51_51 = L3_3[L51_51]
  L53_53 = "SetValue"
  L52_52 = L51_51
  L51_51 = L51_51[L53_53]
  L53_53 = false
  L51_51(L52_52, L53_53)
  L51_51 = spawn
  function L52_52()
    while wait() do
      if _G.Auto_Holy_Torch then
        pcall(function()
          wait()
          repeat
            Tween(CFrame.new(-10752, 417, -9366))
            wait()
          until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10752, 417, -9366)).Magnitude <= 10
          wait()
          repeat
            Tween(CFrame.new(-11672, 334, -9474))
            wait()
          until not _G.Auto_Holy_Torch or 10 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-11672, 334, -9474)).Magnitude
          wait()
          repeat
            Tween(CFrame.new(-12132, 521, -10655))
            wait()
          until not _G.Auto_Holy_Torch or 10 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12132, 521, -10655)).Magnitude
          wait()
          repeat
            Tween(CFrame.new(-13336, 486, -6985))
            wait()
          until not _G.Auto_Holy_Torch or 10 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13336, 486, -6985)).Magnitude
          wait()
          repeat
            Tween(CFrame.new(-13489, 332, -7925))
            wait()
          until not _G.Auto_Holy_Torch or 10 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13489, 332, -7925)).Magnitude
        end)
      end
    end
  end
  L51_51(L52_52)
end
L47_47 = L2_2.Item
L49_49 = "AddToggle"
L48_48 = L47_47
L47_47 = L47_47[L49_49]
L49_49 = "ToggleAutoCanvander"
L50_50 = {}
L51_51 = "Canvander"
L50_50.Title = L51_51
L51_51 = "Description"
L52_52 = ""
L50_50[L51_51] = L52_52
L51_51 = "Default"
L52_52 = false
L50_50[L51_51] = L52_52
L47_47 = L47_47(L48_48, L49_49, L50_50)
L50_50 = "OnChanged"
L49_49 = L47_47
L48_48 = L47_47[L50_50]
function L50_50(A0_379)
  _G.Auto_Canvander = A0_379
end
L48_48(L49_49, L50_50)
L48_48 = "ToggleAutoCanvander"
L48_48 = L3_3[L48_48]
L50_50 = "SetValue"
L49_49 = L48_48
L48_48 = L48_48[L50_50]
L50_50 = false
L48_48(L49_49, L50_50)
L48_48 = CFrame
L48_48 = L48_48.new
L49_49 = 5311.07421875
L50_50 = 426.0243835449219
L51_51 = 165.12762451171875
L48_48 = L48_48(L49_49, L50_50, L51_51)
L49_49 = spawn
function L50_50()
  while wait() do
    if _G.Auto_Canvander then
      pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_.Name == "Beautiful Pirate" and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 then
              repeat
                task.wait(_G.Fast_Delay)
                AutoHaki()
                EquipTool(SelectWeapon)
                _FORV_4_.HumanoidRootPart.CanCollide = false
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                AttackNoCoolDown()
              until not _G.Auto_Canvander or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
            end
          end
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _UPVALUE0_.Position).Magnitude < 1500 then
          Tween(_UPVALUE0_)
        end
        Tween(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875))
        if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end
L49_49(L50_50)
L49_49 = L2_2.Item
L51_51 = "AddToggle"
L50_50 = L49_49
L49_49 = L49_49[L51_51]
L51_51 = "ToggleAutoMusketeerHat"
L52_52 = {}
L53_53 = "M\197\169 L\195\173nh Ng\225\187\177 L\195\162m"
L52_52.Title = L53_53
L53_53 = "Description"
L54_54 = ""
L52_52[L53_53] = L54_54
L53_53 = "Default"
L54_54 = false
L52_52[L53_53] = L54_54
L49_49 = L49_49(L50_50, L51_51, L52_52)
L52_52 = "OnChanged"
L51_51 = L49_49
L50_50 = L49_49[L52_52]
function L52_52(A0_380)
  _G.Auto_MusketeerHat = A0_380
end
L50_50(L51_51, L52_52)
L50_50 = "ToggleAutoMusketeerHat"
L50_50 = L3_3[L50_50]
L52_52 = "SetValue"
L51_51 = L50_50
L50_50 = L50_50[L52_52]
L52_52 = false
L50_50(L51_51, L52_52)
L50_50 = spawn
function L51_51()
  pcall(function()
    local L0_381
    while true do
      if L0_381 then
        if L0_381 then
          if L0_381 >= 1800 then
            if L0_381 == false then
              if L0_381 then
                if L0_381 then
                  if L0_381 == true then
                    if L0_381 then
                      for _FORV_3_, _FORV_4_ in L0_381(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _FORV_4_.Name == "Forest Pirate" then
                          repeat
                            task.wait(_G.Fast_Delay)
                            pcall(function()
                              EquipTool(SelectWeapon)
                              AutoHaki()
                              _UPVALUE0_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                              Tween(_UPVALUE0_.HumanoidRootPart.CFrame * Pos)
                              _UPVALUE0_.HumanoidRootPart.CanCollide = false
                              AttackNoCoolDown()
                              PosMon = _UPVALUE0_.HumanoidRootPart.CFrame
                              MonFarm = _UPVALUE0_.Name
                              bringmob = true
                            end)
                          until _G.Auto_MusketeerHat == false or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                          bringmob = false
                        end
                      end
                    else
                      bringmob = L0_381
                      L0_381(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                    end
                  end
                end
              else
                L0_381(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                if L0_381 <= 30 then
                  L0_381(1.5)
                  L0_381(L0_381, "StartQuest", "CitizenQuest", 1)
                end
              end
            end
          elseif L0_381 >= 1800 then
            if L0_381 == false then
              if L0_381 then
                if L0_381 then
                  if L0_381 == true then
                    if L0_381 then
                      for _FORV_3_, _FORV_4_ in L0_381(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _FORV_4_.Name == "Captain Elephant" then
                          OldCFrameElephant = _FORV_4_.HumanoidRootPart.CFrame
                          repeat
                            task.wait(_G.Fast_Delay)
                            pcall(function()
                              EquipTool(SelectWeapon)
                              AutoHaki()
                              _UPVALUE0_.HumanoidRootPart.CanCollide = false
                              _UPVALUE0_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                              Tween(_UPVALUE0_.HumanoidRootPart.CFrame * Pos)
                              _UPVALUE0_.HumanoidRootPart.CanCollide = false
                              _UPVALUE0_.HumanoidRootPart.CFrame = OldCFrameElephant
                              AttackNoCoolDown()
                            end)
                          until _G.Auto_MusketeerHat == false or _FORV_4_.Humanoid.Health <= 0 or not _FORV_4_.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                        end
                      end
                    else
                      L0_381(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
                    end
                  end
                end
              else
                L0_381(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                if L0_381 <= 4 then
                  L0_381(1.5)
                  L0_381(L0_381, "CitizenQuestProgress", "Citizen")
                end
              end
            end
          elseif L0_381 >= 1800 then
            if L0_381 == 2 then
              L0_381(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
            end
          end
        end
      end
    end
  end)
end
L50_50(L51_51)
L50_50 = L2_2.Item
L52_52 = "AddToggle"
L51_51 = L50_50
L50_50 = L50_50[L52_52]
L52_52 = "ToggleAutoObservationV2"
L53_53 = {}
L54_54 = "Haki Quan S\195\161t V2"
L53_53.Title = L54_54
L54_54 = "Description"
L55_55 = ""
L53_53[L54_54] = L55_55
L54_54 = "Default"
L55_55 = false
L53_53[L54_54] = L55_55
L50_50 = L50_50(L51_51, L52_52, L53_53)
L53_53 = "OnChanged"
L52_52 = L50_50
L51_51 = L50_50[L53_53]
function L53_53(A0_382)
  _G.Auto_ObservationV2 = A0_382
end
L51_51(L52_52, L53_53)
L51_51 = "ToggleAutoObservationV2"
L51_51 = L3_3[L51_51]
L53_53 = "SetValue"
L52_52 = L51_51
L51_51 = L51_51[L53_53]
L53_53 = false
L51_51(L52_52, L53_53)
L51_51 = spawn
function L52_52()
  while wait() do
    pcall(function()
      if _G.Auto_ObservationV2 then
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 3 then
          _G.Auto_MusketeerHat = false
          if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") then
            repeat
              Tween(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625))
              wait()
            until not _G.Auto_ObservationV2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
            wait(0.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
          elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
            repeat
              Tween(CFrame.new(-10920.125, 624.20275878906, -10266.995117188))
              wait()
            until not _G.Auto_ObservationV2 or 10 >= (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude
            wait(0.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start")
            wait(1)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
          else
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace"):GetDescendants()) do
              if _FORV_4_.Name == "Apple" or _FORV_4_.Name == "Banana" or _FORV_4_.Name == "Pineapple" then
                _FORV_4_.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                wait()
                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, _FORV_4_.Handle, 0)
                wait()
              end
            end
          end
        else
          _G.Auto_MusketeerHat = true
        end
      end
    end)
  end
end
L51_51(L52_52)
L51_51 = L2_2.Item
L53_53 = "AddToggle"
L52_52 = L51_51
L51_51 = L51_51[L53_53]
L53_53 = "ToggleAutoRainbowHaki"
L54_54 = {}
L55_55 = "Haki 7 M\195\160u"
L54_54.Title = L55_55
L55_55 = "Description"
L56_56 = ""
L54_54[L55_55] = L56_56
L55_55 = "Default"
L56_56 = false
L54_54[L55_55] = L56_56
L51_51 = L51_51(L52_52, L53_53, L54_54)
L54_54 = "OnChanged"
L53_53 = L51_51
L52_52 = L51_51[L54_54]
function L54_54(A0_383)
  _G.Auto_RainbowHaki = A0_383
end
L52_52(L53_53, L54_54)
L52_52 = "ToggleAutoRainbowHaki"
L52_52 = L3_3[L52_52]
L54_54 = "SetValue"
L53_53 = L52_52
L52_52 = L52_52[L54_54]
L54_54 = false
L52_52(L53_53, L54_54)
L52_52 = spawn
function L53_53()
  pcall(function()
    while wait(0.1) do
      if _G.Auto_RainbowHaki then
        if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
          Tween(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
          if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
            wait(1.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
          end
        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
          if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _FORV_4_.Name == "Stone" then
                OldCFrameRainbow = _FORV_4_.HumanoidRootPart.CFrame
                repeat
                  task.wait(_G.Fast_Delay)
                  EquipTool(SelectWeapon)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  _FORV_4_.HumanoidRootPart.CFrame = OldCFrameRainbow
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                  AttackNoCoolDown()
                until not _G.Auto_RainbowHaki or _FORV_4_.Humanoid.Health <= 0 or not _FORV_4_.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
              end
            end
          else
            Tween(CFrame.new(-1086.11621, 38.8425903, 6768.71436))
          end
        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
          if game:GetService("Workspace").Enemies:FindFirstChild("Hydra Leader") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _FORV_4_.Name == "Hydra Leader" then
                OldCFrameRainbow = _FORV_4_.HumanoidRootPart.CFrame
                repeat
                  task.wait(_G.Fast_Delay)
                  EquipTool(SelectWeapon)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  _FORV_4_.HumanoidRootPart.CFrame = OldCFrameRainbow
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                  AttackNoCoolDown()
                until not _G.Auto_RainbowHaki or _FORV_4_.Humanoid.Health <= 0 or not _FORV_4_.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
              end
            end
          else
            Tween(CFrame.new(5713.98877, 601.922974, 202.751251))
          end
        elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
          if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _FORV_4_.Name == "Kilo Admiral" then
                OldCFrameRainbow = _FORV_4_.HumanoidRootPart.CFrame
                repeat
                  task.wait(_G.Fast_Delay)
                  EquipTool(SelectWeapon)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                  _FORV_4_.HumanoidRootPart.CFrame = OldCFrameRainbow
                  AttackNoCoolDown()
                until not _G.Auto_RainbowHaki or _FORV_4_.Humanoid.Health <= 0 or not _FORV_4_.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
              end
            end
          else
            Tween(CFrame.new(2877.61743, 423.558685, -7207.31006))
          end
        elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
          if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _FORV_4_.Name == "Captain Elephant" then
                OldCFrameRainbow = _FORV_4_.HumanoidRootPart.CFrame
                repeat
                  task.wait(_G.Fast_Delay)
                  EquipTool(SelectWeapon)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                  _FORV_4_.HumanoidRootPart.CFrame = OldCFrameRainbow
                  AttackNoCoolDown()
                until not _G.Auto_RainbowHaki or _FORV_4_.Humanoid.Health <= 0 or not _FORV_4_.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
              end
            end
          else
            Tween(CFrame.new(-13485.0283, 331.709259, -8012.4873))
          end
        elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
          if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _FORV_4_.Name == "Beautiful Pirate" then
                OldCFrameRainbow = _FORV_4_.HumanoidRootPart.CFrame
                repeat
                  task.wait(_G.Fast_Delay)
                  EquipTool(SelectWeapon)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                  _FORV_4_.HumanoidRootPart.CFrame = OldCFrameRainbow
                  AttackNoCoolDown()
                until not _G.Auto_RainbowHaki or _FORV_4_.Humanoid.Health <= 0 or not _FORV_4_.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
              end
            end
          else
            Tween(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
          end
        else
          Tween(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
          if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
            wait(1.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
          end
        end
      end
    end
  end)
end
L52_52(L53_53)
L52_52 = L2_2.Item
L54_54 = "AddToggle"
L53_53 = L52_52
L52_52 = L52_52[L54_54]
L54_54 = "ToggleAutoSkullGuitar"
L55_55 = {}
L56_56 = "Skull Guitar"
L55_55.Title = L56_56
L56_56 = "Description"
L57_57 = ""
L55_55[L56_56] = L57_57
L56_56 = "Default"
L57_57 = false
L55_55[L56_56] = L57_57
L52_52 = L52_52(L53_53, L54_54, L55_55)
L55_55 = "OnChanged"
L54_54 = L52_52
L53_53 = L52_52[L55_55]
function L55_55(A0_384)
  _G.Auto_SkullGuitar = A0_384
end
L53_53(L54_54, L55_55)
L53_53 = "ToggleAutoSkullGuitar"
L53_53 = L3_3[L53_53]
L55_55 = "SetValue"
L54_54 = L53_53
L53_53 = L53_53[L55_55]
L55_55 = false
L53_53(L54_54, L55_55)
L53_53 = spawn
function L54_54()
  while wait() do
    pcall(function()
      local L0_385
      if L0_385 then
        if L0_385 == false then
          if L0_385 <= 5000 then
            if L0_385 then
              L0_385(L0_385, "soulGuitarBuy", true)
            elseif L0_385 == 0 then
              if L0_385 == 0 then
                Quest2 = L0_385
                repeat
                  L0_385()
                  L0_385(CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875))
                until not L0_385
                L0_385(1)
                L0_385(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
                L0_385(1)
                L0_385(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
                L0_385(1)
                L0_385(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
                L0_385(1)
                L0_385(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
                L0_385(1)
                L0_385(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
                L0_385(1)
                L0_385(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
                L0_385(1)
                L0_385(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
                L0_385(1)
              elseif L0_385 then
                if L0_385 then
                  Quest4 = L0_385
                  repeat
                    L0_385()
                    L0_385(CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625))
                  until not L0_385
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                  L0_385(1)
                  L0_385(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                else
                  Quest3 = L0_385
                end
              else
                if L0_385 then
                  L0_385[1] = "GuitarPuzzleProgress"
                  L0_385[2] = "Ghost"
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_385))
                end
                if L0_385 then
                  for _FORV_3_, _FORV_4_ in L0_385(game.Workspace.Enemies:GetChildren()) do
                    if _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_:FindFirstChild("Humanoid") and 0 < _FORV_4_.Humanoid.Health and _FORV_4_.Name == "Living Zombie" then
                      EquipTool(SelectWeapon)
                      _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      _FORV_4_.HumanoidRootPart.Transparency = 1
                      _FORV_4_.Humanoid.JumpPower = 0
                      _FORV_4_.Humanoid.WalkSpeed = 0
                      _FORV_4_.HumanoidRootPart.CanCollide = false
                      _FORV_4_.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                      Tween(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
                      game:GetService("VirtualUser"):CaptureController()
                      game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    end
                  end
                else
                  L0_385(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
                end
              end
            elseif L0_385 then
              L0_385(CFrame.new(-8653.2060546875, 140.98487854003906, 6160.033203125))
            elseif L0_385 then
              L0_385("Wait Full Moon")
            else
              L0_385(L0_385, "gravestoneEvent", 2, true)
            end
          else
            L0_385(CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125))
          end
        end
      end
    end)
  end
end
L53_53(L54_54)
L53_53 = L2_2.Item
L55_55 = "AddToggle"
L54_54 = L53_53
L53_53 = L53_53[L55_55]
L55_55 = "ToggleAutoBuddy"
L56_56 = {}
L57_57 = "Ki\225\186\191m Buddy"
L56_56.Title = L57_57
L57_57 = "Description"
L58_58 = ""
L56_56[L57_57] = L58_58
L57_57 = "Default"
L58_58 = false
L56_56[L57_57] = L58_58
L53_53 = L53_53(L54_54, L55_55, L56_56)
L56_56 = "OnChanged"
L55_55 = L53_53
L54_54 = L53_53[L56_56]
function L56_56(A0_386)
  _G.Auto_Buddy = A0_386
end
L54_54(L55_55, L56_56)
L54_54 = "ToggleAutoBuddy"
L54_54 = L3_3[L54_54]
L56_56 = "SetValue"
L55_55 = L54_54
L54_54 = L54_54[L56_56]
L56_56 = false
L54_54(L55_55, L56_56)
L54_54 = CFrame
L54_54 = L54_54.new
L55_55 = -731.2034301757812
L56_56 = 381.5658874511719
L57_57 = -11198.4951171875
L54_54 = L54_54(L55_55, L56_56, L57_57)
L55_55 = spawn
function L56_56()
  while wait() do
    if _G.Auto_Buddy then
      pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_.Name == "Cake Queen" and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 then
              repeat
                task.wait(_G.Fast_Delay)
                AutoHaki()
                EquipTool(SelectWeapon)
                _FORV_4_.HumanoidRootPart.CanCollide = false
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                AttackNoCoolDown()
              until not _G.Auto_Buddy or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
            end
          end
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _UPVALUE0_.Position).Magnitude < 1500 then
          Tween(_UPVALUE0_)
        end
        Tween(CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875))
        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end
L55_55(L56_56)
L55_55 = L2_2.Item
L57_57 = "AddToggle"
L56_56 = L55_55
L55_55 = L55_55[L57_57]
L57_57 = "ToggleAutoDualKatana"
L58_58 = {}
L59_59 = "Song Ki\225\186\191m Nguy\225\187\129n R\225\187\167a"
L58_58.Title = L59_59
L59_59 = "Description"
L60_60 = ""
L58_58[L59_59] = L60_60
L59_59 = "Default"
L60_60 = false
L58_58[L59_59] = L60_60
L55_55 = L55_55(L56_56, L57_57, L58_58)
L58_58 = "OnChanged"
L57_57 = L55_55
L56_56 = L55_55[L58_58]
function L58_58(A0_387)
  _G.Auto_DualKatana = A0_387
end
L56_56(L57_57, L58_58)
L56_56 = "ToggleAutoDualKatana"
L56_56 = L3_3[L56_56]
L58_58 = "SetValue"
L57_57 = L56_56
L56_56 = L56_56[L58_58]
L58_58 = false
L56_56(L57_57, L58_58)
L56_56 = spawn
function L57_57()
  while wait() do
    pcall(function()
      if _G.Auto_DualKatana then
        if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
          if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
              EquipTool("Tushita")
            end
          elseif (game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama")) and game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
            EquipTool("Yama")
          end
        else
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", "Tushita")
        end
      end
    end)
  end
end
L56_56(L57_57)
L56_56 = spawn
function L57_57()
  while wait() do
    pcall(function()
      if _G.Auto_DualKatana then
        if GetMaterial("Alucard Fragment") == 0 then
          Auto_Quest_Yama_1 = true
          Auto_Quest_Yama_2 = false
          Auto_Quest_Yama_3 = false
          Auto_Quest_Tushita_1 = false
          Auto_Quest_Tushita_2 = false
          Auto_Quest_Tushita_3 = false
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        elseif GetMaterial("Alucard Fragment") == 1 then
          Auto_Quest_Yama_1 = false
          Auto_Quest_Yama_2 = true
          Auto_Quest_Yama_3 = false
          Auto_Quest_Tushita_1 = false
          Auto_Quest_Tushita_2 = false
          Auto_Quest_Tushita_3 = false
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        elseif GetMaterial("Alucard Fragment") == 2 then
          Auto_Quest_Yama_1 = false
          Auto_Quest_Yama_2 = false
          Auto_Quest_Yama_3 = true
          Auto_Quest_Tushita_1 = false
          Auto_Quest_Tushita_2 = false
          Auto_Quest_Tushita_3 = false
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        elseif GetMaterial("Alucard Fragment") == 3 then
          Auto_Quest_Yama_1 = false
          Auto_Quest_Yama_2 = false
          Auto_Quest_Yama_3 = false
          Auto_Quest_Tushita_1 = true
          Auto_Quest_Tushita_2 = false
          Auto_Quest_Tushita_3 = false
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        elseif GetMaterial("Alucard Fragment") == 4 then
          Auto_Quest_Yama_1 = false
          Auto_Quest_Yama_2 = false
          Auto_Quest_Yama_3 = false
          Auto_Quest_Tushita_1 = false
          Auto_Quest_Tushita_2 = true
          Auto_Quest_Tushita_3 = false
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        elseif GetMaterial("Alucard Fragment") == 5 then
          Auto_Quest_Yama_1 = false
          Auto_Quest_Yama_2 = false
          Auto_Quest_Yama_3 = false
          Auto_Quest_Tushita_1 = false
          Auto_Quest_Tushita_2 = false
          Auto_Quest_Tushita_3 = true
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        elseif GetMaterial("Alucard Fragment") == 6 then
          if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").ReplicatedStorage:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") then
            Auto_Quest_Yama_1 = false
            Auto_Quest_Yama_2 = false
            Auto_Quest_Yama_3 = false
            Auto_Quest_Tushita_1 = false
            Auto_Quest_Tushita_2 = false
            Auto_Quest_Tushita_3 = false
            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") then
              for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if (_FORV_4_.Name == "Cursed Skeleton Boss" or _FORV_4_.Name == "Cursed Skeleton") and 0 < _FORV_4_.Humanoid.Health then
                  EquipTool(Sword)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * pos)
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  _FORV_4_.HumanoidRootPart.Transparency = 1
                  _FORV_4_.Humanoid.JumpPower = 0
                  _FORV_4_.Humanoid.WalkSpeed = 0
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  bringmob = true
                  FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                  MonFarm = _FORV_4_.Name
                  AttackNoCoolDown()
                end
              end
            end
          elseif (CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
            wait(1)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
            wait(1)
            Tween(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
            wait(1.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            wait(1.5)
            Tween(CFrame.new(-12253.5419921875, 598.8999633789062, -6546.8388671875))
          else
            Tween(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
          end
        end
      end
    end)
  end
end
L56_56(L57_57)
L56_56 = spawn
function L57_57()
  while wait() do
    if Auto_Quest_Yama_1 then
      pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _FORV_4_.Name == "Mythological Pirate" then
              repeat
                wait()
                Tween(_FORV_4_.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2))
              until _G.Auto_DualKatana == false or Auto_Quest_Yama_1 == false
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
            end
          end
        else
          Tween(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
        end
      end)
    end
  end
end
L56_56(L57_57)
L56_56 = spawn
function L57_57()
  while wait() do
    pcall(function()
      if Auto_Quest_Yama_2 then
        for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
          if _FORV_4_:FindFirstChild("HazeESP") then
            _FORV_4_.HazeESP.Size = UDim2.new(50, 50, 50, 50)
            _FORV_4_.HazeESP.MaxDistance = "inf"
          end
        end
        for _FORV_3_, _FORV_4_ in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
          if _FORV_4_:FindFirstChild("HazeESP") then
            _FORV_4_.HazeESP.Size = UDim2.new(50, 50, 50, 50)
            _FORV_4_.HazeESP.MaxDistance = "inf"
          end
        end
      end
    end)
  end
end
L56_56(L57_57)
L56_56 = spawn
function L57_57()
  while wait() do
    pcall(function()
      local L0_388
      for _FORV_3_, _FORV_4_ in L0_388(game:GetService("Workspace").Enemies:GetChildren()) do
        if Auto_Quest_Yama_2 and _FORV_4_:FindFirstChild("HazeESP") and (_FORV_4_.HumanoidRootPart.Position - FarmPossEsp.Position).magnitude <= 300 then
          _FORV_4_.HumanoidRootPart.CFrame = FarmPossEsp
          _FORV_4_.HumanoidRootPart.CanCollide = false
          _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
          if not _FORV_4_.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Instance.new("BodyVelocity", _FORV_4_.HumanoidRootPart).MaxForce = Vector3.new(1, 1, 1) * math.huge
            Instance.new("BodyVelocity", _FORV_4_.HumanoidRootPart).Velocity = Vector3.new(0, 0, 0)
          end
        end
      end
    end)
  end
end
L56_56(L57_57)
L56_56 = spawn
function L57_57()
  while wait() do
    if Auto_Quest_Yama_2 then
      pcall(function()
        local L0_389
        for _FORV_3_, _FORV_4_ in L0_389(game:GetService("Workspace").Enemies:GetChildren()) do
          if _FORV_4_:FindFirstChild("HazeESP") then
            wait()
            if (_FORV_4_.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
              Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
            else
              EquipTool(Sword)
              Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
              _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              _FORV_4_.HumanoidRootPart.Transparency = 1
              _FORV_4_.Humanoid.JumpPower = 0
              _FORV_4_.Humanoid.WalkSpeed = 0
              _FORV_4_.HumanoidRootPart.CanCollide = false
              FarmPos = _FORV_4_.HumanoidRootPart.CFrame
              MonFarm = _FORV_4_.Name
              AttackNoCoolDown()
              if 0 >= _FORV_4_.Humanoid.Health and _FORV_4_.Humanoid:FindFirstChild("Animator") then
                _FORV_4_.Humanoid.Animator:Destroy()
              end
            end
          elseif _G.Auto_DualKatana ~= false and Auto_Quest_Yama_2 ~= false and _FORV_4_.Parent and not (0 >= _FORV_4_.Humanoid.Health) and _FORV_4_:FindFirstChild("HazeESP") then
            for _FORV_8_, _FORV_9_ in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
              if _FORV_9_:FindFirstChild("HazeESP") then
                if (_FORV_9_.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
                  Tween(_FORV_9_.HumanoidRootPart.CFrameMon * Pos)
                else
                  Tween(_FORV_9_.HumanoidRootPart.CFrame * Pos)
                end
              end
            end
          end
        end
      end)
    end
  end
end
L56_56(L57_57)
L56_56 = spawn
function L57_57()
  while wait() do
    if Auto_Quest_Yama_3 then
      pcall(function()
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
          Tween(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
        elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
          wait()
          if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Hell's Messenger [Lv. 2200] [Boss]") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if (_FORV_4_.Name == "Cursed Skeleton" or _FORV_4_.Name == "Cursed Skeleton" or _FORV_4_.Name == "Hell's Messenger") and _FORV_4_.Humanoid.Health > 0 then
                repeat
                  wait()
                  EquipTool(Sword)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  _FORV_4_.HumanoidRootPart.Transparency = 1
                  _FORV_4_.Humanoid.JumpPower = 0
                  _FORV_4_.Humanoid.WalkSpeed = 0
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                  MonFarm = _FORV_4_.Name
                  AttackNoCoolDown()
                  if _FORV_4_.Humanoid.Health <= 0 and _FORV_4_.Humanoid:FindFirstChild("Animator") then
                    _FORV_4_.Humanoid.Animator:Destroy()
                  end
                until _FORV_4_.Humanoid.Health <= 0 or not _FORV_4_.Parent or Auto_Quest_Yama_3 == false
              end
            end
          else
            wait(5)
            Tween(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame)
            wait(1.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            wait(1.5)
            Tweem(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame)
            wait(1.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            wait(1.5)
            Tween(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame)
            wait(1.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            wait(1.5)
            Tween(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
          end
        elseif _G.Auto_DualKatana ~= false and Auto_Quest_Yama_3 ~= false and GetMaterial("Alucard Fragment") ~= 3 then
          if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
            if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
              for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _FORV_4_.Name == "Soul Reaper" and _FORV_4_.Humanoid.Health > 0 then
                  repeat
                    wait()
                    Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  until _G.Auto_DualKatana == false or Auto_Quest_Yama_3 == false or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
                end
              end
            else
              Tween(CFrame.new(-9570.033203125, 315.9346923828125, 6726.89306640625))
            end
          else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
          end
        end
      end)
    end
  end
end
L56_56(L57_57)
L56_56 = spawn
function L57_57()
  while wait() do
    if Auto_Quest_Tushita_1 then
      Tween(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
      wait(5)
      Tween(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
      wait(5)
      Tween(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875))
    end
  end
end
L56_56(L57_57)
L56_56 = spawn
function L57_57()
  while wait() do
    if Auto_Quest_Tushita_2 then
      pcall(function()
        if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if Auto_Quest_Tushita_2 and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_.Humanoid.Health > 0 and (_FORV_4_.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
              repeat
                wait()
                EquipTool(Sword)
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                _FORV_4_.HumanoidRootPart.Transparency = 1
                _FORV_4_.Humanoid.JumpPower = 0
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.CanCollide = false
                FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                MonFarm = _FORV_4_.Name
                AttackNoCoolDown()
                if _FORV_4_.Humanoid.Health <= 0 and _FORV_4_.Humanoid:FindFirstChild("Animator") then
                  _FORV_4_.Humanoid.Animator:Destroy()
                end
              until _FORV_4_.Humanoid.Health <= 0 or not _FORV_4_.Parent or Auto_Quest_Tushita_2 == false
            end
          end
        else
          Tween(CFrame.new(-5545.1240234375, 313.800537109375, -2976.616455078125))
        end
      end)
    end
  end
end
L56_56(L57_57)
L56_56 = spawn
function L57_57()
  while wait() do
    if Auto_Quest_Tushita_3 then
      pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") or game.ReplicatedStorage:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
          if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _FORV_4_.Name == "Cake Queen" and _FORV_4_.Humanoid.Health > 0 then
                repeat
                  wait()
                  EquipTool(Sword)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  _FORV_4_.HumanoidRootPart.Transparency = 1
                  _FORV_4_.Humanoid.JumpPower = 0
                  _FORV_4_.Humanoid.WalkSpeed = 0
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                  MonFarm = _FORV_4_.Name
                  AttackNoCoolDown()
                  if _FORV_4_.Humanoid.Health <= 0 and _FORV_4_.Humanoid:FindFirstChild("Animator") then
                    _FORV_4_.Humanoid.Animator:Destroy()
                  end
                until _G.Auto_DualKatana == false or Auto_Quest_Tushita_3 == false or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension")
              end
            end
          else
            Tween(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
          end
        elseif game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
          repeat
            wait()
            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven's Guardian [Lv. 2200] [Boss]") then
              for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if (_FORV_4_.Name == "Cursed Skeleton" or _FORV_4_.Name == "Cursed Skeleton" or _FORV_4_.Name == "Heaven's Guardian") and _FORV_4_.Humanoid.Health > 0 then
                  repeat
                    wait()
                    EquipTool(Sword)
                    Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                    _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    _FORV_4_.HumanoidRootPart.Transparency = 1
                    _FORV_4_.Humanoid.JumpPower = 0
                    _FORV_4_.Humanoid.WalkSpeed = 0
                    _FORV_4_.HumanoidRootPart.CanCollide = false
                    FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                    MonFarm = _FORV_4_.Name
                    AttackNoCoolDown()
                    if _FORV_4_.Humanoid.Health <= 0 and _FORV_4_.Humanoid:FindFirstChild("Animator") then
                      _FORV_4_.Humanoid.Animator:Destroy()
                    end
                  until _FORV_4_.Humanoid.Health <= 0 or not _FORV_4_.Parent or Auto_Quest_Tushita_3 == false
                end
              end
            else
              wait(5)
              Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame)
              wait(1.5)
              game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
              wait(1.5)
              Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame)
              wait(1.5)
              game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
              wait(1.5)
              Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame)
              wait(1.5)
              game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
              wait(1.5)
              Tween(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
            end
          until not _G.Auto_DualKatana or not Auto_Quest_Tushita_3 or GetMaterial("Alucard Fragment") == 6
        end
      end)
    end
  end
end
L56_56(L57_57)
L56_56 = Sea2
if L56_56 then
  L56_56 = L2_2.Item
  L58_58 = "AddToggle"
  L57_57 = L56_56
  L56_56 = L56_56[L58_58]
  L58_58 = "ToggleFactory"
  L59_59 = {}
  L60_60 = "\239\191\189\195\161nh Nh\195\160 M\195\161y"
  L59_59.Title = L60_60
  L60_60 = "Description"
  L61_61 = ""
  L59_59[L60_60] = L61_61
  L60_60 = "Default"
  L61_61 = false
  L59_59[L60_60] = L61_61
  L56_56 = L56_56(L57_57, L58_58, L59_59)
  L59_59 = "OnChanged"
  L58_58 = L56_56
  L57_57 = L56_56[L59_59]
  function L59_59(A0_390)
    _G.Factory = A0_390
  end
  L57_57(L58_58, L59_59)
  L57_57 = "ToggleFactory"
  L57_57 = L3_3[L57_57]
  L59_59 = "SetValue"
  L58_58 = L57_57
  L57_57 = L57_57[L59_59]
  L59_59 = false
  L57_57(L58_58, L59_59)
  L57_57 = spawn
  function L58_58()
    while wait() do
      if _G.Factory then
        if game.Workspace.Enemies:FindFirstChild("Core") then
          for _FORV_3_, _FORV_4_ in pairs(game.Workspace.Enemies:GetChildren()) do
            if _FORV_4_.Name == "Core" and _FORV_4_.Humanoid.Health > 0 then
              repeat
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                repeat
                  Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                  wait()
                until not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
                EquipTool(SelectWeapon)
                AutoHaki()
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                _FORV_4_.HumanoidRootPart.Transparency = 1
                _FORV_4_.Humanoid.JumpPower = 0
                _FORV_4_.Humanoid.WalkSpeed = 0
                _FORV_4_.HumanoidRootPart.CanCollide = false
                FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                MonFarm = _FORV_4_.Name
              until not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0 or _G.Factory == false
            end
          end
        elseif game.ReplicatedStorage:FindFirstChild("Core") then
          repeat
            Tween(CFrame.new(448.46756, 199.356781, -441.389252))
            wait()
          until not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
        end
      end
    end
  end
  L57_57(L58_58)
end
L56_56 = L2_2.Item
L58_58 = "AddToggle"
L57_57 = L56_56
L56_56 = L56_56[L58_58]
L58_58 = "ToggleAutoFarmSwan"
L59_59 = {}
L60_60 = "\239\191\189\195\161nh Swan"
L59_59.Title = L60_60
L60_60 = "Description"
L61_61 = ""
L59_59[L60_60] = L61_61
L60_60 = "Default"
L61_61 = false
L59_59[L60_60] = L61_61
L56_56 = L56_56(L57_57, L58_58, L59_59)
L59_59 = "OnChanged"
L58_58 = L56_56
L57_57 = L56_56[L59_59]
function L59_59(A0_391)
  _G.Auto_FarmSwan = A0_391
end
L57_57(L58_58, L59_59)
L57_57 = "ToggleAutoFarmSwan"
L57_57 = L3_3[L57_57]
L59_59 = "SetValue"
L58_58 = L57_57
L57_57 = L57_57[L59_59]
L59_59 = false
L57_57(L58_58, L59_59)
L57_57 = spawn
function L58_58()
  pcall(function()
    local L0_392
    repeat
      repeat
        while true do
          if L0_392 then
            if L0_392 then
              if L0_392 then
                for _FORV_3_, _FORV_4_ in L0_392(game:GetService("Workspace").Enemies:GetChildren()) do
                  if _FORV_4_.Name == "Don Swan" and _FORV_4_.Humanoid.Health > 0 and _FORV_4_:IsA("Model") and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") then
                    repeat
                      task.wait()
                      pcall(function()
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        _UPVALUE0_.HumanoidRootPart.CanCollide = false
                        _UPVALUE0_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        Tween(_UPVALUE0_.HumanoidRootPart.CFrame * Pos)
                        AttackNoCoolDown()
                      end)
                    until _G.AutoFarmSwan == false or _FORV_4_.Humanoid.Health <= 0
                  end
                end
              end
            end
            L0_392()
            L0_392(L0_392, "requestEntrance", Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
          end
        end
      until not (L0_392 <= 4)
    until L0_392 ~= false
  end)
end
L57_57(L58_58)
L57_57 = L2_2.Item
L59_59 = "AddToggle"
L58_58 = L57_57
L57_57 = L57_57[L59_59]
L59_59 = "ToggleAutoRengoku"
L60_60 = {}
L61_61 = "Rengoku"
L60_60.Title = L61_61
L61_61 = "Description"
L62_62 = ""
L60_60[L61_61] = L62_62
L61_61 = "Default"
L62_62 = false
L60_60[L61_61] = L62_62
L57_57 = L57_57(L58_58, L59_59, L60_60)
L60_60 = "OnChanged"
L59_59 = L57_57
L58_58 = L57_57[L60_60]
function L60_60(A0_393)
  _G.Auto_Regoku = A0_393
end
L58_58(L59_59, L60_60)
L58_58 = "ToggleAutoRengoku"
L58_58 = L3_3[L58_58]
L60_60 = "SetValue"
L59_59 = L58_58
L58_58 = L58_58[L60_60]
L60_60 = false
L58_58(L59_59, L60_60)
L58_58 = spawn
function L59_59()
  pcall(function()
    while wait() do
      if _G.Auto_Regoku then
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
          EquipTool("Hidden Key")
          Tween(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
        elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") then
          for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if (_FORV_4_.Name == "Snow Lurker" or _FORV_4_.Name == "Arctic Warrior") and _FORV_4_.Humanoid.Health > 0 then
              repeat
                task.wait(_G.Fast_Delay)
                EquipTool(SelectWeapon)
                AutoHaki()
                _FORV_4_.HumanoidRootPart.CanCollide = false
                _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                MonFarm = _FORV_4_.Name
                Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                AttackNoCoolDown()
                bringmob = true
              until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.Auto_Regoku == false or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
              bringmob = false
            end
          end
        else
          bringmob = false
          Tween(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
        end
      end
    end
  end)
end
L58_58(L59_59)
L58_58 = Sea2
if not L58_58 then
  L58_58 = Sea3
elseif L58_58 then
  L58_58 = L2_2.Item
  L60_60 = "AddToggle"
  L59_59 = L58_58
  L58_58 = L58_58[L60_60]
  L60_60 = "ToggleHakiColor"
  L61_61 = {}
  L62_62 = "Mua M\195\160u Haki"
  L61_61.Title = L62_62
  L62_62 = "Description"
  L63_63 = ""
  L61_61[L62_62] = L63_63
  L62_62 = "Default"
  L63_63 = false
  L61_61[L62_62] = L63_63
  L58_58 = L58_58(L59_59, L60_60, L61_61)
  L61_61 = "OnChanged"
  L60_60 = L58_58
  L59_59 = L58_58[L61_61]
  function L61_61(A0_394)
    _G.Auto_Buy_Enchancement = A0_394
  end
  L59_59(L60_60, L61_61)
  L59_59 = "ToggleHakiColor"
  L59_59 = L3_3[L59_59]
  L61_61 = "SetValue"
  L60_60 = L59_59
  L59_59 = L59_59[L61_61]
  L61_61 = false
  L59_59(L60_60, L61_61)
  L59_59 = spawn
  function L60_60()
    local L0_395
    while true do
      L0_395 = wait
      L0_395 = L0_395()
      if L0_395 then
        L0_395 = _G
        L0_395 = L0_395.Auto_Buy_Enchancement
        if L0_395 then
          L0_395 = {}
          L0_395[1] = "ColorsDealer"
          L0_395[2] = "2"
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_395))
        end
      end
    end
  end
  L59_59(L60_60)
end
L58_58 = Sea2
if L58_58 then
  L58_58 = L2_2.Main
  L60_60 = "AddToggle"
  L59_59 = L58_58
  L58_58 = L58_58[L60_60]
  L60_60 = "ToggleSwordLengend"
  L61_61 = {}
  L62_62 = "Mua Ki\225\186\191m Huy\225\187\129n Tho\225\186\161i"
  L61_61.Title = L62_62
  L62_62 = "Description"
  L63_63 = ""
  L61_61[L62_62] = L63_63
  L62_62 = "Default"
  L63_63 = false
  L61_61[L62_62] = L63_63
  L58_58 = L58_58(L59_59, L60_60, L61_61)
  L61_61 = "OnChanged"
  L60_60 = L58_58
  L59_59 = L58_58[L61_61]
  function L61_61(A0_396)
    _G.BuyLengendSword = A0_396
  end
  L59_59(L60_60, L61_61)
  L59_59 = "ToggleSwordLengend"
  L59_59 = L3_3[L59_59]
  L61_61 = "SetValue"
  L60_60 = L59_59
  L59_59 = L59_59[L61_61]
  L61_61 = false
  L59_59(L60_60, L61_61)
  L59_59 = spawn
  function L60_60()
    while wait() do
      pcall(function()
        local L0_397
        L0_397 = _G
        L0_397 = L0_397.BuyLengendSword
        if not L0_397 then
          L0_397 = Triple_A
        else
          if L0_397 then
            L0_397 = {}
            L0_397[1] = "LegendarySwordDealer"
            L0_397[2] = "2"
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_397))
        end
        else
          L0_397 = wait
          L0_397()
        end
      end)
    end
  end
  L59_59(L60_60)
end
L58_58 = Sea2
if L58_58 then
  L58_58 = L2_2.Main
  L60_60 = "AddToggle"
  L59_59 = L58_58
  L58_58 = L58_58[L60_60]
  L60_60 = "ToggleEvoRace"
  L61_61 = {}
  L62_62 = "N\195\162ng T\225\187\153c V2"
  L61_61.Title = L62_62
  L62_62 = "Description"
  L63_63 = ""
  L61_61[L62_62] = L63_63
  L62_62 = "Default"
  L63_63 = false
  L61_61[L62_62] = L63_63
  L58_58 = L58_58(L59_59, L60_60, L61_61)
  L61_61 = "OnChanged"
  L60_60 = L58_58
  L59_59 = L58_58[L61_61]
  function L61_61(A0_398)
    _G.AutoEvoRace = A0_398
  end
  L59_59(L60_60, L61_61)
  L59_59 = "ToggleEvoRace"
  L59_59 = L3_3[L59_59]
  L61_61 = "SetValue"
  L60_60 = L59_59
  L59_59 = L59_59[L61_61]
  L61_61 = false
  L59_59(L60_60, L61_61)
  L59_59 = spawn
  function L60_60()
    pcall(function()
      while wait(0.1) do
        if _G.AutoEvoRace and not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
          if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
            Tween(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104E-8, -0.68292886, 3.59963224E-8, 1, 5.50667032E-8, 0.68292886, 1.56424669E-8, -0.730484903))
            if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
              wait(1.3)
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
            end
          elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
            pcall(function()
              if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                Tween(game:GetService("Workspace").Flower1.CFrame)
              elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                Tween(game:GetService("Workspace").Flower2.CFrame)
              elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                  for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _FORV_4_.Name == "Zombie" then
                      repeat
                        task.wait(_G.Fast_Delay)
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                        _FORV_4_.HumanoidRootPart.CanCollide = false
                        _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        AttackNoCoolDown()
                        FarmPos = _FORV_4_.HumanoidRootPart.CFrame
                        MonFarm = _FORV_4_.Name
                        bringmob = true
                      until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0 or _G.AutoEvoRace == false
                      bringmob = false
                    end
                  end
                else
                  Tween(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                end
              end
            end)
          elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
          end
        end
      end
    end)
  end
  L59_59(L60_60)
end
L58_58 = L2_2.Setting
L60_60 = "AddToggle"
L59_59 = L58_58
L58_58 = L58_58[L60_60]
L60_60 = "ToggleAutoT"
L61_61 = {}
L62_62 = "B\225\186\173t T\225\187\153c V3"
L61_61.Title = L62_62
L62_62 = "Description"
L63_63 = ""
L61_61[L62_62] = L63_63
L62_62 = "Default"
L63_63 = false
L61_61[L62_62] = L63_63
L58_58 = L58_58(L59_59, L60_60, L61_61)
L61_61 = "OnChanged"
L60_60 = L58_58
L59_59 = L58_58[L61_61]
function L61_61(A0_399)
  _G.AutoT = A0_399
end
L59_59(L60_60, L61_61)
L59_59 = "ToggleAutoT"
L59_59 = L3_3[L59_59]
L61_61 = "SetValue"
L60_60 = L59_59
L59_59 = L59_59[L61_61]
L61_61 = false
L59_59(L60_60, L61_61)
L59_59 = spawn
function L60_60()
  while wait() do
    pcall(function()
      if _G.AutoT then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
      end
    end)
  end
end
L59_59(L60_60)
L59_59 = L2_2.Setting
L61_61 = "AddToggle"
L60_60 = L59_59
L59_59 = L59_59[L61_61]
L61_61 = "ToggleAutoY"
L62_62 = {}
L63_63 = "B\225\186\173t T\225\187\153c V4"
L62_62.Title = L63_63
L63_63 = "Description"
L64_64 = ""
L62_62[L63_63] = L64_64
L63_63 = "Default"
L64_64 = false
L62_62[L63_63] = L64_64
L59_59 = L59_59(L60_60, L61_61, L62_62)
L62_62 = "OnChanged"
L61_61 = L59_59
L60_60 = L59_59[L62_62]
function L62_62(A0_400)
  _G.AutoY = A0_400
end
L60_60(L61_61, L62_62)
L60_60 = "ToggleAutoY"
L60_60 = L3_3[L60_60]
L62_62 = "SetValue"
L61_61 = L60_60
L60_60 = L60_60[L62_62]
L62_62 = false
L60_60(L61_61, L62_62)
L60_60 = spawn
function L61_61()
  while wait() do
    pcall(function()
      if _G.AutoY then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
        wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
      end
    end)
  end
end
L60_60(L61_61)
L60_60 = L2_2.Setting
L62_62 = "AddToggle"
L61_61 = L60_60
L60_60 = L60_60[L62_62]
L62_62 = "ToggleAutoKen"
L63_63 = {}
L64_64 = "B\225\186\173t Haki Quan S\195\161t"
L63_63.Title = L64_64
L64_64 = "Description"
L65_65 = ""
L63_63[L64_64] = L65_65
L64_64 = "Default"
L65_65 = false
L63_63[L64_64] = L65_65
L60_60 = L60_60(L61_61, L62_62, L63_63)
L63_63 = "OnChanged"
L62_62 = L60_60
L61_61 = L60_60[L63_63]
function L63_63(A0_401)
  _G.AutoKen = A0_401
  if A0_401 then
    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
  else
    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", false)
  end
end
L61_61(L62_62, L63_63)
L61_61 = "ToggleAutoKen"
L61_61 = L3_3[L61_61]
L63_63 = "SetValue"
L62_62 = L61_61
L61_61 = L61_61[L63_63]
L63_63 = false
L61_61(L62_62, L63_63)
L61_61 = spawn
function L62_62()
  while wait() do
    pcall(function()
      if _G.AutoKen then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
      end
    end)
  end
end
L61_61(L62_62)
L61_61 = L2_2.Setting
L63_63 = "AddToggle"
L62_62 = L61_61
L61_61 = L61_61[L63_63]
L63_63 = "ToggleSaveSpawn"
L64_64 = {}
L65_65 = "L\198\176u \196\144i\225\187\131m H\225\187\147i Sinh"
L64_64.Title = L65_65
L65_65 = "Description"
L66_66 = ""
L64_64[L65_65] = L66_66
L65_65 = "Default"
L66_66 = false
L64_64[L65_65] = L66_66
L61_61 = L61_61(L62_62, L63_63, L64_64)
L64_64 = "OnChanged"
L63_63 = L61_61
L62_62 = L61_61[L64_64]
function L64_64(A0_402)
  local L1_403
  L1_403 = _G
  L1_403.SaveSpawn = A0_402
  if A0_402 then
    L1_403 = {}
    L1_403[1] = "SetSpawnPoint"
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L1_403))
  end
end
L62_62(L63_63, L64_64)
L62_62 = "ToggleSaveSpawn"
L62_62 = L3_3[L62_62]
L64_64 = "SetValue"
L63_63 = L62_62
L62_62 = L62_62[L64_64]
L64_64 = false
L62_62(L63_63, L64_64)
L62_62 = spawn
function L63_63()
  while wait() do
    pcall(function()
      local L0_404
      L0_404 = _G
      L0_404 = L0_404.SaveSpawn
      if L0_404 then
        L0_404 = {}
        L0_404[1] = "SetSpawnPoint"
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_404))
      end
    end)
  end
end
L62_62(L63_63)
L62_62 = L2_2.Setting
L64_64 = "AddButton"
L63_63 = L62_62
L62_62 = L62_62[L64_64]
L64_64 = {}
L65_65 = "Fps Boost"
L64_64.Title = L65_65
L65_65 = "Description"
L66_66 = ""
L64_64[L65_65] = L66_66
L65_65 = "Callback"
function L66_66()
  local L1_405, L3_406, L4_407
  L1_405 = false
  L3_406 = game
  L4_407 = L3_406.Workspace
  L4_407.Terrain.WaterWaveSize = 0
  L4_407.Terrain.WaterWaveSpeed = 0
  L4_407.Terrain.WaterReflectance = 0
  L4_407.Terrain.WaterTransparency = 0
  L3_406.Lighting.GlobalShadows = false
  L3_406.Lighting.FogEnd = 9000000000
  L3_406.Lighting.Brightness = 0
  settings().Rendering.QualityLevel = "Level01"
  for _FORV_8_, _FORV_9_ in pairs(L3_406:GetDescendants()) do
    if _FORV_9_:IsA("Part") or _FORV_9_:IsA("Union") or _FORV_9_:IsA("CornerWedgePart") or _FORV_9_:IsA("TrussPart") then
      _FORV_9_.Material = "Plastic"
      _FORV_9_.Reflectance = 0
    elseif _FORV_9_:IsA("Decal") or _FORV_9_:IsA("Texture") and L1_405 then
      _FORV_9_.Transparency = 1
    elseif _FORV_9_:IsA("ParticleEmitter") or _FORV_9_:IsA("Trail") then
      _FORV_9_.Lifetime = NumberRange.new(0)
    elseif _FORV_9_:IsA("Explosion") then
      _FORV_9_.BlastPressure = 1
      _FORV_9_.BlastRadius = 1
    elseif _FORV_9_:IsA("Fire") or _FORV_9_:IsA("SpotLight") or _FORV_9_:IsA("Smoke") or _FORV_9_:IsA("Sparkles") then
      _FORV_9_.Enabled = false
    elseif _FORV_9_:IsA("MeshPart") then
      _FORV_9_.Material = "Plastic"
      _FORV_9_.Reflectance = 0
      _FORV_9_.TextureID = 10385902758728956
    end
  end
  for _FORV_8_, _FORV_9_ in pairs(L3_406.Lighting:GetChildren()) do
    if _FORV_9_:IsA("BlurEffect") or _FORV_9_:IsA("SunRaysEffect") or _FORV_9_:IsA("ColorCorrectionEffect") or _FORV_9_:IsA("BloomEffect") or _FORV_9_:IsA("DepthOfFieldEffect") then
      _FORV_9_.Enabled = false
    end
  end
end
L64_64[L65_65] = L66_66
L62_62(L63_63, L64_64)
L62_62 = L2_2.Setting
L64_64 = "AddToggle"
L63_63 = L62_62
L62_62 = L62_62[L64_64]
L64_64 = "ToggleBringMob"
L65_65 = {}
L66_66 = "Gom Qu\195\161i"
L65_65.Title = L66_66
L66_66 = "Description"
L67_67 = ""
L65_65[L66_66] = L67_67
L66_66 = "Default"
L67_67 = true
L65_65[L66_66] = L67_67
L62_62 = L62_62(L63_63, L64_64, L65_65)
L65_65 = "OnChanged"
L64_64 = L62_62
L63_63 = L62_62[L65_65]
function L65_65(A0_408)
  _G.BringMob = A0_408
end
L63_63(L64_64, L65_65)
L63_63 = "ToggleBringMob"
L63_63 = L3_3[L63_63]
L65_65 = "SetValue"
L64_64 = L63_63
L63_63 = L63_63[L65_65]
L65_65 = true
L63_63(L64_64, L65_65)
L63_63 = spawn
function L64_64()
  while wait() do
    pcall(function()
      local L0_409
      for _FORV_3_, _FORV_4_ in L0_409(game:GetService("Workspace").Enemies:GetChildren()) do
        if _G.BringMob and bringmob and _FORV_4_.Name == MonFarm and _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_.Humanoid.Health > 0 then
          if _FORV_4_.Name == "Factory Staff" then
            if (_FORV_4_.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000 then
              _FORV_4_.Head.CanCollide = false
              _FORV_4_.HumanoidRootPart.CanCollide = false
              _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              _FORV_4_.HumanoidRootPart.CFrame = FarmPos
              if _FORV_4_.Humanoid:FindFirstChild("Animator") then
                _FORV_4_.Humanoid.Animator:Destroy()
              end
              sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            end
          elseif _FORV_4_.Name == MonFarm and (_FORV_4_.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000 then
            _FORV_4_.HumanoidRootPart.CFrame = FarmPos
            _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
            _FORV_4_.HumanoidRootPart.Transparency = 1
            _FORV_4_.Humanoid.JumpPower = 0
            _FORV_4_.Humanoid.WalkSpeed = 0
            if _FORV_4_.Humanoid:FindFirstChild("Animator") then
              _FORV_4_.Humanoid.Animator:Destroy()
            end
            _FORV_4_.HumanoidRootPart.CanCollide = false
            _FORV_4_.Head.CanCollide = false
            _FORV_4_.Humanoid:ChangeState(11)
            _FORV_4_.Humanoid:ChangeState(14)
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
          end
        end
      end
    end)
  end
end
L63_63(L64_64)
L63_63 = L2_2.Setting
L65_65 = "AddToggle"
L64_64 = L63_63
L63_63 = L63_63[L65_65]
L65_65 = "ToggleRemoveNotify"
L66_66 = {}
L67_67 = "T\225\186\175t Th\195\180ng B\195\161o"
L66_66.Title = L67_67
L67_67 = "Description"
L68_68 = ""
L66_66[L67_67] = L68_68
L67_67 = "Default"
L68_68 = false
L66_66[L67_67] = L68_68
L63_63 = L63_63(L64_64, L65_65, L66_66)
L66_66 = "OnChanged"
L65_65 = L63_63
L64_64 = L63_63[L66_66]
function L66_66(A0_410)
  RemoveNotify = A0_410
end
L64_64(L65_65, L66_66)
L64_64 = "ToggleRemoveNotify"
L64_64 = L3_3[L64_64]
L66_66 = "SetValue"
L65_65 = L64_64
L64_64 = L64_64[L66_66]
L66_66 = false
L64_64(L65_65, L66_66)
L64_64 = spawn
function L65_65()
  while wait() do
    if RemoveNotify then
      game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
    else
      game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
    end
  end
end
L64_64(L65_65)
L64_64 = L2_2.Setting
L66_66 = "AddToggle"
L65_65 = L64_64
L64_64 = L64_64[L66_66]
L66_66 = "ToggleWhite"
L67_67 = {}
L68_68 = "M\195\160n H\195\172nh Tr\225\186\175ng"
L67_67.Title = L68_68
L68_68 = "Description"
L69_69 = ""
L67_67[L68_68] = L69_69
L68_68 = "Default"
L69_69 = false
L67_67[L68_68] = L69_69
L64_64 = L64_64(L65_65, L66_66, L67_67)
L67_67 = "OnChanged"
L66_66 = L64_64
L65_65 = L64_64[L67_67]
function L67_67(A0_411)
  _G.WhiteScreen = A0_411
  if _G.WhiteScreen == true then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
  elseif _G.WhiteScreen == false then
    game:GetService("RunService"):Set3dRenderingEnabled(true)
  end
end
L65_65(L66_66, L67_67)
L65_65 = "ToggleWhite"
L65_65 = L3_3[L65_65]
L67_67 = "SetValue"
L66_66 = L65_65
L65_65 = L65_65[L67_67]
L67_67 = false
L65_65(L66_66, L67_67)
L65_65 = L2_2.Setting
L67_67 = "AddSection"
L66_66 = L65_65
L65_65 = L65_65[L67_67]
L67_67 = "K\196\169 N\196\131ng Th\195\180ng Th\225\186\161o"
L65_65 = L65_65(L66_66, L67_67)
L66_66 = L2_2.Setting
L68_68 = "AddToggle"
L67_67 = L66_66
L66_66 = L66_66[L68_68]
L68_68 = "ToggleZ"
L69_69 = {}
L70_70 = "K\196\169 N\196\131ng Z"
L69_69.Title = L70_70
L70_70 = "Description"
L71_71 = ""
L69_69[L70_70] = L71_71
L70_70 = "Default"
L71_71 = true
L69_69[L70_70] = L71_71
L66_66 = L66_66(L67_67, L68_68, L69_69)
L69_69 = "OnChanged"
L68_68 = L66_66
L67_67 = L66_66[L69_69]
function L69_69(A0_412)
  SkillZ = A0_412
end
L67_67(L68_68, L69_69)
L67_67 = "ToggleZ"
L67_67 = L3_3[L67_67]
L69_69 = "SetValue"
L68_68 = L67_67
L67_67 = L67_67[L69_69]
L69_69 = true
L67_67(L68_68, L69_69)
L67_67 = L2_2.Setting
L69_69 = "AddToggle"
L68_68 = L67_67
L67_67 = L67_67[L69_69]
L69_69 = "ToggleX"
L70_70 = {}
L71_71 = "K\196\169 N\196\131ng X"
L70_70.Title = L71_71
L71_71 = "Description"
L72_72 = ""
L70_70[L71_71] = L72_72
L71_71 = "Default"
L72_72 = true
L70_70[L71_71] = L72_72
L67_67 = L67_67(L68_68, L69_69, L70_70)
L70_70 = "OnChanged"
L69_69 = L67_67
L68_68 = L67_67[L70_70]
function L70_70(A0_413)
  SkillX = A0_413
end
L68_68(L69_69, L70_70)
L68_68 = "ToggleX"
L68_68 = L3_3[L68_68]
L70_70 = "SetValue"
L69_69 = L68_68
L68_68 = L68_68[L70_70]
L70_70 = true
L68_68(L69_69, L70_70)
L68_68 = L2_2.Setting
L70_70 = "AddToggle"
L69_69 = L68_68
L68_68 = L68_68[L70_70]
L70_70 = "ToggleC"
L71_71 = {}
L72_72 = "K\196\169 N\196\131ng C"
L71_71.Title = L72_72
L72_72 = "Description"
L73_73 = ""
L71_71[L72_72] = L73_73
L72_72 = "Default"
L73_73 = true
L71_71[L72_72] = L73_73
L68_68 = L68_68(L69_69, L70_70, L71_71)
L71_71 = "OnChanged"
L70_70 = L68_68
L69_69 = L68_68[L71_71]
function L71_71(A0_414)
  SkillC = A0_414
end
L69_69(L70_70, L71_71)
L69_69 = "ToggleC"
L69_69 = L3_3[L69_69]
L71_71 = "SetValue"
L70_70 = L69_69
L69_69 = L69_69[L71_71]
L71_71 = true
L69_69(L70_70, L71_71)
L69_69 = L2_2.Setting
L71_71 = "AddToggle"
L70_70 = L69_69
L69_69 = L69_69[L71_71]
L71_71 = "ToggleV"
L72_72 = {}
L73_73 = "K\196\169 N\196\131ng V"
L72_72.Title = L73_73
L73_73 = "Description"
L74_74 = ""
L72_72[L73_73] = L74_74
L73_73 = "Default"
L74_74 = true
L72_72[L73_73] = L74_74
L69_69 = L69_69(L70_70, L71_71, L72_72)
L72_72 = "OnChanged"
L71_71 = L69_69
L70_70 = L69_69[L72_72]
function L72_72(A0_415)
  SkillV = A0_415
end
L70_70(L71_71, L72_72)
L70_70 = "ToggleV"
L70_70 = L3_3[L70_70]
L72_72 = "SetValue"
L71_71 = L70_70
L70_70 = L70_70[L72_72]
L72_72 = true
L70_70(L71_71, L72_72)
L70_70 = L2_2.Setting
L72_72 = "AddToggle"
L71_71 = L70_70
L70_70 = L70_70[L72_72]
L72_72 = "ToggleF"
L73_73 = {}
L74_74 = "K\196\169 N\196\131ng F"
L73_73.Title = L74_74
L74_74 = "Description"
L75_75 = ""
L73_73[L74_74] = L75_75
L74_74 = "Default"
L75_75 = false
L73_73[L74_74] = L75_75
L70_70 = L70_70(L71_71, L72_72, L73_73)
L73_73 = "OnChanged"
L72_72 = L70_70
L71_71 = L70_70[L73_73]
function L73_73(A0_416)
  SkillF = A0_416
end
L71_71(L72_72, L73_73)
L71_71 = "ToggleF"
L71_71 = L3_3[L71_71]
L73_73 = "SetValue"
L72_72 = L71_71
L71_71 = L71_71[L73_73]
L73_73 = true
L71_71(L72_72, L73_73)
L71_71 = L2_2.Status
L73_73 = "AddParagraph"
L72_72 = L71_71
L71_71 = L71_71[L73_73]
L73_73 = {}
L74_74 = "Th\195\180ng Tin"
L73_73.Title = L74_74
L74_74 = "Content"
L75_75 = "\239\191\189\239\191\189\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\n"
L76_76 = "T\195\170n : "
L77_77 = game
L77_77 = L77_77.Players
L77_77 = L77_77.LocalPlayer
L78_78 = "DisplayName"
L77_77 = L77_77[L78_78]
L78_78 = " (@"
L79_79 = game
L79_79 = L79_79.Players
L79_79 = L79_79.LocalPlayer
L80_80 = "Name"
L79_79 = L79_79[L80_80]
L80_80 = ")\n"
L81_81 = "C\225\186\165p : "
L82_82 = game
L83_83 = L82_82
L82_82 = L82_82.GetService
L84_84 = "Players"
L82_82 = L82_82(L83_83, L84_84)
L82_82 = L82_82.LocalPlayer
L83_83 = "Data"
L82_82 = L82_82[L83_83]
L83_83 = "Level"
L82_82 = L82_82[L83_83]
L83_83 = "Value"
L82_82 = L82_82[L83_83]
L83_83 = "\n"
L84_84 = "Ti\225\187\129n : "
L88_88 = game
L89_89 = L88_88
L88_88 = L88_88.GetService
L90_90 = "Players"
L88_88 = L88_88(L89_89, L90_90)
L88_88 = L88_88.LocalPlayer
L89_89 = "Data"
L88_88 = L88_88[L89_89]
L89_89 = "Fragments"
L88_88 = L88_88[L89_89]
L89_89 = "Value"
L88_88 = L88_88[L89_89]
L89_89 = "\n"
L90_90 = "Ti\225\187\129n Truy N\195\163 : "
L91_91 = game
L92_92 = L91_91
L91_91 = L91_91.GetService
L93_93 = "Players"
L91_91 = L91_91(L92_92, L93_93)
L91_91 = L91_91.LocalPlayer
L92_92 = "leaderstats"
L91_91 = L91_91[L92_92]
L92_92 = "Bounty/Honor"
L91_91 = L91_91[L92_92]
L92_92 = "Value"
L91_91 = L91_91[L92_92]
L92_92 = "\n"
L93_93 = "M\195\161u: "
L94_94 = game
L94_94 = L94_94.Players
L94_94 = L94_94.LocalPlayer
L95_95 = "Character"
L94_94 = L94_94[L95_95]
L95_95 = "Humanoid"
L94_94 = L94_94[L95_95]
L95_95 = "Health"
L94_94 = L94_94[L95_95]
L95_95 = "/"
L96_96 = game
L96_96 = L96_96.Players
L96_96 = L96_96.LocalPlayer
L96_96 = L96_96.Character
L96_96 = L96_96.Humanoid
L96_96 = L96_96.MaxHealth
L75_75 = L75_75 .. L76_76 .. L77_77 .. L78_78 .. L79_79 .. L80_80 .. L81_81 .. L82_82 .. L83_83 .. L84_84 .. L85_85 .. L86_86 .. L87_87 .. L88_88 .. L89_89 .. L90_90 .. L91_91 .. L92_92 .. L93_93 .. L94_94 .. L95_95 .. L96_96 .. "\n" .. "N\196\131ng L\198\176\225\187\163ng : " .. game.Players.LocalPlayer.Character.Energy.Value .. "/" .. game.Players.LocalPlayer.Character.Energy.MaxValue .. "\n" .. "T\225\187\153c : " .. game:GetService("Players").LocalPlayer.Data.Race.Value .. "\n" .. "Tr\195\161i : " .. game:GetService("Players").LocalPlayer.Data.DevilFruit.Value .. "\n" .. "\239\191\189\239\191\189\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129"
L73_73[L74_74] = L75_75
L71_71 = L71_71(L72_72, L73_73)
L72_72 = L2_2.Status
L74_74 = "AddParagraph"
L73_73 = L72_72
L72_72 = L72_72[L74_74]
L74_74 = {}
L75_75 = "Th\225\187\157i Gian"
L74_74.Title = L75_75
L75_75 = "Content"
L76_76 = ""
L74_74[L75_75] = L76_76
L72_72 = L72_72(L73_73, L74_74)
function L73_73()
  local L0_417, L1_418, L2_419, L3_420, L4_421, L5_422, L6_423, L7_424, L8_425, L9_426
  L0_417 = os
  L0_417 = L0_417.date
  L1_418 = "*t"
  L0_417 = L0_417(L1_418)
  L1_418 = L0_417.hour
  L1_418 = L1_418 % 24
  if L1_418 < 12 then
    L2_419 = "AM"
  else
    L2_419 = L2_419 or "PM"
  end
  L3_420 = string
  L3_420 = L3_420.format
  L4_421 = "%02i:%02i:%02i %s"
  L5_422 = L1_418 - 1
  L5_422 = L5_422 % 12
  L5_422 = L5_422 + 1
  L6_423 = L0_417.min
  L7_424 = L0_417.sec
  L8_425 = L2_419
  L3_420 = L3_420(L4_421, L5_422, L6_423, L7_424, L8_425)
  L4_421 = string
  L4_421 = L4_421.format
  L5_422 = "%02d/%02d/%04d"
  L6_423 = L0_417.day
  L7_424 = L0_417.month
  L8_425 = L0_417.year
  L4_421 = L4_421(L5_422, L6_423, L7_424, L8_425)
  L5_422 = game
  L6_423 = L5_422
  L5_422 = L5_422.GetService
  L7_424 = "LocalizationService"
  L5_422 = L5_422(L6_423, L7_424)
  L6_423 = game
  L7_424 = L6_423
  L6_423 = L6_423.GetService
  L8_425 = "Players"
  L6_423 = L6_423(L7_424, L8_425)
  L7_424 = L6_423.LocalPlayer
  L8_425 = L7_424.Name
  L9_426 = "Unknown"
  if pcall(function()
  end) then
    L9_426 = pcall(function()
    end)
  end
  _UPVALUE0_:SetDesc(L4_421 .. "-" .. L3_420 .. " [ " .. L9_426 .. " ]")
end
L74_74 = spawn
function L75_75()
  while true do
    _UPVALUE0_()
    game:GetService("RunService").RenderStepped:Wait()
  end
end
L74_74(L75_75)
L74_74 = L2_2.Status
L76_76 = "AddParagraph"
L75_75 = L74_74
L74_74 = L74_74[L76_76]
L76_76 = {}
L77_77 = "Th\225\187\157i Gian D\195\185ng Script"
L76_76.Title = L77_77
L77_77 = "Content"
L78_78 = ""
L76_76[L77_77] = L78_78
L74_74 = L74_74(L75_75, L76_76)
function L75_75()
  local L0_427, L1_428, L2_429, L3_430
  L0_427 = math
  L0_427 = L0_427.floor
  L1_428 = workspace
  L1_428 = L1_428.DistributedGameTime
  L1_428 = L1_428 + 0.5
  L0_427 = L0_427(L1_428)
  L1_428 = math
  L1_428 = L1_428.floor
  L2_429 = L0_427 / 3600
  L1_428 = L1_428(L2_429)
  L1_428 = L1_428 % 24
  L2_429 = math
  L2_429 = L2_429.floor
  L3_430 = L0_427 / 60
  L2_429 = L2_429(L3_430)
  L2_429 = L2_429 % 60
  L3_430 = L0_427 % 60
  _UPVALUE0_:SetDesc(string.format("%02d Ti\225\186\191ng-%02d Ph\195\186t-%02d Gi\195\162y", L1_428, L2_429, L3_430))
end
L76_76 = spawn
function L77_77()
  while task.wait() do
    pcall(_UPVALUE0_)
  end
end
L76_76(L77_77)
L76_76 = L2_2.Status
L78_78 = "AddParagraph"
L77_77 = L76_76
L76_76 = L76_76[L78_78]
L78_78 = {}
L79_79 = "\239\191\189\225\186\163o Leviathan"
L78_78.Title = L79_79
L79_79 = "Content"
L80_80 = ""
L78_78[L79_79] = L80_80
L76_76 = L76_76(L77_77, L78_78)
L77_77 = spawn
function L78_78()
  pcall(function()
    while wait() do
      if game:GetService("Workspace").Map:FindFirstChild("FrozenDimension") then
        _UPVALUE0_:SetDesc("\239\191\189\239\191\189")
      else
        _UPVALUE0_:SetDesc("\239\191\189\239\191\189")
      end
    end
  end)
end
L77_77(L78_78)
L77_77 = L2_2.Status
L79_79 = "AddInput"
L78_78 = L77_77
L77_77 = L77_77[L79_79]
L79_79 = "Input"
L80_80 = {}
L81_81 = "Job ID"
L80_80.Title = L81_81
L81_81 = "Default"
L82_82 = ""
L80_80[L81_81] = L82_82
L81_81 = "Placeholder"
L82_82 = "D\195\161n Job ID V\195\160o \196\144\195\162y"
L80_80[L81_81] = L82_82
L81_81 = "Numeric"
L82_82 = false
L80_80[L81_81] = L82_82
L81_81 = "Finished"
L82_82 = false
L80_80[L81_81] = L82_82
L81_81 = "Callback"
function L82_82(A0_431)
  _G.Job = A0_431
end
L80_80[L81_81] = L82_82
L77_77 = L77_77(L78_78, L79_79, L80_80)
L78_78 = L2_2.Status
L80_80 = "AddButton"
L79_79 = L78_78
L78_78 = L78_78[L80_80]
L80_80 = {}
L81_81 = "Tham Gia Job ID"
L80_80.Title = L81_81
L81_81 = "Description"
L82_82 = ""
L80_80[L81_81] = L82_82
L81_81 = "Callback"
function L82_82()
  game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer)
end
L80_80[L81_81] = L82_82
L78_78(L79_79, L80_80)
L78_78 = L2_2.Status
L80_80 = "AddButton"
L79_79 = L78_78
L78_78 = L78_78[L80_80]
L80_80 = {}
L81_81 = "Sao Ch\195\169p Job ID"
L80_80.Title = L81_81
L81_81 = "Description"
L82_82 = ""
L80_80[L81_81] = L82_82
L81_81 = "Callback"
function L82_82()
  local L0_432
  L0_432 = setclipboard
  L0_432(tostring(game.JobId))
end
L80_80[L81_81] = L82_82
L78_78(L79_79, L80_80)
L78_78 = L2_2.Status
L80_80 = "AddToggle"
L79_79 = L78_78
L78_78 = L78_78[L80_80]
L80_80 = "MyToggle"
L81_81 = {}
L82_82 = "Spam Tham Gia Job ID"
L81_81.Title = L82_82
L82_82 = "Default"
L83_83 = false
L81_81[L82_82] = L83_83
L78_78 = L78_78(L79_79, L80_80, L81_81)
L81_81 = "OnChanged"
L80_80 = L78_78
L79_79 = L78_78[L81_81]
function L81_81(A0_433)
  _G.Join = A0_433
end
L79_79(L80_80, L81_81)
L79_79 = spawn
function L80_80()
  while wait() do
    if _G.Join then
      game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer)
    end
  end
end
L79_79(L80_80)
L79_79 = L2_2.Stats
L81_81 = "AddToggle"
L80_80 = L79_79
L79_79 = L79_79[L81_81]
L81_81 = "ToggleMelee"
L82_82 = {}
L83_83 = "N\195\162ng \196\144\225\186\165m"
L82_82.Title = L83_83
L83_83 = "Description"
L84_84 = ""
L82_82[L83_83] = L84_84
L83_83 = "Default"
L84_84 = false
L82_82[L83_83] = L84_84
L79_79 = L79_79(L80_80, L81_81, L82_82)
L82_82 = "OnChanged"
L81_81 = L79_79
L80_80 = L79_79[L82_82]
function L82_82(A0_434)
  _G.Auto_Stats_Melee = A0_434
end
L80_80(L81_81, L82_82)
L80_80 = "ToggleMelee"
L80_80 = L3_3[L80_80]
L82_82 = "SetValue"
L81_81 = L80_80
L80_80 = L80_80[L82_82]
L82_82 = false
L80_80(L81_81, L82_82)
L80_80 = L2_2.Stats
L82_82 = "AddToggle"
L81_81 = L80_80
L80_80 = L80_80[L82_82]
L82_82 = "ToggleDe"
L83_83 = {}
L84_84 = "N\195\162ng M\195\161u"
L83_83.Title = L84_84
L84_84 = "Description"
L83_83[L84_84] = L85_85
L84_84 = "Default"
L83_83[L84_84] = L85_85
L80_80 = L80_80(L81_81, L82_82, L83_83)
L83_83 = "OnChanged"
L82_82 = L80_80
L81_81 = L80_80[L83_83]
function L83_83(A0_435)
  _G.Auto_Stats_Defense = A0_435
end
L81_81(L82_82, L83_83)
L81_81 = "ToggleDe"
L81_81 = L3_3[L81_81]
L83_83 = "SetValue"
L82_82 = L81_81
L81_81 = L81_81[L83_83]
L83_83 = false
L81_81(L82_82, L83_83)
L81_81 = L2_2.Stats
L83_83 = "AddToggle"
L82_82 = L81_81
L81_81 = L81_81[L83_83]
L83_83 = "ToggleSword"
L84_84 = {}
L84_84.Title = L85_85
L84_84[L85_85] = L86_86
L84_84[L85_85] = L86_86
L81_81 = L81_81(L82_82, L83_83, L84_84)
L84_84 = "OnChanged"
L83_83 = L81_81
L82_82 = L81_81[L84_84]
function L84_84(A0_436)
  _G.Auto_Stats_Sword = A0_436
end
L82_82(L83_83, L84_84)
L82_82 = "ToggleSword"
L82_82 = L3_3[L82_82]
L84_84 = "SetValue"
L83_83 = L82_82
L82_82 = L82_82[L84_84]
L84_84 = false
L82_82(L83_83, L84_84)
L82_82 = L2_2.Stats
L84_84 = "AddToggle"
L83_83 = L82_82
L82_82 = L82_82[L84_84]
L84_84 = "ToggleGun"
L85_85.Title = L86_86
L85_85[L86_86] = L87_87
L85_85[L86_86] = L87_87
L82_82 = L82_82(L83_83, L84_84, L85_85)
L84_84 = L82_82
L83_83 = L82_82[L85_85]
L83_83(L84_84, L85_85)
L83_83 = "ToggleGun"
L83_83 = L3_3[L83_83]
L84_84 = L83_83
L83_83 = L83_83[L85_85]
L83_83(L84_84, L85_85)
L83_83 = L2_2.Stats
L84_84 = L83_83
L83_83 = L83_83[L85_85]
L86_86.Title = L87_87
L88_88 = ""
L86_86[L87_87] = L88_88
L88_88 = false
L86_86[L87_87] = L88_88
L83_83 = L83_83(L84_84, L85_85, L86_86)
L84_84 = L83_83[L86_86]
L84_84(L85_85, L86_86)
L84_84 = "ToggleFruit"
L84_84 = L3_3[L84_84]
L84_84 = L84_84[L86_86]
L84_84(L85_85, L86_86)
L84_84 = spawn
L84_84(L85_85)
L84_84 = spawn
L84_84(L85_85)
L84_84 = spawn
L84_84(L85_85)
L84_84 = spawn
L84_84(L85_85)
L84_84 = spawn
L84_84(L85_85)
L84_84 = {}
L88_88 = "Players"
L88_88 = "GetChildren"
L96_96 = L86_86(L87_87)
for L88_88, L89_89 in L85_85(L86_86, L87_87, L88_88, L89_89, L90_90, L91_91, L92_92, L93_93, L94_94, L95_95, L96_96, L86_86(L87_87)) do
  L90_90 = table
  L91_91 = "insert"
  L90_90 = L90_90[L91_91]
  L91_91 = L84_84
  L92_92 = "Name"
  L92_92 = L89_89[L92_92]
  L90_90(L91_91, L92_92)
end
L88_88 = {}
L89_89 = "Ch\225\187\141n Ng\198\176\225\187\157i Ch\198\161i"
L88_88.Title = L89_89
L89_89 = "Description"
L90_90 = ""
L88_88[L89_89] = L90_90
L89_89 = "Values"
L88_88[L89_89] = L84_84
L89_89 = "Multi"
L90_90 = false
L88_88[L89_89] = L90_90
L89_89 = "Default"
L90_90 = 1
L88_88[L89_89] = L90_90
L88_88 = "SetValue"
L88_88 = _G
L89_89 = "SelectPly"
L88_88 = L88_88[L89_89]
L86_86(L87_87, L88_88)
L88_88 = "OnChanged"
function L88_88(A0_437)
  _G.SelectPly = A0_437
end
L86_86(L87_87, L88_88)
L88_88 = "AddButton"
L88_88 = {}
L89_89 = "T\225\186\163i L\225\186\161i Ng\198\176\225\187\157i Ch\198\161i"
L88_88.Title = L89_89
L89_89 = "Description"
L90_90 = ""
L88_88[L89_89] = L90_90
L89_89 = "Callback"
function L90_90()
  table.clear(_UPVALUE0_)
  for _FORV_3_, _FORV_4_ in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(_UPVALUE0_, _FORV_4_.Name)
  end
end
L88_88[L89_89] = L90_90
L86_86(L87_87, L88_88)
L88_88 = "AddToggle"
L88_88 = "ToggleTeleport"
L89_89 = {}
L90_90 = "Bay \196\144\225\186\191n Ng\198\176\225\187\157i Ch\198\161i"
L89_89.Title = L90_90
L90_90 = "Description"
L91_91 = ""
L89_89[L90_90] = L91_91
L90_90 = "Default"
L91_91 = false
L89_89[L90_90] = L91_91
L89_89 = "OnChanged"
L88_88 = L86_86
function L89_89(A0_438)
  _G.TeleportPly = A0_438
  if A0_438 == false then
    wait()
    AutoHaki()
    Tween2(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
  end
end
L87_87(L88_88, L89_89)
L89_89 = "SetValue"
L88_88 = L87_87
L89_89 = false
L87_87(L88_88, L89_89)
function L88_88()
  while wait() do
    if _G.TeleportPly then
      pcall(function()
        if game.Players:FindFirstChild(_G.SelectPly) then
          Tween2(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
        end
      end)
    end
  end
end
L87_87(L88_88)
L89_89 = "AddToggle"
L88_88 = L87_87
L89_89 = "ToggleWalkonWater"
L90_90 = {}
L91_91 = "\239\191\189i Tr\195\170n N\198\176\225\187\155c"
L90_90.Title = L91_91
L91_91 = "Description"
L92_92 = ""
L90_90[L91_91] = L92_92
L91_91 = "Default"
L92_92 = true
L90_90[L91_91] = L92_92
L90_90 = "OnChanged"
L89_89 = L87_87
L88_88 = L87_87[L90_90]
function L90_90(A0_439)
  _G.WalkonWater = A0_439
end
L88_88(L89_89, L90_90)
L88_88 = "ToggleWalkonWater"
L88_88 = L3_3[L88_88]
L90_90 = "SetValue"
L89_89 = L88_88
L88_88 = L88_88[L90_90]
L90_90 = true
L88_88(L89_89, L90_90)
L88_88 = spawn
function L89_89()
  while task.wait() do
    pcall(function()
      if _G.WalkonWater then
        game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
      else
        game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
      end
    end)
  end
end
L88_88(L89_89)
L88_88 = L2_2.Player
L90_90 = "AddToggle"
L89_89 = L88_88
L88_88 = L88_88[L90_90]
L90_90 = "ToggleSpeedRun"
L91_91 = {}
L92_92 = "Ch\225\186\161y Nhanh"
L91_91.Title = L92_92
L92_92 = "Description"
L93_93 = ""
L91_91[L92_92] = L93_93
L92_92 = "Default"
L93_93 = true
L91_91[L92_92] = L93_93
L88_88 = L88_88(L89_89, L90_90, L91_91)
L91_91 = "OnChanged"
L90_90 = L88_88
L89_89 = L88_88[L91_91]
function L91_91(A0_440)
  InfAbility = A0_440
  if A0_440 == false then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
  end
end
L89_89(L90_90, L91_91)
L89_89 = "ToggleSpeedRun"
L89_89 = L3_3[L89_89]
L91_91 = "SetValue"
L90_90 = L89_89
L89_89 = L89_89[L91_91]
L91_91 = true
L89_89(L90_90, L91_91)
L89_89 = spawn
function L90_90()
  while wait() do
    if InfAbility then
      InfAb()
    end
  end
end
L89_89(L90_90)
function L89_89()
  local L0_441, L1_442
  L0_441 = InfAbility
  if L0_441 then
    L0_441 = game
    L1_442 = L0_441
    L0_441 = L0_441.GetService
    L0_441 = L0_441(L1_442, "Players")
    L0_441 = L0_441.LocalPlayer
    L0_441 = L0_441.Character
    L0_441 = L0_441.HumanoidRootPart
    L1_442 = L0_441
    L0_441 = L0_441.FindFirstChild
    L0_441 = L0_441(L1_442, "Agility")
    if not L0_441 then
      L0_441 = Instance
      L0_441 = L0_441.new
      L1_442 = "ParticleEmitter"
      L0_441 = L0_441(L1_442)
      L1_442 = Vector3
      L1_442 = L1_442.new
      L1_442 = L1_442(0, 0, 0)
      L0_441.Acceleration = L1_442
      L0_441.Archivable = true
      L0_441.Drag = 20
      L1_442 = Enum
      L1_442 = L1_442.NormalId
      L1_442 = L1_442.Top
      L0_441.EmissionDirection = L1_442
      L0_441.Enabled = true
      L1_442 = NumberRange
      L1_442 = L1_442.new
      L1_442 = L1_442(0, 0)
      L0_441.Lifetime = L1_442
      L0_441.LightInfluence = 0
      L0_441.LockedToPart = true
      L0_441.Name = "Agility"
      L0_441.Rate = 500
      L1_442 = {
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 4)
      }
      L0_441.Size = NumberSequence.new(L1_442)
      L0_441.RotSpeed = NumberRange.new(9999, 99999)
      L0_441.Rotation = NumberRange.new(0, 0)
      L0_441.Speed = NumberRange.new(30, 30)
      L0_441.SpreadAngle = Vector2.new(0, 0, 0, 0)
      L0_441.Texture = ""
      L0_441.VelocityInheritance = 0
      L0_441.ZOffset = 2
      L0_441.Transparency = NumberSequence.new(0)
      L0_441.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0))
      L0_441.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    end
  else
    L0_441 = game
    L1_442 = L0_441
    L0_441 = L0_441.GetService
    L0_441 = L0_441(L1_442, "Players")
    L0_441 = L0_441.LocalPlayer
    L0_441 = L0_441.Character
    L0_441 = L0_441.HumanoidRootPart
    L1_442 = L0_441
    L0_441 = L0_441.FindFirstChild
    L0_441 = L0_441(L1_442, "Agility")
    if L0_441 then
      L0_441 = game
      L1_442 = L0_441
      L0_441 = L0_441.GetService
      L0_441 = L0_441(L1_442, "Players")
      L0_441 = L0_441.LocalPlayer
      L0_441 = L0_441.Character
      L0_441 = L0_441.HumanoidRootPart
      L1_442 = L0_441
      L0_441 = L0_441.FindFirstChild
      L0_441 = L0_441(L1_442, "Agility")
      L1_442 = L0_441
      L0_441 = L0_441.Destroy
      L0_441(L1_442)
    end
  end
end
InfAb = L89_89
L89_89 = L2_2.Player
L91_91 = "AddToggle"
L90_90 = L89_89
L89_89 = L89_89[L91_91]
L91_91 = "ToggleNoClip"
L92_92 = {}
L93_93 = "\239\191\189i Xuy\195\170n T\198\176\225\187\157ng"
L92_92.Title = L93_93
L93_93 = "Description"
L94_94 = ""
L92_92[L93_93] = L94_94
L93_93 = "Default"
L94_94 = true
L92_92[L93_93] = L94_94
L89_89 = L89_89(L90_90, L91_91, L92_92)
L92_92 = "OnChanged"
L91_91 = L89_89
L90_90 = L89_89[L92_92]
function L92_92(A0_443)
  _G.LOf = A0_443
end
L90_90(L91_91, L92_92)
L90_90 = "ToggleNoClip"
L90_90 = L3_3[L90_90]
L92_92 = "SetValue"
L91_91 = L90_90
L90_90 = L90_90[L92_92]
L92_92 = true
L90_90(L91_91, L92_92)
L90_90 = spawn
function L91_91()
  pcall(function()
    game:GetService("RunService").Stepped:Connect(function()
      local L0_444
      if L0_444 then
        for _FORV_3_, _FORV_4_ in L0_444(game.Players.LocalPlayer.Character:GetDescendants()) do
          if _FORV_4_:IsA("BasePart") then
            _FORV_4_.CanCollide = false
          end
        end
      end
    end)
  end)
end
L90_90(L91_91)
L90_90 = L2_2.Player
L92_92 = "AddToggle"
L91_91 = L90_90
L90_90 = L90_90[L92_92]
L92_92 = "ToggleEnablePvp"
L93_93 = {}
L94_94 = "B\225\186\173t PVP"
L93_93.Title = L94_94
L94_94 = "Description"
L95_95 = ""
L93_93[L94_94] = L95_95
L94_94 = "Default"
L95_95 = false
L93_93[L94_94] = L95_95
L90_90 = L90_90(L91_91, L92_92, L93_93)
L93_93 = "OnChanged"
L92_92 = L90_90
L91_91 = L90_90[L93_93]
function L93_93(A0_445)
  _G.EnabledPvP = A0_445
end
L91_91(L92_92, L93_93)
L91_91 = "ToggleEnablePvp"
L91_91 = L3_3[L91_91]
L93_93 = "SetValue"
L92_92 = L91_91
L91_91 = L91_91[L93_93]
L93_93 = false
L91_91(L92_92, L93_93)
L91_91 = spawn
function L92_92()
  pcall(function()
    while wait() do
      if _G.EnabledPvP and game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
      end
    end
  end)
end
L91_91(L92_92)
L91_91 = L2_2.Teleport
L93_93 = "AddSection"
L92_92 = L91_91
L91_91 = L91_91[L93_93]
L93_93 = "Th\225\186\191 Gi\225\187\155i"
L91_91 = L91_91(L92_92, L93_93)
L92_92 = L2_2.Teleport
L94_94 = "AddToggle"
L93_93 = L92_92
L92_92 = L92_92[L94_94]
L94_94 = "ToggleAutoSea2"
L95_95 = {}
L96_96 = "Nhi\225\187\135m V\225\187\165 Qua Bi\225\187\131n 2"
L95_95.Title = L96_96
L96_96 = "Description"
L95_95[L96_96] = ""
L96_96 = "Default"
L95_95[L96_96] = false
L92_92 = L92_92(L93_93, L94_94, L95_95)
L95_95 = "OnChanged"
L94_94 = L92_92
L93_93 = L92_92[L95_95]
function L95_95(A0_446)
  _G.Auto_Sea2 = A0_446
end
L93_93(L94_94, L95_95)
L93_93 = "ToggleAutoSea2"
L93_93 = L3_3[L93_93]
L95_95 = "SetValue"
L94_94 = L93_93
L93_93 = L93_93[L95_95]
L95_95 = false
L93_93(L94_94, L95_95)
L93_93 = spawn
function L94_94()
  while wait() do
    if _G.Auto_Sea2 then
      pcall(function()
        local L0_447, L1_448
        L0_447 = game
        L0_447 = L0_447.GetService
        L0_447 = L0_447(L1_448, "Players")
        L0_447 = L0_447.LocalPlayer
        L0_447 = L0_447.Data
        L0_447 = L0_447.Level
        L0_447 = L0_447.Value
        if L0_447 >= 700 then
          if L1_448 then
            if L1_448 == false then
              if L1_448 == 1 then
                repeat
                  Tween(L1_448)
                  wait()
                until (L1_448.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.Auto_Sea2 == false
                wait(1.1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
                wait(0.5)
                EquipTool("Key")
                repeat
                  Tween(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                  wait()
                until 3 >= (Vector3.new(1347.7124, 37.3751602, -1325.6488) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude or _G.Auto_Sea2 == false
                wait(0.5)
              end
            elseif L1_448 == false then
              if L1_448 == 1 then
                if L1_448 then
                  for _FORV_4_, _FORV_5_ in L1_448(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _FORV_5_.Name == "Ice Admiral" then
                      if not _FORV_5_.Humanoid.Health <= 0 then
                        if _FORV_5_:FindFirstChild("Humanoid") and _FORV_5_:FindFirstChild("HumanoidRootPart") and _FORV_5_.Humanoid.Health > 0 then
                          OldCFrameSecond = _FORV_5_.HumanoidRootPart.CFrame
                          task.wait(_G.Fast_Delay)
                          AutoHaki()
                          EquipTool(SelectWeapon)
                          _FORV_5_.HumanoidRootPart.CanCollide = false
                          _FORV_5_.Humanoid.WalkSpeed = 0
                          _FORV_5_.Head.CanCollide = false
                          _FORV_5_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                          _FORV_5_.HumanoidRootPart.CFrame = OldCFrameSecond
                          Tween(_FORV_5_.HumanoidRootPart.CFrame * Pos)
                          AttackNoCoolDown()
                          sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        end
                      elseif _G.Auto_Sea2 and _FORV_5_.Parent and not (_FORV_5_.Humanoid.Health <= 0) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                      end
                    end
                  end
                elseif L1_448 then
                  L1_448(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * Pos)
                end
              end
            end
          end
        end
      end)
    end
  end
end
L93_93(L94_94)
L93_93 = L2_2.Teleport
L95_95 = "AddToggle"
L94_94 = L93_93
L93_93 = L93_93[L95_95]
L95_95 = "ToggleAutoSea3"
L96_96 = {}
L96_96.Title = "Nhi\225\187\135m V\225\187\165 Qua Bi\225\187\131n 3"
L96_96.Description = ""
L96_96.Default = false
L93_93 = L93_93(L94_94, L95_95, L96_96)
L96_96 = "OnChanged"
L95_95 = L93_93
L94_94 = L93_93[L96_96]
function L96_96(A0_449)
  _G.Auto_Sea3 = A0_449
end
L94_94(L95_95, L96_96)
L94_94 = "ToggleAutoSea3"
L94_94 = L3_3[L94_94]
L96_96 = "SetValue"
L95_95 = L94_94
L94_94 = L94_94[L96_96]
L96_96 = false
L94_94(L95_95, L96_96)
L94_94 = spawn
function L95_95()
  while wait() do
    if _G.AutoSea3 then
      pcall(function()
        if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and World2 then
          _G.AutoLevel = false
          if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "General") == 0 then
            Tween(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
            if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
              wait(1.5)
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
            end
            wait(1.8)
            if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
              for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _FORV_4_.Name == "rip_indra" then
                  OldCFrameThird = _FORV_4_.HumanoidRootPart.CFrame
                  repeat
                    task.wait(_G.Fast_Delay)
                    AutoHaki()
                    EquipTool(SelectWeapon)
                    Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                    _FORV_4_.HumanoidRootPart.CFrame = OldCFrameThird
                    _FORV_4_.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                    _FORV_4_.HumanoidRootPart.CanCollide = false
                    _FORV_4_.Humanoid.WalkSpeed = 0
                    AttackNoCoolDown()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                  until _G.AutoSea3 == false or 0 >= _FORV_4_.Humanoid.Health or not _FORV_4_.Parent
                end
              end
            elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
              Tween(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
            end
          end
        end
      end)
    end
  end
end
L94_94(L95_95)
L94_94 = L2_2.Teleport
L96_96 = "AddButton"
L95_95 = L94_94
L94_94 = L94_94[L96_96]
L96_96 = {}
L96_96.Title = "Bi\225\187\131n 1"
L96_96.Description = ""
function L96_96.Callback()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end
L94_94(L95_95, L96_96)
L94_94 = L2_2.Teleport
L96_96 = "AddButton"
L95_95 = L94_94
L94_94 = L94_94[L96_96]
L96_96 = {}
L96_96.Title = "Bi\225\187\131n 2"
L96_96.Description = ""
function L96_96.Callback()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end
L94_94(L95_95, L96_96)
L94_94 = L2_2.Teleport
L96_96 = "AddButton"
L95_95 = L94_94
L94_94 = L94_94[L96_96]
L96_96 = {}
L96_96.Title = "Bi\225\187\131n 3"
L96_96.Description = ""
function L96_96.Callback()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end
L94_94(L95_95, L96_96)
L94_94 = L2_2.Teleport
L96_96 = "AddSection"
L95_95 = L94_94
L94_94 = L94_94[L96_96]
L96_96 = "\239\191\189\225\186\163o"
L94_94 = L94_94(L95_95, L96_96)
L95_95 = Sea1
if L95_95 then
  L95_95 = {
    L96_96,
    "Marine",
    "Middle Town",
    "Jungle",
    "Pirate Village",
    "Desert",
    "Snow Island",
    "MarineFord",
    "Colosseum",
    "Sky Island 1",
    "Sky Island 2",
    "Sky Island 3",
    "Prison",
    "Magma Village",
    "Under Water Island",
    "Fountain City",
    "Shank Room",
    "Mob Island"
  }
  L96_96 = "WindMill"
  IslandList = L95_95
else
  L95_95 = Sea2
  if L95_95 then
    L95_95 = {
      L96_96,
      "Frist Spot",
      "Dark Area",
      "Flamingo Mansion",
      "Flamingo Room",
      "Green Zone",
      "Factory",
      "Colossuim",
      "Zombie Island",
      "Two Snow Mountain",
      "Punk Hazard",
      "Cursed Ship",
      "Ice Castle",
      "Forgotten Island",
      "Ussop Island",
      "Mini Sky Island"
    }
    L96_96 = "The Cafe"
    IslandList = L95_95
  else
    L95_95 = Sea3
    if L95_95 then
      L95_95 = {
        L96_96,
        "Port Town",
        "Great Tree",
        "Castle On The Sea",
        "MiniSky",
        "Hydra Island",
        "Floating Turtle",
        "Haunted Castle",
        "Ice Cream Island",
        "Peanut Island",
        "Cake Island",
        "Cocoa Island",
        "Candy Island",
        "Tiki Outpost"
      }
      L96_96 = "Mansion"
      IslandList = L95_95
    end
  end
end
L95_95 = L2_2.Teleport
L96_96 = L95_95
L95_95 = L95_95.AddDropdown
L95_95 = L95_95(L96_96, "DropdownIsland", {
  Title = "Ch\225\187\141n \196\144\225\186\163o",
  Description = "",
  Values = IslandList,
  Multi = false,
  Default = 1
})
L96_96 = L95_95.SetValue
L96_96(L95_95, _G.SelectIsland)
L96_96 = L95_95.OnChanged
L96_96(L95_95, function(A0_450)
  _G.SelectIsland = A0_450
end)
L96_96 = L2_2.Teleport
L96_96 = L96_96.AddButton
L96_96(L96_96, {
  Title = "Bay \196\144\225\186\191n \196\144\225\186\163o",
  Description = "",
  Callback = function()
    if _G.SelectIsland == "WindMill" then
      Tween2(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
    elseif _G.SelectIsland == "Marine" then
      Tween2(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
    elseif _G.SelectIsland == "Middle Town" then
      Tween2(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
    elseif _G.SelectIsland == "Jungle" then
      Tween2(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
    elseif _G.SelectIsland == "Pirate Village" then
      Tween2(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
    elseif _G.SelectIsland == "Desert" then
      Tween2(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
    elseif _G.SelectIsland == "Snow Island" then
      Tween2(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
    elseif _G.SelectIsland == "MarineFord" then
      Tween2(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
    elseif _G.SelectIsland == "Colosseum" then
      Tween2(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
    elseif _G.SelectIsland == "Sky Island 1" then
      Tween2(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
    elseif _G.SelectIsland == "Sky Island 2" then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
    elseif _G.SelectIsland == "Sky Island 3" then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
    elseif _G.SelectIsland == "Prison" then
      Tween2(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
    elseif _G.SelectIsland == "Magma Village" then
      Tween2(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
    elseif _G.SelectIsland == "Under Water Island" then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
    elseif _G.SelectIsland == "Fountain City" then
      Tween2(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
    elseif _G.SelectIsland == "Shank Room" then
      Tween2(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
    elseif _G.SelectIsland == "Mob Island" then
      Tween2(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
    elseif _G.SelectIsland == "The Cafe" then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-281.93707275390625, 306.130615234375, 609.280029296875))
      wait()
      Tween2(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
    elseif _G.SelectIsland == "Frist Spot" then
      Tween2(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
    elseif _G.SelectIsland == "Dark Area" then
      Tween2(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
    elseif _G.SelectIsland == "Flamingo Mansion" then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-281.93707275390625, 306.130615234375, 609.280029296875))
    elseif _G.SelectIsland == "Flamingo Room" then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.152034759521484, 905.48291015625))
    elseif _G.SelectIsland == "Green Zone" then
      Tween2(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
    elseif _G.SelectIsland == "Factory" then
      Tween2(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
    elseif _G.SelectIsland == "Colossuim" then
      Tween2(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
    elseif _G.SelectIsland == "Zombie Island" then
      Tween2(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
    elseif _G.SelectIsland == "Two Snow Mountain" then
      Tween2(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
    elseif _G.SelectIsland == "Punk Hazard" then
      Tween2(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
    elseif _G.SelectIsland == "Cursed Ship" then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.40197753906, 125.05712890625, 32885.875))
    elseif _G.SelectIsland == "Ice Castle" then
      Tween2(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
    elseif _G.SelectIsland == "Forgotten Island" then
      Tween2(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
    elseif _G.SelectIsland == "Ussop Island" then
      Tween2(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
    elseif _G.SelectIsland == "Mini Sky Island" then
      Tween2(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
    elseif _G.SelectIsland == "Great Tree" then
      Tween2(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
    elseif _G.SelectIsland == "Castle On The Sea" then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
    elseif _G.SelectIsland == "MiniSky" then
      Tween2(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
    elseif _G.SelectIsland == "Port Town" then
      Tween2(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
    elseif _G.SelectIsland == "Hydra Island" then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906))
    elseif _G.SelectIsland == "Floating Turtle" then
      Tween2(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
    elseif _G.SelectIsland == "Mansion" then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12468.5380859375, 375.0094299316406, -7554.62548828125))
    elseif _G.SelectIsland == "Castle On The Sea" then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
    elseif _G.SelectIsland == "Haunted Castle" then
      Tween2(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
    elseif _G.SelectIsland == "Ice Cream Island" then
      Tween2(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
    elseif _G.SelectIsland == "Peanut Island" then
      Tween2(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
    elseif _G.SelectIsland == "Cake Island" then
      Tween2(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
    elseif _G.SelectIsland == "Cocoa Island" then
      Tween2(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
    elseif _G.SelectIsland == "Candy Island" then
      Tween2(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
    elseif _G.SelectIsland == "Tiki Outpost" then
      Tween2(CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625))
    end
  end
})
L96_96 = L2_2.Visual
L96_96 = L96_96.AddButton
L96_96(L96_96, {
  Title = "Gi\225\186\163",
  Description = "",
  Callback = function()
    local L0_451, L1_452, L2_453, L3_454, L4_455, L5_456
    L0_451 = game
    L1_452 = L0_451
    L0_451 = L0_451.GetService
    L2_453 = "Players"
    L0_451 = L0_451(L1_452, L2_453)
    L0_451 = L0_451.LocalPlayer
    L1_452 = require
    L2_453 = game
    L3_454 = L2_453
    L2_453 = L2_453.GetService
    L4_455 = "ReplicatedStorage"
    L2_453 = L2_453(L3_454, L4_455)
    L2_453 = L2_453.Notification
    L1_452 = L1_452(L2_453)
    L3_454 = L0_451
    L2_453 = L0_451.WaitForChild
    L4_455 = "Data"
    L2_453 = L2_453(L3_454, L4_455)
    L3_454 = require
    L4_455 = game
    L4_455 = L4_455.ReplicatedStorage
    L5_456 = L4_455
    L4_455 = L4_455.WaitForChild
    L5_456 = L4_455(L5_456, "EXPFunction")
    L3_454 = L3_454(L4_455, L5_456, L4_455(L5_456, "EXPFunction"))
    L4_455 = require
    L5_456 = game
    L5_456 = L5_456.GetService
    L5_456 = L5_456(L5_456, "ReplicatedStorage")
    L5_456 = L5_456.Effect
    L5_456 = L5_456.Container
    L5_456 = L5_456.LevelUp
    L4_455 = L4_455(L5_456)
    L5_456 = require
    L5_456 = L5_456(game:GetService("ReplicatedStorage").Util.Sound)
    function v129(A0_457)
      local L1_458
      L1_458 = A0_457
      while true do
        L1_458 = string.gsub(L1_458, "^(-?%d+)(%d%d%d)", "%1,%2")
        if string.gsub(L1_458, "^(-?%d+)(%d%d%d)", "%1,%2") == 0 then
          break
        end
      end
    end
    L1_452.new("<Color=Yellow>QUEST COMPLETED!<Color=/>"):Display()
    L1_452.new("Earned<Color=Yellow>9,999,999,999,999 Exp.<Color=/>(+None)"):Display()
    L1_452.new("Earned<Color=Green>$9,999,999,999,999<Color=/>"):Display()
    L0_451.Data.Exp.Value = 999999999999
    L0_451.Data.Beli.Value = L0_451.Data.Beli.Value + 999999999999
    delay = 0
    count = 0
    while 0 < L0_451.Data.Exp.Value - L3_454(L2_453.Level.Value) do
      L0_451.Data.Exp.Value = L0_451.Data.Exp.Value - L3_454(L2_453.Level.Value)
      L0_451.Data.Level.Value = L0_451.Data.Level.Value + 1
      L0_451.Data.Points.Value = L0_451.Data.Points.Value + 3
      L4_455({L0_451})
      L5_456.Play(L5_456, (game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy") or game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp")).Value)
      L1_452.new("<Color=Green>LEVEL UP!<Color=/>(" .. L0_451.Data.Level.Value .. ")"):Display()
      count = count + 1
      if count >= 5 then
        delay = tick()
        count = 0
        wait()
      end
    end
  end
})
L96_96 = L2_2.Visual
L96_96 = L96_96.AddInput
L96_96(L96_96, "Input_Level", {
  Title = "C\225\186\165p",
  Default = "",
  Placeholder = "Nh\225\186\173p",
  Numeric = false,
  Finished = false,
  Callback = function(A0_459)
    game:GetService("Players").LocalPlayer.Data.Level.Value = tonumber(A0_459)
  end
})
L96_96 = L2_2.Visual
L96_96 = L96_96.AddInput
L96_96(L96_96, "Input_EXP", {
  Title = "Kinh Nghi\225\187\135m",
  Default = "",
  Placeholder = "Nh\225\186\173p",
  Numeric = false,
  Finished = false,
  Callback = function(A0_460)
    game:GetService("Players").LocalPlayer.Data.Exp.Value = tonumber(A0_460)
  end
})
L96_96 = L2_2.Visual
L96_96 = L96_96.AddInput
L96_96(L96_96, "Input_Beli", {
  Title = "Ti\225\187\129n",
  Default = "",
  Placeholder = "Nh\225\186\173p",
  Numeric = false,
  Finished = false,
  Callback = function(A0_461)
    game:GetService("Players").LocalPlayer.Data.Beli.Value = tonumber(A0_461)
  end
})
L96_96 = L2_2.Visual
L96_96 = L96_96.AddInput
L96_96(L96_96, "Input_Fragments", {
  Title = "\239\191\189i\225\187\131m F",
  Default = "",
  Placeholder = "Nh\225\186\173p",
  Numeric = false,
  Finished = false,
  Callback = function(A0_462)
    game:GetService("Players").LocalPlayer.Data.Fragments.Value = tonumber(A0_462)
  end
})
L96_96 = game
L96_96 = L96_96.ReplicatedStorage
L96_96 = L96_96.FindFirstChild
L96_96 = L96_96(L96_96, "Remotes")
L96_96 = L96_96.CommF_
L96_96 = L96_96.InvokeServer
L96_96 = L96_96(L96_96, "GetFruits")
Table_DevilFruitSniper = {}
ShopDevilSell = {}
for _FORV_100_, _FORV_101_ in next, L96_96, nil do
  table.insert(Table_DevilFruitSniper, _FORV_101_.Name)
  if _FORV_101_.OnSale then
    table.insert(ShopDevilSell, _FORV_101_.Name)
  end
end
_G.SelectFruit = nil
_G.PermanentFruit = nil
_G.AutoBuyFruitSniper = false
_G.AutoSwitchPermanentFruit = false
L2_2.Fruit:AddDropdown("DropdownFruit", {
  Title = "Ch\225\187\141n Tr\195\161i",
  Description = "",
  Values = Table_DevilFruitSniper,
  Multi = false,
  Default = 1
}):SetValue(_G.SelectFruit)
L2_2.Fruit:AddDropdown("DropdownFruit", {
  Title = "Ch\225\187\141n Tr\195\161i",
  Description = "",
  Values = Table_DevilFruitSniper,
  Multi = false,
  Default = 1
}):OnChanged(function(A0_463)
  _G.SelectFruit = A0_463
end)
L2_2.Fruit:AddToggle("ToggleFruit", {
  Title = "Mua Tr\195\161i Ch\225\187\141n",
  Description = "",
  Default = false
}):OnChanged(function(A0_464)
  if A0_464 then
    _G.AutoBuyFruitSniper = true
    pcall(function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", _G.SelectFruit, false)
    end)
    _G.AutoBuyFruitSniper = false
  end
end)
L3_3.ToggleFruit:SetValue(false)
L2_2.Fruit:AddDropdown("DropdownPermanentFruit", {
  Title = "Ch\225\187\141n Tr\195\161i V\196\169nh Vi\225\187\133n",
  Description = "",
  Values = Table_DevilFruitSniper,
  Multi = false,
  Default = 1
}):SetValue(_G.PermanentFruit)
L2_2.Fruit:AddDropdown("DropdownPermanentFruit", {
  Title = "Ch\225\187\141n Tr\195\161i V\196\169nh Vi\225\187\133n",
  Description = "",
  Values = Table_DevilFruitSniper,
  Multi = false,
  Default = 1
}):OnChanged(function(A0_465)
  _G.PermanentFruit = A0_465
end)
L2_2.Fruit:AddToggle("TogglePermanentFruit", {
  Title = "\239\191\189\225\187\149i Tr\195\161i V\196\169nh Vi\225\187\133n",
  Description = "",
  Default = false
}):OnChanged(function(A0_466)
  if A0_466 then
    _G.AutoSwitchPermanentFruit = true
    pcall(function()
      local L0_467
      L0_467 = {}
      L0_467[1] = "SwitchFruit"
      L0_467[2] = _G.PermanentFruit
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_467))
    end)
    _G.AutoSwitchPermanentFruit = false
  end
end)
L3_3.TogglePermanentFruit:SetValue(false)
L2_2.Fruit:AddToggle("ToggleStore", {
  Title = "L\198\176u Tr\195\161i",
  Description = "",
  Default = false
}):OnChanged(function(A0_468)
  _G.AutoStoreFruit = A0_468
end)
L3_3.ToggleStore:SetValue(false)
spawn(function()
  while task.wait() do
    if _G.AutoStoreFruit then
      pcall(function()
        if _G.AutoStoreFruit then
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bomb-Bomb", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spike-Spike", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Chop-Chop", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spring-Spring", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rocket-Rocket", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Smoke-Smoke", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spin-Spin", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Flame-Flame", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Falcon Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Falcon", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("alcon Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ice-Ice", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Sand-Sand", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dark-Dark", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ghost-Ghost", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Diamond-Diamond", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Light-Light", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Love-Love", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rubber-Rubber", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Barrier-Barrier", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Magma-Magma", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Door-Door", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Quake-Quake", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buddha", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spider-Spider", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Phoenix", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rumble-Rumble", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Pain-Pain", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Gravity-Gravity", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dough-Dough", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Shadow-Shadow", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Venom-Venom", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Control-Control", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Soul-Soul", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit"))
          end
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dragon-Dragon", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Leopard-Leopard", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"))
            end
          end
        end
      end)
    end
    wait()
  end
end)
L2_2.Fruit:AddToggle("ToggleRandomFruit", {
  Title = "Random Tr\195\161i",
  Description = "",
  Default = false
}):OnChanged(function(A0_469)
  _G.Random_Auto = A0_469
end)
L3_3.ToggleRandomFruit:SetValue(false)
spawn(function()
  pcall(function()
    while wait() do
      if _G.Random_Auto then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
      end
    end
  end)
end)
L2_2.Fruit:AddToggle("ToggleCollectTP", {
  Title = "Bay \196\144\225\186\191n Tr\195\161i",
  Description = "",
  Default = false
}):OnChanged(function(A0_470)
  _G.CollectFruitTP = A0_470
end)
L3_3.ToggleCollectTP:SetValue(false)
spawn(function()
  while wait() do
    if _G.CollectFruitTP then
      for _FORV_3_, _FORV_4_ in pairs(game.Workspace:GetChildren()) do
        if string.find(_FORV_4_.Name, "Fruit") then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _FORV_4_.Handle.CFrame
        end
      end
    end
  end
end)
L2_2.Fruit:AddToggle("ToggleCollect", {
  Title = "D\225\187\139ch Chuy\225\187\131n \196\144\225\186\191n Tr\195\161i",
  Description = "",
  Default = false
}):OnChanged(function(A0_471)
  _G.Tweenfruit = A0_471
end)
L3_3.ToggleCollect:SetValue(false)
spawn(function()
  while wait() do
    if _G.Tweenfruit then
      for _FORV_3_, _FORV_4_ in pairs(game.Workspace:GetChildren()) do
        if string.find(_FORV_4_.Name, "Fruit") then
          Tween(_FORV_4_.Handle.CFrame)
        end
      end
    end
  end
end)
L2_2.Fruit:AddToggle("ToggleEspPlayer", {
  Title = "Ng\198\176\225\187\157i Ch\198\161i",
  Description = "",
  Default = false
}):OnChanged(function(A0_472)
  ESPPlayer = A0_472
  UpdatePlayerChams()
end)
L3_3.ToggleEspPlayer:SetValue(false)
L2_2.Fruit:AddToggle("ToggleEspFruit", {
  Title = "Tr\195\161i",
  Description = "",
  Default = false
}):OnChanged(function(A0_473)
  DevilFruitESP = A0_473
  while DevilFruitESP do
    wait()
    UpdateDevilChams()
  end
end)
L3_3.ToggleEspFruit:SetValue(false)
L2_2.Fruit:AddToggle("ToggleEspIsland", {
  Title = "\239\191\189\225\186\163o",
  Description = "",
  Default = false
}):OnChanged(function(A0_474)
  IslandESP = A0_474
  while IslandESP do
    wait()
    UpdateIslandESP()
  end
end)
L3_3.ToggleEspIsland:SetValue(false)
L2_2.Fruit:AddToggle("ToggleEspFlower", {
  Title = "Hoa",
  Description = "",
  Default = false
}):OnChanged(function(A0_475)
  FlowerESP = A0_475
  UpdateFlowerChams()
end)
L3_3.ToggleEspFlower:SetValue(false)
spawn(function()
  while wait() do
    if FlowerESP then
      UpdateFlowerChams()
    end
    if DevilFruitESP then
      UpdateDevilChams()
    end
    if ChestESP then
      UpdateChestChams()
    end
    if ESPPlayer then
      UpdatePlayerChams()
    end
    if RealFruitESP then
      UpdateRealFruitChams()
    end
  end
end)
L2_2.Fruit:AddToggle("ToggleEspRealFruit", {
  Title = "Tr\195\161i D\225\187\169a Kh\225\187\155m T\195\161o",
  Description = "",
  Default = false
}):OnChanged(function(A0_476)
  RealFruitEsp = A0_476
  while RealFruitEsp do
    wait()
    UpdateRealFruitEsp()
  end
end)
L3_3.ToggleEspRealFruit:SetValue(false)
function UpdateRealFruitEsp()
  local L0_477, L1_478, L2_479, L3_480, L4_481, L5_482
  L5_482 = L1_478(L2_479)
  for L3_480, L4_481 in L0_477(L1_478, L2_479, L3_480, L4_481, L5_482, L1_478(L2_479)) do
    L5_482 = L4_481.IsA
    L5_482 = L5_482(L4_481, "Tool")
    if L5_482 then
      L5_482 = RealFruitEsp
      if L5_482 then
        L5_482 = L4_481.Handle
        L5_482 = L5_482.FindFirstChild
        L5_482 = L5_482(L5_482, "NameEsp" .. Number)
        if not L5_482 then
          L5_482 = Instance
          L5_482 = L5_482.new
          L5_482 = L5_482("BillboardGui", L4_481.Handle)
          L5_482.Name = "NameEsp" .. Number
          L5_482.ExtentsOffset = Vector3.new(0, 1, 0)
          L5_482.Size = UDim2.new(1, 200, 1, 30)
          L5_482.Adornee = L4_481.Handle
          L5_482.AlwaysOnTop = true
          Instance.new("TextLabel", L5_482).Font = Enum.Font.GothamSemibold
          Instance.new("TextLabel", L5_482).FontSize = "Size14"
          Instance.new("TextLabel", L5_482).TextWrapped = true
          Instance.new("TextLabel", L5_482).Size = UDim2.new(1, 0, 1, 0)
          Instance.new("TextLabel", L5_482).TextYAlignment = "Top"
          Instance.new("TextLabel", L5_482).BackgroundTransparency = 1
          Instance.new("TextLabel", L5_482).TextStrokeTransparency = 0.5
          Instance.new("TextLabel", L5_482).TextColor3 = Color3.fromRGB(255, 0, 0)
          Instance.new("TextLabel", L5_482).Text = L4_481.Name .. " \n" .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_481.Handle.Position).Magnitude / 3) .. " Distance"
        else
          L5_482 = L4_481.Handle
          L5_482 = L5_482["NameEsp" .. Number]
          L5_482 = L5_482.TextLabel
          L5_482.Text = L4_481.Name .. " " .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_481.Handle.Position).Magnitude / 3) .. " Distance"
        end
      else
        L5_482 = L4_481.Handle
        L5_482 = L5_482.FindFirstChild
        L5_482 = L5_482(L5_482, "NameEsp" .. Number)
        if L5_482 then
          L5_482 = L4_481.Handle
          L5_482 = L5_482.FindFirstChild
          L5_482 = L5_482(L5_482, "NameEsp" .. Number)
          L5_482 = L5_482.Destroy
          L5_482(L5_482)
        end
      end
    end
  end
  L5_482 = L1_478(L2_479)
  for L3_480, L4_481 in L0_477(L1_478, L2_479, L3_480, L4_481, L5_482, L1_478(L2_479)) do
    L5_482 = L4_481.IsA
    L5_482 = L5_482(L4_481, "Tool")
    if L5_482 then
      L5_482 = RealFruitEsp
      if L5_482 then
        L5_482 = L4_481.Handle
        L5_482 = L5_482.FindFirstChild
        L5_482 = L5_482(L5_482, "NameEsp" .. Number)
        if not L5_482 then
          L5_482 = Instance
          L5_482 = L5_482.new
          L5_482 = L5_482("BillboardGui", L4_481.Handle)
          L5_482.Name = "NameEsp" .. Number
          L5_482.ExtentsOffset = Vector3.new(0, 1, 0)
          L5_482.Size = UDim2.new(1, 200, 1, 30)
          L5_482.Adornee = L4_481.Handle
          L5_482.AlwaysOnTop = true
          Instance.new("TextLabel", L5_482).Font = Enum.Font.GothamSemibold
          Instance.new("TextLabel", L5_482).FontSize = "Size14"
          Instance.new("TextLabel", L5_482).TextWrapped = true
          Instance.new("TextLabel", L5_482).Size = UDim2.new(1, 0, 1, 0)
          Instance.new("TextLabel", L5_482).TextYAlignment = "Top"
          Instance.new("TextLabel", L5_482).BackgroundTransparency = 1
          Instance.new("TextLabel", L5_482).TextStrokeTransparency = 0.5
          Instance.new("TextLabel", L5_482).TextColor3 = Color3.fromRGB(255, 174, 0)
          Instance.new("TextLabel", L5_482).Text = L4_481.Name .. " \n" .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_481.Handle.Position).Magnitude / 3) .. " Distance"
        else
          L5_482 = L4_481.Handle
          L5_482 = L5_482["NameEsp" .. Number]
          L5_482 = L5_482.TextLabel
          L5_482.Text = L4_481.Name .. " " .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_481.Handle.Position).Magnitude / 3) .. " Distance"
        end
      else
        L5_482 = L4_481.Handle
        L5_482 = L5_482.FindFirstChild
        L5_482 = L5_482(L5_482, "NameEsp" .. Number)
        if L5_482 then
          L5_482 = L4_481.Handle
          L5_482 = L5_482.FindFirstChild
          L5_482 = L5_482(L5_482, "NameEsp" .. Number)
          L5_482 = L5_482.Destroy
          L5_482(L5_482)
        end
      end
    end
  end
  L5_482 = L1_478(L2_479)
  for L3_480, L4_481 in L0_477(L1_478, L2_479, L3_480, L4_481, L5_482, L1_478(L2_479)) do
    L5_482 = L4_481.IsA
    L5_482 = L5_482(L4_481, "Tool")
    if L5_482 then
      L5_482 = RealFruitEsp
      if L5_482 then
        L5_482 = L4_481.Handle
        L5_482 = L5_482.FindFirstChild
        L5_482 = L5_482(L5_482, "NameEsp" .. Number)
        if not L5_482 then
          L5_482 = Instance
          L5_482 = L5_482.new
          L5_482 = L5_482("BillboardGui", L4_481.Handle)
          L5_482.Name = "NameEsp" .. Number
          L5_482.ExtentsOffset = Vector3.new(0, 1, 0)
          L5_482.Size = UDim2.new(1, 200, 1, 30)
          L5_482.Adornee = L4_481.Handle
          L5_482.AlwaysOnTop = true
          Instance.new("TextLabel", L5_482).Font = Enum.Font.GothamSemibold
          Instance.new("TextLabel", L5_482).FontSize = "Size14"
          Instance.new("TextLabel", L5_482).TextWrapped = true
          Instance.new("TextLabel", L5_482).Size = UDim2.new(1, 0, 1, 0)
          Instance.new("TextLabel", L5_482).TextYAlignment = "Top"
          Instance.new("TextLabel", L5_482).BackgroundTransparency = 1
          Instance.new("TextLabel", L5_482).TextStrokeTransparency = 0.5
          Instance.new("TextLabel", L5_482).TextColor3 = Color3.fromRGB(251, 255, 0)
          Instance.new("TextLabel", L5_482).Text = L4_481.Name .. " \n" .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_481.Handle.Position).Magnitude / 3) .. " Distance"
        else
          L5_482 = L4_481.Handle
          L5_482 = L5_482["NameEsp" .. Number]
          L5_482 = L5_482.TextLabel
          L5_482.Text = L4_481.Name .. " " .. _UPVALUE0_((game:GetService("Players").LocalPlayer.Character.Head.Position - L4_481.Handle.Position).Magnitude / 3) .. " Distance"
        end
      else
        L5_482 = L4_481.Handle
        L5_482 = L5_482.FindFirstChild
        L5_482 = L5_482(L5_482, "NameEsp" .. Number)
        if L5_482 then
          L5_482 = L4_481.Handle
          L5_482 = L5_482.FindFirstChild
          L5_482 = L5_482(L5_482, "NameEsp" .. Number)
          L5_482 = L5_482.Destroy
          L5_482(L5_482)
        end
      end
    end
  end
end
L2_2.Fruit:AddToggle("ToggleIslandMirageEsp", {
  Title = "\239\191\189\225\186\163o B\195\173 \225\186\168n",
  Description = "",
  Default = false
}):OnChanged(function(A0_483)
  IslandMirageEsp = A0_483
  while IslandMirageEsp do
    wait()
    UpdateIslandMirageEsp()
  end
end)
L3_3.ToggleIslandMirageEsp:SetValue(false)
function isnil(A0_484)
  local L1_485
  L1_485 = A0_484 == nil
end
Number = math.random(1, 1000000)
function UpdateIslandMirageEsp()
  local L0_486
  for _FORV_3_, _FORV_4_ in L0_486(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
    pcall(function()
      local L0_487
      L0_487 = MirageIslandESP
      if L0_487 then
        L0_487 = _UPVALUE0_
        L0_487 = L0_487.Name
        if L0_487 == "Mirage Island" then
          L0_487 = _UPVALUE0_
          L0_487 = L0_487.FindFirstChild
          L0_487 = L0_487(L0_487, "NameEsp")
          if not L0_487 then
            L0_487 = Instance
            L0_487 = L0_487.new
            L0_487 = L0_487("BillboardGui", _UPVALUE0_)
            L0_487.Name = "NameEsp"
            L0_487.ExtentsOffset = Vector3.new(0, 1, 0)
            L0_487.Size = UDim2.new(1, 200, 1, 30)
            L0_487.Adornee = _UPVALUE0_
            L0_487.AlwaysOnTop = true
            Instance.new("TextLabel", L0_487).Font = Enum.Font.Code
            Instance.new("TextLabel", L0_487).FontSize = Enum.FontSize.Size14
            Instance.new("TextLabel", L0_487).TextWrapped = true
            Instance.new("TextLabel", L0_487).Size = UDim2.new(1, 0, 1, 0)
            Instance.new("TextLabel", L0_487).TextYAlignment = Enum.TextYAlignment.Top
            Instance.new("TextLabel", L0_487).BackgroundTransparency = 1
            Instance.new("TextLabel", L0_487).TextStrokeTransparency = 0.5
            Instance.new("TextLabel", L0_487).TextColor3 = Color3.fromRGB(80, 245, 245)
          else
            L0_487 = _UPVALUE0_
            L0_487 = L0_487.NameEsp
            L0_487 = L0_487.TextLabel
            L0_487.Text = _UPVALUE0_.Name .. "   \n" .. _UPVALUE1_((game:GetService("Players").LocalPlayer.Character.Head.Position - _UPVALUE0_.Position).Magnitude / 3) .. " M"
          end
        end
      else
        L0_487 = _UPVALUE0_
        L0_487 = L0_487.FindFirstChild
        L0_487 = L0_487(L0_487, "NameEsp")
        if L0_487 then
          L0_487 = _UPVALUE0_
          L0_487 = L0_487.FindFirstChild
          L0_487 = L0_487(L0_487, "NameEsp")
          L0_487 = L0_487.Destroy
          L0_487(L0_487)
        end
      end
    end)
  end
end
L2_2.Raid:AddDropdown("DropdownRaid", {
  Title = "Ch\225\187\141n Chip",
  Description = "",
  Values = {
    "Flame",
    "Ice",
    "Quake",
    "Light",
    "Dark",
    "Spider",
    "Rumble",
    "Magma",
    "Buddha",
    "Sand",
    "Phoenix",
    "Dough"
  },
  Multi = false,
  Default = 1
}):SetValue(SelectChip)
L2_2.Raid:AddDropdown("DropdownRaid", {
  Title = "Ch\225\187\141n Chip",
  Description = "",
  Values = {
    "Flame",
    "Ice",
    "Quake",
    "Light",
    "Dark",
    "Spider",
    "Rumble",
    "Magma",
    "Buddha",
    "Sand",
    "Phoenix",
    "Dough"
  },
  Multi = false,
  Default = 1
}):OnChanged(function(A0_488)
  SelectChip = A0_488
end)
L2_2.Raid:AddToggle("ToggleBuy", {
  Title = "Mua Chip",
  Description = "",
  Default = false
}):OnChanged(function(A0_489)
  _G.Auto_Buy_Chips_Dungeon = A0_489
end)
L3_3.ToggleBuy:SetValue(false)
spawn(function()
  while wait() do
    if _G.Auto_Buy_Chips_Dungeon then
      pcall(function()
        local L0_490
        L0_490 = {}
        L0_490[1] = "RaidsNpc"
        L0_490[2] = "Select"
        L0_490[3] = SelectChip
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_490))
      end)
    end
  end
end)
L2_2.Raid:AddToggle("ToggleStart", {
  Title = "B\225\186\175t \196\144\225\186\167u Raid",
  Description = "",
  Default = false
}):OnChanged(function(A0_491)
  _G.Auto_StartRaid = A0_491
end)
L3_3.ToggleStart:SetValue(false)
spawn(function()
  while wait() do
    pcall(function()
      local L0_492
      L0_492 = _G
      L0_492 = L0_492.Auto_StartRaid
      if L0_492 then
        L0_492 = game
        L0_492 = L0_492.GetService
        L0_492 = L0_492(L0_492, "Players")
        L0_492 = L0_492.LocalPlayer
        L0_492 = L0_492.PlayerGui
        L0_492 = L0_492.Main
        L0_492 = L0_492.Timer
        L0_492 = L0_492.Visible
        if L0_492 == false then
          L0_492 = game
          L0_492 = L0_492.GetService
          L0_492 = L0_492(L0_492, "Workspace")
          L0_492 = L0_492._WorldOrigin
          L0_492 = L0_492.Locations
          L0_492 = L0_492.FindFirstChild
          L0_492 = L0_492(L0_492, "Island 1")
          if not L0_492 then
            L0_492 = game
            L0_492 = L0_492.GetService
            L0_492 = L0_492(L0_492, "Players")
            L0_492 = L0_492.LocalPlayer
            L0_492 = L0_492.Backpack
            L0_492 = L0_492.FindFirstChild
            L0_492 = L0_492(L0_492, "Special Microchip")
            if not L0_492 then
              L0_492 = game
              L0_492 = L0_492.GetService
              L0_492 = L0_492(L0_492, "Players")
              L0_492 = L0_492.LocalPlayer
              L0_492 = L0_492.Character
              L0_492 = L0_492.FindFirstChild
              L0_492 = L0_492(L0_492, "Special Microchip")
            elseif L0_492 then
              L0_492 = Sea2
              if L0_492 then
                L0_492 = Tween2
                L0_492(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                L0_492 = {}
                L0_492[1] = "SetSpawnPoint"
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_492))
                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
              else
                L0_492 = Sea3
                if L0_492 then
                  L0_492 = game
                  L0_492 = L0_492.GetService
                  L0_492 = L0_492(L0_492, "ReplicatedStorage")
                  L0_492 = L0_492.Remotes
                  L0_492 = L0_492.CommF_
                  L0_492 = L0_492.InvokeServer
                  L0_492(L0_492, "requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
                  L0_492 = Tween2
                  L0_492(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499E-8, -0.378151238, 4.55503146E-9, 1, 1.07377559E-7, 0.378151238, 9.7681621E-8, -0.925743818))
                  L0_492 = {}
                  L0_492[1] = "SetSpawnPoint"
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_492))
                  fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                end
              end
            end
          end
        end
      end
    end)
  end
end)
L2_2.Raid:AddToggle("ToggleNextIsland", {
  Title = "\239\191\189\195\161nh Qu\195\161i Raid + Bay \196\144\225\186\191n \196\144\225\186\163o",
  Description = "",
  Default = false
}):OnChanged(function(A0_493)
  AutoNextIsland = A0_493
  if not A0_493 then
    _G.AutoNear = false
  end
end)
L3_3.ToggleNextIsland:SetValue(false)
spawn(function()
  local L0_494
  L0_494 = {}
  while task.wait() do
    if AutoNextIsland then
      pcall(function()
        local L0_495
        L0_495 = game
        L0_495 = L0_495.Players
        L0_495 = L0_495.LocalPlayer
        L0_495 = L0_495.Character
        if L0_495 and L0_495:FindFirstChild("HumanoidRootPart") then
          if (L0_495.HumanoidRootPart.Position - Vector3.new(-6438.73535, 250.645355, -4501.50684)).Magnitude < 1 or 1 > (L0_495.HumanoidRootPart.Position - Vector3.new(-5017.40869, 314.844055, -2823.0127)).Magnitude then
            _UPVALUE0_ = {}
          end
          if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1") then
            _G.AutoNear = true
          end
          if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2") and not _UPVALUE0_["Island 2"] then
            Tween(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2").CFrame)
            _UPVALUE0_["Island 2"] = true
            AutoNextIsland = false
            wait()
            AutoNextIsland = true
          elseif game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3") and not _UPVALUE0_["Island 3"] then
            Tween(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3").CFrame)
            _UPVALUE0_["Island 3"] = true
            AutoNextIsland = false
            wait()
            AutoNextIsland = true
          elseif game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4") and not _UPVALUE0_["Island 4"] then
            Tween(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4").CFrame)
            _UPVALUE0_["Island 4"] = true
            AutoNextIsland = false
            wait()
            AutoNextIsland = true
          elseif game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5") and not _UPVALUE0_["Island 5"] then
            Tween(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5").CFrame)
            _UPVALUE0_["Island 5"] = true
            AutoNextIsland = false
            wait()
            AutoNextIsland = true
          end
        end
      end)
    end
  end
end)
L2_2.Raid:AddToggle("ToggleAwake", {
  Title = "Th\225\187\169c T\225\187\137nh",
  Description = "",
  Default = false
}):OnChanged(function(A0_496)
  AutoAwakenAbilities = A0_496
end)
L3_3.ToggleAwake:SetValue(false)
spawn(function()
  while task.wait() do
    if AutoAwakenAbilities then
      pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
      end)
    end
  end
end)
L2_2.Raid:AddToggle("ToggleGetFruit", {
  Title = "L\225\186\165y Tr\195\161i D\198\176\225\187\155i 1 Tri\225\187\135u",
  Description = "",
  Default = false
}):OnChanged(function(A0_497)
  _G.Autofruit = A0_497
end)
spawn(function()
  while wait() do
    pcall(function()
      local L0_498, L1_499, L2_500, L3_501, L4_502, L5_503, L6_504, L7_505, L8_506, L9_507, L10_508, L11_509, L12_510, L13_511, L14_512, L15_513, L16_514
      L0_498 = _G
      L0_498 = L0_498.Autofruit
      if L0_498 then
        L0_498 = {}
        L0_498[1] = "LoadFruit"
        L0_498[2] = "Rocket-Rocket"
        L1_499 = game
        L2_500 = L1_499
        L1_499 = L1_499.GetService
        L3_501 = "ReplicatedStorage"
        L1_499 = L1_499(L2_500, L3_501)
        L1_499 = L1_499.Remotes
        L1_499 = L1_499.CommF_
        L2_500 = L1_499
        L1_499 = L1_499.InvokeServer
        L3_501 = unpack
        L4_502 = L0_498
        L16_514 = L3_501(L4_502)
        L1_499(L2_500, L3_501, L4_502, L5_503, L6_504, L7_505, L8_506, L9_507, L10_508, L11_509, L12_510, L13_511, L14_512, L15_513, L16_514, L3_501(L4_502))
        L1_499 = {}
        L1_499[1] = "LoadFruit"
        L1_499[2] = "Spin-Spin"
        L2_500 = game
        L3_501 = L2_500
        L2_500 = L2_500.GetService
        L4_502 = "ReplicatedStorage"
        L2_500 = L2_500(L3_501, L4_502)
        L2_500 = L2_500.Remotes
        L2_500 = L2_500.CommF_
        L3_501 = L2_500
        L2_500 = L2_500.InvokeServer
        L4_502 = unpack
        L5_503 = L1_499
        L16_514 = L4_502(L5_503)
        L2_500(L3_501, L4_502, L5_503, L6_504, L7_505, L8_506, L9_507, L10_508, L11_509, L12_510, L13_511, L14_512, L15_513, L16_514, L4_502(L5_503))
        L2_500 = {}
        L2_500[1] = "LoadFruit"
        L2_500[2] = "Chop-Chop"
        L3_501 = game
        L4_502 = L3_501
        L3_501 = L3_501.GetService
        L5_503 = "ReplicatedStorage"
        L3_501 = L3_501(L4_502, L5_503)
        L3_501 = L3_501.Remotes
        L3_501 = L3_501.CommF_
        L4_502 = L3_501
        L3_501 = L3_501.InvokeServer
        L5_503 = unpack
        L6_504 = L2_500
        L16_514 = L5_503(L6_504)
        L3_501(L4_502, L5_503, L6_504, L7_505, L8_506, L9_507, L10_508, L11_509, L12_510, L13_511, L14_512, L15_513, L16_514, L5_503(L6_504))
        L3_501 = {}
        L3_501[1] = "LoadFruit"
        L3_501[2] = "Spring-Spring"
        L4_502 = game
        L5_503 = L4_502
        L4_502 = L4_502.GetService
        L6_504 = "ReplicatedStorage"
        L4_502 = L4_502(L5_503, L6_504)
        L4_502 = L4_502.Remotes
        L4_502 = L4_502.CommF_
        L5_503 = L4_502
        L4_502 = L4_502.InvokeServer
        L6_504 = unpack
        L7_505 = L3_501
        L16_514 = L6_504(L7_505)
        L4_502(L5_503, L6_504, L7_505, L8_506, L9_507, L10_508, L11_509, L12_510, L13_511, L14_512, L15_513, L16_514, L6_504(L7_505))
        L4_502 = {}
        L4_502[1] = "LoadFruit"
        L4_502[2] = "Bomb-Bomb"
        L5_503 = game
        L6_504 = L5_503
        L5_503 = L5_503.GetService
        L7_505 = "ReplicatedStorage"
        L5_503 = L5_503(L6_504, L7_505)
        L5_503 = L5_503.Remotes
        L5_503 = L5_503.CommF_
        L6_504 = L5_503
        L5_503 = L5_503.InvokeServer
        L7_505 = unpack
        L8_506 = L4_502
        L16_514 = L7_505(L8_506)
        L5_503(L6_504, L7_505, L8_506, L9_507, L10_508, L11_509, L12_510, L13_511, L14_512, L15_513, L16_514, L7_505(L8_506))
        L5_503 = {}
        L5_503[1] = "LoadFruit"
        L5_503[2] = "Smoke-Smoke"
        L6_504 = game
        L7_505 = L6_504
        L6_504 = L6_504.GetService
        L8_506 = "ReplicatedStorage"
        L6_504 = L6_504(L7_505, L8_506)
        L6_504 = L6_504.Remotes
        L6_504 = L6_504.CommF_
        L7_505 = L6_504
        L6_504 = L6_504.InvokeServer
        L8_506 = unpack
        L9_507 = L5_503
        L16_514 = L8_506(L9_507)
        L6_504(L7_505, L8_506, L9_507, L10_508, L11_509, L12_510, L13_511, L14_512, L15_513, L16_514, L8_506(L9_507))
        L6_504 = {}
        L6_504[1] = "LoadFruit"
        L6_504[2] = "Spike-Spike"
        L7_505 = game
        L8_506 = L7_505
        L7_505 = L7_505.GetService
        L9_507 = "ReplicatedStorage"
        L7_505 = L7_505(L8_506, L9_507)
        L7_505 = L7_505.Remotes
        L7_505 = L7_505.CommF_
        L8_506 = L7_505
        L7_505 = L7_505.InvokeServer
        L9_507 = unpack
        L10_508 = L6_504
        L16_514 = L9_507(L10_508)
        L7_505(L8_506, L9_507, L10_508, L11_509, L12_510, L13_511, L14_512, L15_513, L16_514, L9_507(L10_508))
        L7_505 = {}
        L7_505[1] = "LoadFruit"
        L7_505[2] = "Flame-Flame"
        L8_506 = game
        L9_507 = L8_506
        L8_506 = L8_506.GetService
        L10_508 = "ReplicatedStorage"
        L8_506 = L8_506(L9_507, L10_508)
        L8_506 = L8_506.Remotes
        L8_506 = L8_506.CommF_
        L9_507 = L8_506
        L8_506 = L8_506.InvokeServer
        L10_508 = unpack
        L11_509 = L7_505
        L16_514 = L10_508(L11_509)
        L8_506(L9_507, L10_508, L11_509, L12_510, L13_511, L14_512, L15_513, L16_514, L10_508(L11_509))
        L8_506 = {}
        L8_506[1] = "LoadFruit"
        L8_506[2] = "Falcon-Falcon"
        L9_507 = game
        L10_508 = L9_507
        L9_507 = L9_507.GetService
        L11_509 = "ReplicatedStorage"
        L9_507 = L9_507(L10_508, L11_509)
        L9_507 = L9_507.Remotes
        L9_507 = L9_507.CommF_
        L10_508 = L9_507
        L9_507 = L9_507.InvokeServer
        L11_509 = unpack
        L12_510 = L8_506
        L16_514 = L11_509(L12_510)
        L9_507(L10_508, L11_509, L12_510, L13_511, L14_512, L15_513, L16_514, L11_509(L12_510))
        L9_507 = {}
        L9_507[1] = "LoadFruit"
        L9_507[2] = "Ice-Ice"
        L10_508 = game
        L11_509 = L10_508
        L10_508 = L10_508.GetService
        L12_510 = "ReplicatedStorage"
        L10_508 = L10_508(L11_509, L12_510)
        L10_508 = L10_508.Remotes
        L10_508 = L10_508.CommF_
        L11_509 = L10_508
        L10_508 = L10_508.InvokeServer
        L12_510 = unpack
        L13_511 = L9_507
        L16_514 = L12_510(L13_511)
        L10_508(L11_509, L12_510, L13_511, L14_512, L15_513, L16_514, L12_510(L13_511))
        L10_508 = {}
        L10_508[1] = "LoadFruit"
        L10_508[2] = "Sand-Sand"
        L11_509 = game
        L12_510 = L11_509
        L11_509 = L11_509.GetService
        L13_511 = "ReplicatedStorage"
        L11_509 = L11_509(L12_510, L13_511)
        L11_509 = L11_509.Remotes
        L11_509 = L11_509.CommF_
        L12_510 = L11_509
        L11_509 = L11_509.InvokeServer
        L13_511 = unpack
        L14_512 = L10_508
        L16_514 = L13_511(L14_512)
        L11_509(L12_510, L13_511, L14_512, L15_513, L16_514, L13_511(L14_512))
        L11_509 = {}
        L11_509[1] = "LoadFruit"
        L11_509[2] = "Dark-Dark"
        L12_510 = game
        L13_511 = L12_510
        L12_510 = L12_510.GetService
        L14_512 = "ReplicatedStorage"
        L12_510 = L12_510(L13_511, L14_512)
        L12_510 = L12_510.Remotes
        L12_510 = L12_510.CommF_
        L13_511 = L12_510
        L12_510 = L12_510.InvokeServer
        L14_512 = unpack
        L15_513 = L11_509
        L16_514 = L14_512(L15_513)
        L12_510(L13_511, L14_512, L15_513, L16_514, L14_512(L15_513))
        L12_510 = {}
        L12_510[1] = "LoadFruit"
        L12_510[2] = "Ghost-Ghost"
        L13_511 = game
        L14_512 = L13_511
        L13_511 = L13_511.GetService
        L15_513 = "ReplicatedStorage"
        L13_511 = L13_511(L14_512, L15_513)
        L13_511 = L13_511.Remotes
        L13_511 = L13_511.CommF_
        L14_512 = L13_511
        L13_511 = L13_511.InvokeServer
        L15_513 = unpack
        L16_514 = L12_510
        L16_514 = L15_513(L16_514)
        L13_511(L14_512, L15_513, L16_514, L15_513(L16_514))
        L13_511 = {}
        L13_511[1] = "LoadFruit"
        L13_511[2] = "Diamond-Diamond"
        L14_512 = game
        L15_513 = L14_512
        L14_512 = L14_512.GetService
        L16_514 = "ReplicatedStorage"
        L14_512 = L14_512(L15_513, L16_514)
        L14_512 = L14_512.Remotes
        L14_512 = L14_512.CommF_
        L15_513 = L14_512
        L14_512 = L14_512.InvokeServer
        L16_514 = unpack
        L16_514 = L16_514(L13_511)
        L14_512(L15_513, L16_514, L16_514(L13_511))
        L14_512 = {}
        L14_512[1] = "LoadFruit"
        L14_512[2] = "Light-Light"
        L15_513 = game
        L16_514 = L15_513
        L15_513 = L15_513.GetService
        L15_513 = L15_513(L16_514, "ReplicatedStorage")
        L15_513 = L15_513.Remotes
        L15_513 = L15_513.CommF_
        L16_514 = L15_513
        L15_513 = L15_513.InvokeServer
        L15_513(L16_514, unpack(L14_512))
        L15_513 = {}
        L15_513[1] = "LoadFruit"
        L15_513[2] = "Rubber-Rubber"
        L16_514 = game
        L16_514 = L16_514.GetService
        L16_514 = L16_514(L16_514, "ReplicatedStorage")
        L16_514 = L16_514.Remotes
        L16_514 = L16_514.CommF_
        L16_514 = L16_514.InvokeServer
        L16_514(L16_514, unpack(L15_513))
        L16_514 = {}
        L16_514[1] = "LoadFruit"
        L16_514[2] = "Barrier-Barrier"
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L16_514))
      end
    end)
  end
end)
if Sea2 then
  L2_2.Raid:AddButton({
    Title = "Bay \196\144\225\186\191n Ch\225\187\151 T\225\186\173p K\195\173ch",
    Description = "",
    Callback = function()
      local L0_515
      L0_515 = Tween2
      L0_515(CFrame.new(-6438.73535, 250.645355, -4501.50684))
    end
  })
elseif Sea3 then
  L2_2.Raid:AddButton({
    Title = "Bay \196\144\225\186\191n Ch\225\187\151 T\225\186\173p K\195\173ch",
    Description = "",
    Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
      Tween2(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499E-8, -0.378151238, 4.55503146E-9, 1, 1.07377559E-7, 0.378151238, 9.7681621E-8, -0.925743818))
    end
  })
end
L2_2.Raid:AddToggle("ToggleLaw", {
  Title = "Mua Chip V\195\160 \196\144\195\161nh Law",
  Description = "",
  Default = false
}):OnChanged(function(A0_516)
  Auto_Law = A0_516
end)
L3_3.ToggleLaw:SetValue(false)
spawn(function()
  pcall(function()
    while wait() do
      if Auto_Law and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") and not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
        wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
      end
    end
  end)
end)
spawn(function()
  pcall(function()
    while wait() do
      if Auto_Law then
        if not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order") and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip")) then
          fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
        end
        if game:GetService("ReplicatedStorage"):FindFirstChild("Order") or game:GetService("Workspace").Enemies:FindFirstChild("Order") then
          if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
            for _FORV_3_, _FORV_4_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _FORV_4_.Name == "Order" then
                repeat
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  Tween(_FORV_4_.HumanoidRootPart.CFrame * Pos)
                  _FORV_4_.HumanoidRootPart.CanCollide = false
                  _FORV_4_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                until not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0 or Auto_Law == false
              end
            end
          elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
            Tween(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
          end
        end
      end
    end
  end)
end)
L2_2.Race:AddButton({
  Title = "\239\191\189\225\187\129n Th\225\187\157i Gian",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
  end
})
L2_2.Race:AddButton({
  Title = "C\225\186\167n G\225\186\161t",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
  end
})
L2_2.Race:AddButton({
  Title = "Ch\225\187\151 Mua Gear",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    Tween2(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
  end
})
L2_2.Race:AddButton({
  Title = "C\225\187\173a T\225\187\153c",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
      Tween2(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
      Tween2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
      Tween2(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
      Tween2(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
      Tween2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
      Tween2(CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094))
    end
  end
})
L2_2.Race:AddToggle("ToggleHumanandghoul", {
  Title = "Ho\195\160n Th\195\160nh \225\186\162i [Human/Ghoul]",
  Description = "",
  Default = false
}):OnChanged(function(A0_517)
  KillAura = A0_517
end)
L3_3.ToggleHumanandghoul:SetValue(false)
L2_2.Race:AddToggle("ToggleAutotrial", {
  Title = "Ho\195\160n Th\195\160nh \225\186\162i",
  Description = "",
  Default = false
}):OnChanged(function(A0_518)
  _G.AutoQuestRace = A0_518
end)
L3_3.ToggleAutotrial:SetValue(false)
spawn(function()
  pcall(function()
    local L0_519, L1_520, L2_521, L3_522, L4_523, L5_524, L6_525, L7_526, L8_527, L9_528
    while true do
      if L0_519 then
        if L0_519 then
          if L0_519 == "Human" then
            L9_528 = L1_520(L2_521)
            for L3_522, L4_523 in L0_519(L1_520, L2_521, L3_522, L4_523, L5_524, L6_525, L7_526, L8_527, L9_528, L1_520(L2_521)) do
              if L5_524 then
                if L5_524 then
                  if L5_524 > 0 then
                    L5_524(L6_525)
                  end
                end
              end
            end
          elseif L0_519 == "Skypiea" then
            L3_522 = "Workspace"
            L9_528 = L1_520(L2_521)
            for L3_522, L4_523 in L0_519(L1_520, L2_521, L3_522, L4_523, L5_524, L6_525, L7_526, L8_527, L9_528, L1_520(L2_521)) do
              if L5_524 == "snowisland_Cylinder.081" then
                L8_527 = 0
                L9_528 = 0
                L5_524(L6_525)
              end
            end
          elseif L0_519 == "Fishman" then
            L3_522 = "Workspace"
            L9_528 = L1_520(L2_521)
            for L3_522, L4_523 in L0_519(L1_520, L2_521, L3_522, L4_523, L5_524, L6_525, L7_526, L8_527, L9_528, L1_520(L2_521)) do
              if L5_524 == "HumanoidRootPart" then
                L5_524(L6_525)
                L9_528 = L6_525(L7_526)
                for L8_527, L9_528 in L5_524(L6_525, L7_526, L8_527, L9_528, L6_525(L7_526)) do
                  if L9_528:IsA("Tool") and L9_528.ToolTip == "Melee" then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(L9_528)
                  end
                end
                L8_527 = 122
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 122
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L5_524(L6_525)
                L8_527 = 120
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 120
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L5_524(L6_525)
                L8_527 = 99
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 99
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L9_528 = L6_525(L7_526)
                for L8_527, L9_528 in L5_524(L6_525, L7_526, L8_527, L9_528, L6_525(L7_526)) do
                  if L9_528:IsA("Tool") and L9_528.ToolTip == "Blox Fruit" then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(L9_528)
                  end
                end
                L8_527 = 122
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 122
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L5_524(L6_525)
                L8_527 = 120
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 120
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L5_524(L6_525)
                L8_527 = 99
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 99
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L5_524()
                L9_528 = L6_525(L7_526)
                for L8_527, L9_528 in L5_524(L6_525, L7_526, L8_527, L9_528, L6_525(L7_526)) do
                  if L9_528:IsA("Tool") and L9_528.ToolTip == "Sword" then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(L9_528)
                  end
                end
                L8_527 = 122
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 122
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L5_524(L6_525)
                L8_527 = 120
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 120
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L5_524(L6_525)
                L8_527 = 99
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 99
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L5_524()
                L9_528 = L6_525(L7_526)
                for L8_527, L9_528 in L5_524(L6_525, L7_526, L8_527, L9_528, L6_525(L7_526)) do
                  if L9_528:IsA("Tool") and L9_528.ToolTip == "Gun" then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(L9_528)
                  end
                end
                L8_527 = 122
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 122
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L5_524(L6_525)
                L8_527 = 120
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 120
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L5_524(L6_525)
                L8_527 = 99
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
                L8_527 = 99
                L9_528 = false
                L5_524(L6_525, L7_526, L8_527, L9_528, game.Players.LocalPlayer.Character.HumanoidRootPart)
              end
            end
          elseif L0_519 == "Cyborg" then
            L3_522 = 14898.7832
            L4_523 = -30
            L8_527 = 0
            L9_528 = 1
            L9_528 = L1_520(L2_521, L3_522, L4_523, L5_524, L6_525, L7_526, L8_527, L9_528, 0, 0, 0, 1)
            L0_519(L1_520, L2_521, L3_522, L4_523, L5_524, L6_525, L7_526, L8_527, L9_528, L1_520(L2_521, L3_522, L4_523, L5_524, L6_525, L7_526, L8_527, L9_528, 0, 0, 0, 1))
          elseif L0_519 == "Ghoul" then
            L9_528 = L1_520(L2_521)
            for L3_522, L4_523 in L0_519(L1_520, L2_521, L3_522, L4_523, L5_524, L6_525, L7_526, L8_527, L9_528, L1_520(L2_521)) do
              if L5_524 then
                if L5_524 then
                  if L5_524 > 0 then
                    L5_524(L6_525)
                  end
                end
              end
            end
          elseif L0_519 == "Mink" then
            L3_522 = "Workspace"
            L9_528 = L1_520(L2_521)
            for L3_522, L4_523 in L0_519(L1_520, L2_521, L3_522, L4_523, L5_524, L6_525, L7_526, L8_527, L9_528, L1_520(L2_521)) do
              if L5_524 == "StartPoint" then
                L8_527 = 0
                L9_528 = 10
                L5_524(L6_525)
              end
            end
          end
        end
      end
    end
  end)
end)
L2_2.Race:AddToggle("ToggleKillTrial", {
  Title = "\239\191\189\195\161nh Ng\198\176\225\187\157i Ch\198\161i Trong Trial",
  Description = "",
  Default = false
}):OnChanged(function(A0_529)
  _G.AutoKillTrial = A0_529
end)
L3_3.ToggleKillTrial:SetValue(false)
spawn(function()
  while wait() do
    pcall(function()
      local L0_530
      if L0_530 then
        for _FORV_3_, _FORV_4_ in L0_530(game:GetService("Players"):GetChildren()) do
          if _FORV_4_.Name and _FORV_4_.Name ~= game.Players.LocalPlayer.Name and (_FORV_4_.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 and _FORV_4_.Character.Humanoid.Health > 0 then
            repeat
              wait(_G.Fast_Delay)
              EquipTool(SelectWeapon)
              AutoHaki()
              Tween(_FORV_4_.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
              _FORV_4_.Character.HumanoidRootPart.CanCollide = false
              _FORV_4_.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              AttackNoCoolDown()
            until not _G.AutoKillTrial or not _FORV_4_.Parent or _FORV_4_.Character.Humanoid.Health <= 0
          end
        end
      end
    end)
  end
end)
L2_2.Race:AddToggle("ToggleFarmRace", {
  Title = "C\195\160y Luy\225\187\135n T\225\187\153c",
  Description = "",
  Default = false
}):OnChanged(function(A0_531)
  _UPVALUE0_ = A0_531
end)
L3_3.ToggleFarmRace:SetValue(false)
spawn(function()
  while wait() do
    if _UPVALUE0_ then
      pcall(function()
        if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
          if game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
            _G.AutoBoneNoQuest = false
            Tween(CFrame.new(-9698.4736328125, 445.09442138671875, 6545.8525390625))
          elseif game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
            _G.AutoBoneNoQuest = true
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
            wait()
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
          end
        end
      end)
    else
      _G.AutoBoneNoQuest = false
    end
  end
end)
L2_2.Race:AddToggle("ToggleUpgrade", {
  Title = "Mua Gear",
  Description = "",
  Default = false
}):OnChanged(function(A0_532)
  _G.AutoUpgrade = A0_532
  if _G.AutoUpgrade then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
  end
end)
L3_3.ToggleUpgrade:SetValue(false)
L2_2.Shop:AddButton({
  Title = "Geppo",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
  end
})
L2_2.Shop:AddButton({
  Title = "Buso",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
  end
})
L2_2.Shop:AddButton({
  Title = "Soru",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
  end
})
L2_2.Shop:AddButton({
  Title = "Ken",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
  end
})
L2_2.Shop:AddButton({
  Title = "Cutlass",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
  end
})
L2_2.Shop:AddButton({
  Title = "Katana",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
  end
})
L2_2.Shop:AddButton({
  Title = "Iron Mace",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
  end
})
L2_2.Shop:AddButton({
  Title = "Duel Katana",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
  end
})
L2_2.Shop:AddButton({
  Title = "Triple Katana",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
  end
})
L2_2.Shop:AddButton({
  Title = "Pipe",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
  end
})
L2_2.Shop:AddButton({
  Title = "Dual-Headed Blade",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
  end
})
L2_2.Shop:AddButton({
  Title = "Bisento",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
  end
})
L2_2.Shop:AddButton({
  Title = "Soul Cane",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
  end
})
L2_2.Shop:AddButton({
  Title = "Pole V2",
  Description = "",
  Callback = function()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
  end
})
L2_2.Shop:AddButton({
  Title = "Musket",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Musket")
  end
})
L2_2.Shop:AddButton({
  Title = "Slingshot",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
  end
})
L2_2.Shop:AddButton({
  Title = "Flintlock",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
  end
})
L2_2.Shop:AddButton({
  Title = "Refined Slingshot",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Slingshot")
  end
})
L2_2.Shop:AddButton({
  Title = "Dual Flintlock",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock")
  end
})
L2_2.Shop:AddButton({
  Title = "Cannon",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
  end
})
L2_2.Shop:AddButton({
  Title = "Kabucha",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
  end
})
L2_2.Shop:AddButton({
  Title = "Black Cape",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
  end
})
L2_2.Shop:AddButton({
  Title = "Swordsman Hat",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
  end
})
L2_2.Shop:AddButton({
  Title = "Tomoe Ring",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
  end
})
L2_2.Shop:AddButton({
  Title = "Black Leg",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
  end
})
L2_2.Shop:AddButton({
  Title = "Electro",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
  end
})
L2_2.Shop:AddButton({
  Title = "Fishman Karate",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
  end
})
L2_2.Shop:AddButton({
  Title = "Dragon Claw",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
  end
})
L2_2.Shop:AddButton({
  Title = "Superhuman",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
  end
})
L2_2.Shop:AddButton({
  Title = "Death Step",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
  end
})
L2_2.Shop:AddButton({
  Title = "Sharkman Karate",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
  end
})
L2_2.Shop:AddButton({
  Title = "Electric Claw",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
  end
})
L2_2.Shop:AddButton({
  Title = "Dragon Talon",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
  end
})
L2_2.Shop:AddButton({
  Title = "Godhuman",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
  end
})
L2_2.Shop:AddButton({
  Title = "Sanguine Art",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
  end
})
L2_2.Shop:AddButton({
  Title = "\239\191\189\225\187\149i Ch\225\187\137 S\225\187\145",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
  end
})
L2_2.Shop:AddButton({
  Title = "\239\191\189\225\187\149i T\225\187\153c",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
  end
})
L2_2.Shop:AddButton({
  Title = "\239\191\189\225\187\149i T\225\187\153c Ghoul",
  Description = "",
  Callback = function()
    local L0_533
    L0_533 = {}
    L0_533[1] = "Ectoplasm"
    L0_533[2] = "Change"
    L0_533[3] = 4
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_533))
  end
})
L2_2.Shop:AddButton({
  Title = "\239\191\189\225\187\149i T\225\187\153c Cyborg",
  Description = "",
  Callback = function()
    local L0_534
    L0_534 = {}
    L0_534[1] = "CyborgTrainer"
    L0_534[2] = "Buy"
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_534))
  end
})
L2_2.Shop:AddButton({
  Title = "\239\191\189\225\187\149i T\225\187\153c Draco",
  Description = "Ch\225\187\137 \225\187\158 Bi\225\187\131n 3",
  Callback = function()
    local L0_535, L1_536, L2_537, L3_538
    L0_535 = game
    L1_536 = L0_535
    L0_535 = L0_535.GetService
    L2_537 = "ReplicatedStorage"
    L0_535 = L0_535(L1_536, L2_537)
    L0_535 = L0_535.Remotes
    L0_535 = L0_535.CommF_
    L1_536 = L0_535
    L0_535 = L0_535.InvokeServer
    L2_537 = "requestEntrance"
    L3_538 = Vector3
    L3_538 = L3_538.new
    L3_538 = L3_538(5661.5322265625, 1013.0907592773438, -334.9649963378906)
    L0_535(L1_536, L2_537, L3_538, L3_538(5661.5322265625, 1013.0907592773438, -334.9649963378906))
    L0_535 = Tween2
    L1_536 = CFrame
    L1_536 = L1_536.new
    L2_537 = 5814.42724609375
    L3_538 = 1208.3267822265625
    L3_538 = L1_536(L2_537, L3_538, 884.5785522460938)
    L0_535(L1_536, L2_537, L3_538, L1_536(L2_537, L3_538, 884.5785522460938))
    L0_535 = Vector3
    L0_535 = L0_535.new
    L1_536 = 5814.42724609375
    L2_537 = 1208.3267822265625
    L3_538 = 884.5785522460938
    L0_535 = L0_535(L1_536, L2_537, L3_538)
    L1_536 = game
    L1_536 = L1_536.Players
    L1_536 = L1_536.LocalPlayer
    L2_537 = L1_536.Character
    if not L2_537 then
      L2_537 = L1_536.CharacterAdded
      L3_538 = L2_537
      L2_537 = L2_537.Wait
      L2_537 = L2_537(L3_538)
    end
    repeat
      L3_538 = wait
      L3_538()
      L3_538 = L2_537.HumanoidRootPart
      L3_538 = L3_538.Position
      L3_538 = L3_538 - L0_535
      L3_538 = L3_538.Magnitude
    until L3_538 < 1
    L3_538 = {}
    L3_538[1] = {
      NPC = "Dragon Wizard",
      Command = "DragonRace"
    }
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(L3_538))
  end
})
L2_2.Misc:AddButton({
  Title = "Tham Gia M\195\161y Ch\225\187\167 L\225\186\161i",
  Description = "",
  Callback = function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
  end
})
L2_2.Misc:AddButton({
  Title = "\239\191\189\225\187\149i M\195\161y Ch\225\187\167",
  Description = "",
  Callback = function()
    Hop()
  end
})
function Hop()
  local L0_539, L2_540
  L0_539 = game
  L0_539 = L0_539.PlaceId
  L2_540 = {}
  function TPReturner()
    local L0_541, L1_542, L2_543, L3_544, L4_545, L5_546, L6_547, L7_548, L8_549, L9_550, L10_551, L11_552, L12_553, L13_554
    L1_542 = _UPVALUE0_
    if L1_542 == "" then
      L1_542 = game
      L1_542 = L1_542.HttpService
      L2_543 = L1_542
      L1_542 = L1_542.JSONDecode
      L6_547 = _UPVALUE1_
      L7_548 = "/servers/Public?sortOrder=Asc&limit=100"
      L13_554 = L3_544(L4_545, L5_546)
      L1_542 = L1_542(L2_543, L3_544, L4_545, L5_546, L6_547, L7_548, L8_549, L9_550, L10_551, L11_552, L12_553, L13_554, L3_544(L4_545, L5_546))
      L0_541 = L1_542
    else
      L1_542 = game
      L1_542 = L1_542.HttpService
      L2_543 = L1_542
      L1_542 = L1_542.JSONDecode
      L6_547 = _UPVALUE1_
      L7_548 = "/servers/Public?sortOrder=Asc&limit=100&cursor="
      L8_549 = _UPVALUE0_
      L13_554 = L3_544(L4_545, L5_546)
      L1_542 = L1_542(L2_543, L3_544, L4_545, L5_546, L6_547, L7_548, L8_549, L9_550, L10_551, L11_552, L12_553, L13_554, L3_544(L4_545, L5_546))
      L0_541 = L1_542
    end
    L1_542 = ""
    L2_543 = L0_541.nextPageCursor
    if L2_543 then
      L2_543 = L0_541.nextPageCursor
      if L2_543 ~= "null" then
        L2_543 = L0_541.nextPageCursor
        if L2_543 ~= nil then
          L2_543 = L0_541.nextPageCursor
          _UPVALUE0_ = L2_543
        end
      end
    end
    L2_543 = 0
    for L6_547, L7_548 in L3_544(L4_545) do
      L8_549 = true
      L1_542 = L9_550
      if L9_550 > L10_551 then
        for L12_553, L13_554 in L9_550(L10_551) do
          if L2_543 ~= 0 then
            if L1_542 == tostring(L13_554) then
              L8_549 = false
            end
          elseif tonumber(_UPVALUE3_) ~= tonumber(L13_554) then
          end
          L2_543 = L2_543 + 1
        end
        if L8_549 == true then
          L9_550(L10_551, L11_552)
          L9_550()
          L9_550(L10_551)
          L9_550()
        end
      end
    end
  end
  function _UPVALUE0_()
    while wait() do
      pcall(function()
        TPReturner()
        if _UPVALUE0_ ~= "" then
          TPReturner()
        end
      end)
    end
  end
  _UPVALUE0_()
end
L2_2.Misc:AddButton({
  Title = "H\225\186\163i T\225\186\183c",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
  end
})
L2_2.Misc:AddButton({
  Title = "H\225\186\163i Qu\195\162n",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
  end
})
L2_2.Misc:AddButton({
  Title = "Nh\225\186\173p H\225\186\191t Code",
  Description = "",
  Callback = function()
    local L0_555, L1_556, L2_557, L3_558, L4_559
    for L3_558, L4_559 in L0_555(L1_556) do
      RedeemCode(L4_559)
    end
  end
})
function RedeemCode(A0_560)
  game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(A0_560)
end
L2_2.Misc:AddButton({
  Title = "Danh Hi\225\187\135u",
  Description = "",
  Callback = function()
    local L0_561
    L0_561 = {}
    L0_561[1] = "getTitles"
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_561))
    game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
  end
})
L2_2.Misc:AddButton({
  Title = "Th\225\187\169c T\225\187\137nh",
  Description = "",
  Callback = function()
    game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
  end
})
L2_2.Misc:AddToggle("ToggleRejoin", {
  Title = "Tham Gia M\195\161y Ch\225\187\167 L\225\186\161i",
  Description = "",
  Default = true
}):OnChanged(function(A0_562)
  _G.AutoRejoin = A0_562
end)
L3_3.ToggleRejoin:SetValue(true)
spawn(function()
  while wait() do
    if _G.AutoRejoin then
      getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(A0_563)
        if A0_563.Name == "ErrorPrompt" and A0_563:FindFirstChild("MessageArea") and A0_563.MessageArea:FindFirstChild("ErrorFrame") then
          game:GetService("TeleportService"):Teleport(game.PlaceId)
        end
      end)
    end
  end
end)
L2_2.Misc:AddButton({
  Title = "X\195\179a S\198\176\198\161ng M\195\185",
  Description = "",
  Callback = function()
    _UPVALUE0_()
  end
})
L2_2.Misc:AddToggle("ToggleAntiBand", {
  Title = "Ch\225\187\145ng Ban",
  Description = "",
  Default = true
}):OnChanged(function(A0_564)
  _G.AntiBand = A0_564
end)
spawn(function()
  while wait() do
    if _G.AntiBand then
      for _FORV_3_, _FORV_4_ in pairs(game:GetService("Players"):GetPlayers()) do
        if table.find(_UPVALUE0_, _FORV_4_.UserId) then
          Hop()
        end
      end
    end
  end
end)
L2_2.Sea:AddButton({
  Title = "Mua Chip Leviathan",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
  end
})
L2_2.Sea:AddToggle("ToggleTPFrozenDimension", {
  Title = "Bay \196\144\225\186\191n \196\144\225\186\163o Leviathan",
  Description = "",
  Default = false
}):OnChanged(function(A0_565)
  _G.TweenToFrozenDimension = A0_565
end)
L2_2.Sea:AddToggle("ToggleTPFrozenDimension", {
  Title = "Bay \196\144\225\186\191n \196\144\225\186\163o Leviathan",
  Description = "",
  Default = false
}):SetValue(false)
spawn(function()
  local L0_566
  while not L0_566 do
    L0_566 = game:GetService("Workspace").Map:FindFirstChild("FrozenDimension")
    wait()
  end
  while wait() do
    if _G.TweenToFrozenDimension and L0_566 then
      Tween(L0_566.CFrame)
    end
  end
end)
if Sea3 then
  spawn(function()
    pcall(function()
      local L0_567
      while true do
        L0_567 = wait
        L0_567 = L0_567()
        if L0_567 then
          L0_567 = game
          L0_567 = L0_567.GetService
          L0_567 = L0_567(L0_567, "ReplicatedStorage")
          L0_567 = L0_567.Remotes
          L0_567 = L0_567.CommF_
          L0_567 = L0_567.InvokeServer
          L0_567 = L0_567(L0_567, "InfoLeviathan", "1")
          if L0_567 == 5 then
            _UPVALUE0_:SetDesc("Leviathan Is Out There")
          elseif L0_567 == 0 then
            _UPVALUE0_:SetDesc("I Don't Know")
          else
            _UPVALUE0_:SetDesc("Mua: " .. tostring(L0_567))
          end
        end
      end
    end)
  end)
end
L2_2.Sea:AddToggle("ToggleBlazeEmber", {
  Title = "L\225\187\165m L\225\187\173a \196\144\225\187\143",
  Description = "",
  Default = false
}):OnChanged(function(A0_568)
  _G.AutoBlazeEmber = A0_568
end)
spawn(function()
  while wait() do
    if _G.AutoBlazeEmber then
      pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/DragonDojoEmber"):FireServer()
      end)
    end
  end
end)
L2_2.Sea:AddToggle("ToggleBlazeEmberFarm", {
  Title = "\239\191\189\195\161nh Hydra Enforcer + Venomous Assailant",
  Description = "",
  Default = false
}):OnChanged(function(A0_569)
  _G.AutoBlazeEmberFarm = A0_569
end)
spawn(function()
  while task.wait() do
    if _G.AutoBlazeEmberFarm then
      pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild("Hydra Enforcer") or game:GetService("Workspace").Enemies:FindFirstChild("Venomous Assailant") then
          for _FORV_4_, _FORV_5_ in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if (_FORV_5_.Name == "Hydra Enforcer" or _FORV_5_.Name == "Venomous Assailant") and _FORV_5_:FindFirstChild("Humanoid") and _FORV_5_:FindFirstChild("HumanoidRootPart") and _FORV_5_.Humanoid.Health > 0 then
              repeat
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween2(_FORV_5_.HumanoidRootPart.CFrame * Pos)
                _FORV_5_.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                _FORV_5_.HumanoidRootPart.Transparency = 1
                _FORV_5_.Humanoid.JumpPower = 0
                _FORV_5_.Humanoid.WalkSpeed = 0
                _FORV_5_.HumanoidRootPart.CanCollide = false
                FarmPos = _FORV_5_.HumanoidRootPart.CFrame
                MonFarm = _FORV_5_.Name
              until not _G.AutoBlazeEmberFarm or _FORV_5_.Humanoid.Health <= 0
            end
          end
        else
          Tween2(CFrame.new(4612.078125, 1002.283447265625, 498.2188720703125))
        end
      end)
    end
  end
end)
L2_2.Sea:AddToggle("ToggleReceiveQuest", {
  Title = "Nh\225\186\173n Nhi\225\187\135m V\225\187\165 L\225\187\173a \196\144\225\187\143",
  Description = "B\225\186\173t L\195\170n 1 L\225\186\167n L\195\160 Nh\225\186\173n 1 Nh\225\186\173n N\225\187\175a Th\195\172 T\225\186\175t B\225\186\173t L\225\186\161i",
  Default = false
}):OnChanged(function(A0_570)
  _G.AutoReceiveQuest = A0_570
  if _G.AutoReceiveQuest then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906))
    Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    spawn(function()
      pcall(function()
        local L0_571, L1_572
        while true do
          L0_571 = wait
          L0_571 = L0_571()
          if L0_571 then
            L0_571 = {}
            L1_572 = {}
            L1_572.Context = "RequestQuest"
            L0_571[1] = L1_572
            L1_572 = game
            L1_572 = L1_572.GetService
            L1_572 = L1_572(L1_572, "ReplicatedStorage")
            L1_572 = L1_572.Modules
            L1_572 = L1_572.Net
            L1_572 = L1_572.FindFirstChild
            L1_572 = L1_572(L1_572, "RF/DragonHunter")
            L1_572 = L1_572.InvokeServer
            L1_572(L1_572, unpack(L0_571))
            L1_572 = {}
            L1_572[1] = {Context = "Check"}
          end
        end
      end)
    end)
  end
end)
spawn(function()
  pcall(function()
    local L0_573, L1_574
    while true do
      L0_573 = wait
      L0_573 = L0_573()
      if L0_573 then
        L0_573 = {}
        L1_574 = {}
        L1_574.Context = "Check"
        L0_573[1] = L1_574
        L1_574 = game
        L1_574 = L1_574.GetService
        L1_574 = L1_574(L1_574, "ReplicatedStorage")
        L1_574 = L1_574.Modules
        L1_574 = L1_574.Net
        L1_574 = L1_574.FindFirstChild
        L1_574 = L1_574(L1_574, "RF/DragonHunter")
        L1_574 = L1_574.InvokeServer
        L1_574 = L1_574(L1_574, unpack(L0_573))
        if typeof(L1_574) == "table" then
          for _FORV_5_, _FORV_6_ in pairs(L1_574) do
            if _FORV_6_ == "Defeat 3 Venomous Assailants on Hydra Island." then
              _UPVALUE0_:SetDesc("Defeat 3 Venomous Assailants on Hydra Island.")
            elseif _FORV_6_ == "Defeat 3 Hydra Enforcers on Hydra Island." then
              _UPVALUE0_:SetDesc("Defeat 3 Hydra Enforcers on Hydra Island.")
            elseif _FORV_6_ == "Destroy 10 trees on Hydra Island." then
              _UPVALUE0_:SetDesc("Destroy 10 trees on Hydra Island.")
            end
          end
        end
      end
    end
  end)
end)
L2_2.Sea:AddToggle("ToggleHydraTree", {
  Title = "Ph\195\161 C\195\162y \225\187\158 \196\144\225\186\163o Hydra",
  Description = "",
  Default = false
}):OnChanged(function(A0_575)
  _G.AutoHydraTree = A0_575
end)
spawn(function()
  local L0_576, L1_577, L2_578, L3_579, L4_580
  while true do
    if L0_576 then
      if L0_576 then
        L0_576()
        for L3_579, L4_580 in L0_576(L1_577) do
          while _G.AutoHydraTree do
            Tween2(L4_580)
            wait()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L4_580.Position).Magnitude <= 1 then
              _UPVALUE1_("Melee")
              _UPVALUE1_("Sword")
              _UPVALUE1_("Gun")
            end
          end
        end
      end
    end
  end
end)
L2_2.Sea:AddButton({
  Title = "Bay \196\144\225\186\191n Khu V\225\187\177c Dragon Dojo",
  Description = "",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906))
    Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
  end
})
L2_2.Sea:AddButton({
  Title = "Ch\225\186\191 T\225\186\161o Volcanic Magnet",
  Description = "C\225\186\167n 15 L\225\187\173a \196\144\225\187\143+10 S\225\186\175t",
  Callback = function()
    local L0_581
    L0_581 = {}
    L0_581[1] = "CraftItem"
    L0_581[2] = "Craft"
    L0_581[3] = "Volcanic Magnet"
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_581))
  end
})
L2_2.Sea:AddButton({
  Title = "Ch\225\186\191 T\225\186\161o Dino Hood",
  Description = "C\225\186\167n 25 X\198\176\198\161ng Kh\225\187\167ng Long + 10 S\225\187\171ng T\195\170 Gi\195\161c",
  Callback = function()
    local L0_582
    L0_582 = {}
    L0_582[1] = "CraftItem"
    L0_582[2] = "Craft"
    L0_582[3] = "DinoHood"
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_582))
  end
})
L2_2.Sea:AddButton({
  Title = "Ch\225\186\191 T\225\186\161o T-Rex Skull",
  Description = "C\225\186\167n 8 X\198\176\198\161ng Kh\225\187\167ng Long + 5 V\225\186\163y R\225\187\147ng",
  Callback = function()
    local L0_583
    L0_583 = {}
    L0_583[1] = "CraftItem"
    L0_583[2] = "Craft"
    L0_583[3] = "TRexSkull"
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L0_583))
  end
})
L2_2.Sea:AddToggle("ToggleCollectFireFlowers", {
  Title = "L\225\187\165m Hoa \196\144\225\187\143",
  Description = "",
  Default = false
}):OnChanged(function(A0_584)
  _G.AutoCollectFireFlowers = A0_584
end)
spawn(function()
  local L0_585, L1_586, L2_587, L3_588, L4_589, L5_590, L6_591
  while true do
    L0_585 = wait
    L0_585 = L0_585()
    if L0_585 then
      L0_585 = _G
      L0_585 = L0_585.AutoCollectFireFlowers
      if L0_585 then
        L0_585 = workspace
        L0_585 = L0_585.FindFirstChild
        L0_585 = L0_585(L1_586, L2_587)
        if L0_585 then
          L6_591 = L2_587(L3_588)
          for L4_589, L5_590 in L1_586(L2_587, L3_588, L4_589, L5_590, L6_591, L2_587(L3_588)) do
            L6_591 = L5_590.IsA
            L6_591 = L6_591(L5_590, "Model")
            if L6_591 then
              L6_591 = L5_590.PrimaryPart
              if L6_591 then
                L6_591 = L5_590.PrimaryPart
                L6_591 = L6_591.Position
                if (L6_591 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1 then
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                  wait(1.5)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                else
                  Tween2(CFrame.new(L6_591))
                end
              end
            end
          end
        end
      end
    end
  end
end)
L2_2.Sea:AddToggle("ToggleWhiteBelt", {
  Title = "C\195\160y \196\144ai Tr\225\186\175ng",
  Description = "",
  Default = false
}):OnChanged(function(A0_592)
  local L1_593
  L1_593 = _G
  L1_593.AutoLevel = A0_592
  if A0_592 then
    L1_593 = {}
    L1_593[1] = {
      NPC = "Dojo Trainer",
      Command = "RequestQuest"
    }
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(L1_593))
    spawn(function()
      local L0_594
      while true do
        L0_594 = _G
        L0_594 = L0_594.AutoLevel
        if L0_594 then
          L0_594 = {}
          L0_594[1] = {
            NPC = "Dojo Trainer",
            Command = "ClaimQuest"
          }
          game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(L0_594))
          wait()
        end
      end
    end)
  end
end)
L2_2.Sea:AddToggle("ToggleTrialTeleport", {
  Title = "Bay \196\144\225\186\191n C\225\187\173a Trial T\225\187\153c Draco",
  Description = "",
  Default = false
}):OnChanged(function(A0_595)
  _G.AutoTrialTeleport = A0_595
end)
spawn(function()
  while wait() do
    if _G.AutoTrialTeleport and workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport") and workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport"):IsA("Part") then
      Tween2(CFrame.new(workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport").Position))
      if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport").Position).Magnitude <= 1 then
        _G.AutoTrialTeleport = false
      end
    end
  end
end)
spawn(function()
  pcall(function()
    while wait() do
      if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
        _UPVALUE0_:SetDesc("\239\191\189\225\186\163o Dung Nham: \226\156\133\239\184\143")
      else
        _UPVALUE0_:SetDesc("\239\191\189\225\186\163o Dung Nham: \226\157\140\239\184\143")
      end
    end
  end)
end)
L2_2.Sea:AddToggle("ToggleTPVolcano", {
  Title = "Bay \196\144\225\186\191n \196\144\225\186\163o Dung Nham",
  Description = "",
  Default = false
}):OnChanged(function(A0_596)
  _G.TweenToPrehistoric = A0_596
end)
L3_3.ToggleTPVolcano:SetValue(false)
spawn(function()
  local L0_597
  while not L0_597 do
    L0_597 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
    wait()
  end
  while wait() do
    if _G.TweenToPrehistoric and game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
      if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland"):FindFirstChild("Core") and game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland").Core:FindFirstChild("PrehistoricRelic") and (game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland"):FindFirstChild("Core") and game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland").Core:FindFirstChild("PrehistoricRelic")):FindFirstChild("Skull") then
        Tween2(CFrame.new((game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland"):FindFirstChild("Core") and game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland").Core:FindFirstChild("PrehistoricRelic") and (game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland"):FindFirstChild("Core") and game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland").Core:FindFirstChild("PrehistoricRelic")):FindFirstChild("Skull")).Position))
        _G.TweenToPrehistoric = false
      end
    end
  end
end)
L2_2.Sea:AddToggle("ToggleDefendVolcano", {
  Title = "T\225\187\177 \196\144\225\187\153ng Ph\195\178ng Th\225\187\167",
  Description = "",
  Default = false
}):OnChanged(function(A0_598)
  _G.AutoDefendVolcano = A0_598
end)
L2_2.Sea:AddToggle("ToggleMelee", {
  Title = "D\195\185ng Melee",
  Description = "",
  Default = false
}):OnChanged(function(A0_599)
  _G.UseMelee = A0_599
end)
L2_2.Sea:AddToggle("ToggleSword", {
  Title = "D\195\185ng Sword",
  Description = "",
  Default = false
}):OnChanged(function(A0_600)
  _G.UseSword = A0_600
end)
L2_2.Sea:AddToggle("ToggleGun", {
  Title = "D\195\185ng Gun",
  Description = "",
  Default = false
}):OnChanged(function(A0_601)
  _G.UseGun = A0_601
end)
spawn(function()
  local L0_602, L1_603
  while true do
    L0_602 = wait
    L0_602 = L0_602()
    if L0_602 then
      L0_602 = _G
      L0_602 = L0_602.AutoDefendVolcano
      if L0_602 then
        L0_602 = AutoHaki
        L0_602()
        L0_602 = pcall
        L1_603 = _UPVALUE0_
        L0_602(L1_603)
        L0_602 = _UPVALUE1_
        L0_602 = L0_602()
        if L0_602 then
          L1_603 = CFrame
          L1_603 = L1_603.new
          L1_603 = L1_603(L0_602.Position + Vector3.new(0, 0, 0))
          Tween2(L1_603)
          if L0_602.Color ~= Color3.fromRGB(185, 53, 56) and L0_602.Color ~= Color3.fromRGB(185, 53, 57) then
            L0_602 = _UPVALUE1_()
          else
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L0_602.Position - Vector3.new(0, 0, 0)).Magnitude <= 1 then
              if _G.UseMelee then
                _UPVALUE2_("Melee")
              end
              if _G.UseSword then
                _UPVALUE2_("Sword")
              end
              if _G.UseGun then
                _UPVALUE2_("Gun")
              end
            end
            _G.TweenToPrehistoric = false
          end
        else
          L1_603 = _G
          L1_603.TweenToPrehistoric = true
        end
      end
    end
  end
end)
L2_2.Sea:AddToggle("ToggleKillAura", {
  Title = "\239\191\189\195\161nh Golems Aura",
  Description = "",
  Default = false
}):OnChanged(function(A0_604)
  KillAura = A0_604
end)
L3_3.ToggleKillAura:SetValue(false)
spawn(function()
  while wait() do
    if KillAura then
      pcall(function()
        local L0_605
        for _FORV_3_, _FORV_4_ in L0_605(game.Workspace.Enemies:GetDescendants()) do
          if _FORV_4_:FindFirstChild("Humanoid") and _FORV_4_:FindFirstChild("HumanoidRootPart") and _FORV_4_.Humanoid.Health > 0 then
            repeat
              task.wait()
              sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
              _FORV_4_.Humanoid.Health = 0
              _FORV_4_.HumanoidRootPart.CanCollide = false
            until not KillAura or not _FORV_4_.Parent or _FORV_4_.Humanoid.Health <= 0
          end
        end
      end)
    end
  end
end)
L2_2.Sea:AddToggle("ToggleCollectBone", {
  Title = "L\225\187\165m X\198\176\198\161ng",
  Description = "",
  Default = false
}):OnChanged(function(A0_606)
  _G.AutoCollectBone = A0_606
end)
spawn(function()
  while wait() do
    if _G.AutoCollectBone then
      for _FORV_3_, _FORV_4_ in pairs(workspace:GetDescendants()) do
        if _FORV_4_:IsA("BasePart") and _FORV_4_.Name == "DinoBone" then
          Tween2(CFrame.new(_FORV_4_.Position))
        end
      end
    end
  end
end)
L2_2.Sea:AddToggle("ToggleCollectEgg", {
  Title = "L\225\187\165m Tr\225\187\169ng",
  Description = "",
  Default = false
}):OnChanged(function(A0_607)
  _G.AutoCollectEgg = A0_607
end)
spawn(function()
  while wait() do
    if _G.AutoCollectEgg and #workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren() > 0 and workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()[math.random(1, #workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren())]:IsA("Model") and workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()[math.random(1, #workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren())].PrimaryPart then
      Tween2(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()[math.random(1, #workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren())].PrimaryPart.CFrame)
      if 1 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()[math.random(1, #workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren())].PrimaryPart.Position).Magnitude then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
        wait(1.5)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
      end
    end
  end
end)
