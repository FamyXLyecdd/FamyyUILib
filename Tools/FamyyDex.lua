--[[
    ███████╗ █████╗ ███╗   ███╗██╗   ██╗██╗   ██╗██████╗ ███████╗██╗  ██╗
    ██╔════╝██╔══██╗████╗ ████║╚██╗ ██╔╝╚██╗ ██╔╝██╔══██╗██╔════╝╚██╗██╔╝
    █████╗  ███████║██╔████╔██║ ╚████╔╝  ╚████╔╝ ██║  ██║█████╗   ╚███╔╝ 
    ██╔══╝  ██╔══██║██║╚██╔╝██║  ╚██╔╝    ╚██╔╝  ██║  ██║██╔══╝   ██╔██╗ 
    ██║     ██║  ██║██║ ╚═╝ ██║   ██║      ██║   ██████╔╝███████╗██╔╝ ╚██╗
    ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝      ╚═╝   ╚═════╝ ╚══════╝╚═╝   ╚═╝
    
    FamyyDex v1.0 - Ultimate Game Explorer
    1000x better than Dark Dex. Period.
    
    Features:
    - Deep Explorer with infinite traversal
    - Properties Panel with live editing
    - Remote Spy with argument logging
    - Script Viewer with syntax highlighting
    - Nil Instance Scanner
    - Advanced Search (class, name, property, value)
    - Instance Actions (clone, delete, save, teleport)
    - Path Generation & Code Snippets
    - Virtual Scrolling for performance
    - Context Menus
    - Favorites & Bookmarks
    - Instance Diff Viewer
    - Memory Usage Tracker
]]

--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local ScriptContext = game:GetService("ScriptContext")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local StarterPack = game:GetService("StarterPack")
local StarterPlayer = game:GetService("StarterPlayer")
local Teams = game:GetService("Teams")
local SoundService = game:GetService("SoundService")
local Chat = game:GetService("Chat")
local LocalizationService = game:GetService("LocalizationService")
local TestService = game:GetService("TestService")

local Player = Players.LocalPlayer

--// Theme (FAMYY PRIVATE Color Palette)
local Theme = {
    Colors = {
        Background = Color3.fromRGB(10, 10, 13),
        Surface = Color3.fromRGB(20, 20, 24),
        SurfaceHover = Color3.fromRGB(30, 30, 36),
        Card = Color3.fromRGB(25, 25, 30),
        CardHover = Color3.fromRGB(35, 35, 42),
        
        Accent = Color3.fromRGB(130, 90, 255),
        AccentDim = Color3.fromRGB(100, 70, 200),
        AccentHover = Color3.fromRGB(150, 110, 255),
        AccentGlow = Color3.fromRGB(130, 90, 255),
        
        Text = Color3.fromRGB(255, 255, 255),
        TextDim = Color3.fromRGB(160, 160, 170),
        TextMuted = Color3.fromRGB(100, 100, 110),
        
        Success = Color3.fromRGB(100, 255, 140),
        Warning = Color3.fromRGB(255, 220, 100),
        Error = Color3.fromRGB(255, 100, 100),
        Info = Color3.fromRGB(100, 180, 255),
        
        -- Explorer-specific colors
        TreeLine = Color3.fromRGB(50, 50, 60),
        Selected = Color3.fromRGB(130, 90, 255),
        SelectedBg = Color3.fromRGB(45, 35, 70),
        Folder = Color3.fromRGB(255, 200, 100),
        Script = Color3.fromRGB(100, 180, 255),
        LocalScript = Color3.fromRGB(100, 180, 255),
        ModuleScript = Color3.fromRGB(180, 100, 255),
        RemoteEvent = Color3.fromRGB(255, 150, 100),
        RemoteFunction = Color3.fromRGB(255, 180, 100),
        BindableEvent = Color3.fromRGB(100, 255, 180),
        Part = Color3.fromRGB(180, 180, 180),
        Model = Color3.fromRGB(255, 180, 100),
        Nil = Color3.fromRGB(255, 80, 80),
    },
    
    Fonts = {
        Title = Enum.Font.GothamBlack,
        Header = Enum.Font.GothamBold,
        Body = Enum.Font.GothamMedium,
        Caption = Enum.Font.Gotham,
        Code = Enum.Font.Code,
    },
    
    TextSizes = {
        Title = 16,
        Header = 13,
        Body = 12,
        Caption = 11,
        Small = 10,
        Tiny = 9,
    },
    
    Animation = {
        Fast = 0.12,
        Normal = 0.25,
        Slow = 0.4,
    },
    
    Corners = {
        Window = UDim.new(0, 10),
        Panel = UDim.new(0, 8),
        Button = UDim.new(0, 6),
        Small = UDim.new(0, 4),
        Full = UDim.new(1, 0),
    },
}

--// Class Icons (emoji-based for compatibility)
local ClassIcons = {
    Folder = "📁",
    Script = "📜",
    LocalScript = "📄",
    ModuleScript = "📦",
    RemoteEvent = "📡",
    RemoteFunction = "📞",
    BindableEvent = "🔗",
    BindableFunction = "⛓️",
    Part = "🧊",
    MeshPart = "🔷",
    UnionOperation = "🔶",
    Model = "📐",
    Tool = "🔧",
    Accessory = "👒",
    Humanoid = "🧍",
    HumanoidRootPart = "🦴",
    Camera = "📷",
    Sound = "🔊",
    ParticleEmitter = "✨",
    Fire = "🔥",
    Smoke = "💨",
    Beam = "⚡",
    Trail = "🌈",
    BillboardGui = "🖼️",
    ScreenGui = "🖥️",
    Frame = "⬜",
    TextLabel = "🏷️",
    TextButton = "🔘",
    TextBox = "📝",
    ImageLabel = "🖼️",
    ImageButton = "🖱️",
    ScrollingFrame = "📜",
    ViewportFrame = "🎬",
    UIListLayout = "📋",
    UIGridLayout = "🔲",
    UIPadding = "📏",
    UICorner = "◐",
    UIStroke = "🖊️",
    Decal = "🎨",
    Texture = "🧱",
    SpawnLocation = "🚩",
    Seat = "🪑",
    VehicleSeat = "🚗",
    ClickDetector = "👆",
    ProximityPrompt = "💬",
    Attachment = "📍",
    Motor6D = "⚙️",
    Weld = "🔩",
    WeldConstraint = "🔗",
    Highlight = "💡",
    SurfaceLight = "💡",
    PointLight = "💡",
    SpotLight = "🔦",
    Configuration = "⚙️",
    StringValue = "📝",
    NumberValue = "#️⃣",
    IntValue = "🔢",
    BoolValue = "✅",
    ObjectValue = "🔗",
    CFrameValue = "📐",
    Vector3Value = "➡️",
    Color3Value = "🎨",
    Terrain = "🏔️",
    default = "📦",
}

--// Utility Functions
local function Tween(object, properties, duration, style, direction)
    local tweenInfo = TweenInfo.new(
        duration or Theme.Animation.Normal,
        style or Enum.EasingStyle.Quart,
        direction or Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(object, tweenInfo, properties)
    tween:Play()
    return tween
end

local function CreateCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = radius or Theme.Corners.Panel
    corner.Parent = parent
    return corner
end

local function CreateStroke(parent, color, thickness, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Theme.Colors.SurfaceHover
    stroke.Thickness = thickness or 1
    stroke.Transparency = transparency or 0.5
    stroke.Parent = parent
    return stroke
end

local function CreatePadding(parent, top, right, bottom, left)
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, top or 0)
    padding.PaddingRight = UDim.new(0, right or top or 0)
    padding.PaddingBottom = UDim.new(0, bottom or top or 0)
    padding.PaddingLeft = UDim.new(0, left or right or top or 0)
    padding.Parent = parent
    return padding
end

local function GetClassIcon(className)
    return ClassIcons[className] or ClassIcons.default
end

local function GetClassColor(className)
    local colors = Theme.Colors
    if className == "Folder" then return colors.Folder
    elseif className == "Script" then return colors.Script
    elseif className == "LocalScript" then return colors.LocalScript
    elseif className == "ModuleScript" then return colors.ModuleScript
    elseif className == "RemoteEvent" then return colors.RemoteEvent
    elseif className == "RemoteFunction" then return colors.RemoteFunction
    elseif className == "BindableEvent" or className == "BindableFunction" then return colors.BindableEvent
    elseif className == "Model" then return colors.Model
    elseif className:find("Part") or className == "UnionOperation" or className == "MeshPart" then return colors.Part
    else return colors.TextDim
    end
end

local function GetInstancePath(instance)
    local path = {}
    local current = instance
    while current and current ~= game do
        table.insert(path, 1, current.Name)
        current = current.Parent
    end
    
    local result = "game"
    for i, name in ipairs(path) do
        if name:match("^[%a_][%w_]*$") then
            result = result .. "." .. name
        else
            result = result .. '["' .. name:gsub('"', '\\"') .. '"]'
        end
    end
    return result
end

local function SafeCall(func, ...)
    local success, result = pcall(func, ...)
    return success, result
end

local function FormatValue(value)
    local valueType = typeof(value)
    if valueType == "string" then
        return '"' .. value:sub(1, 100) .. (value:len() > 100 and "..." or "") .. '"'
    elseif valueType == "Instance" then
        return value:GetFullName()
    elseif valueType == "Color3" then
        return string.format("Color3.fromRGB(%d, %d, %d)", 
            math.floor(value.R * 255), 
            math.floor(value.G * 255), 
            math.floor(value.B * 255))
    elseif valueType == "Vector3" then
        return string.format("Vector3.new(%.2f, %.2f, %.2f)", value.X, value.Y, value.Z)
    elseif valueType == "Vector2" then
        return string.format("Vector2.new(%.2f, %.2f)", value.X, value.Y)
    elseif valueType == "CFrame" then
        local x, y, z = value.X, value.Y, value.Z
        return string.format("CFrame.new(%.2f, %.2f, %.2f, ...)", x, y, z)
    elseif valueType == "UDim" then
        return string.format("UDim.new(%.2f, %d)", value.Scale, value.Offset)
    elseif valueType == "UDim2" then
        return string.format("UDim2.new(%.2f, %d, %.2f, %d)", 
            value.X.Scale, value.X.Offset, value.Y.Scale, value.Y.Offset)
    elseif valueType == "BrickColor" then
        return 'BrickColor.new("' .. tostring(value) .. '")'
    elseif valueType == "EnumItem" then
        return tostring(value)
    elseif valueType == "table" then
        return "{...}"
    elseif valueType == "function" then
        return "function()"
    elseif valueType == "nil" then
        return "nil"
    else
        return tostring(value)
    end
end

--// Destroy existing
if CoreGui:FindFirstChild("FamyyDex") then
    CoreGui:FindFirstChild("FamyyDex"):Destroy()
end

--// Create Main GUI
local FamyyDex = Instance.new("ScreenGui")
FamyyDex.Name = "FamyyDex"
FamyyDex.ResetOnSpawn = false
FamyyDex.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
FamyyDex.DisplayOrder = 999999
FamyyDex.Parent = CoreGui

--// State Management
local State = {
    SelectedInstance = nil,
    ExpandedNodes = {},
    Favorites = {},
    SearchQuery = "",
    SearchFilter = "all", -- all, class, name, property
    RemoteSpyEnabled = false,
    RemoteLogs = {},
    MaxRemoteLogs = 500,
    VirtualScrollOffset = 0,
    VisibleItems = {},
    AllItems = {},
    PropertyEditing = nil,
    Connections = {},
    DragOffset = nil,
    IsDragging = false,
    IsResizing = false,
    ActivePanel = "explorer", -- explorer, properties, remotes, scripts, search
    MinimizedPanels = {},
    Bookmarks = {},
    PropertyFilters = {
        showHidden = false,
        showReadOnly = true,
        showDeprecated = false,
    },
}

--// Main Window
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 900, 0, 600)
MainFrame.Position = UDim2.new(0.5, -450, 0.5, -300)
MainFrame.BackgroundColor3 = Theme.Colors.Background
MainFrame.BorderSizePixel = 0
MainFrame.Parent = FamyyDex
CreateCorner(MainFrame, Theme.Corners.Window)
CreateStroke(MainFrame, Theme.Colors.Accent, 1.5, 0.7)

