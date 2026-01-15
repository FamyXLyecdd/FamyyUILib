--[[
    ██████╗ ███████╗██╗   ██╗██╗   ██╗██╗   ██╗    ██████╗ ██████╗ ██╗██╗   ██╗ █████╗ ████████╗███████╗
    ██╔══██╗██╔════╝██║   ██║██║   ██║╚██╗ ██╔╝    ██╔══██╗██╔══██╗██║██║   ██║██╔══██╗╚══██╔══╝██╔════╝
    ██████╔╝█████╗  ██║   ██║██║   ██║ ╚████╔╝     ██████╔╝██████╔╝██║██║   ██║███████║   ██║   █████╗  
    ██╔═══╝ ██╔══╝  ██║   ██║██║   ██║  ╚██╔╝      ██╔═══╝ ██╔══██╗██║╚██╗ ██╔╝██╔══██║   ██║   ██╔══╝  
    ██║     ███████╗╚██████╔╝╚██████╔╝   ██║       ██║     ██║  ██║██║ ╚████╔╝ ██║  ██║   ██║   ███████╗
    ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝    ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═╝   ╚═╝   ╚══════╝
    
    FAMYY PRIVATE v9.0 - Modular UI Library
    
    A professional Roblox UI library for script developers.
    Features modular architecture, settings persistence, and extensive component library.
    
    Usage:
        local Library = loadstring(game:HttpGet("URL"))()
        local Window = Library:CreateWindow({
            Title = "My Script",
            Keybind = Enum.KeyCode.RightShift
        })
        local Tab = Window:CreateTab("Main")
        local Section = Tab:CreateSection("Features")
        Section:AddToggle({Label = "Feature", Callback = function(v) print(v) end})
]]

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local Stats = game:GetService("Stats")

-- ============================================================================
-- MODULE LOADING (for exploit environment, modules are embedded)
-- ============================================================================

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

-- ============================================================================
-- LIBRARY
-- ============================================================================

local Library = {
    Version = "9.0",
    Theme = Theme,
    Windows = {},
}

