--[[
    FAMYY PRIVATE - Blox Fruits Sea Loader
    Automatically detects the current Sea and loads the optimized script for that region.
    
    Structure:
    - Scripts/BloxFruits_Sea1.lua
    - Scripts/BloxFruits_Sea2.lua
    - Scripts/BloxFruits_Sea3.lua
]]

local PlaceId = game.PlaceId
local Sea1Id = 2753915549
local Sea2Id = 4442272183
local Sea3Id = 7449423635

local function LoadScript(fileName)
    local success, result = pcall(function()
        return readfile("Scripts/" .. fileName)
    end)
    
    if not success then
        -- Try without "Scripts/" prefix if folder structure differs
        success, result = pcall(function()
            return readfile(fileName)
        end)
    end
    
    if success then
        loadstring(result)()
    else
        warn("Famyy Loader Error: Could not find " .. fileName)
        game.StarterGui:SetCore("SendNotification", {
            Title = "Famyy Private",
            Text = "Script file not found: " .. fileName,
            Duration = 5
        })
    end
end

if PlaceId == Sea1Id then
    print("[Famyy] Detected Sea 1. Loading Sea 1 Script...")
    LoadScript("BloxFruits_Sea1.lua")
elseif PlaceId == Sea2Id then
    print("[Famyy] Detected Sea 2. Loading Sea 2 Script...")
    LoadScript("BloxFruits_Sea2.lua")
elseif PlaceId == Sea3Id then
    print("[Famyy] Detected Sea 3. Loading Sea 3 Script...")
    LoadScript("BloxFruits_Sea3.lua")
else
    warn("[Famyy] Unknown Sea (Place ID: " .. tostring(PlaceId) .. "). Loading Sea 3 as default...")
    LoadScript("BloxFruits_Sea3.lua")
end