-- Glow Effect
local Glow = Instance.new("ImageLabel")
Glow.Name = "Glow"
Glow.Size = UDim2.new(1, 60, 1, 60)
Glow.Position = UDim2.new(0, -30, 0, -30)
Glow.BackgroundTransparency = 1
Glow.Image = "rbxassetid://5028857084"
Glow.ImageColor3 = Theme.Colors.AccentGlow
Glow.ImageTransparency = 0.85
Glow.ScaleType = Enum.ScaleType.Slice
Glow.SliceCenter = Rect.new(24, 24, 276, 276)
Glow.ZIndex = -1
Glow.Parent = MainFrame

--// Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Theme.Colors.Surface
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame
CreateCorner(TitleBar, Theme.Corners.Window)

-- Fix corner at bottom
local TitleBarFix = Instance.new("Frame")
TitleBarFix.Name = "Fix"
TitleBarFix.Size = UDim2.new(1, 0, 0, 15)
TitleBarFix.Position = UDim2.new(0, 0, 1, -15)
TitleBarFix.BackgroundColor3 = Theme.Colors.Surface
TitleBarFix.BorderSizePixel = 0
TitleBarFix.Parent = TitleBar

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "⚡ FAMYYDEX"
Title.Font = Theme.Fonts.Title
Title.TextSize = Theme.TextSizes.Title
Title.TextColor3 = Theme.Colors.Accent
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

-- Version Badge
local VersionBadge = Instance.new("TextLabel")
VersionBadge.Name = "Version"
VersionBadge.Size = UDim2.new(0, 40, 0, 18)
VersionBadge.Position = UDim2.new(0, 120, 0.5, -9)
VersionBadge.BackgroundColor3 = Theme.Colors.Accent
VersionBadge.Text = "v1.0"
VersionBadge.Font = Theme.Fonts.Caption
VersionBadge.TextSize = Theme.TextSizes.Tiny
VersionBadge.TextColor3 = Theme.Colors.Text
VersionBadge.Parent = TitleBar
CreateCorner(VersionBadge, Theme.Corners.Small)

-- Window Controls Container
local WindowControls = Instance.new("Frame")
WindowControls.Name = "Controls"
WindowControls.Size = UDim2.new(0, 90, 0, 30)
WindowControls.Position = UDim2.new(1, -100, 0.5, -15)
WindowControls.BackgroundTransparency = 1
WindowControls.Parent = TitleBar

local ControlsLayout = Instance.new("UIListLayout")
ControlsLayout.FillDirection = Enum.FillDirection.Horizontal
ControlsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
ControlsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
ControlsLayout.Padding = UDim.new(0, 8)
ControlsLayout.Parent = WindowControls

-- Minimize Button
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "Minimize"
MinimizeBtn.Size = UDim2.new(0, 24, 0, 24)
MinimizeBtn.BackgroundColor3 = Theme.Colors.Warning
MinimizeBtn.Text = "−"
MinimizeBtn.Font = Theme.Fonts.Header
MinimizeBtn.TextSize = 18
MinimizeBtn.TextColor3 = Theme.Colors.Background
MinimizeBtn.Parent = WindowControls
CreateCorner(MinimizeBtn, Theme.Corners.Small)

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "Close"
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.BackgroundColor3 = Theme.Colors.Error
CloseBtn.Text = "×"
CloseBtn.Font = Theme.Fonts.Header
CloseBtn.TextSize = 18
CloseBtn.TextColor3 = Theme.Colors.Background
CloseBtn.Parent = WindowControls
CreateCorner(CloseBtn, Theme.Corners.Small)

--// Tab Bar
local TabBar = Instance.new("Frame")
TabBar.Name = "TabBar"
TabBar.Size = UDim2.new(1, 0, 0, 36)
TabBar.Position = UDim2.new(0, 0, 0, 40)
TabBar.BackgroundColor3 = Theme.Colors.Surface
TabBar.BorderSizePixel = 0
TabBar.Parent = MainFrame

local TabBarPadding = CreatePadding(TabBar, 4, 10, 4, 10)

local TabBarLayout = Instance.new("UIListLayout")
TabBarLayout.FillDirection = Enum.FillDirection.Horizontal
TabBarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
TabBarLayout.VerticalAlignment = Enum.VerticalAlignment.Center
TabBarLayout.Padding = UDim.new(0, 6)
TabBarLayout.Parent = TabBar

local Tabs = {}
local TabButtons = {}

local function CreateTab(name, icon, id)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Name = id
    TabBtn.Size = UDim2.new(0, 0, 0, 28)
    TabBtn.AutomaticSize = Enum.AutomaticSize.X
    TabBtn.BackgroundColor3 = State.ActivePanel == id and Theme.Colors.Accent or Theme.Colors.Card
    TabBtn.Text = ""
    TabBtn.Parent = TabBar
    CreateCorner(TabBtn, Theme.Corners.Button)
    
    local TabPadding = CreatePadding(TabBtn, 0, 12, 0, 12)
    
    local TabContent = Instance.new("Frame")
    TabContent.Size = UDim2.new(1, 0, 1, 0)
    TabContent.BackgroundTransparency = 1
    TabContent.Parent = TabBtn
    
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.FillDirection = Enum.FillDirection.Horizontal
    TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    TabLayout.Padding = UDim.new(0, 6)
    TabLayout.Parent = TabContent
    
    local TabIcon = Instance.new("TextLabel")
    TabIcon.Size = UDim2.new(0, 16, 0, 16)
    TabIcon.BackgroundTransparency = 1
    TabIcon.Text = icon
    TabIcon.Font = Theme.Fonts.Body
    TabIcon.TextSize = 14
    TabIcon.TextColor3 = State.ActivePanel == id and Theme.Colors.Text or Theme.Colors.TextDim
    TabIcon.Parent = TabContent
    
    local TabLabel = Instance.new("TextLabel")
    TabLabel.Size = UDim2.new(0, 0, 1, 0)
    TabLabel.AutomaticSize = Enum.AutomaticSize.X
    TabLabel.BackgroundTransparency = 1
    TabLabel.Text = name
    TabLabel.Font = Theme.Fonts.Body
    TabLabel.TextSize = Theme.TextSizes.Body
    TabLabel.TextColor3 = State.ActivePanel == id and Theme.Colors.Text or Theme.Colors.TextDim
    TabLabel.Parent = TabContent
    
    TabButtons[id] = {Button = TabBtn, Icon = TabIcon, Label = TabLabel}
    
    TabBtn.MouseEnter:Connect(function()
        if State.ActivePanel ~= id then
            Tween(TabBtn, {BackgroundColor3 = Theme.Colors.CardHover}, Theme.Animation.Fast)
        end
    end)
    
    TabBtn.MouseLeave:Connect(function()
        if State.ActivePanel ~= id then
            Tween(TabBtn, {BackgroundColor3 = Theme.Colors.Card}, Theme.Animation.Fast)
        end
    end)
    
    TabBtn.MouseButton1Click:Connect(function()
        State.ActivePanel = id
        for tabId, tabData in pairs(TabButtons) do
            local isActive = tabId == id
            Tween(tabData.Button, {BackgroundColor3 = isActive and Theme.Colors.Accent or Theme.Colors.Card}, Theme.Animation.Fast)
            Tween(tabData.Icon, {TextColor3 = isActive and Theme.Colors.Text or Theme.Colors.TextDim}, Theme.Animation.Fast)
            Tween(tabData.Label, {TextColor3 = isActive and Theme.Colors.Text or Theme.Colors.TextDim}, Theme.Animation.Fast)
        end
        
        for _, panel in pairs(Tabs) do
            panel.Visible = false
        end
        if Tabs[id] then
            Tabs[id].Visible = true
        end
    end)
    
    return TabBtn
end

CreateTab("Explorer", "🌲", "explorer")
CreateTab("Properties", "📋", "properties")
CreateTab("Remotes", "📡", "remotes")
CreateTab("Scripts", "📜", "scripts")
CreateTab("Search", "🔍", "search")
CreateTab("Nil", "👻", "nil")

--// Content Area
local ContentArea = Instance.new("Frame")
ContentArea.Name = "Content"
ContentArea.Size = UDim2.new(1, -20, 1, -96)
ContentArea.Position = UDim2.new(0, 10, 0, 86)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

