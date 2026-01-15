--[[
    FAMYY PRIVATE - Toggle Component
    iOS-style toggle switch with animations
]]

local Toggle = {}

--[[
    Creates a new toggle component
    @param parent Instance - Parent container
    @param config table - Configuration options
        - Label: string - Toggle label text
        - Default: boolean - Initial state (default: false)
        - Callback: function - Called when state changes
        - Theme: table - Theme configuration
        - Tween: table - Tween utility module
        - Connections: table - Connection manager
    @return table - Toggle controller
]]
function Toggle.new(parent, config)
    local Theme = config.Theme
    local Tween = config.Tween
    local Connections = config.Connections
    local Safety = config.Safety
    
    local label = config.Label or "Toggle"
    local state = config.Default or false
    local callback = config.Callback or function() end
    
    -- Main frame
    local Frame = Instance.new("Frame")
    Frame.Name = "Toggle_" .. label
    Frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.ToggleHeight)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent
    
    -- Label
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.Position = UDim2.new(0, 0, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = label
    Label.TextColor3 = Theme.Colors.Text
    Label.Font = Theme.Fonts.Body
    Label.TextSize = Theme.TextSizes.Body
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame
    
    -- Toggle button
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 44, 0, 24)
    Button.Position = UDim2.new(1, -44, 0.5, -12)
    Button.BackgroundColor3 = state and Theme.Colors.Accent or Theme.Colors.Surface
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = Frame
    
    local ButtonCorner = Instance.new("UICorner", Button)
    ButtonCorner.CornerRadius = Theme.Corners.Toggle
    
    local ButtonStroke = Instance.new("UIStroke", Button)
    ButtonStroke.Color = state and Theme.Colors.Accent or Theme.Colors.TextDim
    ButtonStroke.Thickness = Theme.Stroke.Default
    
    -- Knob
    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 18, 0, 18)
    Knob.Position = state and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    Knob.BackgroundColor3 = Theme.Colors.Text
    Knob.Parent = Button
    Instance.new("UICorner", Knob).CornerRadius = Theme.Corners.Toggle
    
    -- Update visual state
    local function UpdateVisuals()
        if state then
            Tween.Play(Button, {BackgroundColor3 = Theme.Colors.Accent})
            Tween.Play(ButtonStroke, {Color = Theme.Colors.Accent})
            Tween.Play(Knob, {Position = UDim2.new(1, -21, 0.5, -9)})
        else
            Tween.Play(Button, {BackgroundColor3 = Theme.Colors.Surface})
            Tween.Play(ButtonStroke, {Color = Theme.Colors.TextDim})
            Tween.Play(Knob, {Position = UDim2.new(0, 3, 0.5, -9)})
        end
    end
    
    -- Safe callback execution
    local function FireCallback()
        if Safety then
            local success, err = Safety.Call(callback, state)
            if not success then
                warn("[FamyyPrivate] Toggle callback error:", err)
            end
        else
            local success, err = pcall(callback, state)
            if not success then
                warn("[FamyyPrivate] Toggle callback error:", err)
            end
        end
    end
    
    -- Click handler
    local clickConn = Button.MouseButton1Click:Connect(function()
        state = not state
        UpdateVisuals()
        FireCallback()
    end)
    
    if Connections then
        Connections:Track(clickConn)
    end
    
    -- Hover effect
    local enterConn = Button.MouseEnter:Connect(function()
        if not state then
            Tween.Play(Button, {BackgroundColor3 = Theme.Colors.SurfaceHover}, 0.15)
        end
    end)
    
    local leaveConn = Button.MouseLeave:Connect(function()
        if not state then
            Tween.Play(Button, {BackgroundColor3 = Theme.Colors.Surface}, 0.15)
        end
    end)
    
    if Connections then
        Connections:Track(enterConn)
        Connections:Track(leaveConn)
    end
    
    -- Controller
    local Controller = {}
    
    --[[
        Sets the toggle state
        @param value boolean - New state
        @param fireCallback boolean? - Whether to fire callback (default: true)
    ]]
    function Controller:Set(value, fireCallback)
        state = value
        UpdateVisuals()
        if fireCallback ~= false then
            FireCallback()
        end
    end
    
    --[[
        Gets the current state
        @return boolean
    ]]
    function Controller:Get()
        return state
    end
    
    --[[
        Sets a new callback
        @param newCallback function
    ]]
    function Controller:SetCallback(newCallback)
        callback = newCallback or function() end
    end
    
    --[[
        Destroys the toggle
    ]]
    function Controller:Destroy()
        Frame:Destroy()
    end
    
    -- Return controller and frame
    Controller.Frame = Frame
    return Controller
end

return Toggle
