--[[
    FAMYY PRIVATE - Theme Configuration
    Centralized color palette and styling constants
]]

local Theme = {}

-- Color Palette
Theme.Colors = {
    -- Base colors
    Background = Color3.fromRGB(10, 10, 13),
    Surface = Color3.fromRGB(20, 20, 24),
    SurfaceHover = Color3.fromRGB(30, 30, 36),
    Card = Color3.fromRGB(25, 25, 30),
    CardHover = Color3.fromRGB(35, 35, 42),
    
    -- Accent colors
    Accent = Color3.fromRGB(130, 90, 255),
    AccentDim = Color3.fromRGB(100, 70, 200),
    AccentHover = Color3.fromRGB(150, 110, 255),
    
    -- Text colors
    Text = Color3.fromRGB(255, 255, 255),
    TextDim = Color3.fromRGB(160, 160, 170),
    TextMuted = Color3.fromRGB(100, 100, 110),
    
    -- Status colors
    Success = Color3.fromRGB(100, 255, 140),
    Warning = Color3.fromRGB(255, 220, 100),
    Error = Color3.fromRGB(255, 100, 100),
    Info = Color3.fromRGB(100, 180, 255),
    
    -- Special colors
    Discord = Color3.fromRGB(88, 101, 242),
    DiscordHover = Color3.fromRGB(71, 82, 196),
}

-- Aliases for backwards compatibility
Theme.Colors.Green = Theme.Colors.Success
Theme.Colors.Yellow = Theme.Colors.Warning
Theme.Colors.Red = Theme.Colors.Error

-- Size Constants
Theme.Sizes = {
    -- Window
    WindowDefault = UDim2.new(0, 260, 0, 450),
    WindowMinimized = UDim2.new(0, 45, 0, 45),
    
    -- Components
    HeaderHeight = 55,
    TabBarHeight = 32,
    CollapsibleHeader = 36,
    ToggleHeight = 36,
    SliderHeight = 50,
    ButtonHeight = 36,
    DropdownHeight = 36,
    InputHeight = 36,
    LabelHeight = 20,
    DividerHeight = 1,
    ProfileHeight = 60,
    StatGridHeight = 110,
    DiscordCTAHeight = 50,
    
    -- Padding
    WindowPadding = 15,
    ComponentPadding = 12,
    ComponentSpacing = 2,
}

-- Corner Radius
Theme.Corners = {
    Window = UDim.new(0, 12),
    Card = UDim.new(0, 8),
    Button = UDim.new(0, 6),
    Toggle = UDim.new(1, 0),  -- Full round
    Input = UDim.new(0, 6),
    Notification = UDim.new(0, 8),
}

-- Fonts
Theme.Fonts = {
    Title = Enum.Font.GothamBlack,
    Header = Enum.Font.GothamBold,
    Body = Enum.Font.GothamMedium,
    Caption = Enum.Font.Gotham,
}

-- Text Sizes
Theme.TextSizes = {
    Title = 19,
    Header = 14,
    Body = 13,
    Caption = 12,
    Small = 11,
    Tiny = 10,
}

-- Animation Durations
Theme.Animation = {
    Fast = 0.15,
    Normal = 0.3,
    Slow = 0.5,
}

-- Stroke
Theme.Stroke = {
    Default = 1,
    Thick = 1.5,
    Thin = 0.5,
}

--[[
    Creates a deep copy of the theme for customization
    @return table - A copy of the theme
]]
function Theme.Clone()
    local copy = {}
    for key, value in pairs(Theme) do
        if type(value) == "table" and key ~= "Clone" then
            copy[key] = {}
            for k, v in pairs(value) do
                copy[key][k] = v
            end
        else
            copy[key] = value
        end
    end
    return copy
end

--[[
    Applies a color scheme override
    @param colors table - Color overrides
]]
function Theme.ApplyColors(colors)
    for key, color in pairs(colors) do
        if Theme.Colors[key] then
            Theme.Colors[key] = color
        end
    end
end

return Theme