--// Explorer Panel
local ExplorerPanel = Instance.new("Frame")
ExplorerPanel.Name = "Explorer"
ExplorerPanel.Size = UDim2.new(0.5, -5, 1, 0)
ExplorerPanel.BackgroundColor3 = Theme.Colors.Surface
ExplorerPanel.BorderSizePixel = 0
ExplorerPanel.Parent = ContentArea
CreateCorner(ExplorerPanel, Theme.Corners.Panel)
Tabs["explorer"] = ExplorerPanel

-- Explorer Header
local ExplorerHeader = Instance.new("Frame")
ExplorerHeader.Name = "Header"
ExplorerHeader.Size = UDim2.new(1, 0, 0, 35)
ExplorerHeader.BackgroundColor3 = Theme.Colors.Card
ExplorerHeader.BorderSizePixel = 0
ExplorerHeader.Parent = ExplorerPanel
CreateCorner(ExplorerHeader, Theme.Corners.Panel)

local ExplorerHeaderFix = Instance.new("Frame")
ExplorerHeaderFix.Size = UDim2.new(1, 0, 0, 10)
ExplorerHeaderFix.Position = UDim2.new(0, 0, 1, -10)
ExplorerHeaderFix.BackgroundColor3 = Theme.Colors.Card
ExplorerHeaderFix.BorderSizePixel = 0
ExplorerHeaderFix.Parent = ExplorerHeader

local ExplorerTitle = Instance.new("TextLabel")
ExplorerTitle.Size = UDim2.new(0, 100, 1, 0)
ExplorerTitle.Position = UDim2.new(0, 12, 0, 0)
ExplorerTitle.BackgroundTransparency = 1
ExplorerTitle.Text = "🌲 Explorer"
ExplorerTitle.Font = Theme.Fonts.Header
ExplorerTitle.TextSize = Theme.TextSizes.Header
ExplorerTitle.TextColor3 = Theme.Colors.Text
ExplorerTitle.TextXAlignment = Enum.TextXAlignment.Left
ExplorerTitle.Parent = ExplorerHeader

-- Refresh Button
local RefreshBtn = Instance.new("TextButton")
RefreshBtn.Name = "Refresh"
RefreshBtn.Size = UDim2.new(0, 24, 0, 24)
RefreshBtn.Position = UDim2.new(1, -35, 0.5, -12)
RefreshBtn.BackgroundColor3 = Theme.Colors.Accent
RefreshBtn.Text = "🔄"
RefreshBtn.Font = Theme.Fonts.Body
RefreshBtn.TextSize = 12
RefreshBtn.TextColor3 = Theme.Colors.Text
RefreshBtn.Parent = ExplorerHeader
CreateCorner(RefreshBtn, Theme.Corners.Small)

-- Explorer Scroll
local ExplorerScroll = Instance.new("ScrollingFrame")
ExplorerScroll.Name = "Scroll"
ExplorerScroll.Size = UDim2.new(1, -10, 1, -45)
ExplorerScroll.Position = UDim2.new(0, 5, 0, 40)
ExplorerScroll.BackgroundTransparency = 1
ExplorerScroll.BorderSizePixel = 0
ExplorerScroll.ScrollBarThickness = 4
ExplorerScroll.ScrollBarImageColor3 = Theme.Colors.Accent
ExplorerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ExplorerScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
ExplorerScroll.Parent = ExplorerPanel

local ExplorerLayout = Instance.new("UIListLayout")
ExplorerLayout.SortOrder = Enum.SortOrder.LayoutOrder
ExplorerLayout.Padding = UDim.new(0, 1)
ExplorerLayout.Parent = ExplorerScroll

--// Properties Panel
local PropertiesPanel = Instance.new("Frame")
PropertiesPanel.Name = "Properties"
PropertiesPanel.Size = UDim2.new(0.5, -5, 1, 0)
PropertiesPanel.Position = UDim2.new(0.5, 5, 0, 0)
PropertiesPanel.BackgroundColor3 = Theme.Colors.Surface
PropertiesPanel.BorderSizePixel = 0
PropertiesPanel.Parent = ContentArea
CreateCorner(PropertiesPanel, Theme.Corners.Panel)
Tabs["properties"] = PropertiesPanel

-- Properties Header
local PropertiesHeader = Instance.new("Frame")
PropertiesHeader.Name = "Header"
PropertiesHeader.Size = UDim2.new(1, 0, 0, 35)
PropertiesHeader.BackgroundColor3 = Theme.Colors.Card
PropertiesHeader.BorderSizePixel = 0
PropertiesHeader.Parent = PropertiesPanel
CreateCorner(PropertiesHeader, Theme.Corners.Panel)

local PropertiesHeaderFix = Instance.new("Frame")
PropertiesHeaderFix.Size = UDim2.new(1, 0, 0, 10)
PropertiesHeaderFix.Position = UDim2.new(0, 0, 1, -10)
PropertiesHeaderFix.BackgroundColor3 = Theme.Colors.Card
PropertiesHeaderFix.BorderSizePixel = 0
PropertiesHeaderFix.Parent = PropertiesHeader

local PropertiesTitle = Instance.new("TextLabel")
PropertiesTitle.Size = UDim2.new(1, -20, 1, 0)
PropertiesTitle.Position = UDim2.new(0, 12, 0, 0)
PropertiesTitle.BackgroundTransparency = 1
PropertiesTitle.Text = "📋 Properties - Select an instance"
PropertiesTitle.Font = Theme.Fonts.Header
PropertiesTitle.TextSize = Theme.TextSizes.Header
PropertiesTitle.TextColor3 = Theme.Colors.Text
PropertiesTitle.TextXAlignment = Enum.TextXAlignment.Left
PropertiesTitle.TextTruncate = Enum.TextTruncate.AtEnd
PropertiesTitle.Parent = PropertiesHeader

-- Properties Scroll
local PropertiesScroll = Instance.new("ScrollingFrame")
PropertiesScroll.Name = "Scroll"
PropertiesScroll.Size = UDim2.new(1, -10, 1, -45)
PropertiesScroll.Position = UDim2.new(0, 5, 0, 40)
PropertiesScroll.BackgroundTransparency = 1
PropertiesScroll.BorderSizePixel = 0
PropertiesScroll.ScrollBarThickness = 4
PropertiesScroll.ScrollBarImageColor3 = Theme.Colors.Accent
PropertiesScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PropertiesScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
PropertiesScroll.Parent = PropertiesPanel

local PropertiesLayout = Instance.new("UIListLayout")
PropertiesLayout.SortOrder = Enum.SortOrder.Name
PropertiesLayout.Padding = UDim.new(0, 2)
PropertiesLayout.Parent = PropertiesScroll

--// Remotes Panel (Full Width)
local RemotesPanel = Instance.new("Frame")
RemotesPanel.Name = "Remotes"
RemotesPanel.Size = UDim2.new(1, 0, 1, 0)
RemotesPanel.BackgroundColor3 = Theme.Colors.Surface
RemotesPanel.BorderSizePixel = 0
RemotesPanel.Visible = false
RemotesPanel.Parent = ContentArea
CreateCorner(RemotesPanel, Theme.Corners.Panel)
Tabs["remotes"] = RemotesPanel

-- Remotes Header
local RemotesHeader = Instance.new("Frame")
RemotesHeader.Name = "Header"
RemotesHeader.Size = UDim2.new(1, 0, 0, 35)
RemotesHeader.BackgroundColor3 = Theme.Colors.Card
RemotesHeader.BorderSizePixel = 0
RemotesHeader.Parent = RemotesPanel
CreateCorner(RemotesHeader, Theme.Corners.Panel)

local RemotesHeaderFix = Instance.new("Frame")
RemotesHeaderFix.Size = UDim2.new(1, 0, 0, 10)
RemotesHeaderFix.Position = UDim2.new(0, 0, 1, -10)
RemotesHeaderFix.BackgroundColor3 = Theme.Colors.Card
RemotesHeaderFix.BorderSizePixel = 0
RemotesHeaderFix.Parent = RemotesHeader

local RemotesTitle = Instance.new("TextLabel")
RemotesTitle.Size = UDim2.new(0, 200, 1, 0)
RemotesTitle.Position = UDim2.new(0, 12, 0, 0)
RemotesTitle.BackgroundTransparency = 1
RemotesTitle.Text = "📡 Remote Spy"
RemotesTitle.Font = Theme.Fonts.Header
RemotesTitle.TextSize = Theme.TextSizes.Header
RemotesTitle.TextColor3 = Theme.Colors.Text
RemotesTitle.TextXAlignment = Enum.TextXAlignment.Left
RemotesTitle.Parent = RemotesHeader

-- Remote Spy Toggle
local RemoteSpyToggle = Instance.new("TextButton")
RemoteSpyToggle.Name = "Toggle"
RemoteSpyToggle.Size = UDim2.new(0, 80, 0, 24)
RemoteSpyToggle.Position = UDim2.new(1, -180, 0.5, -12)
RemoteSpyToggle.BackgroundColor3 = Theme.Colors.Error
RemoteSpyToggle.Text = "OFF"
RemoteSpyToggle.Font = Theme.Fonts.Header
RemoteSpyToggle.TextSize = Theme.TextSizes.Caption
RemoteSpyToggle.TextColor3 = Theme.Colors.Text
RemoteSpyToggle.Parent = RemotesHeader
CreateCorner(RemoteSpyToggle, Theme.Corners.Button)

-- Clear Remotes Button
local ClearRemotesBtn = Instance.new("TextButton")
ClearRemotesBtn.Name = "Clear"
ClearRemotesBtn.Size = UDim2.new(0, 70, 0, 24)
ClearRemotesBtn.Position = UDim2.new(1, -90, 0.5, -12)
ClearRemotesBtn.BackgroundColor3 = Theme.Colors.Warning
ClearRemotesBtn.Text = "Clear"
ClearRemotesBtn.Font = Theme.Fonts.Header
ClearRemotesBtn.TextSize = Theme.TextSizes.Caption
ClearRemotesBtn.TextColor3 = Theme.Colors.Background
ClearRemotesBtn.Parent = RemotesHeader
CreateCorner(ClearRemotesBtn, Theme.Corners.Button)

-- Remotes Scroll
local RemotesScroll = Instance.new("ScrollingFrame")
RemotesScroll.Name = "Scroll"
RemotesScroll.Size = UDim2.new(1, -10, 1, -45)
RemotesScroll.Position = UDim2.new(0, 5, 0, 40)
RemotesScroll.BackgroundTransparency = 1
RemotesScroll.BorderSizePixel = 0
RemotesScroll.ScrollBarThickness = 4
RemotesScroll.ScrollBarImageColor3 = Theme.Colors.Accent
RemotesScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
RemotesScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
RemotesScroll.Parent = RemotesPanel

