--[[
    ██████╗ ███████╗██╗   ██╗██╗   ██╗██╗   ██╗    ██████╗ ██████╗ ██╗██╗   ██╗ █████╗ ████████╗███████╗
    ██╔══██╗██╔════╝██║   ██║██║   ██║╚██╗ ██╔╝    ██╔══██╗██╔══██╗██║██║   ██║██╔══██╗╚══██╔══╝██╔════╝
    ██████╔╝█████╗  ██║   ██║██║   ██║ ╚████╔╝     ██████╔╝██████╔╝██║██║   ██║███████║   ██║   █████╗  
    ██╔═══╝ ██╔══╝  ██║   ██║██║   ██║  ╚██╔╝      ██╔═══╝ ██╔══██╗██║╚██╗ ██╔╝██╔══██║   ██║   ██╔══╝  
    ██║     ███████╗╚██████╔╝╚██████╔╝   ██║       ██║     ██║  ██║██║ ╚████╔╝ ██║  ██║   ██║   ███████╗
    ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝    ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═╝   ╚═╝   ╚══════╝
    
    FAMYY PRIVATE - Main Loader
    Version: 10.0
    
    Single script to load everything. Auto-detects game and loads appropriate script.
    
    Usage:
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/Main.lua"))()
]]

-- ============================================================================
-- CONFIGURATION
-- ============================================================================

local GITHUB_RAW = "https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/"

-- Supported games: PlaceId -> {Script, Name}
local GAMES = {
    -- Blox Fruits
    [2753915549] = {Script = "Scripts/BloxFruits.lua", Name = "Blox Fruits (First Sea)"},
    [4442272183] = {Script = "Scripts/BloxFruits.lua", Name = "Blox Fruits (Second Sea)"},
    [7449423635] = {Script = "Scripts/BloxFruits.lua", Name = "Blox Fruits (Third Sea)"},
    
    -- Waste Time
    [129548273770183] = {Script = "Scripts/WasteTime.lua", Name = "Waste Time"},
    
    -- Add more games here:
    -- [PlaceId] = {Script = "Scripts/GameName.lua", Name = "Display Name"},
}

-- ============================================================================
-- SERVICES
-- ============================================================================

local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer

-- ============================================================================
-- UTILITIES
-- ============================================================================

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 3
        })
    end)
end

local function getGameName()
    local placeId = game.PlaceId
    
    -- Check our database first
    if GAMES[placeId] then
        return GAMES[placeId].Name
    end
    
    -- Try to get from Roblox
    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(placeId)
    end)
    
    if success and info and info.Name then
        return info.Name
    end
    
    return "Unknown Game"
end

local function httpGet(url)
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    
    if not success then
        warn("[FamyyPrivate] HTTP Error:", result)
        return nil
    end
    
    return result
end

local function loadScript(url)
    local code = httpGet(url)
    if not code then
        return nil, "Failed to fetch script"
    end
    
    local func, err = loadstring(code)
    if not func then
        return nil, "Parse error: " .. tostring(err)
    end
    
    return func
end

-- ============================================================================
-- MAIN LOADER
-- ============================================================================

local function main()
    local placeId = game.PlaceId
    local gameName = getGameName()
    local gameData = GAMES[placeId]
    
    print("")
    print("╔══════════════════════════════════════════╗")
    print("║         FAMYY PRIVATE v9.2               ║")
    print("╠══════════════════════════════════════════╣")
    print("║  Game: " .. gameName:sub(1, 32) .. string.rep(" ", math.max(0, 32 - #gameName)) .. " ║")
    print("║  PlaceId: " .. placeId .. string.rep(" ", math.max(0, 29 - #tostring(placeId))) .. " ║")
    print("╚══════════════════════════════════════════╝")
    print("")
    
    -- Determine which script to load
    local scriptPath
    local scriptType
    
    if gameData then
        scriptPath = GITHUB_RAW .. gameData.Script
        scriptType = "Game-Specific"
        print("[+] Supported game detected: " .. gameData.Name)
    else
        scriptPath = GITHUB_RAW .. "Scripts/Universal.lua"
        scriptType = "Universal"
        print("[!] Game not supported, loading Universal script...")
    end
    
    notify("Famyy Private", "Loading " .. scriptType .. " script...", 2)
    
    -- Load the script
    print("[*] Loading: " .. scriptPath)
    local scriptFunc, loadErr = loadScript(scriptPath)
    
    if not scriptFunc then
        -- If game script fails, try Universal
        warn("[!] Failed to load script: " .. tostring(loadErr))
        
        if scriptType ~= "Universal" then
            print("[*] Falling back to Universal...")
            notify("Warning", "Game script failed, loading Universal...", 3)
            
            scriptFunc, loadErr = loadScript(GITHUB_RAW .. "Scripts/Universal.lua")
            scriptType = "Universal (Fallback)"
        end
    end
    
    if not scriptFunc then
        warn("[X] All scripts failed to load!")
        notify("Error", "Failed to load scripts. Check console.", 5)
        return
    end
    
    -- Execute the script
    print("[*] Executing " .. scriptType .. " script...")
    
    local success, execErr = pcall(scriptFunc)
    
    if not success then
        warn("[X] Script execution failed: " .. tostring(execErr))
        notify("Error", "Script crashed. Check console.", 5)
        return
    end
    
    print("[+] Script loaded successfully!")
    print("")
end

-- Run the loader
main()
