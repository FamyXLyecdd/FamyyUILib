--[[
    ██████╗ ███████╗██╗   ██╗██╗   ██╗██╗   ██╗    ██████╗ ██████╗ ██╗██╗   ██╗ █████╗ ████████╗███████╗
    ██╔══██╗██╔════╝██║   ██║██║   ██║╚██╗ ██╔╝    ██╔══██╗██╔══██╗██║██║   ██║██╔══██╗╚══██╔══╝██╔════╝
    ██████╔╝█████╗  ██║   ██║██║   ██║ ╚████╔╝     ██████╔╝██████╔╝██║██║   ██║███████║   ██║   █████╗  
    ██╔═══╝ ██╔══╝  ██║   ██║██║   ██║  ╚██╔╝      ██╔═══╝ ██╔══██╗██║╚██╗ ██╔╝██╔══██║   ██║   ██╔══╝  
    ██║     ███████╗╚██████╔╝╚██████╔╝   ██║       ██║     ██║  ██║██║ ╚████╔╝ ██║  ██║   ██║   ███████╗
    ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝    ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═╝   ╚═╝   ╚══════╝
    
    FAMYY PRIVATE v9.1 - Game Dumper Tool
    
    This tool analyzes Roblox games and dumps:
    - Game ID, Place ID, Job ID
    - All RemoteEvents/RemoteFunctions
    - All services and their children
    - Anti-cheat detection
    - Character/Player data structure
    - Workspace hierarchy
    - Useful paths for scripting
    
    Output is saved to file for script development.
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local StarterPlayer = game:GetService("StarterPlayer")
local Teams = game:GetService("Teams")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

-- ============================================================================
-- DUMPER CONFIG
-- ============================================================================

local DumperConfig = {
    MaxDepth = 5,                    -- How deep to scan hierarchies
    MaxChildren = 100,               -- Max children to list per object
    IncludeProperties = true,        -- Include object properties
    IncludeRemotes = true,           -- Scan for remotes
    IncludeAntiCheat = true,         -- Detect anti-cheat
    SaveToFile = true,               -- Save output to file
    FileName = "GameDump",           -- Base filename
}

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

local Dump = {
    GameInfo = {},
    Remotes = {Events = {}, Functions = {}},
    Services = {},
    AntiCheat = {},
    Paths = {},
    Warnings = {},
}

local function SafeCall(func, ...)
    local success, result = pcall(func, ...)
    return success and result or nil
end

local function GetGameInfo()
    local info = {}
    
    info.PlaceId = game.PlaceId
    info.JobId = game.JobId
    info.GameId = game.GameId
    
    local success, productInfo = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    
    if success and productInfo then
        info.Name = productInfo.Name
        info.Description = productInfo.Description
        info.Creator = productInfo.Creator and productInfo.Creator.Name or "Unknown"
        info.Created = productInfo.Created
        info.Updated = productInfo.Updated
    else
        info.Name = "Unknown"
        info.Creator = "Unknown"
    end
    
    info.PlayerCount = #Players:GetPlayers()
    info.MaxPlayers = Players.MaxPlayers
    
    return info
end

local function ScanForRemotes(parent, path, depth)
    if depth > DumperConfig.MaxDepth then return end
    
    local success, children = pcall(function()
        return parent:GetChildren()
    end)
    
    if not success then return end
    
    for i, child in ipairs(children) do
        if i > DumperConfig.MaxChildren then break end
        
        local childPath = path .. "." .. child.Name
        
        if child:IsA("RemoteEvent") then
            table.insert(Dump.Remotes.Events, {
                Name = child.Name,
                Path = childPath,
                Parent = parent.Name,
            })
        elseif child:IsA("RemoteFunction") then
            table.insert(Dump.Remotes.Functions, {
                Name = child.Name,
                Path = childPath,
                Parent = parent.Name,
            })
        elseif child:IsA("BindableEvent") or child:IsA("BindableFunction") then
            -- Also track bindables
            table.insert(Dump.Remotes.Events, {
                Name = child.Name,
                Path = childPath,
                Parent = parent.Name,
                Type = "Bindable"
            })
        end
        
        -- Recurse
        ScanForRemotes(child, childPath, depth + 1)
    end
end

local function ScanHierarchy(parent, depth, maxDepth)
    if depth > maxDepth then return "..." end
    
    local result = {}
    
    local success, children = pcall(function()
        return parent:GetChildren()
    end)
    
    if not success then return {} end
    
    for i, child in ipairs(children) do
        if i > 50 then 
            table.insert(result, "... and " .. (#children - 50) .. " more")
            break 
        end
        
        local info = {
            Name = child.Name,
            ClassName = child.ClassName,
        }
        
        -- Get important properties
        if child:IsA("BasePart") then
            info.Position = tostring(child.Position)
            info.Anchored = child.Anchored
        elseif child:IsA("Model") then
            local primary = child.PrimaryPart
            if primary then
                info.PrimaryPart = primary.Name
            end
        end
        
        -- Count children
        local childCount = #child:GetChildren()
        if childCount > 0 then
            info.ChildCount = childCount
            if depth < maxDepth then
                info.Children = ScanHierarchy(child, depth + 1, maxDepth)
            end
        end
        
        table.insert(result, info)
    end
    
    return result
end

local function DetectAntiCheat()
    local antiCheat = {
        Detected = {},
        Warnings = {},
        Recommendations = {},
    }
    
    -- Check for common anti-cheat patterns
    local patterns = {
        -- Script names that suggest anti-cheat
        {"Anti", "AntiCheat", "AntiExploit", "Anticheat"},
        {"Security", "Secure", "Protection"},
        {"Kick", "Ban", "Punish"},
        {"Detect", "Detection", "Monitor"},
        {"Validate", "Verification", "Check"},
    }
    
    -- Scan ReplicatedStorage
    for _, child in ipairs(ReplicatedStorage:GetDescendants()) do
        local name = child.Name:lower()
        for _, group in ipairs(patterns) do
            for _, pattern in ipairs(group) do
                if name:find(pattern:lower()) then
                    table.insert(antiCheat.Detected, {
                        Name = child.Name,
                        ClassName = child.ClassName,
                        Path = child:GetFullName(),
                        Pattern = pattern,
                    })
                    break
                end
            end
        end
    end
    
    -- Check for specific anti-cheat systems
    local knownAntiCheats = {
        {Name = "Adonis", Check = function() return ReplicatedStorage:FindFirstChild("Adonis_Proxy") end},
        {Name = "Hydrogen", Check = function() return ReplicatedStorage:FindFirstChild("HydrogenFolder") end},
        {Name = "ServerSecure", Check = function() 
            for _, v in ipairs(ReplicatedStorage:GetDescendants()) do
                if v.Name == "ServerSecure" then return true end
            end
            return false
        end},
    }
    
    for _, ac in ipairs(knownAntiCheats) do
        local detected = SafeCall(ac.Check)
        if detected then
            table.insert(antiCheat.Detected, {
                Name = ac.Name,
                Type = "Known Anti-Cheat",
            })
            table.insert(antiCheat.Warnings, "Known anti-cheat detected: " .. ac.Name)
        end
    end
    
    -- Check for remote validation
    local remoteCount = #Dump.Remotes.Events + #Dump.Remotes.Functions
    if remoteCount < 5 then
        table.insert(antiCheat.Warnings, "Very few remotes found - game may use custom networking")
    end
    
    -- Check for obfuscated names
    local obfuscatedCount = 0
    for _, remote in ipairs(Dump.Remotes.Events) do
        if #remote.Name > 20 or remote.Name:match("^[a-zA-Z0-9]+$") and #remote.Name > 15 then
            obfuscatedCount = obfuscatedCount + 1
        end
    end
    
    if obfuscatedCount > 5 then
        table.insert(antiCheat.Warnings, "Many obfuscated remote names detected - names may change")
        table.insert(antiCheat.Recommendations, "Use remote spy to find actual remote paths")
    end
    
    return antiCheat
end

local function FindUsefulPaths()
    local paths = {
        Remotes = {},
        Mobs = {},
        NPCs = {},
        Items = {},
        Currency = {},
        Player = {},
    }
    
    -- Find remote folders
    local remoteLocations = {
        ReplicatedStorage:FindFirstChild("Remotes"),
        ReplicatedStorage:FindFirstChild("Events"),
        ReplicatedStorage:FindFirstChild("RemoteEvents"),
        ReplicatedStorage:FindFirstChild("Packages"),
        ReplicatedStorage:FindFirstChild("Shared"),
        ReplicatedStorage:FindFirstChild("Network"),
    }
    
    for _, location in ipairs(remoteLocations) do
        if location then
            table.insert(paths.Remotes, location:GetFullName())
        end
    end
    
    -- Find mob/enemy folders
    local mobLocations = {
        Workspace:FindFirstChild("Enemies"),
        Workspace:FindFirstChild("Mobs"),
        Workspace:FindFirstChild("Monsters"),
        Workspace:FindFirstChild("NPCs"),
        Workspace:FindFirstChild("Zombies"),
        Workspace:FindFirstChild("Living"),
    }
    
    for _, location in ipairs(mobLocations) do
        if location then
            table.insert(paths.Mobs, location:GetFullName())
        end
    end
    
    -- Find item/drop folders
    local itemLocations = {
        Workspace:FindFirstChild("Items"),
        Workspace:FindFirstChild("Drops"),
        Workspace:FindFirstChild("Loot"),
        Workspace:FindFirstChild("Collectibles"),
        Workspace:FindFirstChild("Fruits"), -- Blox Fruits specific
    }
    
    for _, location in ipairs(itemLocations) do
        if location then
            table.insert(paths.Items, location:GetFullName())
        end
    end
    
    -- Find player data
    if Player:FindFirstChild("leaderstats") then
        paths.Currency = {}
        for _, stat in ipairs(Player.leaderstats:GetChildren()) do
            table.insert(paths.Currency, {
                Name = stat.Name,
                Value = stat.Value,
                Path = stat:GetFullName(),
            })
        end
    end
    
    -- Find player data folder
    local dataLocations = {
        Player:FindFirstChild("Data"),
        Player:FindFirstChild("PlayerData"),
        Player:FindFirstChild("Stats"),
        Player:FindFirstChild("PlayerStats"),
        Player:FindFirstChild("SaveData"),
    }
    
    for _, location in ipairs(dataLocations) do
        if location then
            paths.Player = {
                DataPath = location:GetFullName(),
                Children = {},
            }
            for _, child in ipairs(location:GetChildren()) do
                table.insert(paths.Player.Children, {
                    Name = child.Name,
                    ClassName = child.ClassName,
                    Value = child:IsA("ValueBase") and child.Value or "N/A",
                })
            end
            break
        end
    end
    
    return paths
end

local function TestRemotes()
    local results = {
        Working = {},
        Errors = {},
    }
    
    -- Only test remotes that look safe (don't contain ban/kick in name)
    for _, remote in ipairs(Dump.Remotes.Events) do
        local name = remote.Name:lower()
        if not name:find("ban") and not name:find("kick") and not name:find("report") then
            -- Just record, don't actually fire
            table.insert(results.Working, {
                Name = remote.Name,
                Path = remote.Path,
                Testable = true,
            })
        else
            table.insert(results.Errors, {
                Name = remote.Name,
                Reason = "Potentially dangerous remote (ban/kick)",
            })
        end
    end
    
    return results
end

-- ============================================================================
-- MAIN DUMP FUNCTION
-- ============================================================================

local function RunDump()
    print("\n========================================")
    print("FAMYY PRIVATE - Game Dumper v1.0")
    print("========================================\n")
    
    -- Get game info
    print("[1/6] Getting game info...")
    Dump.GameInfo = GetGameInfo()
    print("  Game: " .. Dump.GameInfo.Name)
    print("  PlaceId: " .. Dump.GameInfo.PlaceId)
    print("  GameId: " .. Dump.GameInfo.GameId)
    
    -- Scan for remotes
    print("\n[2/6] Scanning for remotes...")
    ScanForRemotes(ReplicatedStorage, "ReplicatedStorage", 0)
    ScanForRemotes(Workspace, "Workspace", 0)
    
    local commonRemotePaths = {
        game:GetService("ReplicatedFirst"),
        Player:FindFirstChild("PlayerGui"),
        Player:FindFirstChild("PlayerScripts"),
    }
    for _, path in ipairs(commonRemotePaths) do
        if path then
            ScanForRemotes(path, path.Name, 0)
        end
    end
    
    print("  Found " .. #Dump.Remotes.Events .. " RemoteEvents")
    print("  Found " .. #Dump.Remotes.Functions .. " RemoteFunctions")
    
    -- Scan services
    print("\n[3/6] Scanning services...")
    Dump.Services = {
        Workspace = {ChildCount = #Workspace:GetChildren()},
        ReplicatedStorage = {ChildCount = #ReplicatedStorage:GetChildren()},
        Lighting = {ChildCount = #Lighting:GetChildren()},
        Teams = {ChildCount = #Teams:GetChildren()},
    }
    
    -- Detect anti-cheat
    print("\n[4/6] Detecting anti-cheat...")
    if DumperConfig.IncludeAntiCheat then
        Dump.AntiCheat = DetectAntiCheat()
        print("  Detections: " .. #Dump.AntiCheat.Detected)
        print("  Warnings: " .. #Dump.AntiCheat.Warnings)
    end
    
    -- Find useful paths
    print("\n[5/6] Finding useful paths...")
    Dump.Paths = FindUsefulPaths()
    print("  Remote paths: " .. #Dump.Paths.Remotes)
    print("  Mob paths: " .. #Dump.Paths.Mobs)
    print("  Item paths: " .. #Dump.Paths.Items)
    
    -- Test remotes
    print("\n[6/6] Analyzing remotes...")
    Dump.RemoteTests = TestRemotes()
    print("  Testable: " .. #Dump.RemoteTests.Working)
    print("  Dangerous: " .. #Dump.RemoteTests.Errors)
    
    print("\n========================================")
    print("DUMP COMPLETE!")
    print("========================================\n")
    
    return Dump
end

-- ============================================================================
-- OUTPUT FUNCTIONS
-- ============================================================================

local function FormatDump(dump)
    local output = {}
    
    table.insert(output, "========================================")
    table.insert(output, "FAMYY PRIVATE - GAME DUMP")
    table.insert(output, "Generated: " .. os.date("%Y-%m-%d %H:%M:%S"))
    table.insert(output, "========================================\n")
    
    -- Game Info
    table.insert(output, "## GAME INFO ##")
    table.insert(output, "Name: " .. dump.GameInfo.Name)
    table.insert(output, "PlaceId: " .. dump.GameInfo.PlaceId)
    table.insert(output, "GameId: " .. dump.GameInfo.GameId)
    table.insert(output, "JobId: " .. dump.GameInfo.JobId)
    table.insert(output, "Creator: " .. (dump.GameInfo.Creator or "Unknown"))
    table.insert(output, "Players: " .. dump.GameInfo.PlayerCount .. "/" .. dump.GameInfo.MaxPlayers)
    table.insert(output, "")
    
    -- Remotes
    table.insert(output, "## REMOTE EVENTS (" .. #dump.Remotes.Events .. ") ##")
    for i, remote in ipairs(dump.Remotes.Events) do
        if i <= 50 then
            table.insert(output, "  " .. remote.Name .. " -> " .. remote.Path)
        end
    end
    if #dump.Remotes.Events > 50 then
        table.insert(output, "  ... and " .. (#dump.Remotes.Events - 50) .. " more")
    end
    table.insert(output, "")
    
    table.insert(output, "## REMOTE FUNCTIONS (" .. #dump.Remotes.Functions .. ") ##")
    for i, remote in ipairs(dump.Remotes.Functions) do
        if i <= 50 then
            table.insert(output, "  " .. remote.Name .. " -> " .. remote.Path)
        end
    end
    table.insert(output, "")
    
    -- Anti-Cheat
    table.insert(output, "## ANTI-CHEAT DETECTION ##")
    if #dump.AntiCheat.Detected > 0 then
        for _, ac in ipairs(dump.AntiCheat.Detected) do
            table.insert(output, "  [!] " .. ac.Name .. " (" .. (ac.Type or ac.Pattern or "Unknown") .. ")")
        end
    else
        table.insert(output, "  No known anti-cheat detected")
    end
    table.insert(output, "")
    
    if #dump.AntiCheat.Warnings > 0 then
        table.insert(output, "## WARNINGS ##")
        for _, warning in ipairs(dump.AntiCheat.Warnings) do
            table.insert(output, "  [!] " .. warning)
        end
        table.insert(output, "")
    end
    
    -- Useful Paths
    table.insert(output, "## USEFUL PATHS ##")
    
    if #dump.Paths.Remotes > 0 then
        table.insert(output, "Remote Folders:")
        for _, path in ipairs(dump.Paths.Remotes) do
            table.insert(output, "  " .. path)
        end
    end
    
    if #dump.Paths.Mobs > 0 then
        table.insert(output, "Mob/Enemy Folders:")
        for _, path in ipairs(dump.Paths.Mobs) do
            table.insert(output, "  " .. path)
        end
    end
    
    if #dump.Paths.Items > 0 then
        table.insert(output, "Item/Drop Folders:")
        for _, path in ipairs(dump.Paths.Items) do
            table.insert(output, "  " .. path)
        end
    end
    
    if dump.Paths.Currency and #dump.Paths.Currency > 0 then
        table.insert(output, "Player Currency/Stats:")
        for _, stat in ipairs(dump.Paths.Currency) do
            table.insert(output, "  " .. stat.Name .. " = " .. tostring(stat.Value))
        end
    end
    
    table.insert(output, "")
    
    -- Recommendations
    table.insert(output, "## SCRIPT RECOMMENDATIONS ##")
    
    if #dump.Paths.Mobs > 0 then
        table.insert(output, "  [+] Auto Farm possible - Mob folder found")
    end
    
    if #dump.Paths.Items > 0 then
        table.insert(output, "  [+] Item collection possible - Item folder found")
    end
    
    local hasQuestRemotes = false
    for _, remote in ipairs(dump.Remotes.Events) do
        if remote.Name:lower():find("quest") then
            hasQuestRemotes = true
            break
        end
    end
    if hasQuestRemotes then
        table.insert(output, "  [+] Auto Quest possible - Quest remotes found")
    end
    
    table.insert(output, "")
    table.insert(output, "========================================")
    table.insert(output, "END OF DUMP")
    table.insert(output, "========================================")
    
    return table.concat(output, "\n")
end

local function SaveDump(dump)
    if not DumperConfig.SaveToFile then return false end
    
    local formatted = FormatDump(dump)
    local fileName = DumperConfig.FileName .. "_" .. dump.GameInfo.PlaceId .. ".txt"
    
    local success = pcall(function()
        if writefile then
            writefile(fileName, formatted)
        end
    end)
    
    if success then
        print("[+] Dump saved to: " .. fileName)
    else
        print("[-] Could not save to file (writefile not available)")
    end
    
    return success, formatted
end

-- ============================================================================
-- EXPORT FUNCTIONS
-- ============================================================================

local GameDumper = {}

function GameDumper.Run()
    local dump = RunDump()
    local success, formatted = SaveDump(dump)
    return dump, formatted
end

function GameDumper.GetGameInfo()
    return GetGameInfo()
end

function GameDumper.GetRemotes()
    local remotes = {Events = {}, Functions = {}}
    ScanForRemotes(ReplicatedStorage, "ReplicatedStorage", 0)
    return Dump.Remotes
end

function GameDumper.GetPaths()
    return FindUsefulPaths()
end

function GameDumper.CheckAntiCheat()
    -- Need to scan remotes first
    ScanForRemotes(ReplicatedStorage, "ReplicatedStorage", 0)
    return DetectAntiCheat()
end

-- Copy to clipboard
function GameDumper.CopyToClipboard(dump)
    local formatted = FormatDump(dump)
    if setclipboard then
        setclipboard(formatted)
        print("[+] Dump copied to clipboard!")
        return true
    end
    return false
end

-- ============================================================================
-- RUN IMMEDIATELY
-- ============================================================================

local dump, formatted = GameDumper.Run()

-- Try to copy to clipboard
if setclipboard then
    setclipboard(formatted)
    print("\n[+] Dump copied to clipboard!")
end

print("\nDump Data Available in: _G.GameDump")
_G.GameDump = dump

return GameDumper