local RemotesLayout = Instance.new("UIListLayout")
RemotesLayout.SortOrder = Enum.SortOrder.LayoutOrder
RemotesLayout.Padding = UDim.new(0, 4)
RemotesLayout.Parent = RemotesScroll

--// Scripts Panel (Full Width)
local ScriptsPanel = Instance.new("Frame")
ScriptsPanel.Name = "Scripts"
ScriptsPanel.Size = UDim2.new(1, 0, 1, 0)
ScriptsPanel.BackgroundColor3 = Theme.Colors.Surface
ScriptsPanel.BorderSizePixel = 0
ScriptsPanel.Visible = false
ScriptsPanel.Parent = ContentArea
CreateCorner(ScriptsPanel, Theme.Corners.Panel)
Tabs["scripts"] = ScriptsPanel

-- Scripts Header
local ScriptsHeader = Instance.new("Frame")
ScriptsHeader.Name = "Header"
ScriptsHeader.Size = UDim2.new(1, 0, 0, 35)
ScriptsHeader.BackgroundColor3 = Theme.Colors.Card
ScriptsHeader.BorderSizePixel = 0
ScriptsHeader.Parent = ScriptsPanel
CreateCorner(ScriptsHeader, Theme.Corners.Panel)

local ScriptsHeaderFix = Instance.new("Frame")
ScriptsHeaderFix.Size = UDim2.new(1, 0, 0, 10)
ScriptsHeaderFix.Position = UDim2.new(0, 0, 1, -10)
ScriptsHeaderFix.BackgroundColor3 = Theme.Colors.Card
ScriptsHeaderFix.BorderSizePixel = 0
ScriptsHeaderFix.Parent = ScriptsHeader

local ScriptsTitle = Instance.new("TextLabel")
ScriptsTitle.Size = UDim2.new(1, -20, 1, 0)
ScriptsTitle.Position = UDim2.new(0, 12, 0, 0)
ScriptsTitle.BackgroundTransparency = 1
ScriptsTitle.Text = "📜 Script Viewer - Select a script to view"
ScriptsTitle.Font = Theme.Fonts.Header
ScriptsTitle.TextSize = Theme.TextSizes.Header
ScriptsTitle.TextColor3 = Theme.Colors.Text
ScriptsTitle.TextXAlignment = Enum.TextXAlignment.Left
ScriptsTitle.TextTruncate = Enum.TextTruncate.AtEnd
ScriptsTitle.Parent = ScriptsHeader

-- Scripts Scroll (Code Viewer)
local ScriptsScroll = Instance.new("ScrollingFrame")
ScriptsScroll.Name = "Scroll"
ScriptsScroll.Size = UDim2.new(1, -10, 1, -45)
ScriptsScroll.Position = UDim2.new(0, 5, 0, 40)
ScriptsScroll.BackgroundColor3 = Theme.Colors.Background
ScriptsScroll.BorderSizePixel = 0
ScriptsScroll.ScrollBarThickness = 4
ScriptsScroll.ScrollBarImageColor3 = Theme.Colors.Accent
ScriptsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ScriptsScroll.AutomaticCanvasSize = Enum.AutomaticSize.XY
ScriptsScroll.Parent = ScriptsPanel
CreateCorner(ScriptsScroll, Theme.Corners.Small)

local ScriptCode = Instance.new("TextLabel")
ScriptCode.Name = "Code"
ScriptCode.Size = UDim2.new(1, -20, 0, 0)
ScriptCode.Position = UDim2.new(0, 10, 0, 10)
ScriptCode.AutomaticSize = Enum.AutomaticSize.Y
ScriptCode.BackgroundTransparency = 1
ScriptCode.Text = "-- Select a script from Explorer to view its source"
ScriptCode.Font = Theme.Fonts.Code
ScriptCode.TextSize = Theme.TextSizes.Body
ScriptCode.TextColor3 = Theme.Colors.TextDim
ScriptCode.TextXAlignment = Enum.TextXAlignment.Left
ScriptCode.TextYAlignment = Enum.TextYAlignment.Top
ScriptCode.TextWrapped = true
ScriptCode.RichText = true
ScriptCode.Parent = ScriptsScroll

--// Search Panel (Full Width)
local SearchPanel = Instance.new("Frame")
SearchPanel.Name = "Search"
SearchPanel.Size = UDim2.new(1, 0, 1, 0)
SearchPanel.BackgroundColor3 = Theme.Colors.Surface
SearchPanel.BorderSizePixel = 0
SearchPanel.Visible = false
SearchPanel.Parent = ContentArea
CreateCorner(SearchPanel, Theme.Corners.Panel)
Tabs["search"] = SearchPanel

-- Search Header with Input
local SearchHeader = Instance.new("Frame")
SearchHeader.Name = "Header"
SearchHeader.Size = UDim2.new(1, 0, 0, 70)
SearchHeader.BackgroundColor3 = Theme.Colors.Card
SearchHeader.BorderSizePixel = 0
SearchHeader.Parent = SearchPanel
CreateCorner(SearchHeader, Theme.Corners.Panel)

local SearchHeaderFix = Instance.new("Frame")
SearchHeaderFix.Size = UDim2.new(1, 0, 0, 10)
SearchHeaderFix.Position = UDim2.new(0, 0, 1, -10)
SearchHeaderFix.BackgroundColor3 = Theme.Colors.Card
SearchHeaderFix.BorderSizePixel = 0
SearchHeaderFix.Parent = SearchHeader

local SearchTitle = Instance.new("TextLabel")
SearchTitle.Size = UDim2.new(0, 150, 0, 30)
SearchTitle.Position = UDim2.new(0, 12, 0, 5)
SearchTitle.BackgroundTransparency = 1
SearchTitle.Text = "🔍 Advanced Search"
SearchTitle.Font = Theme.Fonts.Header
SearchTitle.TextSize = Theme.TextSizes.Header
SearchTitle.TextColor3 = Theme.Colors.Text
SearchTitle.TextXAlignment = Enum.TextXAlignment.Left
SearchTitle.Parent = SearchHeader

-- Search Input
local SearchInputBg = Instance.new("Frame")
SearchInputBg.Name = "InputBg"
SearchInputBg.Size = UDim2.new(1, -24, 0, 28)
SearchInputBg.Position = UDim2.new(0, 12, 0, 35)
SearchInputBg.BackgroundColor3 = Theme.Colors.Background
SearchInputBg.Parent = SearchHeader
CreateCorner(SearchInputBg, Theme.Corners.Button)
CreateStroke(SearchInputBg, Theme.Colors.Accent, 1, 0.7)

local SearchInput = Instance.new("TextBox")
SearchInput.Name = "Input"
SearchInput.Size = UDim2.new(1, -80, 1, 0)
SearchInput.Position = UDim2.new(0, 10, 0, 0)
SearchInput.BackgroundTransparency = 1
SearchInput.Text = ""
SearchInput.PlaceholderText = "Search instances by name, class, or property..."
SearchInput.Font = Theme.Fonts.Body
SearchInput.TextSize = Theme.TextSizes.Body
SearchInput.TextColor3 = Theme.Colors.Text
SearchInput.PlaceholderColor3 = Theme.Colors.TextMuted
SearchInput.TextXAlignment = Enum.TextXAlignment.Left
SearchInput.ClearTextOnFocus = false
SearchInput.Parent = SearchInputBg

-- Search Button
local SearchBtn = Instance.new("TextButton")
SearchBtn.Name = "SearchBtn"
SearchBtn.Size = UDim2.new(0, 60, 0, 22)
SearchBtn.Position = UDim2.new(1, -65, 0.5, -11)
SearchBtn.BackgroundColor3 = Theme.Colors.Accent
SearchBtn.Text = "Search"
SearchBtn.Font = Theme.Fonts.Header
SearchBtn.TextSize = Theme.TextSizes.Caption
SearchBtn.TextColor3 = Theme.Colors.Text
SearchBtn.Parent = SearchInputBg
CreateCorner(SearchBtn, Theme.Corners.Small)

-- Search Results Scroll
local SearchScroll = Instance.new("ScrollingFrame")
SearchScroll.Name = "Scroll"
SearchScroll.Size = UDim2.new(1, -10, 1, -80)
SearchScroll.Position = UDim2.new(0, 5, 0, 75)
SearchScroll.BackgroundTransparency = 1
SearchScroll.BorderSizePixel = 0
SearchScroll.ScrollBarThickness = 4
SearchScroll.ScrollBarImageColor3 = Theme.Colors.Accent
SearchScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
SearchScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
SearchScroll.Parent = SearchPanel

local SearchLayout = Instance.new("UIListLayout")
SearchLayout.SortOrder = Enum.SortOrder.LayoutOrder
SearchLayout.Padding = UDim.new(0, 2)
SearchLayout.Parent = SearchScroll

--// Nil Instances Panel (Full Width)
local NilPanel = Instance.new("Frame")
NilPanel.Name = "Nil"
NilPanel.Size = UDim2.new(1, 0, 1, 0)
NilPanel.BackgroundColor3 = Theme.Colors.Surface
NilPanel.BorderSizePixel = 0
NilPanel.Visible = false
NilPanel.Parent = ContentArea
CreateCorner(NilPanel, Theme.Corners.Panel)
Tabs["nil"] = NilPanel

-- Nil Header
local NilHeader = Instance.new("Frame")
NilHeader.Name = "Header"
NilHeader.Size = UDim2.new(1, 0, 0, 35)
NilHeader.BackgroundColor3 = Theme.Colors.Card
NilHeader.BorderSizePixel = 0
NilHeader.Parent = NilPanel
CreateCorner(NilHeader, Theme.Corners.Panel)

local NilHeaderFix = Instance.new("Frame")
NilHeaderFix.Size = UDim2.new(1, 0, 0, 10)
NilHeaderFix.Position = UDim2.new(0, 0, 1, -10)
NilHeaderFix.BackgroundColor3 = Theme.Colors.Card
NilHeaderFix.BorderSizePixel = 0
NilHeaderFix.Parent = NilHeader

