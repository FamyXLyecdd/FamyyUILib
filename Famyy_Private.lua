--[[
    FAMYY | PRIVATE v8.1 (PERMANENT)
    Aesthetic: Deep Black, Neon Purple, Slim.
    Layout: Finalized (No Tools, Full Width Tab).
    Updates: Hover effects, Toggle, Slider, Notifications, Keybind, Close button, Memory leak fixes.
]]

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer

-- === [ CONFIG & STYLING ] ===
local UI = {
    Colors = {
        Background = Color3.fromRGB(10, 10, 13),
        Surface    = Color3.fromRGB(20, 20, 24),
        SurfaceHover = Color3.fromRGB(30, 30, 36),
        Card       = Color3.fromRGB(25, 25, 30),
        CardHover  = Color3.fromRGB(35, 35, 42),
        Accent     = Color3.fromRGB(130, 90, 255),
        AccentDim  = Color3.fromRGB(100, 70, 200),
        Text       = Color3.fromRGB(255, 255, 255),
        TextDim    = Color3.fromRGB(160, 160, 170),
        Green      = Color3.fromRGB(100, 255, 140),
        Red        = Color3.fromRGB(255, 100, 100),
        Yellow     = Color3.fromRGB(255, 220, 100),
        Discord    = Color3.fromRGB(88, 101, 242),
        DiscordHvr = Color3.fromRGB(71, 82, 196)
    },
    Sizes = { Main = UDim2.new(0, 260, 0, 450), Min = UDim2.new(0, 45, 0, 45) },
    Keybind = Enum.KeyCode.RightShift
}

-- Connection tracker for cleanup
local Connections = {}

