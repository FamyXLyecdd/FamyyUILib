--[[
    FAMYY PRIVATE - Button Component
    Simple clickable button with hover effects
]]

local Button = {}

--[[
    Creates a new button component
    @param parent Instance - Parent container
    @param config table - Configuration options
        - Label: string - Button text
        - Callback: function - Called when clicked
        - Style: string - "primary" | "secondary" | "danger" (default: "secondary")
        - Theme: table - Theme configuration
        - Tween: table - Tween utility module
        - Connections: table - Connection manager
    @return table - Button controller
]]
function Button.new(parent, config)
    local Theme = config.Theme
    local Tween = config.Tween
    local Connections = config.Connections
    local Safety = config.Safety
    
    local label = config.Label or "Button"
    local callback = config.Callback or function() end
    local style = config.Style or "secondary"
    
    -- Style colors
    local styles = {
        primary = {
            Background = Theme.Colors.Accent,
            BackgroundHover = Theme.Colors.AccentHover or Theme.Colors.Accent,
            Text = Theme.Colors.Text,
        },
        secondary = {
            Background = Theme.Colors.Surface,
            BackgroundHover = Theme.Colors.SurfaceHover,
            Text = Theme.Colors.Text,
        },
        danger = {
            Background = Theme.Colors.Surface,
            BackgroundHover = Theme.Colors.Error,
            Text = Theme.Colors.Error,
            TextHover = Theme.Colors.Text,
        },
        success = {
            Background = Theme.Colors.Surface,
            BackgroundHover = Theme.Colors.Success,
            Text = Theme.Colors.Success,
            TextHover = Theme.Colors.Text,
        },
    }
    
    local currentStyle = styles[style] or styles.secondary
    
    -- Main button
    local Btn = Instance.new("TextButton")
    Btn.Name = "Button_" .. label
    Btn.Size = UDim2.new(1, 0, 0, Theme.Sizes.ButtonHeight)
    Btn.BackgroundColor3 = currentStyle.Background
    Btn.Text = label
    Btn.TextColor3 = currentStyle.Text
    Btn.Font = Theme.Fonts.Header
    Btn.TextSize = Theme.TextSizes.Body
    Btn.AutoButtonColor = false
    Btn.Parent = parent
    
    Instance.new("UICorner", Btn).CornerRadius = Theme.Corners.Button
    
    local Stroke = Instance.new("UIStroke", Btn)
    Stroke.Color = currentStyle.Text
    Stroke.Thickness = Theme.Stroke.Default
    Stroke.Transparency = 0.8
    
    -- Safe callback execution
    local function FireCallback()
        if Safety then
            local success, err = Safety.Call(callback)
            if not success then
                warn("[FamyyPrivate] Button callback error:", err)
            end
        else
            local success, err = pcall(callback)
            if not success then
                warn("[FamyyPrivate] Button callback error:", err)
            end
        end
    end
    
    -- Hover effect
    local enterConn = Btn.MouseEnter:Connect(function()
        Tween.Play(Btn, {BackgroundColor3 = currentStyle.BackgroundHover}, 0.15)
        if currentStyle.TextHover then
            Tween.Play(Btn, {TextColor3 = currentStyle.TextHover}, 0.15)
        end
        Tween.Play(Stroke, {Transparency = 0.5}, 0.15)
    end)
    
    local leaveConn = Btn.MouseLeave:Connect(function()
        Tween.Play(Btn, {BackgroundColor3 = currentStyle.Background}, 0.15)
        Tween.Play(Btn, {TextColor3 = currentStyle.Text}, 0.15)
        Tween.Play(Stroke, {Transparency = 0.8}, 0.15)
    end)
    
    -- Click effect
    local clickConn = Btn.MouseButton1Click:Connect(function()
        -- Flash effect
        Tween.Play(Btn, {BackgroundColor3 = Theme.Colors.Accent}, 0.1)
        task.delay(0.1, function()
            Tween.Play(Btn, {BackgroundColor3 = currentStyle.Background}, 0.15)
        end)
        FireCallback()
    end)
    
    if Connections then
        Connections:Track(enterConn)
        Connections:Track(leaveConn)
        Connections:Track(clickConn)
    end
    
    -- Controller
    local Controller = {}
    
    --[[
        Sets the button label
        @param text string
    ]]
    function Controller:SetLabel(text)
        Btn.Text = text
    end
    
    --[[
        Sets a new callback
        @param newCallback function
    ]]
    function Controller:SetCallback(newCallback)
        callback = newCallback or function() end
    end
    
    --[[
        Enables/disables the button
        @param enabled boolean
    ]]
    function Controller:SetEnabled(enabled)
        Btn.Active = enabled
        Btn.AutoButtonColor = enabled
        if enabled then
            Tween.Play(Btn, {BackgroundTransparency = 0, TextTransparency = 0}, 0.15)
        else
            Tween.Play(Btn, {BackgroundTransparency = 0.5, TextTransparency = 0.5}, 0.15)
        end
    end
    
    --[[
        Destroys the button
    ]]
    function Controller:Destroy()
        Btn:Destroy()
    end
    
    Controller.Frame = Btn
    return Controller
end

return Button