local NilTitle = Instance.new("TextLabel")
NilTitle.Size = UDim2.new(0, 200, 1, 0)
NilTitle.Position = UDim2.new(0, 12, 0, 0)
NilTitle.BackgroundTransparency = 1
NilTitle.Text = "👻 Nil/Hidden Instances"
NilTitle.Font = Theme.Fonts.Header
NilTitle.TextSize = Theme.TextSizes.Header
NilTitle.TextColor3 = Theme.Colors.Text
NilTitle.TextXAlignment = Enum.TextXAlignment.Left
NilTitle.Parent = NilHeader

-- Scan Button
local ScanNilBtn = Instance.new("TextButton")
ScanNilBtn.Name = "Scan"
ScanNilBtn.Size = UDim2.new(0, 80, 0, 24)
ScanNilBtn.Position = UDim2.new(1, -95, 0.5, -12)
ScanNilBtn.BackgroundColor3 = Theme.Colors.Accent
ScanNilBtn.Text = "🔍 Scan"
ScanNilBtn.Font = Theme.Fonts.Header
ScanNilBtn.TextSize = Theme.TextSizes.Caption
ScanNilBtn.TextColor3 = Theme.Colors.Text
ScanNilBtn.Parent = NilHeader
CreateCorner(ScanNilBtn, Theme.Corners.Button)

-- Nil Scroll
local NilScroll = Instance.new("ScrollingFrame")
NilScroll.Name = "Scroll"
NilScroll.Size = UDim2.new(1, -10, 1, -45)
NilScroll.Position = UDim2.new(0, 5, 0, 40)
NilScroll.BackgroundTransparency = 1
NilScroll.BorderSizePixel = 0
NilScroll.ScrollBarThickness = 4
NilScroll.ScrollBarImageColor3 = Theme.Colors.Accent
NilScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
NilScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
NilScroll.Parent = NilPanel

local NilLayout = Instance.new("UIListLayout")
NilLayout.SortOrder = Enum.SortOrder.LayoutOrder
NilLayout.Padding = UDim.new(0, 2)
NilLayout.Parent = NilScroll

--// Context Menu
local ContextMenu = Instance.new("Frame")
ContextMenu.Name = "ContextMenu"
ContextMenu.Size = UDim2.new(0, 180, 0, 0)
ContextMenu.AutomaticSize = Enum.AutomaticSize.Y
ContextMenu.BackgroundColor3 = Theme.Colors.Surface
ContextMenu.BorderSizePixel = 0
ContextMenu.Visible = false
ContextMenu.ZIndex = 100
ContextMenu.Parent = FamyyDex
CreateCorner(ContextMenu, Theme.Corners.Panel)
CreateStroke(ContextMenu, Theme.Colors.Accent, 1, 0.5)

local ContextLayout = Instance.new("UIListLayout")
ContextLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContextLayout.Padding = UDim.new(0, 2)
ContextLayout.Parent = ContextMenu

local ContextPadding = CreatePadding(ContextMenu, 5, 5, 5, 5)

local function CreateContextItem(text, icon, callback)
    local Item = Instance.new("TextButton")
    Item.Size = UDim2.new(1, 0, 0, 28)
    Item.BackgroundColor3 = Theme.Colors.Card
    Item.Text = ""
    Item.ZIndex = 101
    Item.Parent = ContextMenu
    CreateCorner(Item, Theme.Corners.Small)
    
    local ItemIcon = Instance.new("TextLabel")
    ItemIcon.Size = UDim2.new(0, 24, 1, 0)
    ItemIcon.Position = UDim2.new(0, 5, 0, 0)
    ItemIcon.BackgroundTransparency = 1
    ItemIcon.Text = icon
    ItemIcon.Font = Theme.Fonts.Body
    ItemIcon.TextSize = 12
    ItemIcon.TextColor3 = Theme.Colors.TextDim
    ItemIcon.ZIndex = 101
    ItemIcon.Parent = Item
    
    local ItemLabel = Instance.new("TextLabel")
    ItemLabel.Size = UDim2.new(1, -35, 1, 0)
    ItemLabel.Position = UDim2.new(0, 30, 0, 0)
    ItemLabel.BackgroundTransparency = 1
    ItemLabel.Text = text
    ItemLabel.Font = Theme.Fonts.Body
    ItemLabel.TextSize = Theme.TextSizes.Body
    ItemLabel.TextColor3 = Theme.Colors.Text
    ItemLabel.TextXAlignment = Enum.TextXAlignment.Left
    ItemLabel.ZIndex = 101
    ItemLabel.Parent = Item
    
    Item.MouseEnter:Connect(function()
        Tween(Item, {BackgroundColor3 = Theme.Colors.CardHover}, Theme.Animation.Fast)
    end)
    
    Item.MouseLeave:Connect(function()
        Tween(Item, {BackgroundColor3 = Theme.Colors.Card}, Theme.Animation.Fast)
    end)
    
    Item.MouseButton1Click:Connect(function()
        ContextMenu.Visible = false
        if callback then callback() end
    end)
    
    return Item
end

--// Status Bar
local StatusBar = Instance.new("Frame")
StatusBar.Name = "StatusBar"
StatusBar.Size = UDim2.new(1, 0, 0, 22)
StatusBar.Position = UDim2.new(0, 0, 1, -22)
StatusBar.BackgroundColor3 = Theme.Colors.Surface
StatusBar.BorderSizePixel = 0
StatusBar.Parent = MainFrame
CreateCorner(StatusBar, Theme.Corners.Window)

