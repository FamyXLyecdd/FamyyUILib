--[[
    FAMYY PRIVATE v1.0 - Showcase Script
    Run this script to record the showcase video.
    
    Ensure 'FamyyLib.lua' is accessible.
    If testing locally, you might need to paste the library source above this script 
    or use 'loadstring(readfile("FamyyLib.lua"))()' if supported.
]]

-- Load the Library (Simulated for this script)
-- Replace the line below with your actual loadstring URL when releasing
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FamyXLyecdd/FamyyUILib/main/FamyyLib.lua"))() 
-- For local testing if the above fails (comment out the above and uncomment below if using file execution):
-- local Library = loadstring(readfile("FamyyLib.lua"))()

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Create the Window
local Window = Library:CreateWindow({
    Title = "FAMYY PRIVATE",
    Subtitle = "Showcase v1.0",
    Size = UDim2.new(0, 500, 0, 600), -- Slightly larger for showcase
    Keybind = Enum.KeyCode.RightShift,
    SaveConfig = true,
    ConfigName = "ShowcaseConfig"
})

-- ============================================================================
-- TAB: MAIN (Combat & Player)
-- ============================================================================
local MainTab = Window:CreateTab("Main")

-- Section: Player Attributes
local PlayerSection = MainTab:CreateSection("Player Attributes", true)

PlayerSection:AddToggle({
    Label = "God Mode",
    Default = false,
    Callback = function(state)
        -- Fake God Mode Logic
        if state then
            Window.Notify("God Mode", "Enabled (Invulnerable)", 2, "success")
        else
            Window.Notify("God Mode", "Disabled", 2, "warning")
        end
    end
})

PlayerSection:AddSlider({
    Label = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(val)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = val
        end
    end
})

PlayerSection:AddSlider({
    Label = "Jump Power",
    Min = 50,
    Max = 300,
    Default = 50,
    Callback = function(val)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = val
        end
    end
})

PlayerSection:AddButton({
    Label = "Reset Character",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.Health = 0
            Window.Notify("Character", "Reset successfully", 2, "info")
        end
    end
})

-- Section: Combat (Fake)
local CombatSection = MainTab:CreateSection("Combat", true)

CombatSection:AddToggle({
    Label = "Silent Aim",
    Default = true,
    Callback = function(state) end
})

CombatSection:AddDropdown({
    Label = "Target Part",
    Options = {"Head", "Torso", "Random"},
    Default = "Head",
    Callback = function(val)
        print("Target set to:", val)
    end
})

CombatSection:AddSlider({
    Label = "FOV Radius",
    Min = 0,
    Max = 360,
    Default = 100,
    Suffix = "px",
    Callback = function(val) end
})

-- ============================================================================
-- TAB: VISUALS
-- ============================================================================
local VisualsTab = Window:CreateTab("Visuals")

local EspSection = VisualsTab:CreateSection("ESP Settings", true)

EspSection:AddToggle({
    Label = "Enable ESP",
    Default = false,
    Callback = function(state)
        -- Placeholder for ESP logic
    end
})

EspSection:AddDropdown({
    Label = "ESP Mode",
    Options = {"Box 2D", "Box 3D", "Skeleton", "Tracers"},
    Default = "Box 2D",
    Multi = true, -- Showcase Multi-Select!
    Callback = function(vals)
        print("Selected modes:", table.concat(vals, ", "))
    end
})

EspSection:AddDivider({Padding = 12})

EspSection:AddLabel({
    Text = "Team Settings",
    Color = Color3.fromRGB(150, 150, 150),
    Size = "small"
})

EspSection:AddToggle({Label = "Show Teammates", Default = false})
EspSection:AddToggle({Label = "Show Enemies", Default = true})

local WorldSection = VisualsTab:CreateSection("World", true)

WorldSection:AddSlider({
    Label = "Time of Day",
    Min = 0,
    Max = 24,
    Default = 14,
    Step = 0.5,
    Callback = function(val)
        Lighting.ClockTime = val
    end
})

WorldSection:AddSlider({
    Label = "Brightness",
    Min = 0,
    Max = 10,
    Default = 2,
    Step = 0.1,
    Callback = function(val)
        Lighting.Brightness = val
    end
})

-- ============================================================================
-- TAB: MISC
-- ============================================================================
local MiscTab = Window:CreateTab("Misc")

local NotifSection = MiscTab:CreateSection("Notifications", true)

NotifSection:AddButton({
    Label = "Test Success",
    Callback = function()
        Window.Notify("Success", "This is a success message!", 3, "success")
    end
})

NotifSection:AddButton({
    Label = "Test Warning",
    Callback = function()
        Window.Notify("Warning", "Be careful with this feature.", 3, "warning")
    end
})

NotifSection:AddButton({
    Label = "Test Error",
    Callback = function()
        Window.Notify("Error", "Something went wrong!", 3, "error")
    end
})

local OtherSection = MiscTab:CreateSection("Other Components", true)

OtherSection:AddInput({
    Label = "Custom Message",
    Placeholder = "Type here...",
    Callback = function(text)
        print("Input:", text)
    end
})

OtherSection:AddKeybind({
    Label = "Panic Key",
    Default = Enum.KeyCode.P,
    Callback = function()
        Window.Notify("PANIC", "Panic mode activated!", 2, "error")
    end
})

-- Show off the Famy Customization (which is in the Famy tab automatically)
-- but we can also add a button here to switch themes via script if we wanted
OtherSection:AddLabel({
    Text = "Check the 'Famy' tab for Theme customization!",
    Color = Color3.fromRGB(130, 90, 255),
    RichText = true
})

-- Initialize
Window.Notify("Showcase", "Script Loaded Successfully", 3, "success")
