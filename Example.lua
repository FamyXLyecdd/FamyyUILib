--[[
    FAMYY PRIVATE v9.0 - Example Usage
    
    This file demonstrates all available components and features
    of the FAMYY PRIVATE UI library.
    
    The library comes with a pre-built "Famy" tab containing:
    - Dashboard (User profile)
    - Status (FPS, Ping, Time, Game)
    - Socials (Discord invite)
    
    To use this example:
    1. Load the library: local Library = loadstring(game:HttpGet("URL"))()
    2. Access the pre-created window: local Window = Library.Window
    3. Or create additional tabs on the existing window
]]

-- Load the library (adjust path as needed)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/FamyyLib.lua"))()
-- Or for local development:
-- local Library = require(script.Parent.FamyyLib)

-- The library automatically creates a window with "Famy" tab
-- Access it via Library.Window
local Window = Library.Window

-- ============================================================================
-- CREATE TABS
-- ============================================================================

local MainTab = Window:CreateTab("Main")
local SettingsTab = Window:CreateTab("Settings")
local VisualsTab = Window:CreateTab("Visuals")
local MiscTab = Window:CreateTab("Misc")

-- ============================================================================
-- MAIN TAB
-- ============================================================================

-- Features Section
local FeaturesSection = MainTab:CreateSection("Features", true)

-- Toggle Example
local AimbotToggle = FeaturesSection:AddToggle({
    Label = "Aimbot",
    Default = false,
    Callback = function(value)
        print("Aimbot:", value)
        Window.Notify("Aimbot", value and "Enabled" or "Disabled", 2, value and "success" or "info")
    end
})

-- Slider Example
local FOVSlider = FeaturesSection:AddSlider({
    Label = "FOV",
    Min = 50,
    Max = 500,
    Default = 120,
    Step = 10,        -- Optional: snap to increments
    Suffix = "px",    -- Optional: value suffix
    Callback = function(value)
        print("FOV:", value)
    end
})

-- Dropdown Example
local TargetDropdown = FeaturesSection:AddDropdown({
    Label = "Target Part",
    Options = {"Head", "Torso", "HumanoidRootPart", "Random"},
    Default = "Head",  -- Can be string or index number
    Multi = false,     -- Single selection
    Callback = function(value)
        print("Target:", value)
    end
})

-- Multi-Select Dropdown Example
local TeamDropdown = FeaturesSection:AddDropdown({
    Label = "Target Teams",
    Options = {"Red", "Blue", "Green", "Yellow"},
    Default = {"Red", "Blue"},  -- Multiple defaults for multi-select
    Multi = true,               -- Enable multi-selection
    Callback = function(values)
        print("Teams:", table.concat(values, ", "))
    end
})

-- Combat Section
local CombatSection = MainTab:CreateSection("Combat", true)

-- Button Example
CombatSection:AddButton({
    Label = "Kill All",
    Style = "danger",  -- "primary", "secondary", "danger"
    Callback = function()
        print("Kill All clicked!")
        Window.Notify("Combat", "Kill All activated!", 2, "warning")
    end
})

-- Another Toggle
CombatSection:AddToggle({
    Label = "Silent Aim",
    Default = false,
    Callback = function(value)
        print("Silent Aim:", value)
    end
})

-- ============================================================================
-- SETTINGS TAB
-- ============================================================================

-- Keybind Section
local KeybindSection = SettingsTab:CreateSection("Keybinds", true)

-- Keybind Example (Toggle Mode)
local AimbotKeybind = KeybindSection:AddKeybind({
    Label = "Aimbot Key",
    Default = Enum.KeyCode.E,
    Mode = "toggle",  -- "toggle" or "hold"
    Callback = function(isActive)
        print("Aimbot Active:", isActive)
        AimbotToggle:Set(isActive, false)  -- Sync with toggle
    end,
    ChangedCallback = function(newKey)
        print("Aimbot keybind changed to:", newKey.Name)
    end
})

-- Keybind Example (Hold Mode)
KeybindSection:AddKeybind({
    Label = "Trigger Bot",
    Default = Enum.KeyCode.Q,
    Mode = "hold",
    Callback = function(isHolding)
        print("Trigger Bot Holding:", isHolding)
    end
})

-- Input Section
local InputSection = SettingsTab:CreateSection("Configuration", true)

-- Text Input Example
InputSection:AddInput({
    Label = "Username",
    Placeholder = "Enter username...",
    Default = "",
    Callback = function(value)
        print("Username:", value)
    end
})

