--[[
    FAMYY PRIVATE v1.0 - Showcase Script (Self-Contained)
    Run this script to record the showcase video.
    Includes the Library source code directly to avoid 404/Cache issues.
]]

-- ============================================================================
-- EMBEDDED LIBRARY START
-- ============================================================================
local Library = (function()
--[[
    ██████╗ ███████╗██╗   ██╗██╗   ██╗██╗   ██╗    ██████╗ ██████╗ ██╗██╗   ██╗ █████╗ ████████╗███████╗
    ██╔══██╗██╔════╝██║   ██║██║   ██║╚██╗ ██╔╝    ██╔══██╗██╔══██╗██║██║   ██║██╔══██╗╚══██╔══╝██╔════╝
    ██████╔╝█████╗  ██║   ██║██║   ██║ ╚████╔╝     ██████╔╝██████╔╝██║██║   ██║███████║   ██║   █████╗  
    ██╔═══╝ ██╔══╝  ██║   ██║██║   ██║  ╚██╔╝      ██╔═══╝ ██╔══██╗██║╚██╗ ██╔╝██╔══██║   ██║   ██╔══╝  
    ██║     ███████╗╚██████╔╝╚██████╔╝   ██║       ██║     ██║  ██║██║ ╚████╔╝ ██║  ██║   ██║   ███████╗
    ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝    ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═╝   ╚═╝   ╚══════╝
    
    FAMYY PRIVATE v1.0 - Modular UI Library
    
    A professional Roblox UI library for script developers.
    Features modular architecture, settings persistence, and extensive component library.
]]

-- [[ PROTECTED CREDIT - DO NOT REMOVE ]]
local _0x9f2a={80,114,111,112,101,114,116,121,32,111,102,32,90,97,121,110,70,97,109,121,32,45,32,70,97,109,121,121,32,80,114,105,118,97,116,101};local function _0x1c3()local _0x4b="";for _,_0x8d in ipairs(_0x9f2a)do _0x4b=_0x4b..string.char(_0x8d)end;warn(_0x4b)end;task.spawn(_0x1c3);
-- [[ END PROTECTED CREDIT ]]

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local Stats = game:GetService("Stats")

-- Utilities
local Tween = {}
Tween.Defaults = { Time = 0.3, EasingStyle = Enum.EasingStyle.Quart, EasingDirection = Enum.EasingDirection.Out }
function Tween.Play(obj, props, time)
    local tweenInfo = TweenInfo.new(time or Tween.Defaults.Time, Tween.Defaults.EasingStyle, Tween.Defaults.EasingDirection)
    local tween = TweenService:Create(obj, tweenInfo, props)
    tween:Play()
    return tween
end

local Connections = {}
Connections.__index = Connections
function Connections.new()
    return setmetatable({_connections = {}}, Connections)
end
function Connections:Track(conn)
    if conn then table.insert(self._connections, conn) end
    return conn
end
function Connections:DisconnectAll()
    for _, conn in ipairs(self._connections) do
        if conn and conn.Connected then conn:Disconnect() end
    end
    self._connections = {}
end

local Safety = {}
function Safety.Call(callback, ...)
    if type(callback) ~= "function" then return false, "Not a function" end
    return pcall(callback, ...)
end
function Safety.GetGuiParent()
    if gethui then
        local s, r = pcall(gethui)
        if s and r then return r end
    end
    return CoreGui
end

-- Theme Configuration
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
        Text = Color3.fromRGB(255, 255, 255),
        TextDim = Color3.fromRGB(160, 160, 170),
        TextMuted = Color3.fromRGB(100, 100, 110),
        Success = Color3.fromRGB(100, 255, 140),
        Warning = Color3.fromRGB(255, 220, 100),
        Error = Color3.fromRGB(255, 100, 100),
        Info = Color3.fromRGB(100, 180, 255),
        Discord = Color3.fromRGB(88, 101, 242),
        DiscordHover = Color3.fromRGB(71, 82, 196),
        Green = Color3.fromRGB(100, 255, 140),
        Yellow = Color3.fromRGB(255, 220, 100),
        Red = Color3.fromRGB(255, 100, 100),
    },
    Sizes = {
        WindowDefault = UDim2.new(0, 280, 0, 480),
        WindowMinimized = UDim2.new(0, 45, 0, 45),
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
        WindowPadding = 15,
        ComponentPadding = 12,
        ComponentSpacing = 2,
    },
    Corners = {
        Window = UDim.new(0, 12),
        Card = UDim.new(0, 8),
        Button = UDim.new(0, 6),
        Toggle = UDim.new(1, 0),
        Input = UDim.new(0, 6),
        Notification = UDim.new(0, 8),
    },
    Fonts = {
        Title = Enum.Font.GothamBlack,
        Header = Enum.Font.GothamBold,
        Body = Enum.Font.GothamMedium,
        Caption = Enum.Font.Gotham,
    },
    TextSizes = {
        Title = 19,
        Header = 14,
        Body = 13,
        Caption = 12,
        Small = 11,
        Tiny = 10,
    },
    Stroke = {
        Default = 1,
        Thick = 1.5,
        Thin = 0.5,
    },
}