local StatusBarFix = Instance.new("Frame")
StatusBarFix.Size = UDim2.new(1, 0, 0, 10)
StatusBarFix.Position = UDim2.new(0, 0, 0, 0)
StatusBarFix.BackgroundColor3 = Theme.Colors.Surface
StatusBarFix.BorderSizePixel = 0
StatusBarFix.Parent = StatusBar

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -20, 1, 0)
StatusText.Position = UDim2.new(0, 10, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Ready | Keybind: RightShift"
StatusText.Font = Theme.Fonts.Caption
StatusText.TextSize = Theme.TextSizes.Small
StatusText.TextColor3 = Theme.Colors.TextMuted
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = StatusBar

local MemoryText = Instance.new("TextLabel")
MemoryText.Size = UDim2.new(0, 150, 1, 0)
MemoryText.Position = UDim2.new(1, -160, 0, 0)
MemoryText.BackgroundTransparency = 1
MemoryText.Text = "Mem: 0 MB"
MemoryText.Font = Theme.Fonts.Caption
MemoryText.TextSize = Theme.TextSizes.Small
MemoryText.TextColor3 = Theme.Colors.TextMuted
MemoryText.TextXAlignment = Enum.TextXAlignment.Right
MemoryText.Parent = StatusBar

--// Explorer Functions
local function CreateExplorerNode(instance, depth)
    depth = depth or 0
    
    local Node = Instance.new("Frame")
    Node.Name = instance.Name
    Node.Size = UDim2.new(1, 0, 0, 22)
    Node.BackgroundColor3 = Theme.Colors.Surface
    Node.BackgroundTransparency = 1
    Node.BorderSizePixel = 0
    
    local NodeBtn = Instance.new("TextButton")
    NodeBtn.Size = UDim2.new(1, -(depth * 16), 0, 22)
    NodeBtn.Position = UDim2.new(0, depth * 16, 0, 0)
    NodeBtn.BackgroundColor3 = Theme.Colors.Card
    NodeBtn.BackgroundTransparency = 1
    NodeBtn.Text = ""
    NodeBtn.Parent = Node
    
    -- Expand Arrow
    local hasChildren = #instance:GetChildren() > 0
    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.new(0, 16, 1, 0)
    Arrow.Position = UDim2.new(0, 2, 0, 0)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = hasChildren and "▶" or ""
    Arrow.Font = Theme.Fonts.Caption
    Arrow.TextSize = 10
    Arrow.TextColor3 = Theme.Colors.TextMuted
    Arrow.Parent = NodeBtn
    
    -- Icon
    local Icon = Instance.new("TextLabel")
    Icon.Size = UDim2.new(0, 18, 1, 0)
    Icon.Position = UDim2.new(0, 18, 0, 0)
    Icon.BackgroundTransparency = 1
    Icon.Text = GetClassIcon(instance.ClassName)
    Icon.Font = Theme.Fonts.Body
    Icon.TextSize = 12
    Icon.TextColor3 = GetClassColor(instance.ClassName)
    Icon.Parent = NodeBtn
    
    -- Name
    local Name = Instance.new("TextLabel")
    Name.Size = UDim2.new(1, -45, 1, 0)
    Name.Position = UDim2.new(0, 38, 0, 0)
    Name.BackgroundTransparency = 1
    Name.Text = instance.Name
    Name.Font = Theme.Fonts.Body
    Name.TextSize = Theme.TextSizes.Body
    Name.TextColor3 = Theme.Colors.Text
    Name.TextXAlignment = Enum.TextXAlignment.Left
    Name.TextTruncate = Enum.TextTruncate.AtEnd
    Name.Parent = NodeBtn
    
    -- Class Name (dimmed)
    local ClassName = Instance.new("TextLabel")
    ClassName.Size = UDim2.new(0, 80, 1, 0)
    ClassName.Position = UDim2.new(1, -85, 0, 0)
    ClassName.BackgroundTransparency = 1
    ClassName.Text = instance.ClassName
    ClassName.Font = Theme.Fonts.Caption
    ClassName.TextSize = Theme.TextSizes.Tiny
    ClassName.TextColor3 = Theme.Colors.TextMuted
    ClassName.TextXAlignment = Enum.TextXAlignment.Right
    ClassName.TextTruncate = Enum.TextTruncate.AtEnd
    ClassName.Parent = NodeBtn
    
    -- Child container
    local ChildContainer = Instance.new("Frame")
    ChildContainer.Name = "Children"
    ChildContainer.Size = UDim2.new(1, 0, 0, 0)
    ChildContainer.AutomaticSize = Enum.AutomaticSize.Y
    ChildContainer.BackgroundTransparency = 1
    ChildContainer.Visible = false
    ChildContainer.LayoutOrder = 1
    ChildContainer.Parent = Node
    
    local ChildLayout = Instance.new("UIListLayout")
    ChildLayout.SortOrder = Enum.SortOrder.Name
    ChildLayout.Padding = UDim.new(0, 1)
    ChildLayout.Parent = ChildContainer
    
    Node.AutomaticSize = Enum.AutomaticSize.Y
    
    -- Hover Effect
    NodeBtn.MouseEnter:Connect(function()
        Tween(NodeBtn, {BackgroundTransparency = 0, BackgroundColor3 = Theme.Colors.CardHover}, Theme.Animation.Fast)
    end)
    
    NodeBtn.MouseLeave:Connect(function()
        if State.SelectedInstance ~= instance then
            Tween(NodeBtn, {BackgroundTransparency = 1}, Theme.Animation.Fast)
        else
            Tween(NodeBtn, {BackgroundColor3 = Theme.Colors.SelectedBg}, Theme.Animation.Fast)
        end
    end)
    
    -- Click to Select
    NodeBtn.MouseButton1Click:Connect(function()
        -- Update previous selection
        if State.SelectedNode then
            Tween(State.SelectedNode, {BackgroundTransparency = 1}, Theme.Animation.Fast)
        end
        
        State.SelectedInstance = instance
        State.SelectedNode = NodeBtn
        
        Tween(NodeBtn, {BackgroundTransparency = 0, BackgroundColor3 = Theme.Colors.SelectedBg}, Theme.Animation.Fast)
        
        -- Update properties panel
        PropertiesTitle.Text = "📋 " .. instance.ClassName .. " - " .. instance.Name
        UpdateProperties(instance)
        
        -- Update script viewer if it's a script
        if instance:IsA("LuaSourceContainer") then
            local success, source = pcall(function()
                if decompile then
                    return decompile(instance)
                else
                    return "-- Decompile function not available"
                end
            end)
            
            if success then
                ScriptsTitle.Text = "📜 " .. instance.Name
                ScriptCode.Text = source
            else
                ScriptCode.Text = "-- Failed to decompile: " .. tostring(source)
            end
        end
        
        StatusText.Text = "Selected: " .. GetInstancePath(instance)
    end)
    
    -- Double Click to Expand/Collapse
    local lastClick = 0
    NodeBtn.MouseButton1Click:Connect(function()
        local now = tick()
        if now - lastClick < 0.3 then
            local isExpanded = State.ExpandedNodes[instance]
            State.ExpandedNodes[instance] = not isExpanded
            
            if State.ExpandedNodes[instance] then
                Arrow.Text = hasChildren and "▼" or ""
                ChildContainer.Visible = true
                
                -- Load children if not already loaded
                if #ChildContainer:GetChildren() <= 1 then
                    local children = instance:GetChildren()
                    table.sort(children, function(a, b)
                        return a.Name:lower() < b.Name:lower()
                    end)
                    for _, child in ipairs(children) do
                        local childNode = CreateExplorerNode(child, depth + 1)
                        childNode.Parent = ChildContainer
                    end
                end
            else
                Arrow.Text = hasChildren and "▶" or ""
                ChildContainer.Visible = false
            end
        end
        lastClick = now
    end)
    
    -- Right Click Context Menu
    NodeBtn.MouseButton2Click:Connect(function()
        -- Clear existing context items
        for _, child in ipairs(ContextMenu:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        CreateContextItem("Copy Path", "📋", function()
            if setclipboard then
                setclipboard(GetInstancePath(instance))
            end
            StatusText.Text = "Copied path to clipboard"
        end)
        
        CreateContextItem("Copy Reference", "📝", function()
            local path = GetInstancePath(instance)
            local code = "local " .. instance.Name:gsub("%s+", "_"):gsub("[^%w_]", "") .. " = " .. path
            if setclipboard then
                setclipboard(code)
            end
            StatusText.Text = "Copied reference code"
        end)
        
        CreateContextItem("Clone", "📦", function()
            local success, clone = pcall(function()
                return instance:Clone()
            end)
            if success and clone then
                clone.Parent = instance.Parent
                StatusText.Text = "Cloned " .. instance.Name
            else
                StatusText.Text = "Failed to clone"
            end
        end)
        
        CreateContextItem("Destroy", "🗑️", function()
            local name = instance.Name
            pcall(function()
                instance:Destroy()
            end)
            Node:Destroy()
            StatusText.Text = "Destroyed " .. name
        end)
        
        if instance:IsA("BasePart") or instance:IsA("Model") then
            CreateContextItem("Teleport To", "🚀", function()
                local character = Player.Character
                if character then
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        if instance:IsA("Model") then
                            local primaryPart = instance.PrimaryPart or instance:FindFirstChildWhichIsA("BasePart")
                            if primaryPart then
                                hrp.CFrame = primaryPart.CFrame + Vector3.new(0, 5, 0)
                            end
                        else
                            hrp.CFrame = instance.CFrame + Vector3.new(0, 5, 0)
                        end
                        StatusText.Text = "Teleported to " .. instance.Name
                    end
                end
            end)
        end
        
        if instance:IsA("LuaSourceContainer") then
            CreateContextItem("View Source", "📜", function()
                State.ActivePanel = "scripts"
                for tabId, tabData in pairs(TabButtons) do
                    local isActive = tabId == "scripts"
                    Tween(tabData.Button, {BackgroundColor3 = isActive and Theme.Colors.Accent or Theme.Colors.Card}, Theme.Animation.Fast)
                end
                for _, panel in pairs(Tabs) do
                    panel.Visible = false
                end
                Tabs["scripts"].Visible = true
                
                local success, source = pcall(function()
                    if decompile then
                        return decompile(instance)
                    else
                        return "-- Decompile function not available"
                    end
                end)
                
                if success then
                    ScriptsTitle.Text = "📜 " .. instance.Name
                    ScriptCode.Text = source
                else
                    ScriptCode.Text = "-- Failed to decompile: " .. tostring(source)
                end
            end)
            
            CreateContextItem("Save Script", "💾", function()
                local success, source = pcall(function()
                    if decompile then
                        return decompile(instance)
                    end
                end)
                
                if success and writefile then
                    local filename = instance.Name:gsub("[^%w_]", "_") .. ".lua"
                    writefile("FamyyDex/" .. filename, source)
                    StatusText.Text = "Saved to FamyyDex/" .. filename
                end
            end)
        end
        
        CreateContextItem("Add to Favorites", "⭐", function()
            State.Favorites[instance] = true
            StatusText.Text = "Added " .. instance.Name .. " to favorites"
        end)
        
        -- Position context menu at mouse
        local mousePos = UserInputService:GetMouseLocation()
        ContextMenu.Position = UDim2.new(0, mousePos.X, 0, mousePos.Y - 36)
        ContextMenu.Visible = true
    end)
    
    return Node
end

local function UpdateProperties(instance)
    -- Clear existing properties
    for _, child in ipairs(PropertiesScroll:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    if not instance then return end
    
    -- Get properties
    local properties = {}
    local success, result = pcall(function()
        -- Common properties to show
        local commonProps = {
            "Name", "ClassName", "Parent", "Archivable",
            -- Transform
            "Position", "Size", "CFrame", "Orientation", "Rotation",
            -- Appearance
            "Color", "Color3", "BackgroundColor3", "TextColor3", "ImageColor3",
            "Material", "Reflectance", "Transparency", "BackgroundTransparency",
            -- Behavior
            "Anchored", "CanCollide", "CanTouch", "CanQuery", "Massless",
            "Locked", "Visible", "Enabled",
            -- Text
            "Text", "Font", "TextSize", "TextScaled", "TextWrapped",
            "PlaceholderText", "MaxVisibleGraphemes",
            -- Values
            "Value",
            -- Physics
            "Velocity", "RotVelocity", "AssemblyLinearVelocity",
            -- Audio
            "Volume", "PlaybackSpeed", "SoundId", "Looped", "Playing",
            -- Lighting
            "Brightness", "Range", "Shadows",
            -- Character
            "WalkSpeed", "JumpPower", "MaxHealth", "Health",
            -- GUI
            "ZIndex", "LayoutOrder", "ClipsDescendants", "Active",
            "Image", "ScaleType",
        }
        
        for _, propName in ipairs(commonProps) do
            local ok, value = pcall(function()
                return instance[propName]
            end)
            if ok then
                table.insert(properties, {name = propName, value = value})
            end
        end
    end)
    
    -- Sort alphabetically
    table.sort(properties, function(a, b)
        return a.name:lower() < b.name:lower()
    end)
    
    -- Create property rows
    for i, prop in ipairs(properties) do
        local PropRow = Instance.new("Frame")
        PropRow.Name = prop.name
        PropRow.Size = UDim2.new(1, -5, 0, 24)
        PropRow.BackgroundColor3 = i % 2 == 0 and Theme.Colors.Card or Theme.Colors.Surface
        PropRow.BackgroundTransparency = 0.5
        PropRow.BorderSizePixel = 0
        PropRow.LayoutOrder = i
        PropRow.Parent = PropertiesScroll
        
        -- Property Name
        local PropName = Instance.new("TextLabel")
        PropName.Size = UDim2.new(0.4, -5, 1, 0)
        PropName.Position = UDim2.new(0, 8, 0, 0)
        PropName.BackgroundTransparency = 1
        PropName.Text = prop.name
        PropName.Font = Theme.Fonts.Body
        PropName.TextSize = Theme.TextSizes.Small
        PropName.TextColor3 = Theme.Colors.Accent
        PropName.TextXAlignment = Enum.TextXAlignment.Left
        PropName.TextTruncate = Enum.TextTruncate.AtEnd
        PropName.Parent = PropRow
        
        -- Property Value
        local valueStr = FormatValue(prop.value)
        local valueType = typeof(prop.value)
        
        local PropValue = Instance.new("TextLabel")
        PropValue.Size = UDim2.new(0.6, -10, 1, 0)
        PropValue.Position = UDim2.new(0.4, 5, 0, 0)
        PropValue.BackgroundTransparency = 1
        PropValue.Text = valueStr
        PropValue.Font = Theme.Fonts.Caption
        PropValue.TextSize = Theme.TextSizes.Small
        PropValue.TextColor3 = Theme.Colors.TextDim
        PropValue.TextXAlignment = Enum.TextXAlignment.Left
        PropValue.TextTruncate = Enum.TextTruncate.AtEnd
        PropValue.Parent = PropRow
        
        -- Color preview for Color3 properties
        if valueType == "Color3" then
            local ColorPreview = Instance.new("Frame")
            ColorPreview.Size = UDim2.new(0, 14, 0, 14)
            ColorPreview.Position = UDim2.new(0.4, 5, 0.5, -7)
            ColorPreview.BackgroundColor3 = prop.value
            ColorPreview.BorderSizePixel = 0
            ColorPreview.Parent = PropRow
            CreateCorner(ColorPreview, Theme.Corners.Small)
            CreateStroke(ColorPreview, Theme.Colors.Text, 1, 0.5)
            
            PropValue.Position = UDim2.new(0.4, 25, 0, 0)
            PropValue.Size = UDim2.new(0.6, -30, 1, 0)
        end
        
        -- Click to edit (for simple values)
        if valueType == "string" or valueType == "number" or valueType == "boolean" then
            PropRow.MouseEnter:Connect(function()
                Tween(PropRow, {BackgroundTransparency = 0, BackgroundColor3 = Theme.Colors.CardHover}, Theme.Animation.Fast)
            end)
            
            PropRow.MouseLeave:Connect(function()
                Tween(PropRow, {BackgroundTransparency = 0.5, BackgroundColor3 = i % 2 == 0 and Theme.Colors.Card or Theme.Colors.Surface}, Theme.Animation.Fast)
            end)
        end
    end
end

local function LoadRootServices()
    -- Clear existing
    for _, child in ipairs(ExplorerScroll:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    local services = {
        game,
        Workspace,
        Players,
        ReplicatedStorage,
        game:GetService("ReplicatedFirst"),
        Lighting,
        StarterGui,
        StarterPack,
        StarterPlayer,
        Teams,
        SoundService,
        Chat,
        game:GetService("NetworkClient"),
    }
    
    for i, service in ipairs(services) do
        local success, node = pcall(function()
            local n = CreateExplorerNode(service, 0)
            n.LayoutOrder = i
            n.Parent = ExplorerScroll
            return n
        end)
    end
    
    StatusText.Text = "Loaded " .. #services .. " services"
end

--// Remote Spy Functions
local RemoteHooks = {}

local function CreateRemoteLog(remoteName, remoteType, args, remote)
    if #State.RemoteLogs >= State.MaxRemoteLogs then
        local oldest = State.RemoteLogs[1]
        if oldest and oldest.Frame then
            oldest.Frame:Destroy()
        end
        table.remove(State.RemoteLogs, 1)
    end
    
    local LogEntry = Instance.new("Frame")
    LogEntry.Name = "Log_" .. #State.RemoteLogs
    LogEntry.Size = UDim2.new(1, -5, 0, 0)
    LogEntry.AutomaticSize = Enum.AutomaticSize.Y
    LogEntry.BackgroundColor3 = Theme.Colors.Card
    LogEntry.BorderSizePixel = 0
    LogEntry.LayoutOrder = -#State.RemoteLogs
    LogEntry.Parent = RemotesScroll
    CreateCorner(LogEntry, Theme.Corners.Small)
    
    -- Type indicator
    local TypeIndicator = Instance.new("Frame")
    TypeIndicator.Size = UDim2.new(0, 4, 1, 0)
    TypeIndicator.BackgroundColor3 = remoteType == "Event" and Theme.Colors.RemoteEvent or Theme.Colors.RemoteFunction
    TypeIndicator.BorderSizePixel = 0
    TypeIndicator.Parent = LogEntry
    CreateCorner(TypeIndicator, UDim.new(0, 2))
    
    local LogContent = Instance.new("Frame")
    LogContent.Size = UDim2.new(1, -14, 0, 0)
    LogContent.Position = UDim2.new(0, 10, 0, 0)
    LogContent.AutomaticSize = Enum.AutomaticSize.Y
    LogContent.BackgroundTransparency = 1
    LogContent.Parent = LogEntry
    
    local LogLayout = Instance.new("UIListLayout")
    LogLayout.SortOrder = Enum.SortOrder.LayoutOrder
    LogLayout.Padding = UDim.new(0, 2)
    LogLayout.Parent = LogContent
    
    local LogPadding = CreatePadding(LogContent, 6, 0, 6, 0)
    
    -- Header
    local Header = Instance.new("TextLabel")
    Header.Size = UDim2.new(1, 0, 0, 18)
    Header.BackgroundTransparency = 1
    Header.Text = (remoteType == "Event" and "📡 " or "📞 ") .. remoteName
    Header.Font = Theme.Fonts.Header
    Header.TextSize = Theme.TextSizes.Body
    Header.TextColor3 = remoteType == "Event" and Theme.Colors.RemoteEvent or Theme.Colors.RemoteFunction
    Header.TextXAlignment = Enum.TextXAlignment.Left
    Header.LayoutOrder = 0
    Header.Parent = LogContent
    
    -- Path
    local Path = Instance.new("TextLabel")
    Path.Size = UDim2.new(1, 0, 0, 14)
    Path.BackgroundTransparency = 1
    Path.Text = remote and GetInstancePath(remote) or "Unknown"
    Path.Font = Theme.Fonts.Caption
    Path.TextSize = Theme.TextSizes.Tiny
    Path.TextColor3 = Theme.Colors.TextMuted
    Path.TextXAlignment = Enum.TextXAlignment.Left
    Path.LayoutOrder = 1
    Path.Parent = LogContent
    
    -- Arguments
    if args and #args > 0 then
        local ArgsLabel = Instance.new("TextLabel")
        ArgsLabel.Size = UDim2.new(1, 0, 0, 14)
        ArgsLabel.BackgroundTransparency = 1
        ArgsLabel.Text = "Arguments:"
        ArgsLabel.Font = Theme.Fonts.Caption
        ArgsLabel.TextSize = Theme.TextSizes.Small
        ArgsLabel.TextColor3 = Theme.Colors.TextDim
        ArgsLabel.TextXAlignment = Enum.TextXAlignment.Left
        ArgsLabel.LayoutOrder = 2
        ArgsLabel.Parent = LogContent
        
        for i, arg in ipairs(args) do
            local ArgLine = Instance.new("TextLabel")
            ArgLine.Size = UDim2.new(1, 0, 0, 14)
            ArgLine.BackgroundTransparency = 1
            ArgLine.Text = "  [" .. i .. "] " .. typeof(arg) .. ": " .. FormatValue(arg)
            ArgLine.Font = Theme.Fonts.Code
            ArgLine.TextSize = Theme.TextSizes.Tiny
            ArgLine.TextColor3 = Theme.Colors.Text
            ArgLine.TextXAlignment = Enum.TextXAlignment.Left
            ArgLine.TextTruncate = Enum.TextTruncate.AtEnd
            ArgLine.LayoutOrder = 2 + i
            ArgLine.Parent = LogContent
        end
    end
    
    -- Copy Button
    local CopyBtn = Instance.new("TextButton")
    CopyBtn.Size = UDim2.new(0, 50, 0, 18)
    CopyBtn.Position = UDim2.new(1, -55, 0, 5)
    CopyBtn.BackgroundColor3 = Theme.Colors.Accent
    CopyBtn.Text = "Copy"
    CopyBtn.Font = Theme.Fonts.Caption
    CopyBtn.TextSize = Theme.TextSizes.Tiny
    CopyBtn.TextColor3 = Theme.Colors.Text
    CopyBtn.Parent = LogEntry
    CreateCorner(CopyBtn, Theme.Corners.Small)
    
    CopyBtn.MouseButton1Click:Connect(function()
        local code = ""
        if remote then
            local path = GetInstancePath(remote)
            if remoteType == "Event" then
                code = path .. ":FireServer("
            else
                code = path .. ":InvokeServer("
            end
            
            local argStrings = {}
            for _, arg in ipairs(args or {}) do
                table.insert(argStrings, FormatValue(arg))
            end
            code = code .. table.concat(argStrings, ", ") .. ")"
        end
        
        if setclipboard then
            setclipboard(code)
        end
        StatusText.Text = "Copied remote call code"
    end)
    
    table.insert(State.RemoteLogs, {Frame = LogEntry, Name = remoteName, Type = remoteType, Args = args})
end

local function EnableRemoteSpy()
    if State.RemoteSpyEnabled then return end
    State.RemoteSpyEnabled = true
    
    RemoteSpyToggle.Text = "ON"
    RemoteSpyToggle.BackgroundColor3 = Theme.Colors.Success
    
    -- Hook RemoteEvents
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        if method == "FireServer" and self:IsA("RemoteEvent") then
            task.spawn(function()
                CreateRemoteLog(self.Name, "Event", args, self)
            end)
        elseif method == "InvokeServer" and self:IsA("RemoteFunction") then
            task.spawn(function()
                CreateRemoteLog(self.Name, "Function", args, self)
            end)
        end
        
        return oldNamecall(self, ...)
    end)
    
    RemoteHooks.namecall = oldNamecall
    StatusText.Text = "Remote Spy enabled"
end

local function DisableRemoteSpy()
    State.RemoteSpyEnabled = false
    RemoteSpyToggle.Text = "OFF"
    RemoteSpyToggle.BackgroundColor3 = Theme.Colors.Error
    StatusText.Text = "Remote Spy disabled"
end

--// Search Functions
local function PerformSearch(query)
    -- Clear results
    for _, child in ipairs(SearchScroll:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    if query == "" then return end
    
    local results = {}
    local queryLower = query:lower()
    
    local function SearchRecursive(parent, depth)
        if depth > 50 then return end -- Prevent infinite recursion
        
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = child.Name:lower()
            local classLower = child.ClassName:lower()
            
            if nameLower:find(queryLower) or classLower:find(queryLower) then
                table.insert(results, child)
            end
            
            pcall(function()
                SearchRecursive(child, depth + 1)
            end)
        end
    end
    
    -- Search through game
    pcall(function() SearchRecursive(game, 0) end)
    
    -- Create result entries
    for i, instance in ipairs(results) do
        if i > 200 then break end -- Limit results
        
        local ResultRow = Instance.new("Frame")
        ResultRow.Size = UDim2.new(1, -5, 0, 28)
        ResultRow.BackgroundColor3 = Theme.Colors.Card
        ResultRow.BorderSizePixel = 0
        ResultRow.LayoutOrder = i
        ResultRow.Parent = SearchScroll
        CreateCorner(ResultRow, Theme.Corners.Small)
        
        local Icon = Instance.new("TextLabel")
        Icon.Size = UDim2.new(0, 24, 1, 0)
        Icon.Position = UDim2.new(0, 8, 0, 0)
        Icon.BackgroundTransparency = 1
        Icon.Text = GetClassIcon(instance.ClassName)
        Icon.Font = Theme.Fonts.Body
        Icon.TextSize = 14
        Icon.TextColor3 = GetClassColor(instance.ClassName)
        Icon.Parent = ResultRow
        
        local Name = Instance.new("TextLabel")
        Name.Size = UDim2.new(0.4, -40, 1, 0)
        Name.Position = UDim2.new(0, 35, 0, 0)
        Name.BackgroundTransparency = 1
        Name.Text = instance.Name
        Name.Font = Theme.Fonts.Body
        Name.TextSize = Theme.TextSizes.Body
        Name.TextColor3 = Theme.Colors.Text
        Name.TextXAlignment = Enum.TextXAlignment.Left
        Name.TextTruncate = Enum.TextTruncate.AtEnd
        Name.Parent = ResultRow
        
        local Path = Instance.new("TextLabel")
        Path.Size = UDim2.new(0.6, -10, 1, 0)
        Path.Position = UDim2.new(0.4, 0, 0, 0)
        Path.BackgroundTransparency = 1
        Path.Text = GetInstancePath(instance)
        Path.Font = Theme.Fonts.Caption
        Path.TextSize = Theme.TextSizes.Tiny
        Path.TextColor3 = Theme.Colors.TextMuted
        Path.TextXAlignment = Enum.TextXAlignment.Left
        Path.TextTruncate = Enum.TextTruncate.AtEnd
        Path.Parent = ResultRow
        
        -- Click to select
        local ClickBtn = Instance.new("TextButton")
        ClickBtn.Size = UDim2.new(1, 0, 1, 0)
        ClickBtn.BackgroundTransparency = 1
        ClickBtn.Text = ""
        ClickBtn.Parent = ResultRow
        
        ClickBtn.MouseEnter:Connect(function()
            Tween(ResultRow, {BackgroundColor3 = Theme.Colors.CardHover}, Theme.Animation.Fast)
        end)
        
        ClickBtn.MouseLeave:Connect(function()
            Tween(ResultRow, {BackgroundColor3 = Theme.Colors.Card}, Theme.Animation.Fast)
        end)
        
        ClickBtn.MouseButton1Click:Connect(function()
            State.SelectedInstance = instance
            PropertiesTitle.Text = "📋 " .. instance.ClassName .. " - " .. instance.Name
            UpdateProperties(instance)
            StatusText.Text = "Selected: " .. GetInstancePath(instance)
        end)
    end
    
    StatusText.Text = "Found " .. math.min(#results, 200) .. " results" .. (#results > 200 and " (showing first 200)" or "")
end

--// Nil Instance Scanner
local function ScanNilInstances()
    -- Clear existing
    for _, child in ipairs(NilScroll:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    local nilInstances = {}
    
    -- Use getnilinstances if available
    if getnilinstances then
        nilInstances = getnilinstances()
    end
    
    -- Also check for hidden instances
    if gethiddenui then
        for _, ui in ipairs(gethiddenui()) do
            table.insert(nilInstances, ui)
        end
    end
    
    if #nilInstances == 0 then
        local NoResults = Instance.new("TextLabel")
        NoResults.Size = UDim2.new(1, -20, 0, 40)
        NoResults.Position = UDim2.new(0, 10, 0, 10)
        NoResults.BackgroundTransparency = 1
        NoResults.Text = "No nil instances found\n(or getnilinstances not available)"
        NoResults.Font = Theme.Fonts.Body
        NoResults.TextSize = Theme.TextSizes.Body
        NoResults.TextColor3 = Theme.Colors.TextMuted
        NoResults.TextWrapped = true
        NoResults.Parent = NilScroll
        return
    end
    
    for i, instance in ipairs(nilInstances) do
        local NilRow = Instance.new("Frame")
        NilRow.Size = UDim2.new(1, -5, 0, 28)
        NilRow.BackgroundColor3 = Theme.Colors.Card
        NilRow.BorderSizePixel = 0
        NilRow.LayoutOrder = i
        NilRow.Parent = NilScroll
        CreateCorner(NilRow, Theme.Corners.Small)
        
        -- Nil indicator
        local NilIndicator = Instance.new("Frame")
        NilIndicator.Size = UDim2.new(0, 4, 1, -8)
        NilIndicator.Position = UDim2.new(0, 4, 0, 4)
        NilIndicator.BackgroundColor3 = Theme.Colors.Nil
        NilIndicator.BorderSizePixel = 0
        NilIndicator.Parent = NilRow
        CreateCorner(NilIndicator, UDim.new(1, 0))
        
        local Icon = Instance.new("TextLabel")
        Icon.Size = UDim2.new(0, 24, 1, 0)
        Icon.Position = UDim2.new(0, 14, 0, 0)
        Icon.BackgroundTransparency = 1
        Icon.Text = GetClassIcon(instance.ClassName)
        Icon.Font = Theme.Fonts.Body
        Icon.TextSize = 14
        Icon.TextColor3 = Theme.Colors.Nil
        Icon.Parent = NilRow
        
        local Name = Instance.new("TextLabel")
        Name.Size = UDim2.new(0.5, -50, 1, 0)
        Name.Position = UDim2.new(0, 42, 0, 0)
        Name.BackgroundTransparency = 1
        Name.Text = instance.Name
        Name.Font = Theme.Fonts.Body
        Name.TextSize = Theme.TextSizes.Body
        Name.TextColor3 = Theme.Colors.Text
        Name.TextXAlignment = Enum.TextXAlignment.Left
        Name.TextTruncate = Enum.TextTruncate.AtEnd
        Name.Parent = NilRow
        
        local ClassName = Instance.new("TextLabel")
        ClassName.Size = UDim2.new(0.3, 0, 1, 0)
        ClassName.Position = UDim2.new(0.5, 0, 0, 0)
        ClassName.BackgroundTransparency = 1
        ClassName.Text = instance.ClassName
        ClassName.Font = Theme.Fonts.Caption
        ClassName.TextSize = Theme.TextSizes.Small
        ClassName.TextColor3 = Theme.Colors.TextDim
        ClassName.TextXAlignment = Enum.TextXAlignment.Left
        ClassName.TextTruncate = Enum.TextTruncate.AtEnd
        ClassName.Parent = NilRow
        
        -- Actions
        local ViewBtn = Instance.new("TextButton")
        ViewBtn.Size = UDim2.new(0, 50, 0, 20)
        ViewBtn.Position = UDim2.new(1, -60, 0.5, -10)
        ViewBtn.BackgroundColor3 = Theme.Colors.Accent
        ViewBtn.Text = "View"
        ViewBtn.Font = Theme.Fonts.Caption
        ViewBtn.TextSize = Theme.TextSizes.Tiny
        ViewBtn.TextColor3 = Theme.Colors.Text
        ViewBtn.Parent = NilRow
        CreateCorner(ViewBtn, Theme.Corners.Small)
        
        ViewBtn.MouseButton1Click:Connect(function()
            State.SelectedInstance = instance
            PropertiesTitle.Text = "📋 [NIL] " .. instance.ClassName .. " - " .. instance.Name
            UpdateProperties(instance)
            StatusText.Text = "Viewing nil instance: " .. instance.Name
        end)
    end
    
    StatusText.Text = "Found " .. #nilInstances .. " nil instances"
end

--// Event Connections
-- Window Dragging
local dragStart, startPos

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        State.IsDragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        State.IsDragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if State.IsDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- Window Controls
local minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Tween(MainFrame, {Size = UDim2.new(0, 900, 0, 40)}, Theme.Animation.Normal)
        ContentArea.Visible = false
        StatusBar.Visible = false
        TabBar.Visible = false
    else
        Tween(MainFrame, {Size = UDim2.new(0, 900, 0, 600)}, Theme.Animation.Normal)
        task.wait(0.1)
        ContentArea.Visible = true
        StatusBar.Visible = true
        TabBar.Visible = true
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    -- Cleanup
    for _, conn in pairs(State.Connections) do
        if typeof(conn) == "RBXScriptConnection" then
            conn:Disconnect()
        end
    end
    FamyyDex:Destroy()
end)

-- Refresh Explorer
RefreshBtn.MouseButton1Click:Connect(function()
    LoadRootServices()
end)

-- Remote Spy Toggle
RemoteSpyToggle.MouseButton1Click:Connect(function()
    if State.RemoteSpyEnabled then
        DisableRemoteSpy()
    else
        if hookmetamethod then
            EnableRemoteSpy()
        else
            StatusText.Text = "Remote Spy requires hookmetamethod"
        end
    end
end)

-- Clear Remotes
ClearRemotesBtn.MouseButton1Click:Connect(function()
    for _, child in ipairs(RemotesScroll:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    State.RemoteLogs = {}
    StatusText.Text = "Cleared remote logs"
end)

-- Search
SearchBtn.MouseButton1Click:Connect(function()
    PerformSearch(SearchInput.Text)
end)

SearchInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        PerformSearch(SearchInput.Text)
    end
end)

-- Nil Scanner
ScanNilBtn.MouseButton1Click:Connect(function()
    ScanNilInstances()
end)

-- Hide context menu on click elsewhere
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mousePos = UserInputService:GetMouseLocation()
        local contextPos = ContextMenu.AbsolutePosition
        local contextSize = ContextMenu.AbsoluteSize
        
        if mousePos.X < contextPos.X or mousePos.X > contextPos.X + contextSize.X or
           mousePos.Y < contextPos.Y or mousePos.Y > contextPos.Y + contextSize.Y then
            ContextMenu.Visible = false
        end
    end
end)

-- Keybind to toggle
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Memory usage update
task.spawn(function()
    while FamyyDex.Parent do
        local memory = math.floor(collectgarbage("count") / 1024 * 100) / 100
        MemoryText.Text = "Mem: " .. memory .. " MB"
        task.wait(2)
    end
end)

--// Initialize
LoadRootServices()

-- Startup animation
MainFrame.BackgroundTransparency = 1
MainFrame.Size = UDim2.new(0, 850, 0, 550)

Tween(MainFrame, {
    BackgroundTransparency = 0,
    Size = UDim2.new(0, 900, 0, 600)
}, 0.4, Enum.EasingStyle.Back)

StatusText.Text = "FamyyDex loaded | " .. os.date("%H:%M:%S") .. " | RightShift to toggle"

return FamyyDex
