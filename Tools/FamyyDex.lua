--[[
    ███████╗ █████╗ ███╗   ███╗██╗   ██╗██╗   ██╗██████╗ ███████╗██╗  ██╗
    ██╔════╝██╔══██╗████╗ ████║╚██╗ ██╔╝╚██╗ ██╔╝██╔══██╗██╔════╝╚██╗██╔╝
    █████╗  ███████║██╔████╔██║ ╚████╔╝  ╚████╔╝ ██║  ██║█████╗   ╚███╔╝ 
    ██╔══╝  ██╔══██║██║╚██╔╝██║  ╚██╔╝    ╚██╔╝  ██║  ██║██╔══╝   ██╔██╗ 
    ██║     ██║  ██║██║ ╚═╝ ██║   ██║      ██║   ██████╔╝███████╗██╔╝ ╚██╗
    ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝      ╚═╝   ╚═════╝ ╚══════╝╚═╝   ╚═╝
    
    FamyyDex v2.0 - ABSOLUTE PENETRATION Edition
    The most powerful game explorer ever created.
]]

--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local StarterPack = game:GetService("StarterPack")
local StarterPlayer = game:GetService("StarterPlayer")
local Teams = game:GetService("Teams")
local SoundService = game:GetService("SoundService")
local Chat = game:GetService("Chat")
local TextService = game:GetService("TextService")

local Player = Players.LocalPlayer

--// Destroy existing
if CoreGui:FindFirstChild("FamyyDex") then
    CoreGui:FindFirstChild("FamyyDex"):Destroy()
end

--// Theme
local Theme = {
    Background = Color3.fromRGB(12, 12, 16),
    Surface = Color3.fromRGB(18, 18, 24),
    SurfaceLight = Color3.fromRGB(25, 25, 32),
    SurfaceHover = Color3.fromRGB(35, 35, 45),
    
    Accent = Color3.fromRGB(138, 92, 255),
    AccentDark = Color3.fromRGB(100, 65, 200),
    AccentGlow = Color3.fromRGB(138, 92, 255),
    
    Text = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(140, 140, 155),
    TextMuted = Color3.fromRGB(80, 80, 95),
    
    Success = Color3.fromRGB(80, 220, 120),
    Warning = Color3.fromRGB(255, 180, 60),
    Error = Color3.fromRGB(255, 80, 90),
    Info = Color3.fromRGB(80, 160, 255),
    
    Border = Color3.fromRGB(45, 45, 55),
    BorderAccent = Color3.fromRGB(138, 92, 255),
}

--// Utilities
local function Tween(obj, props, time)
    local t = TweenService:Create(obj, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props)
    t:Play()
    return t
end

local function Create(class, props, children)
    local obj = Instance.new(class)
    for k, v in pairs(props or {}) do
        if k ~= "Parent" then
            obj[k] = v
        end
    end
    for _, child in ipairs(children or {}) do
        child.Parent = obj
    end
    if props and props.Parent then
        obj.Parent = props.Parent
    end
    return obj
end

local function GetPath(inst)
    if not inst then return "nil" end
    local path = {}
    local current = inst
    while current and current ~= game do
        table.insert(path, 1, current.Name)
        current = current.Parent
    end
    local result = "game"
    for _, name in ipairs(path) do
        if name:match("^[%a_][%w_]*$") and not name:match("^%d") then
            result = result .. "." .. name
        else
            result = result .. '["' .. name:gsub('\\', '\\\\'):gsub('"', '\\"') .. '"]'
        end
    end
    return result
end

local function FormatValue(val)
    local t = typeof(val)
    if t == "string" then
        local short = #val > 50 and val:sub(1, 50) .. "..." or val
        return '"' .. short:gsub("\n", "\\n") .. '"'
    elseif t == "Instance" then
        return val.Name .. " (" .. val.ClassName .. ")"
    elseif t == "Color3" then
        return string.format("RGB(%d, %d, %d)", math.floor(val.R*255), math.floor(val.G*255), math.floor(val.B*255))
    elseif t == "Vector3" then
        return string.format("(%.1f, %.1f, %.1f)", val.X, val.Y, val.Z)
    elseif t == "Vector2" then
        return string.format("(%.1f, %.1f)", val.X, val.Y)
    elseif t == "CFrame" then
        return string.format("CFrame(%.1f, %.1f, %.1f)", val.X, val.Y, val.Z)
    elseif t == "UDim2" then
        return string.format("({%.2f, %d}, {%.2f, %d})", val.X.Scale, val.X.Offset, val.Y.Scale, val.Y.Offset)
    elseif t == "UDim" then
        return string.format("{%.2f, %d}", val.Scale, val.Offset)
    elseif t == "EnumItem" then
        return tostring(val)
    elseif t == "BrickColor" then
        return tostring(val)
    elseif t == "table" then
        return "{...}"
    elseif t == "function" then
        return "function()"
    else
        return tostring(val)
    end
end

