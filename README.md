# FAMYY PRIVATE v9.0

A professional, modular Roblox UI library for script developers.

## Features

- Modern dark theme with neon purple accents
- Fully animated components with smooth transitions
- Memory leak prevention with connection tracking
- Settings persistence system
- Mobile touch support
- Comprehensive component library

## Quick Start

```lua
-- Load the library
local Library = loadstring(game:HttpGet("YOUR_URL_HERE"))()

-- Create a window
local Window = Library:CreateWindow({
    Title = "My Script",
    Keybind = Enum.KeyCode.RightShift
})

-- Create a tab
local Tab = Window:CreateTab("Main")

-- Create a section
local Section = Tab:CreateSection("Features")

-- Add components
Section:AddToggle({
    Label = "My Feature",
    Default = false,
    Callback = function(value)
        print("Feature:", value)
    end
})
```

## Components

### Toggle
```lua
local toggle = Section:AddToggle({
    Label = "Toggle Name",
    Default = false,
    Callback = function(value) end
})

-- Methods
toggle:Set(true)          -- Set state
toggle:Set(true, false)   -- Set without firing callback
local state = toggle:Get() -- Get current state
```

### Slider
```lua
local slider = Section:AddSlider({
    Label = "Slider Name",
    Min = 0,
    Max = 100,
    Default = 50,
    Step = 5,           -- Optional: snap to increments
    Suffix = "%",       -- Optional: value suffix
    Callback = function(value) end
})

-- Methods
slider:Set(75)
local value = slider:Get()
```

### Button
```lua
Section:AddButton({
    Label = "Click Me",
    Style = "primary",   -- "primary", "secondary", "danger"
    Callback = function() end
})
```

### Dropdown
```lua
-- Single select
local dropdown = Section:AddDropdown({
    Label = "Select Option",
    Options = {"Option 1", "Option 2", "Option 3"},
    Default = "Option 1",
    Callback = function(value) end
})

-- Multi-select
local multiDropdown = Section:AddDropdown({
    Label = "Select Multiple",
    Options = {"A", "B", "C", "D"},
    Default = {"A", "B"},
    Multi = true,
    Callback = function(values) end  -- Returns array
})

-- Methods
dropdown:Set("Option 2")
multiDropdown:Set({"A", "C"})
local selected = dropdown:Get()
```

### Text Input
```lua
local input = Section:AddInput({
    Label = "Input Name",
    Placeholder = "Enter text...",
    Default = "",
    Numeric = false,     -- Only allow numbers
    MaxLength = 50,      -- Character limit
    Callback = function(text) end
})

-- Methods
input:Set("New Value")
local text = input:Get()
```

### Keybind
```lua
local keybind = Section:AddKeybind({
    Label = "Keybind Name",
    Default = Enum.KeyCode.E,
    Mode = "toggle",     -- "toggle" or "hold"
    Callback = function(isActive)
        -- Called when key is pressed
    end,
    ChangedCallback = function(newKey)
        -- Called when keybind is changed
    end
})

-- Methods
keybind:Set(Enum.KeyCode.F)
local key = keybind:Get()
local isActive = keybind:GetState()  -- For toggle mode
```

### Label
```lua
Section:AddLabel({
    Text = "Label Text",
    Color = Color3.fromRGB(255, 255, 255),  -- Optional
    Size = "normal",     -- "small", "normal", "large"
    Bold = false,
    RichText = false
})
```

### Divider
```lua
Section:AddDivider({
    Color = Color3.fromRGB(30, 30, 36),  -- Optional
    Padding = 8          -- Vertical padding
})
```

## Notifications

```lua
Window.Notify("Title", "Message", 3, "info")
-- Types: "info", "success", "warning", "error"
-- Duration is in seconds
```

## Window Configuration

```lua
local Window = Library:CreateWindow({
    Title = "FAMYY PRIVATE",     -- Window title
    Subtitle = "v1.0",           -- Optional subtitle
    Size = UDim2.new(0, 280, 0, 480),
    Position = UDim2.new(0.05, 0, 0.5, -240),
    Keybind = Enum.KeyCode.RightShift,
    SaveConfig = true,           -- Enable config saving
    ConfigName = "MyScript"      -- Config file name
})
```

## Theme Customization

```lua
-- Get theme
local theme = Library:GetTheme()

-- Modify colors
Library:SetThemeColor("Accent", Color3.fromRGB(255, 100, 100))

-- Available color keys:
-- Background, Surface, SurfaceHover, Card, CardHover
-- Accent, AccentDim, AccentHover
-- Text, TextDim, TextMuted
-- Success, Warning, Error, Info
-- Discord, DiscordHover
```

## Project Structure

```
FamyyPrivate/
├── FamyyLib.lua          # Main library (all-in-one)
├── Famyy_Private.lua     # Original v8.1 (legacy)
├── Example.lua           # Usage examples
├── README.md             # This file
│
├── Config/
│   ├── Theme.lua         # Theme configuration
│   └── Settings.lua      # Settings persistence
│
├── Utils/
│   ├── Tween.lua         # Animation utilities
│   ├── Connections.lua   # Connection manager
│   └── Safety.lua        # Error handling
│
└── Components/
    ├── Toggle.lua        # Toggle switch
    ├── Slider.lua        # Range slider
    ├── Button.lua        # Clickable button
    ├── Dropdown.lua      # Select dropdown
    ├── TextInput.lua     # Text input field
    ├── Keybind.lua       # Keybind picker
    ├── ColorPicker.lua   # Color picker
    ├── Label.lua         # Text label
    ├── Divider.lua       # Visual separator
    ├── Notification.lua  # Toast notifications
    ├── Profile.lua       # User profile card
    ├── StatGrid.lua      # Stats display
    └── DiscordCTA.lua    # Discord button
```

## File Usage

### All-in-One (Recommended)
Use `FamyyLib.lua` for a single-file solution that includes all components:
```lua
local Library = loadstring(game:HttpGet("URL/FamyyLib.lua"))()
```

### Modular (Advanced)
For development, use the modular structure in `/Components`, `/Utils`, and `/Config` folders.

## Credits

Developed by Famyy

## Support

Join our Discord: discord.gg/wkkgT7a57U