--[[
    Creates a new window
    @param config table - Window configuration
        - Title: string - Window title (default: "FAMYY PRIVATE")
        - Subtitle: string - Optional subtitle
        - Size: UDim2 - Window size
        - Position: UDim2 - Window position
        - Keybind: Enum.KeyCode - Toggle keybind (default: RightShift)
        - SaveConfig: boolean - Enable config saving (default: true)
        - ConfigName: string - Config file name
    @return Window
]]
function Library:CreateWindow(config)
    config = config or {}
    
    local title = config.Title or "FAMYY PRIVATE"
    local subtitle = config.Subtitle
    local size = config.Size or Theme.Sizes.WindowDefault
    local position = config.Position or UDim2.new(0.05, 0, 0.5, -240)
    local keybind = config.Keybind or Enum.KeyCode.RightShift
    local saveConfig = config.SaveConfig ~= false
    local configName = config.ConfigName or "default"
    
    -- Clean up existing windows with same name
    local guiParent = Safety.GetGuiParent()
    local existingGui = guiParent:FindFirstChild("FamyyPrivate")
    if existingGui then existingGui:Destroy() end
    
    -- Connection manager
    local connections = Connections.new()
    
    -- Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FamyyPrivate"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = guiParent
    
    -- Notification container
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
    
    -- Notification function
    local function Notify(ntitle, message, duration, notifType)
        duration = duration or 3
        notifType = notifType or "info"
        
        local typeColors = {
            info = Theme.Colors.Accent,
            success = Theme.Colors.Success,
            warning = Theme.Colors.Warning,
            error = Theme.Colors.Error,
        }
        local accentColor = typeColors[notifType] or Theme.Colors.Accent
        
        local Notif = Instance.new("Frame")
        Notif.Size = UDim2.new(1, 0, 0, 60)
        Notif.BackgroundColor3 = Theme.Colors.Surface
        Notif.BackgroundTransparency = 1
        Notif.Parent = NotifContainer
        Instance.new("UICorner", Notif).CornerRadius = Theme.Corners.Notification
        
        local Stroke = Instance.new("UIStroke", Notif)
        Stroke.Color = accentColor
        Stroke.Thickness = 1
        Stroke.Transparency = 1
        
        local Bar = Instance.new("Frame")
        Bar.Size = UDim2.new(0, 3, 1, -10)
        Bar.Position = UDim2.new(0, 5, 0, 5)
        Bar.BackgroundColor3 = accentColor
        Bar.Parent = Notif
        Instance.new("UICorner", Bar).CornerRadius = UDim.new(0, 2)
        
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
            if Notif and Notif.Parent then Notif:Destroy() end
        end)
    end
    
    -- Main Window Frame
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Size = size
    Main.Position = position
    Main.BackgroundColor3 = Theme.Colors.Background
    Main.Active = true
    Main.Draggable = true
    Main.Parent = ScreenGui
    
    local MainCorner = Instance.new("UICorner", Main)
    MainCorner.CornerRadius = Theme.Corners.Window
    
    local MainStroke = Instance.new("UIStroke", Main)
    MainStroke.Color = Theme.Colors.Surface
    MainStroke.Thickness = 1.5
    
    -- Container with clipping
    local Container = Instance.new("Frame")
    Container.Name = "Container"
    Container.Size = UDim2.new(1, 0, 1, 0)
    Container.BackgroundTransparency = 1
    Container.ClipsDescendants = true
    Container.Parent = Main
    Instance.new("UICorner", Container).CornerRadius = Theme.Corners.Window
    
    -- Header
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Size = UDim2.new(1, 0, 0, Theme.Sizes.HeaderHeight)
    Header.BackgroundTransparency = 1
    Header.Parent = Container
    
    -- Title
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
    
    -- Close Button
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -45, 0.5, -15)
    CloseBtn.BackgroundColor3 = Theme.Colors.Surface
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Theme.Colors.Error
    CloseBtn.Font = Theme.Fonts.Header
    CloseBtn.TextSize = 14
    CloseBtn.AutoButtonColor = false
    CloseBtn.Parent = Header
    Instance.new("UICorner", CloseBtn).CornerRadius = Theme.Corners.Button
    
    connections:Track(CloseBtn.MouseEnter:Connect(function()
        Tween.Play(CloseBtn, {BackgroundColor3 = Theme.Colors.Error, TextColor3 = Theme.Colors.Text}, 0.15)
    end))
    connections:Track(CloseBtn.MouseLeave:Connect(function()
        Tween.Play(CloseBtn, {BackgroundColor3 = Theme.Colors.Surface, TextColor3 = Theme.Colors.Error}, 0.15)
    end))
    connections:Track(CloseBtn.MouseButton1Click:Connect(function()
        Tween.Play(Main, {BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 0)}, 0.2)
        task.wait(0.25)
        connections:DisconnectAll()
        ScreenGui:Destroy()
    end))
    
    -- Minimize Button
    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 30, 0, 30)
    MinBtn.Position = UDim2.new(1, -80, 0.5, -15)
    MinBtn.BackgroundColor3 = Theme.Colors.Surface
    MinBtn.Text = "-"
    MinBtn.TextColor3 = Theme.Colors.Text
    MinBtn.Font = Theme.Fonts.Header
    MinBtn.TextSize = 18
    MinBtn.AutoButtonColor = false
    MinBtn.Parent = Header
    Instance.new("UICorner", MinBtn).CornerRadius = Theme.Corners.Button
    
    connections:Track(MinBtn.MouseEnter:Connect(function()
        Tween.Play(MinBtn, {BackgroundColor3 = Theme.Colors.SurfaceHover}, 0.15)
    end))
    connections:Track(MinBtn.MouseLeave:Connect(function()
        Tween.Play(MinBtn, {BackgroundColor3 = Theme.Colors.Surface}, 0.15)
    end))
    
    -- Minimized Icon
    local MinIcon = Instance.new("TextLabel")
    MinIcon.Size = UDim2.new(1, 0, 1, 0)
    MinIcon.BackgroundTransparency = 1
    MinIcon.Text = "F"
    MinIcon.Font = Theme.Fonts.Title
    MinIcon.TextColor3 = Theme.Colors.Accent
    MinIcon.TextSize = 28
    MinIcon.Visible = false
    MinIcon.Parent = Container
    
    -- Tab Bar (Carousel style - active tab centered)
    local TabBarContainer = Instance.new("Frame")
    TabBarContainer.Name = "TabBarContainer"
    TabBarContainer.Size = UDim2.new(1, -30, 0, Theme.Sizes.TabBarHeight)
    TabBarContainer.Position = UDim2.new(0, 15, 0, Theme.Sizes.HeaderHeight)
    TabBarContainer.BackgroundColor3 = Theme.Colors.Surface
    TabBarContainer.ClipsDescendants = true
    TabBarContainer.Parent = Container
    Instance.new("UICorner", TabBarContainer).CornerRadius = Theme.Corners.Card
    
    -- Left arrow button
    local LeftArrow = Instance.new("TextButton")
    LeftArrow.Name = "LeftArrow"
    LeftArrow.Size = UDim2.new(0, 24, 1, 0)
    LeftArrow.Position = UDim2.new(0, 0, 0, 0)
    LeftArrow.BackgroundTransparency = 1
    LeftArrow.Text = "<"
    LeftArrow.TextColor3 = Theme.Colors.TextDim
    LeftArrow.Font = Theme.Fonts.Header
    LeftArrow.TextSize = 16
    LeftArrow.AutoButtonColor = false
    LeftArrow.ZIndex = 2
    LeftArrow.Parent = TabBarContainer
    
    -- Right arrow button
    local RightArrow = Instance.new("TextButton")
    RightArrow.Name = "RightArrow"
    RightArrow.Size = UDim2.new(0, 24, 1, 0)
    RightArrow.Position = UDim2.new(1, -24, 0, 0)
    RightArrow.BackgroundTransparency = 1
    RightArrow.Text = ">"
    RightArrow.TextColor3 = Theme.Colors.TextDim
    RightArrow.Font = Theme.Fonts.Header
    RightArrow.TextSize = 16
    RightArrow.AutoButtonColor = false
    RightArrow.ZIndex = 2
    RightArrow.Parent = TabBarContainer
    
    -- Tab content area (between arrows)
    local TabBar = Instance.new("Frame")
    TabBar.Name = "TabBar"
    TabBar.Size = UDim2.new(1, -48, 1, 0)
    TabBar.Position = UDim2.new(0, 24, 0, 0)
    TabBar.BackgroundTransparency = 1
    TabBar.ClipsDescendants = true
    TabBar.Active = true -- Enable input detection
    TabBar.Parent = TabBarContainer
    
    -- Current tab index for carousel
    local currentTabIndex = 1
    local tabButtons = {}
    
    -- Drag/swipe state for tab carousel
    local tabDragging = false
    local tabDragStart = 0
    local tabDragThreshold = 50 -- Pixels to swipe before switching
    
    -- Content Frame
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Name = "Content"
    ContentFrame.Size = UDim2.new(1, 0, 1, -(Theme.Sizes.HeaderHeight + Theme.Sizes.TabBarHeight + 10))
    ContentFrame.Position = UDim2.new(0, 0, 0, Theme.Sizes.HeaderHeight + Theme.Sizes.TabBarHeight + 5)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.ClipsDescendants = true
    ContentFrame.Parent = Container
    
    -- Minimize/Expand logic
    local isMinimized = false
    local expandBtn = nil
    
    connections:Track(MinBtn.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            Tween.Play(Main, {Size = Theme.Sizes.WindowMinimized}, 0.3)
            Tween.Play(MainCorner, {CornerRadius = UDim.new(1, 0)}, 0.3)
            Tween.Play(MainStroke, {Color = Theme.Colors.Accent}, 0.3)
            Header.Visible = false
            TabBarContainer.Visible = false
            ContentFrame.Visible = false
            MinIcon.Visible = true
            
            -- Create expand button that doesn't block dragging
            expandBtn = Instance.new("TextButton", Container)
            expandBtn.Size = UDim2.new(1, 0, 1, 0)
            expandBtn.BackgroundTransparency = 1
            expandBtn.Text = ""
            expandBtn.Active = false -- Allow drag events to pass through to Main
            expandBtn.AutoButtonColor = false
            
            -- Use MouseButton1Click but also make MinIcon clickable
            MinIcon.Active = true
            local minIconBtn = Instance.new("TextButton", MinIcon)
            minIconBtn.Size = UDim2.new(1, 0, 1, 0)
            minIconBtn.BackgroundTransparency = 1
            minIconBtn.Text = ""
            minIconBtn.Active = false -- Don't block dragging
            
            local function expand()
                isMinimized = false
                if expandBtn then expandBtn:Destroy() expandBtn = nil end
                if minIconBtn then minIconBtn:Destroy() end
                MinIcon.Visible = false
                MinIcon.Active = false
                Tween.Play(Main, {Size = size}, 0.3)
                Tween.Play(MainCorner, {CornerRadius = Theme.Corners.Window}, 0.3)
                Tween.Play(MainStroke, {Color = Theme.Colors.Surface}, 0.3)
                task.wait(0.2)
                Header.Visible = true
                TabBarContainer.Visible = true
                ContentFrame.Visible = true
            end
            
            -- Double-click to expand (single click allows drag)
            local lastClick = 0
            connections:Track(minIconBtn.MouseButton1Click:Connect(function()
                local now = tick()
                if now - lastClick < 0.3 then
                    expand()
                end
                lastClick = now
            end))
            
            -- Also expand on regular click of the expand button area
            connections:Track(expandBtn.MouseButton1Click:Connect(expand))
        end
    end))
    
    -- Keybind toggle
    connections:Track(UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == keybind then
            Main.Visible = not Main.Visible
            if Main.Visible then
                Notify("UI Toggled", "Press " .. keybind.Name .. " to hide", 2, "info")
            end
        end
    end))
    
    -- Window object
    local Window = {
        ScreenGui = ScreenGui,
        Main = Main,
        Notify = Notify,
        Connections = connections,
        Tabs = {},
        ActiveTab = nil,
    }
    
    --[[
        Creates a new tab
        @param name string - Tab name
        @return Tab
    ]]
    function Window:CreateTab(name)
        local tabIndex = #self.Tabs + 1
        
        -- Create tab button (will be positioned by updateTabDisplay)
        local tabBtn = Instance.new("TextButton")
        tabBtn.Name = "Tab_" .. tabIndex
        tabBtn.Size = UDim2.new(0, 80, 0, 24)
        tabBtn.BackgroundTransparency = 1
        tabBtn.Text = name
        tabBtn.TextColor3 = Theme.Colors.TextDim
        tabBtn.TextTransparency = 0.5
        tabBtn.Font = Theme.Fonts.Header
        tabBtn.TextSize = Theme.TextSizes.Caption
        tabBtn.TextTruncate = Enum.TextTruncate.AtEnd
        tabBtn.AutoButtonColor = false
        tabBtn.Visible = false
        tabBtn.Parent = TabBar
        
        table.insert(tabButtons, {
            Button = tabBtn,
            Name = name,
            Index = tabIndex,
        })
        
        -- Function to update tab carousel display with smooth animations
        local function updateTabDisplay(animate)
            local totalTabs = #tabButtons
            local barWidth = TabBar.AbsoluteSize.X
            if barWidth == 0 then barWidth = 200 end -- Fallback
            
            for i, tabData in ipairs(tabButtons) do
                local btn = tabData.Button
                local offset = i - currentTabIndex
                
                -- Calculate position (center = 0 offset)
                local centerX = barWidth / 2
                local tabWidth = 80
                local spacing = 15
                
                -- Position based on offset from current
                local xPos = centerX + (offset * (tabWidth + spacing)) - (tabWidth / 2)
                
                -- Determine visibility and style based on position
                local isCenter = (i == currentTabIndex)
                local isAdjacent = math.abs(offset) == 1
                local isVisible = math.abs(offset) <= 2
                
                btn.Visible = isVisible
                
                local targetPos = UDim2.new(0, xPos, 0.5, -12)
                local animTime = animate ~= false and 0.25 or 0
                
                if isCenter then
                    -- Active/centered tab - full opacity, larger
                    local targetSize = UDim2.new(0, 90, 0, 26)
                    if animTime > 0 then
                        Tween.Play(btn, {Position = targetPos, Size = targetSize}, animTime)
                        Tween.Play(btn, {TextColor3 = Theme.Colors.Text, TextTransparency = 0}, animTime)
                    else
                        btn.Position = targetPos
                        btn.Size = targetSize
                        btn.TextColor3 = Theme.Colors.Text
                        btn.TextTransparency = 0
                    end
                    btn.TextSize = 14
                    btn.Font = Enum.Font.GothamBold
                elseif isAdjacent then
                    -- Adjacent tabs - dimmed, smaller
                    local targetSize = UDim2.new(0, 70, 0, 22)
                    if animTime > 0 then
                        Tween.Play(btn, {Position = targetPos, Size = targetSize}, animTime)
                        Tween.Play(btn, {TextColor3 = Theme.Colors.TextDim, TextTransparency = 0.3}, animTime)
                    else
                        btn.Position = targetPos
                        btn.Size = targetSize
                        btn.TextColor3 = Theme.Colors.TextDim
                        btn.TextTransparency = 0.3
                    end
                    btn.TextSize = 12
                    btn.Font = Enum.Font.GothamMedium
                else
                    -- Far tabs - very dim
                    local targetSize = UDim2.new(0, 60, 0, 20)
                    if animTime > 0 then
                        Tween.Play(btn, {Position = targetPos, Size = targetSize}, animTime)
                        Tween.Play(btn, {TextColor3 = Theme.Colors.TextMuted, TextTransparency = 0.6}, animTime)
                    else
                        btn.Position = targetPos
                        btn.Size = targetSize
                        btn.TextColor3 = Theme.Colors.TextMuted
                        btn.TextTransparency = 0.6
                    end
                    btn.TextSize = 11
                    btn.Font = Enum.Font.Gotham
                end
            end
            
            -- Update arrow visibility and style
            LeftArrow.Visible = totalTabs > 1
            RightArrow.Visible = totalTabs > 1
            
            -- Update arrow colors based on whether they can navigate
            local canGoLeft = currentTabIndex > 1
            local canGoRight = currentTabIndex < totalTabs
            
            LeftArrow.TextColor3 = canGoLeft and Theme.Colors.Text or Theme.Colors.TextMuted
            LeftArrow.TextTransparency = canGoLeft and 0 or 0.5
            RightArrow.TextColor3 = canGoRight and Theme.Colors.Text or Theme.Colors.TextMuted
            RightArrow.TextTransparency = canGoRight and 0 or 0.5
        end
        
        -- Function to switch to this tab with clean animation
        local function switchToTab(index)
            if index < 1 or index > #tabButtons then return end
            if index == currentTabIndex then return end -- Don't switch to same tab
            
            local previousIndex = currentTabIndex
            currentTabIndex = index
            
            -- Get the page to show
            local pageName = "Tab_" .. tabButtons[index].Name
            local pageToShow = ContentFrame:FindFirstChild(pageName)
            
            -- Hide all other pages immediately, show new one
            for _, child in ipairs(ContentFrame:GetChildren()) do
                if child:IsA("ScrollingFrame") then
                    if child.Name == pageName then
                        -- This is the page to show - simple fade in
                        child.Visible = true
                        child.BackgroundTransparency = 1
                        -- Reset scroll position
                        child.CanvasPosition = Vector2.new(0, 0)
                    else
                        -- Hide other pages
                        child.Visible = false
                    end
                end
            end
            
            -- Update active tab reference
            self.ActiveTab = tabButtons[index].Button
            
            -- Update tab carousel display with animation
            updateTabDisplay(true)
        end
        
        -- Store switch function for arrows
        Window._switchToTab = switchToTab
        Window._updateTabDisplay = updateTabDisplay
        
        -- Create content page
        local page = Instance.new("ScrollingFrame")
        page.Name = "Tab_" .. name
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.Visible = false
        page.ScrollBarThickness = 2
        page.ScrollBarImageColor3 = Theme.Colors.Accent
        page.AutomaticCanvasSize = Enum.AutomaticSize.Y
        page.CanvasSize = UDim2.new(0, 0, 0, 0)
        page.Parent = ContentFrame
        
        local pageLayout = Instance.new("UIListLayout", page)
        pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        pageLayout.Padding = UDim.new(0, Theme.Sizes.ComponentSpacing)
        
        local pagePadding = Instance.new("UIPadding", page)
        pagePadding.PaddingTop = UDim.new(0, 5)
        pagePadding.PaddingLeft = UDim.new(0, Theme.Sizes.WindowPadding)
        pagePadding.PaddingRight = UDim.new(0, Theme.Sizes.WindowPadding)
        pagePadding.PaddingBottom = UDim.new(0, 10)
        
        -- First tab is active by default
        if #self.Tabs == 0 then
            currentTabIndex = 1
            self.ActiveTab = tabBtn
            page.Visible = true
        end
        
        -- Tab click - switch to this tab
        connections:Track(tabBtn.MouseButton1Click:Connect(function()
            switchToTab(tabIndex)
        end))
        
        -- Arrow click handlers (only set once)
        if tabIndex == 1 then
            connections:Track(LeftArrow.MouseButton1Click:Connect(function()
                if currentTabIndex > 1 then
                    switchToTab(currentTabIndex - 1)
                end
            end))
            
            connections:Track(RightArrow.MouseButton1Click:Connect(function()
                if currentTabIndex < #tabButtons then
                    switchToTab(currentTabIndex + 1)
                end
            end))
            
            -- Arrow hover effects
            connections:Track(LeftArrow.MouseEnter:Connect(function()
                if currentTabIndex > 1 then
                    Tween.Play(LeftArrow, {TextColor3 = Theme.Colors.Accent}, 0.15)
                end
            end))
            connections:Track(LeftArrow.MouseLeave:Connect(function()
                LeftArrow.TextColor3 = currentTabIndex > 1 and Theme.Colors.Text or Theme.Colors.TextMuted
            end))
            connections:Track(RightArrow.MouseEnter:Connect(function()
                if currentTabIndex < #tabButtons then
                    Tween.Play(RightArrow, {TextColor3 = Theme.Colors.Accent}, 0.15)
                end
            end))
            connections:Track(RightArrow.MouseLeave:Connect(function()
                RightArrow.TextColor3 = currentTabIndex < #tabButtons and Theme.Colors.Text or Theme.Colors.TextMuted
            end))
            
            -- Drag/swipe support for tab carousel
            local dragStartX = 0
            local isDraggingTabs = false
            
            connections:Track(TabBar.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    isDraggingTabs = true
                    dragStartX = input.Position.X
                end
            end))
            
            connections:Track(UserInputService.InputChanged:Connect(function(input)
                if isDraggingTabs and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local deltaX = input.Position.X - dragStartX
                    
                    -- Check if dragged past threshold
                    if math.abs(deltaX) >= tabDragThreshold then
                        if deltaX > 0 and currentTabIndex > 1 then
                            -- Swiped right = go to previous tab
                            isDraggingTabs = false
                            if Window._switchToTab then
                                Window._switchToTab(currentTabIndex - 1)
                            end
                        elseif deltaX < 0 and currentTabIndex < #tabButtons then
                            -- Swiped left = go to next tab
                            isDraggingTabs = false
                            if Window._switchToTab then
                                Window._switchToTab(currentTabIndex + 1)
                            end
                        end
                    end
                end
            end))
            
            connections:Track(UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    isDraggingTabs = false
                end
            end))
        end
        
        -- Update display after adding tab
        task.defer(function()
            updateTabDisplay()
        end)
        
        -- Tab object
        local Tab = {
            Button = tabBtn,
            Page = page,
            Sections = {},
        }
        
        --[[
            Creates a collapsible section
            @param sectionName string - Section name
            @param defaultOpen boolean - Open by default
            @return Section
        ]]
        function Tab:CreateSection(sectionName, defaultOpen)
            defaultOpen = defaultOpen ~= false
            
            local sectionFrame = Instance.new("Frame")
            sectionFrame.Name = "Section_" .. sectionName
            sectionFrame.Size = UDim2.new(1, 0, 0, Theme.Sizes.CollapsibleHeader)
            sectionFrame.BackgroundColor3 = Theme.Colors.Surface
            sectionFrame.ClipsDescendants = true
            sectionFrame.Parent = page
            Instance.new("UICorner", sectionFrame).CornerRadius = Theme.Corners.Card
            
            local trigger = Instance.new("TextButton")
            trigger.Size = UDim2.new(1, 0, 0, Theme.Sizes.CollapsibleHeader)
            trigger.BackgroundTransparency = 1
            trigger.Text = ""
            trigger.Parent = sectionFrame
            
            connections:Track(trigger.MouseEnter:Connect(function()
                Tween.Play(sectionFrame, {BackgroundColor3 = Theme.Colors.SurfaceHover}, 0.15)
            end))
            connections:Track(trigger.MouseLeave:Connect(function()
                Tween.Play(sectionFrame, {BackgroundColor3 = Theme.Colors.Surface}, 0.15)
            end))
            
            local sectionLabel = Instance.new("TextLabel")
            sectionLabel.Size = UDim2.new(1, -40, 1, 0)
            sectionLabel.Position = UDim2.new(0, 12, 0, 0)
            sectionLabel.BackgroundTransparency = 1
            sectionLabel.Text = sectionName
            sectionLabel.TextColor3 = Theme.Colors.Text
            sectionLabel.Font = Theme.Fonts.Header
            sectionLabel.TextSize = Theme.TextSizes.Header
            sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            sectionLabel.Parent = trigger
            
            local arrow = Instance.new("ImageLabel")
            arrow.Size = UDim2.new(0, 16, 0, 16)
            arrow.Position = UDim2.new(1, -28, 0.5, -8)
            arrow.BackgroundTransparency = 1
            arrow.Image = "rbxassetid://6031090990"
            arrow.ImageColor3 = Theme.Colors.TextDim
            arrow.Rotation = defaultOpen and 180 or 0
            arrow.Parent = trigger
            
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
            contentPadding.PaddingTop = UDim.new(0, 8)
            contentPadding.PaddingBottom = UDim.new(0, 8)
            
            local isOpen = defaultOpen
            
            local function updateHeight()
                local h = contentContainer.AbsoluteSize.Y + Theme.Sizes.CollapsibleHeader
                Tween.Play(sectionFrame, {Size = UDim2.new(1, 0, 0, h)}, 0.3)
            end
            
            if defaultOpen then
                task.spawn(function()
                    task.wait(0.1)
                    contentContainer.Visible = true
                    updateHeight()
                end)
            end
            
            connections:Track(trigger.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    contentContainer.Visible = true
                    Tween.Play(arrow, {Rotation = 180}, 0.2)
                    updateHeight()
                else
                    Tween.Play(arrow, {Rotation = 0}, 0.2)
                    Tween.Play(sectionFrame, {Size = UDim2.new(1, 0, 0, Theme.Sizes.CollapsibleHeader)}, 0.3)
                    task.delay(0.3, function()
                        if not isOpen then contentContainer.Visible = false end
                    end)
                end
            end))
            
            -- Watch for content changes to update height
            connections:Track(contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                if isOpen then updateHeight() end
            end))
            
            -- Section object with component methods
            local Section = {
                Frame = sectionFrame,
                Container = contentContainer,
            }
            
            -- Helper to create component config
            local function makeConfig(cfg)
                cfg.Theme = Theme
                cfg.Tween = Tween
                cfg.Connections = connections
                cfg.Safety = Safety
                cfg.Notify = Notify
                return cfg
            end
            
            --[[
                Adds a toggle switch
                @param cfg table - {Label, Default, Callback}
            ]]
            function Section:AddToggle(cfg)
                local state = cfg.Default or false
                local callback = cfg.Callback or function() end
                
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.ToggleHeight)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1, -60, 1, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = cfg.Label or "Toggle"
                lbl.TextColor3 = Theme.Colors.Text
                lbl.Font = Theme.Fonts.Body
                lbl.TextSize = Theme.TextSizes.Body
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.Parent = frame
                
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(0, 44, 0, 24)
                btn.Position = UDim2.new(1, -44, 0.5, -12)
                btn.BackgroundColor3 = state and Theme.Colors.Accent or Theme.Colors.Surface
                btn.Text = ""
                btn.AutoButtonColor = false
                btn.Parent = frame
                Instance.new("UICorner", btn).CornerRadius = Theme.Corners.Toggle
                
                local stroke = Instance.new("UIStroke", btn)
                stroke.Color = state and Theme.Colors.Accent or Theme.Colors.TextDim
                stroke.Thickness = 1
                
                local knob = Instance.new("Frame")
                knob.Size = UDim2.new(0, 18, 0, 18)
                knob.Position = state and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
                knob.BackgroundColor3 = Theme.Colors.Text
                knob.Parent = btn
                Instance.new("UICorner", knob).CornerRadius = Theme.Corners.Toggle
                
                local function update()
                    if state then
                        Tween.Play(btn, {BackgroundColor3 = Theme.Colors.Accent})
                        Tween.Play(stroke, {Color = Theme.Colors.Accent})
                        Tween.Play(knob, {Position = UDim2.new(1, -21, 0.5, -9)})
                    else
                        Tween.Play(btn, {BackgroundColor3 = Theme.Colors.Surface})
                        Tween.Play(stroke, {Color = Theme.Colors.TextDim})
                        Tween.Play(knob, {Position = UDim2.new(0, 3, 0.5, -9)})
                    end
                end
                
                connections:Track(btn.MouseButton1Click:Connect(function()
                    state = not state
                    update()
                    local s, e = Safety.Call(callback, state)
                    if not s then warn("[FamyyPrivate] Toggle error:", e) end
                end))
                
                return {
                    Set = function(_, v, fire)
                        state = v
                        update()
                        if fire ~= false then
                            local s, e = Safety.Call(callback, state)
                            if not s then warn("[FamyyPrivate] Toggle error:", e) end
                        end
                    end,
                    Get = function() return state end,
                    Frame = frame,
                }
            end
            
            --[[
                Adds a slider
                @param cfg table - {Label, Min, Max, Default, Step, Suffix, Callback}
            ]]
            function Section:AddSlider(cfg)
                local min = cfg.Min or 0
                local max = cfg.Max or 100
                local value = math.clamp(cfg.Default or min, min, max)
                local step = cfg.Step
                local suffix = cfg.Suffix or ""
                local callback = cfg.Callback or function() end
                
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.SliderHeight)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                
                local topRow = Instance.new("Frame")
                topRow.Size = UDim2.new(1, 0, 0, 20)
                topRow.BackgroundTransparency = 1
                topRow.Parent = frame
                
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(0.7, 0, 1, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = cfg.Label or "Slider"
                lbl.TextColor3 = Theme.Colors.Text
                lbl.Font = Theme.Fonts.Body
                lbl.TextSize = Theme.TextSizes.Body
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.Parent = topRow
                
                local valLbl = Instance.new("TextLabel")
                valLbl.Size = UDim2.new(0.3, 0, 1, 0)
                valLbl.Position = UDim2.new(0.7, 0, 0, 0)
                valLbl.BackgroundTransparency = 1
                valLbl.Text = tostring(value) .. suffix
                valLbl.TextColor3 = Theme.Colors.Accent
                valLbl.Font = Theme.Fonts.Header
                valLbl.TextSize = Theme.TextSizes.Body
                valLbl.TextXAlignment = Enum.TextXAlignment.Right
                valLbl.Parent = topRow
                
                local track = Instance.new("Frame")
                track.Size = UDim2.new(1, 0, 0, 8)
                track.Position = UDim2.new(0, 0, 0, 28)
                track.BackgroundColor3 = Theme.Colors.Surface
                track.Parent = frame
                Instance.new("UICorner", track).CornerRadius = Theme.Corners.Toggle
                
                local fill = Instance.new("Frame")
                fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                fill.BackgroundColor3 = Theme.Colors.Accent
                fill.Parent = track
                Instance.new("UICorner", fill).CornerRadius = Theme.Corners.Toggle
                
                local knobFrame = Instance.new("Frame")
                knobFrame.Size = UDim2.new(0, 16, 0, 16)
                knobFrame.Position = UDim2.new((value - min) / (max - min), -8, 0.5, -8)
                knobFrame.BackgroundColor3 = Theme.Colors.Text
                knobFrame.Parent = track
                Instance.new("UICorner", knobFrame).CornerRadius = Theme.Corners.Toggle
                
                local dragging = false
                
                -- Invisible button overlay to capture input and prevent drag propagation
                local sliderHitbox = Instance.new("TextButton")
                sliderHitbox.Size = UDim2.new(1, 0, 0, 20)
                sliderHitbox.Position = UDim2.new(0, 0, 0, 22)
                sliderHitbox.BackgroundTransparency = 1
                sliderHitbox.Text = ""
                sliderHitbox.Active = true -- Prevents input from going to parent (Main frame)
                sliderHitbox.Parent = frame
                
                local function updateSlider(input)
                    local pos = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
                    local newVal = min + (max - min) * pos
                    if step then newVal = math.floor(newVal / step + 0.5) * step else newVal = math.floor(newVal) end
                    newVal = math.clamp(newVal, min, max)
                    if newVal ~= value then
                        value = newVal
                        local np = (value - min) / (max - min)
                        valLbl.Text = tostring(value) .. suffix
                        Tween.Play(fill, {Size = UDim2.new(np, 0, 1, 0)}, 0.1)
                        Tween.Play(knobFrame, {Position = UDim2.new(np, -8, 0.5, -8)}, 0.1)
                        local s, e = Safety.Call(callback, value)
                        if not s then warn("[FamyyPrivate] Slider error:", e) end
                    end
                end
                
                -- Use button events instead of InputBegan to prevent propagation
                connections:Track(sliderHitbox.MouseButton1Down:Connect(function()
                    dragging = true
                    local input = {Position = UserInputService:GetMouseLocation()}
                    updateSlider(input)
                end))
                connections:Track(UserInputService.InputChanged:Connect(function(input)
                    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        updateSlider(input)
                    end
                end))
                connections:Track(UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = false
                    end
                end))
                
                return {
                    Set = function(_, v, fire)
                        value = math.clamp(v, min, max)
                        local np = (value - min) / (max - min)
                        valLbl.Text = tostring(value) .. suffix
                        Tween.Play(fill, {Size = UDim2.new(np, 0, 1, 0)}, 0.1)
                        Tween.Play(knobFrame, {Position = UDim2.new(np, -8, 0.5, -8)}, 0.1)
                        if fire ~= false then
                            local s, e = Safety.Call(callback, value)
                            if not s then warn("[FamyyPrivate] Slider error:", e) end
                        end
                    end,
                    Get = function() return value end,
                    Frame = frame,
                }
            end
            
            --[[
                Adds a button
                @param cfg table - {Label, Callback, Style}
            ]]
            function Section:AddButton(cfg)
                local callback = cfg.Callback or function() end
                local style = cfg.Style or "secondary"
                
                local styles = {
                    primary = {bg = Theme.Colors.Accent, hover = Theme.Colors.AccentHover, text = Theme.Colors.Text, stroke = Theme.Colors.Accent},
                    secondary = {bg = Theme.Colors.Card, hover = Theme.Colors.CardHover, text = Theme.Colors.Text, stroke = Theme.Colors.TextDim},
                    danger = {bg = Theme.Colors.Card, hover = Theme.Colors.Error, text = Theme.Colors.Error, textHover = Theme.Colors.Text, stroke = Theme.Colors.Error},
                }
                local s = styles[style] or styles.secondary
                
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, 0, 0, Theme.Sizes.ButtonHeight)
                btn.BackgroundColor3 = s.bg
                btn.Text = cfg.Label or "Button"
                btn.TextColor3 = s.text
                btn.Font = Theme.Fonts.Header
                btn.TextSize = Theme.TextSizes.Body
                btn.AutoButtonColor = false
                btn.Parent = contentContainer
                Instance.new("UICorner", btn).CornerRadius = Theme.Corners.Button
                
                -- Add visible border/stroke
                local btnStroke = Instance.new("UIStroke", btn)
                btnStroke.Color = s.stroke
                btnStroke.Thickness = 1
                btnStroke.Transparency = 0.5
                
                connections:Track(btn.MouseEnter:Connect(function()
                    Tween.Play(btn, {BackgroundColor3 = s.hover}, 0.15)
                    Tween.Play(btnStroke, {Transparency = 0, Color = style == "primary" and Theme.Colors.AccentHover or Theme.Colors.Accent}, 0.15)
                    if s.textHover then Tween.Play(btn, {TextColor3 = s.textHover}, 0.15) end
                end))
                connections:Track(btn.MouseLeave:Connect(function()
                    Tween.Play(btn, {BackgroundColor3 = s.bg, TextColor3 = s.text}, 0.15)
                    Tween.Play(btnStroke, {Transparency = 0.5, Color = s.stroke}, 0.15)
                end))
                connections:Track(btn.MouseButton1Click:Connect(function()
                    -- Click animation
                    Tween.Play(btn, {BackgroundColor3 = Theme.Colors.Accent}, 0.05)
                    task.delay(0.1, function()
                        Tween.Play(btn, {BackgroundColor3 = s.bg}, 0.15)
                    end)
                    local success, err = Safety.Call(callback)
                    if not success then warn("[FamyyPrivate] Button error:", err) end
                end))
                
                return {Frame = btn}
            end
            
            --[[
                Adds a dropdown
                @param cfg table - {Label, Options, Default, Multi, Callback}
            ]]
            function Section:AddDropdown(cfg)
                local options = cfg.Options or {}
                local multi = cfg.Multi or false
                local callback = cfg.Callback or function() end
                local selected
                
                if multi then
                    selected = {}
                    if type(cfg.Default) == "table" then
                        for _, v in ipairs(cfg.Default) do selected[v] = true end
                    end
                else
                    selected = type(cfg.Default) == "number" and options[cfg.Default] or cfg.Default or options[1]
                end
                
                local ddOpen = false
                local optHeight = 28
                local maxVisible = 5
                
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.DropdownHeight)
                frame.BackgroundTransparency = 1
                frame.ClipsDescendants = false
                frame.Parent = contentContainer
                
                local header = Instance.new("TextButton")
                header.Size = UDim2.new(1, 0, 0, Theme.Sizes.DropdownHeight)
                header.BackgroundColor3 = Theme.Colors.Surface
                header.Text = ""
                header.AutoButtonColor = false
                header.Parent = frame
                Instance.new("UICorner", header).CornerRadius = Theme.Corners.Button
                
                local headerStroke = Instance.new("UIStroke", header)
                headerStroke.Color = Theme.Colors.TextDim
                headerStroke.Transparency = 0.5
                
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(0.5, -10, 1, 0)
                lbl.Position = UDim2.new(0, 10, 0, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = cfg.Label or "Dropdown"
                lbl.TextColor3 = Theme.Colors.TextDim
                lbl.Font = Theme.Fonts.Body
                lbl.TextSize = Theme.TextSizes.Body
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.Parent = header
                
                local function getDisplayText()
                    if multi then
                        local count = 0
                        for _ in pairs(selected) do count = count + 1 end
                        if count == 0 then return "None" end
                        if count == 1 then for k in pairs(selected) do return k end end
                        return count .. " selected"
                    end
                    return selected or "Select..."
                end
                
                local valLbl = Instance.new("TextLabel")
                valLbl.Size = UDim2.new(0.5, -30, 1, 0)
                valLbl.Position = UDim2.new(0.5, 0, 0, 0)
                valLbl.BackgroundTransparency = 1
                valLbl.Text = getDisplayText()
                valLbl.TextColor3 = Theme.Colors.Text
                valLbl.Font = Theme.Fonts.Body
                valLbl.TextSize = Theme.TextSizes.Body
                valLbl.TextXAlignment = Enum.TextXAlignment.Right
                valLbl.TextTruncate = Enum.TextTruncate.AtEnd
                valLbl.Parent = header
                
                local arrow = Instance.new("ImageLabel")
                arrow.Size = UDim2.new(0, 16, 0, 16)
                arrow.Position = UDim2.new(1, -26, 0.5, -8)
                arrow.BackgroundTransparency = 1
                arrow.Image = "rbxassetid://6031090990"
                arrow.ImageColor3 = Theme.Colors.TextDim
                arrow.Parent = header
                
                local optContainer = Instance.new("ScrollingFrame")
                optContainer.Size = UDim2.new(1, 0, 0, 0)
                optContainer.Position = UDim2.new(0, 0, 0, Theme.Sizes.DropdownHeight + 4)
                optContainer.BackgroundColor3 = Theme.Colors.Surface
                optContainer.BorderSizePixel = 0
                optContainer.ScrollBarThickness = 2
                optContainer.ScrollBarImageColor3 = Theme.Colors.Accent
                optContainer.CanvasSize = UDim2.new(0, 0, 0, #options * optHeight)
                optContainer.Visible = false
                optContainer.ZIndex = 10
                optContainer.Parent = frame
                Instance.new("UICorner", optContainer).CornerRadius = Theme.Corners.Button
                Instance.new("UIStroke", optContainer).Color = Theme.Colors.Accent
                Instance.new("UIListLayout", optContainer).SortOrder = Enum.SortOrder.LayoutOrder
                
                local optBtns = {}
                
                for i, opt in ipairs(options) do
                    local optBtn = Instance.new("TextButton")
                    optBtn.Size = UDim2.new(1, 0, 0, optHeight)
                    optBtn.BackgroundColor3 = Theme.Colors.Surface
                    optBtn.BackgroundTransparency = 0.5
                    optBtn.Text = ""
                    optBtn.AutoButtonColor = false
                    optBtn.ZIndex = 11
                    optBtn.LayoutOrder = i
                    optBtn.Parent = optContainer
                    
                    local optLbl = Instance.new("TextLabel")
                    optLbl.Size = UDim2.new(1, -40, 1, 0)
                    optLbl.Position = UDim2.new(0, 10, 0, 0)
                    optLbl.BackgroundTransparency = 1
                    optLbl.Text = opt
                    optLbl.TextColor3 = Theme.Colors.Text
                    optLbl.Font = Theme.Fonts.Body
                    optLbl.TextSize = Theme.TextSizes.Caption
                    optLbl.TextXAlignment = Enum.TextXAlignment.Left
                    optLbl.ZIndex = 11
                    optLbl.Parent = optBtn
                    
                    local check = Instance.new("TextLabel")
                    check.Size = UDim2.new(0, 20, 1, 0)
                    check.Position = UDim2.new(1, -30, 0, 0)
                    check.BackgroundTransparency = 1
                    check.TextColor3 = Theme.Colors.Accent
                    check.Font = Theme.Fonts.Header
                    check.TextSize = 14
                    check.ZIndex = 11
                    check.Parent = optBtn
                    
                    local function updateCheck()
                        check.Text = (multi and selected[opt]) or (not multi and selected == opt) and "✓" or ""
                    end
                    updateCheck()
                    
                    connections:Track(optBtn.MouseEnter:Connect(function()
                        Tween.Play(optBtn, {BackgroundTransparency = 0, BackgroundColor3 = Theme.Colors.SurfaceHover}, 0.1)
                    end))
                    connections:Track(optBtn.MouseLeave:Connect(function()
                        Tween.Play(optBtn, {BackgroundTransparency = 0.5, BackgroundColor3 = Theme.Colors.Surface}, 0.1)
                    end))
                    connections:Track(optBtn.MouseButton1Click:Connect(function()
                        if multi then
                            selected[opt] = not selected[opt] or nil
                        else
                            selected = opt
                            ddOpen = false
                            Tween.Play(arrow, {Rotation = 0}, 0.2)
                            Tween.Play(optContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                            task.delay(0.2, function() optContainer.Visible = false end)
                        end
                        for _, b in ipairs(optBtns) do b.updateCheck() end
                        valLbl.Text = getDisplayText()
                        local result = multi and (function() local t = {} for k in pairs(selected) do table.insert(t, k) end return t end)() or selected
                        local s, e = Safety.Call(callback, result)
                        if not s then warn("[FamyyPrivate] Dropdown error:", e) end
                    end))
                    
                    table.insert(optBtns, {btn = optBtn, updateCheck = updateCheck})
                end
                
                local function toggleDD()
                    ddOpen = not ddOpen
                    if ddOpen then
                        optContainer.Visible = true
                        local h = math.min(#options, maxVisible) * optHeight
                        Tween.Play(arrow, {Rotation = 180}, 0.2)
                        Tween.Play(optContainer, {Size = UDim2.new(1, 0, 0, h)}, 0.2)
                        Tween.Play(headerStroke, {Color = Theme.Colors.Accent}, 0.2)
                    else
                        Tween.Play(arrow, {Rotation = 0}, 0.2)
                        Tween.Play(optContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                        Tween.Play(headerStroke, {Color = Theme.Colors.TextDim}, 0.2)
                        task.delay(0.2, function() if not ddOpen then optContainer.Visible = false end end)
                    end
                end
                
                connections:Track(header.MouseButton1Click:Connect(toggleDD))
                connections:Track(header.MouseEnter:Connect(function()
                    Tween.Play(header, {BackgroundColor3 = Theme.Colors.SurfaceHover}, 0.15)
                end))
                connections:Track(header.MouseLeave:Connect(function()
                    Tween.Play(header, {BackgroundColor3 = Theme.Colors.Surface}, 0.15)
                end))
                
                return {
                    Set = function(_, v, fire)
                        if multi then
                            selected = {}
                            if type(v) == "table" then for _, x in ipairs(v) do selected[x] = true end else selected[v] = true end
                        else
                            selected = v
                        end
                        for _, b in ipairs(optBtns) do b.updateCheck() end
                        valLbl.Text = getDisplayText()
                        if fire ~= false then
                            local result = multi and (function() local t = {} for k in pairs(selected) do table.insert(t, k) end return t end)() or selected
                            local s, e = Safety.Call(callback, result)
                            if not s then warn("[FamyyPrivate] Dropdown error:", e) end
                        end
                    end,
                    Get = function()
                        if multi then local t = {} for k in pairs(selected) do table.insert(t, k) end return t end
                        return selected
                    end,
                    Frame = frame,
                }
            end
            
            --[[
                Adds a text input
                @param cfg table - {Label, Placeholder, Default, Numeric, MaxLength, Callback}
            ]]
            function Section:AddInput(cfg)
                local value = cfg.Default or ""
                local callback = cfg.Callback or function() end
                
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.InputHeight)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(0.4, -5, 1, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = cfg.Label or "Input"
                lbl.TextColor3 = Theme.Colors.Text
                lbl.Font = Theme.Fonts.Body
                lbl.TextSize = Theme.TextSizes.Body
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.Parent = frame
                
                local inputCont = Instance.new("Frame")
                inputCont.Size = UDim2.new(0.6, 0, 0, 28)
                inputCont.Position = UDim2.new(0.4, 0, 0.5, -14)
                inputCont.BackgroundColor3 = Theme.Colors.Surface
                inputCont.Parent = frame
                Instance.new("UICorner", inputCont).CornerRadius = Theme.Corners.Input
                
                local inputStroke = Instance.new("UIStroke", inputCont)
                inputStroke.Color = Theme.Colors.TextDim
                inputStroke.Transparency = 0.5
                
                local textBox = Instance.new("TextBox")
                textBox.Size = UDim2.new(1, -16, 1, 0)
                textBox.Position = UDim2.new(0, 8, 0, 0)
                textBox.BackgroundTransparency = 1
                textBox.Text = value
                textBox.PlaceholderText = cfg.Placeholder or "Enter text..."
                textBox.PlaceholderColor3 = Theme.Colors.TextMuted
                textBox.TextColor3 = Theme.Colors.Text
                textBox.Font = Theme.Fonts.Body
                textBox.TextSize = Theme.TextSizes.Caption
                textBox.TextXAlignment = Enum.TextXAlignment.Left
                textBox.ClearTextOnFocus = false
                textBox.Parent = inputCont
                
                connections:Track(textBox.Focused:Connect(function()
                    Tween.Play(inputStroke, {Color = Theme.Colors.Accent, Transparency = 0}, 0.15)
                end))
                connections:Track(textBox.FocusLost:Connect(function()
                    Tween.Play(inputStroke, {Color = Theme.Colors.TextDim, Transparency = 0.5}, 0.15)
                    local newVal = textBox.Text
                    if cfg.Numeric then newVal = newVal:gsub("[^%d%.%-]", "") textBox.Text = newVal end
                    if cfg.MaxLength and #newVal > cfg.MaxLength then newVal = newVal:sub(1, cfg.MaxLength) textBox.Text = newVal end
                    if newVal ~= value then
                        value = newVal
                        local s, e = Safety.Call(callback, value)
                        if not s then warn("[FamyyPrivate] Input error:", e) end
                    end
                end))
                
                return {
                    Set = function(_, v, fire)
                        value = tostring(v)
                        textBox.Text = value
                        if fire ~= false then
                            local s, e = Safety.Call(callback, value)
                            if not s then warn("[FamyyPrivate] Input error:", e) end
                        end
                    end,
                    Get = function() return value end,
                    Frame = frame,
                }
            end
            
            --[[
                Adds a keybind picker
                @param cfg table - {Label, Default, Mode, Callback, ChangedCallback}
            ]]
            function Section:AddKeybind(cfg)
                local key = cfg.Default or Enum.KeyCode.None
                local mode = cfg.Mode or "toggle"
                local callback = cfg.Callback or function() end
                local changedCallback = cfg.ChangedCallback or function() end
                local listening = false
                local state = false
                
                local blacklist = {
                    [Enum.KeyCode.W] = true, [Enum.KeyCode.A] = true, [Enum.KeyCode.S] = true, [Enum.KeyCode.D] = true,
                    [Enum.KeyCode.Space] = true, [Enum.KeyCode.Escape] = true, [Enum.KeyCode.Tab] = true,
                }
                
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
                
                local keyBtn = Instance.new("TextButton")
                keyBtn.Size = UDim2.new(0, 70, 0, 26)
                keyBtn.Position = UDim2.new(1, -70, 0.5, -13)
                keyBtn.BackgroundColor3 = Theme.Colors.Surface
                keyBtn.Text = key.Name or "None"
                keyBtn.TextColor3 = Theme.Colors.TextDim
                keyBtn.Font = Theme.Fonts.Body
                keyBtn.TextSize = Theme.TextSizes.Caption
                keyBtn.AutoButtonColor = false
                keyBtn.Parent = frame
                Instance.new("UICorner", keyBtn).CornerRadius = Theme.Corners.Button
                
                local keyStroke = Instance.new("UIStroke", keyBtn)
                keyStroke.Color = Theme.Colors.TextDim
                keyStroke.Transparency = 0.5
                
                connections:Track(keyBtn.MouseButton1Click:Connect(function()
                    if listening then
                        listening = false
                        keyBtn.Text = key.Name or "None"
                        Tween.Play(keyBtn, {BackgroundColor3 = Theme.Colors.Surface}, 0.15)
                        Tween.Play(keyStroke, {Color = Theme.Colors.TextDim}, 0.15)
                        Tween.Play(keyBtn, {TextColor3 = Theme.Colors.TextDim}, 0.15)
                    else
                        listening = true
                        keyBtn.Text = "..."
                        Tween.Play(keyBtn, {BackgroundColor3 = Theme.Colors.Accent}, 0.15)
                        Tween.Play(keyStroke, {Color = Theme.Colors.Accent}, 0.15)
                        Tween.Play(keyBtn, {TextColor3 = Theme.Colors.Text}, 0.15)
                    end
                end))
                
                connections:Track(UserInputService.InputBegan:Connect(function(input, gp)
                    if listening then
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            if input.KeyCode == Enum.KeyCode.Escape then
                                listening = false
                                keyBtn.Text = key.Name or "None"
                            elseif not blacklist[input.KeyCode] then
                                key = input.KeyCode
                                listening = false
                                keyBtn.Text = key.Name
                                local s, e = Safety.Call(changedCallback, key)
                                if not s then warn("[FamyyPrivate] Keybind changed error:", e) end
                            end
                            Tween.Play(keyBtn, {BackgroundColor3 = Theme.Colors.Surface}, 0.15)
                            Tween.Play(keyStroke, {Color = Theme.Colors.TextDim}, 0.15)
                            Tween.Play(keyBtn, {TextColor3 = Theme.Colors.TextDim}, 0.15)
                        end
                        return
                    end
                    if gp then return end
                    if input.KeyCode == key then
                        if mode == "toggle" then
                            state = not state
                            local s, e = Safety.Call(callback, state)
                            if not s then warn("[FamyyPrivate] Keybind error:", e) end
                        else
                            state = true
                            local s, e = Safety.Call(callback, true)
                            if not s then warn("[FamyyPrivate] Keybind error:", e) end
                        end
                    end
                end))
                
                if mode == "hold" then
                    connections:Track(UserInputService.InputEnded:Connect(function(input)
                        if input.KeyCode == key and state then
                            state = false
                            local s, e = Safety.Call(callback, false)
                            if not s then warn("[FamyyPrivate] Keybind error:", e) end
                        end
                    end))
                end
                
                return {
                    Set = function(_, k, fire)
                        key = k
                        keyBtn.Text = key.Name or "None"
                        if fire ~= false then
                            local s, e = Safety.Call(changedCallback, key)
                            if not s then warn("[FamyyPrivate] Keybind changed error:", e) end
                        end
                    end,
                    Get = function() return key end,
                    GetState = function() return state end,
                    Frame = frame,
                }
            end
            
            --[[
                Adds a label
                @param cfg table - {Text, Color, Size, Bold}
            ]]
            function Section:AddLabel(cfg)
                local size = cfg.Size or "normal"
                local sizes = {small = Theme.TextSizes.Small, normal = Theme.TextSizes.Body, large = Theme.TextSizes.Header}
                local heights = {small = 16, normal = Theme.Sizes.LabelHeight, large = 24}
                
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1, 0, 0, heights[size] or heights.normal)
                lbl.BackgroundTransparency = 1
                lbl.Text = cfg.Text or "Label"
                lbl.TextColor3 = cfg.Color or Theme.Colors.Text
                lbl.Font = cfg.Bold and Theme.Fonts.Header or Theme.Fonts.Caption
                lbl.TextSize = sizes[size] or sizes.normal
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.RichText = cfg.RichText or false
                lbl.Parent = contentContainer
                
                return {
                    SetText = function(_, t) lbl.Text = t end,
                    SetColor = function(_, c) lbl.TextColor3 = c end,
                    Frame = lbl,
                }
            end
            
            --[[
                Adds a divider
                @param cfg table - {Color, Padding}
            ]]
            function Section:AddDivider(cfg)
                cfg = cfg or {}
                local padding = cfg.Padding or 8
                
                local cont = Instance.new("Frame")
                cont.Size = UDim2.new(1, 0, 0, 1 + (padding * 2))
                cont.BackgroundTransparency = 1
                cont.Parent = contentContainer
                
                local line = Instance.new("Frame")
                line.Size = UDim2.new(1, 0, 0, 1)
                line.Position = UDim2.new(0, 0, 0.5, 0)
                line.BackgroundColor3 = cfg.Color or Theme.Colors.Surface
                line.BorderSizePixel = 0
                line.Parent = cont
                
                return {Frame = cont}
            end
            
            --[[
                Adds a user profile card
                @param cfg table - {UserId}
            ]]
            function Section:AddProfile(cfg)
                local userId = cfg.UserId or Players.LocalPlayer.UserId
                
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, 60)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                
                -- Profile picture
                local pfp = Instance.new("ImageLabel")
                pfp.Size = UDim2.new(0, 50, 0, 50)
                pfp.Position = UDim2.new(0, 0, 0.5, -25)
                pfp.BackgroundColor3 = Theme.Colors.Card
                pfp.Parent = frame
                Instance.new("UICorner", pfp).CornerRadius = UDim.new(1, 0)
                
                -- Load avatar async
                task.spawn(function()
                    local success, image = pcall(function()
                        return Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
                    end)
                    if success and image then
                        pfp.Image = image
                    end
                end)
                
                -- Get player name
                local playerName = "Player"
                local player = Players:GetPlayerByUserId(userId)
                if player then
                    playerName = player.Name
                end
                
                -- Welcome text
                local textBox = Instance.new("TextLabel")
                textBox.Size = UDim2.new(1, -65, 0, 40)
                textBox.Position = UDim2.new(0, 65, 0.5, -20)
                textBox.BackgroundTransparency = 1
                textBox.Text = "Welcome, <font color=\"rgb(255,255,255)\"><b>" .. playerName .. "</b></font>"
                textBox.RichText = true
                textBox.TextColor3 = Theme.Colors.TextDim
                textBox.Font = Theme.Fonts.Body
                textBox.TextSize = 16
                textBox.TextScaled = true
                textBox.TextXAlignment = Enum.TextXAlignment.Left
                textBox.Parent = frame
                
                local constraint = Instance.new("UITextSizeConstraint", textBox)
                constraint.MaxTextSize = 18
                constraint.MinTextSize = 10
                
                return {Frame = frame}
            end
            
            --[[
                Adds a stat grid (FPS, Ping, Time, Game)
            ]]
            function Section:AddStatGrid()
                local startTime = os.time()
                
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 0, 110)
                frame.BackgroundTransparency = 1
                frame.Parent = contentContainer
                
                local grid = Instance.new("UIGridLayout", frame)
                grid.CellSize = UDim2.new(0.48, 0, 0, 50)
                grid.CellPadding = UDim2.new(0, 8, 0, 8)
                grid.SortOrder = Enum.SortOrder.LayoutOrder
                
                local function createCard(label)
                    local card = Instance.new("Frame")
                    card.BackgroundColor3 = Theme.Colors.Card
                    card.Parent = frame
                    Instance.new("UICorner", card).CornerRadius = Theme.Corners.Card
                    
                    connections:Track(card.MouseEnter:Connect(function()
                        Tween.Play(card, {BackgroundColor3 = Theme.Colors.CardHover}, 0.15)
                    end))
                    connections:Track(card.MouseLeave:Connect(function()
                        Tween.Play(card, {BackgroundColor3 = Theme.Colors.Card}, 0.15)
                    end))
                    
                    local lbl = Instance.new("TextLabel")
                    lbl.Size = UDim2.new(1, 0, 0, 12)
                    lbl.Position = UDim2.new(0, 0, 0, 8)
                    lbl.BackgroundTransparency = 1
                    lbl.Text = label
                    lbl.TextColor3 = Theme.Colors.TextDim
                    lbl.Font = Theme.Fonts.Header
                    lbl.TextSize = Theme.TextSizes.Tiny
                    lbl.TextXAlignment = Enum.TextXAlignment.Center
                    lbl.Parent = card
                    
                    local val = Instance.new("TextLabel")
                    val.Size = UDim2.new(1, 0, 0, 20)
                    val.Position = UDim2.new(0, 0, 0.5, 2)
                    val.BackgroundTransparency = 1
                    val.Text = "..."
                    val.TextColor3 = Theme.Colors.Text
                    val.Font = Theme.Fonts.Header
                    val.TextSize = Theme.TextSizes.Header
                    val.TextScaled = true
                    val.TextXAlignment = Enum.TextXAlignment.Center
                    val.Parent = card
                    
                    local c = Instance.new("UITextSizeConstraint", val)
                    c.MaxTextSize = 18
                    c.MinTextSize = 10
                    
                    return val
                end
                
                local vFPS = createCard("FPS")
                local vPing = createCard("PING")
                local vTime = createCard("TIME")
                local vGame = createCard("GAME")
                
                -- Update FPS and Ping
                connections:Track(RunService.RenderStepped:Connect(function(dt)
                    local fps = math.floor(1 / dt)
                    vFPS.Text = tostring(fps)
                    vFPS.TextColor3 = (fps >= 50 and Theme.Colors.Success) or (fps >= 30 and Theme.Colors.Warning) or Theme.Colors.Error
                    
                    local success, ping = pcall(function()
                        return math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
                    end)
                    if success then
                        vPing.Text = ping .. "ms"
                        vPing.TextColor3 = (ping < 100 and Theme.Colors.Success) or (ping < 200 and Theme.Colors.Warning) or Theme.Colors.Error
                    end
                end))
                
                -- Update time and game name
                task.spawn(function()
                    -- Get game name
                    local success, info = pcall(function()
                        return MarketplaceService:GetProductInfo(game.PlaceId)
                    end)
                    if success and info and info.Name then
                        vGame.Text = info.Name
                    else
                        vGame.Text = "Unknown"
                    end
                    
                    -- Update time loop
                    while ScreenGui and ScreenGui.Parent do
                        local elapsed = os.time() - startTime
                        local minutes = math.floor(elapsed / 60)
                        local seconds = elapsed % 60
                        vTime.Text = string.format("%02d:%02d", minutes, seconds)
                        task.wait(1)
                    end
                end)
                
                return {Frame = frame}
            end
            
            --[[
                Adds a Discord CTA button
                @param cfg table - {InviteCode}
            ]]
            function Section:AddDiscordCTA(cfg)
                local inviteCode = cfg.InviteCode or "discord"
                
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, 0, 0, 50)
                btn.BackgroundColor3 = Theme.Colors.Discord
                btn.Text = ""
                btn.AutoButtonColor = false
                btn.Parent = contentContainer
                Instance.new("UICorner", btn).CornerRadius = Theme.Corners.Card
                
                local icon = Instance.new("ImageLabel")
                icon.Size = UDim2.new(0, 32, 0, 32)
                icon.Position = UDim2.new(0, 10, 0.5, -16)
                icon.BackgroundTransparency = 1
                icon.Image = "rbxassetid://16047585258"
                icon.Parent = btn
                
                local titleLbl = Instance.new("TextLabel")
                titleLbl.Size = UDim2.new(1, -60, 0, 16)
                titleLbl.Position = UDim2.new(0, 50, 0.5, -9)
                titleLbl.BackgroundTransparency = 1
                titleLbl.Text = "JOIN DISCORD"
                titleLbl.TextColor3 = Color3.new(1, 1, 1)
                titleLbl.Font = Theme.Fonts.Title
                titleLbl.TextSize = 16
                titleLbl.TextXAlignment = Enum.TextXAlignment.Left
                titleLbl.Parent = btn
                
                local subLbl = Instance.new("TextLabel")
                subLbl.Size = UDim2.new(1, -60, 0, 12)
                subLbl.Position = UDim2.new(0, 50, 0.5, 7)
                subLbl.BackgroundTransparency = 1
                subLbl.Text = "Get Scripts, Configs & Support"
                subLbl.TextColor3 = Color3.fromRGB(220, 220, 255)
                subLbl.Font = Theme.Fonts.Header
                subLbl.TextSize = Theme.TextSizes.Small
                subLbl.TextXAlignment = Enum.TextXAlignment.Left
                subLbl.Parent = btn
                
                connections:Track(btn.MouseEnter:Connect(function()
                    Tween.Play(btn, {BackgroundColor3 = Theme.Colors.DiscordHover}, 0.15)
                end))
                connections:Track(btn.MouseLeave:Connect(function()
                    Tween.Play(btn, {BackgroundColor3 = Theme.Colors.Discord}, 0.15)
                end))
                
                connections:Track(btn.MouseButton1Click:Connect(function()
                    local success = pcall(function()
                        if setclipboard then
                            setclipboard("https://discord.gg/" .. inviteCode)
                        elseif toclipboard then
                            toclipboard("https://discord.gg/" .. inviteCode)
                        end
                    end)
                    
                    titleLbl.Text = "LINK COPIED!"
                    titleLbl.TextColor3 = Theme.Colors.Success
                    Tween.Play(btn, {BackgroundColor3 = Theme.Colors.Card}, 0.15)
                    Notify("Discord", "Invite link copied to clipboard!", 2, "success")
                    
                    task.delay(1.5, function()
                        titleLbl.Text = "JOIN DISCORD"
                        titleLbl.TextColor3 = Color3.new(1, 1, 1)
                        Tween.Play(btn, {BackgroundColor3 = Theme.Colors.Discord}, 0.15)
                    end)
                end))
                
                return {Frame = btn}
            end
            
            table.insert(Tab.Sections, Section)
            return Section
        end
        
        table.insert(self.Tabs, Tab)
        return Tab
    end
    
    --[[
        Destroys the window
    ]]
    function Window:Destroy()
        connections:DisconnectAll()
        ScreenGui:Destroy()
    end
    
    table.insert(Library.Windows, Window)
    return Window
end

--[[
    Gets the theme configuration
    @return Theme
]]
function Library:GetTheme()
    return Theme
end

--[[
    Sets a theme color
    @param key string - Color key
    @param color Color3 - New color
]]
function Library:SetThemeColor(key, color)
    if Theme.Colors[key] then
        Theme.Colors[key] = color
    end
end

-- ============================================================================
-- PERMANENT INITIALIZATION - FAMYY CATEGORY
-- ============================================================================

local Win = Library:CreateWindow({
    Title = "FAMYY PRIVATE",
    Keybind = Enum.KeyCode.RightShift
})

-- Create the permanent "Famy" tab
local FamyTab = Win:CreateTab("Famy")

-- Dashboard section with user profile
local Dashboard = FamyTab:CreateSection("Dashboard", true)
Dashboard:AddProfile({UserId = Players.LocalPlayer.UserId})

-- Status section with real-time stats
local Status = FamyTab:CreateSection("Status", true)
Status:AddStatGrid()

-- Socials section with Discord
local Socials = FamyTab:CreateSection("Socials", true)
Socials:AddDiscordCTA({InviteCode = "wkkgT7a57U"})

-- Startup notification
Win.Notify("FAMYY PRIVATE", "UI Loaded! Press RightShift to toggle.", 3, "success")

-- Return both Library and the pre-created Window
Library.Window = Win
return Library