--// Class Icons & Colors
local ClassData = {
    Folder = {icon = "📁", color = Color3.fromRGB(255, 200, 100)},
    Script = {icon = "📜", color = Color3.fromRGB(100, 180, 255)},
    LocalScript = {icon = "📄", color = Color3.fromRGB(100, 180, 255)},
    ModuleScript = {icon = "📦", color = Color3.fromRGB(180, 100, 255)},
    RemoteEvent = {icon = "📡", color = Color3.fromRGB(255, 140, 100)},
    RemoteFunction = {icon = "📞", color = Color3.fromRGB(255, 160, 80)},
    BindableEvent = {icon = "🔗", color = Color3.fromRGB(100, 255, 180)},
    BindableFunction = {icon = "⛓", color = Color3.fromRGB(100, 255, 180)},
    Part = {icon = "🧊", color = Color3.fromRGB(160, 160, 180)},
    MeshPart = {icon = "🔷", color = Color3.fromRGB(140, 180, 220)},
    UnionOperation = {icon = "🔶", color = Color3.fromRGB(220, 180, 140)},
    Model = {icon = "📐", color = Color3.fromRGB(255, 180, 100)},
    Tool = {icon = "🔧", color = Color3.fromRGB(180, 180, 180)},
    Humanoid = {icon = "🧍", color = Color3.fromRGB(100, 200, 150)},
    Camera = {icon = "📷", color = Color3.fromRGB(150, 150, 200)},
    Sound = {icon = "🔊", color = Color3.fromRGB(255, 200, 150)},
    ParticleEmitter = {icon = "✨", color = Color3.fromRGB(255, 220, 100)},
    Fire = {icon = "🔥", color = Color3.fromRGB(255, 150, 50)},
    ScreenGui = {icon = "🖥", color = Color3.fromRGB(150, 200, 255)},
    Frame = {icon = "⬜", color = Color3.fromRGB(200, 200, 200)},
    TextLabel = {icon = "🏷", color = Color3.fromRGB(180, 180, 200)},
    TextButton = {icon = "🔘", color = Color3.fromRGB(180, 200, 180)},
    TextBox = {icon = "📝", color = Color3.fromRGB(200, 180, 180)},
    ImageLabel = {icon = "🖼", color = Color3.fromRGB(200, 180, 220)},
    ImageButton = {icon = "🖱", color = Color3.fromRGB(180, 200, 220)},
    ScrollingFrame = {icon = "📜", color = Color3.fromRGB(180, 180, 200)},
    Configuration = {icon = "⚙", color = Color3.fromRGB(180, 180, 180)},
    StringValue = {icon = "💬", color = Color3.fromRGB(150, 200, 150)},
    NumberValue = {icon = "🔢", color = Color3.fromRGB(150, 150, 200)},
    IntValue = {icon = "🔢", color = Color3.fromRGB(150, 150, 200)},
    BoolValue = {icon = "✓", color = Color3.fromRGB(150, 200, 150)},
    ObjectValue = {icon = "🔗", color = Color3.fromRGB(200, 150, 200)},
    Player = {icon = "👤", color = Color3.fromRGB(100, 200, 255)},
    Accessory = {icon = "👒", color = Color3.fromRGB(255, 180, 200)},
    Decal = {icon = "🎨", color = Color3.fromRGB(255, 200, 180)},
    SpawnLocation = {icon = "🚩", color = Color3.fromRGB(100, 255, 100)},
    Seat = {icon = "🪑", color = Color3.fromRGB(180, 140, 100)},
    ClickDetector = {icon = "👆", color = Color3.fromRGB(255, 220, 100)},
    ProximityPrompt = {icon = "💬", color = Color3.fromRGB(100, 200, 255)},
    Highlight = {icon = "💡", color = Color3.fromRGB(255, 255, 150)},
    Beam = {icon = "⚡", color = Color3.fromRGB(150, 200, 255)},
    Trail = {icon = "🌈", color = Color3.fromRGB(255, 150, 200)},
    Terrain = {icon = "🏔", color = Color3.fromRGB(100, 180, 100)},
    Workspace = {icon = "🌍", color = Color3.fromRGB(100, 200, 255)},
    ReplicatedStorage = {icon = "📦", color = Color3.fromRGB(255, 180, 100)},
    ReplicatedFirst = {icon = "📦", color = Color3.fromRGB(255, 180, 100)},
    Lighting = {icon = "💡", color = Color3.fromRGB(255, 255, 150)},
    StarterGui = {icon = "🖥", color = Color3.fromRGB(150, 200, 255)},
    StarterPack = {icon = "🎒", color = Color3.fromRGB(200, 180, 150)},
    StarterPlayer = {icon = "👤", color = Color3.fromRGB(100, 200, 255)},
    Teams = {icon = "👥", color = Color3.fromRGB(150, 200, 150)},
    SoundService = {icon = "🔊", color = Color3.fromRGB(255, 200, 150)},
    Chat = {icon = "💬", color = Color3.fromRGB(150, 200, 255)},
    DataModel = {icon = "🎮", color = Color3.fromRGB(255, 200, 100)},
    Players = {icon = "👥", color = Color3.fromRGB(100, 200, 255)},
    Backpack = {icon = "🎒", color = Color3.fromRGB(200, 180, 150)},
    PlayerGui = {icon = "🖥", color = Color3.fromRGB(150, 200, 255)},
    StarterGear = {icon = "⚔", color = Color3.fromRGB(200, 200, 200)},
    StarterPlayerScripts = {icon = "📜", color = Color3.fromRGB(100, 180, 255)},
    StarterCharacterScripts = {icon = "📜", color = Color3.fromRGB(100, 180, 255)},
    NetworkClient = {icon = "🌐", color = Color3.fromRGB(100, 200, 255)},
    default = {icon = "📄", color = Color3.fromRGB(160, 160, 170)}
}

local function GetClassInfo(className)
    return ClassData[className] or ClassData.default
end

--// Main GUI
local FamyyDex = Create("ScreenGui", {
    Name = "FamyyDex",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 999999,
    IgnoreGuiInset = true,
    Parent = CoreGui
})

--// State
local State = {
    Selected = nil,
    Expanded = {},
    Nodes = {},
    Connections = {},
    RemoteSpyOn = false,
    RemoteLogs = {},
    Dragging = false,
    DragStart = nil,
    StartPos = nil,
}

--// Main Window
local Window = Create("Frame", {
    Name = "Window",
    Size = UDim2.new(0, 950, 0, 580),
    Position = UDim2.new(0.5, -475, 0.5, -290),
    BackgroundColor3 = Theme.Background,
    BorderSizePixel = 0,
    Parent = FamyyDex
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 12)}),
    Create("UIStroke", {Color = Theme.BorderAccent, Thickness = 1.5, Transparency = 0.5})
})

-- Glow
local Glow = Create("ImageLabel", {
    Name = "Glow",
    Size = UDim2.new(1, 80, 1, 80),
    Position = UDim2.new(0, -40, 0, -40),
    BackgroundTransparency = 1,
    Image = "rbxassetid://5028857084",
    ImageColor3 = Theme.AccentGlow,
    ImageTransparency = 0.9,
    ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(24, 24, 276, 276),
    ZIndex = 0,
    Parent = Window
})

--// Title Bar
local TitleBar = Create("Frame", {
    Name = "TitleBar",
    Size = UDim2.new(1, 0, 0, 42),
    BackgroundColor3 = Theme.Surface,
    BorderSizePixel = 0,
    Parent = Window
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 12)}),
})

-- Fix bottom corners
Create("Frame", {
    Size = UDim2.new(1, 0, 0, 12),
    Position = UDim2.new(0, 0, 1, -12),
    BackgroundColor3 = Theme.Surface,
    BorderSizePixel = 0,
    Parent = TitleBar
})

-- Title
local TitleLabel = Create("TextLabel", {
    Size = UDim2.new(0, 200, 1, 0),
    Position = UDim2.new(0, 16, 0, 0),
    BackgroundTransparency = 1,
    Text = "⚡ FAMYYDEX",
    Font = Enum.Font.GothamBlack,
    TextSize = 16,
    TextColor3 = Theme.Accent,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = TitleBar
})

-- Version
Create("TextLabel", {
    Size = UDim2.new(0, 35, 0, 16),
    Position = UDim2.new(0, 130, 0.5, -8),
    BackgroundColor3 = Theme.Accent,
    Text = "v2.0",
    Font = Enum.Font.GothamBold,
    TextSize = 10,
    TextColor3 = Theme.Text,
    Parent = TitleBar
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 4)})
})

-- Window Controls
local CloseBtn = Create("TextButton", {
    Size = UDim2.new(0, 28, 0, 28),
    Position = UDim2.new(1, -40, 0.5, -14),
    BackgroundColor3 = Theme.Error,
    Text = "×",
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    TextColor3 = Theme.Background,
    Parent = TitleBar
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 6)})
})

