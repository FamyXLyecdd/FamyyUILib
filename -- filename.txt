-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
local r0_0 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local r1_0 = r0_0:CreateWindow({
  Title = "Monster Hub",
  SubTitle = "By Monster Roblox",
  TabWidth = 160,
  Theme = "Aqua",
  Acrylic = false,
  Size = UDim2.fromOffset(500, 320),
  MinimizeKey = Enum.KeyCode.End,
})
local r2_0 = {
  Info = r1_0:AddTab({
    Title = "Tab Thông Tin",
  }),
  Main = r1_0:AddTab({
    Title = "Tab Cày",
  }),
  Sea = r1_0:AddTab({
    Title = "Tab Sự Kiện Và Biển",
  }),
  Item = r1_0:AddTab({
    Title = "Tab Vật Phẩm",
  }),
  Setting = r1_0:AddTab({
    Title = "Tab Cài Đặt",
  }),
  Status = r1_0:AddTab({
    Title = "Tab Máy Chủ",
  }),
  Stats = r1_0:AddTab({
    Title = "Tab Chỉ Số",
  }),
  Player = r1_0:AddTab({
    Title = "Tab Người Chơi",
  }),
  Teleport = r1_0:AddTab({
    Title = "Tab Dịch Chuyển",
  }),
  Visual = r1_0:AddTab({
    Title = "Tab Thị Giác",
  }),
  Fruit = r1_0:AddTab({
    Title = "Tab Trái Và Định Vị",
  }),
  Raid = r1_0:AddTab({
    Title = "Tab Tập Kích",
  }),
  Race = r1_0:AddTab({
    Title = "Tab Tộc V4",
  }),
  Shop = r1_0:AddTab({
    Title = "Tab Cửa Hàng",
  }),
  Misc = r1_0:AddTab({
    Title = " Tab Khác",
  }),
}
local r3_0 = r0_0.Options
local r4_0 = game.PlaceId
if r4_0 == 2753915549 then
  Sea1 = true
elseif r4_0 == 4442272183 then
  Sea2 = true
elseif r4_0 == 7449423635 then
  Sea3 = true
else
  game:Shutdown()
end
game:GetService("Players").LocalPlayer.Idled:connect(function()
  -- line: [0, 0] id: 497
  game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
  wait()
  game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
Sea1 = false
Sea2 = false
Sea3 = false
local r5_0 = game.PlaceId
if r5_0 == 2753915549 then
  Sea1 = true
elseif r5_0 == 4442272183 then
  Sea2 = true
elseif r5_0 == 7449423635 then
  Sea3 = true
end
function CheckLevel()
  -- line: [0, 0] id: 337
  local r0_337 = game:GetService("Players").LocalPlayer.Data.Level.Value
  if Sea1 then
    if r0_337 == 1 or r0_337 <= 9 or SelectMonster == "Bandit" then
      Ms = "Bandit"
      NameQuest = "BanditQuest1"
      QuestLv = 1
      NameMon = "Bandit"
      CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
      CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
    elseif r0_337 == 10 or r0_337 <= 14 or SelectMonster == "Monkey" then
      Ms = "Monkey"
      NameQuest = "JungleQuest"
      QuestLv = 1
      NameMon = "Monkey"
      CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
      CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
    elseif r0_337 == 15 or r0_337 <= 29 or SelectMonster == "Gorilla" then
      Ms = "Gorilla"
      NameQuest = "JungleQuest"
      QuestLv = 2
      NameMon = "Gorilla"
      CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
      CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
    elseif r0_337 == 30 or r0_337 <= 39 or SelectMonster == "Pirate" then
      Ms = "Pirate"
      NameQuest = "BuggyQuest1"
      QuestLv = 1
      NameMon = "Pirate"
      CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
      CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
    elseif r0_337 == 40 or r0_337 <= 59 or SelectMonster == "Brute" then
      Ms = "Brute"
      NameQuest = "BuggyQuest1"
      QuestLv = 2
      NameMon = "Brute"
      CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
      CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
    elseif r0_337 == 60 or r0_337 <= 74 or SelectMonster == "Desert Bandit" then
      Ms = "Desert Bandit"
      NameQuest = "DesertQuest"
      QuestLv = 1
      NameMon = "Desert Bandit"
      CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
      CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
    elseif r0_337 == 75 or r0_337 <= 89 or SelectMonster == "Desert Officer" then
      Ms = "Desert Officer"
      NameQuest = "DesertQuest"
      QuestLv = 2
      NameMon = "Desert Officer"
      CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
      CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
    elseif r0_337 == 90 or r0_337 <= 99 or SelectMonster == "Snow Bandit" then
      Ms = "Snow Bandit"
      NameQuest = "SnowQuest"
      QuestLv = 1
      NameMon = "Snow Bandit"
      CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
      CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
    elseif r0_337 == 100 or r0_337 <= 119 or SelectMonster == "Snowman" then
      Ms = "Snowman"
      NameQuest = "SnowQuest"
      QuestLv = 2
      NameMon = "Snowman"
      CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
      CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
    elseif r0_337 == 120 or r0_337 <= 149 or SelectMonster == "Chief Petty Officer" then
      Ms = "Chief Petty Officer"
      NameQuest = "MarineQuest2"
      QuestLv = 1
      NameMon = "Chief Petty Officer"
      CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
      CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
    elseif r0_337 == 150 or r0_337 <= 174 or SelectMonster == "Sky Bandit" then
      Ms = "Sky Bandit"
      NameQuest = "SkyQuest"
      QuestLv = 1
      NameMon = "Sky Bandit"
      CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
      CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
    elseif r0_337 == 175 or r0_337 <= 189 or SelectMonster == "Dark Master" then
      Ms = "Dark Master"
      NameQuest = "SkyQuest"
      QuestLv = 2
      NameMon = "Dark Master"
      CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
      CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
    elseif r0_337 == 190 or r0_337 <= 209 or SelectMonster == "Prisoner" then
      Ms = "Prisoner"
      NameQuest = "PrisonerQuest"
      QuestLv = 1
      NameMon = "Prisoner"
      CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
      CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
    elseif r0_337 == 210 or r0_337 <= 249 or SelectMonster == "Dangerous Prisoner" then
      Ms = "Dangerous Prisoner"
      NameQuest = "PrisonerQuest"
      QuestLv = 2
      NameMon = "Dangerous Prisoner"
      CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
      CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
    elseif r0_337 == 250 or r0_337 <= 274 or SelectMonster == "Toga Warrior" then
      Ms = "Toga Warrior"
      NameQuest = "ColosseumQuest"
      QuestLv = 1
      NameMon = "Toga Warrior"
      CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
      CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
    elseif r0_337 == 275 or r0_337 <= 299 or SelectMonster == "Gladiator" then
      Ms = "Gladiator"
      NameQuest = "ColosseumQuest"
      QuestLv = 2
      NameMon = "Gladiator"
      CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
      CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
    elseif r0_337 == 300 or r0_337 <= 324 or SelectMonster == "Military Soldier" then
      Ms = "Military Soldier"
      NameQuest = "MagmaQuest"
      QuestLv = 1
      NameMon = "Military Soldier"
      CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
      CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
    elseif r0_337 == 325 or r0_337 <= 374 or SelectMonster == "Military Spy" then
      Ms = "Military Spy"
      NameQuest = "MagmaQuest"
      QuestLv = 2
      NameMon = "Military Spy"
      CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
      CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
    elseif r0_337 == 375 or r0_337 <= 399 or SelectMonster == "Fishman Warrior" then
      Ms = "Fishman Warrior"
      NameQuest = "FishmanQuest"
      QuestLv = 1
      NameMon = "Fishman Warrior"
      CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
      CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
      if _G.AutoLevel and 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
      end
    elseif r0_337 == 400 or r0_337 <= 449 or SelectMonster == "Fishman Commando" then
      Ms = "Fishman Commando"
      NameQuest = "FishmanQuest"
      QuestLv = 2
      NameMon = "Fishman Commando"
      CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
      CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
      if _G.AutoLevel and 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
      end
    elseif r0_337 == 10 or r0_337 <= 474 or SelectMonster == "God\'s Guard" then
      Ms = "God\'s Guard"
      NameQuest = "SkyExp1Quest"
      QuestLv = 1
      NameMon = "God\'s Guard"
      CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
      CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
      if _G.AutoLevel and 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
      end
    elseif r0_337 == 475 or r0_337 <= 524 or SelectMonster == "Shanda" then
      Ms = "Shanda"
      NameQuest = "SkyExp1Quest"
      QuestLv = 2
      NameMon = "Shanda"
      CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
      CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
      if _G.AutoLevel and 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
      end
    elseif r0_337 == 525 or r0_337 <= 549 or SelectMonster == "Royal Squad" then
      Ms = "Royal Squad"
      NameQuest = "SkyExp2Quest"
      QuestLv = 1
      NameMon = "Royal Squad"
      CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
      CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
    elseif r0_337 == 550 or r0_337 <= 624 or SelectMonster == "Royal Soldier" then
      Ms = "Royal Soldier"
      NameQuest = "SkyExp2Quest"
      QuestLv = 2
      NameMon = "Royal Soldier"
      CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
      CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
    elseif r0_337 == 625 or r0_337 <= 649 or SelectMonster == "Galley Pirate" then
      Ms = "Galley Pirate"
      NameQuest = "FountainQuest"
      QuestLv = 1
      NameMon = "Galley Pirate"
      CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
      CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
    elseif 650 <= r0_337 or SelectMonster == "Galley Captain" then
      Ms = "Galley Captain"
      NameQuest = "FountainQuest"
      QuestLv = 2
      NameMon = "Galley Captain"
      CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
      CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
    end
  end
  if Sea2 then
    if r0_337 == 700 or r0_337 <= 724 or SelectMonster == "Raider" then
      Ms = "Raider"
      NameQuest = "Area1Quest"
      QuestLv = 1
      NameMon = "Raider"
      CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
      CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
    elseif r0_337 == 725 or r0_337 <= 774 or SelectMonster == "Mercenary" then
      Ms = "Mercenary"
      NameQuest = "Area1Quest"
      QuestLv = 2
      NameMon = "Mercenary"
      CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
      CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
    elseif r0_337 == 775 or r0_337 <= 799 or SelectMonster == "Swan Pirate" then
      Ms = "Swan Pirate"
      NameQuest = "Area2Quest"
      QuestLv = 1
      NameMon = "Swan Pirate"
      CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
      CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
    elseif r0_337 == 800 or r0_337 <= 874 or SelectMonster == "Factory Staff" then
      Ms = "Factory Staff"
      NameQuest = "Area2Quest"
      QuestLv = 2
      NameMon = "Factory Staff"
      CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
      CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
    elseif r0_337 == 875 or r0_337 <= 899 or SelectMonster == "Marine Lieutenan" then
      Ms = "Marine Lieutenant"
      NameQuest = "MarineQuest3"
      QuestLv = 1
      NameMon = "Marine Lieutenant"
      CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
      CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
    elseif r0_337 == 900 or r0_337 <= 949 or SelectMonster == "Marine Captain" then
      Ms = "Marine Captain"
      NameQuest = "MarineQuest3"
      QuestLv = 2
      NameMon = "Marine Captain"
      CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
      CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
    elseif r0_337 == 950 or r0_337 <= 974 or SelectMonster == "Zombie" then
      Ms = "Zombie"
      NameQuest = "ZombieQuest"
      QuestLv = 1
      NameMon = "Zombie"
      CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
      CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
    elseif r0_337 == 975 or r0_337 <= 999 or SelectMonster == "Vampire" then
      Ms = "Vampire"
      NameQuest = "ZombieQuest"
      QuestLv = 2
      NameMon = "Vampire"
      CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
      CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
    elseif r0_337 == 1000 or r0_337 <= 1049 or SelectMonster == "Snow Trooper" then
      Ms = "Snow Trooper"
      NameQuest = "SnowMountainQuest"
      QuestLv = 1
      NameMon = "Snow Trooper"
      CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
      CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
    elseif r0_337 == 1050 or r0_337 <= 1099 or SelectMonster == "Winter Warrior" then
      Ms = "Winter Warrior"
      NameQuest = "SnowMountainQuest"
      QuestLv = 2
      NameMon = "Winter Warrior"
      CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
      CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
    elseif r0_337 == 1100 or r0_337 <= 1124 or SelectMonster == "Lab Subordinate" then
      Ms = "Lab Subordinate"
      NameQuest = "IceSideQuest"
      QuestLv = 1
      NameMon = "Lab Subordinate"
      CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
      CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
    elseif r0_337 == 1125 or r0_337 <= 1174 or SelectMonster == "Horned Warrior" then
      Ms = "Horned Warrior"
      NameQuest = "IceSideQuest"
      QuestLv = 2
      NameMon = "Horned Warrior"
      CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
      CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
    elseif r0_337 == 1175 or r0_337 <= 1199 or SelectMonster == "Magma Ninja" then
      Ms = "Magma Ninja"
      NameQuest = "FireSideQuest"
      QuestLv = 1
      NameMon = "Magma Ninja"
      CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
      CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
    elseif r0_337 == 1200 or r0_337 <= 1249 or SelectMonster == "Lava Pirate" then
      Ms = "Lava Pirate"
      NameQuest = "FireSideQuest"
      QuestLv = 2
      NameMon = "Lava Pirate"
      CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
      CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
    elseif r0_337 == 1250 or r0_337 <= 1274 or SelectMonster == "Ship Deckhand" then
      Ms = "Ship Deckhand"
      NameQuest = "ShipQuest1"
      QuestLv = 1
      NameMon = "Ship Deckhand"
      CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
      CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
      if _G.AutoLevel and 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      end
    elseif r0_337 == 1275 or r0_337 <= 1299 or SelectMonster == "Ship Engineer" then
      Ms = "Ship Engineer"
      NameQuest = "ShipQuest1"
      QuestLv = 2
      NameMon = "Ship Engineer"
      CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
      CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
      if _G.AutoLevel and 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      end
    elseif r0_337 == 1300 or r0_337 <= 1324 or SelectMonster == "Ship Steward" then
      Ms = "Ship Steward"
      NameQuest = "ShipQuest2"
      QuestLv = 1
      NameMon = "Ship Steward"
      CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
      CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
      if _G.AutoLevel and 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      end
    elseif r0_337 == 1325 or r0_337 <= 1349 or SelectMonster == "Ship Officer" then
      Ms = "Ship Officer"
      NameQuest = "ShipQuest2"
      QuestLv = 2
      NameMon = "Ship Officer"
      CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
      CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
      if _G.AutoLevel and 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      end
    elseif r0_337 == 1350 or r0_337 <= 1374 or SelectMonster == "Arctic Warrior" then
      Ms = "Arctic Warrior"
      NameQuest = "FrostQuest"
      QuestLv = 1
      NameMon = "Arctic Warrior"
      CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
      CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
      if _G.AutoLevel and 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
      end
    elseif r0_337 == 1375 or r0_337 <= 1424 or SelectMonster == "Snow Lurker" then
      Ms = "Snow Lurker"
      NameQuest = "FrostQuest"
      QuestLv = 2
      NameMon = "Snow Lurker"
      CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
      CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
    elseif r0_337 == 1425 or r0_337 <= 1449 or SelectMonster == "Sea Soldier" then
      Ms = "Sea Soldier"
      NameQuest = "ForgottenQuest"
      QuestLv = 1
      NameMon = "Sea Soldier"
      CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
      CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
    elseif 1450 <= r0_337 or SelectMonster == "Water Fighter" then
      Ms = "Water Fighter"
      NameQuest = "ForgottenQuest"
      QuestLv = 2
      NameMon = "Water Fighter"
      CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
      CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
    end
  end
  if Sea3 then
    if r0_337 == 1500 or r0_337 <= 1524 or SelectMonster == "Pirate Millionaire" then
      Ms = "Pirate Millionaire"
      NameQuest = "PiratePortQuest"
      QuestLv = 1
      NameMon = "Pirate Millionaire"
      CFrameQ = CFrame.new(-450.1046447753906, 107.68145751953125, 5950.72607421875)
      CFrameMon = CFrame.new(-193.99227905273438, 56.12502670288086, 5755.7880859375)
    elseif r0_337 == 1525 or r0_337 <= 1574 or SelectMonster == "Pistol Billionaire" then
      Ms = "Pistol Billionaire"
      NameQuest = "PiratePortQuest"
      QuestLv = 2
      NameMon = "Pistol Billionaire"
      CFrameQ = CFrame.new(-450.1046447753906, 107.68145751953125, 5950.72607421875)
      CFrameMon = CFrame.new(-188.14462280273438, 84.49613189697266, 6337.0419921875)
    elseif r0_337 == 1575 or r0_337 <= 1599 or SelectMonster == "Dragon Crew Warrior" then
      Ms = "Dragon Crew Warrior"
      NameQuest = "DragonCrewQuest"
      QuestLv = 1
      NameMon = "Dragon Crew Warrior"
      CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, -711.0979614257813)
      CFrameMon = CFrame.new(6615.2333984375, 50.847679138183594, -978.93408203125)
    elseif r0_337 == 1600 or r0_337 <= 1624 or SelectMonster == "Dragon Crew Archer" then
      Ms = "Dragon Crew Archer"
      NameQuest = "DragonCrewQuest"
      QuestLv = 2
      NameMon = "Dragon Crew Archer"
      CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, -711.0979614257813)
      CFrameMon = CFrame.new(6818.58935546875, 483.718994140625, 512.726806640625)
    elseif r0_337 == 1625 or r0_337 <= 1649 or SelectMonster == "Hydra Enforcer" then
      Ms = "Hydra Enforcer"
      NameQuest = "VenomCrewQuest"
      QuestLv = 1
      NameMon = "Hydra Enforcer"
      CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
      CFrameMon = CFrame.new(4547.115234375, 1001.60205078125, 334.1954650878906)
    elseif r0_337 == 1650 or r0_337 <= 1699 or SelectMonster == "Venomous Assailant" then
      Ms = "Venomous Assailant"
      NameQuest = "VenomCrewQuest"
      QuestLv = 2
      NameMon = "Venomous Assailant"
      CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
      CFrameMon = CFrame.new(4637.88525390625, 1077.85595703125, 882.4183959960938)
    elseif r0_337 == 1700 or r0_337 <= 1724 or SelectMonster == "Marine Commodore" then
      Ms = "Marine Commodore"
      NameQuest = "MarineTreeIsland"
      QuestLv = 1
      NameMon = "Marine Commodore"
      CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
      CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
    elseif r0_337 == 1725 or r0_337 <= 1774 or SelectMonster == "Marine Rear Admiral" then
      Ms = "Marine Rear Admiral"
      NameQuest = "MarineTreeIsland"
      QuestLv = 2
      NameMon = "Marine Rear Admiral"
      CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
      CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
    elseif r0_337 == 1775 or r0_337 <= 1799 or SelectMonster == "Fishman Raider" then
      Ms = "Fishman Raider"
      NameQuest = "DeepForestIsland3"
      QuestLv = 1
      NameMon = "Fishman Raider"
      CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
      CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
    elseif r0_337 == 1800 or r0_337 <= 1824 or SelectMonster == "Fishman Captain" then
      Ms = "Fishman Captain"
      NameQuest = "DeepForestIsland3"
      QuestLv = 2
      NameMon = "Fishman Captain"
      CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
      CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
    elseif r0_337 == 1825 or r0_337 <= 1849 or SelectMonster == "Forest Pirate" then
      Ms = "Forest Pirate"
      NameQuest = "DeepForestIsland"
      QuestLv = 1
      NameMon = "Forest Pirate"
      CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
      CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
    elseif r0_337 == 1850 or r0_337 <= 1899 or SelectMonster == "Mythological Pirate" then
      Ms = "Mythological Pirate"
      NameQuest = "DeepForestIsland"
      QuestLv = 2
      NameMon = "Mythological Pirate"
      CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
      CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
    elseif r0_337 == 1900 or r0_337 <= 1924 or SelectMonster == "Jungle Pirate" then
      Ms = "Jungle Pirate"
      NameQuest = "DeepForestIsland2"
      QuestLv = 1
      NameMon = "Jungle Pirate"
      CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
      CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
    elseif r0_337 == 1925 or r0_337 <= 1974 or SelectMonster == "Musketeer Pirate" then
      Ms = "Musketeer Pirate"
      NameQuest = "DeepForestIsland2"
      QuestLv = 2
      NameMon = "Musketeer Pirate"
      CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
      CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
    elseif r0_337 == 1975 or r0_337 <= 1999 or SelectMonster == "Reborn Skeleton" then
      Ms = "Reborn Skeleton"
      NameQuest = "HauntedQuest1"
      QuestLv = 1
      NameMon = "Reborn Skeleton"
      CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 0.0000000452954225, -0.999978542, 0.0000000204920472, 1, 0.0000000451620679, 0.999978542, -0.0000000201955679, -0.00655503059)
      CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -0.000013950732, -0.208259016, -0.00000108073925, 1, -0.0000720630269, 0.208259016, 0.0000707080399, 0.978073597)
    elseif r0_337 == 2000 or r0_337 <= 2024 or SelectMonster == "Living Zombie" then
      Ms = "Living Zombie"
      NameQuest = "HauntedQuest1"
      QuestLv = 2
      NameMon = "Living Zombie"
      CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 0.0000000452954225, -0.999978542, 0.0000000204920472, 1, 0.0000000451620679, 0.999978542, -0.0000000201955679, -0.00655503059)
      CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 0.0000000277547141, 0.0324240364, -0.0000000258006327, 1, -0.0000000606848474, -0.0324240364, 0.0000000598163865, 0.999474227)
    elseif r0_337 == 2025 or r0_337 <= 2049 or SelectMonster == "Demonic Soul" then
      Ms = "Demonic Soul"
      NameQuest = "HauntedQuest2"
      QuestLv = 1
      NameMon = "Demonic Soul"
      CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
      CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
    elseif r0_337 == 2050 or r0_337 <= 2074 or SelectMonster == "Posessed Mummy" then
      Ms = "Posessed Mummy"
      NameQuest = "HauntedQuest2"
      QuestLv = 2
      NameMon = "Posessed Mummy"
      CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
      CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
    elseif r0_337 == 2075 or r0_337 <= 2099 or SelectMonster == "Peanut Scout" then
      Ms = "Peanut Scout"
      NameQuest = "NutsIslandQuest"
      QuestLv = 1
      NameMon = "Peanut Scout"
      CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
      CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
    elseif r0_337 == 2100 or r0_337 <= 2124 or SelectMonster == "Peanut President" then
      Ms = "Peanut President"
      NameQuest = "NutsIslandQuest"
      QuestLv = 2
      NameMon = "Peanut President"
      CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
      CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
    elseif r0_337 == 2125 or r0_337 <= 2149 or SelectMonster == "Ice Cream Chef" then
      Ms = "Ice Cream Chef"
      NameQuest = "IceCreamIslandQuest"
      QuestLv = 1
      NameMon = "Ice Cream Chef"
      CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
      CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
    elseif r0_337 == 2150 or r0_337 <= 2199 or SelectMonster == "Ice Cream Commander" then
      Ms = "Ice Cream Commander"
      NameQuest = "IceCreamIslandQuest"
      QuestLv = 2
      NameMon = "Ice Cream Commander"
      CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
      CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
    elseif r0_337 == 2200 or r0_337 <= 2224 or SelectMonster == "Cookie Crafter" then
      Ms = "Cookie Crafter"
      NameQuest = "CakeQuest1"
      QuestLv = 1
      NameMon = "Cookie Crafter"
      CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
      CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
    elseif r0_337 == 2225 or r0_337 <= 2249 or SelectMonster == "Cake Guard" then
      Ms = "Cake Guard"
      NameQuest = "CakeQuest1"
      QuestLv = 2
      NameMon = "Cake Guard"
      CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
      CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
    elseif r0_337 == 2250 or r0_337 <= 2274 or SelectMonster == "Baking Staff" then
      Ms = "Baking Staff"
      NameQuest = "CakeQuest2"
      QuestLv = 1
      NameMon = "Baking Staff"
      CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
      CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
    elseif r0_337 == 2275 or r0_337 <= 2299 or SelectMonster == "Head Baker" then
      Ms = "Head Baker"
      NameQuest = "CakeQuest2"
      QuestLv = 2
      NameMon = "Head Baker"
      CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
      CFrameMon = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1, 0, 0.126466095, 0, -0.991971016)
    elseif r0_337 == 2300 or r0_337 <= 2324 or SelectMonster == "Cocoa Warrior" then
      Ms = "Cocoa Warrior"
      NameQuest = "ChocQuest1"
      QuestLv = 1
      NameMon = "Cocoa Warrior"
      CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
      CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
    elseif r0_337 == 2325 or r0_337 <= 2349 or SelectMonster == "Chocolate Bar Battler" then
      Ms = "Chocolate Bar Battler"
      NameQuest = "ChocQuest1"
      QuestLv = 2
      NameMon = "Chocolate Bar Battler"
      CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
      CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685)
    elseif r0_337 == 2350 or r0_337 <= 2374 or SelectMonster == "Sweet Thief" then
      Ms = "Sweet Thief"
      NameQuest = "ChocQuest2"
      QuestLv = 1
      NameMon = "Sweet Thief"
      CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
      CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
    elseif r0_337 == 2375 or r0_337 <= 2400 or SelectMonster == "Candy Rebel" then
      Ms = "Candy Rebel"
      NameQuest = "ChocQuest2"
      QuestLv = 2
      NameMon = "Candy Rebel"
      CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
      CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, -0.819156051)
    elseif r0_337 == 2400 or r0_337 <= 2424 or SelectMonster == "Candy Pirate" then
      Ms = "Candy Pirate"
      NameQuest = "CandyQuest1"
      QuestLv = 1
      NameMon = "Candy Pirate"
      CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
      CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
    elseif r0_337 == 2425 or r0_337 <= 2449 or SelectMonster == "Snow Demon" then
      Ms = "Snow Demon"
      NameQuest = "CandyQuest1"
      QuestLv = 2
      NameMon = "Snow Demon"
      CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
      CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
    elseif r0_337 == 2450 or r0_337 <= 2474 or SelectMonster == "Isle Outlaw" then
      Ms = "Isle Outlaw"
      NameQuest = "TikiQuest1"
      QuestLv = 1
      NameMon = "Isle Outlaw"
      CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632813)
      CFrameMon = CFrame.new(-16162.8193359375, 11.6863374710083, -96.45481872558594)
    elseif r0_337 == 2475 or r0_337 <= 2499 or SelectMonster == "Island Boy" then
      Ms = "Island Boy"
      NameQuest = "TikiQuest1"
      QuestLv = 2
      NameMon = "Island Boy"
      CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632813)
      CFrameMon = CFrame.new(-16357.3125, 20.632822036743164, 1005.64892578125)
    elseif r0_337 == 2500 or r0_337 <= 2524 or SelectMonster == "Sun-kissed Warrior" then
      Ms = "Sun-kissed Warrior"
      NameQuest = "TikiQuest2"
      QuestLv = 1
      NameMon = "Sun-kissed Warrior"
      CFrameQ = CFrame.new(-16541.021484375, 54.77081298828125, 1051.461181640625)
      CFrameMon = CFrame.new(-16357.3125, 20.632822036743164, 1005.64892578125)
    elseif r0_337 == 2525 or r0_337 <= 2549 or SelectMonster == "Isle Champion" then
      Ms = "Isle Champion"
      NameQuest = "TikiQuest2"
      QuestLv = 2
      NameMon = "Isle Champion"
      CFrameQ = CFrame.new(-16541.021484375, 54.77081298828125, 1051.461181640625)
      CFrameMon = CFrame.new(-16848.94140625, 21.68633460998535, 1041.4490966796875)
    elseif r0_337 == 2550 or r0_337 <= 2574 or SelectMonster == "Serpent Hunter" then
      Ms = "Serpent Hunter"
      NameQuest = "TikiQuest3"
      QuestLv = 1
      NameMon = "Serpent Hunter"
      CFrameQ = CFrame.new(-16665.19140625, 104.59640502929688, 1579.6943359375)
      CFrameMon = CFrame.new(-16621.4140625, 121.40631103515625, 1290.6881103515625)
    elseif r0_337 == 2575 or r0_337 <= 2599 or SelectMonster == "Skull Slayer" or r0_337 == 2600 then
      Ms = "Skull Slayer"
      NameQuest = "TikiQuest3"
      QuestLv = 2
      NameMon = "Skull Slayer"
      CFrameQ = CFrame.new(-16665.19140625, 104.59640502929688, 1579.6943359375)
      CFrameMon = CFrame.new(-16811.5703125, 84.625244140625, 1542.235107421875)
    end
  end
end
local r42_0 = nil	-- notice: implicit variable refs by block#[54, 55]
local r43_0 = nil	-- notice: implicit variable refs by block#[54, 55]
if Sea1 then
  tableMon = {
    "Bandit",
    "Monkey",
    "Gorilla",
    "Pirate",
    "Brute",
    "Desert Bandit",
    "Desert Officer",
    "Snow Bandit",
    "Snowman",
    "Chief Petty Officer",
    "Sky Bandit",
    "Dark Master",
    "Prisoner",
    "Dangerous Prisoner",
    "Toga Warrior",
    "Gladiator",
    "Military Soldier",
    "Military Spy",
    "Fishman Warrior",
    "Fishman Commando",
    "God\'s Guard",
    "Shanda",
    "Royal Squad",
    "Royal Soldier",
    "Galley Pirate",
    "Galley Captain"
  }
elseif Sea2 then
  tableMon = {
    "Raider",
    "Mercenary",
    "Swan Pirate",
    "Factory Staff",
    "Marine Lieutenant",
    "Marine Captain",
    "Zombie",
    "Vampire",
    "Snow Trooper",
    "Winter Warrior",
    "Lab Subordinate",
    "Horned Warrior",
    "Magma Ninja",
    "Lava Pirate",
    "Ship Deckhand",
    "Ship Engineer",
    "Ship Steward",
    "Ship Officer",
    "Arctic Warrior",
    "Snow Lurker",
    "Sea Soldier",
    "Water Fighter"
  }
elseif Sea3 then
  tableMon = {
    "Pirate Millionaire",
    "Dragon Crew Warrior",
    "Dragon Crew Archer",
    "Hydra Enforcer",
    "Venomous Assailant",
    "Marine Commodore",
    "Marine Rear Admiral",
    "Fishman Raider",
    "Fishman Captain",
    "Forest Pirate",
    "Mythological Pirate",
    "Jungle Pirate",
    "Musketeer Pirate",
    "Reborn Skeleton",
    "Living Zombie",
    "Demonic Soul",
    "Posessed Mummy",
    "Peanut Scout",
    "Peanut President",
    "Ice Cream Chef",
    "Ice Cream Commander",
    "Cookie Crafter",
    "Cake Guard",
    "Baking Staff",
    "Head Baker",
    "Cocoa Warrior",
    "Chocolate Bar Battler",
    "Sweet Thief",
    "Candy Rebel",
    "Candy Pirate",
    "Snow Demon",
    "Isle Outlaw",
    "Island Boy",
    "Sun-kissed Warrior",
    "Isle Champion",
    "Serpent Hunter",
    "Skull Slayer",
    nil,
    nil,
    nil
  }
end
if Sea1 then
  AreaList = {
    "Jungle",
    "Buggy",
    "Desert",
    "Snow",
    "Marine",
    "Sky",
    "Prison",
    "Colosseum",
    "Magma",
    "Fishman",
    "Sky Island",
    "Fountain"
  }
elseif Sea2 then
  AreaList = {
    "Area 1",
    "Area 2",
    "Zombie",
    "Marine",
    "Snow Mountain",
    "Ice fire",
    "Ship",
    "Frost",
    "Forgotten"
  }
elseif Sea3 then
  AreaList = {
    "Pirate Port",
    "Amazon",
    "Marine Tree",
    "Deep Forest",
    "Haunted Castle",
    "Nut Island",
    "Ice Cream Island",
    "Cake Island",
    "Choco Island",
    "Candy Island",
    "Tiki Outpost"
  }
end
function CheckBossQuest()
  -- line: [0, 0] id: 467
  if Sea1 then
    if SelectBoss == "The Gorilla King" then
      BossMon = "The Gorilla King"
      NameBoss = "The Gorrila King"
      NameQuestBoss = "JungleQuest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$2,000\n7,000 Exp."
      CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
      CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
    elseif SelectBoss == "Bobby" then
      BossMon = "Bobby"
      NameBoss = "Bobby"
      NameQuestBoss = "BuggyQuest1"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$8,000\n35,000 Exp."
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
      RewardBoss = "Reward:\n$10,000\n180,000 Exp."
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
      RewardBoss = "Reward:\n$10,000\n180,000 Exp."
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
      RewardBoss = "Reward:\n$6,000\n850,000 Exp."
      CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -0.00000449946401, 0.975376427, -0.0000195412576, 1, 0.00000903162072, -0.975376427, -0.0000210519756, 0.220546961)
      CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Chief Warden" then
      BossMon = "Chief Warden"
      NameBoss = "Chief Warden"
      NameQuestBoss = "ImpelQuest"
      QuestLvBoss = 2
      RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
      CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -0.0000280422337, -0.939682961, 0.00181045406, 0.342041939)
      CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Swan" then
      BossMon = "Swan"
      NameBoss = "Swan"
      NameQuestBoss = "ImpelQuest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
      CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
      CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Magma Admiral" then
      BossMon = "Magma Admiral"
      NameBoss = "Magma Admiral"
      NameQuestBoss = "MagmaQuest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
      CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
      CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
    elseif SelectBoss == "Fishman Lord" then
      BossMon = "Fishman Lord"
      NameBoss = "Fishman Lord"
      NameQuestBoss = "FishmanQuest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
      CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
      CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
    elseif SelectBoss == "Wysper" then
      BossMon = "Wysper"
      NameBoss = "Wysper"
      NameQuestBoss = "SkyExp1Quest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
      CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
      CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
    elseif SelectBoss == "Thunder God" then
      BossMon = "Thunder God"
      NameBoss = "Thunder God"
      NameQuestBoss = "SkyExp2Quest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
      CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
      CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
    elseif SelectBoss == "Cyborg" then
      BossMon = "Cyborg"
      NameBoss = "Cyborg"
      NameQuestBoss = "FountainQuest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
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
      RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
      CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
      CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
    elseif SelectBoss == "Jeremy" then
      BossMon = "Jeremy"
      NameBoss = "Jeremy"
      NameQuestBoss = "Area2Quest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
      CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
      CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
    elseif SelectBoss == "Fajita" then
      BossMon = "Fajita"
      NameBoss = "Fajita"
      NameQuestBoss = "MarineQuest3"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
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
      RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
      CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
      CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
    elseif SelectBoss == "Awakened Ice Admiral" then
      BossMon = "Awakened Ice Admiral"
      NameBoss = "Awakened Ice Admiral"
      NameQuestBoss = "FrostQuest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
      CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
      CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
    elseif SelectBoss == "Tide Keeper" then
      BossMon = "Tide Keeper"
      NameBoss = "Tide Keeper"
      NameQuestBoss = "ForgottenQuest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
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
      RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
      CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
      CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
    elseif SelectBoss == "Hydra Leader" then
      BossMon = "Hydra Leader"
      NameBoss = "Hydra Leader"
      NameQuestBoss = "VenomCrewQuest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
      CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
      CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
    elseif SelectBoss == "Kilo Admiral" then
      BossMon = "Kilo Admiral"
      NameBoss = "Kilo Admiral"
      NameQuestBoss = "MarineTreeIsland"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
      CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
      CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
    elseif SelectBoss == "Captain Elephant" then
      BossMon = "Captain Elephant"
      NameBoss = "Captain Elephant"
      NameQuestBoss = "DeepForestIsland"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
      CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
      CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
    elseif SelectBoss == "Beautiful Pirate" then
      BossMon = "Beautiful Pirate"
      NameBoss = "Beautiful Pirate"
      NameQuestBoss = "DeepForestIsland2"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
      CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
      CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
    elseif SelectBoss == "Cake Queen" then
      BossMon = "Cake Queen"
      NameBoss = "Cake Queen"
      NameQuestBoss = "IceCreamIslandQuest"
      QuestLvBoss = 3
      RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
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
function MaterialMon()
  -- line: [0, 0] id: 468
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
    MMon = "God\'s Guard"
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
function UpdateIslandESP()
  -- line: [0, 0] id: 485
  for r3_485, r4_485 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 486
      if IslandESP and r4_485.Name ~= "Sea" then
        if not r4_485:FindFirstChild("NameEsp") then
          local r0_486 = Instance.new("BillboardGui", r4_485)
          r0_486.Name = "NameEsp"
          r0_486.ExtentsOffset = Vector3.new(0, 1, 0)
          r0_486.Size = UDim2.new(1, 200, 1, 30)
          r0_486.Adornee = r4_485
          r0_486.AlwaysOnTop = true
          local r1_486 = Instance.new("TextLabel", r0_486)
          r1_486.Font = "GothamBold"
          r1_486.FontSize = "Size14"
          r1_486.TextWrapped = true
          r1_486.Size = UDim2.new(1, 0, 1, 0)
          r1_486.TextYAlignment = "Top"
          r1_486.BackgroundTransparency = 1
          r1_486.TextStrokeTransparency = 0.5
          r1_486.TextColor3 = Color3.fromRGB(8, 0, 0)
        else
          r4_485.NameEsp.TextLabel.Text = r4_485.Name .. "   \n" .. round(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_485.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_485:FindFirstChild("NameEsp") then
        r4_485:FindFirstChild("NameEsp"):Destroy()
      end
    end)
    -- close: r3_485
  end
end
function isnil(r0_209)
  -- line: [0, 0] id: 209
  return r0_209 == nil
end
local function r6_0(r0_134)
  -- line: [0, 0] id: 134
  return math.floor(tonumber(r0_134) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
  -- line: [0, 0] id: 550
  for r3_550, r4_550 in pairs(game:GetService("Players"):GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 551
      if not isnil(r4_550.Character) then
        if ESPPlayer then
          if not isnil(r4_550.Character.Head) and not r4_550.Character.Head:FindFirstChild(("NameEsp" .. Number)) then
            local r0_551 = Instance.new("BillboardGui", r4_550.Character.Head)
            r0_551.Name = "NameEsp" .. Number
            r0_551.ExtentsOffset = Vector3.new(0, 1, 0)
            r0_551.Size = UDim2.new(1, 200, 1, 30)
            r0_551.Adornee = r4_550.Character.Head
            r0_551.AlwaysOnTop = true
            local r1_551 = Instance.new("TextLabel", r0_551)
            r1_551.Font = Enum.Font.GothamSemibold
            r1_551.FontSize = "Size10"
            r1_551.TextWrapped = true
            r1_551.Text = r4_550.Name .. " \n" .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_550.Character.Head.Position)).Magnitude / 3) .. " Distance"
            r1_551.Size = UDim2.new(1, 0, 1, 0)
            r1_551.TextYAlignment = "Top"
            r1_551.BackgroundTransparency = 1
            r1_551.TextStrokeTransparency = 0.5
            if r4_550.Team == game.Players.LocalPlayer.Team then
              r1_551.TextColor3 = Color3.new(0, 0, 254)
            else
              r1_551.TextColor3 = Color3.new(255, 0, 0)
            end
          else
            r4_550.Character.Head["NameEsp" .. Number].TextLabel.Text = r4_550.Name .. " | " .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_550.Character.Head.Position)).Magnitude / 3) .. " Distance\nHealth : " .. r6_0(r4_550.Character.Humanoid.Health * 100 / r4_550.Character.Humanoid.MaxHealth) .. "%"
          end
        elseif r4_550.Character.Head:FindFirstChild("NameEsp" .. Number) then
          r4_550.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
        end
      end
    end)
    -- close: r3_550
  end
end
function UpdateChestChams()
  -- line: [0, 0] id: 126
  for r3_126, r4_126 in pairs(game.Workspace:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 127
      if string.find(r4_126.Name, "Chest") and r4_126:FindFirstChild("NameEsp" .. Number) then
        r4_126:FindFirstChild("NameEsp" .. Number):Destroy()
      end
      -- warn: not visited block [4, 5, 6, 7, 8, 9, 10]
      -- block#4:
      -- r0_127 = Instance.new("BillboardGui", _u0)
      -- r0_127.Name = "NameEsp" .. Number
      -- r0_127.ExtentsOffset = Vector3.new(0, 1, 0)
      -- r0_127.Size = UDim2.new(1, 200, 1, 30)
      -- r0_127.Adornee = _u0
      -- r0_127.AlwaysOnTop = true
      -- r1_127 = Instance.new("TextLabel", r0_127)
      -- r1_127.Font = Enum.Font.GothamSemibold
      -- r1_127.FontSize = "Size14"
      -- r1_127.TextWrapped = true
      -- r1_127.Size = UDim2.new(1, 0, 1, 0)
      -- r1_127.TextYAlignment = "Top"
      -- r1_127.BackgroundTransparency = 1
      -- r1_127.TextStrokeTransparency = 0.5
      -- if _u0.Name == "Chest1"
      -- block#5:
      -- r1_127.TextColor3 = Color3.fromRGB(109, 109, 109)
      -- r1_127.Text = "Chest 1" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
      -- block#6:
      -- if _u0.Name == "Chest2"
      -- block#7:
      -- r1_127.TextColor3 = Color3.fromRGB(173, 158, 21)
      -- r1_127.Text = "Chest 2" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
      -- block#8:
      -- if _u0.Name == "Chest3"
      -- block#9:
      -- r1_127.TextColor3 = Color3.fromRGB(85, 255, 255)
      -- r1_127.Text = "Chest 3" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
      -- goto label_214
      -- block#10:
      -- _u0["NameEsp" .. Number].TextLabel.Text = _u0.Name .. "   \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
      -- goto label_214
    end)
    -- close: r3_126
  end
end
function UpdateDevilChams()
  -- line: [0, 0] id: 519
  for r3_519, r4_519 in pairs(game.Workspace:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 520
      if DevilFruitESP and string.find(r4_519.Name, "Fruit") then
        if not r4_519.Handle:FindFirstChild(("NameEsp" .. Number)) then
          local r0_520 = Instance.new("BillboardGui", r4_519.Handle)
          r0_520.Name = "NameEsp" .. Number
          r0_520.ExtentsOffset = Vector3.new(0, 1, 0)
          r0_520.Size = UDim2.new(1, 200, 1, 30)
          r0_520.Adornee = r4_519.Handle
          r0_520.AlwaysOnTop = true
          local r1_520 = Instance.new("TextLabel", r0_520)
          r1_520.Font = Enum.Font.GothamSemibold
          r1_520.FontSize = "Size14"
          r1_520.TextWrapped = true
          r1_520.Size = UDim2.new(1, 0, 1, 0)
          r1_520.TextYAlignment = "Top"
          r1_520.BackgroundTransparency = 1
          r1_520.TextStrokeTransparency = 0.5
          r1_520.TextColor3 = Color3.fromRGB(255, 255, 255)
          r1_520.Text = r4_519.Name .. " \n" .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_519.Handle.Position)).Magnitude / 3) .. " Distance"
        else
          r4_519.Handle["NameEsp" .. Number].TextLabel.Text = r4_519.Name .. "   \n" .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_519.Handle.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_519.Handle:FindFirstChild("NameEsp" .. Number) then
        r4_519.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
      end
    end)
    -- close: r3_519
  end
end
function UpdateFlowerChams()
  -- line: [0, 0] id: 43
  for r3_43, r4_43 in pairs(game.Workspace:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 44
      if r4_43.Name == "Flower2" or r4_43.Name == "Flower1" then
        if FlowerESP then
          if not r4_43:FindFirstChild(("NameEsp" .. Number)) then
            local r0_44 = Instance.new("BillboardGui", r4_43)
            r0_44.Name = "NameEsp" .. Number
            r0_44.ExtentsOffset = Vector3.new(0, 1, 0)
            r0_44.Size = UDim2.new(1, 200, 1, 30)
            r0_44.Adornee = r4_43
            r0_44.AlwaysOnTop = true
            local r1_44 = Instance.new("TextLabel", r0_44)
            r1_44.Font = Enum.Font.GothamSemibold
            r1_44.FontSize = "Size14"
            r1_44.TextWrapped = true
            r1_44.Size = UDim2.new(1, 0, 1, 0)
            r1_44.TextYAlignment = "Top"
            r1_44.BackgroundTransparency = 1
            r1_44.TextStrokeTransparency = 0.5
            r1_44.TextColor3 = Color3.fromRGB(255, 0, 0)
            if r4_43.Name == "Flower1" then
              r1_44.Text = "Blue Flower" .. " \n" .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_43.Position)).Magnitude / 3) .. " Distance"
              r1_44.TextColor3 = Color3.fromRGB(0, 0, 255)
            end
            if r4_43.Name == "Flower2" then
              r1_44.Text = "Red Flower" .. " \n" .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_43.Position)).Magnitude / 3) .. " Distance"
              r1_44.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
          else
            r4_43["NameEsp" .. Number].TextLabel.Text = r4_43.Name .. "   \n" .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_43.Position)).Magnitude / 3) .. " Distance"
          end
        elseif r4_43:FindFirstChild("NameEsp" .. Number) then
          r4_43:FindFirstChild("NameEsp" .. Number):Destroy()
        end
      end
    end)
    -- close: r3_43
  end
end
function UpdateRealFruitChams()
  -- line: [0, 0] id: 363
  for r3_363, r4_363 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
    if r4_363:IsA("Tool") then
      if RealFruitESP then
        if not r4_363.Handle:FindFirstChild(("NameEsp" .. Number)) then
          local r5_363 = Instance.new("BillboardGui", r4_363.Handle)
          r5_363.Name = "NameEsp" .. Number
          r5_363.ExtentsOffset = Vector3.new(0, 1, 0)
          r5_363.Size = UDim2.new(1, 200, 1, 30)
          r5_363.Adornee = r4_363.Handle
          r5_363.AlwaysOnTop = true
          local r6_363 = Instance.new("TextLabel", r5_363)
          r6_363.Font = Enum.Font.GothamSemibold
          r6_363.FontSize = "Size14"
          r6_363.TextWrapped = true
          r6_363.Size = UDim2.new(1, 0, 1, 0)
          r6_363.TextYAlignment = "Top"
          r6_363.BackgroundTransparency = 1
          r6_363.TextStrokeTransparency = 0.5
          r6_363.TextColor3 = Color3.fromRGB(255, 0, 0)
          r6_363.Text = r4_363.Name .. " \n" .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_363.Handle.Position)).Magnitude / 3) .. " Distance"
        else
          r4_363.Handle["NameEsp" .. Number].TextLabel.Text = r4_363.Name .. " " .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_363.Handle.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_363.Handle:FindFirstChild("NameEsp" .. Number) then
        r4_363.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
      end
    end
  end
  for r3_363, r4_363 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
    if r4_363:IsA("Tool") then
      if RealFruitESP then
        if not r4_363.Handle:FindFirstChild(("NameEsp" .. Number)) then
          local r5_363 = Instance.new("BillboardGui", r4_363.Handle)
          r5_363.Name = "NameEsp" .. Number
          r5_363.ExtentsOffset = Vector3.new(0, 1, 0)
          r5_363.Size = UDim2.new(1, 200, 1, 30)
          r5_363.Adornee = r4_363.Handle
          r5_363.AlwaysOnTop = true
          local r6_363 = Instance.new("TextLabel", r5_363)
          r6_363.Font = Enum.Font.GothamSemibold
          r6_363.FontSize = "Size14"
          r6_363.TextWrapped = true
          r6_363.Size = UDim2.new(1, 0, 1, 0)
          r6_363.TextYAlignment = "Top"
          r6_363.BackgroundTransparency = 1
          r6_363.TextStrokeTransparency = 0.5
          r6_363.TextColor3 = Color3.fromRGB(255, 174, 0)
          r6_363.Text = r4_363.Name .. " \n" .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_363.Handle.Position)).Magnitude / 3) .. " Distance"
        else
          r4_363.Handle["NameEsp" .. Number].TextLabel.Text = r4_363.Name .. " " .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_363.Handle.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_363.Handle:FindFirstChild("NameEsp" .. Number) then
        r4_363.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
      end
    end
  end
  for r3_363, r4_363 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
    if r4_363:IsA("Tool") then
      if RealFruitESP then
        if not r4_363.Handle:FindFirstChild(("NameEsp" .. Number)) then
          local r5_363 = Instance.new("BillboardGui", r4_363.Handle)
          r5_363.Name = "NameEsp" .. Number
          r5_363.ExtentsOffset = Vector3.new(0, 1, 0)
          r5_363.Size = UDim2.new(1, 200, 1, 30)
          r5_363.Adornee = r4_363.Handle
          r5_363.AlwaysOnTop = true
          local r6_363 = Instance.new("TextLabel", r5_363)
          r6_363.Font = Enum.Font.GothamSemibold
          r6_363.FontSize = "Size14"
          r6_363.TextWrapped = true
          r6_363.Size = UDim2.new(1, 0, 1, 0)
          r6_363.TextYAlignment = "Top"
          r6_363.BackgroundTransparency = 1
          r6_363.TextStrokeTransparency = 0.5
          r6_363.TextColor3 = Color3.fromRGB(251, 255, 0)
          r6_363.Text = r4_363.Name .. " \n" .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_363.Handle.Position)).Magnitude / 3) .. " Distance"
        else
          r4_363.Handle["NameEsp" .. Number].TextLabel.Text = r4_363.Name .. " " .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_363.Handle.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_363.Handle:FindFirstChild("NameEsp" .. Number) then
        r4_363.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
      end
    end
  end
end
function UpdateIslandESP()
  -- line: [0, 0] id: 332
  for r3_332, r4_332 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 333
      if IslandESP and r4_332.Name ~= "Sea" then
        if not r4_332:FindFirstChild("NameEsp") then
          local r0_333 = Instance.new("BillboardGui", r4_332)
          r0_333.Name = "NameEsp"
          r0_333.ExtentsOffset = Vector3.new(0, 1, 0)
          r0_333.Size = UDim2.new(1, 200, 1, 30)
          r0_333.Adornee = r4_332
          r0_333.AlwaysOnTop = true
          local r1_333 = Instance.new("TextLabel", r0_333)
          r1_333.Font = "GothamBold"
          r1_333.FontSize = "Size14"
          r1_333.TextWrapped = true
          r1_333.Size = UDim2.new(1, 0, 1, 0)
          r1_333.TextYAlignment = "Top"
          r1_333.BackgroundTransparency = 1
          r1_333.TextStrokeTransparency = 0.5
          r1_333.TextColor3 = Color3.fromRGB(7, 236, 240)
        else
          r4_332.NameEsp.TextLabel.Text = r4_332.Name .. "   \n" .. r6_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_332.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_332:FindFirstChild("NameEsp") then
        r4_332:FindFirstChild("NameEsp"):Destroy()
      end
    end)
    -- close: r3_332
  end
end
function isnil(r0_252)
  -- line: [0, 0] id: 252
  return r0_252 == nil
end
local function r7_0(r0_67)
  -- line: [0, 0] id: 67
  return math.floor(tonumber(r0_67) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
  -- line: [0, 0] id: 109
  for r3_109, r4_109 in pairs(game:GetService("Players"):GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 110
      if not isnil(r4_109.Character) then
        if ESPPlayer then
          if not isnil(r4_109.Character.Head) and not r4_109.Character.Head:FindFirstChild(("NameEsp" .. Number)) then
            local r0_110 = Instance.new("BillboardGui", r4_109.Character.Head)
            r0_110.Name = "NameEsp" .. Number
            r0_110.ExtentsOffset = Vector3.new(0, 1, 0)
            r0_110.Size = UDim2.new(1, 200, 1, 30)
            r0_110.Adornee = r4_109.Character.Head
            r0_110.AlwaysOnTop = true
            local r1_110 = Instance.new("TextLabel", r0_110)
            r1_110.Font = Enum.Font.GothamSemibold
            r1_110.FontSize = "Size14"
            r1_110.TextWrapped = true
            r1_110.Text = r4_109.Name .. " \n" .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_109.Character.Head.Position)).Magnitude / 3) .. " Distance"
            r1_110.Size = UDim2.new(1, 0, 1, 0)
            r1_110.TextYAlignment = "Top"
            r1_110.BackgroundTransparency = 1
            r1_110.TextStrokeTransparency = 0.5
            if r4_109.Team == game.Players.LocalPlayer.Team then
              r1_110.TextColor3 = Color3.new(0, 255, 0)
            else
              r1_110.TextColor3 = Color3.new(255, 0, 0)
            end
          else
            r4_109.Character.Head["NameEsp" .. Number].TextLabel.Text = r4_109.Name .. " | " .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_109.Character.Head.Position)).Magnitude / 3) .. " Distance\nHealth : " .. r7_0(r4_109.Character.Humanoid.Health * 100 / r4_109.Character.Humanoid.MaxHealth) .. "%"
          end
        elseif r4_109.Character.Head:FindFirstChild("NameEsp" .. Number) then
          r4_109.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
        end
      end
    end)
    -- close: r3_109
  end
end
function UpdateChestChams()
  -- line: [0, 0] id: 322
  for r3_322, r4_322 in pairs(game.Workspace:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 323
      if string.find(r4_322.Name, "Chest") and r4_322:FindFirstChild("NameEsp" .. Number) then
        r4_322:FindFirstChild("NameEsp" .. Number):Destroy()
      end
      -- warn: not visited block [4, 5, 6, 7, 8, 9, 10]
      -- block#4:
      -- r0_323 = Instance.new("BillboardGui", _u0)
      -- r0_323.Name = "NameEsp" .. Number
      -- r0_323.ExtentsOffset = Vector3.new(0, 1, 0)
      -- r0_323.Size = UDim2.new(1, 200, 1, 30)
      -- r0_323.Adornee = _u0
      -- r0_323.AlwaysOnTop = true
      -- r1_323 = Instance.new("TextLabel", r0_323)
      -- r1_323.Font = Enum.Font.GothamSemibold
      -- r1_323.FontSize = "Size14"
      -- r1_323.TextWrapped = true
      -- r1_323.Size = UDim2.new(1, 0, 1, 0)
      -- r1_323.TextYAlignment = "Top"
      -- r1_323.BackgroundTransparency = 1
      -- r1_323.TextStrokeTransparency = 0.5
      -- if _u0.Name == "Chest1"
      -- block#5:
      -- r1_323.TextColor3 = Color3.fromRGB(109, 109, 109)
      -- r1_323.Text = "Chest 1" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
      -- block#6:
      -- if _u0.Name == "Chest2"
      -- block#7:
      -- r1_323.TextColor3 = Color3.fromRGB(173, 158, 21)
      -- r1_323.Text = "Chest 2" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
      -- block#8:
      -- if _u0.Name == "Chest3"
      -- block#9:
      -- r1_323.TextColor3 = Color3.fromRGB(85, 255, 255)
      -- r1_323.Text = "Chest 3" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
      -- goto label_214
      -- block#10:
      -- _u0["NameEsp" .. Number].TextLabel.Text = _u0.Name .. "   \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
      -- goto label_214
    end)
    -- close: r3_322
  end
end
function UpdateDevilChams()
  -- line: [0, 0] id: 380
  for r3_380, r4_380 in pairs(game.Workspace:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 381
      if DevilFruitESP and string.find(r4_380.Name, "Fruit") then
        if not r4_380.Handle:FindFirstChild(("NameEsp" .. Number)) then
          local r0_381 = Instance.new("BillboardGui", r4_380.Handle)
          r0_381.Name = "NameEsp" .. Number
          r0_381.ExtentsOffset = Vector3.new(0, 1, 0)
          r0_381.Size = UDim2.new(1, 200, 1, 30)
          r0_381.Adornee = r4_380.Handle
          r0_381.AlwaysOnTop = true
          local r1_381 = Instance.new("TextLabel", r0_381)
          r1_381.Font = Enum.Font.GothamSemibold
          r1_381.FontSize = "Size14"
          r1_381.TextWrapped = true
          r1_381.Size = UDim2.new(1, 0, 1, 0)
          r1_381.TextYAlignment = "Top"
          r1_381.BackgroundTransparency = 1
          r1_381.TextStrokeTransparency = 0.5
          r1_381.TextColor3 = Color3.fromRGB(255, 255, 255)
          r1_381.Text = r4_380.Name .. " \n" .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_380.Handle.Position)).Magnitude / 3) .. " Distance"
        else
          r4_380.Handle["NameEsp" .. Number].TextLabel.Text = r4_380.Name .. "   \n" .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_380.Handle.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_380.Handle:FindFirstChild("NameEsp" .. Number) then
        r4_380.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
      end
    end)
    -- close: r3_380
  end
end
function UpdateFlowerChams()
  -- line: [0, 0] id: 171
  for r3_171, r4_171 in pairs(game.Workspace:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 172
      if r4_171.Name == "Flower2" or r4_171.Name == "Flower1" then
        if FlowerESP then
          if not r4_171:FindFirstChild(("NameEsp" .. Number)) then
            local r0_172 = Instance.new("BillboardGui", r4_171)
            r0_172.Name = "NameEsp" .. Number
            r0_172.ExtentsOffset = Vector3.new(0, 1, 0)
            r0_172.Size = UDim2.new(1, 200, 1, 30)
            r0_172.Adornee = r4_171
            r0_172.AlwaysOnTop = true
            local r1_172 = Instance.new("TextLabel", r0_172)
            r1_172.Font = Enum.Font.GothamSemibold
            r1_172.FontSize = "Size14"
            r1_172.TextWrapped = true
            r1_172.Size = UDim2.new(1, 0, 1, 0)
            r1_172.TextYAlignment = "Top"
            r1_172.BackgroundTransparency = 1
            r1_172.TextStrokeTransparency = 0.5
            r1_172.TextColor3 = Color3.fromRGB(255, 0, 0)
            if r4_171.Name == "Flower1" then
              r1_172.Text = "Blue Flower" .. " \n" .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_171.Position)).Magnitude / 3) .. " Distance"
              r1_172.TextColor3 = Color3.fromRGB(0, 0, 255)
            end
            if r4_171.Name == "Flower2" then
              r1_172.Text = "Red Flower" .. " \n" .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_171.Position)).Magnitude / 3) .. " Distance"
              r1_172.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
          else
            r4_171["NameEsp" .. Number].TextLabel.Text = r4_171.Name .. "   \n" .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_171.Position)).Magnitude / 3) .. " Distance"
          end
        elseif r4_171:FindFirstChild("NameEsp" .. Number) then
          r4_171:FindFirstChild("NameEsp" .. Number):Destroy()
        end
      end
    end)
    -- close: r3_171
  end
end
function UpdateRealFruitChams()
  -- line: [0, 0] id: 511
  for r3_511, r4_511 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
    if r4_511:IsA("Tool") then
      if RealFruitESP then
        if not r4_511.Handle:FindFirstChild(("NameEsp" .. Number)) then
          local r5_511 = Instance.new("BillboardGui", r4_511.Handle)
          r5_511.Name = "NameEsp" .. Number
          r5_511.ExtentsOffset = Vector3.new(0, 1, 0)
          r5_511.Size = UDim2.new(1, 200, 1, 30)
          r5_511.Adornee = r4_511.Handle
          r5_511.AlwaysOnTop = true
          local r6_511 = Instance.new("TextLabel", r5_511)
          r6_511.Font = Enum.Font.GothamSemibold
          r6_511.FontSize = "Size14"
          r6_511.TextWrapped = true
          r6_511.Size = UDim2.new(1, 0, 1, 0)
          r6_511.TextYAlignment = "Top"
          r6_511.BackgroundTransparency = 1
          r6_511.TextStrokeTransparency = 0.5
          r6_511.TextColor3 = Color3.fromRGB(255, 0, 0)
          r6_511.Text = r4_511.Name .. " \n" .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_511.Handle.Position)).Magnitude / 3) .. " Distance"
        else
          r4_511.Handle["NameEsp" .. Number].TextLabel.Text = r4_511.Name .. " " .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_511.Handle.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_511.Handle:FindFirstChild("NameEsp" .. Number) then
        r4_511.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
      end
    end
  end
  for r3_511, r4_511 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
    if r4_511:IsA("Tool") then
      if RealFruitESP then
        if not r4_511.Handle:FindFirstChild(("NameEsp" .. Number)) then
          local r5_511 = Instance.new("BillboardGui", r4_511.Handle)
          r5_511.Name = "NameEsp" .. Number
          r5_511.ExtentsOffset = Vector3.new(0, 1, 0)
          r5_511.Size = UDim2.new(1, 200, 1, 30)
          r5_511.Adornee = r4_511.Handle
          r5_511.AlwaysOnTop = true
          local r6_511 = Instance.new("TextLabel", r5_511)
          r6_511.Font = Enum.Font.GothamSemibold
          r6_511.FontSize = "Size14"
          r6_511.TextWrapped = true
          r6_511.Size = UDim2.new(1, 0, 1, 0)
          r6_511.TextYAlignment = "Top"
          r6_511.BackgroundTransparency = 1
          r6_511.TextStrokeTransparency = 0.5
          r6_511.TextColor3 = Color3.fromRGB(255, 174, 0)
          r6_511.Text = r4_511.Name .. " \n" .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_511.Handle.Position)).Magnitude / 3) .. " Distance"
        else
          r4_511.Handle["NameEsp" .. Number].TextLabel.Text = r4_511.Name .. " " .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_511.Handle.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_511.Handle:FindFirstChild("NameEsp" .. Number) then
        r4_511.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
      end
    end
  end
  for r3_511, r4_511 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
    if r4_511:IsA("Tool") then
      if RealFruitESP then
        if not r4_511.Handle:FindFirstChild(("NameEsp" .. Number)) then
          local r5_511 = Instance.new("BillboardGui", r4_511.Handle)
          r5_511.Name = "NameEsp" .. Number
          r5_511.ExtentsOffset = Vector3.new(0, 1, 0)
          r5_511.Size = UDim2.new(1, 200, 1, 30)
          r5_511.Adornee = r4_511.Handle
          r5_511.AlwaysOnTop = true
          local r6_511 = Instance.new("TextLabel", r5_511)
          r6_511.Font = Enum.Font.GothamSemibold
          r6_511.FontSize = "Size14"
          r6_511.TextWrapped = true
          r6_511.Size = UDim2.new(1, 0, 1, 0)
          r6_511.TextYAlignment = "Top"
          r6_511.BackgroundTransparency = 1
          r6_511.TextStrokeTransparency = 0.5
          r6_511.TextColor3 = Color3.fromRGB(251, 255, 0)
          r6_511.Text = r4_511.Name .. " \n" .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_511.Handle.Position)).Magnitude / 3) .. " Distance"
        else
          r4_511.Handle["NameEsp" .. Number].TextLabel.Text = r4_511.Name .. " " .. r7_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_511.Handle.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_511.Handle:FindFirstChild("NameEsp" .. Number) then
        r4_511.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
      end
    end
  end
end
spawn(function()
  -- line: [0, 0] id: 41
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 42
      if MobESP then
        for r3_42, r4_42 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
          if r4_42:FindFirstChild("HumanoidRootPart") then
            if not r4_42:FindFirstChild("MobEap") then
              local r5_42 = Instance.new("BillboardGui")
              local r6_42 = Instance.new("TextLabel")
              r5_42.Parent = r4_42
              r5_42.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
              r5_42.Active = true
              r5_42.Name = "MobEap"
              r5_42.AlwaysOnTop = true
              r5_42.LightInfluence = 1
              r5_42.Size = UDim2.new(0, 200, 0, 50)
              r5_42.StudsOffset = Vector3.new(0, 2.5, 0)
              r6_42.Parent = r5_42
              r6_42.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              r6_42.BackgroundTransparency = 1
              r6_42.Size = UDim2.new(0, 200, 0, 50)
              r6_42.Font = Enum.Font.GothamBold
              r6_42.TextColor3 = Color3.fromRGB(7, 236, 240)
              r6_42.Text.Size = 35
            end
            r4_42.MobEap.TextLabel.Text = r4_42.Name .. "-" .. math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_42.HumanoidRootPart.Position).Magnitude) .. " Distance"
          end
        end
      else
        for r3_42, r4_42 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
          if r4_42:FindFirstChild("MobEap") then
            r4_42.MobEap:Destroy()
          end
        end
      end
    end)
  end
end)
spawn(function()
  -- line: [0, 0] id: 273
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 274
      if SeaESP then
        for r3_274, r4_274 in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
          if r4_274:FindFirstChild("HumanoidRootPart") then
            if not r4_274:FindFirstChild("Seaesps") then
              local r5_274 = Instance.new("BillboardGui")
              local r6_274 = Instance.new("TextLabel")
              r5_274.Parent = r4_274
              r5_274.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
              r5_274.Active = true
              r5_274.Name = "Seaesps"
              r5_274.AlwaysOnTop = true
              r5_274.LightInfluence = 1
              r5_274.Size = UDim2.new(0, 200, 0, 50)
              r5_274.StudsOffset = Vector3.new(0, 2.5, 0)
              r6_274.Parent = r5_274
              r6_274.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              r6_274.BackgroundTransparency = 1
              r6_274.Size = UDim2.new(0, 200, 0, 50)
              r6_274.Font = Enum.Font.GothamBold
              r6_274.TextColor3 = Color3.fromRGB(7, 236, 240)
              r6_274.Text.Size = 35
            end
            r4_274.Seaesps.TextLabel.Text = r4_274.Name .. "-" .. math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_274.HumanoidRootPart.Position).Magnitude) .. " Distance"
          end
        end
      else
        for r3_274, r4_274 in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
          if r4_274:FindFirstChild("Seaesps") then
            r4_274.Seaesps:Destroy()
          end
        end
      end
    end)
  end
end)
spawn(function()
  -- line: [0, 0] id: 143
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 144
      if NpcESP then
        for r3_144, r4_144 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
          if r4_144:FindFirstChild("HumanoidRootPart") then
            if not r4_144:FindFirstChild("NpcEspes") then
              local r5_144 = Instance.new("BillboardGui")
              local r6_144 = Instance.new("TextLabel")
              r5_144.Parent = r4_144
              r5_144.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
              r5_144.Active = true
              r5_144.Name = "NpcEspes"
              r5_144.AlwaysOnTop = true
              r5_144.LightInfluence = 1
              r5_144.Size = UDim2.new(0, 200, 0, 50)
              r5_144.StudsOffset = Vector3.new(0, 2.5, 0)
              r6_144.Parent = r5_144
              r6_144.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              r6_144.BackgroundTransparency = 1
              r6_144.Size = UDim2.new(0, 200, 0, 50)
              r6_144.Font = Enum.Font.GothamBold
              r6_144.TextColor3 = Color3.fromRGB(7, 236, 240)
              r6_144.Text.Size = 35
            end
            r4_144.NpcEspes.TextLabel.Text = r4_144.Name .. "-" .. math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_144.HumanoidRootPart.Position).Magnitude) .. " Distance"
          end
        end
      else
        for r3_144, r4_144 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
          if r4_144:FindFirstChild("NpcEspes") then
            r4_144.NpcEspes:Destroy()
          end
        end
      end
    end)
  end
end)
function isnil(r0_22)
  -- line: [0, 0] id: 22
  return r0_22 == nil
end
local function r8_0(r0_277)
  -- line: [0, 0] id: 277
  return math.floor(tonumber(r0_277) + 0.5)
end
Number = math.random(1, 1000000)
function UpdateIslandMirageESP()
  -- line: [0, 0] id: 9
  for r3_9, r4_9 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 10
      if MirageIslandESP and r4_9.Name == "Mirage Island" then
        if not r4_9:FindFirstChild("NameEsp") then
          local r0_10 = Instance.new("BillboardGui", r4_9)
          r0_10.Name = "NameEsp"
          r0_10.ExtentsOffset = Vector3.new(0, 1, 0)
          r0_10.Size = UDim2.new(1, 200, 1, 30)
          r0_10.Adornee = r4_9
          r0_10.AlwaysOnTop = true
          local r1_10 = Instance.new("TextLabel", r0_10)
          r1_10.Font = "Code"
          r1_10.FontSize = "Size14"
          r1_10.TextWrapped = true
          r1_10.Size = UDim2.new(1, 0, 1, 0)
          r1_10.TextYAlignment = "Top"
          r1_10.BackgroundTransparency = 1
          r1_10.TextStrokeTransparency = 0.5
          r1_10.TextColor3 = Color3.fromRGB(80, 245, 245)
        else
          r4_9.NameEsp.TextLabel.Text = r4_9.Name .. "   \n" .. r8_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_9.Position)).Magnitude / 3) .. " M"
        end
      elseif r4_9:FindFirstChild("NameEsp") then
        r4_9:FindFirstChild("NameEsp"):Destroy()
      end
    end)
    -- close: r3_9
  end
end
function UpdateAuraESP()
  -- line: [0, 0] id: 11
  for r3_11, r4_11 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 12
      if AuraESP and r4_11.Name == "Master of Enhancement" then
        if not r4_11:FindFirstChild("NameEsp") then
          local r0_12 = Instance.new("BillboardGui", r4_11)
          r0_12.Name = "NameEsp"
          r0_12.ExtentsOffset = Vector3.new(0, 1, 0)
          r0_12.Size = UDim2.new(1, 200, 1, 30)
          r0_12.Adornee = r4_11
          r0_12.AlwaysOnTop = true
          local r1_12 = Instance.new("TextLabel", r0_12)
          r1_12.Font = "Code"
          r1_12.FontSize = "Size14"
          r1_12.TextWrapped = true
          r1_12.Size = UDim2.new(1, 0, 1, 0)
          r1_12.TextYAlignment = "Top"
          r1_12.BackgroundTransparency = 1
          r1_12.TextStrokeTransparency = 0.5
          r1_12.TextColor3 = Color3.fromRGB(80, 245, 245)
        else
          r4_11.NameEsp.TextLabel.Text = r4_11.Name .. "   \n" .. r8_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_11.Position)).Magnitude / 3) .. " M"
        end
      elseif r4_11:FindFirstChild("NameEsp") then
        r4_11:FindFirstChild("NameEsp"):Destroy()
      end
    end)
    -- close: r3_11
  end
end
function UpdateLSDESP()
  -- line: [0, 0] id: 213
  for r3_213, r4_213 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 214
      if LADESP and r4_213.Name == "Legendary Sword Dealer" then
        if not r4_213:FindFirstChild("NameEsp") then
          local r0_214 = Instance.new("BillboardGui", r4_213)
          r0_214.Name = "NameEsp"
          r0_214.ExtentsOffset = Vector3.new(0, 1, 0)
          r0_214.Size = UDim2.new(1, 200, 1, 30)
          r0_214.Adornee = r4_213
          r0_214.AlwaysOnTop = true
          local r1_214 = Instance.new("TextLabel", r0_214)
          r1_214.Font = "Code"
          r1_214.FontSize = "Size14"
          r1_214.TextWrapped = true
          r1_214.Size = UDim2.new(1, 0, 1, 0)
          r1_214.TextYAlignment = "Top"
          r1_214.BackgroundTransparency = 1
          r1_214.TextStrokeTransparency = 0.5
          r1_214.TextColor3 = Color3.fromRGB(80, 245, 245)
        else
          r4_213.NameEsp.TextLabel.Text = r4_213.Name .. "   \n" .. r8_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_213.Position)).Magnitude / 3) .. " M"
        end
      elseif r4_213:FindFirstChild("NameEsp") then
        r4_213:FindFirstChild("NameEsp"):Destroy()
      end
    end)
    -- close: r3_213
  end
end
function UpdateGeaESP()
  -- line: [0, 0] id: 206
  for r3_206, r4_206 in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 207
      if GearESP and r4_206.Name == "MeshPart" then
        if not r4_206:FindFirstChild("NameEsp") then
          local r0_207 = Instance.new("BillboardGui", r4_206)
          r0_207.Name = "NameEsp"
          r0_207.ExtentsOffset = Vector3.new(0, 1, 0)
          r0_207.Size = UDim2.new(1, 200, 1, 30)
          r0_207.Adornee = r4_206
          r0_207.AlwaysOnTop = true
          local r1_207 = Instance.new("TextLabel", r0_207)
          r1_207.Font = "Code"
          r1_207.FontSize = "Size14"
          r1_207.TextWrapped = true
          r1_207.Size = UDim2.new(1, 0, 1, 0)
          r1_207.TextYAlignment = "Top"
          r1_207.BackgroundTransparency = 1
          r1_207.TextStrokeTransparency = 0.5
          r1_207.TextColor3 = Color3.fromRGB(80, 245, 245)
        else
          r4_206.NameEsp.TextLabel.Text = r4_206.Name .. "   \n" .. r8_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_206.Position)).Magnitude / 3) .. " M"
        end
      elseif r4_206:FindFirstChild("NameEsp") then
        r4_206:FindFirstChild("NameEsp"):Destroy()
      end
    end)
    -- close: r3_206
  end
end
function Tween2(r0_525)
  -- line: [0, 0] id: 525
  local r1_525 = (r0_525.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
  local r2_525 = 350
  local r4_525 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(r1_525 / r2_525, Enum.EasingStyle.Linear), {
    CFrame = r0_525,
  })
  r4_525:Play()
  if _G.StopTween2 then
    r4_525:Cancel()
  end
  _G.Clip2 = true
  wait(r1_525 / r2_525)
  _G.Clip2 = false
end
function BKP(r0_100)
  -- line: [0, 0] id: 100
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_100
  task.wait()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_100
end
TweenSpeed = 350
function Tween(r0_526)
  -- line: [0, 0] id: 526
  local r4_526 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(((r0_526.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position)).Magnitude / TweenSpeed, Enum.EasingStyle.Linear), {
    CFrame = r0_526,
  })
  r4_526:Play()
  if _G.StopTween then
    r4_526:Cancel()
  end
end
function EquipTool(r0_13)
  -- line: [0, 0] id: 13
  if game.Players.LocalPlayer.Backpack:FindFirstChild(r0_13) then
    local r1_13 = game.Players.LocalPlayer.Backpack:FindFirstChild(r0_13)
    wait()
    game.Players.LocalPlayer.Character.Humanoid:EquipTool(r1_13)
  end
end
spawn(function()
  -- line: [0, 0] id: 20
  while task.wait() do
    pcall(function()
      -- line: [0, 0] id: 21
      if _G.AutoEvoRace or _G.CastleRaid or _G.CollectAzure or _G.TweenToKitsune or _G.GhostShip or _G.Ship or _G.Auto_Holy_Torch or _G.TeleportPly or _G.Auto_Sea3 or _G.Auto_Sea2 or _G.Tweenfruit or _G.AutoFishCrew or _G.Auto_Saber or _G.AutoShark or _G.Auto_Warden or _G.Auto_RainbowHaki or AutoFarmRace or _G.AutoQuestRace or Auto_Law or AutoTushita or _G.AutoHolyTorch or _G.AutoTerrorshark or _G.farmpiranya or _G.Auto_MusketeerHat or _G.Auto_ObservationV2 or _G.AutoNear or _G.Auto_PoleV1 or _G.Auto_Buddy or _G.Ectoplasm or AutoEvoRace or AutoBartilo or _G.Auto_Canvander or _G.AutoLevel or _G.Auto_DualKatana or Auto_Quest_Yama_3 or Auto_Quest_Yama_2 or Auto_Quest_Yama_1 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or _G.Clip2 or _G.Auto_Regoku or _G.AutoBone or _G.AutoBoneNoQuest or _G.AutoBoss or AutoFarmMasDevilFruit or AutoFarmMasGun or AutoHallowSycthe or AutoTushita or _G.Cake or _G.Auto_SkullGuitar or _G.AutoFarmSwan or _G.AutoEliteor or AutoNextIsland or Musketeer or _G.AutoMaterial or AutoFarmRaceQuest or _G.Factory or _G.Auto_Saw or _G.AutoFrozenDimension or _G.AutoKillTrial or _G.AutoUpgrade or _G.TweenToFrozenDimension then
        if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
          local r0_21 = Instance.new("BodyVelocity")
          r0_21.Name = "BodyClip"
          r0_21.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
          r0_21.MaxForce = Vector3.new(100000, 100000, 100000)
          r0_21.Velocity = Vector3.new(0, 0, 0)
        end
      else
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
      end
    end)
  end
end)
spawn(function()
  -- line: [0, 0] id: 552
  pcall(function()
    -- line: [0, 0] id: 553
    game:GetService("RunService").Stepped:Connect(function()
      -- line: [0, 0] id: 554
      if _G.AutoEvoRace or _G.Auto_RainbowHaki or _G.Auto_SkullGuitar or _G.CastleRaid or _G.CollectAzure or _G.TweenToKitsune or _G.Auto_Sea3 or _G.Auto_Sea2 or _G.GhostShip or _G.Ship or _G.Auto_Holy_Torch or _G.TeleportPly or _G.Tweenfruit or _G.Auto_Saber or _G.Auto_PoleV1 or _G.Auto_MusketeerHat or _G.AutoFishCrew or _G.AutoShark or AutoFarmRace or _G.AutoQuestRace or _G.Auto_Warden or Auto_Law or _G.Auto_DualKatana or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or AutoTushita or _G.AutoHolyTorch or _G.Auto_Buddy or _G.AutoTerrorshark or _G.farmpiranya or Auto_Quest_Yama_3 or _G.Auto_ObservationV2 or Auto_Quest_Yama_2 or Auto_Quest_Yama_1 or _G.AutoNear or _G.Ectoplasm or AutoEvoRace or _G.AutoKillTrial or AutoBartilo or AutoFarmMasGun or _G.Auto_Regoku or _G.AutoLevel or _G.Clip2 or _G.AutoBone or _G.Auto_Canvander or _G.AutoBoneNoQuest or _G.AutoBoss or _G.Auto_Saw or AutoFarmMasDevilFruit or AutoHallowSycthe or AutoTushita or _G.Cake or _G.AutoFarmSwan or _G.AutoEliteor or AutoNextIsland or Musketeer or _G.AutoMaterial or _G.Factory or _G.AutoFrozenDimension or AutoFarmRaceQuest or _G.AutoUpgrade or _G.TweenToFrozenDimension then
        for r3_554, r4_554 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
          if r4_554:IsA("BasePart") then
            r4_554.CanCollide = false
          end
        end
      end
    end)
  end)
end)
task.spawn(function()
  -- line: [0, 0] id: 342
  if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
    game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
      -- line: [0, 0] id: 343
      pcall(function()
        -- line: [0, 0] id: 344
        if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
          game.Players.LocalPlayer.Character.Stun.Value = 0
        end
      end)
    end)
  end
end)
function CheckMaterial(r0_492)
  -- line: [0, 0] id: 492
  for r4_492, r5_492 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
    if type(r5_492) == "table" and r5_492.Type == "Material" and r5_492.Name == r0_492 then
      return r5_492.Count
    end
  end
  return 0
end
function GetWeaponInventory(r0_90)
  -- line: [0, 0] id: 90
  for r4_90, r5_90 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
    if type(r5_90) == "table" and r5_90.Type == "Sword" and r5_90.Name == r0_90 then
      return true
    end
  end
  return false
end
local r9_0 = game.Players.LocalPlayer
function AttackNoCoolDown()
  -- line: [0, 0] id: 386
  local r0_386 = r9_0.Character
  if not r0_386 then
    return 
  end
  local r1_386 = nil
  for r5_386, r6_386 in ipairs(r0_386:GetChildren()) do
    if r6_386:IsA("Tool") then
      r1_386 = r6_386
      break
    end
  end
  if not r1_386 then
    return 
  end
  local function r2_386(r0_389)
    -- line: [0, 0] id: 389
    return r0_389 and r0_389:FindFirstChild("Humanoid") and 0 < r0_389.Humanoid.Health
  end
  local function r3_386(r0_387)
    -- line: [0, 0] id: 387
    local r1_387 = game:GetService("Workspace").Enemies:GetChildren()
    local r2_387 = {}
    local r3_387 = r0_386:GetPivot().Position
    for r7_387, r8_387 in ipairs(r1_387) do
      local r9_387 = r8_387:FindFirstChild("HumanoidRootPart")
      if r9_387 and r2_386(r8_387) and (r9_387.Position - r3_387).Magnitude <= r0_387 then
        table.insert(r2_387, r8_387)
      end
    end
    return r2_387
  end
  local r4_386 = r1_386:FindFirstChild("LeftClickRemote")
  if r4_386 then
    r4_386 = 1
    for r9_386, r10_386 in ipairs(r3_386(60)) do
      local r11_386 = (r10_386.HumanoidRootPart.Position - r0_386:GetPivot().Position).Unit
      pcall(function()
        -- line: [0, 0] id: 388
        r1_386.LeftClickRemote:FireServer(r11_386, r4_386)
      end)
      r4_386 = r4_386 + 1
      if r4_386 > 1000000000 then
        r4_386 = 1
      end
      -- close: r11_386
    end
    -- close: r4_386
  else
    r4_386 = {}
    local r5_386 = game:GetService("Workspace").Enemies:GetChildren()
    local r6_386 = r0_386:GetPivot().Position
    local r7_386 = nil
    for r11_386, r12_386 in ipairs(r5_386) do
      if not r12_386:GetAttribute("IsBoat") and r2_386(r12_386) then
        local r13_386 = r12_386:FindFirstChild("Head")
        if r13_386 and (r6_386 - r13_386.Position).Magnitude <= 60 then
          table.insert(r4_386, {
            r12_386,
            r13_386
          })
          r7_386 = r13_386
        end
      end
    end
    if not r7_386 then
      return 
    end
    pcall(function()
      -- line: [0, 0] id: 390
      local r0_390 = game:GetService("ReplicatedStorage")
      local r1_390 = r0_390:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
      local r2_390 = r0_390:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
      if #r4_386 > 0 then
        r1_390:FireServer(0.000000001)
        r2_390:FireServer(r7_386, r4_386)
      else
        task.wait(0.000000001)
      end
    end)
    -- close: r4_386
  end
end
Type = 1
spawn(function()
  -- line: [0, 0] id: 129
  while wait() do
    local r0_129 = Type
    if r0_129 == 1 then
      r0_129 = CFrame.new(0, 20, 0)
      Pos = r0_129
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 84
  while wait() do
    local r0_84 = 1
    Type = r0_84
  end
end)
function AutoHaki()
  -- line: [0, 0] id: 434
  if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
  end
end
function to(r0_167)
  -- line: [0, 0] id: 167
  repeat
    wait(_G.Fast_Delay)
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_167
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_167
  until (r0_167.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
end
function to(r0_162)
  -- line: [0, 0] id: 162
  pcall(function()
    -- line: [0, 0] id: 163
    if 2000 <= (r0_162.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude and not Auto_Raid and 0 < game.Players.LocalPlayer.Character.Humanoid.Health then
      if NameMon == "FishmanQuest" then
        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
      elseif Mon == "God\'s Guard" then
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
        while true do
          wait(_G.Fast_Delay)
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_162
          wait(0.05)
          game.Players.LocalPlayer.Character.Head:Destroy()
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_162
          if (r0_162.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2500 then
            local r0_163 = game.Players.LocalPlayer.Character.Humanoid.Health
            if r0_163 > 0 then
              break
            end
          end
        end
        wait()
      end
    end
  end)
end
local r10_0 = Instance.new("ScreenGui")
local r11_0 = Instance.new("ImageButton")
local r12_0 = Instance.new("UICorner")
local r13_0 = Instance.new("ParticleEmitter")
local r14_0 = game:GetService("TweenService")
r10_0.Parent = game.CoreGui
r10_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
r11_0.Parent = r10_0
r11_0.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
r11_0.BorderSizePixel = 0
r11_0.Position = UDim2.new(0.020833336999999993, 0, 0.10528908129999999, 0)
r11_0.Size = UDim2.new(0, 50, 0, 50)
r11_0.Draggable = true
r11_0.Image = "http://www.roblox.com/asset/?id=98977023494737"
r12_0.Parent = r11_0
r12_0.CornerRadius = UDim.new(1, 10)
r13_0.Parent = r11_0
r13_0.LightEmission = 1
r13_0.Size = NumberSequence.new({
  NumberSequenceKeypoint.new(0, 0.1),
  NumberSequenceKeypoint.new(1, 0)
})
r13_0.Lifetime = NumberRange.new(0.5, 1)
r13_0.Rate = 0
r13_0.Speed = NumberRange.new(5, 10)
r13_0.Color = ColorSequence.new(Color3.fromRGB(255, 85, 255), Color3.fromRGB(85, 255, 255))
local r17_0 = "Create"
r17_0 = r11_0
local r15_0 = r14_0:[r17_0](r17_0, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
  Rotation = 0,
})
local r18_0 = "Connect"
function r18_0()
  -- line: [0, 0] id: 352
  r13_0.Rate = 100
  task.delay(1, function()
    -- line: [0, 0] id: 353
    r13_0.Rate = 0
  end)
  r15_0:Play()
  game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
  r15_0.Completed:Connect(function()
    -- line: [0, 0] id: 355
    r11_0.Rotation = 0
  end)
  local r0_352 = r14_0:Create(r11_0, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 60, 0, 60),
  })
  r0_352:Play()
  r0_352.Completed:Connect(function()
    -- line: [0, 0] id: 354
    r14_0:Create(r11_0, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
      Size = UDim2.new(0, 50, 0, 50),
    }):Play()
  end)
end
r11_0.MouseButton1Down:[r18_0](r18_0)
task.defer(function()
  -- line: [0, 0] id: 370
  if game:GetService("ReplicatedStorage"):FindFirstChild("Effect") and game:GetService("ReplicatedStorage").Effect:FindFirstChild("Container") and game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
    local r0_370 = require(game:GetService("ReplicatedStorage").Effect.Container.Death)
    local r1_370 = require(game:GetService("ReplicatedStorage").Util.CameraShaker)
    if r1_370 then
      r1_370:Stop()
    end
    if hookfunction then
      hookfunction(r0_370, function(...)
        -- line: [0, 0] id: 371
        return ...
      end)
    end
  end
end)
r18_0 = "AddButton"
r18_0 = {
  Title = "Monster Hub",
  Description = "Discord",
  Callback = function()
    -- line: [0, 0] id: 77
    setclipboard(tostring("https://discord.gg/hackercommunity"))
  end,
}
r2_0.Info:[r18_0](r18_0)
r18_0 = "AddButton"
r18_0 = {
  Title = "Monster Roblox",
  Description = "Youtube",
  Callback = function()
    -- line: [0, 0] id: 99
    setclipboard(tostring("https://youtube.com/@monster_mythic?si=V4mZqAJWeaQLg2nQ"))
  end,
}
r2_0.Info:[r18_0](r18_0)
r18_0 = "AddButton"
r18_0 = {
  Title = "Monster Roblox",
  Description = "Tiktok",
  Callback = function()
    -- line: [0, 0] id: 222
    setclipboard(tostring("https://www.tiktok.com/@monster_roblox123?_t=ZS-8uVGjEToZmL&_r=1"))
  end,
}
r2_0.Info:[r18_0](r18_0)
r18_0 = "AddParagraph"
r18_0 = {
  Title = "Phát triển Monster",
  Content = "Kĩ Năng: Del có",
}
r2_0.Info:[r18_0](r18_0)
local r16_0 = nil
if identifyexecutor then
  r16_0 = identifyexecutor()
elseif getexecutorname then
  r16_0 = getexecutorname()
end
if r16_0 then
  local r19_0 = "AddParagraph"
  r19_0 = {
    Title = "Client Đang Dùng",
    Content = r16_0,
  }
  r2_0.Info:[r19_0](r19_0)
end
local r19_0 = "AddParagraph"
r19_0 = {
  Title = "Cập Nhật",
  Content = "Tôi sẽ Cập nhật nhiều tính năng hơn trong tương lai",
}
r2_0.Info:[r19_0](r19_0)
r19_0 = "AddParagraph"
r19_0 = {
  Title = "Các Client Android và Ios Hỗ Trợ",
  Content = "Tất Cả Client Android và Ios ",
}
r2_0.Info:[r19_0](r19_0)
r19_0 = "AddParagraph"
r19_0 = {
  Title = "Các Client Pc Hỗ Trợ",
  Content = "Tất Cả Client Pc",
}
r2_0.Info:[r19_0](r19_0)
_G.FastAttackStrix_Mode = "Super Fast Attack"
spawn(function()
  -- line: [0, 0] id: 119
  while wait() do
    local r0_119 = _G.FastAttackStrix_Mode
    if r0_119 then
      pcall(function()
        -- line: [0, 0] id: 120
        if _G.FastAttackStrix_Mode == "Super Fast Attack" then
          _G.Fast_Delay = 0.000000001
        end
      end)
    end
  end
end)
r17_0 = r2_0.Main
r19_0 = "AddDropdown"
r19_0 = "DropdownSelectWeapon"
r17_0 = r17_0:[r19_0](r19_0, {
  Title = "Chọn Vũ Khí",
  Description = "",
  Values = {
    "Melee",
    "Sword",
    "Blox Fruit"
  },
  Multi = false,
  Default = 1,
})
local r20_0 = "SetValue"
r20_0 = "Melee"
r17_0:[r20_0](r20_0)
r20_0 = "OnChanged"
function r20_0(r0_438)
  -- line: [0, 0] id: 438
  ChooseWeapon = r0_438
end
r17_0:[r20_0](r20_0)
task.spawn(function()
  -- line: [0, 0] id: 157
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 158
      if ChooseWeapon == "Melee" then
        for r3_158, r4_158 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if r4_158.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(r4_158.Name)) then
            SelectWeapon = r4_158.Name
          end
        end
      elseif ChooseWeapon == "Sword" then
        for r3_158, r4_158 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if r4_158.ToolTip == "Sword" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(r4_158.Name)) then
            SelectWeapon = r4_158.Name
          end
        end
      elseif ChooseWeapon == "Blox Fruit" then
        for r3_158, r4_158 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if r4_158.ToolTip == "Blox Fruit" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(r4_158.Name)) then
            SelectWeapon = r4_158.Name
          end
        end
      end
    end)
  end
end)
r20_0 = "AddToggle"
r20_0 = "ToggleLevel"
r18_0 = r2_0.Main:[r20_0](r20_0, {
  Title = "Cày Cấp",
  Description = "",
  Default = false,
})
local r21_0 = "OnChanged"
function r21_0(r0_345)
  -- line: [0, 0] id: 345
  _G.AutoLevel = r0_345
  if r0_345 == false then
    wait()
    Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
  end
end
r18_0:[r21_0](r21_0)
r21_0 = "SetValue"
r21_0 = false
r3_0.ToggleLevel:[r21_0](r21_0)
spawn(function()
  -- line: [0, 0] id: 575
  while task.wait() do
    local r0_575 = _G.AutoLevel
    if r0_575 then
      pcall(function()
        -- line: [0, 0] id: 576
        CheckLevel()
        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
          Tween(CFrameQ)
          if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
          end
        elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
          for r3_576, r4_576 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_576:FindFirstChild("Humanoid") and r4_576:FindFirstChild("HumanoidRootPart") and 0 < r4_576.Humanoid.Health and r4_576.Name == Ms then
              while true do
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                bringmob = true
                AutoHaki()
                EquipTool(SelectWeapon)
                Tween(r4_576.HumanoidRootPart.CFrame * Pos)
                r4_576.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_576.HumanoidRootPart.Transparency = 1
                r4_576.Humanoid.JumpPower = 0
                r4_576.Humanoid.WalkSpeed = 0
                r4_576.HumanoidRootPart.CanCollide = false
                FarmPos = r4_576.HumanoidRootPart.CFrame
                MonFarm = r4_576.Name
                if _G.AutoLevel then
                  local r5_576 = r4_576.Parent
                  if r5_576 then
                    r5_576 = r4_576.Humanoid.Health
                    if r5_576 > 0 then
                      r5_576 = game:GetService("Workspace").Enemies:FindFirstChild(r4_576.Name)
                      if r5_576 then
                        r5_576 = game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible
                        if r5_576 == false then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
              bringmob = false
            end
          end
          for r3_576, r4_576 in pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren()) do
            if string.find(r4_576.Name, NameMon) and 10 <= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_576.Position).Magnitude then
              Tween(r4_576.HumanoidRootPart.CFrame * Pos)
            end
          end
        end
      end)
    end
  end
end)
r21_0 = "AddToggle"
r21_0 = "ToggleMobAura"
r19_0 = r2_0.Main:[r21_0](r21_0, {
  Title = " ánh Quái Ở Gần",
  Description = "",
  Default = false,
})
local r22_0 = "OnChanged"
function r22_0(r0_586)
  -- line: [0, 0] id: 586
  _G.AutoNear = r0_586
  if r0_586 == false then
    wait()
    Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
  end
end
r19_0:[r22_0](r22_0)
r22_0 = "SetValue"
r22_0 = false
r3_0.ToggleMobAura:[r22_0](r22_0)
spawn(function()
  -- line: [0, 0] id: 300
  while wait() do
    local r0_300 = _G.AutoNear
    if r0_300 then
      pcall(function()
        -- line: [0, 0] id: 301
        for r3_301, r4_301 in pairs(game.Workspace.Enemies:GetChildren()) do
          if r4_301:FindFirstChild("Humanoid") and r4_301:FindFirstChild("HumanoidRootPart") and 0 < r4_301.Humanoid.Health and r4_301.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_301:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
            while true do
              wait(_G.Fast_Delay)
              AttackNoCoolDown()
              bringmob = true
              AutoHaki()
              EquipTool(SelectWeapon)
              Tween(r4_301.HumanoidRootPart.CFrame * Pos)
              r4_301.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              r4_301.HumanoidRootPart.Transparency = 1
              r4_301.Humanoid.JumpPower = 0
              r4_301.Humanoid.WalkSpeed = 0
              r4_301.HumanoidRootPart.CanCollide = false
              FarmPos = r4_301.HumanoidRootPart.CFrame
              MonFarm = r4_301.Name
              if _G.AutoNear then
                local r5_301 = r4_301.Parent
                if r5_301 then
                  r5_301 = r4_301.Humanoid.Health
                  if r5_301 > 0 then
                    r5_301 = game.Workspace.Enemies:FindFirstChild(r4_301.Name)
                    if not r5_301 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            bringmob = false
          end
        end
      end)
    end
  end
end)
r22_0 = "AddToggle"
r22_0 = "ToggleCastleRaid"
r20_0 = r2_0.Main:[r22_0](r22_0, {
  Title = " ánh Hải Tặc",
  Description = "",
  Default = false,
})
local r23_0 = "OnChanged"
function r23_0(r0_448)
  -- line: [0, 0] id: 448
  _G.CastleRaid = r0_448
end
r20_0:[r23_0](r23_0)
r23_0 = "SetValue"
r23_0 = false
r3_0.ToggleCastleRaid:[r23_0](r23_0)
spawn(function()
  -- line: [0, 0] id: 270
  while wait() do
    local r0_270 = _G.CastleRaid
    if r0_270 then
      pcall(function()
        -- line: [0, 0] id: 271
        local r0_271 = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 0.00000000737058015, 0.380223751, 0.000000035881019, 1, -0.000000106665446, -0.380223751, 0.000000112297109, 0.924894512)
        if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
          for r4_271, r5_271 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _G.CastleRaid and r5_271:FindFirstChild("HumanoidRootPart") and r5_271:FindFirstChild("Humanoid") and 0 < r5_271.Humanoid.Health and (r5_271.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
              while true do
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                AutoHaki()
                EquipTool(SelectWeapon)
                r5_271.HumanoidRootPart.CanCollide = false
                r5_271.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                Tween(r5_271.HumanoidRootPart.CFrame * Pos)
                if r5_271.Humanoid.Health > 0 then
                  local r6_271 = r5_271.Parent
                  if r6_271 then
                    r6_271 = _G.CastleRaid
                    if not r6_271 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        else
          Tween(r0_271)
        end
      end)
    end
  end
end)
r23_0 = "AddToggle"
r23_0 = "ToggleHakiFortress"
r21_0 = r2_0.Main:[r23_0](r23_0, {
  Title = "Bật Haki Màu Pháo Đài",
  Description = "",
  Default = false,
})
local r24_0 = "OnChanged"
function r24_0(r0_76)
  -- line: [0, 0] id: 76
  _G.EnableHakiFortress = r0_76
end
r21_0:[r24_0](r24_0)
r24_0 = "SetValue"
r24_0 = false
r3_0.ToggleHakiFortress:[r24_0](r24_0)
function r22_0(r0_535, r1_535)
  -- line: [0, 0] id: 535
  game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/FruitCustomizerRF"):InvokeServer(unpack({
    [1] = {
      StorageName = r0_535,
      Type = "AuraSkin",
      Context = "Equip",
    },
  }))
  Tween2(r1_535)
end
function r23_0(r0_40, r1_40)
  -- line: [0, 0] id: 40
  local r2_40 = game.Players.LocalPlayer.Character
  if not r2_40 or not r2_40:FindFirstChild("HumanoidRootPart") then
    return false
  end
  return (r2_40.HumanoidRootPart.Position - r0_40).Magnitude < r1_40
end
spawn(function()
  -- line: [0, 0] id: 193
  -- notice: unreachable block#12
  while true do
    if _G.EnableHakiFortress then
      r22_0("Snow White", Vector3.new(-4971.71826171875, 335.9582214355469, -3720.0595703125))
      while true do
        local r0_193 = r23_0(Vector3.new(-4971.71826171875, 335.9582214355469, -3720.0595703125), 1)
        if not r0_193 then
          wait(0.1)
        else
          break
        end
      end
      wait(0.5)
      r22_0("Pure Red", Vector3.new(-5414.92041015625, 314.2582092285156, -2212.20166015625))
      while true do
        local r0_193 = r23_0(Vector3.new(-5414.92041015625, 314.2582092285156, -2212.20166015625), 1)
        if not r0_193 then
          wait(0.1)
        else
          break
        end
      end
      wait(0.5)
      r22_0("Winter Sky", Vector3.new(-5420.26318359375, 1089.3582763671875, -2666.8193359375))
      while true do
        local r0_193 = r23_0(Vector3.new(-5420.26318359375, 1089.3582763671875, -2666.8193359375), 1)
        if not r0_193 then
          wait(0.1)
        else
          break
        end
      end
      wait(0.5)
      local r0_193 = _G
      r0_193.EnableHakiFortress = false
    end
    wait(0.5)
  end
end)
local r26_0 = "AddToggle"
r26_0 = "ToggleCollectChest"
r24_0 = r2_0.Main:[r26_0](r26_0, {
  Title = "Lụm Rương",
  Description = "",
  Default = false,
})
local r27_0 = "OnChanged"
function r27_0(r0_365)
  -- line: [0, 0] id: 365
  _G.AutoCollectChest = r0_365
end
r24_0:[r27_0](r27_0)
spawn(function()
  -- line: [0, 0] id: 394
  while wait() do
    local r0_394 = _G.AutoCollectChest
    if r0_394 then
      r0_394 = game:GetService("Players")
      local r1_394 = r0_394.LocalPlayer
      local r3_394 = (r1_394.Character or r1_394.CharacterAdded:Wait()):GetPivot().Position
      local r5_394 = game:GetService("CollectionService"):GetTagged("_ChestTagged")
      local r6_394 = math.huge
      local r7_394 = nil
      for r11_394 = 1, #r5_394, 1 do
        local r12_394 = r5_394[r11_394]
        local r13_394 = (r12_394:GetPivot().Position - r3_394).Magnitude
        if not r12_394:GetAttribute("IsDisabled") and r13_394 < r6_394 then
          r7_394 = r12_394
          r6_394 = r13_394
        end
      end
      if r7_394 then
        Tween2(CFrame.new(r7_394:GetPivot().Position))
      end
    end
  end
end)
r27_0 = "AddToggle"
r27_0 = "ToggleCollectBerry"
local r25_0 = r2_0.Main:[r27_0](r27_0, {
  Title = "Bay Đến Khu Vực Có Berry + Hop",
  Description = "",
  Default = false,
})
local r28_0 = "OnChanged"
function r28_0(r0_115)
  -- line: [0, 0] id: 115
  _G.AutoCollectBerry = r0_115
end
r25_0:[r28_0](r28_0)
spawn(function()
  -- line: [0, 0] id: 533
  while wait() do
    local r0_533 = _G.AutoCollectBerry
    if r0_533 then
      r0_533 = game:GetService("Players")
      local r1_533 = r0_533.LocalPlayer
      local r3_533 = (r1_533.Character or r1_533.CharacterAdded:Wait()):GetPivot().Position
      local r5_533 = game:GetService("CollectionService"):GetTagged("BerryBush")
      local r6_533 = math.huge
      local r7_533 = nil
      local r8_533 = nil
      for r12_533 = 1, #r5_533, 1 do
        local r13_533 = r5_533[r12_533]
        for r17_533, r18_533 in pairs(r13_533:GetAttributes()) do
          local r19_533 = (r13_533.Parent:GetPivot().Position - r3_533).Magnitude
          if r19_533 < r6_533 then
            r8_533 = r18_533
            r7_533 = r13_533
            r6_533 = r19_533
          end
        end
      end
      if r7_533 then
        Tween2(CFrame.new(r7_533.Parent:GetPivot().Position))
        r0_0:Notify({
          Title = "Strix",
          Content = "Tìm Thấy Berry: " .. tostring(r8_533),
          Duration = 10,
        })
      else
        Hop()
      end
    end
  end
end)
r28_0 = "AddSection"
r28_0 = "Thông Thạo"
r26_0 = r2_0.Main:[r28_0](r28_0)
r27_0 = r2_0.Main
local r29_0 = "AddDropdown"
r29_0 = "DropdownMastery"
r27_0 = r27_0:[r29_0](r29_0, {
  Title = "Chọn Loại",
  Description = "",
  Values = {
    "Level",
    "Level No Quest",
    "Near Mob",
    "Bone",
    "Cake",
    "Ecto"
  },
  Multi = false,
  Default = 1,
})
local r30_0 = "SetValue"
r30_0 = TypeMastery
r27_0:[r30_0](r30_0)
r30_0 = "OnChanged"
function r30_0(r0_188)
  -- line: [0, 0] id: 188
  TypeMastery = r0_188
end
r27_0:[r30_0](r30_0)
r30_0 = "AddToggle"
r30_0 = "ToggleMasteryFruit"
r28_0 = r2_0.Main:[r30_0](r30_0, {
  Title = "Cày Thông Thạo Trái",
  Description = "",
  Default = false,
})
local r31_0 = "OnChanged"
(function(r0_338)
  -- line: [0, 0] id: 338
  AutoFarmMasDevilFruit = r0_338
end):[r31_0](r31_0)
r31_0 = "SetValue"
r31_0 = false
r3_0.ToggleMasteryFruit:[r31_0](r31_0)
r31_0 = "AddToggle"
r31_0 = "ToggleMasteryGun"
r29_0 = r2_0.Main:[r31_0](r31_0, {
  Title = "Cày Thông Thạo Súng",
  Description = "",
  Default = false,
})
local r32_0 = "OnChanged"
(function(r0_78)
  -- line: [0, 0] id: 78
  AutoFarmMasGun = r0_78
end):[r32_0](r32_0)
r32_0 = "AddSlider"
r32_0 = "SliderHealt"
local r33_0 = {
  Title = "Chọn Máu Quái",
  Description = "",
  Default = 20,
  Min = 0,
  Max = 100,
  Rounding = 1,
}
local r34_0 = "Callback"
local function r35_0(r0_418)
  -- line: [0, 0] id: 418
  KillPercent = r0_418
end
r33_0[r34_0] = r35_0
r30_0 = r2_0.Main:[r32_0](r32_0, r33_0)
r33_0 = "OnChanged"
function r33_0(r0_219)
  -- line: [0, 0] id: 219
  KillPercent = r0_219
end
r30_0:[r33_0](r33_0)
r33_0 = "SetValue"
r33_0 = 20
r30_0:[r33_0](r33_0)
spawn(function()
  -- line: [0, 0] id: 443
  while task.wait() do
    local r0_443 = _G.UseSkill
    if r0_443 then
      pcall(function()
        -- line: [0, 0] id: 444
        if _G.UseSkill then
          for r3_444, r4_444 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_444.Name == MonFarm and r4_444:FindFirstChild("Humanoid") and r4_444:FindFirstChild("HumanoidRootPart") and r4_444.Humanoid.Health <= r4_444.Humanoid.MaxHealth * KillPercent / 100 then
              while true do
                game:GetService("RunService").Heartbeat:wait()
                EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value)
                Tween(r4_444.HumanoidRootPart.CFrame * Pos)
                PositionSkillMasteryDevilFruit = r4_444.HumanoidRootPart.Position
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                  game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = PositionSkillMasteryDevilFruit
                  local r5_444 = game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value
                  local r6_444 = SkillZ
                  if r6_444 and 1 <= r5_444 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                    wait()
                    r6_444 = game:service("VirtualInputManager")
                    r6_444:SendKeyEvent(false, "Z", false, game)
                  end
                  r6_444 = SkillX
                  if r6_444 and 1 <= r5_444 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                    wait()
                    r6_444 = game:service("VirtualInputManager")
                    r6_444:SendKeyEvent(false, "X", false, game)
                  end
                  r6_444 = SkillC
                  if r6_444 and 1 <= r5_444 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                    wait()
                    r6_444 = game:service("VirtualInputManager")
                    r6_444:SendKeyEvent(false, "C", false, game)
                  end
                  r6_444 = SkillV
                  if r6_444 and 1 <= r5_444 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                    wait()
                    r6_444 = game:service("VirtualInputManager")
                    r6_444:SendKeyEvent(false, "V", false, game)
                  end
                  r6_444 = SkillF
                  if r6_444 and 1 <= r5_444 then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                    wait()
                    r6_444 = game:GetService("VirtualInputManager")
                    r6_444:SendKeyEvent(false, "F", false, game)
                  end
                end
                local r5_444 = AutoFarmMasDevilFruit
                if r5_444 then
                  r5_444 = _G.UseSkill
                  if r5_444 then
                    r5_444 = r4_444.Humanoid.Health
                    if r5_444 == 0 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        end
      end)
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 436
  while wait() do
    local r0_436 = AutoFarmMasDevilFruit
    if r0_436 then
      r0_436 = TypeMastery
      if r0_436 == "Near Mob" then
        pcall(function()
          -- line: [0, 0] id: 437
          for r3_437, r4_437 in pairs(game.Workspace.Enemies:GetChildren()) do
            if r4_437.Name and r4_437:FindFirstChild("Humanoid") and r4_437:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_437:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
              while true do
                wait(_G.Fast_Delay)
                if r4_437.Humanoid.Health <= r4_437.Humanoid.MaxHealth * KillPercent / 100 then
                  local r5_437 = _G
                  r5_437.UseSkill = true
                else
                  _G.UseSkill = false
                  AutoHaki()
                  bringmob = true
                  EquipTool(SelectWeapon)
                  Tween(r4_437.HumanoidRootPart.CFrame * Pos)
                  r4_437.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  r4_437.HumanoidRootPart.Transparency = 1
                  r4_437.Humanoid.JumpPower = 0
                  r4_437.Humanoid.WalkSpeed = 0
                  r4_437.HumanoidRootPart.CanCollide = false
                  FarmPos = r4_437.HumanoidRootPart.CFrame
                  MonFarm = r4_437.Name
                  AttackNoCoolDown()
                end
                local r5_437 = AutoFarmMasDevilFruit
                if r5_437 then
                  r5_437 = not MasteryType
                  if r5_437 ~= "Near Mob" then
                    r5_437 = r4_437.Parent
                    if r5_437 then
                      r5_437 = r4_437.Humanoid.Health
                      if r5_437 ~= 0 then
                        r5_437 = not TypeMastery
                        if r5_437 == "Near Mob" then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
              bringmob = false
              _G.UseSkill = false
            end
          end
        end)
      end
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 327
  while wait() do
    local r0_327 = AutoFarmMasDevilFruit
    if r0_327 then
      r0_327 = TypeMastery
      if r0_327 == "Ecto" then
        pcall(function()
          -- line: [0, 0] id: 328
          Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
        end)
        r0_327 = Vector3.new(904.4072265625, 181.05767822266, 33341.38671875)
        r0_327 = (r0_327 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if r0_327 > 20000 then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        end
        for r4_327, r5_327 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
          if r5_327:FindFirstChild("Humanoid") and r5_327:FindFirstChild("HumanoidRootPart") and (r5_327.Name == "Ship Steward" or r5_327.Name == "Ship Engineer" or r5_327.Name == "Ship Deckhand" or r5_327.Name == "Ship Officer") then
            while true do
              wait(_G.Fast_Delay)
              if r5_327.Humanoid.Health <= r5_327.Humanoid.MaxHealth * KillPercent / 100 then
                local r6_327 = _G
                r6_327.UseSkill = true
              else
                _G.UseSkill = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(r5_327.HumanoidRootPart.CFrame * Pos)
                r5_327.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r5_327.HumanoidRootPart.Transparency = 1
                r5_327.Humanoid.JumpPower = 0
                r5_327.Humanoid.WalkSpeed = 0
                r5_327.HumanoidRootPart.CanCollide = false
                FarmPos = r5_327.HumanoidRootPart.CFrame
                MonFarm = r5_327.Name
                AttackNoCoolDown()
              end
              local r6_327 = AutoFarmMasDevilFruit
              if r6_327 then
                r6_327 = not MasteryType
                if r6_327 ~= "Ecto" then
                  r6_327 = r5_327.Parent
                  if r6_327 then
                    r6_327 = r5_327.Humanoid.Health
                    if r6_327 ~= 0 then
                      r6_327 = not TypeMastery
                      if r6_327 == "Ecto" then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            bringmob = false
            _G.UseSkill = false
          end
        end
        for r4_327, r5_327 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
          if r5_327.Name == "Ship Steward" then
            Tween(r5_327.HumanoidRootPart.CFrame * Pos)
          elseif r5_327.Name == "Ship Engineer" then
            Tween(r5_327.HumanoidRootPart.CFrame * Pos)
          elseif r5_327.Name == "Ship Deckhand" then
            Tween(r5_327.HumanoidRootPart.CFrame * Pos)
          elseif r5_327.Name == "Ship Officer" then
            Tween(r5_327.HumanoidRootPart.CFrame * Pos)
          end
        end
      end
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 588
  while wait() do
    local r0_588 = AutoFarmMasDevilFruit
    if r0_588 then
      r0_588 = TypeMastery
      if r0_588 == "Cake" then
        pcall(function()
          -- line: [0, 0] id: 589
          Tween(CFrame.new(-9508.5673828125, 142.1398468017578, 5737.3603515625))
        end)
        r0_588 = pairs
        for r3_588, r4_588 in r0_588(game.Workspace.Enemies:GetChildren()) do
          if r4_588:FindFirstChild("Humanoid") and r4_588:FindFirstChild("HumanoidRootPart") and (r4_588.Name == "Cookie Crafter" or r4_588.Name == "Cake Guard" or r4_588.Name == "Baking Staff" or r4_588.Name == "Head Baker") then
            while true do
              wait(_G.Fast_Delay)
              if r4_588.Humanoid.Health <= r4_588.Humanoid.MaxHealth * KillPercent / 100 then
                local r5_588 = _G
                r5_588.UseSkill = true
              else
                _G.UseSkill = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(r4_588.HumanoidRootPart.CFrame * Pos)
                r4_588.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_588.HumanoidRootPart.Transparency = 1
                r4_588.Humanoid.JumpPower = 0
                r4_588.Humanoid.WalkSpeed = 0
                r4_588.HumanoidRootPart.CanCollide = false
                FarmPos = r4_588.HumanoidRootPart.CFrame
                MonFarm = r4_588.Name
                AttackNoCoolDown()
              end
              local r5_588 = AutoFarmMasDevilFruit
              if r5_588 then
                r5_588 = not MasteryType
                if r5_588 ~= "Cake" then
                  r5_588 = r4_588.Parent
                  if r5_588 then
                    r5_588 = r4_588.Humanoid.Health
                    if r5_588 ~= 0 then
                      r5_588 = not TypeMastery
                      if r5_588 == "Cake" then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            bringmob = false
            _G.UseSkill = false
          end
        end
        r0_588 = pairs
        for r3_588, r4_588 in r0_588(game:GetService("ReplicatedStorage"):GetChildren()) do
          if r4_588.Name == "Cookie Crafter" then
            Tween(r4_588.HumanoidRootPart.CFrame * Pos)
          elseif r4_588.Name == "Cake Guard" then
            Tween(r4_588.HumanoidRootPart.CFrame * Pos)
          elseif r4_588.Name == "Baking Staff" then
            Tween(r4_588.HumanoidRootPart.CFrame * Pos)
          elseif r4_588.Name == "Head Baker" then
            Tween(r4_588.HumanoidRootPart.CFrame * Pos)
          end
        end
      end
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 33
  while wait() do
    local r0_33 = AutoFarmMasDevilFruit
    if r0_33 then
      r0_33 = TypeMastery
      if r0_33 == "Level No Quest" then
        pcall(function()
          -- line: [0, 0] id: 34
          CheckLevel()
          Tween(CFrameQ)
        end)
        r0_33 = pairs
        for r3_33, r4_33 in r0_33(game.Workspace.Enemies:GetChildren()) do
          if r4_33:FindFirstChild("Humanoid") and r4_33:FindFirstChild("HumanoidRootPart") and r4_33.Name == Ms then
            while true do
              wait(_G.Fast_Delay)
              if r4_33.Humanoid.Health <= r4_33.Humanoid.MaxHealth * KillPercent / 100 then
                local r5_33 = _G
                r5_33.UseSkill = true
              else
                _G.UseSkill = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(r4_33.HumanoidRootPart.CFrame * Pos)
                r4_33.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_33.HumanoidRootPart.Transparency = 1
                r4_33.Humanoid.JumpPower = 0
                r4_33.Humanoid.WalkSpeed = 0
                r4_33.HumanoidRootPart.CanCollide = false
                FarmPos = r4_33.HumanoidRootPart.CFrame
                MonFarm = r4_33.Name
                AttackNoCoolDown()
              end
              local r5_33 = AutoFarmMasDevilFruit
              if r5_33 then
                r5_33 = not MasteryType
                if r5_33 ~= "Level No Quest" then
                  r5_33 = r4_33.Parent
                  if r5_33 then
                    r5_33 = r4_33.Humanoid.Health
                    if r5_33 ~= 0 then
                      r5_33 = not TypeMastery
                      if r5_33 == "Level No Quest" then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            bringmob = false
            _G.UseSkill = false
          end
        end
      end
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 94
  while wait() do
    local r0_94 = AutoFarmMasDevilFruit
    if r0_94 then
      r0_94 = TypeMastery
      if r0_94 == "Level" then
        pcall(function()
          -- line: [0, 0] id: 95
          CheckLevel()
          if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            Tween(CFrameQ)
          end
          if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
          end
        end)
        r0_94 = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
        if not r0_94 then
          r0_94 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
          if r0_94 ~= true then
          end
        end
        r0_94 = game:GetService("Workspace").Enemies:FindFirstChild(Ms)
        if r0_94 then
          r0_94 = pairs
          for r3_94, r4_94 in r0_94(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_94:FindFirstChild("Humanoid") and r4_94:FindFirstChild("HumanoidRootPart") and r4_94.Name == Ms then
              while true do
                wait(_G.Fast_Delay)
                if r4_94.Humanoid.Health <= r4_94.Humanoid.MaxHealth * KillPercent / 100 then
                  local r5_94 = _G
                  r5_94.UseSkill = true
                else
                  _G.UseSkill = false
                  AutoHaki()
                  bringmob = true
                  EquipTool(SelectWeapon)
                  Tween(r4_94.HumanoidRootPart.CFrame * Pos)
                  r4_94.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  r4_94.HumanoidRootPart.Transparency = 1
                  r4_94.Humanoid.JumpPower = 0
                  r4_94.Humanoid.WalkSpeed = 0
                  r4_94.HumanoidRootPart.CanCollide = false
                  FarmPos = r4_94.HumanoidRootPart.CFrame
                  MonFarm = r4_94.Name
                  AttackNoCoolDown()
                end
                local r5_94 = AutoFarmMasDevilFruit
                if r5_94 then
                  r5_94 = not MasteryType
                  if r5_94 ~= "Level" then
                    r5_94 = r4_94.Parent
                    if r5_94 then
                      r5_94 = r4_94.Humanoid.Health
                      if r5_94 ~= 0 then
                        r5_94 = not TypeMastery
                        if r5_94 == "Level" then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
              bringmob = false
              _G.UseSkill = false
            end
          end
        end
      end
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 580
  while wait() do
    local r0_580 = AutoFarmMasDevilFruit
    if r0_580 then
      r0_580 = TypeMastery
      if r0_580 == "Bone" then
        pcall(function()
          -- line: [0, 0] id: 581
          Tween(CFrame.new(-9508.5673828125, 142.1398468017578, 5737.3603515625))
        end)
        r0_580 = pairs
        for r3_580, r4_580 in r0_580(game.Workspace.Enemies:GetChildren()) do
          if r4_580:FindFirstChild("Humanoid") and r4_580:FindFirstChild("HumanoidRootPart") and (r4_580.Name == "Reborn Skeleton" or r4_580.Name == "Living Zombie" or r4_580.Name == "Demonic Soul" or r4_580.Name == "Posessed Mummy") then
            while true do
              wait(_G.Fast_Delay)
              if r4_580.Humanoid.Health <= r4_580.Humanoid.MaxHealth * KillPercent / 100 then
                local r5_580 = _G
                r5_580.UseSkill = true
              else
                _G.UseSkill = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(r4_580.HumanoidRootPart.CFrame * Pos)
                r4_580.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_580.HumanoidRootPart.Transparency = 1
                r4_580.Humanoid.JumpPower = 0
                r4_580.Humanoid.WalkSpeed = 0
                r4_580.HumanoidRootPart.CanCollide = false
                FarmPos = r4_580.HumanoidRootPart.CFrame
                MonFarm = r4_580.Name
                AttackNoCoolDown()
              end
              local r5_580 = AutoFarmMasDevilFruit
              if r5_580 then
                r5_580 = not MasteryType
                if r5_580 ~= "Bone" then
                  r5_580 = r4_580.Parent
                  if r5_580 then
                    r5_580 = r4_580.Humanoid.Health
                    if r5_580 ~= 0 then
                      r5_580 = not TypeMastery
                      if r5_580 == "Bone" then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            bringmob = false
            _G.UseSkill = false
          end
        end
        r0_580 = pairs
        for r3_580, r4_580 in r0_580(game:GetService("ReplicatedStorage"):GetChildren()) do
          if r4_580.Name == "Reborn Skeleton" then
            Tween(r4_580.HumanoidRootPart.CFrame * Pos)
          elseif r4_580.Name == "Living Zombie" then
            Tween(r4_580.HumanoidRootPart.CFrame * Pos)
          elseif r4_580.Name == "Demonic Soul" then
            Tween(r4_580.HumanoidRootPart.CFrame * Pos)
          elseif r4_580.Name == "Posessed Mummy" then
            Tween(r4_580.HumanoidRootPart.CFrame * Pos)
          end
        end
      end
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 461
  while task.wait() do
    local r0_461 = _G.UseSkillGun
    if r0_461 then
      pcall(function()
        -- line: [0, 0] id: 462
        if _G.UseSkillGun then
          for r3_462, r4_462 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_462.Name == MonFarm and r4_462:FindFirstChild("Humanoid") and r4_462:FindFirstChild("HumanoidRootPart") and r4_462.Humanoid.Health <= r4_462.Humanoid.MaxHealth * KillPercent / 100 then
              while true do
                game:GetService("RunService").Heartbeat:wait()
                EquipToolGun()
                Tween(r4_462.HumanoidRootPart.CFrame * Pos)
                PositionSkillMasteryGun = r4_462.HumanoidRootPart.Position
                if SkillZ then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                  wait()
                  local r5_462 = game:service("VirtualInputManager")
                  r5_462:SendKeyEvent(false, "Z", false, game)
                end
                local r5_462 = SkillX
                if r5_462 then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                  wait()
                  r5_462 = game:service("VirtualInputManager")
                  r5_462:SendKeyEvent(false, "X", false, game)
                end
                r5_462 = SkillC
                if r5_462 then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                  wait()
                  r5_462 = game:service("VirtualInputManager")
                  r5_462:SendKeyEvent(false, "C", false, game)
                end
                r5_462 = SkillV
                if r5_462 then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                  wait()
                  r5_462 = game:service("VirtualInputManager")
                  r5_462:SendKeyEvent(false, "V", false, game)
                end
                r5_462 = SkillF
                if r5_462 then
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                  wait()
                  r5_462 = game:GetService("VirtualInputManager")
                  r5_462:SendKeyEvent(false, "F", false, game)
                end
                r5_462 = AutoFarmMasGun
                if r5_462 then
                  r5_462 = _G.UseSkillGun
                  if r5_462 then
                    r5_462 = r4_462.Humanoid.Health
                    if r5_462 == 0 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        end
      end)
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 500
  while wait() do
    local r0_500 = AutoFarmMasGun
    if r0_500 then
      r0_500 = TypeMastery
      if r0_500 == "Near Mob" then
        pcall(function()
          -- line: [0, 0] id: 501
          for r3_501, r4_501 in pairs(game.Workspace.Enemies:GetChildren()) do
            if r4_501.Name and r4_501:FindFirstChild("Humanoid") and r4_501:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_501:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
              while true do
                wait(_G.Fast_Delay)
                if r4_501.Humanoid.Health <= r4_501.Humanoid.MaxHealth * KillPercent / 100 then
                  local r5_501 = _G
                  r5_501.UseSkillGun = true
                else
                  _G.UseSkillGun = false
                  AutoHaki()
                  bringmob = true
                  EquipTool(SelectWeapon)
                  Tween(r4_501.HumanoidRootPart.CFrame * Pos)
                  r4_501.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  r4_501.HumanoidRootPart.Transparency = 1
                  r4_501.Humanoid.JumpPower = 0
                  r4_501.Humanoid.WalkSpeed = 0
                  r4_501.HumanoidRootPart.CanCollide = false
                  FarmPos = r4_501.HumanoidRootPart.CFrame
                  MonFarm = r4_501.Name
                  AttackNoCoolDown()
                end
                local r5_501 = AutoFarmMasGun
                if r5_501 then
                  r5_501 = not MasteryType
                  if r5_501 ~= "Near Mob" then
                    r5_501 = r4_501.Parent
                    if r5_501 then
                      r5_501 = r4_501.Humanoid.Health
                      if r5_501 ~= 0 then
                        r5_501 = not TypeMastery
                        if r5_501 == "Near Mob" then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
              bringmob = false
              _G.UseSkillGun = false
            end
          end
        end)
      end
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 367
  while wait() do
    local r0_367 = AutoFarmMasGun
    if r0_367 then
      r0_367 = TypeMastery
      if r0_367 == "Ecto" then
        pcall(function()
          -- line: [0, 0] id: 368
          Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
        end)
        r0_367 = Vector3.new(904.4072265625, 181.05767822266, 33341.38671875)
        r0_367 = (r0_367 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if r0_367 > 20000 then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        end
        for r4_367, r5_367 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
          if r5_367:FindFirstChild("Humanoid") and r5_367:FindFirstChild("HumanoidRootPart") and (r5_367.Name == "Ship Steward" or r5_367.Name == "Ship Engineer" or r5_367.Name == "Ship Deckhand" or r5_367.Name == "Ship Officer") then
            while true do
              wait(_G.Fast_Delay)
              if r5_367.Humanoid.Health <= r5_367.Humanoid.MaxHealth * KillPercent / 100 then
                local r6_367 = _G
                r6_367.UseSkillGun = true
              else
                _G.UseSkillGun = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(r5_367.HumanoidRootPart.CFrame * Pos)
                r5_367.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r5_367.HumanoidRootPart.Transparency = 1
                r5_367.Humanoid.JumpPower = 0
                r5_367.Humanoid.WalkSpeed = 0
                r5_367.HumanoidRootPart.CanCollide = false
                FarmPos = r5_367.HumanoidRootPart.CFrame
                MonFarm = r5_367.Name
                AttackNoCoolDown()
              end
              local r6_367 = AutoFarmMasGun
              if r6_367 then
                r6_367 = not MasteryType
                if r6_367 ~= "Ecto" then
                  r6_367 = r5_367.Parent
                  if r6_367 then
                    r6_367 = r5_367.Humanoid.Health
                    if r6_367 ~= 0 then
                      r6_367 = not TypeMastery
                      if r6_367 == "Ecto" then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            bringmob = false
            _G.UseSkillGun = false
          end
        end
        for r4_367, r5_367 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
          if r5_367.Name == "Ship Steward" then
            Tween(r5_367.HumanoidRootPart.CFrame * Pos)
          elseif r5_367.Name == "Ship Engineer" then
            Tween(r5_367.HumanoidRootPart.CFrame * Pos)
          elseif r5_367.Name == "Ship Deckhand" then
            Tween(r5_367.HumanoidRootPart.CFrame * Pos)
          elseif r5_367.Name == "Ship Officer" then
            Tween(r5_367.HumanoidRootPart.CFrame * Pos)
          end
        end
      end
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 204
  while wait() do
    local r0_204 = AutoFarmMasGun
    if r0_204 then
      r0_204 = TypeMastery
      if r0_204 == "Cake" then
        pcall(function()
          -- line: [0, 0] id: 205
          Tween(CFrame.new(-1579.9111328125, 329.7358703613281, -12310.365234375))
        end)
        r0_204 = pairs
        for r3_204, r4_204 in r0_204(game.Workspace.Enemies:GetChildren()) do
          if r4_204:FindFirstChild("Humanoid") and r4_204:FindFirstChild("HumanoidRootPart") and (r4_204.Name == "Cookie Crafter" or r4_204.Name == "Cake Guard" or r4_204.Name == "Baking Staff" or r4_204.Name == "Head Baker") then
            while true do
              wait(_G.Fast_Delay)
              if r4_204.Humanoid.Health <= r4_204.Humanoid.MaxHealth * KillPercent / 100 then
                local r5_204 = _G
                r5_204.UseSkillGun = true
              else
                _G.UseSkillGun = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(r4_204.HumanoidRootPart.CFrame * Pos)
                r4_204.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_204.HumanoidRootPart.Transparency = 1
                r4_204.Humanoid.JumpPower = 0
                r4_204.Humanoid.WalkSpeed = 0
                r4_204.HumanoidRootPart.CanCollide = false
                FarmPos = r4_204.HumanoidRootPart.CFrame
                MonFarm = r4_204.Name
                AttackNoCoolDown()
              end
              local r5_204 = AutoFarmMasGun
              if r5_204 then
                r5_204 = not MasteryType
                if r5_204 ~= "Cake" then
                  r5_204 = r4_204.Parent
                  if r5_204 then
                    r5_204 = r4_204.Humanoid.Health
                    if r5_204 ~= 0 then
                      r5_204 = not TypeMastery
                      if r5_204 == "Cake" then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            bringmob = false
            _G.UseSkillGun = false
          end
        end
        r0_204 = pairs
        for r3_204, r4_204 in r0_204(game:GetService("ReplicatedStorage"):GetChildren()) do
          if r4_204.Name == "Cookie Crafter" then
            Tween(r4_204.HumanoidRootPart.CFrame * Pos)
          elseif r4_204.Name == "Cake Guard" then
            Tween(r4_204.HumanoidRootPart.CFrame * Pos)
          elseif r4_204.Name == "Baking Staff" then
            Tween(r4_204.HumanoidRootPart.CFrame * Pos)
          elseif r4_204.Name == "Head Baker" then
            Tween(r4_204.HumanoidRootPart.CFrame * Pos)
          end
        end
      end
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 312
  while wait() do
    local r0_312 = AutoFarmMasGun
    if r0_312 then
      r0_312 = TypeMastery
      if r0_312 == "Level" then
        pcall(function()
          -- line: [0, 0] id: 313
          CheckLevel()
          if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            Tween(CFrameQ)
          end
          if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
          end
        end)
        r0_312 = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
        if not r0_312 then
          r0_312 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
          if r0_312 ~= true then
          end
        end
        r0_312 = game:GetService("Workspace").Enemies:FindFirstChild(Ms)
        if r0_312 then
          r0_312 = pairs
          for r3_312, r4_312 in r0_312(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_312:FindFirstChild("Humanoid") and r4_312:FindFirstChild("HumanoidRootPart") and r4_312.Name == Ms then
              while true do
                wait(_G.Fast_Delay)
                if r4_312.Humanoid.Health <= r4_312.Humanoid.MaxHealth * KillPercent / 100 then
                  local r5_312 = _G
                  r5_312.UseSkillGun = true
                else
                  _G.UseSkillGun = false
                  AutoHaki()
                  bringmob = true
                  EquipTool(SelectWeapon)
                  Tween(r4_312.HumanoidRootPart.CFrame * Pos)
                  r4_312.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  r4_312.HumanoidRootPart.Transparency = 1
                  r4_312.Humanoid.JumpPower = 0
                  r4_312.Humanoid.WalkSpeed = 0
                  r4_312.HumanoidRootPart.CanCollide = false
                  FarmPos = r4_312.HumanoidRootPart.CFrame
                  MonFarm = r4_312.Name
                  AttackNoCoolDown()
                end
                local r5_312 = AutoFarmMasGun
                if r5_312 then
                  r5_312 = not MasteryType
                  if r5_312 ~= "Level" then
                    r5_312 = r4_312.Parent
                    if r5_312 then
                      r5_312 = r4_312.Humanoid.Health
                      if r5_312 ~= 0 then
                        r5_312 = not TypeMastery
                        if r5_312 == "Level" then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
              bringmob = false
              _G.UseSkillGun = false
            end
          end
        end
      end
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 314
  while wait() do
    local r0_314 = AutoFarmMasGun
    if r0_314 then
      r0_314 = TypeMastery
      if r0_314 == "Level No Quest" then
        pcall(function()
          -- line: [0, 0] id: 315
          CheckLevel()
          Tween(CFrameQ)
        end)
        r0_314 = pairs
        for r3_314, r4_314 in r0_314(game.Workspace.Enemies:GetChildren()) do
          if r4_314:FindFirstChild("Humanoid") and r4_314:FindFirstChild("HumanoidRootPart") and r4_314.Name == Ms then
            while true do
              wait(_G.Fast_Delay)
              if r4_314.Humanoid.Health <= r4_314.Humanoid.MaxHealth * KillPercent / 100 then
                local r5_314 = _G
                r5_314.UseSkillGun = true
              else
                _G.UseSkillGun = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(r4_314.HumanoidRootPart.CFrame * Pos)
                r4_314.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_314.HumanoidRootPart.Transparency = 1
                r4_314.Humanoid.JumpPower = 0
                r4_314.Humanoid.WalkSpeed = 0
                r4_314.HumanoidRootPart.CanCollide = false
                FarmPos = r4_314.HumanoidRootPart.CFrame
                MonFarm = r4_314.Name
                AttackNoCoolDown()
              end
              local r5_314 = AutoFarmMasGun
              if r5_314 then
                r5_314 = not MasteryType
                if r5_314 ~= "Level No Quest" then
                  r5_314 = r4_314.Parent
                  if r5_314 then
                    r5_314 = r4_314.Humanoid.Health
                    if r5_314 ~= 0 then
                      r5_314 = not TypeMastery
                      if r5_314 == "Level No Quest" then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            bringmob = false
            _G.UseSkillGun = false
          end
        end
      end
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 297
  while wait() do
    local r0_297 = AutoFarmMasGun
    if r0_297 then
      r0_297 = TypeMastery
      if r0_297 == "Bone" then
        pcall(function()
          -- line: [0, 0] id: 298
          Tween(CFrame.new(-9508.5673828125, 142.1398468017578, 5737.3603515625))
        end)
        r0_297 = pairs
        for r3_297, r4_297 in r0_297(game.Workspace.Enemies:GetChildren()) do
          if r4_297:FindFirstChild("Humanoid") and r4_297:FindFirstChild("HumanoidRootPart") and (r4_297.Name == "Reborn Skeleton" or r4_297.Name == "Living Zombie" or r4_297.Name == "Demonic Soul" or r4_297.Name == "Posessed Mummy") then
            while true do
              wait(_G.Fast_Delay)
              if r4_297.Humanoid.Health <= r4_297.Humanoid.MaxHealth * KillPercent / 100 then
                local r5_297 = _G
                r5_297.UseSkillGun = true
              else
                _G.UseSkillGun = false
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(r4_297.HumanoidRootPart.CFrame * Pos)
                r4_297.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_297.HumanoidRootPart.Transparency = 1
                r4_297.Humanoid.JumpPower = 0
                r4_297.Humanoid.WalkSpeed = 0
                r4_297.HumanoidRootPart.CanCollide = false
                FarmPos = r4_297.HumanoidRootPart.CFrame
                MonFarm = r4_297.Name
                AttackNoCoolDown()
              end
              local r5_297 = AutoFarmMasGun
              if r5_297 then
                r5_297 = not MasteryType
                if r5_297 ~= "Bone" then
                  r5_297 = r4_297.Parent
                  if r5_297 then
                    r5_297 = r4_297.Humanoid.Health
                    if r5_297 ~= 0 then
                      r5_297 = not TypeMastery
                      if r5_297 == "Bone" then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            bringmob = false
            _G.UseSkillGun = false
          end
        end
        r0_297 = pairs
        for r3_297, r4_297 in r0_297(game:GetService("ReplicatedStorage"):GetChildren()) do
          if r4_297.Name == "Reborn Skeleton" then
            Tween(r4_297.HumanoidRootPart.CFrame * Pos)
          elseif r4_297.Name == "Living Zombie" then
            Tween(r4_297.HumanoidRootPart.CFrame * Pos)
          elseif r4_297.Name == "Demonic Soul" then
            Tween(r4_297.HumanoidRootPart.CFrame * Pos)
          elseif r4_297.Name == "Posessed Mummy" then
            Tween(r4_297.HumanoidRootPart.CFrame * Pos)
          end
        end
      end
    end
  end
end)
function EquipToolGun()
  -- line: [0, 0] id: 220
  pcall(function()
    -- line: [0, 0] id: 221
    for r3_221, r4_221 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
      if r4_221.ToolTip == "Gun" and r4_221:IsA("Tool") then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(r4_221.Name))
      end
    end
  end)
end
spawn(function()
  -- line: [0, 0] id: 487
  local r0_487 = getrawmetatable(game)
  local r1_487 = r0_487.__namecall
  setreadonly(r0_487, false)
  r0_487.__namecall = newcclosure(function(...)
    -- line: [0, 0] id: 488
    local r1_488 = getnamecallmethod()
    local r2_488 = {
      ...
    }
    if tostring(r1_488) == "FireServer" and tostring(r2_488[1]) == "RemoteEvent" and tostring(r2_488[2]) ~= "true" and tostring(r2_488[2]) ~= "false" then
      if _G.UseSkillGun then
        if type(r2_488[2]) == "vector" then
          r2_488[2] = PositionSkillMasteryGun
        else
          r2_488[2] = CFrame.new(PositionSkillMasteryGun)
        end
        return r1_487(unpack(r2_488))
      end
      if _G.UseSkill then
        if type(r2_488[2]) == "vector" then
          r2_488[2] = PositionSkillMasteryDevilFruit
        else
          r2_488[2] = CFrame.new(PositionSkillMasteryDevilFruit)
        end
        return r1_487(unpack(r2_488))
      end
    end
    return r1_487(...)
  end)
end)
if Sea3 then
  r33_0 = "AddSection"
  r33_0 = "Xương"
  r31_0 = r2_0.Main:[r33_0](r33_0)
  r34_0 = "AddParagraph"
  r34_0 = {
    Title = "Xương Trạng Thái",
    Content = "",
  }
  r32_0 = r2_0.Main:[r34_0](r34_0)
  spawn(function()
    -- line: [0, 0] id: 55
    pcall(function()
      -- line: [0, 0] id: 56
      while wait() do
        local r0_56 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
        r32_0:SetDesc("Bạn Có: " .. tostring(r0_56) .. " Xương")
      end
    end)
  end)
  r35_0 = "AddToggle"
  r35_0 = "ToggleBone"
  r33_0 = r2_0.Main:[r35_0](r35_0, {
    Title = "Cày Xương",
    Description = "",
    Default = false,
  })
  local r36_0 = "OnChanged"
  function r36_0(r0_48)
    -- line: [0, 0] id: 48
    _G.AutoBone = r0_48
    if r0_48 == false then
      wait()
      Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
      wait()
    end
  end
  r33_0:[r36_0](r36_0)
  r36_0 = "SetValue"
  r36_0 = false
  r3_0.ToggleBone:[r36_0](r36_0)
  r34_0 = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)
  spawn(function()
    -- line: [0, 0] id: 88
    while wait() do
      local r0_88 = _G.AutoBone
      if r0_88 then
        pcall(function()
          -- line: [0, 0] id: 89
          if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
          end
          if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
            Tween(r34_0)
            if (r34_0.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
            end
          elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")) then
            for r4_89, r5_89 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if r5_89:FindFirstChild("HumanoidRootPart") and r5_89:FindFirstChild("Humanoid") and 0 < r5_89.Humanoid.Health and (r5_89.Name == "Reborn Skeleton" or r5_89.Name == "Living Zombie" or r5_89.Name == "Demonic Soul" or r5_89.Name == "Posessed Mummy") then
                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                  while true do
                    wait(_G.Fast_Delay)
                    AttackNoCoolDown()
                    AutoHaki()
                    bringmob = true
                    EquipTool(SelectWeapon)
                    Tween(r5_89.HumanoidRootPart.CFrame * Pos)
                    r5_89.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    r5_89.HumanoidRootPart.Transparency = 1
                    r5_89.Humanoid.JumpPower = 0
                    r5_89.Humanoid.WalkSpeed = 0
                    r5_89.HumanoidRootPart.CanCollide = false
                    FarmPos = r5_89.HumanoidRootPart.CFrame
                    MonFarm = r5_89.Name
                    if _G.AutoBone then
                      local r6_89 = r5_89.Humanoid.Health
                      if r6_89 > 0 then
                        r6_89 = r5_89.Parent
                        if r6_89 then
                          r6_89 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                          if r6_89 == false then
                            goto label_235	-- block#23 is visited secondly
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  end
                else
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                  bringmob = false
                end
              end
            end
          end
        end)
      end
    end
  end)
  r35_0 = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)
  spawn(function()
    -- line: [0, 0] id: 464
    while wait() do
      local r0_464 = _G.AutoBoneNoQuest
      if r0_464 then
        pcall(function()
          -- line: [0, 0] id: 465
          Tween(r35_0)
          if (r35_0.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
          end
          if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
            for r3_465, r4_465 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if r4_465:FindFirstChild("HumanoidRootPart") and r4_465:FindFirstChild("Humanoid") and 0 < r4_465.Humanoid.Health and (r4_465.Name == "Reborn Skeleton" or r4_465.Name == "Living Zombie" or r4_465.Name == "Demonic Soul" or r4_465.Name == "Posessed Mummy") then
                while true do
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  bringmob = true
                  EquipTool(SelectWeapon)
                  Tween(r4_465.HumanoidRootPart.CFrame * Pos)
                  r4_465.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  r4_465.HumanoidRootPart.Transparency = 1
                  r4_465.Humanoid.JumpPower = 0
                  r4_465.Humanoid.WalkSpeed = 0
                  r4_465.HumanoidRootPart.CanCollide = false
                  FarmPos = r4_465.HumanoidRootPart.CFrame
                  MonFarm = r4_465.Name
                  if _G.AutoBoneNoQuest then
                    local r5_465 = r4_465.Humanoid.Health
                    if r5_465 > 0 then
                      r5_465 = r4_465.Parent
                      if not r5_465 then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
              end
            end
          end
        end)
      end
    end
  end)
  local r38_0 = "AddButton"
  r38_0 = {
    Title = "Cầu Nguyện",
    Description = "",
    Callback = function()
      -- line: [0, 0] id: 530
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
        [1] = "gravestoneEvent",
        [2] = 1,
      }))
    end,
  }
  r2_0.Main:[r38_0](r38_0)
  r38_0 = "AddButton"
  r38_0 = {
    Title = "Thử Vận May",
    Description = "",
    Callback = function()
      -- line: [0, 0] id: 203
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
        [1] = "gravestoneEvent",
        [2] = 2,
      }))
    end,
  }
  r2_0.Main:[r38_0](r38_0)
  r38_0 = "AddToggle"
  r38_0 = "ToggleRandomBone"
  r36_0 = r2_0.Main:[r38_0](r38_0, {
    Title = "Tự Động Random Xương",
    Description = "",
    Default = false,
  })
  local r39_0 = "OnChanged"
  function r39_0(r0_128)
    -- line: [0, 0] id: 128
    _G.AutoRandomBone = r0_128
  end
  r36_0:[r39_0](r39_0)
  r39_0 = "SetValue"
  r39_0 = false
  r3_0.ToggleRandomBone:[r39_0](r39_0)
  spawn(function()
    -- line: [0, 0] id: 491
    while wait() do
      local r0_491 = _G.AutoRandomBone
      if r0_491 then
        r0_491 = {}
        r0_491[1] = "Bones"
        r0_491[2] = "Buy"
        r0_491[3] = 1
        r0_491[4] = 1
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_491))
      end
    end
  end)
  -- close: r31_0
end
if Sea3 then
  r33_0 = "AddSection"
  r33_0 = "Tư Lệnh Bánh"
  r31_0 = r2_0.Main:[r33_0](r33_0)
  r32_0 = r2_0.Main
  r34_0 = "AddParagraph"
  r34_0 = {}
  r35_0 = "Trạng Thái Boss Ra"
  r34_0.Title = r35_0
  r35_0 = "Content"
  r34_0[r35_0] = ""
  r32_0 = r32_0:[r34_0](r34_0)
  function r34_0()
    -- line: [0, 0] id: 53
    while wait() do
      pcall(function()
        -- line: [0, 0] id: 54
        if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
          r32_0:SetDesc("Còn: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41) .. "")
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
          r32_0:SetDesc("Còn: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 40) .. "")
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
          r32_0:SetDesc("Còn: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 39) .. " ")
        else
          r32_0:SetDesc("Tư Lệnh Bánh : ✅️")
        end
      end)
    end
  end
  spawn(r34_0)
  r35_0 = "AddToggle"
  r35_0 = "ToggleCake"
  r33_0 = r2_0.Main:[r35_0](r35_0, {
    Title = "Cày Tư Lệnh Bánh",
    Description = "",
    Default = false,
  })
  local r36_0 = "OnChanged"
  function r36_0(r0_563)
    -- line: [0, 0] id: 563
    _G.Cake = r0_563
    if r0_563 == false then
      wait()
      Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
      wait()
    end
  end
  r33_0:[r36_0](r36_0)
  r34_0 = "ToggleCake"
  r34_0 = r3_0[r34_0]
  r36_0 = "SetValue"
  r36_0 = false
  r34_0:[r36_0](r36_0)
  r34_0 = spawn
  function r35_0()
    -- line: [0, 0] id: 452
    while wait() do
      local r0_452 = _G.Cake
      if r0_452 then
        pcall(function()
          -- line: [0, 0] id: 453
          if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game.ReplicatedStorage:FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
              for r3_453, r4_453 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if r4_453.Name == "Cake Prince" or r4_453.Name == "Dough King" then
                  while true do
                    wait(_G.Fast_Delay)
                    AutoHaki()
                    EquipTool(SelectWeapon)
                    r4_453.HumanoidRootPart.CanCollide = false
                    r4_453.Humanoid.WalkSpeed = 0
                    r4_453.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    Tween(r4_453.HumanoidRootPart.CFrame * Pos)
                    AttackNoCoolDown()
                    if _G.Cake ~= false then
                      local r5_453 = r4_453.Parent
                      if r5_453 then
                        r5_453 = r4_453.Humanoid.Health
                        if r5_453 <= 0 then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  end
                end
              end
            else
              Tween(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875))
            end
          elseif game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
            for r3_453, r4_453 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if (r4_453.Name == "Baking Staff" or r4_453.Name == "Head Baker" or r4_453.Name == "Cake Guard" or r4_453.Name == "Cookie Crafter") and 0 < r4_453.Humanoid.Health then
                while true do
                  wait(_G.Fast_Delay)
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  bringmob = true
                  r4_453.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  POSCAKE = r4_453.HumanoidRootPart.CFrame
                  Tween(r4_453.HumanoidRootPart.CFrame * Pos)
                  AttackNoCoolDown()
                  if _G.Cake ~= false then
                    local r5_453 = game:GetService("ReplicatedStorage")
                    r5_453 = r5_453:FindFirstChild("Cake Prince")
                    if not r5_453 then
                      r5_453 = game:GetService("ReplicatedStorage")
                      r5_453 = r5_453:FindFirstChild("Dough King")
                      if not r5_453 then
                        r5_453 = r4_453.Parent
                        if r5_453 then
                          r5_453 = r4_453.Humanoid.Health
                          if r5_453 <= 0 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
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
  r34_0(r35_0)
  r34_0 = spawn
  function r35_0()
    -- line: [0, 0] id: 189
    game:GetService("RunService").Heartbeat:Connect(function()
      -- line: [0, 0] id: 190
      pcall(function()
        -- line: [0, 0] id: 191
        for r3_191, r4_191 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
          if _G.Cake and bringmob and (r4_191.Name == "Cookie Crafter" or r4_191.Name == "Cake Guard" or r4_191.Name == "Baking Staff" or r4_191.Name == "Head Baker") and (r4_191.HumanoidRootPart.Position - POSCAKE.Position).magnitude <= 350 then
            r4_191.HumanoidRootPart.CFrame = POSCAKE
            r4_191.HumanoidRootPart.CanCollide = false
            r4_191.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
            if r4_191.Humanoid:FindFirstChild("Animator") then
              r4_191.Humanoid.Animator:Destroy()
            end
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
          end
        end
      end)
    end)
  end
  r34_0(r35_0)
  r34_0 = spawn
  function r35_0()
    -- line: [0, 0] id: 30
    while wait() do
      local r0_30 = _G.Cake
      if r0_30 then
        pcall(function()
          -- line: [0, 0] id: 31
          if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game.ReplicatedStorage:FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
              for r3_31, r4_31 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if r4_31.Name == "Cake Prince" or r4_31.Name == "Dough King" then
                  while true do
                    wait(_G.Fast_Delay)
                    AutoHaki()
                    EquipTool(SelectWeapon)
                    r4_31.HumanoidRootPart.CanCollide = false
                    r4_31.Humanoid.WalkSpeed = 0
                    r4_31.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    Tween(r4_31.HumanoidRootPart.CFrame * Pos)
                    AttackNoCoolDown()
                    if _G.Cake ~= false then
                      local r5_31 = r4_31.Parent
                      if r5_31 then
                        r5_31 = r4_31.Humanoid.Health
                        if r5_31 <= 0 then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  end
                end
              end
            else
              Tween(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875))
            end
          elseif game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
            for r3_31, r4_31 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if (r4_31.Name == "Baking Staff" or r4_31.Name == "Head Baker" or r4_31.Name == "Cake Guard" or r4_31.Name == "Cookie Crafter") and 0 < r4_31.Humanoid.Health then
                while true do
                  wait(_G.Fast_Delay)
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  bringmob = true
                  r4_31.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  POSCAKE = r4_31.HumanoidRootPart.CFrame
                  Tween(r4_31.HumanoidRootPart.CFrame * Pos)
                  AttackNoCoolDown()
                  if _G.Cake ~= false then
                    local r5_31 = game:GetService("ReplicatedStorage")
                    r5_31 = r5_31:FindFirstChild("Cake Prince")
                    if not r5_31 then
                      r5_31 = game:GetService("ReplicatedStorage")
                      r5_31 = r5_31:FindFirstChild("Dough King")
                      if not r5_31 then
                        r5_31 = r4_31.Parent
                        if r5_31 then
                          r5_31 = r4_31.Humanoid.Health
                          if r5_31 <= 0 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
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
  r34_0(r35_0)
  r34_0 = r2_0.Main
  r36_0 = "AddToggle"
  r36_0 = "ToggleSpawnCake"
  r34_0 = r34_0:[r36_0](r36_0, {
    Title = "Triệu Hồi Tư Lệnh Bánh",
    Description = "",
    Default = true,
  })
  local r37_0 = "OnChanged"
  function r37_0(r0_569)
    -- line: [0, 0] id: 569
    _G.SpawnCakePrince = r0_569
  end
  r34_0:[r37_0](r37_0)
  r35_0 = "ToggleSpawnCake"
  r35_0 = r3_0[r35_0]
  r37_0 = "SetValue"
  r37_0 = true
  r35_0:[r37_0](r37_0)
  -- close: r31_0
end
function r32_0()
  -- line: [0, 0] id: 46
  while wait() do
    local r0_46 = _G.SpawnCakePrince
    if r0_46 then
      r0_46 = {}
      r0_46[1] = "CakePrinceSpawner"
      r0_46[2] = true
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_46))
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
        [1] = "CakePrinceSpawner",
      }))
    end
  end
end
spawn(r32_0)
if Sea2 then
  r33_0 = "AddSection"
  r33_0 = "Ectoplasm Farm"
  r31_0 = r2_0.Main:[r33_0](r33_0)
  r32_0 = r2_0.Main
  r34_0 = "AddToggle"
  r34_0 = "ToggleVatChatKiDi"
  r35_0 = {}
  r35_0.Title = "Auto Farm Ectoplasm"
  r35_0.Description = ""
  r35_0.Default = false
  r32_0 = r32_0:[r34_0](r34_0, r35_0)
  r35_0 = "OnChanged"
  function r35_0(r0_578)
    -- line: [0, 0] id: 578
    _G.Ectoplasm = r0_578
  end
  r32_0:[r35_0](r35_0)
  r35_0 = "SetValue"
  r35_0 = false
  r3_0.ToggleVatChatKiDi:[r35_0](r35_0)
  function r34_0()
    -- line: [0, 0] id: 229
    while wait() do
      pcall(function()
        -- line: [0, 0] id: 230
        if _G.Ectoplasm then
          if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
            for r3_230, r4_230 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if (r4_230.Name == "Ship Steward" or r4_230.Name == "Ship Engineer" or r4_230.Name == "Ship Deckhand" or r4_230.Name == "Ship Officer" and r4_230:FindFirstChild("Humanoid")) and 0 < r4_230.Humanoid.Health then
                while true do
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  bringmob = true
                  EquipTool(SelectWeapon)
                  Tween(r4_230.HumanoidRootPart.CFrame * Pos)
                  r4_230.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  r4_230.HumanoidRootPart.Transparency = 1
                  r4_230.Humanoid.JumpPower = 0
                  r4_230.Humanoid.WalkSpeed = 0
                  r4_230.HumanoidRootPart.CanCollide = false
                  FarmPos = r4_230.HumanoidRootPart.CFrame
                  MonFarm = r4_230.Name
                  if _G.Ectoplasm ~= false then
                    local r5_230 = r4_230.Parent
                    if r5_230 then
                      r5_230 = r4_230.Humanoid.Health
                      if r5_230 ~= 0 then
                        r5_230 = game:GetService("Workspace").Enemies:FindFirstChild(r4_230.Name)
                        if not r5_230 then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
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
  spawn(r34_0)
end
r33_0 = "AddSection"
r33_0 = "Trùm"
r31_0 = r2_0.Main:[r33_0](r33_0)
r32_0 = Sea1
local r44_0 = nil	-- notice: implicit variable refs by block#[55]
local r45_0 = nil	-- notice: implicit variable refs by block#[55]
if r32_0 then
  r32_0 = {}
  r33_0 = "The Gorilla King"
  r34_0 = "Bobby"
  r35_0 = "Yeti"
  local r36_0 = "Mob Leader"
  local r37_0 = "Vice Admiral"
  local r38_0 = "Warden"
  local r39_0 = "Chief Warden"
  local r40_0 = "Swan"
  local r41_0 = "Magma Admiral"
  r42_0 = "Fishman Lord"
  r43_0 = "Wysper"
  r44_0 = "Thunder God"
  r45_0 = "Cyborg"
  local r46_0 = "Saber Expert"
  -- setlist for #32 failed
  tableBoss = r32_0
else
  r32_0 = Sea2
  if r32_0 then
    r32_0 = {}
    r33_0 = "Diamond"
    r34_0 = "Jeremy"
    r35_0 = "Fajita"
    local r36_0 = "Don Swan"
    local r37_0 = "Smoke Admiral"
    local r38_0 = "Cursed Captain"
    local r39_0 = "Darkbeard"
    local r40_0 = "Order"
    local r41_0 = "Awakened Ice Admiral"
    r42_0 = "Tide Keeper"
    -- setlist for #32 failed
    tableBoss = r32_0
  else
    r32_0 = Sea3
    if r32_0 then
      r32_0 = {}
      r33_0 = "Stone"
      r34_0 = "Hydra Leader"
      r35_0 = "Kilo Admiral"
      local r36_0 = "Captain Elephant"
      local r37_0 = "Beautiful Pirate"
      local r38_0 = "rip_indra True Form"
      local r39_0 = "Longma"
      local r40_0 = "Soul Reaper"
      local r41_0 = "Cake Queen"
      -- setlist for #32 failed
      tableBoss = r32_0
    end
  end
end
r32_0 = r2_0.Main
r34_0 = "AddDropdown"
r34_0 = "DropdownBoss"
r35_0 = {}
r35_0.Title = "Chọn Trùm"
r35_0.Description = ""
r35_0.Values = tableBoss
r35_0.Multi = false
r35_0.Default = 1
r32_0 = r32_0:[r34_0](r34_0, r35_0)
r35_0 = "SetValue"
r35_0 = _G
r35_0 = r35_0.SelectBoss
r32_0:[r35_0](r35_0)
r35_0 = "OnChanged"
function r35_0(r0_321)
  -- line: [0, 0] id: 321
  _G.SelectBoss = r0_321
end
r32_0:[r35_0](r35_0)
r35_0 = "AddToggle"
r35_0 = "ToggleAutoFarmBoss"
r33_0 = r2_0.Main:[r35_0](r35_0, {
  Title = " ánh Trùm",
  Description = "",
  Default = false,
})
local r36_0 = "OnChanged"
(function(r0_166)
  -- line: [0, 0] id: 166
  _G.AutoBoss = r0_166
end):[r36_0](r36_0)
r34_0 = "ToggleAutoFarmBoss"
r34_0 = r3_0[r34_0]
r36_0 = "SetValue"
r36_0 = false
r34_0:[r36_0](r36_0)
r34_0 = spawn
function r35_0()
  -- line: [0, 0] id: 278
  while wait() do
    local r0_278 = _G.AutoBoss
    if r0_278 then
      pcall(function()
        -- line: [0, 0] id: 279
        if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
          for r3_279, r4_279 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_279.Name == _G.SelectBoss and r4_279:FindFirstChild("Humanoid") and r4_279:FindFirstChild("HumanoidRootPart") and 0 < r4_279.Humanoid.Health then
              while true do
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                AutoHaki()
                EquipTool(SelectWeapon)
                r4_279.HumanoidRootPart.CanCollide = false
                r4_279.Humanoid.WalkSpeed = 0
                r4_279.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                Tween(r4_279.HumanoidRootPart.CFrame * Pos)
                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                if _G.AutoBoss then
                  local r5_279 = r4_279.Parent
                  if r5_279 then
                    r5_279 = r4_279.Humanoid.Health
                    if r5_279 <= 0 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        elseif game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end
r34_0(r35_0)
r34_0 = r2_0.Main
r36_0 = "AddSection"
r36_0 = "Nguyên Liệu"
r34_0 = r34_0:[r36_0](r36_0)
r35_0 = Sea1
if r35_0 then
  r35_0 = {}
  r36_0 = "Scrap Metal"
  local r37_0 = "Leather"
  local r38_0 = "Angel Wings"
  local r39_0 = "Magma Ore"
  local r40_0 = "Fish Tail"
  -- setlist for #35 failed
  MaterialList = r35_0
else
  r35_0 = Sea2
  if r35_0 then
    r35_0 = {}
    r36_0 = "Scrap Metal"
    local r37_0 = "Leather"
    local r38_0 = "Radioactive Material"
    local r39_0 = "Mystic Droplet"
    local r40_0 = "Magma Ore"
    local r41_0 = "Vampire Fang"
    -- setlist for #35 failed
    MaterialList = r35_0
  else
    r35_0 = Sea3
    if r35_0 then
      r35_0 = {}
      r36_0 = "Scrap Metal"
      local r37_0 = "Leather"
      local r38_0 = "Demonic Wisp"
      local r39_0 = "Conjured Cocoa"
      local r40_0 = "Dragon Scale"
      local r41_0 = "Gunpowder"
      r42_0 = "Fish Tail"
      r43_0 = "Mini Tusk"
      r44_0 = "Hydra Enforcer"
      r45_0 = "Venomous Assailant"
      -- setlist for #35 failed
      MaterialList = r35_0
    end
  end
end
r35_0 = r2_0.Main
local r37_0 = "AddDropdown"
r37_0 = "DropdownMaterial"
r35_0 = r35_0:[r37_0](r37_0, {
  Title = "Chọn Nguyên Liệu",
  Description = "",
  Values = MaterialList,
  Multi = false,
  Default = 1,
})
local r38_0 = "SetValue"
r38_0 = SelectMaterial
r35_0:[r38_0](r38_0)
r38_0 = "OnChanged"
function r38_0(r0_503)
  -- line: [0, 0] id: 503
  SelectMaterial = r0_503
end
r35_0:[r38_0](r38_0)
r38_0 = "AddToggle"
r38_0 = "ToggleMaterial"
r36_0 = r2_0.Main:[r38_0](r38_0, {
  Title = "Cày Nguyên Liệu",
  Description = "",
  Default = false,
})
local r39_0 = "OnChanged"
(function(r0_358)
  -- line: [0, 0] id: 358
  _G.AutoMaterial = r0_358
  if r0_358 == false then
    wait()
    Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
  end
end):[r39_0](r39_0)
r39_0 = "SetValue"
r39_0 = false
r3_0.ToggleMaterial:[r39_0](r39_0)
spawn(function()
  -- line: [0, 0] id: 260
  while task.wait() do
    local r0_260 = _G.AutoMaterial
    if r0_260 then
      pcall(function()
        -- line: [0, 0] id: 261
        MaterialMon(SelectMaterial)
        Tween(MPos)
        if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
          for r3_261, r4_261 in pairs(game.Workspace.Enemies:GetChildren()) do
            if r4_261:FindFirstChild("Humanoid") and r4_261:FindFirstChild("HumanoidRootPart") and 0 < r4_261.Humanoid.Health and r4_261.Name == MMon then
              while true do
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween(r4_261.HumanoidRootPart.CFrame * Pos)
                r4_261.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_261.HumanoidRootPart.Transparency = 1
                r4_261.Humanoid.JumpPower = 0
                r4_261.Humanoid.WalkSpeed = 0
                r4_261.HumanoidRootPart.CanCollide = false
                FarmPos = r4_261.HumanoidRootPart.CFrame
                MonFarm = r4_261.Name
                if _G.AutoMaterial then
                  local r5_261 = r4_261.Parent
                  if r5_261 then
                    r5_261 = r4_261.Humanoid.Health
                    if r5_261 <= 0 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
              bringmob = false
            end
          end
        else
          for r3_261, r4_261 in pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren()) do
            if string.find(r4_261.Name, Mon) and 10 <= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_261.Position).Magnitude then
              Tween(r4_261.HumanoidRootPart.CFrame * Pos)
            end
          end
        end
      end)
    end
  end
end)
local r48_0 = nil	-- notice: implicit variable refs by block#[55, 56, 57]
local r49_0 = nil	-- notice: implicit variable refs by block#[55, 56, 57]
local r50_0 = nil	-- notice: implicit variable refs by block#[55, 56, 57]
local r51_0 = nil	-- notice: implicit variable refs by block#[56, 57]
local r52_0 = nil	-- notice: implicit variable refs by block#[56, 57]
local r53_0 = nil	-- notice: implicit variable refs by block#[56, 57]
local r54_0 = nil	-- notice: implicit variable refs by block#[56, 57]
local r55_0 = nil	-- notice: implicit variable refs by block#[56, 57]
local r56_0 = nil	-- notice: implicit variable refs by block#[57, 58, 59]
local r61_0 = nil	-- notice: implicit variable refs by block#[58, 59, 61, 63, 65, 66]
local r64_0 = nil	-- notice: implicit variable refs by block#[66]
local r65_0 = nil	-- notice: implicit variable refs by block#[66]
local r73_0 = nil	-- notice: implicit variable refs by block#[66]
if Sea3 then
  r39_0 = "AddSection"
  r39_0 = " ảo Cáo"
  r37_0 = r2_0.Sea:[r39_0](r39_0)
  local r40_0 = "AddParagraph"
  r40_0 = {
    Title = "Trạng Thái Đảo Cáo",
    Content = "",
  }
  r38_0 = r2_0.Sea:[r40_0](r40_0)
  function UpdateKitsune()
    -- line: [0, 0] id: 471
    if game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
      r38_0:SetDesc(" ảo Cáo : ✅️")
    else
      r38_0:SetDesc(" ảo Cáo : ❌️")
    end
  end
  spawn(function()
    -- line: [0, 0] id: 537
    pcall(function()
      -- line: [0, 0] id: 538
      while wait() do
        UpdateKitsune()
      end
    end)
  end)
  local r41_0 = "AddToggle"
  r41_0 = "ToggleTPKitsune"
  r42_0 = {
    Title = "Bay Vào Đảo Cáo",
    Description = "",
    Default = false,
  }
  r39_0 = r2_0.Sea:[r41_0](r41_0, r42_0)
  r42_0 = "OnChanged"
  function r42_0(r0_136)
    -- line: [0, 0] id: 136
    _G.TweenToKitsune = r0_136
  end
  r39_0:[r42_0](r42_0)
  r42_0 = "SetValue"
  r42_0 = false
  r3_0.ToggleTPKitsune:[r42_0](r42_0)
  spawn(function()
    -- line: [0, 0] id: 237
    while true do
      local r0_237 = nil	-- notice: implicit variable refs by block#[0, 4]
      if not r0_237 then
        r0_237 = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
        wait(1)
      else
        break
      end
    end
    while wait() do
      local r1_237 = _G.TweenToKitsune
      if r1_237 then
        r1_237 = r0_237:FindFirstChild("ShrineActive")
        if r1_237 then
          for r5_237, r6_237 in pairs(r1_237:GetDescendants()) do
            if r6_237:IsA("BasePart") and r6_237.Name:find("NeonShrinePart") then
              Tween2(r6_237.CFrame)
            end
          end
        end
      end
    end
  end)
  r42_0 = "AddToggle"
  r42_0 = "ToggleCollectAzure"
  r43_0 = {
    Title = "Nhặt Linh Hồn",
    Description = "",
    Default = false,
  }
  r40_0 = r2_0.Sea:[r42_0](r42_0, r43_0)
  r43_0 = "OnChanged"
  function r43_0(r0_305)
    -- line: [0, 0] id: 305
    _G.CollectAzure = r0_305
  end
  r40_0:[r43_0](r43_0)
  r43_0 = "SetValue"
  r43_0 = false
  r3_0.ToggleCollectAzure:[r43_0](r43_0)
  spawn(function()
    -- line: [0, 0] id: 263
    while wait() do
      local r0_263 = _G.CollectAzure
      if r0_263 then
        pcall(function()
          -- line: [0, 0] id: 264
          if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
            Tween(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
          end
        end)
      end
    end
  end)
  r43_0 = "AddButton"
  r43_0 = {
    Title = " ổi Linh Hồn",
    Description = "",
    Callback = function()
      -- line: [0, 0] id: 272
      game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer()
    end,
  }
  r2_0.Sea:[r43_0](r43_0)
  r43_0 = "AddSection"
  r43_0 = "Biển"
  r41_0 = r2_0.Sea:[r43_0](r43_0)
  r42_0 = game:GetService("Players")
  r43_0 = game:GetService("RunService")
  r44_0 = game:GetService("VirtualInputManager")
  r45_0 = game:GetService("Workspace")
  local r46_0 = r42_0.LocalPlayer
  local r47_0 = r46_0.Character
  if not r47_0 then
    r49_0 = "Wait"
    r47_0 = r46_0.CharacterAdded:[r49_0]()
  end
  r48_0 = 350
  r49_0 = 3000
  r50_0 = Vector3.new(-16665.191, 104.596, 1579.694)
  r51_0 = {
    80,
    -50,
    -80,
    50
  }
  r52_0 = 1
  function r53_0()
    -- line: [0, 0] id: 536
    for r3_536, r4_536 in pairs(r45_0.Boats:GetChildren()) do
      local r5_536 = r4_536:FindFirstChild("VehicleSeat")
      if r5_536 and r5_536.Occupant == r47_0:FindFirstChild("Humanoid") then
        return r4_536
      end
    end
    return nil
  end
  r56_0 = "Connect"
  function r56_0()
    -- line: [0, 0] id: 215
    if not r47_0 or not r47_0.PrimaryPart then
      return 
    end
    if r49_0 <= math.floor(((r47_0.PrimaryPart.Position - r50_0)).Magnitude / 10) then
      local r2_215 = r53_0()
      if r2_215 and r2_215.PrimaryPart then
        r2_215:SetPrimaryPartCFrame(r2_215.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(r51_0[r52_0]), 0))
        r52_0 = r52_0 + 1
        if #r51_0 < r52_0 then
          r52_0 = 1
        end
        r49_0 = r49_0 + 1000
      end
    end
  end
  r43_0.RenderStepped:[r56_0](r56_0)
  r54_0 = {}
  r55_0 = false
  r56_0 = false
  local r57_0 = {
    Prehistoric = {
      "ShipwreckIsland",
      "SandIsland",
      "TreeIsland",
      "TinyIsland",
      "MysticIsland",
      "KitsuneIsland",
      "FrozenDimension"
    },
    Mirage = {
      "ShipwreckIsland",
      "SandIsland",
      "TreeIsland",
      "TinyIsland",
      "PrehistoricIsland",
      "KitsuneIsland",
      "FrozenDimension"
    },
    Frozen = {
      "ShipwreckIsland",
      "SandIsland",
      "TreeIsland",
      "TinyIsland",
      "MysticIsland",
      "KitsuneIsland",
      "PrehistoricIsland"
    },
  }
  local function r58_0(r0_472, r1_472, r2_472, r3_472, r4_472)
    -- line: [0, 0] id: 472
    local r5_472 = r2_0.Sea:AddToggle(r1_472, {
      Title = r0_472,
      Default = false,
    })
    r3_0[r1_472]:SetValue(false)
    r5_472:OnChanged(function(r0_473)
      -- line: [0, 0] id: 473
      _G[r1_472] = r0_473
    end)
    r43_0.RenderStepped:Connect(function()
      -- line: [0, 0] id: 474
      if not _G[r1_472] then
        r56_0 = false
        return 
      end
      local r0_474 = r47_0:FindFirstChild("Humanoid")
      if not r0_474 then
        return 
      end
      local function r1_474()
        -- line: [0, 0] id: 475
        if r55_0 then
          return 
        end
        r55_0 = true
        for r3_475, r4_475 in pairs(r54_0) do
          if r4_475 and r4_475.Parent and r4_475.Name == "VehicleSeat" and not r4_475.Occupant then
            Tween2(r4_475.CFrame)
            break
          end
        end
        r55_0 = false
      end
      local r2_474 = false
      local r3_474 = nil
      for r7_474, r8_474 in pairs(r45_0.Boats:GetChildren()) do
        local r9_474 = r8_474:FindFirstChild("VehicleSeat")
        if r9_474 then
          if r9_474.Occupant == r0_474 then
            r3_474 = r9_474
            r2_474 = true
            r54_0[r8_474.Name] = r9_474
          elseif r9_474.Occupant == nil then
            r1_474()
          end
        end
      end
      if not r2_474 then
        return 
      end
      r3_474.MaxSpeed = r48_0
      r3_474.CFrame = CFrame.new(r3_474.Position) * r3_474.CFrame.Rotation
      r44_0:SendKeyEvent(true, "W", false, game)
      for r7_474, r8_474 in pairs(r45_0.Boats:GetDescendants()) do
        if r8_474:IsA("BasePart") then
          r8_474.CanCollide = false
        end
      end
      for r7_474, r8_474 in pairs(r47_0:GetDescendants()) do
        if r8_474:IsA("BasePart") then
          r8_474.CanCollide = false
        end
      end
      for r7_474, r8_474 in ipairs(r2_472) do
        local r9_474 = r45_0.Map:FindFirstChild(r8_474)
        if r9_474 and r9_474:IsA("Model") then
          r9_474:Destroy()
        end
      end
      if r45_0.Map:FindFirstChild(r3_472) then
        r44_0:SendKeyEvent(false, "W", false, game)
        _G[r1_472] = false
        if not r56_0 then
          r0_0:Notify({
            Title = "Strix",
            Content = r4_472,
            Duration = 10,
          })
          r56_0 = true
        end
      end
    end)
  end
  r58_0("Tìm Đảo Dung Nham", "AutoFindPrehistoric", r57_0.Prehistoric, "PrehistoricIsland", " ảo Dung Nham Đã Được Tìm Thấy")
  r58_0("Tìm Đảo Bí Ẩn", "AutoFindMirage", r57_0.Mirage, "MysticIsland", " ảo Bí Ẩn Đã Được Tìm Thấy")
  r58_0("Tìm Đảo Leviathan", "AutoFindFrozen", r57_0.Frozen, "FrozenDimension", " ảo Leviathan Đã Được Tìm Thấy")
  r61_0 = "AddToggle"
  r61_0 = "AutoComeTiki"
  local r59_0 = r2_0.Sea:[r61_0](r61_0, {
    Title = "Lái Thuyền Về Đảo Tiki",
    Description = "",
    Default = false,
  })
  local r62_0 = "OnChanged"
  function r62_0(r0_233)
    -- line: [0, 0] id: 233
    _G.AutoComeTiki = r0_233
  end
  r59_0:[r62_0](r62_0)
  r62_0 = "Connect"
  function r62_0()
    -- line: [0, 0] id: 116
    if not _G.AutoComeTiki then
      return 
    end
    local r1_116 = r42_0.LocalPlayer.Character
    if not r1_116 or not r1_116:FindFirstChild("Humanoid") then
      return 
    end
    local r2_116 = r1_116.Humanoid
    local r3_116 = nil
    for r7_116, r8_116 in pairs(r45_0.Boats:GetChildren()) do
      local r9_116 = r8_116:FindFirstChild("VehicleSeat")
      if r9_116 and r9_116.Occupant == r2_116 then
        r3_116 = r9_116
        break
      end
    end
    if r3_116 then
      r3_116.MaxSpeed = r48_0
      local r4_116 = CFrame.new(-16217.7568359375, 9.126761436462402, 446.06536865234375)
      local r5_116 = r3_116.Position
      local r6_116 = r4_116.Position
      r3_116.CFrame = r3_116.CFrame + ((r6_116 - r5_116)).unit * r3_116.MaxSpeed * r43_0.RenderStepped:Wait()
      local r9_116 = CFrame.new(r5_116, r6_116)
      r3_116.CFrame = CFrame.new(r3_116.Position, r6_116)
      if (r3_116.Position - r6_116).magnitude < 120 then
        _G.AutoComeTiki = false
        r44_0:SendKeyEvent(false, "W", false, game)
      end
    end
  end
  r43_0.RenderStepped:[r62_0](r62_0)
  r62_0 = "AddToggle"
  r62_0 = "AutoComeHydra"
  local r60_0 = r2_0.Sea:[r62_0](r62_0, {
    Title = "Lái Thuyền Về Đảo Hydra",
    Description = "",
    Default = false,
  })
  local r63_0 = "OnChanged"
  function r63_0(r0_226)
    -- line: [0, 0] id: 226
    _G.AutoComeHydra = r0_226
  end
  r60_0:[r63_0](r63_0)
  r63_0 = "Connect"
  function r63_0()
    -- line: [0, 0] id: 490
    if not _G.AutoComeHydra then
      return 
    end
    local r1_490 = r42_0.LocalPlayer.Character
    if not r1_490 or not r1_490:FindFirstChild("Humanoid") then
      return 
    end
    local r2_490 = r1_490.Humanoid
    local r3_490 = nil
    for r7_490, r8_490 in pairs(r45_0.Boats:GetChildren()) do
      local r9_490 = r8_490:FindFirstChild("VehicleSeat")
      if r9_490 and r9_490.Occupant == r2_490 then
        r3_490 = r9_490
        break
      end
    end
    if r3_490 then
      r3_490.MaxSpeed = r48_0
      local r4_490 = CFrame.new(5193.9375, -0.04690289497375488, 1631.578369140625)
      local r5_490 = r3_490.Position
      local r6_490 = r4_490.Position
      r3_490.CFrame = r3_490.CFrame + ((r6_490 - r5_490)).unit * r3_490.MaxSpeed * r43_0.RenderStepped:Wait()
      local r9_490 = CFrame.new(r5_490, r6_490)
      r3_490.CFrame = CFrame.new(r3_490.Position, r6_490)
      if (r3_490.Position - r6_490).magnitude < 120 then
        _G.AutoComeHydra = false
        r44_0:SendKeyEvent(false, "W", false, game)
      end
    end
  end
  r43_0.RenderStepped:[r63_0](r63_0)
  r63_0 = "AddButton"
  r63_0 = {
    Title = "Bay Đến Khu Vực Mua Thuyền",
    Description = "",
    Callback = function()
      -- line: [0, 0] id: 432
      Tween2(CFrame.new(-16917.154296875, 7.757596015930176, 511.8203125))
    end,
  }
  r2_0.Sea:[r63_0](r63_0)
  r61_0 = {}
  r62_0 = {
    "Beast Hunter",
    "Sleigh",
    "Miracle",
    "The Sentinel",
    "Guardian",
    "Lantern",
    "Dinghy",
    "PirateSloop",
    "PirateBrigade",
    "PirateGrandBrigade",
    "MarineGrandBrigade",
    "MarineBrigade",
    "MarineSloop"
  }
  r65_0 = "AddDropdown"
  r65_0 = "DropdownBoat"
  r63_0 = r2_0.Sea:[r65_0](r65_0, {
    Title = "Chọn Thuyền",
    Description = "",
    Values = r62_0,
    Multi = false,
    Default = 1,
  })
  local r66_0 = "SetValue"
  r66_0 = selectedBoat
  r63_0:[r66_0](r66_0)
  r66_0 = "OnChanged"
  function r66_0(r0_335)
    -- line: [0, 0] id: 335
    selectedBoat = r0_335
  end
  r63_0:[r66_0](r66_0)
  function r64_0(r0_319)
    -- line: [0, 0] id: 319
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
      [1] = "BuyBoat",
      [2] = r0_319,
    }))
    task.delay(2, function()
      -- line: [0, 0] id: 320
      for r3_320, r4_320 in pairs(r45_0.Boats:GetChildren()) do
        if r4_320:IsA("Model") and r4_320.Name == r0_319 then
          local r5_320 = r4_320:FindFirstChild("VehicleSeat")
          if r5_320 and not r5_320.Occupant then
            r61_0[r0_319] = r5_320
          end
        end
      end
    end)
  end
  function r65_0()
    -- line: [0, 0] id: 547
    for r3_547, r4_547 in pairs(r61_0) do
      if r4_547 and r4_547.Parent and r4_547.Name == "VehicleSeat" and not r4_547.Occupant then
        Tween2(r4_547.CFrame)
      end
    end
  end
  r66_0 = game:GetService("RunService")
  local r68_0 = "Connect"
  function r68_0()
    -- line: [0, 0] id: 186
    for r3_186, r4_186 in pairs(r61_0) do
      if r4_186 and r4_186.Parent and r4_186.Name == "VehicleSeat" and not r4_186.Occupant then
        r61_0[r3_186] = r4_186
      end
    end
  end
  r66_0.RenderStepped:[r68_0](r68_0)
  r68_0 = "AddButton"
  r68_0 = {
    Title = "Mua Thuyền",
    Description = "",
    Callback = function()
      -- line: [0, 0] id: 484
      r64_0(selectedBoat)
    end,
  }
  r2_0.Sea:[r68_0](r68_0)
  r68_0 = "AddButton"
  r68_0 = {
    Title = "Bay Đến Thuyền",
    Description = "Duy Nhất Thuyền Bạn Mua Ở Chỗ Chọn",
    Callback = function()
      -- line: [0, 0] id: 148
      r65_0()
    end,
  }
  r2_0.Sea:[r68_0](r68_0)
  r68_0 = "AddToggle"
  r68_0 = "ToggleTerrorshark"
  r66_0 = r2_0.Sea:[r68_0](r68_0, {
    Title = " ánh Cá Mập Tận Thế",
    Description = "",
    Default = false,
  })
  local r69_0 = "OnChanged"
  function r69_0(r0_422)
    -- line: [0, 0] id: 422
    _G.AutoTerrorshark = r0_422
  end
  r66_0:[r69_0](r69_0)
  r69_0 = "SetValue"
  r69_0 = false
  r3_0.ToggleTerrorshark:[r69_0](r69_0)
  _G.IsFlying = false
  spawn(function()
    -- line: [0, 0] id: 583
    while wait() do
      local r0_583 = _G.AutoTerrorshark
      if r0_583 then
        pcall(function()
          -- line: [0, 0] id: 584
          local r0_584 = game.Players.LocalPlayer.Character
          if r0_584 and r0_584:FindFirstChild("Humanoid") then
            if r0_584.Humanoid.Health < 6000 and not _G.IsFlying then
              _G.IsFlying = true
              Tween(CFrame.new(r0_584.HumanoidRootPart.Position.X, 360, r0_584.HumanoidRootPart.Position.Z))
            end
            if _G.IsFlying and 8000 <= r0_584.Humanoid.Health then
              _G.IsFlying = false
            end
            if not _G.IsFlying and 8000 <= r0_584.Humanoid.Health then
              if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                for r4_584, r5_584 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r5_584.Name == "Terrorshark" and r5_584:FindFirstChild("Humanoid") and r5_584:FindFirstChild("HumanoidRootPart") and 0 < r5_584.Humanoid.Health then
                    while true do
                      wait(_G.Fast_Delay)
                      if r0_584.Humanoid.Health < 6000 then
                        _G.IsFlying = true
                        Tween(CFrame.new(r0_584.HumanoidRootPart.Position.X, 360, r0_584.HumanoidRootPart.Position.Z))
                        break
                      else
                        AttackNoCoolDown()
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        r5_584.HumanoidRootPart.CanCollide = false
                        r5_584.Humanoid.WalkSpeed = 0
                        r5_584.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        Tween(r5_584.HumanoidRootPart.CFrame * Pos)
                        local r6_584 = _G.AutoTerrorshark
                        if r6_584 then
                          r6_584 = r5_584.Parent
                          if r6_584 then
                            r6_584 = r5_584.Humanoid.Health
                            if r6_584 > 0 then
                              r6_584 = _G.IsFlying
                              if r6_584 then
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      end
                    end
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
  end)
  r69_0 = "AddToggle"
  r69_0 = "TogglePiranha"
  local r67_0 = r2_0.Sea:[r69_0](r69_0, {
    Title = " ánh Piranha",
    Description = "",
    Default = false,
  })
  local r70_0 = "OnChanged"
  function r70_0(r0_362)
    -- line: [0, 0] id: 362
    _G.farmpiranya = r0_362
  end
  r67_0:[r70_0](r70_0)
  r70_0 = "SetValue"
  r70_0 = false
  r3_0.TogglePiranha:[r70_0](r70_0)
  spawn(function()
    -- line: [0, 0] id: 68
    while wait() do
      local r0_68 = _G.farmpiranya
      if r0_68 then
        pcall(function()
          -- line: [0, 0] id: 69
          if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
            for r3_69, r4_69 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if r4_69.Name == "Piranha" and r4_69:FindFirstChild("Humanoid") and r4_69:FindFirstChild("HumanoidRootPart") and 0 < r4_69.Humanoid.Health then
                while true do
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  r4_69.HumanoidRootPart.CanCollide = false
                  r4_69.Humanoid.WalkSpeed = 0
                  r4_69.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  Tween(r4_69.HumanoidRootPart.CFrame * Pos)
                  if _G.farmpiranya then
                    local r5_69 = r4_69.Parent
                    if r5_69 then
                      r5_69 = r4_69.Humanoid.Health
                      if r5_69 <= 0 then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
              end
            end
          elseif game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * Pos)
          end
        end)
      end
    end
  end)
  r70_0 = "AddToggle"
  r70_0 = "ToggleShark"
  r68_0 = r2_0.Sea:[r70_0](r70_0, {
    Title = " ánh Cá Mập",
    Description = "",
    Default = false,
  })
  local r71_0 = "OnChanged"
  function r71_0(r0_184)
    -- line: [0, 0] id: 184
    _G.AutoShark = r0_184
  end
  r68_0:[r71_0](r71_0)
  r71_0 = "SetValue"
  r71_0 = false
  r3_0.ToggleShark:[r71_0](r71_0)
  spawn(function()
    -- line: [0, 0] id: 325
    while wait() do
      local r0_325 = _G.AutoShark
      if r0_325 then
        pcall(function()
          -- line: [0, 0] id: 326
          if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
            for r3_326, r4_326 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if r4_326.Name == "Shark" and r4_326:FindFirstChild("Humanoid") and r4_326:FindFirstChild("HumanoidRootPart") and 0 < r4_326.Humanoid.Health then
                while true do
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  r4_326.HumanoidRootPart.CanCollide = false
                  r4_326.Humanoid.WalkSpeed = 0
                  r4_326.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  Tween(r4_326.HumanoidRootPart.CFrame * Pos)
                  game.Players.LocalPlayer.Character.Humanoid.Sit = false
                  if _G.AutoShark then
                    local r5_326 = r4_326.Parent
                    if r5_326 then
                      r5_326 = r4_326.Humanoid.Health
                      if r5_326 <= 0 then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
              end
            end
          else
            Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
            if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
              Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * Pos)
            end
          end
        end)
      end
    end
  end)
  r71_0 = "AddToggle"
  r71_0 = "ToggleFishCrew"
  r69_0 = r2_0.Sea:[r71_0](r71_0, {
    Title = " ánh Tàu Cá",
    Description = "",
    Default = false,
  })
  local r72_0 = "OnChanged"
  function r72_0(r0_6)
    -- line: [0, 0] id: 6
    _G.AutoFishCrew = r0_6
  end
  r69_0:[r72_0](r72_0)
  r72_0 = "SetValue"
  r72_0 = false
  r3_0.ToggleFishCrew:[r72_0](r72_0)
  spawn(function()
    -- line: [0, 0] id: 455
    while wait() do
      local r0_455 = _G.AutoFishCrew
      if r0_455 then
        pcall(function()
          -- line: [0, 0] id: 456
          if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
            for r3_456, r4_456 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if r4_456.Name == "Fish Crew Member" and r4_456:FindFirstChild("Humanoid") and r4_456:FindFirstChild("HumanoidRootPart") and 0 < r4_456.Humanoid.Health then
                while true do
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  r4_456.HumanoidRootPart.CanCollide = false
                  r4_456.Humanoid.WalkSpeed = 0
                  r4_456.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  Tween(r4_456.HumanoidRootPart.CFrame * Pos)
                  game.Players.LocalPlayer.Character.Humanoid.Sit = false
                  if _G.AutoFishCrew then
                    local r5_456 = r4_456.Parent
                    if r5_456 then
                      r5_456 = r4_456.Humanoid.Health
                      if r5_456 <= 0 then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
              end
            end
          else
            Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
            if game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
              Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame * Pos)
            end
          end
        end)
      end
    end
  end)
  r72_0 = "AddToggle"
  r72_0 = "ToggleShip"
  r73_0 = {
    Title = " ánh Tàu",
    Description = "",
    Default = false,
  }
  r70_0 = r2_0.Sea:[r72_0](r72_0, r73_0)
  r73_0 = "OnChanged"
  function r73_0(r0_61)
    -- line: [0, 0] id: 61
    _G.Ship = r0_61
  end
  r70_0:[r73_0](r73_0)
  r73_0 = "SetValue"
  r73_0 = false
  r3_0.ToggleShip:[r73_0](r73_0)
  function CheckPirateBoat()
    -- line: [0, 0] id: 218
    local r0_218 = {
      "PirateGrandBrigade",
      "PirateBrigade"
    }
    local r1_218 = next
    local r2_218, r3_218 = game:GetService("Workspace").Enemies:GetChildren()
    for r4_218, r5_218 in r1_218, r2_218, r3_218 do
      if table.find(r0_218, r5_218.Name) and r5_218:FindFirstChild("Health") and 0 < r5_218.Health.Value then
        return r5_218
      end
    end
  end
  spawn(function()
    -- line: [0, 0] id: 404
    while wait() do
      local r0_404 = _G.Ship
      if r0_404 then
        pcall(function()
          -- line: [0, 0] id: 405
          if CheckPirateBoat() then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
            wait(0.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
            local r0_405 = CheckPirateBoat()
            while true do
              wait()
              spawn(Tween(r0_405.Engine.CFrame * CFrame.new(0, -20, 0)), 1)
              AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
              Skillaimbot = true
              AutoSkill = false
              if r0_405 then
                local r1_405 = r0_405.Parent
                if r1_405 then
                  r1_405 = r0_405.Health.Value
                  if r1_405 > 0 then
                    r1_405 = CheckPirateBoat()
                    if not r1_405 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            Skillaimbot = true
            AutoSkill = false
          end
        end)
      end
    end
  end)
  r73_0 = "AddToggle"
  r73_0 = "ToggleGhostShip"
  r71_0 = r2_0.Sea:[r73_0](r73_0, {
    Title = " ánh Tàu Ma",
    Description = "",
    Default = false,
  })
  local r74_0 = "OnChanged"
  function r74_0(r0_185)
    -- line: [0, 0] id: 185
    _G.GhostShip = r0_185
  end
  r71_0:[r74_0](r74_0)
  r74_0 = "SetValue"
  r74_0 = false
  r3_0.ToggleGhostShip:[r74_0](r74_0)
  function CheckPirateBoat()
    -- line: [0, 0] id: 45
    local r0_45 = {
      "FishBoat"
    }
    local r1_45 = next
    local r2_45, r3_45 = game:GetService("Workspace").Enemies:GetChildren()
    for r4_45, r5_45 in r1_45, r2_45, r3_45 do
      if table.find(r0_45, r5_45.Name) and r5_45:FindFirstChild("Health") and 0 < r5_45.Health.Value then
        return r5_45
      end
    end
  end
  spawn(function()
    -- line: [0, 0] id: 372
    while wait() do
      pcall(function()
        -- line: [0, 0] id: 373
        if _G.bjirFishBoat and CheckPirateBoat() then
          game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
          wait()
          game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
          local r0_373 = CheckPirateBoat()
          while true do
            wait()
            spawn(Tween(r0_373.Engine.CFrame * CFrame.new(0, -20, 0), 1))
            AutoSkill = true
            Skillaimbot = true
            AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
            if not r0_373.Parent then
              local r1_373 = r0_373.Health.Value
              if r1_373 > 0 then
                r1_373 = CheckPirateBoat()
                if not r1_373 then
                  break
                end
              else
                break
              end
            else
              break
            end
          end
          AutoSkill = false
          Skillaimbot = false
        end
      end)
    end
  end)
  spawn(function()
    -- line: [0, 0] id: 234
    while wait() do
      local r0_234 = _G.bjirFishBoat
      if r0_234 then
        pcall(function()
          -- line: [0, 0] id: 235
          if CheckPirateBoat() then
            AutoHaki()
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
            for r3_235, r4_235 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
              if r4_235:IsA("Tool") and r4_235.ToolTip == "Melee" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(r4_235)
              end
            end
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait(0.2)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait(0.2)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait(0.2)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            for r3_235, r4_235 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
              if r4_235:IsA("Tool") and r4_235.ToolTip == "Blox Fruit" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(r4_235)
              end
            end
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait(0.2)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait(0.2)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait(0.2)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait()
            for r3_235, r4_235 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
              if r4_235:IsA("Tool") and r4_235.ToolTip == "Sword" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(r4_235)
              end
            end
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait(0.2)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait(0.2)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait()
            for r3_235, r4_235 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
              if r4_235:IsA("Tool") and r4_235.ToolTip == "Gun" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(r4_235)
              end
            end
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait(0.2)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            wait(0.2)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
          end
        end)
      end
    end
  end)
  r74_0 = "AddSection"
  r74_0 = "Elite"
  r72_0 = r2_0.Main:[r74_0](r74_0)
  local r75_0 = "AddParagraph"
  r75_0 = {
    Title = "Trạng Thái Elite",
    Content = "",
  }
  r73_0 = r2_0.Main:[r75_0](r75_0)
  spawn(function()
    -- line: [0, 0] id: 241
    while wait() do
      pcall(function()
        -- line: [0, 0] id: 242
        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
          r73_0:SetDesc("Elite Boss: ✅️ | Killed:  " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        else
          r73_0:SetDesc("Elite Boss: ❌️ | Killed: " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        end
      end)
    end
  end)
  local r76_0 = "AddToggle"
  r76_0 = "ToggleElite"
  r74_0 = r2_0.Main:[r76_0](r76_0, {
    Title = " ánh Elite",
    Description = "",
    Default = false,
  })
  local r77_0 = "OnChanged"
  function r77_0(r0_91)
    -- line: [0, 0] id: 91
    _G.AutoElite = r0_91
  end
  r74_0:[r77_0](r77_0)
  r77_0 = "SetValue"
  r77_0 = false
  r3_0.ToggleElite:[r77_0](r77_0)
  spawn(function()
    -- line: [0, 0] id: 169
    while task.wait() do
      local r0_169 = _G.AutoElite
      if r0_169 then
        pcall(function()
          -- line: [0, 0] id: 170
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
          if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") then
              if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                for r3_170, r4_170 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r4_170:FindFirstChild("Humanoid") and r4_170:FindFirstChild("HumanoidRootPart") and 0 < r4_170.Humanoid.Health and (r4_170.Name == "Diablo" or r4_170.Name == "Deandre" or r4_170.Name == "Urban") then
                    while true do
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      EquipTool(SelectWeapon)
                      AutoHaki()
                      Tween2(r4_170.HumanoidRootPart.CFrame * Pos)
                      r4_170.Humanoid.WalkSpeed = 0
                      r4_170.HumanoidRootPart.CanCollide = false
                      r4_170.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      if _G.AutoElite ~= false then
                        local r5_170 = r4_170.Humanoid.Health
                        if r5_170 > 0 then
                          r5_170 = r4_170.Parent
                          if not r5_170 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
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
  end)
  -- close: r37_0
end
if Sea3 then
  r39_0 = "AddSection"
  r39_0 = " ảo Bí Ẩn"
  r37_0 = r2_0.Sea:[r39_0](r39_0)
  r38_0 = r2_0.Sea
  local r40_0 = "AddParagraph"
  r40_0 = {
    Title = "Trạng Thái",
  }
  r42_0 = ""
  r40_0.Content = r42_0
  r38_0 = r38_0:[r40_0](r40_0)
  task.spawn(function()
    -- line: [0, 0] id: 200
    while task.wait() do
      pcall(function()
        -- line: [0, 0] id: 201
        local r0_201 = game:GetService("Lighting").Sky.MoonTextureId
        if r0_201 == "http://www.roblox.com/asset/?id=9709149431" then
          FullMoonStatus = "100%"
        elseif r0_201 == "http://www.roblox.com/asset/?id=9709149052" then
          FullMoonStatus = "75%"
        elseif r0_201 == "http://www.roblox.com/asset/?id=9709143733" then
          FullMoonStatus = "50%"
        elseif r0_201 == "http://www.roblox.com/asset/?id=9709150401" then
          FullMoonStatus = "25%"
        elseif r0_201 == "http://www.roblox.com/asset/?id=9709149680" then
          FullMoonStatus = "15%"
        else
          FullMoonStatus = "0%"
        end
      end)
    end
  end)
  task.spawn(function()
    -- line: [0, 0] id: 113
    while task.wait() do
      pcall(function()
        -- line: [0, 0] id: 114
        if game.Workspace.Map:FindFirstChild("MysticIsland") then
          MirageStatus = "  ️"
        else
          MirageStatus = "  ️"
        end
      end)
    end
  end)
  spawn(function()
    -- line: [0, 0] id: 411
    pcall(function()
      -- line: [0, 0] id: 412
      while wait() do
        r38_0:SetDesc(" ảo Bí Ẩn: " .. MirageStatus .. " | Trăng Tròn: " .. FullMoonStatus)
      end
    end)
  end)
  local r41_0 = "AddButton"
  r41_0 = {}
  r42_0 = "Bay Đến Chỗ Cao"
  r41_0.Title = r42_0
  r42_0 = "Description"
  r43_0 = ""
  r41_0[r42_0] = r43_0
  r42_0 = "Callback"
  function r43_0()
    -- line: [0, 0] id: 208
    TweenToHighestPoint()
  end
  r41_0[r42_0] = r43_0
  r2_0.Sea:[r41_0](r41_0)
  function TweenToHighestPoint()
    -- line: [0, 0] id: 253
    local r0_253 = getHighestPoint()
    if r0_253 then
      Tween2(r0_253.CFrame * CFrame.new(0, 211.88, 0))
    end
  end
  function getHighestPoint()
    -- line: [0, 0] id: 295
    if not game.Workspace.Map:FindFirstChild("MysticIsland") then
      return nil
    end
    for r3_295, r4_295 in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
      if r4_295:IsA("MeshPart") and r4_295.MeshId == "rbxassetid://6745037796" then
        return r4_295
      end
    end
  end
  -- close: r37_0
end
r39_0 = "AddToggle"
r39_0 = "ToggleTpAdvanced"
local r40_0 = {
  Title = "Bay Đến Advanced Fruit Dealer",
}
r42_0 = ""
r40_0.Description = r42_0
r42_0 = false
r40_0.Default = r42_0
r37_0 = r2_0.Sea:[r39_0](r39_0, r40_0)
r40_0 = "OnChanged"
(function(r0_106)
  -- line: [0, 0] id: 106
  _G.AutoTpAdvanced = r0_106
end):[r40_0](r40_0)
r38_0 = spawn
r38_0(function()
  -- line: [0, 0] id: 466
  while wait() do
    local r0_466 = _G.AutoTpAdvanced
    if r0_466 then
      r0_466 = game.ReplicatedStorage.NPCs:FindFirstChild("Advanced Fruit Dealer")
      if r0_466 and r0_466:IsA("Model") then
        local r1_466 = r0_466.PrimaryPart and r0_466.PrimaryPart.Position
        if r1_466 then
          Tween2(CFrame.new(r1_466))
        end
      end
    end
  end
end)
r38_0 = r2_0.Sea
r40_0 = "AddToggle"
r40_0 = "ToggleTweenGear"
local r41_0 = {}
r42_0 = "Bay Đến Bánh Răng"
r41_0.Title = r42_0
r42_0 = "Description"
r43_0 = ""
r41_0[r42_0] = r43_0
r42_0 = "Default"
r43_0 = false
r41_0[r42_0] = r43_0
r38_0 = r38_0:[r40_0](r40_0, r41_0)
r41_0 = "OnChanged"
function r41_0(r0_291)
  -- line: [0, 0] id: 291
  _G.TweenToGear = r0_291
end
r38_0:[r41_0](r41_0)
r41_0 = "SetValue"
r41_0 = false
r3_0.ToggleTweenGear:[r41_0](r41_0)
spawn(function()
  -- line: [0, 0] id: 58
  pcall(function()
    -- line: [0, 0] id: 59
    while wait() do
      local r0_59 = _G.TweenToGear
      if r0_59 then
        r0_59 = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
        if r0_59 then
          r0_59 = pairs
          for r3_59, r4_59 in r0_59(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
            if r4_59:IsA("MeshPart") and r4_59.Material == Enum.Material.Neon then
              Tween2(r4_59.CFrame)
            end
          end
        end
      end
    end
  end)
end)
r41_0 = "AddToggle"
r41_0 = "Togglelockmoon"
r42_0 = {}
r43_0 = "Nhìn Trăng Và Dùng Tộc"
r42_0.Title = r43_0
r43_0 = "Description"
r44_0 = ""
r42_0[r43_0] = r44_0
r43_0 = "Default"
r44_0 = false
r42_0[r43_0] = r44_0
r39_0 = r2_0.Sea:[r41_0](r41_0, r42_0)
r42_0 = "OnChanged"
(function(r0_568)
  -- line: [0, 0] id: 568
  _G.AutoLockMoon = r0_568
end):[r42_0](r42_0)
r42_0 = "SetValue"
r42_0 = false
r3_0.Togglelockmoon:[r42_0](r42_0)
spawn(function()
  -- line: [0, 0] id: 257
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 258
      if _G.AutoLockMoon then
        game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, game.Workspace.CurrentCamera.CFrame.p + game.Lighting:GetMoonDirection() * 100)
      end
    end)
  end
end)
spawn(function()
  -- line: [0, 0] id: 182
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 183
      if _G.AutoLockMoon then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
      end
    end)
  end
end)
r42_0 = "AddToggle"
r42_0 = "ToggleAutoSaber"
r43_0 = {}
r44_0 = "Saber"
r43_0.Title = r44_0
r44_0 = "Description"
r45_0 = ""
r43_0[r44_0] = r45_0
r44_0 = "Default"
r45_0 = false
r43_0[r44_0] = r45_0
r40_0 = r2_0.Item:[r42_0](r42_0, r43_0)
r43_0 = "OnChanged"
(function(r0_306)
  -- line: [0, 0] id: 306
  _G.Auto_Saber = r0_306
end):[r43_0](r43_0)
r43_0 = "SetValue"
r43_0 = false
r3_0.ToggleAutoSaber:[r43_0](r43_0)
function r42_0()
  -- line: [0, 0] id: 103
  while task.wait() do
    local r0_103 = _G.Auto_Saber
    if r0_103 then
      r0_103 = game.Players.LocalPlayer.Data.Level.Value
      if r0_103 >= 200 then
        pcall(function()
          -- line: [0, 0] id: 104
          if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
            if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
              if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 0.0000000030717151, -0.928667724, 0.0000000397099491, 1, 0.0000000191679348, 0.928667724, -0.0000000439869794, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
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
                Tween(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 0.0000000030717151, -0.928667724, 0.0000000397099491, 1, 0.0000000191679348, 0.928667724, -0.0000000439869794, 0.37091279))
              end
            elseif game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
              if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                EquipTool("Torch")
                Tween(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -0.00000000128799094, 0.761243105, -0.000000000570652914, 1, 0.00000000120584542, -0.761243105, 0.000000000347544882, -0.648466587))
              else
                Tween(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.0000342372805, -0.258850515, 0.965917408))
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
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 and (game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader")) then
              Tween(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
              for r3_104, r4_104 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if r4_104.Name == "Mob Leader" then
                  if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") and r4_104:FindFirstChild("Humanoid") and r4_104:FindFirstChild("HumanoidRootPart") and 0 < r4_104.Humanoid.Health then
                    while true do
                      task.wait(_G.Fast_Delay)
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      r4_104.HumanoidRootPart.CanCollide = false
                      r4_104.Humanoid.WalkSpeed = 0
                      r4_104.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      Tween(r4_104.HumanoidRootPart.CFrame * Pos)
                      AttackNoCoolDown()
                      if r4_104.Humanoid.Health > 0 then
                        local r5_104 = _G.Auto_Saber
                        if not r5_104 then
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                  if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * Pos)
                  end
                end
              end
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
              wait(0.5)
              EquipTool("Relic")
              wait(0.5)
              Tween(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 0.00000000566906877, 0.481375456, 0.0000000253851997, 1, -0.0000000579995607, -0.481375456, 0.0000000630572643, 0.876514494))
            end
          elseif game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
            for r3_104, r4_104 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if r4_104:FindFirstChild("Humanoid") and r4_104:FindFirstChild("HumanoidRootPart") and 0 < r4_104.Humanoid.Health and r4_104.Name == "Saber Expert" then
                while true do
                  task.wait(_G.Fast_Delay)
                  EquipTool(SelectWeapon)
                  Tween(r4_104.HumanoidRootPart.CFrame * Pos)
                  r4_104.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  r4_104.HumanoidRootPart.Transparency = 1
                  r4_104.Humanoid.JumpPower = 0
                  r4_104.Humanoid.WalkSpeed = 0
                  r4_104.HumanoidRootPart.CanCollide = false
                  bringmob = true
                  FarmPos = r4_104.HumanoidRootPart.CFrame
                  MonFarm = r4_104.Name
                  AttackNoCoolDown()
                  if r4_104.Humanoid.Health > 0 then
                    local r5_104 = _G.Auto_Saber
                    if not r5_104 then
                      break
                    end
                  else
                    break
                  end
                end
                bringmob = true
                if r4_104.Humanoid.Health <= 0 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                end
              end
            end
          end
        end)
      end
    end
  end
end
spawn(r42_0)
r43_0 = "AddToggle"
r43_0 = "ToggleAutoPoleV1"
r44_0 = {}
r45_0 = "Pole V1"
r44_0.Title = r45_0
r45_0 = "Description"
r44_0[r45_0] = ""
r45_0 = "Default"
r44_0[r45_0] = false
r41_0 = r2_0.Item:[r43_0](r43_0, r44_0)
r44_0 = "OnChanged"
(function(r0_275)
  -- line: [0, 0] id: 275
  _G.Auto_PoleV1 = r0_275
end):[r44_0](r44_0)
r42_0 = "ToggleAutoPoleV1"
r42_0 = r3_0[r42_0]
r44_0 = "SetValue"
r44_0 = false
r42_0:[r44_0](r44_0)
r42_0 = CFrame
r42_0 = r42_0.new
r43_0 = -7748.0185546875
r44_0 = 5606.80615234375
r45_0 = -2305.898681640625
r42_0 = r42_0(r43_0, r44_0, r45_0)
r43_0 = spawn
function r44_0()
  -- line: [0, 0] id: 194
  while wait() do
    local r0_194 = _G.Auto_PoleV1
    if r0_194 then
      pcall(function()
        -- line: [0, 0] id: 195
        if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
          for r3_195, r4_195 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_195.Name == "Thunder God" and r4_195:FindFirstChild("Humanoid") and r4_195:FindFirstChild("HumanoidRootPart") and 0 < r4_195.Humanoid.Health then
              while true do
                task.wait(_G.Fast_Delay)
                AutoHaki()
                EquipTool(SelectWeapon)
                r4_195.HumanoidRootPart.CanCollide = false
                r4_195.Humanoid.WalkSpeed = 0
                r4_195.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                Tween(r4_195.HumanoidRootPart.CFrame * Pos)
                AttackNoCoolDown()
                if _G.Auto_PoleV1 then
                  local r5_195 = r4_195.Parent
                  if r5_195 then
                    r5_195 = r4_195.Humanoid.Health
                    if r5_195 <= 0 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r42_0.Position).Magnitude < 1500 then
          Tween(r42_0)
        end
        Tween(CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625))
        if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end
r43_0(r44_0)
r43_0 = r2_0.Item
r45_0 = "AddToggle"
r45_0 = "ToggleAutoSaw"
local r46_0 = {
  Title = "Cưa Cá Mập",
}
r48_0 = ""
r46_0.Description = r48_0
r48_0 = false
r46_0.Default = r48_0
r43_0 = r43_0:[r45_0](r45_0, r46_0)
r46_0 = "OnChanged"
function r46_0(r0_435)
  -- line: [0, 0] id: 435
  _G.Auto_Saw = r0_435
end
r43_0:[r46_0](r46_0)
r44_0 = "ToggleAutoSaw"
r44_0 = r3_0[r44_0]
r46_0 = "SetValue"
r46_0 = false
r44_0:[r46_0](r46_0)
r44_0 = CFrame
r44_0 = r44_0.new
r45_0 = -690.33081054688
r44_0 = r44_0(r45_0, 15.09425163269, 1582.2380371094)
r45_0 = spawn
r45_0(function()
  -- line: [0, 0] id: 35
  while wait() do
    local r0_35 = _G.Auto_Saw
    if r0_35 then
      pcall(function()
        -- line: [0, 0] id: 36
        if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
          for r3_36, r4_36 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_36.Name == "The Saw" and r4_36:FindFirstChild("Humanoid") and r4_36:FindFirstChild("HumanoidRootPart") and 0 < r4_36.Humanoid.Health then
              while true do
                task.wait(_G.Fast_Delay)
                AutoHaki()
                EquipTool(SelectWeapon)
                r4_36.HumanoidRootPart.CanCollide = false
                r4_36.Humanoid.WalkSpeed = 0
                r4_36.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                Tween(r4_36.HumanoidRootPart.CFrame * Pos)
                AttackNoCoolDown()
                if _G.Auto_Saw then
                  local r5_36 = r4_36.Parent
                  if r5_36 then
                    r5_36 = r4_36.Humanoid.Health
                    if r5_36 <= 0 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r44_0.Position).Magnitude < 1500 then
          Tween(r44_0)
        end
        Tween(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
        if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end)
r45_0 = r2_0.Item
local r47_0 = "AddToggle"
r47_0 = "ToggleAutoWarden"
r48_0 = {}
r49_0 = "Kiếm Quản Ngục"
r48_0.Title = r49_0
r49_0 = "Description"
r50_0 = ""
r48_0[r49_0] = r50_0
r49_0 = "Default"
r50_0 = false
r48_0[r49_0] = r50_0
r45_0 = r45_0:[r47_0](r47_0, r48_0)
r48_0 = "OnChanged"
function r48_0(r0_562)
  -- line: [0, 0] id: 562
  _G.Auto_Warden = r0_562
end
r45_0:[r48_0](r48_0)
r48_0 = "SetValue"
r48_0 = false
r3_0.ToggleAutoWarden:[r48_0](r48_0)
r48_0 = 24.86684226989746
r49_0 = 832.1885375976563
r46_0 = CFrame.new(5186.14697265625, r48_0, r49_0)
function r48_0()
  -- line: [0, 0] id: 395
  while wait() do
    local r0_395 = _G.Auto_Warden
    if r0_395 then
      pcall(function()
        -- line: [0, 0] id: 396
        if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
          for r3_396, r4_396 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_396.Name == "Chief Warden" and r4_396:FindFirstChild("Humanoid") and r4_396:FindFirstChild("HumanoidRootPart") and 0 < r4_396.Humanoid.Health then
              while true do
                task.wait(_G.Fast_Delay)
                AutoHaki()
                EquipTool(SelectWeapon)
                r4_396.HumanoidRootPart.CanCollide = false
                r4_396.Humanoid.WalkSpeed = 0
                r4_396.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                Tween(r4_396.HumanoidRootPart.CFrame * Pos)
                AttackNoCoolDown()
                if _G.Auto_Warden then
                  local r5_396 = r4_396.Parent
                  if r5_396 then
                    r5_396 = r4_396.Humanoid.Health
                    if r5_396 <= 0 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r46_0.Position).Magnitude < 1500 then
          Tween(r46_0)
        end
        Tween(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976563))
        if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end
spawn(r48_0)
if Sea3 then
  r49_0 = "AddToggle"
  r49_0 = "ToggleHallow"
  r50_0 = {}
  r51_0 = "Lưỡi Hái"
  r50_0.Title = r51_0
  r51_0 = "Description"
  r52_0 = ""
  r50_0[r51_0] = r52_0
  r51_0 = "Default"
  r52_0 = false
  r50_0[r51_0] = r52_0
  r47_0 = r2_0.Item:[r49_0](r49_0, r50_0)
  r50_0 = "OnChanged"
  function r50_0(r0_346)
    -- line: [0, 0] id: 346
    AutoHallowSycthe = r0_346
  end
  r47_0:[r50_0](r50_0)
  r48_0 = "ToggleHallow"
  r48_0 = r3_0[r48_0]
  r50_0 = "SetValue"
  r50_0 = false
  r48_0:[r50_0](r50_0)
  r48_0 = spawn
  function r49_0()
    -- line: [0, 0] id: 250
    while wait() do
      local r0_250 = AutoHallowSycthe
      if r0_250 then
        pcall(function()
          -- line: [0, 0] id: 251
          if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
            for r3_251, r4_251 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if string.find(r4_251.Name, "Soul Reaper") then
                while true do
                  wait(_G.Fast_Delay)
                  AttackNoCoolDown()
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  r4_251.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  Tween(r4_251.HumanoidRootPart.CFrame * Pos)
                  r4_251.HumanoidRootPart.Transparency = 1
                  sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                  if r4_251.Humanoid.Health > 0 then
                    local r5_251 = AutoHallowSycthe
                    if r5_251 == false then
                      break
                    end
                  else
                    break
                  end
                end
              end
            end
          elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
            repeat
              Tween(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
              wait()
            until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
            wait()
            EquipTool("Hallow Essence")
          elseif game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * Pos)
          end
        end)
      end
    end
  end
  r48_0(r49_0)
  r48_0 = spawn
  function r49_0()
    -- line: [0, 0] id: 454
    while wait() do
      local r0_454 = AutoHallowSycthe
      if r0_454 then
        r0_454 = {}
        r0_454[1] = "Bones"
        r0_454[2] = "Buy"
        r0_454[3] = 1
        r0_454[4] = 1
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_454))
      end
    end
  end
  r48_0(r49_0)
  r48_0 = r2_0.Item
  r50_0 = "AddToggle"
  r50_0 = "ToggleYama"
  r51_0 = {}
  r52_0 = "Yama"
  r51_0.Title = r52_0
  r52_0 = "Description"
  r53_0 = ""
  r51_0[r52_0] = r53_0
  r52_0 = "Default"
  r53_0 = false
  r51_0[r52_0] = r53_0
  r48_0 = r48_0:[r50_0](r50_0, r51_0)
  r51_0 = "OnChanged"
  function r51_0(r0_82)
    -- line: [0, 0] id: 82
    _G.AutoYama = r0_82
  end
  r48_0:[r51_0](r51_0)
  r49_0 = "ToggleYama"
  r49_0 = r3_0[r49_0]
  r51_0 = "SetValue"
  r51_0 = false
  r49_0:[r51_0](r51_0)
  r49_0 = spawn
  function r50_0()
    -- line: [0, 0] id: 366
    while wait() do
      local r0_366 = _G.AutoYama
      if r0_366 then
        r0_366 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
        if r0_366 >= 30 then
          wait()
          fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
          r0_366 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama")
          if not r0_366 then
            r0_366 = _G.AutoYama
            if r0_366 then
              break
            end
          end
        end
      end
    end
  end
  r49_0(r50_0)
  r49_0 = r2_0.Item
  r51_0 = "AddToggle"
  r51_0 = "ToggleTushita"
  r52_0 = {}
  r53_0 = "Tushita"
  r52_0.Title = r53_0
  r53_0 = "Description"
  r54_0 = ""
  r52_0[r53_0] = r54_0
  r53_0 = "Default"
  r54_0 = false
  r52_0[r53_0] = r54_0
  r49_0 = r49_0:[r51_0](r51_0, r52_0)
  r52_0 = "OnChanged"
  function r52_0(r0_402)
    -- line: [0, 0] id: 402
    AutoTushita = r0_402
  end
  r49_0:[r52_0](r52_0)
  r50_0 = "ToggleTushita"
  r50_0 = r3_0[r50_0]
  r52_0 = "SetValue"
  r52_0 = false
  r50_0:[r52_0](r52_0)
  r50_0 = spawn
  function r51_0()
    -- line: [0, 0] id: 63
    while wait() do
      local r0_63 = AutoTushita
      if r0_63 then
        r0_63 = game:GetService("Workspace").Enemies:FindFirstChild("Longma")
        if r0_63 then
          r0_63 = pairs
          for r3_63, r4_63 in r0_63(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_63.Name == ("Longma" or r4_63.Name == "Longma") and 0 < r4_63.Humanoid.Health and r4_63:IsA("Model") and r4_63:FindFirstChild("Humanoid") and r4_63:FindFirstChild("HumanoidRootPart") then
              while true do
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                AutoHaki()
                if not game.Players.LocalPlayer.Character:FindFirstChild(SelectWeapon) then
                  wait()
                  EquipTool(SelectWeapon)
                end
                FarmPos = r4_63.HumanoidRootPart.CFrame
                r4_63.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_63.Humanoid.JumpPower = 0
                r4_63.Humanoid.WalkSpeed = 0
                r4_63.HumanoidRootPart.CanCollide = false
                r4_63.Humanoid:ChangeState(11)
                Tween(r4_63.HumanoidRootPart.CFrame * Pos)
                local r5_63 = AutoTushita
                if r5_63 then
                  r5_63 = r4_63.Parent
                  if r5_63 then
                    r5_63 = r4_63.Humanoid.Health
                    if r5_63 <= 0 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        else
          Tween(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
        end
      end
    end
  end
  r50_0(r51_0)
  r50_0 = r2_0.Item
  r52_0 = "AddToggle"
  r52_0 = "ToggleHoly"
  r53_0 = {}
  r54_0 = " ốt Đuốc"
  r53_0.Title = r54_0
  r54_0 = "Description"
  r55_0 = ""
  r53_0[r54_0] = r55_0
  r54_0 = "Default"
  r55_0 = false
  r53_0[r54_0] = r55_0
  r50_0 = r50_0:[r52_0](r52_0, r53_0)
  r53_0 = "OnChanged"
  function r53_0(r0_516)
    -- line: [0, 0] id: 516
    _G.Auto_Holy_Torch = r0_516
  end
  r50_0:[r53_0](r53_0)
  r51_0 = "ToggleHoly"
  r51_0 = r3_0[r51_0]
  r53_0 = "SetValue"
  r53_0 = false
  r51_0:[r53_0](r53_0)
  r51_0 = spawn
  function r52_0()
    -- line: [0, 0] id: 457
    while wait() do
      local r0_457 = _G.Auto_Holy_Torch
      if r0_457 then
        pcall(function()
          -- line: [0, 0] id: 458
          wait()
          while true do
            Tween(CFrame.new(-10752, 417, -9366))
            wait()
            if _G.Auto_Holy_Torch then
              local r0_458 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10752, 417, -9366)).Magnitude
              if r0_458 <= 10 then
                break
              end
            else
              break
            end
          end
          wait()
          while true do
            Tween(CFrame.new(-11672, 334, -9474))
            wait()
            if _G.Auto_Holy_Torch then
              local r0_458 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-11672, 334, -9474)).Magnitude
              if r0_458 <= 10 then
                break
              end
            else
              break
            end
          end
          wait()
          while true do
            Tween(CFrame.new(-12132, 521, -10655))
            wait()
            if _G.Auto_Holy_Torch then
              local r0_458 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12132, 521, -10655)).Magnitude
              if r0_458 <= 10 then
                break
              end
            else
              break
            end
          end
          wait()
          while true do
            Tween(CFrame.new(-13336, 486, -6985))
            wait()
            if _G.Auto_Holy_Torch then
              local r0_458 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13336, 486, -6985)).Magnitude
              if r0_458 <= 10 then
                break
              end
            else
              break
            end
          end
          wait()
          while true do
            Tween(CFrame.new(-13489, 332, -7925))
            wait()
            if _G.Auto_Holy_Torch then
              local r0_458 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13489, 332, -7925)).Magnitude
              if r0_458 <= 10 then
                break
              end
            else
              break
            end
          end
        end)
      end
    end
  end
  r51_0(r52_0)
end
r49_0 = "AddToggle"
r49_0 = "ToggleAutoCanvander"
r50_0 = {}
r51_0 = "Canvander"
r50_0.Title = r51_0
r51_0 = "Description"
r52_0 = ""
r50_0[r51_0] = r52_0
r51_0 = "Default"
r52_0 = false
r50_0[r51_0] = r52_0
r47_0 = r2_0.Item:[r49_0](r49_0, r50_0)
r50_0 = "OnChanged"
(function(r0_140)
  -- line: [0, 0] id: 140
  _G.Auto_Canvander = r0_140
end):[r50_0](r50_0)
r48_0 = "ToggleAutoCanvander"
r48_0 = r3_0[r48_0]
r50_0 = "SetValue"
r50_0 = false
r48_0:[r50_0](r50_0)
r48_0 = CFrame
r48_0 = r48_0.new
r49_0 = 5311.07421875
r50_0 = 426.0243835449219
r51_0 = 165.12762451171875
r48_0 = r48_0(r49_0, r50_0, r51_0)
r49_0 = spawn
function r50_0()
  -- line: [0, 0] id: 49
  while wait() do
    local r0_49 = _G.Auto_Canvander
    if r0_49 then
      pcall(function()
        -- line: [0, 0] id: 50
        if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
          for r3_50, r4_50 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_50.Name == "Beautiful Pirate" and r4_50:FindFirstChild("Humanoid") and r4_50:FindFirstChild("HumanoidRootPart") and 0 < r4_50.Humanoid.Health then
              while true do
                task.wait(_G.Fast_Delay)
                AutoHaki()
                EquipTool(SelectWeapon)
                r4_50.HumanoidRootPart.CanCollide = false
                r4_50.Humanoid.WalkSpeed = 0
                r4_50.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                Tween(r4_50.HumanoidRootPart.CFrame * Pos)
                AttackNoCoolDown()
                if _G.Auto_Canvander then
                  local r5_50 = r4_50.Parent
                  if r5_50 then
                    r5_50 = r4_50.Humanoid.Health
                    if r5_50 <= 0 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r48_0.Position).Magnitude < 1500 then
          Tween(r48_0)
        end
        Tween(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875))
        if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end
r49_0(r50_0)
r49_0 = r2_0.Item
r51_0 = "AddToggle"
r51_0 = "ToggleAutoMusketeerHat"
r52_0 = {}
r53_0 = "Mũ Lính Ngự Lâm"
r52_0.Title = r53_0
r53_0 = "Description"
r54_0 = ""
r52_0[r53_0] = r54_0
r53_0 = "Default"
r54_0 = false
r52_0[r53_0] = r54_0
r49_0 = r49_0:[r51_0](r51_0, r52_0)
r52_0 = "OnChanged"
function r52_0(r0_8)
  -- line: [0, 0] id: 8
  _G.Auto_MusketeerHat = r0_8
end
r49_0:[r52_0](r52_0)
r50_0 = "ToggleAutoMusketeerHat"
r50_0 = r3_0[r50_0]
r52_0 = "SetValue"
r52_0 = false
r50_0:[r52_0](r52_0)
r50_0 = spawn
function r51_0()
  -- line: [0, 0] id: 570
  pcall(function()
    -- line: [0, 0] id: 571
    while wait(0.1) do
      local r0_571 = _G.Auto_MusketeerHat
      if r0_571 then
        r0_571 = game:GetService("Players").LocalPlayer.Data.Level.Value
        local r4_571 = nil	-- notice: implicit variable refs by block#[18, 19, 20, 28, 29, 30, 31, 32, 37, 38, 42]
        if r0_571 >= 1800 then
          r0_571 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits
          if r0_571 == false then
            r0_571 = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate")
            if r0_571 then
              r0_571 = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50")
              if r0_571 then
                r0_571 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                if r0_571 == true then
                  r0_571 = game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate")
                  if r0_571 then
                    r0_571 = pairs
                    for r3_571, r4_571 in r0_571(game:GetService("Workspace").Enemies:GetChildren()) do
                      if r4_571.Name == "Forest Pirate" then
                        while true do
                          task.wait(_G.Fast_Delay)
                          pcall(function()
                            -- line: [0, 0] id: 573
                            EquipTool(SelectWeapon)
                            AutoHaki()
                            r4_571.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            Tween(r4_571.HumanoidRootPart.CFrame * Pos)
                            r4_571.HumanoidRootPart.CanCollide = false
                            AttackNoCoolDown()
                            PosMon = r4_571.HumanoidRootPart.CFrame
                            MonFarm = r4_571.Name
                            bringmob = true
                          end)
                          if _G.Auto_MusketeerHat ~= false then
                            local r5_571 = r4_571.Parent
                            if r5_571 then
                              r5_571 = r4_571.Humanoid.Health
                              if r5_571 > 0 then
                                r5_571 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                if r5_571 == false then
                                  break
                                end
                              else
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        end
                        bringmob = false
                      end
                      -- close: r3_571
                    end
                  else
                    bringmob = false
                    r4_571 = -7964.5537109375
                    Tween(CFrame.new(-13206.452148438, 425.89199829102, r4_571))
                  end
                end
              end
            end
            r4_571 = -7675.4892578125
            Tween(CFrame.new(-12443.8671875, 332.40396118164, r4_571))
            r0_571 = Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125)
            r0_571 = (r0_571 - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if r0_571 <= 30 then
              wait(1.5)
              r4_571 = 1
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", r4_571)
            end
          end
        end
        r0_571 = game:GetService("Players").LocalPlayer.Data.Level.Value
        if r0_571 >= 1800 then
          r0_571 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss
          if r0_571 == false then
            r0_571 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
            if r0_571 then
              r0_571 = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")
              if r0_571 then
                r0_571 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                if r0_571 == true then
                  r0_571 = game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant")
                  if r0_571 then
                    r0_571 = pairs
                    for r3_571, r4_571 in r0_571(game:GetService("Workspace").Enemies:GetChildren()) do
                      if r4_571.Name == "Captain Elephant" then
                        OldCFrameElephant = r4_571.HumanoidRootPart.CFrame
                        while true do
                          task.wait(_G.Fast_Delay)
                          pcall(function()
                            -- line: [0, 0] id: 572
                            EquipTool(SelectWeapon)
                            AutoHaki()
                            r4_571.HumanoidRootPart.CanCollide = false
                            r4_571.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            Tween(r4_571.HumanoidRootPart.CFrame * Pos)
                            r4_571.HumanoidRootPart.CanCollide = false
                            r4_571.HumanoidRootPart.CFrame = OldCFrameElephant
                            AttackNoCoolDown()
                          end)
                          if _G.Auto_MusketeerHat ~= false then
                            local r5_571 = r4_571.Humanoid.Health
                            if r5_571 > 0 then
                              r5_571 = r4_571.Parent
                              if r5_571 then
                                r5_571 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                if r5_571 == false then
                                  break
                                end
                              else
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        end
                      end
                      -- close: r3_571
                    end
                  else
                    r4_571 = -8225.208984375
                    Tween(CFrame.new(-13374.889648438, 421.27752685547, r4_571))
                  end
                end
              end
            end
            r4_571 = -7675.4892578125
            Tween(CFrame.new(-12443.8671875, 332.40396118164, r4_571))
            r0_571 = (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if r0_571 <= 4 then
              wait(1.5)
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
            end
          end
        end
        r0_571 = game:GetService("Players").LocalPlayer.Data.Level.Value
        if r0_571 >= 1800 then
          r0_571 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
          if r0_571 == 2 then
            r4_571 = -9872.8203125
            Tween(CFrame.new(-12512.138671875, 340.39279174805, r4_571))
          end
        end
      end
    end
  end)
end
r50_0(r51_0)
r50_0 = r2_0.Item
r52_0 = "AddToggle"
r52_0 = "ToggleAutoObservationV2"
r53_0 = {}
r54_0 = "Haki Quan Sát V2"
r53_0.Title = r54_0
r54_0 = "Description"
r55_0 = ""
r53_0[r54_0] = r55_0
r54_0 = "Default"
r55_0 = false
r53_0[r54_0] = r55_0
r50_0 = r50_0:[r52_0](r52_0, r53_0)
r53_0 = "OnChanged"
function r53_0(r0_159)
  -- line: [0, 0] id: 159
  _G.Auto_ObservationV2 = r0_159
end
r50_0:[r53_0](r53_0)
r51_0 = "ToggleAutoObservationV2"
r51_0 = r3_0[r51_0]
r53_0 = "SetValue"
r53_0 = false
r51_0:[r53_0](r53_0)
r51_0 = spawn
function r52_0()
  -- line: [0, 0] id: 38
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 39
      if _G.Auto_ObservationV2 then
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 3 then
          _G.Auto_MusketeerHat = false
          if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") then
            while true do
              Tween(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625))
              wait()
              if _G.Auto_ObservationV2 then
                local r0_39 = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude
                if r0_39 <= 10 then
                  break
                end
              else
                break
              end
            end
            wait(0.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
          elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
            while true do
              Tween(CFrame.new(-10920.125, 624.20275878906, -10266.995117188))
              wait()
              if _G.Auto_ObservationV2 then
                local r0_39 = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude
                if r0_39 <= 10 then
                  break
                end
              else
                break
              end
            end
            wait(0.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start")
            wait(1)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
          else
            for r3_39, r4_39 in pairs(game:GetService("Workspace"):GetDescendants()) do
              if r4_39.Name == "Apple" or r4_39.Name == "Banana" or r4_39.Name == "Pineapple" then
                r4_39.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                wait()
                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, r4_39.Handle, 0)
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
r51_0(r52_0)
r51_0 = r2_0.Item
r53_0 = "AddToggle"
r53_0 = "ToggleAutoRainbowHaki"
r54_0 = {}
r55_0 = "Haki 7 Màu"
r54_0.Title = r55_0
r55_0 = "Description"
r56_0 = ""
r54_0[r55_0] = r56_0
r55_0 = "Default"
r56_0 = false
r54_0[r55_0] = r56_0
r51_0 = r51_0:[r53_0](r53_0, r54_0)
r54_0 = "OnChanged"
function r54_0(r0_303)
  -- line: [0, 0] id: 303
  _G.Auto_RainbowHaki = r0_303
end
r51_0:[r54_0](r54_0)
r52_0 = "ToggleAutoRainbowHaki"
r52_0 = r3_0[r52_0]
r54_0 = "SetValue"
r54_0 = false
r52_0:[r54_0](r54_0)
r52_0 = spawn
function r53_0()
  -- line: [0, 0] id: 513
  pcall(function()
    -- line: [0, 0] id: 514
    while wait(0.1) do
      local r0_514 = _G.Auto_RainbowHaki
      if r0_514 then
        r0_514 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
        if not r0_514 then
          Tween(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
          r0_514 = Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875)
          r0_514 = (r0_514 - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
          if r0_514 <= 30 then
            wait(1.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
          end
        else
          r0_514 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
          if r0_514 then
            r0_514 = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone")
            if r0_514 then
              r0_514 = game:GetService("Workspace").Enemies:FindFirstChild("Stone")
              if r0_514 then
                r0_514 = pairs
                for r3_514, r4_514 in r0_514(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r4_514.Name == "Stone" then
                    OldCFrameRainbow = r4_514.HumanoidRootPart.CFrame
                    while true do
                      task.wait(_G.Fast_Delay)
                      EquipTool(SelectWeapon)
                      Tween(r4_514.HumanoidRootPart.CFrame * Pos)
                      r4_514.HumanoidRootPart.CanCollide = false
                      r4_514.HumanoidRootPart.CFrame = OldCFrameRainbow
                      r4_514.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                      AttackNoCoolDown()
                      if _G.Auto_RainbowHaki then
                        local r5_514 = r4_514.Humanoid.Health
                        if r5_514 > 0 then
                          r5_514 = r4_514.Parent
                          if r5_514 then
                            r5_514 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            if not r5_514 then
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                end
              else
                Tween(CFrame.new(-1086.11621, 38.8425903, 6768.71436))
              end
            end
          end
          r0_514 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
          if r0_514 then
            r0_514 = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader")
            if r0_514 then
              r0_514 = game:GetService("Workspace").Enemies:FindFirstChild("Hydra Leader")
              if r0_514 then
                r0_514 = pairs
                for r3_514, r4_514 in r0_514(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r4_514.Name == "Hydra Leader" then
                    OldCFrameRainbow = r4_514.HumanoidRootPart.CFrame
                    while true do
                      task.wait(_G.Fast_Delay)
                      EquipTool(SelectWeapon)
                      Tween(r4_514.HumanoidRootPart.CFrame * Pos)
                      r4_514.HumanoidRootPart.CanCollide = false
                      r4_514.HumanoidRootPart.CFrame = OldCFrameRainbow
                      r4_514.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                      AttackNoCoolDown()
                      if _G.Auto_RainbowHaki then
                        local r5_514 = r4_514.Humanoid.Health
                        if r5_514 > 0 then
                          r5_514 = r4_514.Parent
                          if r5_514 then
                            r5_514 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            if not r5_514 then
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                end
              else
                Tween(CFrame.new(5713.98877, 601.922974, 202.751251))
              end
            end
          end
          r0_514 = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral")
          if r0_514 then
            r0_514 = game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral")
            if r0_514 then
              r0_514 = pairs
              for r3_514, r4_514 in r0_514(game:GetService("Workspace").Enemies:GetChildren()) do
                if r4_514.Name == "Kilo Admiral" then
                  OldCFrameRainbow = r4_514.HumanoidRootPart.CFrame
                  while true do
                    task.wait(_G.Fast_Delay)
                    EquipTool(SelectWeapon)
                    Tween(r4_514.HumanoidRootPart.CFrame * Pos)
                    r4_514.HumanoidRootPart.CanCollide = false
                    r4_514.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                    r4_514.HumanoidRootPart.CFrame = OldCFrameRainbow
                    AttackNoCoolDown()
                    if _G.Auto_RainbowHaki then
                      local r5_514 = r4_514.Humanoid.Health
                      if r5_514 > 0 then
                        r5_514 = r4_514.Parent
                        if r5_514 then
                          r5_514 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                          if not r5_514 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  end
                end
              end
            else
              Tween(CFrame.new(2877.61743, 423.558685, -7207.31006))
            end
          else
            r0_514 = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")
            if r0_514 then
              r0_514 = game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant")
              if r0_514 then
                r0_514 = pairs
                for r3_514, r4_514 in r0_514(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r4_514.Name == "Captain Elephant" then
                    OldCFrameRainbow = r4_514.HumanoidRootPart.CFrame
                    while true do
                      task.wait(_G.Fast_Delay)
                      EquipTool(SelectWeapon)
                      Tween(r4_514.HumanoidRootPart.CFrame * Pos)
                      r4_514.HumanoidRootPart.CanCollide = false
                      r4_514.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                      r4_514.HumanoidRootPart.CFrame = OldCFrameRainbow
                      AttackNoCoolDown()
                      if _G.Auto_RainbowHaki then
                        local r5_514 = r4_514.Humanoid.Health
                        if r5_514 > 0 then
                          r5_514 = r4_514.Parent
                          if r5_514 then
                            r5_514 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            if not r5_514 then
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                end
              else
                Tween(CFrame.new(-13485.0283, 331.709259, -8012.4873))
              end
            else
              r0_514 = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate")
              if r0_514 then
                r0_514 = game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate")
                if r0_514 then
                  r0_514 = pairs
                  for r3_514, r4_514 in r0_514(game:GetService("Workspace").Enemies:GetChildren()) do
                    if r4_514.Name == "Beautiful Pirate" then
                      OldCFrameRainbow = r4_514.HumanoidRootPart.CFrame
                      while true do
                        task.wait(_G.Fast_Delay)
                        EquipTool(SelectWeapon)
                        Tween(r4_514.HumanoidRootPart.CFrame * Pos)
                        r4_514.HumanoidRootPart.CanCollide = false
                        r4_514.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        r4_514.HumanoidRootPart.CFrame = OldCFrameRainbow
                        AttackNoCoolDown()
                        if _G.Auto_RainbowHaki then
                          local r5_514 = r4_514.Humanoid.Health
                          if r5_514 > 0 then
                            r5_514 = r4_514.Parent
                            if r5_514 then
                              r5_514 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                              if not r5_514 then
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      end
                    end
                  end
                else
                  Tween(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
                end
              else
                Tween(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                r0_514 = Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875)
                r0_514 = (r0_514 - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if r0_514 <= 30 then
                  wait(1.5)
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                end
              end
            end
          end
        end
      end
    end
  end)
end
r52_0(r53_0)
r52_0 = r2_0.Item
r54_0 = "AddToggle"
r54_0 = "ToggleAutoSkullGuitar"
r55_0 = {}
r56_0 = "Skull Guitar"
r55_0.Title = r56_0
r56_0 = "Description"
r55_0[r56_0] = ""
r56_0 = "Default"
r55_0[r56_0] = false
r52_0 = r52_0:[r54_0](r54_0, r55_0)
r55_0 = "OnChanged"
function r55_0(r0_489)
  -- line: [0, 0] id: 489
  _G.Auto_SkullGuitar = r0_489
end
r52_0:[r55_0](r55_0)
r53_0 = "ToggleAutoSkullGuitar"
r53_0 = r3_0[r53_0]
r55_0 = "SetValue"
r55_0 = false
r53_0:[r55_0](r55_0)
r53_0 = spawn
function r54_0()
  -- line: [0, 0] id: 245
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 246
      if _G.Auto_SkullGuitar and GetWeaponInventory("Skull Guitar") == false then
        if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
          if game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
          elseif game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0 then
            if game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0 then
              Quest2 = true
              while true do
                wait()
                Tween(CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875))
                if (CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 then
                  local r0_246 = _G.Auto_SkullGuitar
                  if not r0_246 then
                    break
                  end
                else
                  break
                end
              end
              wait(1)
              fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
              wait(1)
              fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
              wait(1)
              fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
              wait(1)
              fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
              wait(1)
              fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
              wait(1)
              fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
              wait(1)
              fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
              wait(1)
            elseif game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
              if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
                Quest4 = true
                while true do
                  wait()
                  Tween(CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625))
                  if (CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 then
                    local r0_246 = _G.Auto_SkullGuitar
                    if not r0_246 then
                      break
                    end
                  else
                    break
                  end
                end
                wait(1)
                Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                wait(1)
                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                wait(1)
                Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                wait(1)
                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                wait(1)
                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                wait(1)
                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                wait(1)
                Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                wait(1)
                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                wait(1)
                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                wait(1)
                Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                wait(1)
                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                wait(1)
                Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                wait(1)
                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                wait(1)
                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                wait(1)
                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
              else
                Quest3 = true
              end
            else
              if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                  [1] = "GuitarPuzzleProgress",
                  [2] = "Ghost",
                }))
              end
              if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
                for r3_246, r4_246 in pairs(game.Workspace.Enemies:GetChildren()) do
                  if r4_246:FindFirstChild("HumanoidRootPart") and r4_246:FindFirstChild("Humanoid") and 0 < r4_246.Humanoid.Health and r4_246.Name == "Living Zombie" then
                    EquipTool(SelectWeapon)
                    r4_246.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    r4_246.HumanoidRootPart.Transparency = 1
                    r4_246.Humanoid.JumpPower = 0
                    r4_246.Humanoid.WalkSpeed = 0
                    r4_246.HumanoidRootPart.CanCollide = false
                    r4_246.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                    Tween(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                  end
                end
              else
                Tween(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
              end
            end
          elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Error") then
            Tween(CFrame.new(-8653.2060546875, 140.98487854003906, 6160.033203125))
          elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Nothing") then
            Tween("Wait Full Moon")
          else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
          end
        else
          Tween(CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125))
        end
      end
    end)
  end
end
r53_0(r54_0)
r53_0 = r2_0.Item
r55_0 = "AddToggle"
r55_0 = "ToggleAutoBuddy"
r56_0 = {}
r56_0.Title = "Kiếm Buddy"
r56_0.Description = ""
r56_0.Default = false
r53_0 = r53_0:[r55_0](r55_0, r56_0)
r56_0 = "OnChanged"
function r56_0(r0_544)
  -- line: [0, 0] id: 544
  _G.Auto_Buddy = r0_544
end
r53_0:[r56_0](r56_0)
r54_0 = "ToggleAutoBuddy"
r54_0 = r3_0[r54_0]
r56_0 = "SetValue"
r56_0 = false
r54_0:[r56_0](r56_0)
r54_0 = CFrame
r54_0 = r54_0.new
r55_0 = -731.2034301757813
r56_0 = 381.5658874511719
r54_0 = r54_0(r55_0, r56_0, -11198.4951171875)
r55_0 = spawn
function r56_0()
  -- line: [0, 0] id: 111
  while wait() do
    local r0_111 = _G.Auto_Buddy
    if r0_111 then
      pcall(function()
        -- line: [0, 0] id: 112
        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
          for r3_112, r4_112 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_112.Name == "Cake Queen" and r4_112:FindFirstChild("Humanoid") and r4_112:FindFirstChild("HumanoidRootPart") and 0 < r4_112.Humanoid.Health then
              while true do
                task.wait(_G.Fast_Delay)
                AutoHaki()
                EquipTool(SelectWeapon)
                r4_112.HumanoidRootPart.CanCollide = false
                r4_112.Humanoid.WalkSpeed = 0
                r4_112.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                Tween(r4_112.HumanoidRootPart.CFrame * Pos)
                AttackNoCoolDown()
                if _G.Auto_Buddy then
                  local r5_112 = r4_112.Parent
                  if r5_112 then
                    r5_112 = r4_112.Humanoid.Health
                    if r5_112 <= 0 then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r54_0.Position).Magnitude < 1500 then
          Tween(r54_0)
        end
        Tween(CFrame.new(-731.2034301757813, 381.5658874511719, -11198.4951171875))
        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
          Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * Pos)
        end
      end)
    end
  end
end
r55_0(r56_0)
r55_0 = r2_0.Item
local r57_0 = "AddToggle"
r57_0 = "ToggleAutoDualKatana"
r55_0 = r55_0:[r57_0](r57_0, {
  Title = "Song Kiếm Nguyền Rủa",
  Description = "",
  Default = false,
})
local r58_0 = "OnChanged"
function r58_0(r0_557)
  -- line: [0, 0] id: 557
  _G.Auto_DualKatana = r0_557
end
r55_0:[r58_0](r58_0)
r56_0 = "ToggleAutoDualKatana"
r56_0 = r3_0[r56_0]
r58_0 = "SetValue"
r58_0 = false
r56_0:[r58_0](r58_0)
r56_0 = spawn
r56_0(function()
  -- line: [0, 0] id: 247
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 248
      if _G.Auto_DualKatana then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", "Tushita")
      end
      -- warn: not visited block [8, 9, 10, 11, 12]
      -- block#8:
      -- EquipTool("Tushita")
      -- goto label_112
      -- block#9:
      -- if not game.Players.LocalPlayer.Character:FindFirstChild("Yama")
      -- block#10:
      -- if game.Players.LocalPlayer.Backpack:FindFirstChild("Yama")
      -- block#11:
      -- if game.Players.LocalPlayer.Backpack:FindFirstChild("Yama")
      -- block#12:
      -- EquipTool("Yama")
      -- goto label_112
    end)
  end
end)
r56_0 = spawn
r56_0(function()
  -- line: [0, 0] id: 80
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 81
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
              for r3_81, r4_81 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if (r4_81.Name == "Cursed Skeleton Boss" or r4_81.Name == "Cursed Skeleton") and 0 < r4_81.Humanoid.Health then
                  EquipTool(Sword)
                  Tween(r4_81.HumanoidRootPart.CFrame * pos)
                  r4_81.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  r4_81.HumanoidRootPart.Transparency = 1
                  r4_81.Humanoid.JumpPower = 0
                  r4_81.Humanoid.WalkSpeed = 0
                  r4_81.HumanoidRootPart.CanCollide = false
                  bringmob = true
                  FarmPos = r4_81.HumanoidRootPart.CFrame
                  MonFarm = r4_81.Name
                  AttackNoCoolDown()
                end
              end
            end
          elseif (CFrame.new(-12361.7060546875, 603.3547973632813, -6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
            wait(1)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
            wait(1)
            Tween(CFrame.new(-12361.7060546875, 603.3547973632813, -6550.5341796875))
            wait(1.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            wait(1.5)
            Tween(CFrame.new(-12253.5419921875, 598.8999633789063, -6546.8388671875))
          else
            Tween(CFrame.new(-12361.7060546875, 603.3547973632813, -6550.5341796875))
          end
        end
      end
    end)
  end
end)
r56_0 = spawn
r56_0(function()
  -- line: [0, 0] id: 429
  while wait() do
    local r0_429 = Auto_Quest_Yama_1
    if r0_429 then
      pcall(function()
        -- line: [0, 0] id: 430
        if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
          for r3_430, r4_430 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_430.Name == "Mythological Pirate" then
              while true do
                wait()
                Tween(r4_430.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2))
                if _G.Auto_DualKatana ~= false then
                  local r5_430 = Auto_Quest_Yama_1
                  if r5_430 == false then
                    break
                  end
                else
                  break
                end
              end
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
            end
          end
        else
          Tween(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
        end
      end)
    end
  end
end)
r56_0 = spawn
r56_0(function()
  -- line: [0, 0] id: 92
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 93
      if Auto_Quest_Yama_2 then
        for r3_93, r4_93 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
          if r4_93:FindFirstChild("HazeESP") then
            r4_93.HazeESP.Size = UDim2.new(50, 50, 50, 50)
            r4_93.HazeESP.MaxDistance = "inf"
          end
        end
        for r3_93, r4_93 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
          if r4_93:FindFirstChild("HazeESP") then
            r4_93.HazeESP.Size = UDim2.new(50, 50, 50, 50)
            r4_93.HazeESP.MaxDistance = "inf"
          end
        end
      end
    end)
  end
end)
r56_0 = spawn
r56_0(function()
  -- line: [0, 0] id: 71
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 72
      for r3_72, r4_72 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if Auto_Quest_Yama_2 and r4_72:FindFirstChild("HazeESP") and (r4_72.HumanoidRootPart.Position - FarmPossEsp.Position).magnitude <= 300 then
          r4_72.HumanoidRootPart.CFrame = FarmPossEsp
          r4_72.HumanoidRootPart.CanCollide = false
          r4_72.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
          if not r4_72.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            local r5_72 = Instance.new("BodyVelocity", r4_72.HumanoidRootPart)
            r5_72.MaxForce = Vector3.new(1, 1, 1) * math.huge
            r5_72.Velocity = Vector3.new(0, 0, 0)
          end
        end
      end
    end)
  end
end)
r56_0 = spawn
r56_0(function()
  -- line: [0, 0] id: 531
  while wait() do
    local r0_531 = Auto_Quest_Yama_2
    if r0_531 then
      pcall(function()
        -- line: [0, 0] id: 532
        for r3_532, r4_532 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
          if r4_532:FindFirstChild("HazeESP") then
            wait()
            if (r4_532.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
              Tween(r4_532.HumanoidRootPart.CFrame * Pos)
            else
              EquipTool(Sword)
              Tween(r4_532.HumanoidRootPart.CFrame * Pos)
              r4_532.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              r4_532.HumanoidRootPart.Transparency = 1
              r4_532.Humanoid.JumpPower = 0
              r4_532.Humanoid.WalkSpeed = 0
              r4_532.HumanoidRootPart.CanCollide = false
              FarmPos = r4_532.HumanoidRootPart.CFrame
              MonFarm = r4_532.Name
              AttackNoCoolDown()
              if r4_532.Humanoid.Health <= 0 and r4_532.Humanoid:FindFirstChild("Animator") then
                r4_532.Humanoid.Animator:Destroy()
              end
            end
            if _G.Auto_DualKatana ~= false and Auto_Quest_Yama_2 ~= false and r4_532.Parent and r4_532.Humanoid.Health > 0 and r4_532:FindFirstChild("HazeESP") then
              ::label_101::
              for r8_532, r9_532 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                if r9_532:FindFirstChild("HazeESP") then
                  if (r9_532.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
                    Tween(r9_532.HumanoidRootPart.CFrameMon * Pos)
                  else
                    Tween(r9_532.HumanoidRootPart.CFrame * Pos)
                  end
                end
              end
            end
          else
            goto label_101	-- block#12 is visited secondly
          end
        end
      end)
    end
  end
end)
r56_0 = spawn
r56_0(function()
  -- line: [0, 0] id: 74
  while wait() do
    local r0_74 = Auto_Quest_Yama_3
    if r0_74 then
      pcall(function()
        -- line: [0, 0] id: 75
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
          Tween(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
        elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
          wait()
          if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Hell\'s Messenger [Lv. 2200] [Boss]") then
            for r3_75, r4_75 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if (r4_75.Name == "Cursed Skeleton" or r4_75.Name == "Cursed Skeleton" or r4_75.Name == "Hell\'s Messenger") and 0 < r4_75.Humanoid.Health then
                while true do
                  wait()
                  EquipTool(Sword)
                  Tween(r4_75.HumanoidRootPart.CFrame * Pos)
                  r4_75.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  r4_75.HumanoidRootPart.Transparency = 1
                  r4_75.Humanoid.JumpPower = 0
                  r4_75.Humanoid.WalkSpeed = 0
                  r4_75.HumanoidRootPart.CanCollide = false
                  FarmPos = r4_75.HumanoidRootPart.CFrame
                  MonFarm = r4_75.Name
                  AttackNoCoolDown()
                  if r4_75.Humanoid.Health <= 0 then
                    local r5_75 = r4_75.Humanoid:FindFirstChild("Animator")
                    if r5_75 then
                      r4_75.Humanoid.Animator:Destroy()
                    end
                  end
                  local r5_75 = r4_75.Humanoid.Health
                  if r5_75 > 0 then
                    r5_75 = r4_75.Parent
                    if r5_75 then
                      r5_75 = Auto_Quest_Yama_3
                      if r5_75 == false then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
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
          if _G.Auto_DualKatana ~= false and Auto_Quest_Yama_3 ~= false and GetMaterial("Alucard Fragment") ~= 3 then
            ::label_250::
            if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
              if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                for r3_75, r4_75 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r4_75.Name == "Soul Reaper" and 0 < r4_75.Humanoid.Health then
                    while true do
                      wait()
                      Tween(r4_75.HumanoidRootPart.CFrame * Pos)
                      if _G.Auto_DualKatana ~= false then
                        local r5_75 = Auto_Quest_Yama_3
                        if r5_75 ~= false then
                          r5_75 = game:GetService("Workspace").Map:FindFirstChild("HellDimension")
                          if r5_75 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                end
              else
                Tween(CFrame.new(-9570.033203125, 315.9346923828125, 6726.89306640625))
              end
            else
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
            end
          end
        else
          goto label_250	-- block#23 is visited secondly
        end
      end)
    end
  end
end)
r56_0 = spawn
r56_0(function()
  -- line: [0, 0] id: 515
  while wait() do
    local r0_515 = Auto_Quest_Tushita_1
    if r0_515 then
      Tween(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
      wait(5)
      Tween(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
      wait(5)
      Tween(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875))
    end
  end
end)
r56_0 = spawn
r56_0(function()
  -- line: [0, 0] id: 198
  while wait() do
    local r0_198 = Auto_Quest_Tushita_2
    if r0_198 then
      pcall(function()
        -- line: [0, 0] id: 199
        if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
          for r3_199, r4_199 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if Auto_Quest_Tushita_2 and r4_199:FindFirstChild("HumanoidRootPart") and r4_199:FindFirstChild("Humanoid") and 0 < r4_199.Humanoid.Health and (r4_199.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
              while true do
                wait()
                EquipTool(Sword)
                Tween(r4_199.HumanoidRootPart.CFrame * Pos)
                r4_199.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_199.HumanoidRootPart.Transparency = 1
                r4_199.Humanoid.JumpPower = 0
                r4_199.Humanoid.WalkSpeed = 0
                r4_199.HumanoidRootPart.CanCollide = false
                FarmPos = r4_199.HumanoidRootPart.CFrame
                MonFarm = r4_199.Name
                AttackNoCoolDown()
                if r4_199.Humanoid.Health <= 0 then
                  local r5_199 = r4_199.Humanoid:FindFirstChild("Animator")
                  if r5_199 then
                    r4_199.Humanoid.Animator:Destroy()
                  end
                end
                local r5_199 = r4_199.Humanoid.Health
                if r5_199 > 0 then
                  r5_199 = r4_199.Parent
                  if r5_199 then
                    r5_199 = Auto_Quest_Tushita_2
                    if r5_199 == false then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        else
          Tween(CFrame.new(-5545.1240234375, 313.800537109375, -2976.616455078125))
        end
      end)
    end
  end
end)
r56_0 = spawn
r56_0(function()
  -- line: [0, 0] id: 539
  while wait() do
    local r0_539 = Auto_Quest_Tushita_3
    if r0_539 then
      pcall(function()
        -- line: [0, 0] id: 540
        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") or game.ReplicatedStorage:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
          if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
            for r3_540, r4_540 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if r4_540.Name == "Cake Queen" and 0 < r4_540.Humanoid.Health then
                while true do
                  wait()
                  EquipTool(Sword)
                  Tween(r4_540.HumanoidRootPart.CFrame * Pos)
                  r4_540.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  r4_540.HumanoidRootPart.Transparency = 1
                  r4_540.Humanoid.JumpPower = 0
                  r4_540.Humanoid.WalkSpeed = 0
                  r4_540.HumanoidRootPart.CanCollide = false
                  FarmPos = r4_540.HumanoidRootPart.CFrame
                  MonFarm = r4_540.Name
                  AttackNoCoolDown()
                  if r4_540.Humanoid.Health <= 0 then
                    local r5_540 = r4_540.Humanoid:FindFirstChild("Animator")
                    if r5_540 then
                      r4_540.Humanoid.Animator:Destroy()
                    end
                  end
                  local r5_540 = _G.Auto_DualKatana
                  if r5_540 ~= false then
                    r5_540 = Auto_Quest_Tushita_3
                    if r5_540 ~= false then
                      r5_540 = game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension")
                      if r5_540 then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
              end
            end
          else
            Tween(CFrame.new(-709.3132934570313, 381.6005859375, -11011.396484375))
          end
        elseif game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
          while true do
            wait()
            if not game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") then
              local r0_540 = game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]")
              if not r0_540 then
                r0_540 = game:GetService("Workspace").Enemies:FindFirstChild("Heaven\'s Guardian [Lv. 2200] [Boss]")
                if r0_540 then
                  ::label_163::
                  r0_540 = pairs
                  for r3_540, r4_540 in r0_540(game:GetService("Workspace").Enemies:GetChildren()) do
                    if (r4_540.Name == "Cursed Skeleton" or r4_540.Name == "Cursed Skeleton" or r4_540.Name == "Heaven\'s Guardian") and 0 < r4_540.Humanoid.Health then
                      while true do
                        wait()
                        EquipTool(Sword)
                        Tween(r4_540.HumanoidRootPart.CFrame * Pos)
                        r4_540.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        r4_540.HumanoidRootPart.Transparency = 1
                        r4_540.Humanoid.JumpPower = 0
                        r4_540.Humanoid.WalkSpeed = 0
                        r4_540.HumanoidRootPart.CanCollide = false
                        FarmPos = r4_540.HumanoidRootPart.CFrame
                        MonFarm = r4_540.Name
                        AttackNoCoolDown()
                        if r4_540.Humanoid.Health <= 0 then
                          local r5_540 = r4_540.Humanoid:FindFirstChild("Animator")
                          if r5_540 then
                            r4_540.Humanoid.Animator:Destroy()
                          end
                        end
                        local r5_540 = r4_540.Humanoid.Health
                        if r5_540 > 0 then
                          r5_540 = r4_540.Parent
                          if r5_540 then
                            r5_540 = Auto_Quest_Tushita_3
                            if r5_540 == false then
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      end
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
              end
            else
              goto label_163	-- block#19 is visited secondly
            end
            local r0_540 = _G.Auto_DualKatana
            if r0_540 then
              r0_540 = Auto_Quest_Tushita_3
              if r0_540 then
                r0_540 = GetMaterial("Alucard Fragment")
                if r0_540 == 6 then
                  break
                end
              else
                break
              end
            else
              break
            end
          end
        end
      end)
    end
  end
end)
r56_0 = Sea2
if r56_0 then
  r56_0 = r2_0.Item
  r58_0 = "AddToggle"
  r58_0 = "ToggleFactory"
  local r59_0 = {
    Title = " ánh Nhà Máy",
  }
  r61_0 = ""
  r59_0.Description = r61_0
  r61_0 = false
  r59_0.Default = r61_0
  r56_0 = r56_0:[r58_0](r58_0, r59_0)
  r59_0 = "OnChanged"
  function r59_0(r0_324)
    -- line: [0, 0] id: 324
    _G.Factory = r0_324
  end
  r56_0:[r59_0](r59_0)
  r59_0 = "SetValue"
  r59_0 = false
  r3_0.ToggleFactory:[r59_0](r59_0)
  spawn(function()
    -- line: [0, 0] id: 302
    while wait() do
      local r0_302 = _G.Factory
      if r0_302 then
        r0_302 = game.Workspace.Enemies:FindFirstChild("Core")
        if r0_302 then
          r0_302 = pairs
          for r3_302, r4_302 in r0_302(game.Workspace.Enemies:GetChildren()) do
            if r4_302.Name == "Core" and 0 < r4_302.Humanoid.Health then
              while true do
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                while true do
                  Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                  wait()
                  local r5_302 = _G.Factory
                  if r5_302 then
                    r5_302 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude
                    if r5_302 <= 10 then
                      break
                    end
                  else
                    break
                  end
                end
                EquipTool(SelectWeapon)
                AutoHaki()
                Tween(r4_302.HumanoidRootPart.CFrame * Pos)
                r4_302.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_302.HumanoidRootPart.Transparency = 1
                r4_302.Humanoid.JumpPower = 0
                r4_302.Humanoid.WalkSpeed = 0
                r4_302.HumanoidRootPart.CanCollide = false
                FarmPos = r4_302.HumanoidRootPart.CFrame
                MonFarm = r4_302.Name
                local r5_302 = r4_302.Parent
                if r5_302 then
                  r5_302 = r4_302.Humanoid.Health
                  if r5_302 > 0 then
                    r5_302 = _G.Factory
                    if r5_302 == false then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        else
          r0_302 = game.ReplicatedStorage:FindFirstChild("Core")
          if r0_302 then
            while true do
              Tween(CFrame.new(448.46756, 199.356781, -441.389252))
              wait()
              r0_302 = _G.Factory
              if r0_302 then
                r0_302 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude
                if r0_302 <= 10 then
                  goto label_150	-- block#17 is visited secondly
                end
              end
            end
          end
        end
      end
    end
  end)
end
r56_0 = r2_0.Item
r58_0 = "AddToggle"
r58_0 = "ToggleAutoFarmSwan"
local r59_0 = {
  Title = " ánh Swan",
}
r61_0 = ""
r59_0.Description = r61_0
r61_0 = false
r59_0.Default = r61_0
r56_0 = r56_0:[r58_0](r58_0, r59_0)
r59_0 = "OnChanged"
function r59_0(r0_282)
  -- line: [0, 0] id: 282
  _G.Auto_FarmSwan = r0_282
end
r56_0:[r59_0](r59_0)
r59_0 = "SetValue"
r59_0 = false
r3_0.ToggleAutoFarmSwan:[r59_0](r59_0)
spawn(function()
  -- line: [0, 0] id: 564
  pcall(function()
    -- line: [0, 0] id: 565
    while wait() do
      local r0_565 = _G.AutoFarmSwan
      if r0_565 then
        r0_565 = game:GetService("Workspace").Enemies:FindFirstChild("Don Swan")
        local r4_565 = nil	-- notice: implicit variable refs by block#[14]
        if r0_565 then
          r0_565 = pairs
          for r3_565, r4_565 in r0_565(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_565.Name == "Don Swan" and 0 < r4_565.Humanoid.Health and r4_565:IsA("Model") and r4_565:FindFirstChild("Humanoid") and r4_565:FindFirstChild("HumanoidRootPart") then
              while true do
                task.wait()
                pcall(function()
                  -- line: [0, 0] id: 566
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  r4_565.HumanoidRootPart.CanCollide = false
                  r4_565.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                  Tween(r4_565.HumanoidRootPart.CFrame * Pos)
                  AttackNoCoolDown()
                end)
                if _G.AutoFarmSwan ~= false then
                  local r5_565 = r4_565.Humanoid.Health
                  if r5_565 <= 0 then
                    break
                  end
                else
                  break
                end
              end
            end
            -- close: r3_565
          end
        else
          task.wait()
          r4_565 = 2284.912109375
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(r4_565, 15.537666320801, 905.48291015625))
          r0_565 = (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
          if r0_565 > 4 then
            r0_565 = _G.AutoFarmSwan
            if r0_565 ~= false then
              break
            end
          end
        end
      end
    end
  end)
end)
r59_0 = "AddToggle"
r59_0 = "ToggleAutoRengoku"
local r60_0 = {}
r61_0 = "Rengoku"
r60_0.Title = r61_0
r61_0 = "Description"
r60_0[r61_0] = ""
r61_0 = "Default"
r60_0[r61_0] = false
r57_0 = r2_0.Item:[r59_0](r59_0, r60_0)
r60_0 = "OnChanged"
(function(r0_130)
  -- line: [0, 0] id: 130
  _G.Auto_Regoku = r0_130
end):[r60_0](r60_0)
r60_0 = "SetValue"
r60_0 = false
r3_0.ToggleAutoRengoku:[r60_0](r60_0)
spawn(function()
  -- line: [0, 0] id: 239
  pcall(function()
    -- line: [0, 0] id: 240
    while wait() do
      local r0_240 = _G.Auto_Regoku
      if r0_240 then
        r0_240 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key")
        if not r0_240 then
          r0_240 = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key")
          if r0_240 then
            ::label_30::
            EquipTool("Hidden Key")
            Tween(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
          end
        else
          goto label_30	-- block#4 is visited secondly
        end
        r0_240 = game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker")
        if not r0_240 then
          r0_240 = game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior")
          if r0_240 then
            ::label_62::
            r0_240 = pairs
            for r3_240, r4_240 in r0_240(game:GetService("Workspace").Enemies:GetChildren()) do
              if (r4_240.Name == "Snow Lurker" or r4_240.Name == "Arctic Warrior") and 0 < r4_240.Humanoid.Health then
                while true do
                  task.wait(_G.Fast_Delay)
                  EquipTool(SelectWeapon)
                  AutoHaki()
                  r4_240.HumanoidRootPart.CanCollide = false
                  r4_240.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                  FarmPos = r4_240.HumanoidRootPart.CFrame
                  MonFarm = r4_240.Name
                  Tween(r4_240.HumanoidRootPart.CFrame * Pos)
                  AttackNoCoolDown()
                  bringmob = true
                  if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") then
                    local r5_240 = _G.Auto_Regoku
                    if r5_240 ~= false then
                      r5_240 = r4_240.Parent
                      if r5_240 then
                        r5_240 = r4_240.Humanoid.Health
                        if r5_240 <= 0 then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
                bringmob = false
              end
            end
          end
        else
          goto label_62	-- block#7 is visited secondly
        end
        bringmob = false
        Tween(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
      end
    end
  end)
end)
if Sea2 or Sea3 then
  r60_0 = "AddToggle"
  r60_0 = "ToggleHakiColor"
  r61_0 = {}
  r61_0.Title = "Mua Màu Haki"
  r61_0.Description = ""
  r61_0.Default = false
  r58_0 = r2_0.Item:[r60_0](r60_0, r61_0)
  r61_0 = "OnChanged"
  function r61_0(r0_281)
    -- line: [0, 0] id: 281
    _G.Auto_Buy_Enchancement = r0_281
  end
  r58_0:[r61_0](r61_0)
  r61_0 = "SetValue"
  r61_0 = false
  r3_0.ToggleHakiColor:[r61_0](r61_0)
  spawn(function()
    -- line: [0, 0] id: 32
    while wait() do
      local r0_32 = _G.Auto_Buy_Enchancement
      if r0_32 then
        r0_32 = {}
        r0_32[1] = "ColorsDealer"
        r0_32[2] = "2"
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_32))
      end
    end
  end)
end
if Sea2 then
  r60_0 = "AddToggle"
  r60_0 = "ToggleSwordLengend"
  r61_0 = {}
  r61_0.Title = "Mua Kiếm Huyền Thoại"
  r61_0.Description = ""
  r61_0.Default = false
  r58_0 = r2_0.Main:[r60_0](r60_0, r61_0)
  r61_0 = "OnChanged"
  function r61_0(r0_499)
    -- line: [0, 0] id: 499
    _G.BuyLengendSword = r0_499
  end
  r58_0:[r61_0](r61_0)
  r61_0 = "SetValue"
  r61_0 = false
  r3_0.ToggleSwordLengend:[r61_0](r61_0)
  spawn(function()
    -- line: [0, 0] id: 398
    while wait() do
      pcall(function()
        -- line: [0, 0] id: 399
        if _G.BuyLengendSword or Triple_A then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            [1] = "LegendarySwordDealer",
            [2] = "2",
          }))
        else
          wait()
        end
      end)
    end
  end)
end
if Sea2 then
  r60_0 = "AddToggle"
  r60_0 = "ToggleEvoRace"
  r61_0 = {}
  r61_0.Title = "Nâng Tộc V2"
  r61_0.Description = ""
  r61_0.Default = false
  r58_0 = r2_0.Main:[r60_0](r60_0, r61_0)
  r61_0 = "OnChanged"
  function r61_0(r0_361)
    -- line: [0, 0] id: 361
    _G.AutoEvoRace = r0_361
  end
  r58_0:[r61_0](r61_0)
  r61_0 = "SetValue"
  r61_0 = false
  r3_0.ToggleEvoRace:[r61_0](r61_0)
  spawn(function()
    -- line: [0, 0] id: 559
    pcall(function()
      -- line: [0, 0] id: 560
      while wait(0.1) do
        local r0_560 = _G.AutoEvoRace
        if r0_560 then
          r0_560 = game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved")
          if not r0_560 then
            r0_560 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1")
            if r0_560 == 0 then
              Tween(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 0.0000000639014104, -0.68292886, 0.0000000359963224, 1, 0.0000000550667032, 0.68292886, 0.0000000156424669, -0.730484903))
              r0_560 = Vector3.new(-2779.83521, 72.9661407, -3574.02002)
              r0_560 = (r0_560 - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
              if r0_560 <= 4 then
                wait(1.3)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
              end
            else
              r0_560 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1")
              if r0_560 == 1 then
                pcall(function()
                  -- line: [0, 0] id: 561
                  if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                    Tween(game:GetService("Workspace").Flower1.CFrame)
                  elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                    Tween(game:GetService("Workspace").Flower2.CFrame)
                  elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                      for r3_561, r4_561 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if r4_561.Name == "Zombie" then
                          while true do
                            task.wait(_G.Fast_Delay)
                            AutoHaki()
                            EquipTool(SelectWeapon)
                            Tween(r4_561.HumanoidRootPart.CFrame * Pos)
                            r4_561.HumanoidRootPart.CanCollide = false
                            r4_561.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            AttackNoCoolDown()
                            FarmPos = r4_561.HumanoidRootPart.CFrame
                            MonFarm = r4_561.Name
                            bringmob = true
                            if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") then
                              local r5_561 = r4_561.Parent
                              if r5_561 then
                                r5_561 = r4_561.Humanoid.Health
                                if r5_561 > 0 then
                                  r5_561 = _G.AutoEvoRace
                                  if r5_561 == false then
                                    break
                                  end
                                else
                                  break
                                end
                              else
                                break
                              end
                            else
                              break
                            end
                          end
                          bringmob = false
                        end
                      end
                    else
                      Tween(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                    end
                  end
                end)
              else
                r0_560 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1")
                if r0_560 == 2 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                end
              end
            end
          end
        end
      end
    end)
  end)
end
r60_0 = "AddToggle"
r60_0 = "ToggleAutoT"
r61_0 = {}
r61_0.Title = "Bật Tộc V3"
r61_0.Description = ""
r61_0.Default = false
r58_0 = r2_0.Setting:[r60_0](r60_0, r61_0)
r61_0 = "OnChanged"
(function(r0_267)
  -- line: [0, 0] id: 267
  _G.AutoT = r0_267
end):[r61_0](r61_0)
r61_0 = "SetValue"
r61_0 = false
r3_0.ToggleAutoT:[r61_0](r61_0)
spawn(function()
  -- line: [0, 0] id: 152
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 153
      if _G.AutoT then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
      end
    end)
  end
end)
r61_0 = "AddToggle"
r61_0 = "ToggleAutoY"
local r62_0 = {
  Title = "Bật Tộc V4",
}
r64_0 = ""
r62_0.Description = r64_0
r64_0 = false
r62_0.Default = r64_0
r59_0 = r2_0.Setting:[r61_0](r61_0, r62_0)
r62_0 = "OnChanged"
(function(r0_408)
  -- line: [0, 0] id: 408
  _G.AutoY = r0_408
end):[r62_0](r62_0)
r62_0 = "SetValue"
r62_0 = false
r3_0.ToggleAutoY:[r62_0](r62_0)
function r61_0()
  -- line: [0, 0] id: 340
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 341
      if _G.AutoY then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
        wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
      end
    end)
  end
end
spawn(r61_0)
r62_0 = "AddToggle"
r62_0 = "ToggleAutoKen"
local r63_0 = {}
r64_0 = "Bật Haki Quan Sát"
r63_0.Title = r64_0
r64_0 = "Description"
r65_0 = ""
r63_0[r64_0] = r65_0
r64_0 = "Default"
r65_0 = false
r63_0[r64_0] = r65_0
r60_0 = r2_0.Setting:[r62_0](r62_0, r63_0)
r63_0 = "OnChanged"
(function(r0_451)
  -- line: [0, 0] id: 451
  _G.AutoKen = r0_451
  if r0_451 then
    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
  else
    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", false)
  end
end):[r63_0](r63_0)
r61_0 = "ToggleAutoKen"
r61_0 = r3_0[r61_0]
r63_0 = "SetValue"
r63_0 = false
r61_0:[r63_0](r63_0)
r61_0 = spawn
r61_0(function()
  -- line: [0, 0] id: 425
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 426
      if _G.AutoKen then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
      end
    end)
  end
end)
r61_0 = r2_0.Setting
r63_0 = "AddToggle"
r63_0 = "ToggleSaveSpawn"
r64_0 = {}
r65_0 = "Lưu Điểm Hồi Sinh"
r64_0.Title = r65_0
r65_0 = "Description"
r64_0[r65_0] = ""
r65_0 = "Default"
r64_0[r65_0] = false
r61_0 = r61_0:[r63_0](r63_0, r64_0)
r64_0 = "OnChanged"
function r64_0(r0_334)
  -- line: [0, 0] id: 334
  _G.SaveSpawn = r0_334
  if r0_334 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
      [1] = "SetSpawnPoint",
    }))
  end
end
r61_0:[r64_0](r64_0)
r64_0 = "SetValue"
r64_0 = false
r3_0.ToggleSaveSpawn:[r64_0](r64_0)
spawn(function()
  -- line: [0, 0] id: 330
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 331
      if _G.SaveSpawn then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "SetSpawnPoint",
        }))
      end
    end)
  end
end)
r64_0 = "AddButton"
r64_0 = {}
r65_0 = "Fps Boost"
r64_0.Title = r65_0
r65_0 = "Description"
r64_0[r65_0] = ""
r65_0 = "Callback"
r64_0[r65_0] = function()
  -- line: [0, 0] id: 403
  local r0_403 = false
  local r1_403 = game
  local r3_403 = r1_403.Lighting
  local r4_403 = r1_403.Workspace.Terrain
  r4_403.WaterWaveSize = 0
  r4_403.WaterWaveSpeed = 0
  r4_403.WaterReflectance = 0
  r4_403.WaterTransparency = 0
  r3_403.GlobalShadows = false
  r3_403.FogEnd = 9000000000
  r3_403.Brightness = 0
  settings().Rendering.QualityLevel = "Level01"
  for r8_403, r9_403 in pairs(r1_403:GetDescendants()) do
    if r9_403:IsA("Part") or r9_403:IsA("Union") or r9_403:IsA("CornerWedgePart") or r9_403:IsA("TrussPart") then
      r9_403.Material = "Plastic"
      r9_403.Reflectance = 0
    elseif r9_403:IsA("Decal") or r9_403:IsA("Texture") and r0_403 then
      r9_403.Transparency = 1
    elseif r9_403:IsA("ParticleEmitter") or r9_403:IsA("Trail") then
      r9_403.Lifetime = NumberRange.new(0)
    elseif r9_403:IsA("Explosion") then
      r9_403.BlastPressure = 1
      r9_403.BlastRadius = 1
    elseif r9_403:IsA("Fire") or r9_403:IsA("SpotLight") or r9_403:IsA("Smoke") or r9_403:IsA("Sparkles") then
      r9_403.Enabled = false
    elseif r9_403:IsA("MeshPart") then
      r9_403.Material = "Plastic"
      r9_403.Reflectance = 0
      r9_403.TextureID = 10385902758728956
    end
  end
  for r8_403, r9_403 in pairs(r3_403:GetChildren()) do
    if r9_403:IsA("BlurEffect") or r9_403:IsA("SunRaysEffect") or r9_403:IsA("ColorCorrectionEffect") or r9_403:IsA("BloomEffect") or r9_403:IsA("DepthOfFieldEffect") then
      r9_403.Enabled = false
    end
  end
end
r2_0.Setting:[r64_0](r64_0)
r64_0 = "AddToggle"
r64_0 = "ToggleBringMob"
r65_0 = {}
r65_0.Title = "Gom Quái"
r65_0.Description = ""
r65_0.Default = true
r62_0 = r2_0.Setting:[r64_0](r64_0, r65_0)
r65_0 = "OnChanged"
(function(r0_146)
  -- line: [0, 0] id: 146
  _G.BringMob = r0_146
end):[r65_0](r65_0)
r65_0 = "SetValue"
r65_0 = true
r3_0.ToggleBringMob:[r65_0](r65_0)
function r64_0()
  -- line: [0, 0] id: 122
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 123
      for r3_123, r4_123 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if _G.BringMob and bringmob and r4_123.Name == MonFarm and r4_123:FindFirstChild("Humanoid") and 0 < r4_123.Humanoid.Health and r4_123.Name == MonFarm and (r4_123.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000 then
          r4_123.HumanoidRootPart.CFrame = FarmPos
          r4_123.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
          r4_123.HumanoidRootPart.Transparency = 1
          r4_123.Humanoid.JumpPower = 0
          r4_123.Humanoid.WalkSpeed = 0
          if r4_123.Humanoid:FindFirstChild("Animator") then
            r4_123.Humanoid.Animator:Destroy()
          end
          r4_123.HumanoidRootPart.CanCollide = false
          r4_123.Head.CanCollide = false
          r4_123.Humanoid:ChangeState(11)
          r4_123.Humanoid:ChangeState(14)
          sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
        end
      end
      -- warn: not visited block [8, 9, 10]
      -- block#8:
      -- r4_123.Head.CanCollide = false
      -- r4_123.HumanoidRootPart.CanCollide = false
      -- r4_123.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
      -- r4_123.HumanoidRootPart.CFrame = FarmPos
      -- if r4_123.Humanoid:FindFirstChild("Animator")
      -- block#9:
      -- r4_123.Humanoid.Animator:Destroy()
      -- block#10:
      -- sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
      -- goto label_134
    end)
  end
end
spawn(r64_0)
r65_0 = "AddToggle"
r65_0 = "ToggleRemoveNotify"
r63_0 = r2_0.Setting:[r65_0](r65_0, {
  Title = "Tắt Thông Báo",
  Description = "",
  Default = false,
})
local r66_0 = "OnChanged"
(function(r0_86)
  -- line: [0, 0] id: 86
  RemoveNotify = r0_86
end):[r66_0](r66_0)
r64_0 = "ToggleRemoveNotify"
r64_0 = r3_0[r64_0]
r66_0 = "SetValue"
r66_0 = false
r64_0:[r66_0](r66_0)
r64_0 = spawn
function r65_0()
  -- line: [0, 0] id: 379
  while wait() do
    local r0_379 = RemoveNotify
    if r0_379 then
      r0_379 = game.Players.LocalPlayer.PlayerGui.Notifications
      r0_379.Enabled = false
    else
      r0_379 = game.Players.LocalPlayer.PlayerGui.Notifications
      r0_379.Enabled = true
    end
  end
end
r64_0(r65_0)
r64_0 = r2_0.Setting
r66_0 = "AddToggle"
r66_0 = "ToggleWhite"
r64_0 = r64_0:[r66_0](r66_0, {
  Title = "Màn Hình Trắng",
  Description = "",
  Default = false,
})
local r67_0 = "OnChanged"
function r67_0(r0_135)
  -- line: [0, 0] id: 135
  _G.WhiteScreen = r0_135
  if _G.WhiteScreen == true then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
  elseif _G.WhiteScreen == false then
    game:GetService("RunService"):Set3dRenderingEnabled(true)
  end
end
r64_0:[r67_0](r67_0)
r65_0 = "ToggleWhite"
r65_0 = r3_0[r65_0]
r67_0 = "SetValue"
r67_0 = false
r65_0:[r67_0](r67_0)
r65_0 = r2_0.Setting
r67_0 = "AddSection"
r67_0 = "Kĩ Năng Thông Thạo"
r65_0 = r65_0:[r67_0](r67_0)
local r68_0 = "AddToggle"
r68_0 = "ToggleZ"
r66_0 = r2_0.Setting:[r68_0](r68_0, {
  Title = "Kĩ Năng Z",
  Description = "",
  Default = true,
})
local r69_0 = "OnChanged"
(function(r0_504)
  -- line: [0, 0] id: 504
  SkillZ = r0_504
end):[r69_0](r69_0)
r69_0 = "SetValue"
r69_0 = true
r3_0.ToggleZ:[r69_0](r69_0)
r69_0 = "AddToggle"
r69_0 = "ToggleX"
r67_0 = r2_0.Setting:[r69_0](r69_0, {
  Title = "Kĩ Năng X",
  Description = "",
  Default = true,
})
local r70_0 = "OnChanged"
(function(r0_556)
  -- line: [0, 0] id: 556
  SkillX = r0_556
end):[r70_0](r70_0)
r70_0 = "SetValue"
r70_0 = true
r3_0.ToggleX:[r70_0](r70_0)
r70_0 = "AddToggle"
r70_0 = "ToggleC"
local r71_0 = {
  Title = "Kĩ Năng C",
}
r73_0 = ""
r71_0.Description = r73_0
r73_0 = true
r71_0.Default = r73_0
r68_0 = r2_0.Setting:[r70_0](r70_0, r71_0)
r71_0 = "OnChanged"
(function(r0_582)
  -- line: [0, 0] id: 582
  SkillC = r0_582
end):[r71_0](r71_0)
r71_0 = "SetValue"
r71_0 = true
r3_0.ToggleC:[r71_0](r71_0)
r71_0 = "AddToggle"
r71_0 = "ToggleV"
local r72_0 = {}
r73_0 = "Kĩ Năng V"
r72_0.Title = r73_0
r73_0 = "Description"
r72_0[r73_0] = ""
r73_0 = "Default"
r72_0[r73_0] = true
r69_0 = r2_0.Setting:[r71_0](r71_0, r72_0)
r72_0 = "OnChanged"
(function(r0_299)
  -- line: [0, 0] id: 299
  SkillV = r0_299
end):[r72_0](r72_0)
r72_0 = "SetValue"
r72_0 = true
r3_0.ToggleV:[r72_0](r72_0)
r72_0 = "AddToggle"
r72_0 = "ToggleF"
r73_0 = {}
r73_0.Title = "Kĩ Năng F"
r73_0.Description = ""
r73_0.Default = false
r70_0 = r2_0.Setting:[r72_0](r72_0, r73_0)
r73_0 = "OnChanged"
(function(r0_567)
  -- line: [0, 0] id: 567
  SkillF = r0_567
end):[r73_0](r73_0)
r73_0 = "SetValue"
r73_0 = true
r3_0.ToggleF:[r73_0](r73_0)
r73_0 = "AddParagraph"
r73_0 = {}
r73_0.Title = "Thông Tin"
r73_0.Content = "  ━━━━━━━━━━━━━━━━━━━━\n" .. "Tên : " .. game.Players.LocalPlayer.DisplayName .. " (@" .. game.Players.LocalPlayer.Name .. ")\n" .. "Cấp : " .. game:GetService("Players").LocalPlayer.Data.Level.Value .. "\n" .. "Tiền : " .. game:GetService("Players").LocalPlayer.Data.Beli.Value .. "\n" .. " iểm F : " .. game:GetService("Players").LocalPlayer.Data.Fragments.Value .. "\n" .. "Tiền Truy Nã : " .. game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value .. "\n" .. "Máu: " .. game.Players.LocalPlayer.Character.Humanoid.Health .. "/" .. game.Players.LocalPlayer.Character.Humanoid.MaxHealth .. "\n" .. "Năng Lượng : " .. game.Players.LocalPlayer.Character.Energy.Value .. "/" .. game.Players.LocalPlayer.Character.Energy.MaxValue .. "\n" .. "Tộc : " .. game:GetService("Players").LocalPlayer.Data.Race.Value .. "\n" .. "Trái : " .. game:GetService("Players").LocalPlayer.Data.DevilFruit.Value .. "\n" .. "  ━━━━━━━━━━━━━━━━━━━━"
r71_0 = r2_0.Status:[r73_0](r73_0)
local r74_0 = "AddParagraph"
r74_0 = {
  Title = "Thời Gian",
  Content = "",
}
r72_0 = r2_0.Status:[r74_0](r74_0)
function r73_0()
  -- line: [0, 0] id: 101
  local r0_101 = os.date("*t")
  local r1_101 = r0_101.hour % 24
  local r2_101 = nil	-- notice: implicit variable refs by block#[3]
  if r1_101 < 12 then
    r2_101 = "AM"
    if not r2_101 then
      ::label_11::
      r2_101 = "PM"
    end
  else
    goto label_11	-- block#2 is visited secondly
  end
  local r3_101 = string.format("%02i:%02i:%02i %s", (r1_101 - 1) % 12 + 1, r0_101.min, r0_101.sec, r2_101)
  local r4_101 = string.format("%02d/%02d/%04d", r0_101.day, r0_101.month, r0_101.year)
  local r5_101 = game:GetService("LocalizationService")
  local r7_101 = game:GetService("Players").LocalPlayer
  local r8_101 = r7_101.Name
  local r9_101 = "Unknown"
  local r10_101, r11_101 = pcall(function()
    -- line: [0, 0] id: 102
    return r5_101:GetCountryRegionForPlayerAsync(r7_101)
  end)
  if r10_101 then
    r9_101 = r11_101
  end
  r72_0:SetDesc(r4_101 .. "-" .. r3_101 .. " [ " .. r9_101 .. " ]")
end
spawn(function()
  -- line: [0, 0] id: 25
  -- notice: unreachable block#1
  while true do
    r73_0()
    game:GetService("RunService").RenderStepped:Wait()
  end
  goto label_10	-- block#1 is visited secondly
end)
local r76_0 = "AddParagraph"
r76_0 = {
  Title = "Thời Gian Dùng Script",
  Content = "",
}
r74_0 = r2_0.Status:[r76_0](r76_0)
local function r75_0()
  -- line: [0, 0] id: 523
  local r0_523 = math.floor(workspace.DistributedGameTime + 0.5)
  r74_0:SetDesc(string.format("%02d Tiếng-%02d Phút-%02d Giây", math.floor(r0_523 / 3600) % 24, math.floor(r0_523 / 60) % 60, r0_523 % 60))
end
spawn(function()
  -- line: [0, 0] id: 384
  while task.wait() do
    pcall(r75_0)
  end
end)
local r78_0 = "AddParagraph"
r78_0 = {
  Title = " ảo Leviathan",
  Content = "",
}
r76_0 = r2_0.Status:[r78_0](r78_0)
spawn(function()
  -- line: [0, 0] id: 440
  pcall(function()
    -- line: [0, 0] id: 441
    while wait() do
      local r0_441 = game:GetService("Workspace").Map:FindFirstChild("FrozenDimension")
      if r0_441 then
        r76_0:SetDesc("  ")
      else
        r76_0:SetDesc("  ")
      end
    end
  end)
end)
local r79_0 = "AddInput"
r79_0 = "Input"
local r77_0 = r2_0.Status:[r79_0](r79_0, {
  Title = "Job ID",
  Default = "",
  Placeholder = "Dán Job ID Vào Đây",
  Numeric = false,
  Finished = false,
  Callback = function(r0_555)
    -- line: [0, 0] id: 555
    _G.Job = r0_555
  end,
})
local r80_0 = "AddButton"
r80_0 = {
  Title = "Tham Gia Job ID",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 397
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer)
  end,
}
r2_0.Status:[r80_0](r80_0)
r80_0 = "AddButton"
r80_0 = {
  Title = "Sao Chép Job ID",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 87
    setclipboard(tostring(game.JobId))
  end,
}
r2_0.Status:[r80_0](r80_0)
r80_0 = "AddToggle"
r80_0 = "MyToggle"
r78_0 = r2_0.Status:[r80_0](r80_0, {
  Title = "Spam Tham Gia Job ID",
  Default = false,
})
local r81_0 = "OnChanged"
(function(r0_187)
  -- line: [0, 0] id: 187
  _G.Join = r0_187
end):[r81_0](r81_0)
spawn(function()
  -- line: [0, 0] id: 494
  while wait() do
    local r0_494 = _G.Join
    if r0_494 then
      r0_494 = game:GetService("TeleportService")
      r0_494:TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer)
    end
  end
end)
r81_0 = "AddToggle"
r81_0 = "ToggleMelee"
r79_0 = r2_0.Stats:[r81_0](r81_0, {
  Title = "Nâng Đấm",
  Description = "",
  Default = false,
})
local r82_0 = "OnChanged"
(function(r0_202)
  -- line: [0, 0] id: 202
  _G.Auto_Stats_Melee = r0_202
end):[r82_0](r82_0)
r82_0 = "SetValue"
r82_0 = false
r3_0.ToggleMelee:[r82_0](r82_0)
r82_0 = "AddToggle"
r82_0 = "ToggleDe"
r80_0 = r2_0.Stats:[r82_0](r82_0, {
  Title = "Nâng Máu",
  Description = "",
  Default = false,
})
local r83_0 = "OnChanged"
(function(r0_410)
  -- line: [0, 0] id: 410
  _G.Auto_Stats_Defense = r0_410
end):[r83_0](r83_0)
r83_0 = "SetValue"
r83_0 = false
r3_0.ToggleDe:[r83_0](r83_0)
r83_0 = "AddToggle"
r83_0 = "ToggleSword"
r81_0 = r2_0.Stats:[r83_0](r83_0, {
  Title = "Nâng Kiếm",
  Description = "",
  Default = false,
})
local r84_0 = "OnChanged"
(function(r0_558)
  -- line: [0, 0] id: 558
  _G.Auto_Stats_Sword = r0_558
end):[r84_0](r84_0)
r84_0 = "SetValue"
r84_0 = false
r3_0.ToggleSword:[r84_0](r84_0)
r84_0 = "AddToggle"
r84_0 = "ToggleGun"
r82_0 = r2_0.Stats:[r84_0](r84_0, {
  Title = "Nâng Súng",
  Description = "",
  Default = false,
})
local r85_0 = "OnChanged"
(function(r0_210)
  -- line: [0, 0] id: 210
  _G.Auto_Stats_Gun = r0_210
end):[r85_0](r85_0)
r85_0 = "SetValue"
r85_0 = false
r3_0.ToggleGun:[r85_0](r85_0)
r85_0 = "AddToggle"
r85_0 = "ToggleFruit"
r83_0 = r2_0.Stats:[r85_0](r85_0, {
  Title = "Nâng Trái",
  Description = "",
  Default = false,
})
local r86_0 = "OnChanged"
(function(r0_118)
  -- line: [0, 0] id: 118
  _G.Auto_Stats_Devil_Fruit = r0_118
end):[r86_0](r86_0)
r86_0 = "SetValue"
r86_0 = false
r3_0.ToggleFruit:[r86_0](r86_0)
spawn(function()
  -- line: [0, 0] id: 495
  while wait() do
    local r0_495 = _G.Auto_Stats_Devil_Fruit
    if r0_495 then
      r0_495 = {}
      r0_495[1] = "AddPoint"
      r0_495[2] = "Demon Fruit"
      r0_495[3] = 3
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_495))
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 374
  while wait() do
    local r0_374 = _G.Auto_Stats_Gun
    if r0_374 then
      r0_374 = {}
      r0_374[1] = "AddPoint"
      r0_374[2] = "Gun"
      r0_374[3] = 3
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_374))
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 375
  while wait() do
    local r0_375 = _G.Auto_Stats_Sword
    if r0_375 then
      r0_375 = {}
      r0_375[1] = "AddPoint"
      r0_375[2] = "Sword"
      r0_375[3] = 3
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_375))
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 349
  while wait() do
    local r0_349 = _G.Auto_Stats_Defense
    if r0_349 then
      r0_349 = {}
      r0_349[1] = "AddPoint"
      r0_349[2] = "Defense"
      r0_349[3] = 3
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_349))
    end
  end
end)
spawn(function()
  -- line: [0, 0] id: 37
  while wait() do
    local r0_37 = _G.Auto_Stats_Melee
    if r0_37 then
      r0_37 = {}
      r0_37[1] = "AddPoint"
      r0_37[2] = "Melee"
      r0_37[3] = 3
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_37))
    end
  end
end)
r84_0 = {}
for r88_0, r89_0 in pairs(game:GetService("Players"):GetChildren()) do
  table.insert(r84_0, r89_0.Name)
end
local r87_0 = "AddDropdown"
r87_0 = "SelectedPly"
r85_0 = r2_0.Player:[r87_0](r87_0, {
  Title = "Chọn Người Chơi",
  Description = "",
  Values = r84_0,
  Multi = false,
  Default = 1,
})
local r88_0 = "SetValue"
r88_0 = _G.SelectPly
r85_0:[r88_0](r88_0)
r88_0 = "OnChanged"
function r88_0(r0_529)
  -- line: [0, 0] id: 529
  _G.SelectPly = r0_529
end
r85_0:[r88_0](r88_0)
r88_0 = "AddButton"
r88_0 = {
  Title = "Tải Lại Người Chơi",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 66
    table.clear(r84_0)
    for r3_66, r4_66 in pairs(game:GetService("Players"):GetChildren()) do
      table.insert(r84_0, r4_66.Name)
    end
  end,
}
r2_0.Player:[r88_0](r88_0)
r88_0 = "AddToggle"
r88_0 = "ToggleTeleport"
r86_0 = r2_0.Player:[r88_0](r88_0, {
  Title = "Bay Đến Người Chơi",
  Description = "",
  Default = false,
})
local r89_0 = "OnChanged"
(function(r0_3)
  -- line: [0, 0] id: 3
  _G.TeleportPly = r0_3
  if r0_3 == false then
    wait()
    AutoHaki()
    Tween2(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
  end
end):[r89_0](r89_0)
r89_0 = "SetValue"
r89_0 = false
r3_0.ToggleTeleport:[r89_0](r89_0)
spawn(function()
  -- line: [0, 0] id: 459
  while wait() do
    local r0_459 = _G.TeleportPly
    if r0_459 then
      pcall(function()
        -- line: [0, 0] id: 460
        if game.Players:FindFirstChild(_G.SelectPly) then
          Tween2(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
        end
      end)
    end
  end
end)
r89_0 = "AddToggle"
r89_0 = "ToggleWalkonWater"
r87_0 = r2_0.Player:[r89_0](r89_0, {
  Title = " i Trên Nước",
  Description = "",
  Default = true,
})
local r90_0 = "OnChanged"
(function(r0_249)
  -- line: [0, 0] id: 249
  _G.WalkonWater = r0_249
end):[r90_0](r90_0)
r90_0 = "SetValue"
r90_0 = true
r3_0.ToggleWalkonWater:[r90_0](r90_0)
spawn(function()
  -- line: [0, 0] id: 517
  while task.wait() do
    pcall(function()
      -- line: [0, 0] id: 518
      if _G.WalkonWater then
        game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
      else
        game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
      end
    end)
  end
end)
r90_0 = "AddToggle"
r90_0 = "ToggleSpeedRun"
r88_0 = r2_0.Player:[r90_0](r90_0, {
  Title = "Chạy Nhanh",
  Description = "",
  Default = true,
})
local r91_0 = "OnChanged"
(function(r0_385)
  -- line: [0, 0] id: 385
  InfAbility = r0_385
  if r0_385 == false then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
  end
end):[r91_0](r91_0)
r91_0 = "SetValue"
r91_0 = true
r3_0.ToggleSpeedRun:[r91_0](r91_0)
spawn(function()
  -- line: [0, 0] id: 4
  while wait() do
    local r0_4 = InfAbility
    if r0_4 then
      InfAb()
    end
  end
end)
function InfAb()
  -- line: [0, 0] id: 512
  if InfAbility and not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
    local r0_512 = Instance.new("ParticleEmitter")
    r0_512.Acceleration = Vector3.new(0, 0, 0)
    r0_512.Archivable = true
    r0_512.Drag = 20
    r0_512.EmissionDirection = Enum.NormalId.Top
    r0_512.Enabled = true
    r0_512.Lifetime = NumberRange.new(0, 0)
    r0_512.LightInfluence = 0
    r0_512.LockedToPart = true
    r0_512.Name = "Agility"
    r0_512.Rate = 500
    r0_512.Size = NumberSequence.new({
      NumberSequenceKeypoint.new(0, 0),
      NumberSequenceKeypoint.new(1, 4)
    })
    r0_512.RotSpeed = NumberRange.new(9999, 99999)
    r0_512.Rotation = NumberRange.new(0, 0)
    r0_512.Speed = NumberRange.new(30, 30)
    r0_512.SpreadAngle = Vector2.new(0, 0, 0, 0)
    r0_512.Texture = ""
    r0_512.VelocityInheritance = 0
    r0_512.ZOffset = 2
    r0_512.Transparency = NumberSequence.new(0)
    r0_512.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0))
    r0_512.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
  elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
  end
end
r91_0 = "AddToggle"
r91_0 = "ToggleNoClip"
r89_0 = r2_0.Player:[r91_0](r91_0, {
  Title = " i Xuyên Tường",
  Description = "",
  Default = true,
})
local r92_0 = "OnChanged"
(function(r0_493)
  -- line: [0, 0] id: 493
  _G.LOf = r0_493
end):[r92_0](r92_0)
r92_0 = "SetValue"
r92_0 = true
r3_0.ToggleNoClip:[r92_0](r92_0)
spawn(function()
  -- line: [0, 0] id: 413
  pcall(function()
    -- line: [0, 0] id: 414
    game:GetService("RunService").Stepped:Connect(function()
      -- line: [0, 0] id: 415
      if _G.LOf then
        for r3_415, r4_415 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
          if r4_415:IsA("BasePart") then
            r4_415.CanCollide = false
          end
        end
      end
    end)
  end)
end)
r92_0 = "AddToggle"
r92_0 = "ToggleEnablePvp"
r90_0 = r2_0.Player:[r92_0](r92_0, {
  Title = "Bật PVP",
  Description = "",
  Default = false,
})
local r93_0 = "OnChanged"
(function(r0_587)
  -- line: [0, 0] id: 587
  _G.EnabledPvP = r0_587
end):[r93_0](r93_0)
r93_0 = "SetValue"
r93_0 = false
r3_0.ToggleEnablePvp:[r93_0](r93_0)
spawn(function()
  -- line: [0, 0] id: 347
  pcall(function()
    -- line: [0, 0] id: 348
    while wait() do
      local r0_348 = _G.EnabledPvP
      if r0_348 then
        r0_348 = game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible
        if r0_348 == true then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
        end
      end
    end
  end)
end)
r93_0 = "AddSection"
r93_0 = "Thế Giới"
r91_0 = r2_0.Teleport:[r93_0](r93_0)
local r94_0 = "AddToggle"
r94_0 = "ToggleAutoSea2"
r92_0 = r2_0.Teleport:[r94_0](r94_0, {
  Title = "Nhiệm Vụ Qua Biển 2",
  Description = "",
  Default = false,
})
local r95_0 = "OnChanged"
(function(r0_51)
  -- line: [0, 0] id: 51
  _G.Auto_Sea2 = r0_51
end):[r95_0](r95_0)
r95_0 = "SetValue"
r95_0 = false
r3_0.ToggleAutoSea2:[r95_0](r95_0)
spawn(function()
  -- line: [0, 0] id: 289
  while wait() do
    local r0_289 = _G.Auto_Sea2
    if r0_289 then
      pcall(function()
        -- line: [0, 0] id: 290
        if 700 <= game:GetService("Players").LocalPlayer.Data.Level.Value and World1 then
          if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
            local r1_290 = CFrame.new(4849.29883, 5.65138149, 719.611877)
            while true do
              Tween(r1_290)
              wait()
              if (r1_290.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 then
                local r2_290 = _G.Auto_Sea2
                if r2_290 == false then
                  break
                end
              else
                break
              end
            end
            wait(1.1)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
            wait(0.5)
            EquipTool("Key")
            while true do
              Tween(CFrame.new(1347.7124, 37.3751602, -1325.6488))
              wait()
              if (Vector3.new(1347.7124, 37.3751602, -1325.6488) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 then
                local r2_290 = _G.Auto_Sea2
                if r2_290 == false then
                  break
                end
              else
                break
              end
            end
            wait(0.5)
          elseif game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
              for r4_290, r5_290 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if r5_290.Name == "Ice Admiral" then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                end
              end
            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then
              Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * Pos)
            end
          end
        end
        -- warn: not visited block [20, 21, 22]
        -- block#20:
        -- OldCFrameSecond = r5_290.HumanoidRootPart.CFrame
        -- task.wait(_G.Fast_Delay)
        -- AutoHaki()
        -- EquipTool(SelectWeapon)
        -- r5_290.HumanoidRootPart.CanCollide = false
        -- r5_290.Humanoid.WalkSpeed = 0
        -- r5_290.Head.CanCollide = false
        -- r5_290.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
        -- r5_290.HumanoidRootPart.CFrame = OldCFrameSecond
        -- Tween(r5_290.HumanoidRootPart.CFrame * Pos)
        -- AttackNoCoolDown()
        -- sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
        -- if _G.Auto_Sea2
        -- block#21:
        -- if r5_290.Parent
        -- block#22:
        -- if r5_290.Humanoid.Health > 0
      end)
    end
  end
end)
r95_0 = "AddToggle"
r95_0 = "ToggleAutoSea3"
r93_0 = r2_0.Teleport:[r95_0](r95_0, {
  Title = "Nhiệm Vụ Qua Biển 3",
  Description = "",
  Default = false,
})
local r96_0 = "OnChanged"
(function(r0_480)
  -- line: [0, 0] id: 480
  _G.Auto_Sea3 = r0_480
end):[r96_0](r96_0)
r96_0 = "SetValue"
r96_0 = false
r3_0.ToggleAutoSea3:[r96_0](r96_0)
spawn(function()
  -- line: [0, 0] id: 164
  while wait() do
    local r0_164 = _G.AutoSea3
    if r0_164 then
      pcall(function()
        -- line: [0, 0] id: 165
        if 1500 <= game:GetService("Players").LocalPlayer.Data.Level.Value and World2 then
          _G.AutoLevel = false
          if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "General") == 0 then
            Tween(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
            if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
              wait(1.5)
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
            end
            wait(1.8)
            if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
              for r3_165, r4_165 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if r4_165.Name == "rip_indra" then
                  OldCFrameThird = r4_165.HumanoidRootPart.CFrame
                  while true do
                    task.wait(_G.Fast_Delay)
                    AutoHaki()
                    EquipTool(SelectWeapon)
                    Tween(r4_165.HumanoidRootPart.CFrame * Pos)
                    r4_165.HumanoidRootPart.CFrame = OldCFrameThird
                    r4_165.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                    r4_165.HumanoidRootPart.CanCollide = false
                    r4_165.Humanoid.WalkSpeed = 0
                    AttackNoCoolDown()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                    if _G.AutoSea3 ~= false then
                      local r5_165 = r4_165.Humanoid.Health
                      if r5_165 > 0 then
                        r5_165 = r4_165.Parent
                        if not r5_165 then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  end
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
end)
r96_0 = "AddButton"
r96_0 = {
  Title = "Biển 1",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 424
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
  end,
}
r2_0.Teleport:[r96_0](r96_0)
r96_0 = "AddButton"
r96_0 = {
  Title = "Biển 2",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 304
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
  end,
}
r2_0.Teleport:[r96_0](r96_0)
r96_0 = "AddButton"
r96_0 = {
  Title = "Biển 3",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 293
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
  end,
}
r2_0.Teleport:[r96_0](r96_0)
r96_0 = "AddSection"
r96_0 = " ảo"
r94_0 = r2_0.Teleport:[r96_0](r96_0)
if Sea1 then
  IslandList = {
    "WindMill",
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
elseif Sea2 then
  IslandList = {
    "The Cafe",
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
elseif Sea3 then
  IslandList = {
    "Mansion",
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
end
local r97_0 = "AddDropdown"
r97_0 = "DropdownIsland"
r95_0 = r2_0.Teleport:[r97_0](r97_0, {
  Title = "Chọn Đảo",
  Description = "",
  Values = IslandList,
  Multi = false,
  Default = 1,
})
local r98_0 = "SetValue"
r98_0 = _G.SelectIsland
r95_0:[r98_0](r98_0)
r98_0 = "OnChanged"
function r98_0(r0_463)
  -- line: [0, 0] id: 463
  _G.SelectIsland = r0_463
end
r95_0:[r98_0](r98_0)
r98_0 = "AddButton"
r98_0 = {
  Title = "Bay Đến Đảo",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 534
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
  end,
}
r2_0.Teleport:[r98_0](r98_0)
r98_0 = "AddButton"
r98_0 = {
  Title = "Giả",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 359
    local r0_359 = game:GetService("Players").LocalPlayer
    local r1_359 = require(game:GetService("ReplicatedStorage").Notification)
    local r2_359 = r0_359:WaitForChild("Data")
    local r3_359 = require(game.ReplicatedStorage:WaitForChild("EXPFunction"))
    local r4_359 = require(game:GetService("ReplicatedStorage").Effect.Container.LevelUp)
    local r5_359 = require(game:GetService("ReplicatedStorage").Util.Sound)
    local r6_359 = game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy") or game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp")
    function v129(r0_360)
      -- line: [0, 0] id: 360
      local r1_360 = r0_360
      repeat
        local r2_360, r3_360 = string.gsub(r1_360, "^(-?%d+)(%d%d%d)", "%1,%2")
        r1_360 = r2_360
      until r3_360 == 0
      return r1_360
    end
    r1_359.new("<Color=Yellow>QUEST COMPLETED!<Color=/>"):Display()
    r1_359.new("Earned<Color=Yellow>9,999,999,999,999 Exp.<Color=/>(+None)"):Display()
    r1_359.new("Earned<Color=Green>$9,999,999,999,999<Color=/>"):Display()
    r0_359.Data.Exp.Value = 999999999999
    r0_359.Data.Beli.Value = r0_359.Data.Beli.Value + 999999999999
    delay = 0
    count = 0
    while 0 < r0_359.Data.Exp.Value - r3_359(r2_359.Level.Value) do
      r0_359.Data.Exp.Value = r0_359.Data.Exp.Value - r3_359(r2_359.Level.Value)
      r0_359.Data.Level.Value = r0_359.Data.Level.Value + 1
      r0_359.Data.Points.Value = r0_359.Data.Points.Value + 3
      local r7_359 = r4_359
      local r8_359 = {
        r0_359
      }
      r7_359(r8_359)
      r5_359.Play(r5_359, r6_359.Value)
      r1_359.new("<Color=Green>LEVEL UP!<Color=/>(" .. r0_359.Data.Level.Value .. ")"):Display()
      count = count + 1
      r7_359 = count
      if r7_359 >= 5 then
        delay = tick()
        count = 0
        wait()
      end
    end
  end,
}
r2_0.Visual:[r98_0](r98_0)
r98_0 = "AddInput"
r98_0 = "Input_Level"
r2_0.Visual:[r98_0](r98_0, {
  Title = "Cấp",
  Default = "",
  Placeholder = "Nhập",
  Numeric = false,
  Finished = false,
  Callback = function(r0_545)
    -- line: [0, 0] id: 545
    game:GetService("Players").LocalPlayer.Data.Level.Value = tonumber(r0_545)
  end,
})
r98_0 = "AddInput"
r98_0 = "Input_EXP"
r2_0.Visual:[r98_0](r98_0, {
  Title = "Kinh Nghiệm",
  Default = "",
  Placeholder = "Nhập",
  Numeric = false,
  Finished = false,
  Callback = function(r0_192)
    -- line: [0, 0] id: 192
    game:GetService("Players").LocalPlayer.Data.Exp.Value = tonumber(r0_192)
  end,
})
r98_0 = "AddInput"
r98_0 = "Input_Beli"
r2_0.Visual:[r98_0](r98_0, {
  Title = "Tiền",
  Default = "",
  Placeholder = "Nhập",
  Numeric = false,
  Finished = false,
  Callback = function(r0_383)
    -- line: [0, 0] id: 383
    game:GetService("Players").LocalPlayer.Data.Beli.Value = tonumber(r0_383)
  end,
})
r98_0 = "AddInput"
r98_0 = "Input_Fragments"
r2_0.Visual:[r98_0](r98_0, {
  Title = " iểm F",
  Default = "",
  Placeholder = "Nhập",
  Numeric = false,
  Finished = false,
  Callback = function(r0_145)
    -- line: [0, 0] id: 145
    game:GetService("Players").LocalPlayer.Data.Fragments.Value = tonumber(r0_145)
  end,
})
r98_0 = "FindFirstChild"
r98_0 = "Remotes"
r96_0 = game.ReplicatedStorage:[r98_0](r98_0)
r98_0 = "InvokeServer"
r96_0 = ("GetFruits").CommF_:[r98_0](r98_0)
Table_DevilFruitSniper = {}
for r100_0, r101_0 in next, {}, nil do
  table.insert(Table_DevilFruitSniper, r101_0.Name)
  if r101_0.OnSale then
    table.insert(ShopDevilSell, r101_0.Name)
  end
end
_G.SelectFruit = nil
_G.PermanentFruit = nil
_G.AutoBuyFruitSniper = false
_G.AutoSwitchPermanentFruit = false
local r99_0 = "AddDropdown"
r99_0 = "DropdownFruit"
r97_0 = r2_0.Fruit:[r99_0](r99_0, {
  Title = "Chọn Trái",
  Description = "",
  Values = Table_DevilFruitSniper,
  Multi = false,
  Default = 1,
})
local r100_0 = "SetValue"
r100_0 = _G.SelectFruit
r97_0:[r100_0](r100_0)
r100_0 = "OnChanged"
function r100_0(r0_416)
  -- line: [0, 0] id: 416
  _G.SelectFruit = r0_416
end
r97_0:[r100_0](r100_0)
r100_0 = "AddToggle"
r100_0 = "ToggleFruit"
r98_0 = r2_0.Fruit:[r100_0](r100_0, {
  Title = "Mua Trái Chọn",
  Description = "",
  Default = false,
})
local r101_0 = "OnChanged"
(function(r0_211)
  -- line: [0, 0] id: 211
  if r0_211 then
    _G.AutoBuyFruitSniper = true
    pcall(function()
      -- line: [0, 0] id: 212
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", _G.SelectFruit, false)
    end)
    _G.AutoBuyFruitSniper = false
  end
end):[r101_0](r101_0)
r101_0 = "SetValue"
r101_0 = false
r3_0.ToggleFruit:[r101_0](r101_0)
r101_0 = "AddDropdown"
r101_0 = "DropdownPermanentFruit"
r99_0 = r2_0.Fruit:[r101_0](r101_0, {
  Title = "Chọn Trái Vĩnh Viễn",
  Description = "",
  Values = Table_DevilFruitSniper,
  Multi = false,
  Default = 1,
})
local r102_0 = "SetValue"
r102_0 = _G.PermanentFruit
r99_0:[r102_0](r102_0)
r102_0 = "OnChanged"
function r102_0(r0_433)
  -- line: [0, 0] id: 433
  _G.PermanentFruit = r0_433
end
r99_0:[r102_0](r102_0)
r102_0 = "AddToggle"
r102_0 = "TogglePermanentFruit"
r100_0 = r2_0.Fruit:[r102_0](r102_0, {
  Title = " ổi Trái Vĩnh Viễn",
  Description = "",
  Default = false,
})
local r103_0 = "OnChanged"
(function(r0_18)
  -- line: [0, 0] id: 18
  if r0_18 then
    _G.AutoSwitchPermanentFruit = true
    pcall(function()
      -- line: [0, 0] id: 19
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
        [1] = "SwitchFruit",
        [2] = _G.PermanentFruit,
      }))
    end)
    _G.AutoSwitchPermanentFruit = false
  end
end):[r103_0](r103_0)
r103_0 = "SetValue"
r103_0 = false
r3_0.TogglePermanentFruit:[r103_0](r103_0)
r103_0 = "AddToggle"
r103_0 = "ToggleStore"
r101_0 = r2_0.Fruit:[r103_0](r103_0, {
  Title = "Lưu Trái",
  Description = "",
  Default = false,
})
local r104_0 = "OnChanged"
(function(r0_574)
  -- line: [0, 0] id: 574
  _G.AutoStoreFruit = r0_574
end):[r104_0](r104_0)
r104_0 = "SetValue"
r104_0 = false
r3_0.ToggleStore:[r104_0](r104_0)
spawn(function()
  -- line: [0, 0] id: 482
  while task.wait() do
    local r0_482 = _G.AutoStoreFruit
    if r0_482 then
      pcall(function()
        -- line: [0, 0] id: 483
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
r104_0 = "AddToggle"
r104_0 = "ToggleRandomFruit"
r102_0 = r2_0.Fruit:[r104_0](r104_0, {
  Title = "Random Trái",
  Description = "",
  Default = false,
})
local r105_0 = "OnChanged"
(function(r0_216)
  -- line: [0, 0] id: 216
  _G.Random_Auto = r0_216
end):[r105_0](r105_0)
r105_0 = "SetValue"
r105_0 = false
r3_0.ToggleRandomFruit:[r105_0](r105_0)
spawn(function()
  -- line: [0, 0] id: 309
  pcall(function()
    -- line: [0, 0] id: 310
    while wait() do
      local r0_310 = _G.Random_Auto
      if r0_310 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
      end
    end
  end)
end)
r105_0 = "AddToggle"
r105_0 = "ToggleCollectTP"
r103_0 = r2_0.Fruit:[r105_0](r105_0, {
  Title = "Bay Đến Trái",
  Description = "",
  Default = false,
})
local r106_0 = "OnChanged"
(function(r0_266)
  -- line: [0, 0] id: 266
  _G.CollectFruitTP = r0_266
end):[r106_0](r106_0)
r106_0 = "SetValue"
r106_0 = false
r3_0.ToggleCollectTP:[r106_0](r106_0)
spawn(function()
  -- line: [0, 0] id: 62
  while wait() do
    local r0_62 = _G.CollectFruitTP
    if r0_62 then
      r0_62 = pairs
      for r3_62, r4_62 in r0_62(game.Workspace:GetChildren()) do
        if string.find(r4_62.Name, "Fruit") then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r4_62.Handle.CFrame
        end
      end
    end
  end
end)
r106_0 = "AddToggle"
r106_0 = "ToggleCollect"
r104_0 = r2_0.Fruit:[r106_0](r106_0, {
  Title = "Dịch Chuyển Đến Trái",
  Description = "",
  Default = false,
})
local r107_0 = "OnChanged"
(function(r0_137)
  -- line: [0, 0] id: 137
  _G.Tweenfruit = r0_137
end):[r107_0](r107_0)
r107_0 = "SetValue"
r107_0 = false
r3_0.ToggleCollect:[r107_0](r107_0)
spawn(function()
  -- line: [0, 0] id: 577
  while wait() do
    local r0_577 = _G.Tweenfruit
    if r0_577 then
      r0_577 = pairs
      for r3_577, r4_577 in r0_577(game.Workspace:GetChildren()) do
        if string.find(r4_577.Name, "Fruit") then
          Tween(r4_577.Handle.CFrame)
        end
      end
    end
  end
end)
r107_0 = "AddSection"
r107_0 = " ịnh Vị"
r105_0 = r2_0.Fruit:[r107_0](r107_0)
local r108_0 = "AddToggle"
r108_0 = "ToggleEspPlayer"
r106_0 = r2_0.Fruit:[r108_0](r108_0, {
  Title = "Người Chơi",
  Description = "",
  Default = false,
})
local r109_0 = "OnChanged"
(function(r0_227)
  -- line: [0, 0] id: 227
  ESPPlayer = r0_227
  UpdatePlayerChams()
end):[r109_0](r109_0)
r109_0 = "SetValue"
r109_0 = false
r3_0.ToggleEspPlayer:[r109_0](r109_0)
r109_0 = "AddToggle"
r109_0 = "ToggleEspFruit"
r107_0 = r2_0.Fruit:[r109_0](r109_0, {
  Title = "Trái",
  Description = "",
  Default = false,
})
local r110_0 = "OnChanged"
(function(r0_276)
  -- line: [0, 0] id: 276
  DevilFruitESP = r0_276
  while DevilFruitESP do
    wait()
    UpdateDevilChams()
  end
end):[r110_0](r110_0)
r110_0 = "SetValue"
r110_0 = false
r3_0.ToggleEspFruit:[r110_0](r110_0)
r110_0 = "AddToggle"
r110_0 = "ToggleEspIsland"
r108_0 = r2_0.Fruit:[r110_0](r110_0, {
  Title = " ảo",
  Description = "",
  Default = false,
})
local r111_0 = "OnChanged"
(function(r0_392)
  -- line: [0, 0] id: 392
  IslandESP = r0_392
  while IslandESP do
    wait()
    UpdateIslandESP()
  end
end):[r111_0](r111_0)
r111_0 = "SetValue"
r111_0 = false
r3_0.ToggleEspIsland:[r111_0](r111_0)
r111_0 = "AddToggle"
r111_0 = "ToggleEspFlower"
r109_0 = r2_0.Fruit:[r111_0](r111_0, {
  Title = "Hoa",
  Description = "",
  Default = false,
})
local r112_0 = "OnChanged"
(function(r0_141)
  -- line: [0, 0] id: 141
  FlowerESP = r0_141
  UpdateFlowerChams()
end):[r112_0](r112_0)
r112_0 = "SetValue"
r112_0 = false
r3_0.ToggleEspFlower:[r112_0](r112_0)
spawn(function()
  -- line: [0, 0] id: 350
  while wait() do
    local r0_350 = FlowerESP
    if r0_350 then
      UpdateFlowerChams()
    end
    r0_350 = DevilFruitESP
    if r0_350 then
      UpdateDevilChams()
    end
    r0_350 = ChestESP
    if r0_350 then
      UpdateChestChams()
    end
    r0_350 = ESPPlayer
    if r0_350 then
      UpdatePlayerChams()
    end
    r0_350 = RealFruitESP
    if r0_350 then
      UpdateRealFruitChams()
    end
  end
end)
r112_0 = "AddToggle"
r112_0 = "ToggleEspRealFruit"
r110_0 = r2_0.Fruit:[r112_0](r112_0, {
  Title = "Trái Dứa Khớm Táo",
  Description = "",
  Default = false,
})
local r113_0 = "OnChanged"
(function(r0_449)
  -- line: [0, 0] id: 449
  RealFruitEsp = r0_449
  while RealFruitEsp do
    wait()
    UpdateRealFruitEsp()
  end
end):[r113_0](r113_0)
r113_0 = "SetValue"
r113_0 = false
r3_0.ToggleEspRealFruit:[r113_0](r113_0)
function UpdateRealFruitEsp()
  -- line: [0, 0] id: 585
  for r3_585, r4_585 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
    if r4_585:IsA("Tool") then
      if RealFruitEsp then
        if not r4_585.Handle:FindFirstChild(("NameEsp" .. Number)) then
          local r5_585 = Instance.new("BillboardGui", r4_585.Handle)
          r5_585.Name = "NameEsp" .. Number
          r5_585.ExtentsOffset = Vector3.new(0, 1, 0)
          r5_585.Size = UDim2.new(1, 200, 1, 30)
          r5_585.Adornee = r4_585.Handle
          r5_585.AlwaysOnTop = true
          local r6_585 = Instance.new("TextLabel", r5_585)
          r6_585.Font = Enum.Font.GothamSemibold
          r6_585.FontSize = "Size14"
          r6_585.TextWrapped = true
          r6_585.Size = UDim2.new(1, 0, 1, 0)
          r6_585.TextYAlignment = "Top"
          r6_585.BackgroundTransparency = 1
          r6_585.TextStrokeTransparency = 0.5
          r6_585.TextColor3 = Color3.fromRGB(255, 0, 0)
          r6_585.Text = r4_585.Name .. " \n" .. r8_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_585.Handle.Position)).Magnitude / 3) .. " Distance"
        else
          r4_585.Handle["NameEsp" .. Number].TextLabel.Text = r4_585.Name .. " " .. r8_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_585.Handle.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_585.Handle:FindFirstChild("NameEsp" .. Number) then
        r4_585.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
      end
    end
  end
  for r3_585, r4_585 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
    if r4_585:IsA("Tool") then
      if RealFruitEsp then
        if not r4_585.Handle:FindFirstChild(("NameEsp" .. Number)) then
          local r5_585 = Instance.new("BillboardGui", r4_585.Handle)
          r5_585.Name = "NameEsp" .. Number
          r5_585.ExtentsOffset = Vector3.new(0, 1, 0)
          r5_585.Size = UDim2.new(1, 200, 1, 30)
          r5_585.Adornee = r4_585.Handle
          r5_585.AlwaysOnTop = true
          local r6_585 = Instance.new("TextLabel", r5_585)
          r6_585.Font = Enum.Font.GothamSemibold
          r6_585.FontSize = "Size14"
          r6_585.TextWrapped = true
          r6_585.Size = UDim2.new(1, 0, 1, 0)
          r6_585.TextYAlignment = "Top"
          r6_585.BackgroundTransparency = 1
          r6_585.TextStrokeTransparency = 0.5
          r6_585.TextColor3 = Color3.fromRGB(255, 174, 0)
          r6_585.Text = r4_585.Name .. " \n" .. r8_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_585.Handle.Position)).Magnitude / 3) .. " Distance"
        else
          r4_585.Handle["NameEsp" .. Number].TextLabel.Text = r4_585.Name .. " " .. r8_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_585.Handle.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_585.Handle:FindFirstChild("NameEsp" .. Number) then
        r4_585.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
      end
    end
  end
  for r3_585, r4_585 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
    if r4_585:IsA("Tool") then
      if RealFruitEsp then
        if not r4_585.Handle:FindFirstChild(("NameEsp" .. Number)) then
          local r5_585 = Instance.new("BillboardGui", r4_585.Handle)
          r5_585.Name = "NameEsp" .. Number
          r5_585.ExtentsOffset = Vector3.new(0, 1, 0)
          r5_585.Size = UDim2.new(1, 200, 1, 30)
          r5_585.Adornee = r4_585.Handle
          r5_585.AlwaysOnTop = true
          local r6_585 = Instance.new("TextLabel", r5_585)
          r6_585.Font = Enum.Font.GothamSemibold
          r6_585.FontSize = "Size14"
          r6_585.TextWrapped = true
          r6_585.Size = UDim2.new(1, 0, 1, 0)
          r6_585.TextYAlignment = "Top"
          r6_585.BackgroundTransparency = 1
          r6_585.TextStrokeTransparency = 0.5
          r6_585.TextColor3 = Color3.fromRGB(251, 255, 0)
          r6_585.Text = r4_585.Name .. " \n" .. r8_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_585.Handle.Position)).Magnitude / 3) .. " Distance"
        else
          r4_585.Handle["NameEsp" .. Number].TextLabel.Text = r4_585.Name .. " " .. r8_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_585.Handle.Position)).Magnitude / 3) .. " Distance"
        end
      elseif r4_585.Handle:FindFirstChild("NameEsp" .. Number) then
        r4_585.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
      end
    end
  end
end
r113_0 = "AddToggle"
r113_0 = "ToggleIslandMirageEsp"
r111_0 = r2_0.Fruit:[r113_0](r113_0, {
  Title = " ảo Bí Ẩn",
  Description = "",
  Default = false,
})
local r114_0 = "OnChanged"
(function(r0_132)
  -- line: [0, 0] id: 132
  IslandMirageEsp = r0_132
  while IslandMirageEsp do
    wait()
    UpdateIslandMirageEsp()
  end
end):[r114_0](r114_0)
r114_0 = "SetValue"
r114_0 = false
r3_0.ToggleIslandMirageEsp:[r114_0](r114_0)
function isnil(r0_393)
  -- line: [0, 0] id: 393
  return r0_393 == nil
end
function r112_0(r0_541)
  -- line: [0, 0] id: 541
  return math.floor(tonumber(r0_541) + 0.5)
end
Number = math.random(1, 1000000)
function UpdateIslandMirageEsp()
  -- line: [0, 0] id: 16
  for r3_16, r4_16 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
    pcall(function()
      -- line: [0, 0] id: 17
      if MirageIslandESP and r4_16.Name == "Mirage Island" then
        if not r4_16:FindFirstChild("NameEsp") then
          local r0_17 = Instance.new("BillboardGui", r4_16)
          r0_17.Name = "NameEsp"
          r0_17.ExtentsOffset = Vector3.new(0, 1, 0)
          r0_17.Size = UDim2.new(1, 200, 1, 30)
          r0_17.Adornee = r4_16
          r0_17.AlwaysOnTop = true
          local r1_17 = Instance.new("TextLabel", r0_17)
          r1_17.Font = Enum.Font.Code
          r1_17.FontSize = Enum.FontSize.Size14
          r1_17.TextWrapped = true
          r1_17.Size = UDim2.new(1, 0, 1, 0)
          r1_17.TextYAlignment = Enum.TextYAlignment.Top
          r1_17.BackgroundTransparency = 1
          r1_17.TextStrokeTransparency = 0.5
          r1_17.TextColor3 = Color3.fromRGB(80, 245, 245)
        else
          r4_16.NameEsp.TextLabel.Text = r4_16.Name .. "   \n" .. r112_0(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_16.Position)).Magnitude / 3) .. " M"
        end
      elseif r4_16:FindFirstChild("NameEsp") then
        r4_16:FindFirstChild("NameEsp"):Destroy()
      end
    end)
    -- close: r3_16
  end
end
r113_0 = {
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
}
local r116_0 = "AddDropdown"
r114_0 = r2_0.Raid:[r116_0](r116_0, {
  Title = "Chọn Chip",
  Description = "",
  Values = "DropdownRaid",
  Multi = false,
  Default = 1,
})
local r117_0 = "SetValue"
r117_0 = SelectChip
r114_0:[r117_0](r117_0)
r117_0 = "OnChanged"
function r117_0(r0_124)
  -- line: [0, 0] id: 124
  SelectChip = r0_124
end
r114_0:[r117_0](r117_0)
r117_0 = "AddToggle"
r117_0 = "ToggleBuy"
local r115_0 = r2_0.Raid:[r117_0](r117_0, {
  Title = "Mua Chip",
  Description = "",
  Default = false,
})
local r118_0 = "OnChanged"
(function(r0_131)
  -- line: [0, 0] id: 131
  _G.Auto_Buy_Chips_Dungeon = r0_131
end):[r118_0](r118_0)
r118_0 = "SetValue"
r118_0 = false
r3_0.ToggleBuy:[r118_0](r118_0)
spawn(function()
  -- line: [0, 0] id: 420
  while wait() do
    local r0_420 = _G.Auto_Buy_Chips_Dungeon
    if r0_420 then
      pcall(function()
        -- line: [0, 0] id: 421
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "RaidsNpc",
          [2] = "Select",
          [3] = SelectChip,
        }))
      end)
    end
  end
end)
r118_0 = "AddToggle"
r118_0 = "ToggleStart"
r116_0 = r2_0.Raid:[r118_0](r118_0, {
  Title = "Bắt Đầu Raid",
  Description = "",
  Default = false,
})
local r119_0 = "OnChanged"
(function(r0_1)
  -- line: [0, 0] id: 1
  _G.Auto_StartRaid = r0_1
end):[r119_0](r119_0)
r119_0 = "SetValue"
r119_0 = false
r3_0.ToggleStart:[r119_0](r119_0)
spawn(function()
  -- line: [0, 0] id: 469
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 470
      if _G.Auto_StartRaid and game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false and not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")) then
        if Sea2 then
          Tween2(CFrame.new(-6438.73535, 250.645355, -4501.50684))
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            [1] = "SetSpawnPoint",
          }))
          fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        elseif Sea3 then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
          Tween2(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 0.0000000448217499, -0.378151238, 0.00000000455503146, 1, 0.000000107377559, 0.378151238, 0.000000097681621, -0.925743818))
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            [1] = "SetSpawnPoint",
          }))
          fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        end
      end
    end)
  end
end)
r119_0 = "AddToggle"
r119_0 = "ToggleNextIsland"
r117_0 = r2_0.Raid:[r119_0](r119_0, {
  Title = " ánh Quái Raid + Bay Đến Đảo",
  Description = "",
  Default = false,
})
local r120_0 = "OnChanged"
(function(r0_139)
  -- line: [0, 0] id: 139
  AutoNextIsland = r0_139
  if not r0_139 then
    _G.AutoNear = false
  end
end):[r120_0](r120_0)
r120_0 = "SetValue"
r120_0 = false
r3_0.ToggleNextIsland:[r120_0](r120_0)
spawn(function()
  -- line: [0, 0] id: 150
  local r0_150 = {}
  while task.wait() do
    local r1_150 = AutoNextIsland
    if r1_150 then
      pcall(function()
        -- line: [0, 0] id: 151
        local r0_151 = game.Players.LocalPlayer.Character
        if r0_151 and r0_151:FindFirstChild("HumanoidRootPart") then
          local r1_151 = game:GetService("Workspace")._WorldOrigin.Locations
          local r2_151 = r0_151.HumanoidRootPart.Position
          if (r2_151 - Vector3.new(-6438.73535, 250.645355, -4501.50684)).Magnitude < 1 or (r2_151 - Vector3.new(-5017.40869, 314.844055, -2823.0127)).Magnitude < 1 then
            r0_150 = {}
          end
          if r1_151:FindFirstChild("Island 1") then
            _G.AutoNear = true
          end
          if r1_151:FindFirstChild("Island 2") and not r0_150["Island 2"] then
            Tween(r1_151:FindFirstChild("Island 2").CFrame)
            r0_150["Island 2"] = true
            AutoNextIsland = false
            wait()
            AutoNextIsland = true
          elseif r1_151:FindFirstChild("Island 3") and not r0_150["Island 3"] then
            Tween(r1_151:FindFirstChild("Island 3").CFrame)
            r0_150["Island 3"] = true
            AutoNextIsland = false
            wait()
            AutoNextIsland = true
          elseif r1_151:FindFirstChild("Island 4") and not r0_150["Island 4"] then
            Tween(r1_151:FindFirstChild("Island 4").CFrame)
            r0_150["Island 4"] = true
            AutoNextIsland = false
            wait()
            AutoNextIsland = true
          elseif r1_151:FindFirstChild("Island 5") and not r0_150["Island 5"] then
            Tween(r1_151:FindFirstChild("Island 5").CFrame)
            r0_150["Island 5"] = true
            AutoNextIsland = false
            wait()
            AutoNextIsland = true
          end
        end
      end)
    end
  end
end)
r120_0 = "AddToggle"
r120_0 = "ToggleAwake"
r118_0 = r2_0.Raid:[r120_0](r120_0, {
  Title = "Thức Tỉnh",
  Description = "",
  Default = false,
})
local r121_0 = "OnChanged"
(function(r0_60)
  -- line: [0, 0] id: 60
  AutoAwakenAbilities = r0_60
end):[r121_0](r121_0)
r121_0 = "SetValue"
r121_0 = false
r3_0.ToggleAwake:[r121_0](r121_0)
spawn(function()
  -- line: [0, 0] id: 283
  while task.wait() do
    local r0_283 = AutoAwakenAbilities
    if r0_283 then
      pcall(function()
        -- line: [0, 0] id: 284
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
      end)
    end
  end
end)
r121_0 = "AddToggle"
r121_0 = "ToggleGetFruit"
r119_0 = r2_0.Raid:[r121_0](r121_0, {
  Title = "Lấy Trái Dưới 1 Triệu",
  Description = "",
  Default = false,
})
local r122_0 = "OnChanged"
(function(r0_2)
  -- line: [0, 0] id: 2
  _G.Autofruit = r0_2
end):[r122_0](r122_0)
spawn(function()
  -- line: [0, 0] id: 231
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 232
      if _G.Autofruit then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Rocket-Rocket",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Spin-Spin",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Chop-Chop",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Spring-Spring",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Bomb-Bomb",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Smoke-Smoke",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Spike-Spike",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Flame-Flame",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Falcon-Falcon",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Ice-Ice",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Sand-Sand",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Dark-Dark",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Ghost-Ghost",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Diamond-Diamond",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Light-Light",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Rubber-Rubber",
        }))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
          [1] = "LoadFruit",
          [2] = "Barrier-Barrier",
        }))
      end
    end)
  end
end)
if Sea2 then
  r122_0 = "AddButton"
  r122_0 = {
    Title = "Bay Đến Chỗ Tập Kích",
    Description = "",
    Callback = function()
      -- line: [0, 0] id: 527
      Tween2(CFrame.new(-6438.73535, 250.645355, -4501.50684))
    end,
  }
  r2_0.Raid:[r122_0](r122_0)
elseif Sea3 then
  r122_0 = "AddButton"
  r122_0 = {
    Title = "Bay Đến Chỗ Tập Kích",
    Description = "",
    Callback = function()
      -- line: [0, 0] id: 280
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
      Tween2(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 0.0000000448217499, -0.378151238, 0.00000000455503146, 1, 0.000000107377559, 0.378151238, 0.000000097681621, -0.925743818))
    end,
  }
  r2_0.Raid:[r122_0](r122_0)
end
r122_0 = "AddSection"
r122_0 = "Tập Kích Law"
r120_0 = r2_0.Raid:[r122_0](r122_0)
local r123_0 = "AddToggle"
r123_0 = "ToggleLaw"
r121_0 = r2_0.Raid:[r123_0](r123_0, {
  Title = "Mua Chip Và Đánh Law",
  Description = "",
  Default = false,
})
local r124_0 = "OnChanged"
(function(r0_96)
  -- line: [0, 0] id: 96
  Auto_Law = r0_96
end):[r124_0](r124_0)
r124_0 = "SetValue"
r124_0 = false
r3_0.ToggleLaw:[r124_0](r124_0)
spawn(function()
  -- line: [0, 0] id: 316
  pcall(function()
    -- line: [0, 0] id: 317
    while wait() do
      local r0_317 = Auto_Law
      if r0_317 then
        r0_317 = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip")
        if not r0_317 then
          r0_317 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip")
          if not r0_317 then
            r0_317 = game:GetService("Workspace").Enemies:FindFirstChild("Order")
            if not r0_317 then
              r0_317 = game:GetService("ReplicatedStorage")
              r0_317 = r0_317:FindFirstChild("Order")
              if not r0_317 then
                wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
              end
            end
          end
        end
      end
    end
  end)
end)
spawn(function()
  -- line: [0, 0] id: 356
  pcall(function()
    -- line: [0, 0] id: 357
    while wait() do
      local r0_357 = Auto_Law
      if r0_357 then
        r0_357 = game:GetService("Workspace").Enemies:FindFirstChild("Order")
        if not r0_357 then
          r0_357 = game:GetService("ReplicatedStorage")
          r0_357 = r0_357:FindFirstChild("Order")
          if not r0_357 then
            r0_357 = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip")
            if not r0_357 then
              r0_357 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip")
              if r0_357 then
                ::label_48::
                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
              end
            else
              goto label_48	-- block#6 is visited secondly
            end
          end
        end
        r0_357 = game:GetService("ReplicatedStorage")
        r0_357 = r0_357:FindFirstChild("Order")
        if not r0_357 then
          r0_357 = game:GetService("Workspace").Enemies:FindFirstChild("Order")
          if not r0_357 then
          end
        end
        r0_357 = game:GetService("Workspace").Enemies:FindFirstChild("Order")
        if r0_357 then
          r0_357 = pairs
          for r3_357, r4_357 in r0_357(game:GetService("Workspace").Enemies:GetChildren()) do
            if r4_357.Name == "Order" then
              while true do
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                AutoHaki()
                EquipTool(SelectWeapon)
                Tween(r4_357.HumanoidRootPart.CFrame * Pos)
                r4_357.HumanoidRootPart.CanCollide = false
                r4_357.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                if r4_357.Parent then
                  local r5_357 = r4_357.Humanoid.Health
                  if r5_357 > 0 then
                    r5_357 = Auto_Law
                    if r5_357 == false then
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              end
            end
          end
        else
          r0_357 = game:GetService("ReplicatedStorage")
          r0_357 = r0_357:FindFirstChild("Order")
          if r0_357 then
            Tween(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
          end
        end
      end
    end
  end)
end)
r124_0 = "AddButton"
r124_0 = {
  Title = " ền Thời Gian",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 83
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
  end,
}
r2_0.Race:[r124_0](r124_0)
r124_0 = "AddButton"
r124_0 = {
  Title = "Cần Gạt",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 57
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
  end,
}
r2_0.Race:[r124_0](r124_0)
r124_0 = "AddButton"
r124_0 = {
  Title = "Chỗ Mua Gear",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 97
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    Tween2(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
  end,
}
r2_0.Race:[r124_0](r124_0)
r124_0 = "AddSection"
r124_0 = "Tộc"
r122_0 = r2_0.Race:[r124_0](r124_0)
local r125_0 = "AddButton"
r125_0 = {
  Title = "Cửa Tộc",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 197
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
  end,
}
r2_0.Race:[r125_0](r125_0)
r125_0 = "AddToggle"
r125_0 = "ToggleHumanandghoul"
r123_0 = r2_0.Race:[r125_0](r125_0, {
  Title = "Hoàn Thành Ải [Human/Ghoul]",
  Description = "",
  Default = false,
})
local r126_0 = "OnChanged"
(function(r0_294)
  -- line: [0, 0] id: 294
  KillAura = r0_294
end):[r126_0](r126_0)
r126_0 = "SetValue"
r126_0 = false
r3_0.ToggleHumanandghoul:[r126_0](r126_0)
r126_0 = "AddToggle"
r126_0 = "ToggleAutotrial"
r124_0 = r2_0.Race:[r126_0](r126_0, {
  Title = "Hoàn Thành Ải",
  Description = "",
  Default = false,
})
local r127_0 = "OnChanged"
(function(r0_339)
  -- line: [0, 0] id: 339
  _G.AutoQuestRace = r0_339
end):[r127_0](r127_0)
r127_0 = "SetValue"
r127_0 = false
r3_0.ToggleAutotrial:[r127_0](r127_0)
spawn(function()
  -- line: [0, 0] id: 285
  pcall(function()
    -- line: [0, 0] id: 286
    while wait() do
      local r0_286 = _G.AutoQuestRace
      if r0_286 then
        r0_286 = game:GetService("Players").LocalPlayer.Data.Race.Value
        local r4_286 = nil	-- notice: implicit variable refs by block#[13, 14, 19, 20, 44, 47, 48, 49, 50, 56, 57]
        if r0_286 == "Human" then
          r0_286 = pairs
          for r3_286, r4_286 in r0_286(game.Workspace.Enemies:GetDescendants()) do
            if r4_286:FindFirstChild("Humanoid") and r4_286:FindFirstChild("HumanoidRootPart") and 0 < r4_286.Humanoid.Health then
              pcall(function()
                -- line: [0, 0] id: 288
                while true do
                  wait()
                  r4_286.Humanoid.Health = 0
                  r4_286.HumanoidRootPart.CanCollide = false
                  sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                  if _G.AutoQuestRace then
                    local r0_288 = r4_286.Parent
                    if r0_288 then
                      r0_288 = r4_286.Humanoid.Health
                      if r0_288 <= 0 then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
              end)
            end
            -- close: r3_286
          end
        else
          r0_286 = game:GetService("Players").LocalPlayer.Data.Race.Value
          if r0_286 == "Skypiea" then
            r0_286 = pairs
            for r3_286, r4_286 in r0_286(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
              if r4_286.Name == "snowisland_Cylinder.081" then
                BKP(r4_286.CFrame * CFrame.new(0, 0, 0))
              end
            end
          else
            r0_286 = game:GetService("Players").LocalPlayer.Data.Race.Value
            if r0_286 == "Fishman" then
              r0_286 = pairs
              for r3_286, r4_286 in r0_286(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                if r4_286.Name == "HumanoidRootPart" then
                  Tween(r4_286.CFrame * Pos)
                  for r8_286, r9_286 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if r9_286:IsA("Tool") and r9_286.ToolTip == "Melee" then
                      game.Players.LocalPlayer.Character.Humanoid:EquipTool(r9_286)
                    end
                  end
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  for r8_286, r9_286 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if r9_286:IsA("Tool") and r9_286.ToolTip == "Blox Fruit" then
                      game.Players.LocalPlayer.Character.Humanoid:EquipTool(r9_286)
                    end
                  end
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait()
                  for r8_286, r9_286 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if r9_286:IsA("Tool") and r9_286.ToolTip == "Sword" then
                      game.Players.LocalPlayer.Character.Humanoid:EquipTool(r9_286)
                    end
                  end
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait()
                  for r8_286, r9_286 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if r9_286:IsA("Tool") and r9_286.ToolTip == "Gun" then
                      game.Players.LocalPlayer.Character.Humanoid:EquipTool(r9_286)
                    end
                  end
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                end
              end
            else
              r0_286 = game:GetService("Players").LocalPlayer.Data.Race.Value
              if r0_286 == "Cyborg" then
                r4_286 = -30
                Tween(CFrame.new(28654, 14898.7832, r4_286, 1, 0, 0, 0, 1, 0, 0, 0, 1))
              else
                r0_286 = game:GetService("Players").LocalPlayer.Data.Race.Value
                if r0_286 == "Ghoul" then
                  r0_286 = pairs
                  for r3_286, r4_286 in r0_286(game.Workspace.Enemies:GetDescendants()) do
                    if r4_286:FindFirstChild("Humanoid") and r4_286:FindFirstChild("HumanoidRootPart") and 0 < r4_286.Humanoid.Health then
                      pcall(function()
                        -- line: [0, 0] id: 287
                        while true do
                          wait()
                          r4_286.Humanoid.Health = 0
                          r4_286.HumanoidRootPart.CanCollide = false
                          sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                          if _G.AutoQuestRace then
                            local r0_287 = r4_286.Parent
                            if r0_287 then
                              r0_287 = r4_286.Humanoid.Health
                              if r0_287 <= 0 then
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        end
                      end)
                    end
                    -- close: r3_286
                  end
                else
                  r0_286 = game:GetService("Players").LocalPlayer.Data.Race.Value
                  if r0_286 == "Mink" then
                    r0_286 = pairs
                    for r3_286, r4_286 in r0_286(game:GetService("Workspace"):GetDescendants()) do
                      if r4_286.Name == "StartPoint" then
                        Tween(r4_286.CFrame * CFrame.new(0, 10, 0))
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end)
end)
r127_0 = "AddToggle"
r127_0 = "ToggleKillTrial"
r125_0 = r2_0.Race:[r127_0](r127_0, {
  Title = " ánh Người Chơi Trong Trial",
  Description = "",
  Default = false,
})
local r128_0 = "OnChanged"
(function(r0_478)
  -- line: [0, 0] id: 478
  _G.AutoKillTrial = r0_478
end):[r128_0](r128_0)
r128_0 = "SetValue"
r128_0 = false
r3_0.ToggleKillTrial:[r128_0](r128_0)
spawn(function()
  -- line: [0, 0] id: 476
  while wait() do
    pcall(function()
      -- line: [0, 0] id: 477
      if _G.AutoKillTrial then
        for r3_477, r4_477 in pairs(game:GetService("Players"):GetChildren()) do
          if r4_477.Name and r4_477.Name ~= game.Players.LocalPlayer.Name and (r4_477.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 and 0 < r4_477.Character.Humanoid.Health then
            while true do
              wait(_G.Fast_Delay)
              EquipTool(SelectWeapon)
              AutoHaki()
              Tween(r4_477.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
              r4_477.Character.HumanoidRootPart.CanCollide = false
              r4_477.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              AttackNoCoolDown()
              if _G.AutoKillTrial then
                local r5_477 = r4_477.Parent
                if r5_477 then
                  r5_477 = r4_477.Character.Humanoid.Health
                  if r5_477 <= 0 then
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
          end
        end
      end
    end)
  end
end)
r128_0 = "AddSection"
r128_0 = "Huấn Luyện"
r126_0 = r2_0.Race:[r128_0](r128_0)
local r129_0 = "AddToggle"
r129_0 = "ToggleFarmRace"
r127_0 = r2_0.Race:[r129_0](r129_0, {
  Title = "Cày Luyện Tộc",
  Description = "",
  Default = false,
})
r128_0 = false
local r131_0 = "OnChanged"
function r131_0(r0_256)
  -- line: [0, 0] id: 256
  r128_0 = r0_256
end
r127_0:[r131_0](r131_0)
r131_0 = "SetValue"
r131_0 = false
r3_0.ToggleFarmRace:[r131_0](r131_0)
spawn(function()
  -- line: [0, 0] id: 427
  while wait() do
    local r0_427 = r128_0
    if r0_427 then
      pcall(function()
        -- line: [0, 0] id: 428
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
      r0_427 = _G
      r0_427.AutoBoneNoQuest = false
    end
  end
end)
r131_0 = "AddToggle"
r131_0 = "ToggleUpgrade"
r129_0 = r2_0.Race:[r131_0](r131_0, {
  Title = "Mua Gear",
  Description = "",
  Default = false,
})
local r132_0 = "OnChanged"
(function(r0_439)
  -- line: [0, 0] id: 439
  _G.AutoUpgrade = r0_439
  if _G.AutoUpgrade then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
  end
end):[r132_0](r132_0)
r132_0 = "SetValue"
r132_0 = false
r3_0.ToggleUpgrade:[r132_0](r132_0)
r132_0 = "AddSection"
r132_0 = "Khả Năng"
local r130_0 = r2_0.Shop:[r132_0](r132_0)
local r133_0 = "AddButton"
r133_0 = {
  Title = "Geppo",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 259
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
  end,
}
r2_0.Shop:[r133_0](r133_0)
r133_0 = "AddButton"
r133_0 = {
  Title = "Buso",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 177
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
  end,
}
r2_0.Shop:[r133_0](r133_0)
r133_0 = "AddButton"
r133_0 = {
  Title = "Soru",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 64
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
  end,
}
r2_0.Shop:[r133_0](r133_0)
r133_0 = "AddButton"
r133_0 = {
  Title = "Ken",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 228
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
  end,
}
r2_0.Shop:[r133_0](r133_0)
r133_0 = "AddSection"
r133_0 = "Kiếm"
r131_0 = r2_0.Shop:[r133_0](r133_0)
local r134_0 = "AddButton"
r134_0 = {
  Title = "Cutlass",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 382
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
  end,
}
r2_0.Shop:[r134_0](r134_0)
r134_0 = "AddButton"
r134_0 = {
  Title = "Katana",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 149
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
  end,
}
r2_0.Shop:[r134_0](r134_0)
r134_0 = "AddButton"
r134_0 = {
  Title = "Iron Mace",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 79
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
  end,
}
r2_0.Shop:[r134_0](r134_0)
r134_0 = "AddButton"
r134_0 = {
  Title = "Duel Katana",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 178
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
  end,
}
r2_0.Shop:[r134_0](r134_0)
r134_0 = "AddButton"
r134_0 = {
  Title = "Triple Katana",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 400
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
  end,
}
r2_0.Shop:[r134_0](r134_0)
r134_0 = "AddButton"
r134_0 = {
  Title = "Pipe",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 196
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
  end,
}
r2_0.Shop:[r134_0](r134_0)
r134_0 = "AddButton"
r134_0 = {
  Title = "Dual-Headed Blade",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 351
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
  end,
}
r2_0.Shop:[r134_0](r134_0)
r134_0 = "AddButton"
r134_0 = {
  Title = "Bisento",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 236
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
  end,
}
r2_0.Shop:[r134_0](r134_0)
r134_0 = "AddButton"
r134_0 = {
  Title = "Soul Cane",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 450
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
  end,
}
r2_0.Shop:[r134_0](r134_0)
r134_0 = "AddButton"
r134_0 = {
  Title = "Pole V2",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 14
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
  end,
}
r2_0.Shop:[r134_0](r134_0)
r134_0 = "AddSection"
r134_0 = "Súng"
r132_0 = r2_0.Shop:[r134_0](r134_0)
local r135_0 = "AddButton"
r135_0 = {
  Title = "Musket",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 225
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Musket")
  end,
}
r2_0.Shop:[r135_0](r135_0)
r135_0 = "AddButton"
r135_0 = {
  Title = "Slingshot",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 142
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
  end,
}
r2_0.Shop:[r135_0](r135_0)
r135_0 = "AddButton"
r135_0 = {
  Title = "Flintlock",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 369
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
  end,
}
r2_0.Shop:[r135_0](r135_0)
r135_0 = "AddButton"
r135_0 = {
  Title = "Refined Slingshot",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 528
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Slingshot")
  end,
}
r2_0.Shop:[r135_0](r135_0)
r135_0 = "AddButton"
r135_0 = {
  Title = "Dual Flintlock",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 364
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock")
  end,
}
r2_0.Shop:[r135_0](r135_0)
r135_0 = "AddButton"
r135_0 = {
  Title = "Cannon",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 65
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
  end,
}
r2_0.Shop:[r135_0](r135_0)
r135_0 = "AddButton"
r135_0 = {
  Title = "Kabucha",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 447
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
  end,
}
r2_0.Shop:[r135_0](r135_0)
r135_0 = "AddSection"
r135_0 = "Phụ Kiện"
r133_0 = r2_0.Shop:[r135_0](r135_0)
local r136_0 = "AddButton"
r136_0 = {
  Title = "Black Cape",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 117
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
  end,
}
r2_0.Shop:[r136_0](r136_0)
r136_0 = "AddButton"
r136_0 = {
  Title = "Swordsman Hat",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 47
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
  end,
}
r2_0.Shop:[r136_0](r136_0)
r136_0 = "AddButton"
r136_0 = {
  Title = "Tomoe Ring",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 311
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
  end,
}
r2_0.Shop:[r136_0](r136_0)
r136_0 = "AddSection"
r136_0 = "Võ"
r134_0 = r2_0.Shop:[r136_0](r136_0)
local r137_0 = "AddButton"
r137_0 = {
  Title = "Black Leg",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 417
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
  end,
}
r2_0.Shop:[r137_0](r137_0)
r137_0 = "AddButton"
r137_0 = {
  Title = "Electro",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 7
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
  end,
}
r2_0.Shop:[r137_0](r137_0)
r137_0 = "AddButton"
r137_0 = {
  Title = "Fishman Karate",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 147
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
  end,
}
r2_0.Shop:[r137_0](r137_0)
r137_0 = "AddButton"
r137_0 = {
  Title = "Dragon Claw",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 269
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
  end,
}
r2_0.Shop:[r137_0](r137_0)
r137_0 = "AddButton"
r137_0 = {
  Title = "Superhuman",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 549
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
  end,
}
r2_0.Shop:[r137_0](r137_0)
r137_0 = "AddButton"
r137_0 = {
  Title = "Death Step",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 15
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
  end,
}
r2_0.Shop:[r137_0](r137_0)
r137_0 = "AddButton"
r137_0 = {
  Title = "Sharkman Karate",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 524
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
  end,
}
r2_0.Shop:[r137_0](r137_0)
r137_0 = "AddButton"
r137_0 = {
  Title = "Electric Claw",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 479
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
  end,
}
r2_0.Shop:[r137_0](r137_0)
r137_0 = "AddButton"
r137_0 = {
  Title = "Dragon Talon",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 378
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
  end,
}
r2_0.Shop:[r137_0](r137_0)
r137_0 = "AddButton"
r137_0 = {
  Title = "Godhuman",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 406
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
  end,
}
r2_0.Shop:[r137_0](r137_0)
r137_0 = "AddButton"
r137_0 = {
  Title = "Sanguine Art",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 423
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
  end,
}
r2_0.Shop:[r137_0](r137_0)
r137_0 = "AddSection"
r137_0 = "Khác"
r135_0 = r2_0.Shop:[r137_0](r137_0)
local r138_0 = "AddButton"
r138_0 = {
  Title = " ổi Chỉ Số",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 546
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
  end,
}
r2_0.Shop:[r138_0](r138_0)
r138_0 = "AddButton"
r138_0 = {
  Title = " ổi Tộc",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 73
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
  end,
}
r2_0.Shop:[r138_0](r138_0)
r138_0 = "AddButton"
r138_0 = {
  Title = " ổi Tộc Ghoul",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 296
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
      [1] = "Ectoplasm",
      [2] = "Change",
      [3] = 4,
    }))
  end,
}
r2_0.Shop:[r138_0](r138_0)
r138_0 = "AddButton"
r138_0 = {
  Title = " ổi Tộc Cyborg",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 108
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
      [1] = "CyborgTrainer",
      [2] = "Buy",
    }))
  end,
}
r2_0.Shop:[r138_0](r138_0)
r138_0 = "AddButton"
r138_0 = {
  Title = " ổi Tộc Draco",
  Description = "Chỉ Ở Biển 3",
  Callback = function()
    -- line: [0, 0] id: 155
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906))
    Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    local r0_155 = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)
    local r1_155 = game.Players.LocalPlayer
    local r2_155 = r1_155.Character or r1_155.CharacterAdded:Wait()
    repeat
      wait()
    until (r2_155.HumanoidRootPart.Position - r0_155).Magnitude < 1
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({
      [1] = {
        NPC = "Dragon Wizard",
        Command = "DragonRace",
      },
    }))
  end,
}
r2_0.Shop:[r138_0](r138_0)
r138_0 = "AddButton"
r138_0 = {
  Title = "Tham Gia Máy Chủ Lại",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 125
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
  end,
}
r2_0.Misc:[r138_0](r138_0)
r138_0 = "AddButton"
r138_0 = {
  Title = " ổi Máy Chủ",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 70
    Hop()
  end,
}
r2_0.Misc:[r138_0](r138_0)
function Hop()
  -- line: [0, 0] id: 505
  local r0_505 = game.PlaceId
  local r1_505 = {}
  local r2_505 = ""
  local r3_505 = os.date("!*t").hour
  local r4_505 = false
  function TPReturner()
    -- line: [0, 0] id: 508
    local r0_508 = nil	-- notice: implicit variable refs by block#[3, 4, 5, 6, 7]
    if r2_505 == "" then
      r0_508 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. r0_505 .. "/servers/Public?sortOrder=Asc&limit=100"))
    else
      r0_508 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. r0_505 .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. r2_505))
    end
    local r1_508 = ""
    if r0_508.nextPageCursor and r0_508.nextPageCursor ~= "null" and r0_508.nextPageCursor ~= nil then
      r2_505 = r0_508.nextPageCursor
    end
    local r2_508 = 0
    for r6_508, r7_508 in pairs(r0_508.data) do
      local r8_508 = true
      r1_508 = tostring(r7_508.id)
      if tonumber(r7_508.playing) < tonumber(r7_508.maxPlayers) then
        for r12_508, r13_508 in pairs(r1_505) do
          if r2_508 ~= 0 and r1_508 == tostring(r13_508) then
            r8_508 = false
          elseif tonumber(r3_505) ~= tonumber(r13_508) then
            local r14_508 = pcall(function()
              -- line: [0, 0] id: 510
              r1_505 = {}
              table.insert(r1_505, r3_505)
            end)
          end
          r2_508 = r2_508 + 1
        end
        if r8_508 == true then
          table.insert(r1_505, r1_508)
          wait()
          pcall(function()
            -- line: [0, 0] id: 509
            wait()
            game:GetService("TeleportService"):TeleportToPlaceInstance(r0_505, r1_508, game.Players.LocalPlayer)
          end)
          wait()
        end
      end
    end
  end
  r91_0 = function()
    -- line: [0, 0] id: 506
    while wait() do
      pcall(function()
        -- line: [0, 0] id: 507
        TPReturner()
        if r2_505 ~= "" then
          TPReturner()
        end
      end)
    end
  end
  r91_0()
end
r138_0 = "AddSection"
r138_0 = " ội"
r136_0 = r2_0.Misc:[r138_0](r138_0)
local r139_0 = "AddButton"
r139_0 = {
  Title = "Hải Tặc",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 401
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
  end,
}
r2_0.Misc:[r139_0](r139_0)
r139_0 = "AddButton"
r139_0 = {
  Title = "Hải Quân",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 154
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
  end,
}
r2_0.Misc:[r139_0](r139_0)
r139_0 = "AddSection"
r139_0 = "Kinh Nghiệm"
r137_0 = r2_0.Misc:[r139_0](r139_0)
r138_0 = {
  "KITT_RESET",
  "Sub2UncleKizaru",
  "SUB2GAMERROBOT_RESET1",
  "Sub2Fer999",
  "Enyu_is_Pro",
  "JCWK",
  "StarcodeHEO",
  "MagicBus",
  "KittGaming",
  "Sub2CaptainMaui",
  "Sub2OfficalNoobie",
  "TheGreatAce",
  "Sub2NoobMaster123",
  "Sub2Daigrock",
  "Axiore",
  "StrawHatMaine",
  "TantaiGaming",
  "Bluxxy",
  "SUB2GAMERROBOT_EXP1",
  "Chandler",
  "NOMOREHACK",
  "BANEXPLOIT",
  "WildDares",
  "BossBuild",
  "GetPranked",
  "EARN_FRUITS",
  "FIGHT4FRUIT",
  "NOEXPLOITER",
  "NOOB2ADMIN",
  "CODESLIDE",
  "ADMINHACKED",
  "ADMINDARES",
  "fruitconcepts",
  "krazydares",
  "TRIPLEABUSE",
  "SEATROLLING",
  "24NOADMIN",
  "REWARDFUN",
  "NEWTROLL",
  "fudd10_v2",
  "Fudd10",
  "Bignews",
  "SECRET_ADMIN"
}
local r141_0 = "AddButton"
r141_0 = {
  Title = "Nhập Hết Code",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 5
    for r3_5, r4_5 in ipairs(r138_0) do
      RedeemCode(r4_5)
    end
  end,
}
r2_0.Misc:[r141_0](r141_0)
function RedeemCode(r0_579)
  -- line: [0, 0] id: 579
  game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(r0_579)
end
r141_0 = "AddSection"
r141_0 = "Danh Hiệu"
r139_0 = r2_0.Misc:[r141_0](r141_0)
local r142_0 = "AddButton"
r142_0 = {
  Title = "Danh Hiệu",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 496
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
      [1] = "getTitles",
    }))
    game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
  end,
}
r2_0.Misc:[r142_0](r142_0)
r142_0 = "AddSection"
r142_0 = "Thức Tỉnh"
local r140_0 = r2_0.Misc:[r142_0](r142_0)
local r143_0 = "AddButton"
r143_0 = {
  Title = "Thức Tỉnh",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 238
    game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
  end,
}
r2_0.Misc:[r143_0](r143_0)
r143_0 = "AddSection"
r143_0 = "Khác"
r141_0 = r2_0.Misc:[r143_0](r143_0)
local r144_0 = "AddToggle"
r144_0 = "ToggleRejoin"
r142_0 = r2_0.Misc:[r144_0](r144_0, {
  Title = "Tham Gia Máy Chủ Lại",
  Description = "",
  Default = true,
})
local r145_0 = "OnChanged"
(function(r0_262)
  -- line: [0, 0] id: 262
  _G.AutoRejoin = r0_262
end):[r145_0](r145_0)
r145_0 = "SetValue"
r145_0 = true
r3_0.ToggleRejoin:[r145_0](r145_0)
spawn(function()
  -- line: [0, 0] id: 307
  while wait() do
    local r0_307 = _G.AutoRejoin
    if r0_307 then
      r0_307 = getgenv()
      r0_307.rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(r0_308)
        -- line: [0, 0] id: 308
        if r0_308.Name == "ErrorPrompt" and r0_308:FindFirstChild("MessageArea") and r0_308.MessageArea:FindFirstChild("ErrorFrame") then
          game:GetService("TeleportService"):Teleport(game.PlaceId)
        end
      end)
    end
  end
end)
r145_0 = "AddSection"
r145_0 = "Sương"
r143_0 = r2_0.Misc:[r145_0](r145_0)
function r144_0()
  -- line: [0, 0] id: 217
  local r0_217 = game:GetService("Lighting")
  if r0_217:FindFirstChild("BaseAtmosphere") then
    r0_217.BaseAtmosphere:Destroy()
  end
  if r0_217:FindFirstChild("SeaTerrorCC") then
    r0_217.SeaTerrorCC:Destroy()
  end
  if r0_217:FindFirstChild("LightingLayers") then
    if r0_217.LightingLayers:FindFirstChild("Atmosphere") then
      r0_217.LightingLayers.Atmosphere:Destroy()
    end
    wait()
    if r0_217.LightingLayers:FindFirstChild("DarkFog") then
      r0_217.LightingLayers.DarkFog:Destroy()
    end
  end
  r0_217.FogEnd = 100000
end
local r147_0 = "AddButton"
r147_0 = {
  Title = "Xóa Sương Mù",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 391
    r144_0()
  end,
}
r2_0.Misc:[r147_0](r147_0)
r147_0 = "AddToggle"
r147_0 = "ToggleAntiBand"
r145_0 = r2_0.Misc:[r147_0](r147_0, {
  Title = "Chống Ban",
  Description = "",
  Default = true,
})
local r148_0 = "OnChanged"
(function(r0_52)
  -- line: [0, 0] id: 52
  _G.AntiBand = r0_52
end):[r148_0](r148_0)
local r146_0 = {
  17884881,
  120173604,
  912348
}
spawn(function()
  -- line: [0, 0] id: 27
  while wait() do
    local r0_27 = _G.AntiBand
    if r0_27 then
      r0_27 = pairs
      for r3_27, r4_27 in r0_27(game:GetService("Players"):GetPlayers()) do
        if table.find(r146_0, r4_27.UserId) then
          Hop()
        end
      end
    end
  end
end)
local r149_0 = "AddSection"
r149_0 = "Leviathan"
r147_0 = r2_0.Sea:[r149_0](r149_0)
local r150_0 = "AddButton"
r150_0 = {
  Title = "Mua Chip Leviathan",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 548
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
  end,
}
r2_0.Sea:[r150_0](r150_0)
r150_0 = "AddToggle"
r150_0 = "ToggleTPFrozenDimension"
r148_0 = r2_0.Sea:[r150_0](r150_0, {
  Title = "Bay Đến Đảo Leviathan",
  Description = "",
  Default = false,
})
local r151_0 = "OnChanged"
function r151_0(r0_265)
  -- line: [0, 0] id: 265
  _G.TweenToFrozenDimension = r0_265
end
r148_0:[r151_0](r151_0)
r151_0 = "SetValue"
r151_0 = false
r148_0:[r151_0](r151_0)
spawn(function()
  -- line: [0, 0] id: 329
  while true do
    local r0_329 = nil	-- notice: implicit variable refs by block#[0, 4, 5]
    if not r0_329 then
      r0_329 = game:GetService("Workspace").Map:FindFirstChild("FrozenDimension")
      wait()
    else
      break
    end
  end
  while wait() do
    local r1_329 = _G.TweenToFrozenDimension
    if r1_329 and r0_329 then
      Tween(r0_329.CFrame)
    end
  end
end)
r149_0 = Sea3
if r149_0 then
  r151_0 = "AddParagraph"
  r151_0 = {
    Title = "Trạng Thái Chip Leviathan",
    Content = "",
  }
  r149_0 = r2_0.Sea:[r151_0](r151_0)
  spawn(function()
    -- line: [0, 0] id: 180
    pcall(function()
      -- line: [0, 0] id: 181
      while wait() do
        local r0_181 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "1")
        if r0_181 == 5 then
          r149_0:SetDesc("Leviathan Is Out There")
        elseif r0_181 == 0 then
          r149_0:SetDesc("I Don\'t Know")
        else
          r149_0:SetDesc("Mua: " .. tostring(r0_181))
        end
      end
    end)
  end)
  -- close: r149_0
end
r149_0 = r2_0.Sea
r151_0 = "AddSection"
r151_0 = "Draco"
r149_0 = r149_0:[r151_0](r151_0)
local r152_0 = "AddToggle"
r152_0 = "ToggleBlazeEmber"
r150_0 = r2_0.Sea:[r152_0](r152_0, {
  Title = "Lụm Lửa Đỏ",
  Description = "",
  Default = false,
})
local r153_0 = "OnChanged"
(function(r0_498)
  -- line: [0, 0] id: 498
  _G.AutoBlazeEmber = r0_498
end):[r153_0](r153_0)
spawn(function()
  -- line: [0, 0] id: 376
  while wait() do
    local r0_376 = _G.AutoBlazeEmber
    if r0_376 then
      pcall(function()
        -- line: [0, 0] id: 377
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/DragonDojoEmber"):FireServer()
      end)
    end
  end
end)
r153_0 = "AddToggle"
r153_0 = "ToggleBlazeEmberFarm"
r151_0 = r2_0.Sea:[r153_0](r153_0, {
  Title = " ánh Hydra Enforcer + Venomous Assailant",
  Description = "",
  Default = false,
})
local r154_0 = "OnChanged"
(function(r0_138)
  -- line: [0, 0] id: 138
  _G.AutoBlazeEmberFarm = r0_138
end):[r154_0](r154_0)
spawn(function()
  -- line: [0, 0] id: 542
  while task.wait() do
    local r0_542 = _G.AutoBlazeEmberFarm
    if r0_542 then
      pcall(function()
        -- line: [0, 0] id: 543
        local r0_543 = game:GetService("Workspace").Enemies
        if r0_543:FindFirstChild("Hydra Enforcer") or r0_543:FindFirstChild("Venomous Assailant") then
          for r4_543, r5_543 in pairs(r0_543:GetChildren()) do
            if (r5_543.Name == "Hydra Enforcer" or r5_543.Name == "Venomous Assailant") and r5_543:FindFirstChild("Humanoid") and r5_543:FindFirstChild("HumanoidRootPart") and 0 < r5_543.Humanoid.Health then
              while true do
                wait(_G.Fast_Delay)
                AttackNoCoolDown()
                AutoHaki()
                bringmob = true
                EquipTool(SelectWeapon)
                Tween2(r5_543.HumanoidRootPart.CFrame * Pos)
                r5_543.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r5_543.HumanoidRootPart.Transparency = 1
                r5_543.Humanoid.JumpPower = 0
                r5_543.Humanoid.WalkSpeed = 0
                r5_543.HumanoidRootPart.CanCollide = false
                FarmPos = r5_543.HumanoidRootPart.CFrame
                MonFarm = r5_543.Name
                if _G.AutoBlazeEmberFarm then
                  local r6_543 = r5_543.Humanoid.Health
                  if r6_543 <= 0 then
                    break
                  end
                else
                  break
                end
              end
            end
          end
        else
          Tween2(CFrame.new(4612.078125, 1002.283447265625, 498.2188720703125))
        end
      end)
    end
  end
end)
r154_0 = "AddToggle"
r154_0 = "ToggleReceiveQuest"
r152_0 = r2_0.Sea:[r154_0](r154_0, {
  Title = "Nhận Nhiệm Vụ Lửa Đỏ",
  Description = "Bật Lên 1 Lần Là Nhận 1 Nhận Nữa Thì Tắt Bật Lại",
  Default = false,
})
local r155_0 = "OnChanged"
(function(r0_174)
  -- line: [0, 0] id: 174
  _G.AutoReceiveQuest = r0_174
  if _G.AutoReceiveQuest then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906))
    Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    spawn(function()
      -- line: [0, 0] id: 175
      pcall(function()
        -- line: [0, 0] id: 176
        while wait() do
          local r0_176 = {
            [1] = {
              Context = "RequestQuest",
            },
          }
          game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(r0_176))
          local r2_176 = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack({
            [1] = {
              Context = "Check",
            },
          }))
        end
      end)
    end)
  end
end):[r155_0](r155_0)
r155_0 = "AddParagraph"
r155_0 = {
  Title = "Trạng Thái Nhiệm Vụ Lửa Đỏ",
  Content = "",
}
r153_0 = r2_0.Sea:[r155_0](r155_0)
spawn(function()
  -- line: [0, 0] id: 254
  pcall(function()
    -- line: [0, 0] id: 255
    while wait() do
      local r0_255 = {
        [1] = {
          Context = "Check",
        },
      }
      local r1_255 = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(r0_255))
      if typeof(r1_255) == "table" then
        for r5_255, r6_255 in pairs(r1_255) do
          if r6_255 == "Defeat 3 Venomous Assailants on Hydra Island." then
            r153_0:SetDesc("Defeat 3 Venomous Assailants on Hydra Island.")
          elseif r6_255 == "Defeat 3 Hydra Enforcers on Hydra Island." then
            r153_0:SetDesc("Defeat 3 Hydra Enforcers on Hydra Island.")
          elseif r6_255 == "Destroy 10 trees on Hydra Island." then
            r153_0:SetDesc("Destroy 10 trees on Hydra Island.")
          end
        end
      end
    end
  end)
end)
local r156_0 = "AddToggle"
r156_0 = "ToggleHydraTree"
r154_0 = r2_0.Sea:[r156_0](r156_0, {
  Title = "Phá Cây Ở Đảo Hydra",
  Description = "",
  Default = false,
})
local r157_0 = "OnChanged"
(function(r0_26)
  -- line: [0, 0] id: 26
  _G.AutoHydraTree = r0_26
end):[r157_0](r157_0)
function r155_0(r0_28)
  -- line: [0, 0] id: 28
  local r1_28 = game:GetService("VirtualInputManager")
  r1_28:SendKeyEvent(true, r0_28, false, game)
  r1_28:SendKeyEvent(false, r0_28, false, game)
end
function r156_0(r0_23)
  -- line: [0, 0] id: 23
  local r1_23 = game.Players.LocalPlayer
  local r2_23 = r1_23.Backpack
  for r6_23, r7_23 in pairs(r2_23:GetChildren()) do
    if r7_23:IsA("Tool") and r7_23.ToolTip == r0_23 then
      r7_23.Parent = r1_23.Character
      for r11_23, r12_23 in ipairs({
        "Z",
        "X",
        "C",
        "V",
        "F"
      }) do
        wait()
        pcall(function()
          -- line: [0, 0] id: 24
          r155_0(r12_23)
        end)
        -- close: r11_23
      end
      r7_23.Parent = r2_23
      break
    end
  end
end
r157_0 = {
  CFrame.new(5288.61962890625, 1005.4000244140625, 392.43011474609375),
  CFrame.new(5343.39453125, 1004.1998901367188, 361.0687561035156),
  CFrame.new(5235.78564453125, 1004.1998901367188, 431.4530944824219),
  CFrame.new(5321.30615234375, 1004.1998901367188, 440.8951416015625),
  CFrame.new(5258.96484375, 1004.1998901367188, 345.5052490234375)
}
spawn(function()
  -- line: [0, 0] id: 419
  while wait() do
    local r0_419 = _G.AutoHydraTree
    if r0_419 then
      AutoHaki()
      r0_419 = ipairs
      for r3_419, r4_419 in r0_419(r157_0) do
        if _G.AutoHydraTree then
          Tween2(r4_419)
          wait()
          local r5_419 = game.Players.LocalPlayer.Character
          if r5_419 and r5_419:FindFirstChild("HumanoidRootPart") and (r5_419.HumanoidRootPart.Position - r4_419.Position).Magnitude <= 1 then
            r156_0("Melee")
            r156_0("Sword")
            r156_0("Gun")
          end
        end
      end
    end
  end
end)
local r160_0 = "AddButton"
r160_0 = {
  Title = "Bay Đến Khu Vực Dragon Dojo",
  Description = "",
  Callback = function()
    -- line: [0, 0] id: 431
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906))
    Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
  end,
}
r2_0.Sea:[r160_0](r160_0)
r160_0 = "AddButton"
r160_0 = {
  Title = "Chế Tạo Volcanic Magnet",
  Description = "Cần 15 Lửa Đỏ+10 Sắt",
  Callback = function()
    -- line: [0, 0] id: 336
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
      [1] = "CraftItem",
      [2] = "Craft",
      [3] = "Volcanic Magnet",
    }))
  end,
}
r2_0.Sea:[r160_0](r160_0)
r160_0 = "AddButton"
r160_0 = {
  Title = "Chế Tạo Dino Hood",
  Description = "Cần 25 Xương Khủng Long + 10 Sừng Tê Giác",
  Callback = function()
    -- line: [0, 0] id: 409
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
      [1] = "CraftItem",
      [2] = "Craft",
      [3] = "DinoHood",
    }))
  end,
}
r2_0.Sea:[r160_0](r160_0)
r160_0 = "AddButton"
r160_0 = {
  Title = "Chế Tạo T-Rex Skull",
  Description = "Cần 8 Xương Khủng Long + 5 Vảy Rồng",
  Callback = function()
    -- line: [0, 0] id: 502
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
      [1] = "CraftItem",
      [2] = "Craft",
      [3] = "TRexSkull",
    }))
  end,
}
r2_0.Sea:[r160_0](r160_0)
r160_0 = "AddToggle"
r160_0 = "ToggleCollectFireFlowers"
local r158_0 = r2_0.Sea:[r160_0](r160_0, {
  Title = "Lụm Hoa Đỏ",
  Description = "",
  Default = false,
})
local r161_0 = "OnChanged"
(function(r0_133)
  -- line: [0, 0] id: 133
  _G.AutoCollectFireFlowers = r0_133
end):[r161_0](r161_0)
spawn(function()
  -- line: [0, 0] id: 292
  while wait() do
    local r0_292 = _G.AutoCollectFireFlowers
    if r0_292 then
      r0_292 = workspace:FindFirstChild("FireFlowers")
      if r0_292 then
        for r4_292, r5_292 in pairs(r0_292:GetChildren()) do
          if r5_292:IsA("Model") and r5_292.PrimaryPart then
            local r6_292 = r5_292.PrimaryPart.Position
            if (r6_292 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1 then
              game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
              wait(1.5)
              game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
            else
              Tween2(CFrame.new(r6_292))
            end
          end
        end
      end
    end
  end
end)
r161_0 = "AddToggle"
r161_0 = "ToggleWhiteBelt"
local r159_0 = r2_0.Sea:[r161_0](r161_0, {
  Title = "Cày Đai Trắng",
  Description = "",
  Default = false,
})
local r162_0 = "OnChanged"
(function(r0_223)
  -- line: [0, 0] id: 223
  _G.AutoLevel = r0_223
  if r0_223 then
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({
      [1] = {
        NPC = "Dojo Trainer",
        Command = "RequestQuest",
      },
    }))
    spawn(function()
      -- line: [0, 0] id: 224
      while _G.AutoLevel do
        local r0_224 = {
          [1] = {
            NPC = "Dojo Trainer",
            Command = "ClaimQuest",
          },
        }
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(r0_224))
        wait()
      end
    end)
  end
end):[r162_0](r162_0)
r162_0 = "AddParagraph"
r162_0 = {
  Title = "Hoàn Thành Ải Draco V4 (Sớm Ra)",
  Content = "",
}
r160_0 = r2_0.Sea:[r162_0](r162_0)
local r163_0 = "AddToggle"
r163_0 = "ToggleTrialTeleport"
r161_0 = r2_0.Sea:[r163_0](r163_0, {
  Title = "Bay Đến Cửa Trial Tộc Draco",
  Description = "",
  Default = false,
})
local r164_0 = "OnChanged"
(function(r0_407)
  -- line: [0, 0] id: 407
  _G.AutoTrialTeleport = r0_407
end):[r164_0](r164_0)
spawn(function()
  -- line: [0, 0] id: 442
  while wait() do
    local r0_442 = _G.AutoTrialTeleport
    if r0_442 then
      r0_442 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
      if r0_442 and r0_442:IsA("Part") then
        Tween2(CFrame.new(r0_442.Position))
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r0_442.Position).Magnitude <= 1 then
          _G.AutoTrialTeleport = false
        end
      end
    end
  end
end)
r164_0 = "AddSection"
r164_0 = " ảo Dung Nham"
r162_0 = r2_0.Sea:[r164_0](r164_0)
local r165_0 = "AddParagraph"
r165_0 = {
  Title = "Trạng Thái Đảo Dung Nham",
  Content = "",
}
r163_0 = r2_0.Sea:[r165_0](r165_0)
spawn(function()
  -- line: [0, 0] id: 160
  pcall(function()
    -- line: [0, 0] id: 161
    while wait() do
      local r0_161 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
      if r0_161 then
        r163_0:SetDesc(" ảo Dung Nham: ✅️")
      else
        r163_0:SetDesc(" ảo Dung Nham: ❌️")
      end
    end
  end)
end)
local r166_0 = "AddToggle"
r166_0 = "ToggleTPVolcano"
r164_0 = r2_0.Sea:[r166_0](r166_0, {
  Title = "Bay Đến Đảo Dung Nham",
  Description = "",
  Default = false,
})
local r167_0 = "OnChanged"
(function(r0_29)
  -- line: [0, 0] id: 29
  _G.TweenToPrehistoric = r0_29
end):[r167_0](r167_0)
r167_0 = "SetValue"
r167_0 = false
r3_0.ToggleTPVolcano:[r167_0](r167_0)
spawn(function()
  -- line: [0, 0] id: 168
  while true do
    local r0_168 = nil	-- notice: implicit variable refs by block#[0]
    if not r0_168 then
      r0_168 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
      wait()
    else
      break
    end
  end
  while wait() do
    local r1_168 = _G.TweenToPrehistoric
    if r1_168 then
      r1_168 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
      if r1_168 then
        local r2_168 = r1_168:FindFirstChild("Core") and r1_168.Core:FindFirstChild("PrehistoricRelic")
        local r3_168 = r2_168 and r2_168:FindFirstChild("Skull")
        if r3_168 then
          Tween2(CFrame.new(r3_168.Position))
          _G.TweenToPrehistoric = false
        end
      end
    end
  end
end)
r167_0 = "AddToggle"
r167_0 = "ToggleDefendVolcano"
r165_0 = r2_0.Sea:[r167_0](r167_0, {
  Title = "Tự Động Phòng Thủ",
  Description = "",
  Default = false,
})
local r168_0 = "OnChanged"
(function(r0_105)
  -- line: [0, 0] id: 105
  _G.AutoDefendVolcano = r0_105
end):[r168_0](r168_0)
r168_0 = "AddToggle"
r168_0 = "ToggleMelee"
r166_0 = r2_0.Sea:[r168_0](r168_0, {
  Title = "Dùng Melee",
  Description = "",
  Default = false,
})
local r169_0 = "OnChanged"
(function(r0_318)
  -- line: [0, 0] id: 318
  _G.UseMelee = r0_318
end):[r169_0](r169_0)
r169_0 = "AddToggle"
r169_0 = "ToggleSword"
r167_0 = r2_0.Sea:[r169_0](r169_0, {
  Title = "Dùng Sword",
  Description = "",
  Default = false,
})
local r170_0 = "OnChanged"
(function(r0_121)
  -- line: [0, 0] id: 121
  _G.UseSword = r0_121
end):[r170_0](r170_0)
r170_0 = "AddToggle"
r170_0 = "ToggleGun"
r168_0 = r2_0.Sea:[r170_0](r170_0, {
  Title = "Dùng Gun",
  Description = "",
  Default = false,
})
local r171_0 = "OnChanged"
(function(r0_268)
  -- line: [0, 0] id: 268
  _G.UseGun = r0_268
end):[r171_0](r171_0)
function r169_0(r0_173)
  -- line: [0, 0] id: 173
  game:GetService("VirtualInputManager"):SendKeyEvent(true, r0_173, false, game)
  game:GetService("VirtualInputManager"):SendKeyEvent(false, r0_173, false, game)
end
function r170_0()
  -- line: [0, 0] id: 107
  local r0_107 = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
  if r0_107 and r0_107:IsA("Model") then
    r0_107:Destroy()
  end
  local r1_107 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
  if r1_107 then
    for r5_107, r6_107 in pairs(r1_107:GetDescendants()) do
      if r6_107:IsA("Part") and r6_107.Name:lower():find("lava") then
        r6_107:Destroy()
      end
    end
  end
  local r2_107 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
  if r2_107 then
    for r6_107, r7_107 in pairs(r2_107:GetDescendants()) do
      if r7_107:IsA("Model") then
        for r11_107, r12_107 in pairs(r7_107:GetDescendants()) do
          if r12_107:IsA("MeshPart") and r12_107.Name:lower():find("lava") then
            r12_107:Destroy()
          end
        end
      end
    end
  end
end
function r171_0()
  -- line: [0, 0] id: 243
  for r4_243, r5_243 in pairs(game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks:GetChildren()) do
    if r5_243:IsA("Model") then
      local r6_243 = r5_243:FindFirstChild("volcanorock")
      if r6_243 and r6_243:IsA("MeshPart") then
        local r7_243 = r6_243.Color
        if r7_243 == Color3.fromRGB(185, 53, 56) or r7_243 == Color3.fromRGB(185, 53, 57) then
          return r6_243
        end
      end
    end
  end
  return nil
end
local function r172_0(r0_521)
  -- line: [0, 0] id: 521
  local r1_521 = game.Players.LocalPlayer
  local r2_521 = r1_521.Backpack
  for r6_521, r7_521 in pairs(r2_521:GetChildren()) do
    if r7_521:IsA("Tool") and r7_521.ToolTip == r0_521 then
      r7_521.Parent = r1_521.Character
      for r11_521, r12_521 in ipairs({
        "Z",
        "X",
        "C",
        "V",
        "F"
      }) do
        wait()
        pcall(function()
          -- line: [0, 0] id: 522
          r169_0(r12_521)
        end)
        -- close: r11_521
      end
      r7_521.Parent = r2_521
      break
    end
  end
end
spawn(function()
  -- line: [0, 0] id: 156
  while wait() do
    local r0_156 = _G.AutoDefendVolcano
    if r0_156 then
      AutoHaki()
      pcall(r170_0)
      r0_156 = r171_0()
      if r0_156 then
        Tween2(CFrame.new(r0_156.Position + Vector3.new(0, 0, 0)))
        local r2_156 = r0_156.Color
        if r2_156 ~= Color3.fromRGB(185, 53, 56) and r2_156 ~= Color3.fromRGB(185, 53, 57) then
          r0_156 = r171_0()
        end
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r0_156.Position - Vector3.new(0, 0, 0)).Magnitude <= 1 then
          if _G.UseMelee then
            r172_0("Melee")
          end
          if _G.UseSword then
            r172_0("Sword")
          end
          if _G.UseGun then
            r172_0("Gun")
          end
        end
        _G.TweenToPrehistoric = false
      else
        _G.TweenToPrehistoric = true
      end
    end
  end
end)
local r175_0 = "AddToggle"
r175_0 = "ToggleKillAura"
local r173_0 = r2_0.Sea:[r175_0](r175_0, {
  Title = " ánh Golems Aura",
  Description = "",
  Default = false,
})
local r176_0 = "OnChanged"
(function(r0_481)
  -- line: [0, 0] id: 481
  KillAura = r0_481
end):[r176_0](r176_0)
r176_0 = "SetValue"
r176_0 = false
r3_0.ToggleKillAura:[r176_0](r176_0)
spawn(function()
  -- line: [0, 0] id: 445
  while wait() do
    local r0_445 = KillAura
    if r0_445 then
      pcall(function()
        -- line: [0, 0] id: 446
        for r3_446, r4_446 in pairs(game.Workspace.Enemies:GetDescendants()) do
          if r4_446:FindFirstChild("Humanoid") and r4_446:FindFirstChild("HumanoidRootPart") and 0 < r4_446.Humanoid.Health then
            while true do
              task.wait()
              sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
              r4_446.Humanoid.Health = 0
              r4_446.HumanoidRootPart.CanCollide = false
              if KillAura then
                local r5_446 = r4_446.Parent
                if r5_446 then
                  r5_446 = r4_446.Humanoid.Health
                  if r5_446 <= 0 then
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
          end
        end
      end)
    end
  end
end)
r176_0 = "AddToggle"
r176_0 = "ToggleCollectBone"
local r174_0 = r2_0.Sea:[r176_0](r176_0, {
  Title = "Lụm Xương",
  Description = "",
  Default = false,
})
local r177_0 = "OnChanged"
(function(r0_98)
  -- line: [0, 0] id: 98
  _G.AutoCollectBone = r0_98
end):[r177_0](r177_0)
spawn(function()
  -- line: [0, 0] id: 85
  while wait() do
    local r0_85 = _G.AutoCollectBone
    if r0_85 then
      r0_85 = pairs
      for r3_85, r4_85 in r0_85(workspace:GetDescendants()) do
        if r4_85:IsA("BasePart") and r4_85.Name == "DinoBone" then
          Tween2(CFrame.new(r4_85.Position))
        end
      end
    end
  end
end)
r177_0 = "AddToggle"
r177_0 = "ToggleCollectEgg"
r175_0 = r2_0.Sea:[r177_0](r177_0, {
  Title = "Lụm Trứng",
  Description = "",
  Default = false,
})
local r178_0 = "OnChanged"
(function(r0_179)
  -- line: [0, 0] id: 179
  _G.AutoCollectEgg = r0_179
end):[r178_0](r178_0)
spawn(function()
  -- line: [0, 0] id: 244
  while wait() do
    local r0_244 = _G.AutoCollectEgg
    if r0_244 then
      r0_244 = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()
      if #r0_244 > 0 then
        local r1_244 = r0_244[math.random(1, #r0_244)]
        if r1_244:IsA("Model") and r1_244.PrimaryPart then
          Tween2(r1_244.PrimaryPart.CFrame)
          if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r1_244.PrimaryPart.Position).Magnitude <= 1 then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            wait(1.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
          end
        end
      end
    end
  end
end)