local function Tween(obj, props, time)
    TweenService:Create(obj, TweenInfo.new(time or 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props):Play()
end

local function GetGameName()
    local success, info = pcall(function() return MarketplaceService:GetProductInfo(game.PlaceId) end)
    if success and info and info.Name then return info.Name end
    return "Unknown Game"
end

local function TrackConnection(conn)
    table.insert(Connections, conn)
    return conn
end

local function CleanupConnections()
    for _, conn in ipairs(Connections) do
        if conn and conn.Connected then
            conn:Disconnect()
        end
    end
    Connections = {}
end

-- === [ LIBRARY ENGINE ] ===
local Library = {}

function Library:Window()
    if gethui and gethui():FindFirstChild("FamyyPrivate") then gethui().FamyyPrivate:Destroy() end
    if CoreGui:FindFirstChild("FamyyPrivate") then CoreGui.FamyyPrivate:Destroy() end
    CleanupConnections()

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FamyyPrivate"
    if gethui then ScreenGui.Parent = gethui() else ScreenGui.Parent = CoreGui end
    
    -- === [ NOTIFICATION SYSTEM ] ===
    local NotifContainer = Instance.new("Frame")
    NotifContainer.Size = UDim2.new(0, 220, 1, 0)
    NotifContainer.Position = UDim2.new(1, -230, 0, 10)
    NotifContainer.BackgroundTransparency = 1
    NotifContainer.Parent = ScreenGui
    local NotifLayout = Instance.new("UIListLayout", NotifContainer)
    NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
    NotifLayout.Padding = UDim.new(0, 8)
    NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    
    local function Notify(title, message, duration, notifType)
        duration = duration or 3
        notifType = notifType or "info"
        
        local colors = {
            info = UI.Colors.Accent,
            success = UI.Colors.Green,
            warning = UI.Colors.Yellow,
            error = UI.Colors.Red
        }
        
        local Notif = Instance.new("Frame")
        Notif.Size = UDim2.new(1, 0, 0, 60)
        Notif.BackgroundColor3 = UI.Colors.Surface
        Notif.BackgroundTransparency = 1
        Notif.Parent = NotifContainer
        Instance.new("UICorner", Notif).CornerRadius = UDim.new(0, 8)
        
        local Stroke = Instance.new("UIStroke", Notif)
        Stroke.Color = colors[notifType] or UI.Colors.Accent
        Stroke.Thickness = 1
        Stroke.Transparency = 1
        
        local AccentBar = Instance.new("Frame")
        AccentBar.Size = UDim2.new(0, 3, 1, -10)
        AccentBar.Position = UDim2.new(0, 5, 0, 5)
        AccentBar.BackgroundColor3 = colors[notifType] or UI.Colors.Accent
        AccentBar.Parent = Notif
        Instance.new("UICorner", AccentBar).CornerRadius = UDim.new(0, 2)
        
        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -20, 0, 20)
        Title.Position = UDim2.new(0, 15, 0, 8)
        Title.BackgroundTransparency = 1
        Title.Text = title
        Title.TextColor3 = UI.Colors.Text
        Title.Font = Enum.Font.GothamBold
        Title.TextSize = 13
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Parent = Notif
        
        local Msg = Instance.new("TextLabel")
        Msg.Size = UDim2.new(1, -20, 0, 25)
        Msg.Position = UDim2.new(0, 15, 0, 28)
        Msg.BackgroundTransparency = 1
        Msg.Text = message
        Msg.TextColor3 = UI.Colors.TextDim
        Msg.Font = Enum.Font.Gotham
        Msg.TextSize = 11
        Msg.TextXAlignment = Enum.TextXAlignment.Left
        Msg.TextWrapped = true
        Msg.Parent = Notif
        
        -- Animate in
        Notif.Position = UDim2.new(1, 50, 0, 0)
        Tween(Notif, {BackgroundTransparency = 0, Position = UDim2.new(0, 0, 0, 0)}, 0.3)
        Tween(Stroke, {Transparency = 0}, 0.3)
        
        task.delay(duration, function()
            Tween(Notif, {BackgroundTransparency = 1, Position = UDim2.new(1, 50, 0, 0)}, 0.3)
            Tween(Stroke, {Transparency = 1}, 0.3)
            task.wait(0.35)
            Notif:Destroy()
        end)
    end
    
    local Main = Instance.new("Frame")
    Main.Size = UI.Sizes.Main
    Main.Position = UDim2.new(0.05, 0, 0.5, -225)
    Main.BackgroundColor3 = UI.Colors.Background
    Main.Active = true
    Main.Draggable = true
    Main.Parent = ScreenGui
    
    local MainContainer = Instance.new("Frame")
    MainContainer.Name = "Container"
    MainContainer.Size = UDim2.new(1,0,1,0)
    MainContainer.BackgroundTransparency = 1
    MainContainer.ClipsDescendants = true
    MainContainer.Parent = Main
    
    local MainC = Instance.new("UICorner", Main)
    MainC.CornerRadius = UDim.new(0, 12)
    Instance.new("UICorner", MainContainer).CornerRadius = UDim.new(0, 12)
    
    local Stroke = Instance.new("UIStroke", Main)
    Stroke.Color = UI.Colors.Surface
    Stroke.Thickness = 1.5

    -- HEADER
    local Header = Instance.new("Frame")
    Header.Size = UDim2.new(1, 0, 0, 55)
    Header.BackgroundTransparency = 1
    Header.Parent = MainContainer
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -90, 1, 0)
    Title.Position = UDim2.new(0, 20, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "FAMYY<font color=\"rgb(130,90,255)\">PRIVATE</font>"
    Title.RichText = true
    Title.Font = Enum.Font.GothamBlack
    Title.TextSize = 19
    Title.TextColor3 = UI.Colors.Text
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Header
    
    -- ICON (Min)
    local Icon = Instance.new("TextLabel")
    Icon.Size = UDim2.new(1,0,1,0)
    Icon.BackgroundTransparency = 1
    Icon.Text = "F"
    Icon.Font = Enum.Font.GothamBlack
    Icon.TextColor3 = UI.Colors.Accent
    Icon.TextSize = 28
    Icon.Visible = false
    Icon.Parent = MainContainer
    
    local PopOut = Instance.new("Frame")
    PopOut.Size = UDim2.new(0, 100, 0, 30)
    PopOut.Position = UDim2.new(1, 10, 0.5, -15)
    PopOut.BackgroundColor3 = UI.Colors.Surface
    PopOut.Visible = false
    PopOut.Parent = Main
    Instance.new("UICorner", PopOut).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", PopOut).Color = UI.Colors.Accent
    local PopText = Instance.new("TextLabel")
    PopText.Size = UDim2.new(1,0,1,0)
    PopText.BackgroundTransparency = 1
    PopText.Text = "Dashboard"
    PopText.TextColor3 = UI.Colors.Text
    PopText.Font = Enum.Font.GothamBold
    PopText.TextSize = 12
    PopText.Parent = PopOut
    
    TrackConnection(Main.MouseEnter:Connect(function() if Icon.Visible then PopOut.Visible=true PopOut.Position=UDim2.new(1,5,0.5,-15) Tween(PopOut,{Position=UDim2.new(1,15,0.5,-15)}) end end))
    TrackConnection(Main.MouseLeave:Connect(function() PopOut.Visible=false end))

    -- CLOSE BUTTON (X)
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -45, 0.5, -15)
    CloseBtn.BackgroundColor3 = UI.Colors.Surface
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = UI.Colors.Red
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 14
    CloseBtn.Parent = Header
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0,6)
    
    TrackConnection(CloseBtn.MouseEnter:Connect(function() Tween(CloseBtn, {BackgroundColor3 = UI.Colors.Red}) Tween(CloseBtn, {TextColor3 = UI.Colors.Text}) end))
    TrackConnection(CloseBtn.MouseLeave:Connect(function() Tween(CloseBtn, {BackgroundColor3 = UI.Colors.Surface}) Tween(CloseBtn, {TextColor3 = UI.Colors.Red}) end))
    TrackConnection(CloseBtn.MouseButton1Click:Connect(function()
        Tween(Main, {BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 0)}, 0.2)
        task.wait(0.25)
        CleanupConnections()
        ScreenGui:Destroy()
    end))

    -- MINIMIZE BUTTON
    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 30, 0, 30)
    MinBtn.Position = UDim2.new(1, -80, 0.5, -15)
    MinBtn.BackgroundColor3 = UI.Colors.Surface
    MinBtn.Text = "-"
    MinBtn.TextColor3 = UI.Colors.Text
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.Parent = Header
    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0,6)
    
    TrackConnection(MinBtn.MouseEnter:Connect(function() Tween(MinBtn, {BackgroundColor3 = UI.Colors.SurfaceHover}) end))
    TrackConnection(MinBtn.MouseLeave:Connect(function() Tween(MinBtn, {BackgroundColor3 = UI.Colors.Surface}) end))
    
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, 0, 1, -95)
    ContentFrame.Position = UDim2.new(0, 0, 0, 95)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.ClipsDescendants = true
    ContentFrame.Parent = MainContainer
    
    local IsMin = false
    TrackConnection(MinBtn.MouseButton1Click:Connect(function()
        IsMin = not IsMin
        if IsMin then
            Tween(Main, {Size=UI.Sizes.Min})
            Tween(MainC, {CornerRadius=UDim.new(1,0)})
            Tween(Stroke, {Color=UI.Colors.Accent})
            Header.Visible=false; ContentFrame.Visible=false; Icon.Visible=true;
            local Exp = Instance.new("TextButton", MainContainer)
            Exp.Size=UDim2.new(1,0,1,0); Exp.BackgroundTransparency=1; Exp.Text=""
            TrackConnection(Exp.MouseButton1Click:Connect(function()
                IsMin=false; Exp:Destroy(); Icon.Visible=false; PopOut.Visible=false
                Tween(Main, {Size=UI.Sizes.Main})
                Tween(MainC, {CornerRadius=UDim.new(0,12)})
                Tween(Stroke, {Color=UI.Colors.Surface})
                task.wait(0.2); Header.Visible=true; ContentFrame.Visible=true
            end))
        end
    end))
    
    -- KEYBIND TOGGLE
    TrackConnection(UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == UI.Keybind then
            Main.Visible = not Main.Visible
            if Main.Visible then
                Notify("UI Toggled", "Press RightShift to hide", 2, "info")
            end
        end
    end))
    
    local TabBar = Instance.new("Frame")
    TabBar.Size = UDim2.new(1, -30, 0, 32)
    TabBar.Position = UDim2.new(0, 15, 0, 55)
    TabBar.BackgroundColor3 = UI.Colors.Surface
    TabBar.Parent = MainContainer
    Instance.new("UICorner", TabBar).CornerRadius = UDim.new(0, 8)
    local TabL = Instance.new("UIListLayout", TabBar); TabL.FillDirection=Enum.FillDirection.Horizontal; TabL.HorizontalAlignment=Enum.HorizontalAlignment.Center
    
    local Lib = {Notify = Notify}
    local ActiveTab = nil
    
    function Lib:Category(name)
        local TabBtn = Instance.new("TextButton")
        TabBtn.Size = UDim2.new(1, 0, 1, 0)
        TabBtn.BackgroundTransparency = 1
        TabBtn.Text = name
        TabBtn.TextColor3 = UI.Colors.TextDim
        TabBtn.Font = Enum.Font.GothamBold; TabBtn.TextSize = 12
        TabBtn.Parent = TabBar
        
        -- Tab hover effect
        TrackConnection(TabBtn.MouseEnter:Connect(function()
            if ActiveTab ~= TabBtn then
                Tween(TabBtn, {TextColor3 = UI.Colors.Text})
            end
        end))
        TrackConnection(TabBtn.MouseLeave:Connect(function()
            if ActiveTab ~= TabBtn then
                Tween(TabBtn, {TextColor3 = UI.Colors.TextDim})
            end
        end))
        
        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.ScrollBarThickness = 1
        Page.ScrollBarImageColor3 = UI.Colors.Accent
        Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Page.CanvasSize = UDim2.new(0,0,0,0)
        Page.Parent = ContentFrame
        
        local PList = Instance.new("UIListLayout", Page)
        PList.SortOrder = Enum.SortOrder.LayoutOrder
        PList.Padding = UDim.new(0, 2)
        local PPad = Instance.new("UIPadding", Page)
        PPad.PaddingTop=UDim.new(0,5); PPad.PaddingLeft=UDim.new(0,15); PPad.PaddingRight=UDim.new(0,15)
        
        if ActiveTab == nil then ActiveTab = TabBtn; Page.Visible = true; TabBtn.TextColor3 = UI.Colors.Text end
        
        TrackConnection(TabBtn.MouseButton1Click:Connect(function()
            for _,v in pairs(ContentFrame:GetChildren()) do v.Visible=false end
            for _,v in pairs(TabBar:GetChildren()) do if v:IsA("TextButton") then Tween(v, {TextColor3=UI.Colors.TextDim}) end end
            ActiveTab = TabBtn
            Page.Visible=true; Tween(TabBtn, {TextColor3=UI.Colors.Text})
            Page.Position = UDim2.new(0, 10, 0, 0); Tween(Page, {Position=UDim2.new(0,0,0,0)})
        end))
        
        local Components = {}
        
        function Components:Collapsible(name, default_open, fixed_height)
            local Frame = Instance.new("Frame")
            Frame.Size = UDim2.new(1, 0, 0, 36)
            Frame.BackgroundColor3 = UI.Colors.Surface
            Frame.ClipsDescendants = true
            Frame.Parent = Page
            Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)
            
            local Trigger = Instance.new("TextButton")
            Trigger.Size = UDim2.new(1, 0, 0, 36)
            Trigger.BackgroundTransparency = 1
            Trigger.Text = ""
            Trigger.Parent = Frame
            
            -- Collapsible hover effect
            TrackConnection(Trigger.MouseEnter:Connect(function()
                Tween(Frame, {BackgroundColor3 = UI.Colors.SurfaceHover})
            end))
            TrackConnection(Trigger.MouseLeave:Connect(function()
                Tween(Frame, {BackgroundColor3 = UI.Colors.Surface})
            end))
            
            local Lbl = Instance.new("TextLabel")
            Lbl.Size = UDim2.new(1, -30, 1, 0)
            Lbl.Position = UDim2.new(0, 12, 0, 0)
            Lbl.BackgroundTransparency = 1
            Lbl.Text = name
            Lbl.TextColor3 = UI.Colors.Text
            Lbl.Font = Enum.Font.GothamBold; Lbl.TextSize = 14
            Lbl.TextXAlignment = Enum.TextXAlignment.Left
            Lbl.Parent = Trigger
            
            local Arrow = Instance.new("ImageLabel")
            Arrow.Size = UDim2.new(0, 16, 0, 16)
            Arrow.Position = UDim2.new(1, -28, 0.5, -8)
            Arrow.BackgroundTransparency = 1
            Arrow.Image = "rbxassetid://6031090990"
            Arrow.ImageColor3 = UI.Colors.TextDim
            Arrow.Rotation = default_open and 180 or 0
            Arrow.Parent = Trigger
            
            local Container = Instance.new("Frame")
            Container.Size = UDim2.new(1, 0, 0, 0)
            Container.Position = UDim2.new(0, 0, 0, 36)
            Container.BackgroundTransparency = 1
            Container.Visible = false
            Container.AutomaticSize = Enum.AutomaticSize.Y 
            Container.Parent = Frame
            
            local CList = Instance.new("UIListLayout", Container)
            CList.SortOrder = Enum.SortOrder.LayoutOrder
            CList.Padding = UDim.new(0, 2)
            local CPad = Instance.new("UIPadding", Container)
            CPad.PaddingLeft=UDim.new(0, 12); CPad.PaddingRight=UDim.new(0, 12)
            CPad.PaddingTop=UDim.new(0, 8); CPad.PaddingBottom=UDim.new(0, 8)
            
            local Open = default_open
            
            local function UpdateHeight()
                 local h = 0
                 if fixed_height then 
                    h = fixed_height + 36 
                 else 
                    h = Container.AbsoluteSize.Y + 36 
                 end
                 Tween(Frame, {Size = UDim2.new(1, 0, 0, h)})
            end

            task.spawn(function()
                if Open then
                     task.wait(0.1)
                     Container.Visible = true
                     UpdateHeight()
                end
            end)

            TrackConnection(Trigger.MouseButton1Click:Connect(function()
                Open = not Open
                if Open then
                    Container.Visible = true
                    Tween(Arrow, {Rotation = 180})
                    Tween(Lbl, {TextColor3 = UI.Colors.Text})
                    UpdateHeight()
                else
                    Tween(Arrow, {Rotation = 0})
                    Tween(Lbl, {TextColor3 = UI.Colors.TextDim})
                    local closeTween = TweenService:Create(Frame, TweenInfo.new(0.3), {Size = UDim2.new(1, 0, 0, 36)})
                    closeTween:Play()
                    task.delay(0.3, function() if not Open then Container.Visible = false end end)
                end
            end))
            
            local Items = {}
            
            function Items:Profile(userId)
                local Frame = Instance.new("Frame")
                Frame.Size = UDim2.new(1, 0, 0, 60)
                Frame.BackgroundTransparency = 1
                Frame.Parent = Container
                local PFP = Instance.new("ImageLabel")
                PFP.Size = UDim2.new(0, 50, 0, 50)
                PFP.Position = UDim2.new(0, 0, 0.5, -25)
                PFP.BackgroundColor3 = Color3.fromRGB(30,30,35)
                PFP.Image = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
                PFP.Parent = Frame
                Instance.new("UICorner", PFP).CornerRadius = UDim.new(1,0)
                local TextBox = Instance.new("TextLabel")
                TextBox.Size = UDim2.new(1, -65, 0, 40)
                TextBox.Position = UDim2.new(0, 65, 0.5, -20)
                TextBox.BackgroundTransparency = 1
                TextBox.Text = "Welcome, <font color=\"rgb(255,255,255)\"><b>"..Players:GetPlayerByUserId(userId).Name.."</b></font>"
                TextBox.RichText = true
                TextBox.TextColor3 = UI.Colors.TextDim
                TextBox.Font = Enum.Font.GothamMedium
                TextBox.TextSize = 16
                TextBox.TextScaled = true; TextBox.TextXAlignment = Enum.TextXAlignment.Left
                local Constraint = Instance.new("UITextSizeConstraint", TextBox)
                Constraint.MaxTextSize = 18; Constraint.MinTextSize = 10
                TextBox.Parent = Frame
                return Frame
            end

            function Items:StatGrid()
                local Frame = Instance.new("Frame")
                Frame.Size = UDim2.new(1, 0, 0, 110)
                Frame.BackgroundTransparency = 1
                Frame.Parent = Container
                local Grid = Instance.new("UIGridLayout")
                Grid.CellSize = UDim2.new(0.48, 0, 0, 50)
                Grid.CellPadding = UDim2.new(0, 8, 0, 8)
                Grid.SortOrder = Enum.SortOrder.LayoutOrder
                Grid.Parent = Frame
                local function CreateCard(label, valueObj)
                    local Card = Instance.new("Frame")
                    Card.BackgroundColor3 = UI.Colors.Card
                    Card.Parent = Frame
                    Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 8)
                    
                    -- Card hover effect
                    TrackConnection(Card.MouseEnter:Connect(function() Tween(Card, {BackgroundColor3 = UI.Colors.CardHover}) end))
                    TrackConnection(Card.MouseLeave:Connect(function() Tween(Card, {BackgroundColor3 = UI.Colors.Card}) end))
                    
                    local Lbl = Instance.new("TextLabel"); Lbl.Size=UDim2.new(1,0,0,12); Lbl.Position=UDim2.new(0,0,0,8); Lbl.BackgroundTransparency=1; Lbl.Text=label; Lbl.TextColor3=UI.Colors.TextDim; Lbl.Font=Enum.Font.GothamBold; Lbl.TextSize=10; Lbl.TextXAlignment=Enum.TextXAlignment.Center; Lbl.Parent=Card
                    local Val = Instance.new("TextLabel"); Val.Size=UDim2.new(1,0,0,20); Val.Position=UDim2.new(0,0,0.5,2); Val.BackgroundTransparency=1; Val.Text="..."; Val.TextColor3=UI.Colors.Text; Val.Font=Enum.Font.GothamBold; Val.TextSize=16; Val.TextScaled=true; Val.TextXAlignment=Enum.TextXAlignment.Center; local C = Instance.new("UITextSizeConstraint", Val); C.MaxTextSize=18; C.MinTextSize=10; Val.Parent=Card
                    return Val
                end
                local V_FPS = CreateCard("FPS", nil); local V_Ping = CreateCard("PING", nil); local V_Time = CreateCard("TIME", nil); local V_Game = CreateCard("GAME", nil)
                TrackConnection(RunService.RenderStepped:Connect(function(dt)
                    local fps = math.floor(1/dt)
                    V_FPS.Text = fps; V_FPS.TextColor3 = (fps >= 50 and UI.Colors.Green) or (fps >= 30 and UI.Colors.Yellow) or UI.Colors.Red
                    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
                    V_Ping.Text = ping.."ms"; V_Ping.TextColor3 = (ping < 100 and UI.Colors.Green) or (ping < 200 and UI.Colors.Yellow) or UI.Colors.Red
                end))
                local S = os.time()
                task.spawn(function()
                    V_Game.Text = GetGameName()
                    while ScreenGui and ScreenGui.Parent do
                        local d = os.time()-S; local m = math.floor(d/60); local s = d%60
                        V_Time.Text = string.format("%02d:%02d", m, s); task.wait(1)
                    end
                end)
            end

            -- TOGGLE COMPONENT
            function Items:Toggle(label, default, callback)
                callback = callback or function() end
                local State = default or false
                
                local ToggleFrame = Instance.new("Frame")
                ToggleFrame.Size = UDim2.new(1, 0, 0, 36)
                ToggleFrame.BackgroundTransparency = 1
                ToggleFrame.Parent = Container
                
                local Lbl = Instance.new("TextLabel")
                Lbl.Size = UDim2.new(1, -60, 1, 0)
                Lbl.Position = UDim2.new(0, 0, 0, 0)
                Lbl.BackgroundTransparency = 1
                Lbl.Text = label
                Lbl.TextColor3 = UI.Colors.Text
                Lbl.Font = Enum.Font.GothamMedium
                Lbl.TextSize = 13
                Lbl.TextXAlignment = Enum.TextXAlignment.Left
                Lbl.Parent = ToggleFrame
                
                local ToggleBtn = Instance.new("TextButton")
                ToggleBtn.Size = UDim2.new(0, 44, 0, 24)
                ToggleBtn.Position = UDim2.new(1, -44, 0.5, -12)
                ToggleBtn.BackgroundColor3 = State and UI.Colors.Accent or UI.Colors.Surface
                ToggleBtn.Text = ""
                ToggleBtn.Parent = ToggleFrame
                Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
                local ToggleStroke = Instance.new("UIStroke", ToggleBtn)
                ToggleStroke.Color = State and UI.Colors.Accent or UI.Colors.TextDim
                ToggleStroke.Thickness = 1
                
                local Knob = Instance.new("Frame")
                Knob.Size = UDim2.new(0, 18, 0, 18)
                Knob.Position = State and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
                Knob.BackgroundColor3 = UI.Colors.Text
                Knob.Parent = ToggleBtn
                Instance.new("UICorner", Knob).CornerRadius = UDim.new(1, 0)
                
                local function UpdateToggle()
                    if State then
                        Tween(ToggleBtn, {BackgroundColor3 = UI.Colors.Accent})
                        Tween(ToggleStroke, {Color = UI.Colors.Accent})
                        Tween(Knob, {Position = UDim2.new(1, -21, 0.5, -9)})
                    else
                        Tween(ToggleBtn, {BackgroundColor3 = UI.Colors.Surface})
                        Tween(ToggleStroke, {Color = UI.Colors.TextDim})
                        Tween(Knob, {Position = UDim2.new(0, 3, 0.5, -9)})
                    end
                end
                
                TrackConnection(ToggleBtn.MouseButton1Click:Connect(function()
                    State = not State
                    UpdateToggle()
                    callback(State)
                end))
                
                return {
                    Set = function(_, val) State = val; UpdateToggle(); callback(State) end,
                    Get = function() return State end
                }
            end
            
            -- SLIDER COMPONENT
            function Items:Slider(label, min, max, default, callback)
                callback = callback or function() end
                min = min or 0
                max = max or 100
                default = default or min
                local Value = math.clamp(default, min, max)
                
                local SliderFrame = Instance.new("Frame")
                SliderFrame.Size = UDim2.new(1, 0, 0, 50)
                SliderFrame.BackgroundTransparency = 1
                SliderFrame.Parent = Container
                
                local TopRow = Instance.new("Frame")
                TopRow.Size = UDim2.new(1, 0, 0, 20)
                TopRow.BackgroundTransparency = 1
                TopRow.Parent = SliderFrame
                
                local Lbl = Instance.new("TextLabel")
                Lbl.Size = UDim2.new(0.7, 0, 1, 0)
                Lbl.BackgroundTransparency = 1
                Lbl.Text = label
                Lbl.TextColor3 = UI.Colors.Text
                Lbl.Font = Enum.Font.GothamMedium
                Lbl.TextSize = 13
                Lbl.TextXAlignment = Enum.TextXAlignment.Left
                Lbl.Parent = TopRow
                
                local ValLabel = Instance.new("TextLabel")
                ValLabel.Size = UDim2.new(0.3, 0, 1, 0)
                ValLabel.Position = UDim2.new(0.7, 0, 0, 0)
                ValLabel.BackgroundTransparency = 1
                ValLabel.Text = tostring(Value)
                ValLabel.TextColor3 = UI.Colors.Accent
                ValLabel.Font = Enum.Font.GothamBold
                ValLabel.TextSize = 13
                ValLabel.TextXAlignment = Enum.TextXAlignment.Right
                ValLabel.Parent = TopRow
                
                local SliderBg = Instance.new("Frame")
                SliderBg.Size = UDim2.new(1, 0, 0, 8)
                SliderBg.Position = UDim2.new(0, 0, 0, 28)
                SliderBg.BackgroundColor3 = UI.Colors.Surface
                SliderBg.Parent = SliderFrame
                Instance.new("UICorner", SliderBg).CornerRadius = UDim.new(1, 0)
                
                local SliderFill = Instance.new("Frame")
                SliderFill.Size = UDim2.new((Value - min) / (max - min), 0, 1, 0)
                SliderFill.BackgroundColor3 = UI.Colors.Accent
                SliderFill.Parent = SliderBg
                Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)
                
                local SliderKnob = Instance.new("Frame")
                SliderKnob.Size = UDim2.new(0, 16, 0, 16)
                SliderKnob.Position = UDim2.new((Value - min) / (max - min), -8, 0.5, -8)
                SliderKnob.BackgroundColor3 = UI.Colors.Text
                SliderKnob.Parent = SliderBg
                Instance.new("UICorner", SliderKnob).CornerRadius = UDim.new(1, 0)
                
                local Dragging = false
                
                local function UpdateSlider(input)
                    local pos = math.clamp((input.Position.X - SliderBg.AbsolutePosition.X) / SliderBg.AbsoluteSize.X, 0, 1)
                    Value = math.floor(min + (max - min) * pos)
                    ValLabel.Text = tostring(Value)
                    Tween(SliderFill, {Size = UDim2.new(pos, 0, 1, 0)}, 0.1)
                    Tween(SliderKnob, {Position = UDim2.new(pos, -8, 0.5, -8)}, 0.1)
                    callback(Value)
                end
                
                TrackConnection(SliderBg.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        Dragging = true
                        UpdateSlider(input)
                    end
                end))
                
                TrackConnection(UserInputService.InputChanged:Connect(function(input)
                    if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        UpdateSlider(input)
                    end
                end))
                
                TrackConnection(UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        Dragging = false
                    end
                end))
                
                return {
                    Set = function(_, val)
                        Value = math.clamp(val, min, max)
                        local pos = (Value - min) / (max - min)
                        ValLabel.Text = tostring(Value)
                        Tween(SliderFill, {Size = UDim2.new(pos, 0, 1, 0)}, 0.1)
                        Tween(SliderKnob, {Position = UDim2.new(pos, -8, 0.5, -8)}, 0.1)
                        callback(Value)
                    end,
                    Get = function() return Value end
                }
            end

            -- DISCORD CTA BUTTON
            function Items:DiscordCTA(code)
                local Btn = Instance.new("TextButton")
                Btn.Size = UDim2.new(1, 0, 0, 50)
                Btn.BackgroundColor3 = UI.Colors.Discord
                Btn.Text = ""
                Btn.Parent = Container
                Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)
                
                local Icon = Instance.new("ImageLabel")
                Icon.Size = UDim2.new(0, 32, 0, 32)
                Icon.Position = UDim2.new(0, 10, 0.5, -16)
                Icon.BackgroundTransparency = 1
                Icon.Image = "rbxassetid://16047585258"
                Icon.Parent = Btn
                
                local Title = Instance.new("TextLabel")
                Title.Size = UDim2.new(1, -60, 0, 16)
                Title.Position = UDim2.new(0, 50, 0.5, -9)
                Title.BackgroundTransparency = 1
                Title.Text = "JOIN DISCORD"
                Title.TextColor3 = Color3.new(1,1,1)
                Title.Font = Enum.Font.GothamBlack
                Title.TextSize = 16
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.Parent = Btn
                
                local Sub = Instance.new("TextLabel")
                Sub.Size = UDim2.new(1, -60, 0, 12)
                Sub.Position = UDim2.new(0, 50, 0.5, 7)
                Sub.BackgroundTransparency = 1
                Sub.Text = "Get Scripts, Configs & Support"
                Sub.TextColor3 = Color3.fromRGB(220, 220, 255)
                Sub.Font = Enum.Font.GothamBold
                Sub.TextSize = 11
                Sub.TextXAlignment = Enum.TextXAlignment.Left
                Sub.Parent = Btn

                TrackConnection(Btn.MouseEnter:Connect(function() Tween(Btn, {BackgroundColor3=UI.Colors.DiscordHvr}) end))
                TrackConnection(Btn.MouseLeave:Connect(function() Tween(Btn, {BackgroundColor3=UI.Colors.Discord}) end))

                TrackConnection(Btn.MouseButton1Click:Connect(function()
                    setclipboard("https://discord.gg/"..code)
                    Title.Text = "LINK COPIED!"
                    Title.TextColor3 = UI.Colors.Green
                    Tween(Btn, {BackgroundColor3 = Color3.fromRGB(40,40,45)})
                    Notify("Discord", "Invite link copied to clipboard!", 2, "success")
                    task.wait(1.5)
                    Title.Text = "JOIN DISCORD"
                    Title.TextColor3 = Color3.new(1,1,1)
                    Tween(Btn, {BackgroundColor3 = UI.Colors.Discord})
                end))
            end
            
            function Items:Label(txt, col)
                 local T = Instance.new("TextLabel"); T.Size=UDim2.new(1,0,0,20); T.BackgroundTransparency=1; T.Text=txt; T.TextColor3=col or UI.Colors.Text; T.Font=Enum.Font.Gotham; T.TextSize=12; T.Parent=Container; T.TextXAlignment=Enum.TextXAlignment.Left; return T
            end
            return Items
        end
        return Components
    end
    
    -- Expose notify function globally on Lib
    Lib.Notify = Notify
    return Lib
end

-- === [ INIT ] ===
local Win = Library:Window()
local User = Win:Category("Famy")

local Dash = User:Collapsible("Dashboard", true, 60+16) 
Dash:Profile(LocalPlayer.UserId)

local Stat = User:Collapsible("Status", true, 110+16)
Stat:StatGrid()

local Soc = User:Collapsible("Socials", true, 50+16)
Soc:DiscordCTA("wkkgT7a57U")

-- Example usage of new components (commented out):
-- local Settings = User:Collapsible("Settings", false)
-- Settings:Toggle("Enable Feature", false, function(val) print("Feature:", val) end)
-- Settings:Slider("Speed", 1, 100, 50, function(val) print("Speed:", val) end)

-- Startup notification
Win.Notify("FAMYY PRIVATE", "UI Loaded! Press RightShift to toggle.", 3, "success")