local MinBtn = Create("TextButton", {
    Size = UDim2.new(0, 28, 0, 28),
    Position = UDim2.new(1, -75, 0.5, -14),
    BackgroundColor3 = Theme.Warning,
    Text = "−",
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    TextColor3 = Theme.Background,
    Parent = TitleBar
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 6)})
})

--// Content Container
local Content = Create("Frame", {
    Name = "Content",
    Size = UDim2.new(1, -20, 1, -52),
    Position = UDim2.new(0, 10, 0, 47),
    BackgroundTransparency = 1,
    Parent = Window
})

--// Left Panel (Explorer)
local LeftPanel = Create("Frame", {
    Name = "Explorer",
    Size = UDim2.new(0, 320, 1, 0),
    BackgroundColor3 = Theme.Surface,
    BorderSizePixel = 0,
    Parent = Content
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 8)})
})

-- Explorer Header
local ExplorerHeader = Create("Frame", {
    Size = UDim2.new(1, 0, 0, 32),
    BackgroundColor3 = Theme.SurfaceLight,
    BorderSizePixel = 0,
    Parent = LeftPanel
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 8)})
})

Create("Frame", {
    Size = UDim2.new(1, 0, 0, 8),
    Position = UDim2.new(0, 0, 1, -8),
    BackgroundColor3 = Theme.SurfaceLight,
    BorderSizePixel = 0,
    Parent = ExplorerHeader
})

Create("TextLabel", {
    Size = UDim2.new(1, -50, 1, 0),
    Position = UDim2.new(0, 12, 0, 0),
    BackgroundTransparency = 1,
    Text = "🌲 Explorer",
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = Theme.Text,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = ExplorerHeader
})

local RefreshBtn = Create("TextButton", {
    Size = UDim2.new(0, 22, 0, 22),
    Position = UDim2.new(1, -30, 0.5, -11),
    BackgroundColor3 = Theme.Accent,
    Text = "↻",
    Font = Enum.Font.GothamBold,
    TextSize = 12,
    TextColor3 = Theme.Text,
    Parent = ExplorerHeader
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 4)})
})

-- Explorer Scroll
local ExplorerScroll = Create("ScrollingFrame", {
    Name = "Scroll",
    Size = UDim2.new(1, -8, 1, -40),
    Position = UDim2.new(0, 4, 0, 36),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = Theme.Accent,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    Parent = LeftPanel
}, {
    Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 0)
    }),
    Create("UIPadding", {
        PaddingTop = UDim.new(0, 2),
        PaddingBottom = UDim.new(0, 2),
        PaddingLeft = UDim.new(0, 2),
        PaddingRight = UDim.new(0, 2)
    })
})

--// Right Panel Container
local RightPanel = Create("Frame", {
    Name = "RightPanel",
    Size = UDim2.new(1, -330, 1, 0),
    Position = UDim2.new(0, 330, 0, 0),
    BackgroundTransparency = 1,
    Parent = Content
})

--// Tab Bar
local TabBar = Create("Frame", {
    Size = UDim2.new(1, 0, 0, 32),
    BackgroundColor3 = Theme.Surface,
    BorderSizePixel = 0,
    Parent = RightPanel
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 8)}),
    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 4)
    }),
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 6),
        PaddingRight = UDim.new(0, 6)
    })
})

--// Tab Content Area
local TabContent = Create("Frame", {
    Size = UDim2.new(1, 0, 1, -38),
    Position = UDim2.new(0, 0, 0, 38),
    BackgroundColor3 = Theme.Surface,
    BorderSizePixel = 0,
    Parent = RightPanel
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 8)})
})

--// Tab System
local Tabs = {}
local TabPanels = {}
local ActiveTab = nil

local function CreateTab(name, icon)
    local isFirst = #Tabs == 0
    
    local TabBtn = Create("TextButton", {
        Size = UDim2.new(0, 0, 0, 24),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = isFirst and Theme.Accent or Theme.SurfaceLight,
        Text = "",
        Parent = TabBar
    }, {
        Create("UICorner", {CornerRadius = UDim.new(0, 6)}),
        Create("UIPadding", {
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10)
        }),
        Create("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 5)
        })
    })
    
    Create("TextLabel", {
        Size = UDim2.new(0, 14, 0, 14),
        BackgroundTransparency = 1,
        Text = icon,
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextColor3 = Theme.Text,
        Parent = TabBtn
    })
    
    Create("TextLabel", {
        Size = UDim2.new(0, 0, 0, 24),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        Text = name,
        Font = Enum.Font.GothamMedium,
        TextSize = 11,
        TextColor3 = Theme.Text,
        Parent = TabBtn
    })
    
    local Panel = Create("Frame", {
        Size = UDim2.new(1, -8, 1, -8),
        Position = UDim2.new(0, 4, 0, 4),
        BackgroundTransparency = 1,
        Visible = isFirst,
        Parent = TabContent
    })
    
    TabBtn.MouseEnter:Connect(function()
        if ActiveTab ~= name then
            Tween(TabBtn, {BackgroundColor3 = Theme.SurfaceHover}, 0.15)
        end
    end)
    
    TabBtn.MouseLeave:Connect(function()
        if ActiveTab ~= name then
            Tween(TabBtn, {BackgroundColor3 = Theme.SurfaceLight}, 0.15)
        end
    end)
    
    TabBtn.MouseButton1Click:Connect(function()
        for tabName, data in pairs(Tabs) do
            local isActive = tabName == name
            Tween(data.Button, {BackgroundColor3 = isActive and Theme.Accent or Theme.SurfaceLight}, 0.15)
            TabPanels[tabName].Visible = isActive
        end
        ActiveTab = name
    end)
    
    Tabs[name] = {Button = TabBtn, Panel = Panel}
    TabPanels[name] = Panel
    
    if isFirst then
        ActiveTab = name
    end
    
    return Panel
end

--// Create Tabs
local PropertiesPanel = CreateTab("Properties", "📋")
local RemotesPanel = CreateTab("Remotes", "📡")
local ScriptsPanel = CreateTab("Scripts", "📜")
local SearchPanel = CreateTab("Search", "🔍")
local NilPanel = CreateTab("Nil", "👻")
local ActionsPanel = CreateTab("Actions", "⚡")

--// Properties Panel Content
local PropsHeader = Create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 24),
    BackgroundTransparency = 1,
    Text = "Select an instance to view properties",
    Font = Enum.Font.GothamMedium,
    TextSize = 12,
    TextColor3 = Theme.TextSecondary,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = PropertiesPanel
})

local PropsScroll = Create("ScrollingFrame", {
    Size = UDim2.new(1, 0, 1, -28),
    Position = UDim2.new(0, 0, 0, 28),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = Theme.Accent,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    Parent = PropertiesPanel
}, {
    Create("UIListLayout", {
        SortOrder = Enum.SortOrder.Name,
        Padding = UDim.new(0, 1)
    })
})