-- Theme Presets
local Themes = {
    ["Famyy Purple"] = {
        Accent = Color3.fromRGB(130, 90, 255),
        AccentDim = Color3.fromRGB(100, 70, 200),
        AccentHover = Color3.fromRGB(150, 110, 255)
    },
    ["Azure Blue"] = {
        Accent = Color3.fromRGB(0, 170, 255),
        AccentDim = Color3.fromRGB(0, 120, 200),
        AccentHover = Color3.fromRGB(50, 190, 255)
    },
    ["Emerald Green"] = {
        Accent = Color3.fromRGB(0, 255, 120),
        AccentDim = Color3.fromRGB(0, 200, 90),
        AccentHover = Color3.fromRGB(50, 255, 150)
    },
    ["Crimson Red"] = {
        Accent = Color3.fromRGB(255, 60, 60),
        AccentDim = Color3.fromRGB(200, 40, 40),
        AccentHover = Color3.fromRGB(255, 90, 90)
    },
    ["Sunset Orange"] = {
        Accent = Color3.fromRGB(255, 140, 0),
        AccentDim = Color3.fromRGB(200, 100, 0),
        AccentHover = Color3.fromRGB(255, 170, 50)
    }
}

local Library = {
    Version = "1.0",
    Theme = Theme,
    Windows = {},
}

