--[[
    FAMYY PRIVATE - Universal Script Loader
    
    Detects the current game and loads the appropriate script.
    Falls back to Universal script if game is not supported.
    
    Usage:
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/Scripts/Loader.lua"))()
]]

local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

-- ============================================================================
-- CONFIGURATION
-- ============================================================================

local GITHUB_BASE = "https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/Scripts/"

-- Supported games: PlaceId -> Script filename
local SUPPORTED_GAMES = {
    -- Blox Fruits (all places)
    [2753915549] = "BloxFruits.lua",  -- First Sea
    [4442272183] = "BloxFruits.lua",  -- Second Sea
    [7449423635] = "BloxFruits.lua",  -- Third Sea
    
    -- Add more games here as they are developed:
    -- [PlaceId] = "ScriptName.lua",
}

-- Game name overrides (for cleaner display)
local GAME_NAMES = {
    [2753915549] = "Blox Fruits (Sea 1)",
    [4442272183] = "Blox Fruits (Sea 2)",
    [7449423635] = "Blox Fruits (Sea 3)",
}

-- ============================================================================
-- LOADER LOGIC
-- ============================================================================

local function getGameName()
    local placeId = game.PlaceId
    
    -- Check override first
    if GAME_NAMES[placeId] then
        return GAME_NAMES[placeId]
    end
    
    -- Fetch from Marketplace
    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(placeId)
    end)
    
    if success and info and info.Name then
        return info.Name
    end
    
    return "Unknown Game"
end

local function notify(title, message, duration)
    -- Simple notification using StarterGui
    local StarterGui = game:GetService("StarterGui")
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = message,
            Duration = duration or 3
        })
    end)
end

local function loadScript(url)
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    
    if not success then
        warn("[FamyyLoader] Failed to fetch script:", result)
        return nil
    end
    
    local loadFunc, loadErr = loadstring(result)
    if not loadFunc then
        warn("[FamyyLoader] Failed to parse script:", loadErr)
        return nil
    end
    
    return loadFunc
end

-- ============================================================================
-- MAIN
-- ============================================================================

local placeId = game.PlaceId
local gameName = getGameName()
local scriptFile = SUPPORTED_GAMES[placeId]

print("============================================")
print("  FAMYY PRIVATE - Universal Loader")
print("============================================")
print("  Game: " .. gameName)
print("  PlaceId: " .. tostring(placeId))
print("============================================")

if scriptFile then
    -- Supported game found
    print("[FamyyLoader] Loading script: " .. scriptFile)
    notify("Famyy Private", "Loading " .. gameName .. "...", 3)
    
    local scriptFunc = loadScript(GITHUB_BASE .. scriptFile)
    if scriptFunc then
        local runSuccess, runErr = pcall(scriptFunc)
        if not runSuccess then
            warn("[FamyyLoader] Script execution error:", runErr)
            notify("Error", "Script failed to execute. Check console.", 5)
        end
    else
        -- Fallback to Universal
        warn("[FamyyLoader] Game script failed, loading Universal...")
        notify("Warning", "Game script unavailable, loading Universal...", 3)
        
        local universalFunc = loadScript(GITHUB_BASE .. "Universal.lua")
        if universalFunc then
            pcall(universalFunc)
        end
    end
else
    -- Unsupported game - load Universal
    print("[FamyyLoader] Game not supported, loading Universal script...")
    notify("Famyy Private", "Game not supported. Loading Universal features...", 3)
    
    local universalFunc = loadScript(GITHUB_BASE .. "Universal.lua")
    if universalFunc then
        local runSuccess, runErr = pcall(universalFunc)
        if not runSuccess then
            warn("[FamyyLoader] Universal script error:", runErr)
        end
    else
        warn("[FamyyLoader] Failed to load Universal script")
        notify("Error", "Failed to load scripts. Check console.", 5)
    end
end