--// Remotes Panel Content
local RemotesHeader = Create("Frame", {
    Size = UDim2.new(1, 0, 0, 28),
    BackgroundTransparency = 1,
    Parent = RemotesPanel
})

local RemoteToggle = Create("TextButton", {
    Size = UDim2.new(0, 70, 0, 22),
    Position = UDim2.new(0, 0, 0, 0),
    BackgroundColor3 = Theme.Error,
    Text = "OFF",
    Font = Enum.Font.GothamBold,
    TextSize = 11,
    TextColor3 = Theme.Text,
    Parent = RemotesHeader
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 4)})
})

local RemoteClear = Create("TextButton", {
    Size = UDim2.new(0, 60, 0, 22),
    Position = UDim2.new(0, 78, 0, 0),
    BackgroundColor3 = Theme.Warning,
    Text = "Clear",
    Font = Enum.Font.GothamBold,
    TextSize = 11,
    TextColor3 = Theme.Background,
    Parent = RemotesHeader
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 4)})
})

local RemotesScroll = Create("ScrollingFrame", {
    Size = UDim2.new(1, 0, 1, -32),
    Position = UDim2.new(0, 0, 0, 32),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = Theme.Accent,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    Parent = RemotesPanel
}, {
    Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4)
    })
})

--// Scripts Panel Content
local ScriptsLabel = Create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 20),
    BackgroundTransparency = 1,
    Text = "Select a script to view source",
    Font = Enum.Font.GothamMedium,
    TextSize = 12,
    TextColor3 = Theme.TextSecondary,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = ScriptsPanel
})

local ScriptsScroll = Create("ScrollingFrame", {
    Size = UDim2.new(1, 0, 1, -24),
    Position = UDim2.new(0, 0, 0, 24),
    BackgroundColor3 = Theme.Background,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = Theme.Accent,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    AutomaticCanvasSize = Enum.AutomaticSize.XY,
    Parent = ScriptsPanel
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 4)}),
    Create("UIPadding", {
        PaddingTop = UDim.new(0, 8),
        PaddingBottom = UDim.new(0, 8),
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8)
    })
})

local ScriptCode = Create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundTransparency = 1,
    Text = "-- No script selected",
    Font = Enum.Font.Code,
    TextSize = 12,
    TextColor3 = Theme.TextSecondary,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top,
    TextWrapped = true,
    RichText = true,
    Parent = ScriptsScroll
})

--// Search Panel Content
local SearchInput = Create("TextBox", {
    Size = UDim2.new(1, -70, 0, 28),
    BackgroundColor3 = Theme.Background,
    Text = "",
    PlaceholderText = "Search by name, class, or path...",
    Font = Enum.Font.GothamMedium,
    TextSize = 12,
    TextColor3 = Theme.Text,
    PlaceholderColor3 = Theme.TextMuted,
    TextXAlignment = Enum.TextXAlignment.Left,
    ClearTextOnFocus = false,
    Parent = SearchPanel
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 4)}),
    Create("UIStroke", {Color = Theme.Border, Thickness = 1}),
    Create("UIPadding", {PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10)})
})

local SearchBtn = Create("TextButton", {
    Size = UDim2.new(0, 60, 0, 28),
    Position = UDim2.new(1, -60, 0, 0),
    BackgroundColor3 = Theme.Accent,
    Text = "Search",
    Font = Enum.Font.GothamBold,
    TextSize = 11,
    TextColor3 = Theme.Text,
    Parent = SearchPanel
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 4)})
})

local SearchScroll = Create("ScrollingFrame", {
    Size = UDim2.new(1, 0, 1, -36),
    Position = UDim2.new(0, 0, 0, 36),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = Theme.Accent,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    Parent = SearchPanel
}, {
    Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 2)
    })
})

--// Nil Panel Content
local NilScanBtn = Create("TextButton", {
    Size = UDim2.new(0, 100, 0, 28),
    BackgroundColor3 = Theme.Accent,
    Text = "🔍 Scan Nil",
    Font = Enum.Font.GothamBold,
    TextSize = 11,
    TextColor3 = Theme.Text,
    Parent = NilPanel
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 4)})
})

local NilScroll = Create("ScrollingFrame", {
    Size = UDim2.new(1, 0, 1, -36),
    Position = UDim2.new(0, 0, 0, 36),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = Theme.Accent,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    Parent = NilPanel
}, {
    Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 2)
    })
})

--// Actions Panel Content
local ActionsGrid = Create("Frame", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    Parent = ActionsPanel
}, {
    Create("UIGridLayout", {
        CellSize = UDim2.new(0, 140, 0, 36),
        CellPadding = UDim2.new(0, 8, 0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder
    })
})

local function CreateActionBtn(name, icon, callback)
    local Btn = Create("TextButton", {
        BackgroundColor3 = Theme.SurfaceLight,
        Text = "",
        Parent = ActionsGrid
    }, {
        Create("UICorner", {CornerRadius = UDim.new(0, 6)}),
        Create("UIStroke", {Color = Theme.Border, Thickness = 1})
    })
    
    Create("TextLabel", {
        Size = UDim2.new(1, -10, 1, 0),
        Position = UDim2.new(0, 5, 0, 0),
        BackgroundTransparency = 1,
        Text = icon .. " " .. name,
        Font = Enum.Font.GothamMedium,
        TextSize = 11,
        TextColor3 = Theme.Text,
        Parent = Btn
    })
    
    Btn.MouseEnter:Connect(function()
        Tween(Btn, {BackgroundColor3 = Theme.SurfaceHover}, 0.1)
    end)
    
    Btn.MouseLeave:Connect(function()
        Tween(Btn, {BackgroundColor3 = Theme.SurfaceLight}, 0.1)
    end)
    
    Btn.MouseButton1Click:Connect(callback)
    
    return Btn
end

CreateActionBtn("Copy Path", "📋", function()
    if State.Selected and setclipboard then
        setclipboard(GetPath(State.Selected))
    end
end)

CreateActionBtn("Copy Reference", "📝", function()
    if State.Selected and setclipboard then
        local name = State.Selected.Name:gsub("[^%w_]", "_")
        setclipboard("local " .. name .. " = " .. GetPath(State.Selected))
    end
end)

CreateActionBtn("Clone", "📦", function()
    if State.Selected then
        pcall(function()
            local clone = State.Selected:Clone()
            clone.Parent = State.Selected.Parent
        end)
    end
end)

CreateActionBtn("Destroy", "🗑", function()
    if State.Selected then
        pcall(function() State.Selected:Destroy() end)
        State.Selected = nil
    end
end)

CreateActionBtn("Teleport To", "🚀", function()
    if State.Selected and Player.Character then
        local hrp = Player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local target = State.Selected
            if target:IsA("Model") then
                target = target.PrimaryPart or target:FindFirstChildWhichIsA("BasePart")
            end
            if target and target:IsA("BasePart") then
                hrp.CFrame = target.CFrame + Vector3.new(0, 5, 0)
            end
        end
    end
end)