-- Numeric Input Example
InputSection:AddInput({
    Label = "Speed",
    Placeholder = "16",
    Default = "16",
    Numeric = true,    -- Only allow numbers
    MaxLength = 5,     -- Maximum characters
    Callback = function(value)
        print("Speed:", tonumber(value))
    end
})

-- ============================================================================
-- VISUALS TAB
-- ============================================================================

local ESPSection = VisualsTab:CreateSection("ESP", true)

ESPSection:AddToggle({
    Label = "Enable ESP",
    Default = false,
    Callback = function(value)
        print("ESP:", value)
    end
})

ESPSection:AddToggle({
    Label = "Show Names",
    Default = true,
    Callback = function(value)
        print("Show Names:", value)
    end
})

ESPSection:AddToggle({
    Label = "Show Distance",
    Default = true,
    Callback = function(value)
        print("Show Distance:", value)
    end
})

ESPSection:AddSlider({
    Label = "Max Distance",
    Min = 100,
    Max = 2000,
    Default = 500,
    Suffix = " studs",
    Callback = function(value)
        print("Max Distance:", value)
    end
})

-- Divider Example
ESPSection:AddDivider()

-- Label Examples
ESPSection:AddLabel({
    Text = "ESP Colors",
    Bold = true,
    Size = "normal"
})

-- World Section (starts collapsed)
local WorldSection = VisualsTab:CreateSection("World", false)

WorldSection:AddToggle({
    Label = "Fullbright",
    Default = false,
    Callback = function(value)
        print("Fullbright:", value)
    end
})

WorldSection:AddSlider({
    Label = "Brightness",
    Min = 0,
    Max = 5,
    Default = 2,
    Step = 0.5,
    Callback = function(value)
        print("Brightness:", value)
    end
})

-- ============================================================================
-- MISC TAB
-- ============================================================================

local UtilitySection = MiscTab:CreateSection("Utility", true)

UtilitySection:AddButton({
    Label = "Rejoin Server",
    Style = "secondary",
    Callback = function()
        print("Rejoining...")
        -- game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end
})

UtilitySection:AddButton({
    Label = "Copy Server Link",
    Style = "primary",
    Callback = function()
        local link = "roblox://placeId=" .. game.PlaceId .. "&gameInstanceId=" .. game.JobId
        if setclipboard then
            setclipboard(link)
            Window.Notify("Success", "Server link copied!", 2, "success")
        end
    end
})

UtilitySection:AddDivider({Padding = 4})

UtilitySection:AddLabel({
    Text = "Player: " .. game.Players.LocalPlayer.Name,
    Color = Library:GetTheme().Colors.TextDim,
    Size = "small"
})

-- Credits Section
local CreditsSection = MiscTab:CreateSection("Credits", true)

CreditsSection:AddLabel({
    Text = "FAMYY PRIVATE v9.0",
    Bold = true
})

CreditsSection:AddLabel({
    Text = "Developed by Famyy",
    Size = "small",
    Color = Library:GetTheme().Colors.Accent
})

CreditsSection:AddDivider()

-- You would add Discord CTA here with the modular component
-- For the all-in-one FamyyLib, buttons work for this:
CreditsSection:AddButton({
    Label = "Join Discord",
    Style = "primary",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/wkkgT7a57U")
            Window.Notify("Discord", "Invite link copied!", 2, "success")
        end
    end
})

-- ============================================================================
-- PROGRAMMATIC CONTROL EXAMPLES
-- ============================================================================

-- You can control components programmatically:

-- Set toggle value
-- AimbotToggle:Set(true)      -- Enable aimbot
-- AimbotToggle:Set(false)     -- Disable aimbot
-- local isEnabled = AimbotToggle:Get()  -- Get current state

-- Set slider value
-- FOVSlider:Set(200)          -- Set FOV to 200
-- local currentFOV = FOVSlider:Get()    -- Get current value

-- Set dropdown value
-- TargetDropdown:Set("Torso")  -- Select torso
-- TeamDropdown:Set({"Red", "Green"})    -- Multi-select

-- Set keybind
-- AimbotKeybind:Set(Enum.KeyCode.F)     -- Change to F key

-- Show notifications
-- Window.Notify("Title", "Message", 3, "info")     -- Info notification
-- Window.Notify("Success!", "Done", 2, "success") -- Success notification
-- Window.Notify("Warning", "Be careful", 3, "warning") -- Warning
-- Window.Notify("Error!", "Something failed", 4, "error") -- Error

-- ============================================================================
-- CLEANUP
-- ============================================================================

-- To destroy the window:
-- Window:Destroy()

print("[FAMYY PRIVATE] Example loaded! Press RightShift to toggle UI.")
