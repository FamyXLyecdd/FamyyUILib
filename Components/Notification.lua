--[[
    FAMYY PRIVATE - Notification Component
    Toast-style notification system
]]

local Notification = {}

--[[
    Creates a notification container
    @param parent Instance - ScreenGui parent
    @param config table - Configuration
        - Theme: table - Theme configuration
        - Tween: table - Tween utility
    @return table - Notification manager
]]
function Notification.new(parent, config)
    local Theme = config.Theme
    local Tween = config.Tween
    
    -- Container
    local Container = Instance.new("Frame")
    Container.Name = "NotificationContainer"
    Container.Size = UDim2.new(0, 220, 1, 0)
    Container.Position = UDim2.new(1, -230, 0, 10)
    Container.BackgroundTransparency = 1
    Container.Parent = parent
    
    local Layout = Instance.new("UIListLayout", Container)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 8)
    Layout.VerticalAlignment = Enum.VerticalAlignment.Top
    
    local Manager = {}
    
    -- Notification type colors
    local TypeColors = {
        info = Theme.Colors.Accent,
        success = Theme.Colors.Success,
        warning = Theme.Colors.Warning,
        error = Theme.Colors.Error,
    }
    
    --[[
        Shows a notification
        @param title string - Notification title
        @param message string - Notification message
        @param duration number? - Duration in seconds (default: 3)
        @param notifType string? - "info" | "success" | "warning" | "error"
    ]]
    function Manager:Notify(title, message, duration, notifType)
        duration = duration or 3
        notifType = notifType or "info"
        
        local accentColor = TypeColors[notifType] or Theme.Colors.Accent
        
        -- Notification frame
        local Notif = Instance.new("Frame")
        Notif.Size = UDim2.new(1, 0, 0, 60)
        Notif.BackgroundColor3 = Theme.Colors.Surface
        Notif.BackgroundTransparency = 1
        Notif.Parent = Container
        
        Instance.new("UICorner", Notif).CornerRadius = Theme.Corners.Notification
        
        local Stroke = Instance.new("UIStroke", Notif)
        Stroke.Color = accentColor
        Stroke.Thickness = Theme.Stroke.Default
        Stroke.Transparency = 1
        
        -- Accent bar
        local AccentBar = Instance.new("Frame")
        AccentBar.Size = UDim2.new(0, 3, 1, -10)
        AccentBar.Position = UDim2.new(0, 5, 0, 5)
        AccentBar.BackgroundColor3 = accentColor
        AccentBar.Parent = Notif
        Instance.new("UICorner", AccentBar).CornerRadius = UDim.new(0, 2)
        
        -- Title
        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -20, 0, 20)
        Title.Position = UDim2.new(0, 15, 0, 8)
        Title.BackgroundTransparency = 1
        Title.Text = title
        Title.TextColor3 = Theme.Colors.Text
        Title.Font = Theme.Fonts.Header
        Title.TextSize = Theme.TextSizes.Body
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Parent = Notif
        
        -- Message
        local Msg = Instance.new("TextLabel")
        Msg.Size = UDim2.new(1, -20, 0, 25)
        Msg.Position = UDim2.new(0, 15, 0, 28)
        Msg.BackgroundTransparency = 1
        Msg.Text = message
        Msg.TextColor3 = Theme.Colors.TextDim
        Msg.Font = Theme.Fonts.Caption
        Msg.TextSize = Theme.TextSizes.Small
        Msg.TextXAlignment = Enum.TextXAlignment.Left
        Msg.TextWrapped = true
        Msg.Parent = Notif
        
        -- Animate in
        Notif.Position = UDim2.new(1, 50, 0, 0)
        Tween.Play(Notif, {BackgroundTransparency = 0, Position = UDim2.new(0, 0, 0, 0)}, 0.3)
        Tween.Play(Stroke, {Transparency = 0}, 0.3)
        
        -- Animate out and destroy
        task.delay(duration, function()
            Tween.Play(Notif, {BackgroundTransparency = 1, Position = UDim2.new(1, 50, 0, 0)}, 0.3)
            Tween.Play(Stroke, {Transparency = 1}, 0.3)
            task.wait(0.35)
            Notif:Destroy()
        end)
    end
    
    --[[
        Clears all notifications
    ]]
    function Manager:Clear()
        for _, child in ipairs(Container:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
    end
    
    --[[
        Destroys the notification system
    ]]
    function Manager:Destroy()
        Container:Destroy()
    end
    
    Manager.Container = Container
    return Manager
end

return Notification