CreateActionBtn("View Script", "👁", function()
    if State.Selected and State.Selected:IsA("LuaSourceContainer") then
        for tabName, data in pairs(Tabs) do
            local isActive = tabName == "Scripts"
            Tween(data.Button, {BackgroundColor3 = isActive and Theme.Accent or Theme.SurfaceLight}, 0.15)
            TabPanels[tabName].Visible = isActive
        end
        ActiveTab = "Scripts"
        
        local success, source = pcall(function()
            return decompile and decompile(State.Selected) or "-- Decompile not available"
        end)
        ScriptsLabel.Text = State.Selected.Name
        ScriptCode.Text = success and source or ("-- Error: " .. tostring(source))
    end
end)

CreateActionBtn("Save Script", "💾", function()
    if State.Selected and State.Selected:IsA("LuaSourceContainer") then
        local success, source = pcall(function()
            return decompile and decompile(State.Selected) or ""
        end)
        if success and writefile then
            local filename = "FamyyDex_" .. State.Selected.Name:gsub("[^%w_]", "_") .. ".lua"
            writefile(filename, source)
        end
    end
end)

CreateActionBtn("Highlight", "💡", function()
    if State.Selected and (State.Selected:IsA("BasePart") or State.Selected:IsA("Model")) then
        local existing = State.Selected:FindFirstChildOfClass("Highlight")
        if existing then
            existing:Destroy()
        else
            local h = Instance.new("Highlight")
            h.FillColor = Theme.Accent
            h.OutlineColor = Theme.Text
            h.FillTransparency = 0.7
            h.Parent = State.Selected
        end
    end
end)

--// Status Bar
local StatusBar = Create("Frame", {
    Size = UDim2.new(1, 0, 0, 20),
    Position = UDim2.new(0, 0, 1, -20),
    BackgroundColor3 = Theme.Surface,
    BorderSizePixel = 0,
    Parent = Window
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 12)})
})

Create("Frame", {
    Size = UDim2.new(1, 0, 0, 10),
    Position = UDim2.new(0, 0, 0, 0),
    BackgroundColor3 = Theme.Surface,
    BorderSizePixel = 0,
    Parent = StatusBar
})

local StatusText = Create("TextLabel", {
    Size = UDim2.new(0.7, 0, 1, 0),
    Position = UDim2.new(0, 12, 0, 0),
    BackgroundTransparency = 1,
    Text = "Ready | RightShift to toggle",
    Font = Enum.Font.Gotham,
    TextSize = 10,
    TextColor3 = Theme.TextMuted,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = StatusBar
})

local MemText = Create("TextLabel", {
    Size = UDim2.new(0.3, -12, 1, 0),
    Position = UDim2.new(0.7, 0, 0, 0),
    BackgroundTransparency = 1,
    Text = "Mem: 0 MB",
    Font = Enum.Font.Gotham,
    TextSize = 10,
    TextColor3 = Theme.TextMuted,
    TextXAlignment = Enum.TextXAlignment.Right,
    Parent = StatusBar
})

--// Context Menu
local ContextMenu = Create("Frame", {
    Size = UDim2.new(0, 160, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundColor3 = Theme.Surface,
    BorderSizePixel = 0,
    Visible = false,
    ZIndex = 100,
    Parent = FamyyDex
}, {
    Create("UICorner", {CornerRadius = UDim.new(0, 6)}),
    Create("UIStroke", {Color = Theme.BorderAccent, Thickness = 1, Transparency = 0.5}),
    Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 1)}),
    Create("UIPadding", {PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4), PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 4)})
})

local function AddContextItem(text, icon, callback)
    local Item = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundColor3 = Theme.SurfaceLight,
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 101,
        Parent = ContextMenu
    }, {
        Create("UICorner", {CornerRadius = UDim.new(0, 4)})
    })
    
    Create("TextLabel", {
        Size = UDim2.new(1, -8, 1, 0),
        Position = UDim2.new(0, 4, 0, 0),
        BackgroundTransparency = 1,
        Text = icon .. "  " .. text,
        Font = Enum.Font.GothamMedium,
        TextSize = 11,
        TextColor3 = Theme.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 101,
        Parent = Item
    })
    
    Item.MouseEnter:Connect(function()
        Tween(Item, {BackgroundTransparency = 0, BackgroundColor3 = Theme.SurfaceHover}, 0.1)
    end)
    
    Item.MouseLeave:Connect(function()
        Tween(Item, {BackgroundTransparency = 1}, 0.1)
    end)
    
    Item.MouseButton1Click:Connect(function()
        ContextMenu.Visible = false
        if callback then callback() end
    end)
end