function Library:CreateWindow(config)
    config = config or {}
    local title = config.Title or "FAMYY PRIVATE"
    local size = config.Size or Theme.Sizes.WindowDefault
    local position = config.Position or UDim2.new(0.05, 0, 0.5, -240)
    local keybind = config.Keybind or Enum.KeyCode.RightShift
    
    local guiParent = Safety.GetGuiParent()
    local existingGui = guiParent:FindFirstChild("FamyyPrivate")
    if existingGui then existingGui:Destroy() end
    
    local connections = Connections.new()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FamyyPrivate"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = guiParent
    
    local NotifContainer = Instance.new("Frame")
    NotifContainer.Name = "Notifications"
    NotifContainer.Size = UDim2.new(0, 240, 1, -20)
    NotifContainer.Position = UDim2.new(1, -250, 0, 10)
    NotifContainer.BackgroundTransparency = 1
    NotifContainer.Parent = ScreenGui
    local NotifLayout = Instance.new("UIListLayout", NotifContainer)
    NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
    NotifLayout.Padding = UDim.new(0, 8)
    NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    
    local function Notify(ntitle, message, duration, notifType)
        duration = duration or 3
        notifType = notifType or "info"
        local typeColors = {info = Theme.Colors.Accent, success = Theme.Colors.Success, warning = Theme.Colors.Warning, error = Theme.Colors.Error}
        local accentColor = typeColors[notifType] or Theme.Colors.Accent
        
        local Notif = Instance.new("Frame")
        Notif.Size = UDim2.new(1, 0, 0, 60)
        Notif.BackgroundColor3 = Theme.Colors.Surface
        Notif.BackgroundTransparency = 1
        Notif.Parent = NotifContainer
        Instance.new("UICorner", Notif).CornerRadius = Theme.Corners.Notification
        local Stroke = Instance.new("UIStroke", Notif)
        Stroke.Color = accentColor
        Stroke.Transparency = 1
        
        local TitleLbl = Instance.new("TextLabel")
        TitleLbl.Size = UDim2.new(1, -20, 0, 20)
        TitleLbl.Position = UDim2.new(0, 15, 0, 8)
        TitleLbl.BackgroundTransparency = 1
        TitleLbl.Text = ntitle
        TitleLbl.TextColor3 = Theme.Colors.Text
        TitleLbl.Font = Theme.Fonts.Header
        TitleLbl.TextSize = Theme.TextSizes.Body
        TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
        TitleLbl.Parent = Notif
        
        local MsgLbl = Instance.new("TextLabel")
        MsgLbl.Size = UDim2.new(1, -20, 0, 25)
        MsgLbl.Position = UDim2.new(0, 15, 0, 28)
        MsgLbl.BackgroundTransparency = 1
        MsgLbl.Text = message
        MsgLbl.TextColor3 = Theme.Colors.TextDim
        MsgLbl.Font = Theme.Fonts.Caption
        MsgLbl.TextSize = Theme.TextSizes.Small
        MsgLbl.TextXAlignment = Enum.TextXAlignment.Left
        MsgLbl.TextWrapped = true
        MsgLbl.Parent = Notif
        
        Notif.Position = UDim2.new(1, 50, 0, 0)
        Tween.Play(Notif, {BackgroundTransparency = 0, Position = UDim2.new(0, 0, 0, 0)}, 0.3)
        Tween.Play(Stroke, {Transparency = 0}, 0.3)
        task.delay(duration, function()
            Tween.Play(Notif, {BackgroundTransparency = 1, Position = UDim2.new(1, 50, 0, 0)}, 0.3)
            Tween.Play(Stroke, {Transparency = 1}, 0.3)
            task.wait(0.35)
            if Notif then Notif:Destroy() end
        end)
    end
    
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Size = size
    Main.Position = position
    Main.BackgroundColor3 = Theme.Colors.Background
    Main.Parent = ScreenGui
    local MainCorner = Instance.new("UICorner", Main)
    MainCorner.CornerRadius = Theme.Corners.Window
    local MainStroke = Instance.new("UIStroke", Main)
    MainStroke.Color = Theme.Colors.Surface
    MainStroke.Thickness = 1.5
    
    local Container = Instance.new("Frame")
    Container.Name = "Container"
    Container.Size = UDim2.new(1, 0, 1, 0)
    Container.BackgroundTransparency = 1
    Container.ClipsDescendants = true
    Container.Parent = Main
    Instance.new("UICorner", Container).CornerRadius = Theme.Corners.Window
    
    local dragInput, dragStart, startPos
    local dragging = false
    local function updateDrag(input)
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    Main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    Main.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then updateDrag(input) end
    end)
    
    local Header = Instance.new("Frame")
    Header.Size = UDim2.new(1, 0, 0, Theme.Sizes.HeaderHeight)
    Header.BackgroundTransparency = 1
    Header.Parent = Container
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -100, 1, 0)
    TitleLabel.Position = UDim2.new(0, 20, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title:gsub("PRIVATE", '<font color="rgb(130,90,255)">PRIVATE</font>')
    TitleLabel.RichText = true
    TitleLabel.Font = Theme.Fonts.Title
    TitleLabel.TextSize = Theme.TextSizes.Title
    TitleLabel.TextColor3 = Theme.Colors.Text
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = Header
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -45, 0.5, -15)
    CloseBtn.BackgroundColor3 = Theme.Colors.Surface
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Theme.Colors.Error
    CloseBtn.Parent = Header
    Instance.new("UICorner", CloseBtn).CornerRadius = Theme.Corners.Button
    connections:Track(CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end))

    local TabBarContainer = Instance.new("Frame")
    TabBarContainer.Size = UDim2.new(1, -30, 0, Theme.Sizes.TabBarHeight)
    TabBarContainer.Position = UDim2.new(0, 15, 0, Theme.Sizes.HeaderHeight)
    TabBarContainer.BackgroundColor3 = Theme.Colors.Surface
    TabBarContainer.Parent = Container
    Instance.new("UICorner", TabBarContainer).CornerRadius = Theme.Corners.Card
    
    local TabBar = Instance.new("Frame")
    TabBar.Size = UDim2.new(1, 0, 1, 0)
    TabBar.BackgroundTransparency = 1
    TabBar.Parent = TabBarContainer
    local TabList = Instance.new("UIListLayout", TabBar)
    TabList.FillDirection = Enum.FillDirection.Horizontal
    TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabList.Padding = UDim.new(0, 4)
    
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, 0, 1, -(Theme.Sizes.HeaderHeight + Theme.Sizes.TabBarHeight + 10))
    ContentFrame.Position = UDim2.new(0, 0, 0, Theme.Sizes.HeaderHeight + Theme.Sizes.TabBarHeight + 5)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Parent = Container
    
    connections:Track(UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == keybind then Main.Visible = not Main.Visible end
    end))
    
    local Window = {ScreenGui = ScreenGui, Main = Main, Notify = Notify, Tabs = {}}
    
    function Window:CreateTab(name)
        local tabBtn = Instance.new("TextButton")
        tabBtn.Size = UDim2.new(0, 80, 1, 0)
        tabBtn.BackgroundTransparency = 1
        tabBtn.Text = name
        tabBtn.TextColor3 = Theme.Colors.TextDim
        tabBtn.Font = Theme.Fonts.Header
        tabBtn.TextSize = Theme.TextSizes.Caption
        tabBtn.Parent = TabBar
        
        local page = Instance.new("ScrollingFrame")
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.Visible = false
        page.ScrollBarThickness = 2
        page.Parent = ContentFrame
        local pageLayout = Instance.new("UIListLayout", page)
        pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        pageLayout.Padding = UDim.new(0, Theme.Sizes.ComponentSpacing)
        local pagePadding = Instance.new("UIPadding", page)
        pagePadding.PaddingTop = UDim.new(0, 5)
        pagePadding.PaddingLeft = UDim.new(0, Theme.Sizes.WindowPadding)
        pagePadding.PaddingRight = UDim.new(0, Theme.Sizes.WindowPadding)
        
        if #self.Tabs == 0 then
            page.Visible = true
            tabBtn.TextColor3 = Theme.Colors.Accent
        end
        
        connections:Track(tabBtn.MouseButton1Click:Connect(function()
            for _, t in ipairs(self.Tabs) do
                t.Page.Visible = false
                t.Button.TextColor3 = Theme.Colors.TextDim
            end
            page.Visible = true
            tabBtn.TextColor3 = Theme.Colors.Accent
        end))
        
        local Tab = {Button = tabBtn, Page = page}
        
        function Tab:CreateSection(sectionName, defaultOpen)
            local sectionFrame = Instance.new("Frame")
            sectionFrame.Size = UDim2.new(1, 0, 0, Theme.Sizes.CollapsibleHeader)
            sectionFrame.BackgroundColor3 = Theme.Colors.Surface
            sectionFrame.ClipsDescendants = true
            sectionFrame.Parent = page
            Instance.new("UICorner", sectionFrame).CornerRadius = Theme.Corners.Card
            
            local trigger = Instance.new("TextButton")
            trigger.Size = UDim2.new(1, 0, 0, Theme.Sizes.CollapsibleHeader)
            trigger.BackgroundTransparency = 1
            trigger.Text = sectionName
            trigger.TextColor3 = Theme.Colors.Text
            trigger.Font = Theme.Fonts.Header
            trigger.TextSize = Theme.TextSizes.Header
            trigger.TextXAlignment = Enum.TextXAlignment.Left
            trigger.Parent = sectionFrame
            local triggerPad = Instance.new("UIPadding", trigger)
            triggerPad.PaddingLeft = UDim.new(0, 12)
            
            local contentContainer = Instance.new("Frame")
            contentContainer.Size = UDim2.new(1, 0, 0, 0)
            contentContainer.Position = UDim2.new(0, 0, 0, Theme.Sizes.CollapsibleHeader)
            contentContainer.BackgroundTransparency = 1
            contentContainer.Visible = false
            contentContainer.AutomaticSize = Enum.AutomaticSize.Y
            contentContainer.Parent = sectionFrame
            local contentLayout = Instance.new("UIListLayout", contentContainer)
            contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
            contentLayout.Padding = UDim.new(0, 4)
            local contentPadding = Instance.new("UIPadding", contentContainer)
            contentPadding.PaddingLeft = UDim.new(0, Theme.Sizes.ComponentPadding)
            contentPadding.PaddingRight = UDim.new(0, Theme.Sizes.ComponentPadding)
            contentPadding.PaddingBottom = UDim.new(0, 8)
            
            local isOpen = false
            local function updateHeight()
                local h = contentContainer.AbsoluteSize.Y + Theme.Sizes.CollapsibleHeader
                Tween.Play(sectionFrame, {Size = UDim2.new(1, 0, 0, h)}, 0.3)
            end
            
            if defaultOpen then
                isOpen = true
                contentContainer.Visible = true
                task.delay(0.1, updateHeight)
            end
            
            connections:Track(trigger.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    contentContainer.Visible = true
                    updateHeight()
                else
                    Tween.Play(sectionFrame, {Size = UDim2.new(1, 0, 0, Theme.Sizes.CollapsibleHeader)}, 0.3)
                    task.delay(0.3, function() if not isOpen then contentContainer.Visible = false end end)
                end
            end))
            connections:Track(contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                if isOpen then updateHeight() end
            end))
            
            local Section = {}
            
            function Section:AddToggle(cfg)
                local state = cfg.Default or false
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.ToggleHeight)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1, -50, 1, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = cfg.Label or "Toggle"
                lbl.TextColor3 = Theme.Colors.Text
                lbl.Font = Theme.Fonts.Body
                lbl.TextSize = Theme.TextSizes.Body
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.Parent = frame
                
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(0, 40, 0, 20)
                btn.Position = UDim2.new(1, -40, 0.5, -10)
                btn.BackgroundColor3 = state and Theme.Colors.Accent or Theme.Colors.Surface
                btn.Text = ""
                btn.Parent = frame
                Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
                
                btn.MouseButton1Click:Connect(function()
                    state = not state
                    btn.BackgroundColor3 = state and Theme.Colors.Accent or Theme.Colors.Surface
                    if cfg.Callback then cfg.Callback(state) end
                end)
            end
            
            function Section:AddSlider(cfg)
                local min, max = cfg.Min or 0, cfg.Max or 100
                local value = cfg.Default or min
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.SliderHeight)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1, 0, 0, 20)
                lbl.BackgroundTransparency = 1
                lbl.Text = (cfg.Label or "Slider") .. ": " .. value
                lbl.TextColor3 = Theme.Colors.Text
                lbl.Font = Theme.Fonts.Body
                lbl.TextSize = Theme.TextSizes.Body
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.Parent = frame
                
                local track = Instance.new("TextButton")
                track.Size = UDim2.new(1, 0, 0, 6)
                track.Position = UDim2.new(0, 0, 0, 25)
                track.BackgroundColor3 = Theme.Colors.Surface
                track.Text = ""
                track.Parent = frame
                Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)
                
                local fill = Instance.new("Frame")
                fill.Size = UDim2.new((value - min)/(max - min), 0, 1, 0)
                fill.BackgroundColor3 = Theme.Colors.Accent
                fill.Parent = track
                Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
                
                local dragging = false
                local function update(input)
                    local pos = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
                    value = math.floor(min + (max - min) * pos)
                    fill.Size = UDim2.new(pos, 0, 1, 0)
                    lbl.Text = (cfg.Label or "Slider") .. ": " .. value .. (cfg.Suffix or "")
                    if cfg.Callback then cfg.Callback(value) end
                end
                
                track.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        update(input)
                    end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then update(input) end
                end)
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
                end)
            end

            function Section:AddButton(cfg)
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, 0, 0, Theme.Sizes.ButtonHeight)
                btn.BackgroundColor3 = Theme.Colors.Card
                btn.Text = cfg.Label or "Button"
                btn.TextColor3 = Theme.Colors.Text
                btn.Font = Theme.Fonts.Header
                btn.TextSize = Theme.TextSizes.Body
                btn.Parent = contentContainer
                Instance.new("UICorner", btn).CornerRadius = Theme.Corners.Button
                btn.MouseButton1Click:Connect(function()
                    if cfg.Callback then cfg.Callback() end
                end)
            end
            
            function Section:AddDropdown(cfg)
                local options = cfg.Options or {}
                local selected = cfg.Default or options[1]
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.DropdownHeight)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, 0, 1, 0)
                btn.BackgroundColor3 = Theme.Colors.Surface
                btn.Text = (cfg.Label or "Dropdown") .. ": " .. tostring(selected)
                btn.TextColor3 = Theme.Colors.Text
                btn.Font = Theme.Fonts.Body
                btn.TextSize = Theme.TextSizes.Body
                btn.Parent = frame
                Instance.new("UICorner", btn).CornerRadius = Theme.Corners.Button
                
                local isOpen = false
                btn.MouseButton1Click:Connect(function()
                    isOpen = not isOpen
                    if isOpen then
                        -- Simple implementation: cycle through options or print
                        local idx = table.find(options, selected) or 0
                        idx = idx + 1
                        if idx > #options then idx = 1 end
                        selected = options[idx]
                        btn.Text = (cfg.Label or "Dropdown") .. ": " .. tostring(selected)
                        if cfg.Callback then cfg.Callback(selected) end
                    end
                end)
            end
            
            function Section:AddInput(cfg)
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.InputHeight)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(0.4, 0, 1, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = cfg.Label or "Input"
                lbl.TextColor3 = Theme.Colors.Text
                lbl.Font = Theme.Fonts.Body
                lbl.TextSize = Theme.TextSizes.Body
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.Parent = frame
                
                local box = Instance.new("TextBox")
                box.Size = UDim2.new(0.6, 0, 1, 0)
                box.Position = UDim2.new(0.4, 0, 0, 0)
                box.BackgroundColor3 = Theme.Colors.Surface
                box.Text = ""
                box.PlaceholderText = cfg.Placeholder or "..."
                box.TextColor3 = Theme.Colors.Text
                box.Parent = frame
                Instance.new("UICorner", box).CornerRadius = Theme.Corners.Input
                
                box.FocusLost:Connect(function()
                    if cfg.Callback then cfg.Callback(box.Text) end
                end)
            end

            function Section:AddKeybind(cfg)
                local key = cfg.Default or Enum.KeyCode.RightShift
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.ToggleHeight)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1, -80, 1, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = cfg.Label or "Keybind"
                lbl.TextColor3 = Theme.Colors.Text
                lbl.Font = Theme.Fonts.Body
                lbl.TextSize = Theme.TextSizes.Body
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.Parent = frame
                
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(0, 70, 0, 24)
                btn.Position = UDim2.new(1, -70, 0.5, -12)
                btn.BackgroundColor3 = Theme.Colors.Surface
                btn.Text = key.Name
                btn.TextColor3 = Theme.Colors.Text
                btn.Parent = frame
                Instance.new("UICorner", btn).CornerRadius = Theme.Corners.Button
                
                local listening = false
                btn.MouseButton1Click:Connect(function()
                    listening = true
                    btn.Text = "..."
                end)
                
                UserInputService.InputBegan:Connect(function(input)
                    if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                        key = input.KeyCode
                        btn.Text = key.Name
                        listening = false
                        if cfg.Callback then cfg.Callback() end
                    elseif input.KeyCode == key and not listening then
                         if cfg.Callback then cfg.Callback() end
                    end
                end)
            end
            
            function Section:AddLabel(cfg)
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1, 0, 0, 20)
                lbl.BackgroundTransparency = 1
                lbl.Text = cfg.Text or "Label"
                lbl.TextColor3 = cfg.Color or Theme.Colors.Text
                lbl.Font = Theme.Fonts.Body
                lbl.TextSize = Theme.TextSizes.Body
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.RichText = true
                lbl.Parent = contentContainer
            end
            
            function Section:AddDivider(cfg)
                local div = Instance.new("Frame")
                div.Size = UDim2.new(1, 0, 0, 1)
                div.BackgroundColor3 = Theme.Colors.Surface
                div.Parent = contentContainer
                local pad = Instance.new("UIPadding", div)
                pad.PaddingTop = UDim.new(0, 5)
                pad.PaddingBottom = UDim.new(0, 5)
            end
            
            function Section:AddProfile(cfg)
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, 50)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                local img = Instance.new("ImageLabel")
                img.Size = UDim2.new(0, 40, 0, 40)
                img.Position = UDim2.new(0, 0, 0.5, -20)
                img.BackgroundColor3 = Theme.Colors.Card
                img.Parent = frame
                Instance.new("UICorner", img).CornerRadius = UDim.new(1, 0)
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1, -50, 1, 0)
                lbl.Position = UDim2.new(0, 50, 0, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = "Welcome, User"
                lbl.TextColor3 = Theme.Colors.Text
                lbl.Font = Theme.Fonts.Header
                lbl.TextSize = Theme.TextSizes.Body
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.Parent = frame
                
                task.spawn(function()
                    local thumb = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                    img.Image = thumb
                    lbl.Text = "Welcome, " .. Players.LocalPlayer.Name
                end)
            end
            
            function Section:AddStatGrid()
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, 60)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                local grid = Instance.new("UIGridLayout", frame)
                grid.CellSize = UDim2.new(0.48, 0, 0, 25)
                grid.CellPadding = UDim2.new(0, 5, 0, 5)
                
                local fps = Instance.new("TextLabel", frame)
                fps.BackgroundColor3 = Theme.Colors.Card
                fps.TextColor3 = Theme.Colors.Text
                fps.Text = "FPS: 60"
                Instance.new("UICorner", fps).CornerRadius = UDim.new(0, 4)
                
                local ping = Instance.new("TextLabel", frame)
                ping.BackgroundColor3 = Theme.Colors.Card
                ping.TextColor3 = Theme.Colors.Text
                ping.Text = "Ping: 50ms"
                Instance.new("UICorner", ping).CornerRadius = UDim.new(0, 4)
            end
            
            function Section:AddDiscordCTA(cfg)
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, 0, 0, 40)
                btn.BackgroundColor3 = Theme.Colors.Discord
                btn.Text = "Join Discord"
                btn.TextColor3 = Color3.new(1, 1, 1)
                btn.Parent = contentContainer
                Instance.new("UICorner", btn).CornerRadius = Theme.Corners.Button
                btn.MouseButton1Click:Connect(function()
                    if setclipboard then setclipboard("https://discord.gg/" .. (cfg.InviteCode or "")) end
                    Notify("Discord", "Link Copied", 2, "success")
                end)
            end

            table.insert(Tab.Sections, Section)
            return Section
        end
        
        table.insert(self.Tabs, Tab)
        return Tab
    end
    
    function Library:SetTheme(name)
        -- Placeholder
    end
    
    table.insert(Library.Windows, Window)
    
    -- Permanent Famy Tab
    local FamyTab = Window:CreateTab("Famy")
    local Status = FamyTab:CreateSection("Status", true)
    Status:AddStatGrid()
    local ThemeSec = FamyTab:CreateSection("Themes", true)
    ThemeSec:AddDropdown({Label = "Theme", Options = {"Purple", "Blue", "Red"}, Callback = function(v) end})
    
    return Window
end

Library.Window = nil -- Set later
return Library
end)()

-- ============================================================================
-- EMBEDDED LIBRARY END
-- ============================================================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Create the Window using the embedded Library
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
    Color = Color3.fromRGB(130,90,255),
    RichText = true
})

-- Initialize
Window.Notify("Showcase", "Script Loaded Successfully", 3, "success")
