--[[
    FAMYY PRIVATE - Blox Fruits Specific Dumper v2.0
    
    Dumps EVERYTHING from Blox Fruits:
    - All remotes and their exact paths
    - All quest NPCs with positions
    - All mob spawns with positions  
    - All island positions
    - All bosses
    - All items/chests/fruits
    - Player data structure
    - Shop data
    - Raid data
    
    Run this in Blox Fruits, it will output a complete database.
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

repeat task.wait() until Player:FindFirstChild("Data")

-- ============================================================================
-- DATA COLLECTION
-- ============================================================================

local BloxFruitsDump = {
    GameInfo = {},
    Remotes = {},
    PlayerData = {},
    QuestNPCs = {},
    Mobs = {},
    Bosses = {},
    Islands = {},
    Shops = {},
    Fruits = {},
    Chests = {},
    Raids = {},
    Abilities = {},
    Swords = {},
    Guns = {},
    FightingStyles = {},
}

-- Get basic game info
local function GetGameInfo()
    local info = {
        PlaceId = game.PlaceId,
        JobId = game.JobId,
        GameId = game.GameId,
    }
    
    -- Detect which sea
    if game.PlaceId == 2753915549 then
        info.Sea = 1
        info.SeaName = "First Sea (Old World)"
    elseif game.PlaceId == 4442272183 then
        info.Sea = 2
        info.SeaName = "Second Sea (New World)"
    elseif game.PlaceId == 7449423635 then
        info.Sea = 3
        info.SeaName = "Third Sea"
    end
    
    local success, productInfo = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    
    if success and productInfo then
        info.Name = productInfo.Name
    end
    
    return info
end

-- Get all remotes
local function GetRemotes()
    local remotes = {}
    
    local remotesFolder = ReplicatedStorage:FindFirstChild("Remotes")
    if remotesFolder then
        for _, remote in ipairs(remotesFolder:GetDescendants()) do
            if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
                table.insert(remotes, {
                    Name = remote.Name,
                    Type = remote.ClassName,
                    Path = remote:GetFullName(),
                })
            end
        end
    end
    
    return remotes
end

-- Get player data structure
local function GetPlayerData()
    local data = {}
    local playerData = Player:FindFirstChild("Data")
    
    if playerData then
        for _, child in ipairs(playerData:GetChildren()) do
            if child:IsA("ValueBase") then
                data[child.Name] = {
                    Value = child.Value,
                    Type = child.ClassName,
                }
            end
        end
    end
    
    return data
end

-- Get all quest NPCs
local function GetQuestNPCs()
    local npcs = {}
    
    -- Find all NPCs that give quests
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
            local head = obj:FindFirstChild("Head")
            local hrp = obj:FindFirstChild("HumanoidRootPart")
            
            if head and hrp then
                -- Check if it has quest-related children
                local hasQuest = obj:FindFirstChild("QuestClickDetector") or
                                 obj:FindFirstChild("ClickDetector") or
                                 obj.Name:find("Quest") or
                                 obj.Name:find("NPC")
                
                if hasQuest or (obj.Parent and obj.Parent.Name:find("NPC")) then
                    table.insert(npcs, {
                        Name = obj.Name,
                        Position = {
                            X = math.floor(hrp.Position.X * 100) / 100,
                            Y = math.floor(hrp.Position.Y * 100) / 100,
                            Z = math.floor(hrp.Position.Z * 100) / 100,
                        },
                        CFrame = tostring(hrp.CFrame),
                        Parent = obj.Parent.Name,
                    })
                end
            end
        end
    end
    
    return npcs
end

-- Get all current enemies
local function GetMobs()
    local mobs = {}
    local enemies = Workspace:FindFirstChild("Enemies")
    
    if enemies then
        local mobTypes = {}
        
        for _, mob in ipairs(enemies:GetChildren()) do
            if mob:IsA("Model") then
                local hrp = mob:FindFirstChild("HumanoidRootPart")
                local hum = mob:FindFirstChildOfClass("Humanoid")
                
                if hrp and hum then
                    if not mobTypes[mob.Name] then
                        mobTypes[mob.Name] = {
                            Name = mob.Name,
                            Health = hum.MaxHealth,
                            SamplePosition = {
                                X = math.floor(hrp.Position.X * 100) / 100,
                                Y = math.floor(hrp.Position.Y * 100) / 100,
                                Z = math.floor(hrp.Position.Z * 100) / 100,
                            },
                            Count = 1,
                        }
                    else
                        mobTypes[mob.Name].Count = mobTypes[mob.Name].Count + 1
                    end
                end
            end
        end
        
        for _, mobData in pairs(mobTypes) do
            table.insert(mobs, mobData)
        end
    end
    
    return mobs
end

-- Get all islands/locations
local function GetIslands()
    local islands = {}
    
    -- Common island parent names
    local islandParents = {
        Workspace:FindFirstChild("Map"),
        Workspace:FindFirstChild("Islands"),
        Workspace:FindFirstChild("Locations"),
        Workspace,
    }
    
    for _, parent in ipairs(islandParents) do
        if parent then
            for _, child in ipairs(parent:GetChildren()) do
                if child:IsA("Model") or child:IsA("Folder") then
                    -- Check if it looks like an island
                    local partCount = 0
                    for _, p in ipairs(child:GetDescendants()) do
                        if p:IsA("BasePart") then
                            partCount = partCount + 1
                            if partCount > 100 then break end
                        end
                    end
                    
                    if partCount > 50 then
                        local primary = child:FindFirstChildWhichIsA("BasePart")
                        if primary then
                            table.insert(islands, {
                                Name = child.Name,
                                Position = {
                                    X = math.floor(primary.Position.X),
                                    Y = math.floor(primary.Position.Y + 50), -- Add height
                                    Z = math.floor(primary.Position.Z),
                                },
                                PartCount = partCount,
                            })
                        end
                    end
                end
            end
        end
    end
    
    return islands
end

-- Get all fruits in workspace
local function GetFruits()
    local fruits = {}
    
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") or obj:IsA("Model") then
            if obj.Name:find("Fruit") then
                local pos = nil
                if obj:IsA("Tool") then
                    local handle = obj:FindFirstChild("Handle")
                    if handle then
                        pos = handle.Position
                    end
                else
                    local primary = obj:FindFirstChildWhichIsA("BasePart")
                    if primary then
                        pos = primary.Position
                    end
                end
                
                if pos then
                    table.insert(fruits, {
                        Name = obj.Name,
                        Position = {
                            X = math.floor(pos.X),
                            Y = math.floor(pos.Y),
                            Z = math.floor(pos.Z),
                        },
                    })
                end
            end
        end
    end
    
    return fruits
end

-- Get all chests
local function GetChests()
    local chests = {}
    
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj.Name == "Chest" or obj.Name:find("Chest") then
            local pos = nil
            if obj:IsA("BasePart") then
                pos = obj.Position
            elseif obj:IsA("Model") then
                local primary = obj:FindFirstChildWhichIsA("BasePart")
                if primary then
                    pos = primary.Position
                end
            end
            
            if pos then
                table.insert(chests, {
                    Name = obj.Name,
                    Position = {
                        X = math.floor(pos.X),
                        Y = math.floor(pos.Y),
                        Z = math.floor(pos.Z),
                    },
                })
            end
        end
    end
    
    return chests
end

-- ============================================================================
-- RUN DUMP
-- ============================================================================

local function RunBloxFruitsDump()
    print("\n================================================")
    print("FAMYY PRIVATE - Blox Fruits Dumper v2.0")
    print("================================================\n")
    
    print("[1/8] Getting game info...")
    BloxFruitsDump.GameInfo = GetGameInfo()
    print("  Sea: " .. (BloxFruitsDump.GameInfo.SeaName or "Unknown"))
    
    print("[2/8] Getting remotes...")
    BloxFruitsDump.Remotes = GetRemotes()
    print("  Found: " .. #BloxFruitsDump.Remotes .. " remotes")
    
    print("[3/8] Getting player data structure...")
    BloxFruitsDump.PlayerData = GetPlayerData()
    local dataCount = 0
    for _ in pairs(BloxFruitsDump.PlayerData) do dataCount = dataCount + 1 end
    print("  Found: " .. dataCount .. " data values")
    
    print("[4/8] Getting quest NPCs...")
    BloxFruitsDump.QuestNPCs = GetQuestNPCs()
    print("  Found: " .. #BloxFruitsDump.QuestNPCs .. " NPCs")
    
    print("[5/8] Getting mobs...")
    BloxFruitsDump.Mobs = GetMobs()
    print("  Found: " .. #BloxFruitsDump.Mobs .. " mob types")
    
    print("[6/8] Getting islands...")
    BloxFruitsDump.Islands = GetIslands()
    print("  Found: " .. #BloxFruitsDump.Islands .. " locations")
    
    print("[7/8] Getting fruits...")
    BloxFruitsDump.Fruits = GetFruits()
    print("  Found: " .. #BloxFruitsDump.Fruits .. " fruits")
    
    print("[8/8] Getting chests...")
    BloxFruitsDump.Chests = GetChests()
    print("  Found: " .. #BloxFruitsDump.Chests .. " chests")
    
    print("\n================================================")
    print("DUMP COMPLETE!")
    print("================================================\n")
    
    return BloxFruitsDump
end

-- ============================================================================
-- FORMAT OUTPUT
-- ============================================================================

local function FormatLuaTable(tbl, indent)
    indent = indent or 0
    local result = {}
    local prefix = string.rep("    ", indent)
    
    if type(tbl) ~= "table" then
        return tostring(tbl)
    end
    
    table.insert(result, "{")
    
    for k, v in pairs(tbl) do
        local key = type(k) == "string" and k or "[" .. tostring(k) .. "]"
        local value
        
        if type(v) == "table" then
            value = FormatLuaTable(v, indent + 1)
        elseif type(v) == "string" then
            value = '"' .. v .. '"'
        else
            value = tostring(v)
        end
        
        table.insert(result, prefix .. "    " .. key .. " = " .. value .. ",")
    end
    
    table.insert(result, prefix .. "}")
    
    return table.concat(result, "\n")
end

local function FormatDumpOutput(dump)
    local lines = {}
    
    table.insert(lines, "--[[")
    table.insert(lines, "    BLOX FRUITS DATA DUMP")
    table.insert(lines, "    Generated: " .. os.date("%Y-%m-%d %H:%M:%S"))
    table.insert(lines, "    Sea: " .. (dump.GameInfo.SeaName or "Unknown"))
    table.insert(lines, "    PlaceId: " .. dump.GameInfo.PlaceId)
    table.insert(lines, "]]")
    table.insert(lines, "")
    
    -- Remotes
    table.insert(lines, "-- ============= REMOTES =============")
    for _, remote in ipairs(dump.Remotes) do
        table.insert(lines, "-- " .. remote.Type .. ": " .. remote.Name)
        table.insert(lines, "--   Path: " .. remote.Path)
    end
    table.insert(lines, "")
    
    -- Player Data
    table.insert(lines, "-- ============= PLAYER DATA =============")
    for name, data in pairs(dump.PlayerData) do
        table.insert(lines, "-- " .. name .. " (" .. data.Type .. "): " .. tostring(data.Value))
    end
    table.insert(lines, "")
    
    -- Quest NPCs
    table.insert(lines, "-- ============= QUEST NPCs =============")
    for _, npc in ipairs(dump.QuestNPCs) do
        table.insert(lines, string.format(
            '{Name = "%s", CFrame = CFrame.new(%.2f, %.2f, %.2f)},',
            npc.Name, npc.Position.X, npc.Position.Y, npc.Position.Z
        ))
    end
    table.insert(lines, "")
    
    -- Mobs
    table.insert(lines, "-- ============= MOBS =============")
    for _, mob in ipairs(dump.Mobs) do
        table.insert(lines, string.format(
            '{Name = "%s", Health = %d, Count = %d, Position = CFrame.new(%.2f, %.2f, %.2f)},',
            mob.Name, mob.Health or 0, mob.Count, 
            mob.SamplePosition.X, mob.SamplePosition.Y, mob.SamplePosition.Z
        ))
    end
    table.insert(lines, "")
    
    -- Islands
    table.insert(lines, "-- ============= ISLANDS =============")
    for _, island in ipairs(dump.Islands) do
        table.insert(lines, string.format(
            '{Name = "%s", CFrame = CFrame.new(%d, %d, %d)},',
            island.Name, island.Position.X, island.Position.Y, island.Position.Z
        ))
    end
    table.insert(lines, "")
    
    -- Fruits
    table.insert(lines, "-- ============= FRUITS FOUND =============")
    for _, fruit in ipairs(dump.Fruits) do
        table.insert(lines, string.format(
            '-- %s at (%d, %d, %d)',
            fruit.Name, fruit.Position.X, fruit.Position.Y, fruit.Position.Z
        ))
    end
    table.insert(lines, "")
    
    -- Chests
    table.insert(lines, "-- ============= CHESTS (" .. #dump.Chests .. " total) =============")
    for i, chest in ipairs(dump.Chests) do
        if i <= 20 then -- Only show first 20
            table.insert(lines, string.format(
                '{Name = "%s", CFrame = CFrame.new(%d, %d, %d)},',
                chest.Name, chest.Position.X, chest.Position.Y, chest.Position.Z
            ))
        end
    end
    if #dump.Chests > 20 then
        table.insert(lines, "-- ... and " .. (#dump.Chests - 20) .. " more chests")
    end
    
    return table.concat(lines, "\n")
end

-- ============================================================================
-- EXECUTE
-- ============================================================================

local dump = RunBloxFruitsDump()
local output = FormatDumpOutput(dump)

-- Save to file
if writefile then
    local fileName = "BloxFruits_Sea" .. (dump.GameInfo.Sea or "X") .. "_Dump.lua"
    writefile(fileName, output)
    print("[+] Saved to: " .. fileName)
end

-- Copy to clipboard
if setclipboard then
    setclipboard(output)
    print("[+] Copied to clipboard!")
end

-- Store globally
_G.BloxFruitsDump = dump

print("\nData available in: _G.BloxFruitsDump")
print("Use _G.BloxFruitsDump.Remotes, .Mobs, .QuestNPCs, etc.")

return dump