--// Explorer Functions
local function CreateNode(instance, depth)
    depth = depth or 0
    local info = GetClassInfo(instance.ClassName)
    local hasChildren = #instance:GetChildren() > 0
    
    local Node = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = depth,
        Parent = ExplorerScroll
    })
    
    local Row = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        Parent = Node
    })
    
    local Indent = Create("Frame", {
        Size = UDim2.new(0, depth * 12, 1, 0),
        BackgroundTransparency = 1,
        Parent = Row
    })
    
    local ContentFrame = Create("Frame", {
        Size = UDim2.new(1, -depth * 12, 1, 0),
        Position = UDim2.new(0, depth * 12, 0, 0),
        BackgroundTransparency = 1,
        Parent = Row
    })
    
    local ClickArea = Create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Theme.SurfaceHover,
        BackgroundTransparency = 1,
        Text = "",
        Parent = ContentFrame
    }, {
        Create("UICorner", {CornerRadius = UDim.new(0, 3)})
    })
    
    local Arrow = Create("TextLabel", {
        Size = UDim2.new(0, 14, 1, 0),
        Position = UDim2.new(0, 2, 0, 0),
        BackgroundTransparency = 1,
        Text = hasChildren and "▶" or "",
        Font = Enum.Font.GothamBold,
        TextSize = 8,
        TextColor3 = Theme.TextMuted,
        Parent = ContentFrame
    })
    
    local Icon = Create("TextLabel", {
        Size = UDim2.new(0, 16, 1, 0),
        Position = UDim2.new(0, 16, 0, 0),
        BackgroundTransparency = 1,
        Text = info.icon,
        Font = Enum.Font.GothamMedium,
        TextSize = 11,
        TextColor3 = info.color,
        Parent = ContentFrame
    })
    
    local Name = Create("TextLabel", {
        Size = UDim2.new(1, -36, 1, 0),
        Position = UDim2.new(0, 34, 0, 0),
        BackgroundTransparency = 1,
        Text = instance.Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 11,
        TextColor3 = Theme.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = ContentFrame
    })
    
    local ChildContainer = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Visible = false,
        LayoutOrder = 1,
        Parent = Node
    }, {
        Create("UIListLayout", {
            SortOrder = Enum.SortOrder.Name,
            Padding = UDim.new(0, 0)
        })
    })
    
    State.Nodes[instance] = {
        Node = Node,
        Arrow = Arrow,
        ClickArea = ClickArea,
        Name = Name,
        ChildContainer = ChildContainer,
        Loaded = false
    }
    
    -- Hover
    ClickArea.MouseEnter:Connect(function()
        if State.Selected ~= instance then
            Tween(ClickArea, {BackgroundTransparency = 0.7, BackgroundColor3 = Theme.SurfaceHover}, 0.1)
        end
    end)
    
    ClickArea.MouseLeave:Connect(function()
        if State.Selected ~= instance then
            Tween(ClickArea, {BackgroundTransparency = 1}, 0.1)
        end
    end)
    
    -- Select
    ClickArea.MouseButton1Click:Connect(function()
        -- Deselect previous
        if State.Selected and State.Nodes[State.Selected] then
            local prevNode = State.Nodes[State.Selected]
            Tween(prevNode.ClickArea, {BackgroundTransparency = 1}, 0.1)
            prevNode.Name.TextColor3 = Theme.Text
        end
        
        -- Select new
        State.Selected = instance
        Tween(ClickArea, {BackgroundTransparency = 0.5, BackgroundColor3 = Theme.AccentDark}, 0.1)
        Name.TextColor3 = Theme.Accent
        
        -- Update properties
        PropsHeader.Text = instance.ClassName .. " - " .. instance.Name
        
        -- Clear and populate properties
        for _, child in ipairs(PropsScroll:GetChildren()) do
            if child:IsA("Frame") then child:Destroy() end
        end
        
        local props = {"Name", "ClassName", "Parent", "Archivable", "Position", "Size", "CFrame", 
            "Orientation", "Color", "BrickColor", "Material", "Transparency", "Anchored", 
            "CanCollide", "Visible", "Enabled", "Text", "Font", "TextSize", "Value",
            "WalkSpeed", "JumpPower", "Health", "MaxHealth", "Volume", "SoundId", "Image"}
        
        local count = 0
        for _, propName in ipairs(props) do
            local ok, val = pcall(function() return instance[propName] end)
            if ok and val ~= nil then
                count = count + 1
                local PropRow = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 22),
                    BackgroundColor3 = count % 2 == 0 and Theme.SurfaceLight or Theme.Surface,
                    BackgroundTransparency = 0.5,
                    Parent = PropsScroll
                })
                
                Create("TextLabel", {
                    Size = UDim2.new(0.4, -4, 1, 0),
                    Position = UDim2.new(0, 6, 0, 0),
                    BackgroundTransparency = 1,
                    Text = propName,
                    Font = Enum.Font.GothamMedium,
                    TextSize = 10,
                    TextColor3 = Theme.Accent,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    Parent = PropRow
                })
                
                local valPos = UDim2.new(0.4, 4, 0, 0)
                local valSize = UDim2.new(0.6, -8, 1, 0)
                
                -- Color preview
                if typeof(val) == "Color3" then
                    Create("Frame", {
                        Size = UDim2.new(0, 14, 0, 14),
                        Position = UDim2.new(0.4, 4, 0.5, -7),
                        BackgroundColor3 = val,
                        Parent = PropRow
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 3)}),
                        Create("UIStroke", {Color = Theme.Text, Thickness = 1, Transparency = 0.5})
                    })
                    valPos = UDim2.new(0.4, 22, 0, 0)
                    valSize = UDim2.new(0.6, -26, 1, 0)
                end
                
                Create("TextLabel", {
                    Size = valSize,
                    Position = valPos,
                    BackgroundTransparency = 1,
                    Text = FormatValue(val),
                    Font = Enum.Font.Gotham,
                    TextSize = 10,
                    TextColor3 = Theme.TextSecondary,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    Parent = PropRow
                })
            end
        end
        
        -- Update script viewer if script
        if instance:IsA("LuaSourceContainer") then
            local success, source = pcall(function()
                return decompile and decompile(instance) or "-- Decompile not available"
            end)
            ScriptsLabel.Text = instance.Name
            ScriptCode.Text = success and source or ("-- Error: " .. tostring(source))
        end
        
        StatusText.Text = GetPath(instance)
    end)
    
    -- Double click to expand
    local lastClick = 0
    ClickArea.MouseButton1Click:Connect(function()
        local now = tick()
        if now - lastClick < 0.3 and hasChildren then
            local isExpanded = State.Expanded[instance]
            State.Expanded[instance] = not isExpanded
            
            if State.Expanded[instance] then
                Arrow.Text = "▼"
                ChildContainer.Visible = true
                
                if not State.Nodes[instance].Loaded then
                    State.Nodes[instance].Loaded = true
                    local children = instance:GetChildren()
                    table.sort(children, function(a, b) return a.Name:lower() < b.Name:lower() end)
                    for _, child in ipairs(children) do
                        local childNode = CreateNode(child, depth + 1)
                        childNode.Parent = ChildContainer
                    end
                end
            else
                Arrow.Text = "▶"
                ChildContainer.Visible = false
            end
        end
        lastClick = now
    end)
    
    -- Right click context
    ClickArea.MouseButton2Click:Connect(function()
        -- Clear existing items
        for _, child in ipairs(ContextMenu:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        
        AddContextItem("Copy Path", "📋", function()
            if setclipboard then setclipboard(GetPath(instance)) end
        end)
        
        AddContextItem("Copy Reference", "📝", function()
            if setclipboard then
                local name = instance.Name:gsub("[^%w_]", "_")
                setclipboard("local " .. name .. " = " .. GetPath(instance))
            end
        end)
        
        AddContextItem("Clone", "📦", function()
            pcall(function()
                local c = instance:Clone()
                c.Parent = instance.Parent
            end)
        end)
        
        AddContextItem("Destroy", "🗑", function()
            pcall(function() instance:Destroy() end)
            Node:Destroy()
        end)
        
        if instance:IsA("BasePart") or instance:IsA("Model") then
            AddContextItem("Teleport To", "🚀", function()
                local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local target = instance:IsA("Model") and (instance.PrimaryPart or instance:FindFirstChildWhichIsA("BasePart")) or instance
                    if target then hrp.CFrame = target.CFrame + Vector3.new(0, 5, 0) end
                end
            end)
            
            AddContextItem("Highlight", "💡", function()
                local h = instance:FindFirstChildOfClass("Highlight")
                if h then h:Destroy() else
                    local hl = Instance.new("Highlight")
                    hl.FillColor = Theme.Accent
                    hl.FillTransparency = 0.7
                    hl.Parent = instance
                end
            end)
        end
        
        if instance:IsA("LuaSourceContainer") then
            AddContextItem("View Source", "📜", function()
                for tabName, data in pairs(Tabs) do
                    local isActive = tabName == "Scripts"
                    Tween(data.Button, {BackgroundColor3 = isActive and Theme.Accent or Theme.SurfaceLight}, 0.15)
                    TabPanels[tabName].Visible = isActive
                end
                ActiveTab = "Scripts"
                
                local success, source = pcall(function()
                    return decompile and decompile(instance) or "-- Decompile not available"
                end)
                ScriptsLabel.Text = instance.Name
                ScriptCode.Text = success and source or ("-- Error: " .. tostring(source))
            end)
            
            AddContextItem("Save Script", "💾", function()
                local success, source = pcall(function()
                    return decompile and decompile(instance) or ""
                end)
                if success and writefile then
                    writefile("FamyyDex_" .. instance.Name:gsub("[^%w_]", "_") .. ".lua", source)
                end
            end)
        end
        
        local mousePos = UserInputService:GetMouseLocation()
        ContextMenu.Position = UDim2.new(0, mousePos.X, 0, mousePos.Y - 36)
        ContextMenu.Visible = true
    end)
    
    return Node
end

local function LoadExplorer()
    -- Clear existing
    for _, child in ipairs(ExplorerScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    State.Nodes = {}
    State.Expanded = {}
    
    local services = {
        game,
        Workspace,
        Players,
        ReplicatedStorage,
        pcall(function() return game:GetService("ReplicatedFirst") end) and game:GetService("ReplicatedFirst"),
        Lighting,
        StarterGui,
        StarterPack,
        StarterPlayer,
        Teams,
        SoundService,
        Chat,
        pcall(function() return game:GetService("NetworkClient") end) and game:GetService("NetworkClient"),
    }
    
    for i, service in ipairs(services) do
        if service then
            pcall(function()
                local node = CreateNode(service, 0)
                node.LayoutOrder = i
            end)
        end
    end
    
    StatusText.Text = "Loaded explorer | RightShift to toggle"
end

--// Remote Spy
local function CreateRemoteLog(remote, remoteType, args)
    local LogEntry = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Theme.SurfaceLight,
        LayoutOrder = -#State.RemoteLogs,
        Parent = RemotesScroll
    }, {
        Create("UICorner", {CornerRadius = UDim.new(0, 4)}),
        Create("UIPadding", {PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)})
    })
    
    -- Accent bar
    Create("Frame", {
        Size = UDim2.new(0, 3, 1, -8),
        Position = UDim2.new(0, 0, 0, 4),
        BackgroundColor3 = remoteType == "Event" and Theme.Warning or Theme.Info,
        Parent = LogEntry
    }, {
        Create("UICorner", {CornerRadius = UDim.new(0, 2)})
    })
    
    local Content = Create("Frame", {
        Size = UDim2.new(1, -60, 0, 0),
        Position = UDim2.new(0, 8, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Parent = LogEntry
    }, {
        Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2)})
    })
    
    Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        Text = (remoteType == "Event" and "📡 " or "📞 ") .. remote.Name,
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        TextColor3 = remoteType == "Event" and Theme.Warning or Theme.Info,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 0,
        Parent = Content
    })
    
    Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 12),
        BackgroundTransparency = 1,
        Text = GetPath(remote),
        Font = Enum.Font.Gotham,
        TextSize = 9,
        TextColor3 = Theme.TextMuted,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        LayoutOrder = 1,
        Parent = Content
    })
    
    if args and #args > 0 then
        for i, arg in ipairs(args) do
            if i > 5 then break end
            Create("TextLabel", {
                Size = UDim2.new(1, 0, 0, 12),
                BackgroundTransparency = 1,
                Text = "[" .. i .. "] " .. typeof(arg) .. ": " .. FormatValue(arg),
                Font = Enum.Font.Code,
                TextSize = 9,
                TextColor3 = Theme.TextSecondary,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                LayoutOrder = 1 + i,
                Parent = Content
            })
        end
    end
    
    -- Copy button
    local CopyBtn = Create("TextButton", {
        Size = UDim2.new(0, 45, 0, 18),
        Position = UDim2.new(1, -50, 0, 6),
        BackgroundColor3 = Theme.Accent,
        Text = "Copy",
        Font = Enum.Font.GothamBold,
        TextSize = 9,
        TextColor3 = Theme.Text,
        Parent = LogEntry
    }, {
        Create("UICorner", {CornerRadius = UDim.new(0, 3)})
    })
    
    CopyBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            local code = GetPath(remote) .. ":" .. (remoteType == "Event" and "FireServer" or "InvokeServer") .. "("
            local argStrs = {}
            for _, arg in ipairs(args or {}) do
                table.insert(argStrs, FormatValue(arg))
            end
            code = code .. table.concat(argStrs, ", ") .. ")"
            setclipboard(code)
        end
    end)
    
    table.insert(State.RemoteLogs, LogEntry)
    if #State.RemoteLogs > 100 then
        State.RemoteLogs[1]:Destroy()
        table.remove(State.RemoteLogs, 1)
    end
end

RemoteToggle.MouseButton1Click:Connect(function()
    State.RemoteSpyOn = not State.RemoteSpyOn
    
    if State.RemoteSpyOn then
        RemoteToggle.Text = "ON"
        RemoteToggle.BackgroundColor3 = Theme.Success
        
        if hookmetamethod then
            local oldNamecall
            oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                local method = getnamecallmethod()
                local args = {...}
                
                if method == "FireServer" and self:IsA("RemoteEvent") then
                    task.spawn(CreateRemoteLog, self, "Event", args)
                elseif method == "InvokeServer" and self:IsA("RemoteFunction") then
                    task.spawn(CreateRemoteLog, self, "Function", args)
                end
                
                return oldNamecall(self, ...)
            end)
            State.RemoteHook = oldNamecall
        end
    else
        RemoteToggle.Text = "OFF"
        RemoteToggle.BackgroundColor3 = Theme.Error
    end
end)

RemoteClear.MouseButton1Click:Connect(function()
    for _, log in ipairs(State.RemoteLogs) do
        log:Destroy()
    end
    State.RemoteLogs = {}
end)

--// Search
local function DoSearch(query)
    for _, child in ipairs(SearchScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    if query == "" then return end
    
    local results = {}
    local queryLower = query:lower()
    
    local function SearchIn(parent, depth)
        if depth > 30 then return end
        pcall(function()
            for _, child in ipairs(parent:GetChildren()) do
                if child.Name:lower():find(queryLower) or child.ClassName:lower():find(queryLower) then
                    table.insert(results, child)
                end
                SearchIn(child, depth + 1)
            end
        end)
    end
    
    SearchIn(game, 0)
    
    for i, inst in ipairs(results) do
        if i > 100 then break end
        
        local info = GetClassInfo(inst.ClassName)
        local Row = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundColor3 = Theme.SurfaceLight,
            LayoutOrder = i,
            Parent = SearchScroll
        }, {
            Create("UICorner", {CornerRadius = UDim.new(0, 4)})
        })
        
        Create("TextLabel", {
            Size = UDim2.new(0, 20, 1, 0),
            Position = UDim2.new(0, 6, 0, 0),
            BackgroundTransparency = 1,
            Text = info.icon,
            Font = Enum.Font.GothamMedium,
            TextSize = 11,
            TextColor3 = info.color,
            Parent = Row
        })
        
        Create("TextLabel", {
            Size = UDim2.new(0.4, -30, 1, 0),
            Position = UDim2.new(0, 28, 0, 0),
            BackgroundTransparency = 1,
            Text = inst.Name,
            Font = Enum.Font.GothamMedium,
            TextSize = 11,
            TextColor3 = Theme.Text,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = Row
        })
        
        Create("TextLabel", {
            Size = UDim2.new(0.6, -10, 1, 0),
            Position = UDim2.new(0.4, 0, 0, 0),
            BackgroundTransparency = 1,
            Text = GetPath(inst),
            Font = Enum.Font.Gotham,
            TextSize = 9,
            TextColor3 = Theme.TextMuted,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = Row
        })
        
        local ClickBtn = Create("TextButton", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = "",
            Parent = Row
        })
        
        ClickBtn.MouseEnter:Connect(function()
            Tween(Row, {BackgroundColor3 = Theme.SurfaceHover}, 0.1)
        end)
        
        ClickBtn.MouseLeave:Connect(function()
            Tween(Row, {BackgroundColor3 = Theme.SurfaceLight}, 0.1)
        end)
        
        ClickBtn.MouseButton1Click:Connect(function()
            State.Selected = inst
            PropsHeader.Text = inst.ClassName .. " - " .. inst.Name
            StatusText.Text = GetPath(inst)
        end)
    end
    
    StatusText.Text = "Found " .. math.min(#results, 100) .. " results"
end

SearchBtn.MouseButton1Click:Connect(function()
    DoSearch(SearchInput.Text)
end)

SearchInput.FocusLost:Connect(function(enter)
    if enter then DoSearch(SearchInput.Text) end
end)

--// Nil Scanner
NilScanBtn.MouseButton1Click:Connect(function()
    for _, child in ipairs(NilScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    local nilInstances = getnilinstances and getnilinstances() or {}
    
    if #nilInstances == 0 then
        Create("TextLabel", {
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundTransparency = 1,
            Text = "No nil instances found",
            Font = Enum.Font.GothamMedium,
            TextSize = 12,
            TextColor3 = Theme.TextMuted,
            Parent = NilScroll
        })
        return
    end
    
    for i, inst in ipairs(nilInstances) do
        local info = GetClassInfo(inst.ClassName)
        local Row = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundColor3 = Theme.SurfaceLight,
            LayoutOrder = i,
            Parent = NilScroll
        }, {
            Create("UICorner", {CornerRadius = UDim.new(0, 4)})
        })
        
        -- Red indicator
        Create("Frame", {
            Size = UDim2.new(0, 3, 1, -8),
            Position = UDim2.new(0, 4, 0, 4),
            BackgroundColor3 = Theme.Error,
            Parent = Row
        }, {
            Create("UICorner", {CornerRadius = UDim.new(0, 2)})
        })
        
        Create("TextLabel", {
            Size = UDim2.new(0, 18, 1, 0),
            Position = UDim2.new(0, 12, 0, 0),
            BackgroundTransparency = 1,
            Text = info.icon,
            Font = Enum.Font.GothamMedium,
            TextSize = 11,
            TextColor3 = Theme.Error,
            Parent = Row
        })
        
        Create("TextLabel", {
            Size = UDim2.new(0.5, -35, 1, 0),
            Position = UDim2.new(0, 32, 0, 0),
            BackgroundTransparency = 1,
            Text = inst.Name,
            Font = Enum.Font.GothamMedium,
            TextSize = 11,
            TextColor3 = Theme.Text,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = Row
        })
        
        Create("TextLabel", {
            Size = UDim2.new(0.3, 0, 1, 0),
            Position = UDim2.new(0.5, 0, 0, 0),
            BackgroundTransparency = 1,
            Text = inst.ClassName,
            Font = Enum.Font.Gotham,
            TextSize = 10,
            TextColor3 = Theme.TextSecondary,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = Row
        })
        
        local ViewBtn = Create("TextButton", {
            Size = UDim2.new(0, 40, 0, 18),
            Position = UDim2.new(1, -48, 0.5, -9),
            BackgroundColor3 = Theme.Accent,
            Text = "View",
            Font = Enum.Font.GothamBold,
            TextSize = 9,
            TextColor3 = Theme.Text,
            Parent = Row
        }, {
            Create("UICorner", {CornerRadius = UDim.new(0, 3)})
        })
        
        ViewBtn.MouseButton1Click:Connect(function()
            State.Selected = inst
            PropsHeader.Text = "[NIL] " .. inst.ClassName .. " - " .. inst.Name
            StatusText.Text = "Viewing nil instance: " .. inst.Name
        end)
    end
    
    StatusText.Text = "Found " .. #nilInstances .. " nil instances"
end)

--// Window Dragging
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        State.Dragging = true
        State.DragStart = input.Position
        State.StartPos = Window.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        State.Dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if State.Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - State.DragStart
        Window.Position = UDim2.new(
            State.StartPos.X.Scale, State.StartPos.X.Offset + delta.X,
            State.StartPos.Y.Scale, State.StartPos.Y.Offset + delta.Y
        )
    end
end)

--// Window Controls
local isMinimized = false
MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        Tween(Window, {Size = UDim2.new(0, 950, 0, 42)}, 0.2)
        Content.Visible = false
        StatusBar.Visible = false
    else
        Tween(Window, {Size = UDim2.new(0, 950, 0, 580)}, 0.2)
        task.wait(0.1)
        Content.Visible = true
        StatusBar.Visible = true
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    FamyyDex:Destroy()
end)

--// Hide context on click elsewhere
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local pos = UserInputService:GetMouseLocation()
        local ctxPos = ContextMenu.AbsolutePosition
        local ctxSize = ContextMenu.AbsoluteSize
        if pos.X < ctxPos.X or pos.X > ctxPos.X + ctxSize.X or
           pos.Y < ctxPos.Y or pos.Y > ctxPos.Y + ctxSize.Y then
            ContextMenu.Visible = false
        end
    end
end)

--// Toggle Keybind
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        Window.Visible = not Window.Visible
    end
end)

--// Memory Monitor
task.spawn(function()
    while FamyyDex.Parent do
        local mem = math.floor(collectgarbage("count") / 1024 * 100) / 100
        MemText.Text = "Mem: " .. mem .. " MB"
        task.wait(2)
    end
end)

--// Refresh Button
RefreshBtn.MouseButton1Click:Connect(LoadExplorer)

--// Initialize
LoadExplorer()

-- Startup animation
Window.BackgroundTransparency = 1
Window.Size = UDim2.new(0, 900, 0, 540)
Tween(Window, {BackgroundTransparency = 0, Size = UDim2.new(0, 950, 0, 580)}, 0.3)

StatusText.Text = "FamyyDex v2.0 loaded | " .. os.date("%H:%M:%S")

return FamyyDex
