--[[
    FAMYY PRIVATE - Slider Component
    Draggable range slider with value display
]]

local UserInputService = game:GetService("UserInputService")

local Slider = {}

--[[
    Creates a new slider component
    @param parent Instance - Parent container
    @param config table - Configuration options
        - Label: string - Slider label text
        - Min: number - Minimum value
        - Max: number - Maximum value
        - Default: number - Initial value
        - Step: number - Step increment (optional)
        - Suffix: string - Value suffix (e.g., "%", "px")
        - Callback: function - Called when value changes
        - Theme: table - Theme configuration
        - Tween: table - Tween utility module
        - Connections: table - Connection manager
    @return table - Slider controller
]]
function Slider.new(parent, config)
    local Theme = config.Theme
    local Tween = config.Tween
    local Connections = config.Connections
    local Safety = config.Safety
    
    local label = config.Label or "Slider"
    local min = config.Min or 0
    local max = config.Max or 100
    local step = config.Step
    local suffix = config.Suffix or ""
    local value = math.clamp(config.Default or min, min, max)
    local callback = config.Callback or function() end
    
    -- Main frame
    local Frame = Instance.new("Frame")
    Frame.Name = "Slider_" .. label
    Frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.SliderHeight)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent
    
    -- Top row (label + value)
    local TopRow = Instance.new("Frame")
    TopRow.Size = UDim2.new(1, 0, 0, 20)
    TopRow.BackgroundTransparency = 1
    TopRow.Parent = Frame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = label
    Label.TextColor3 = Theme.Colors.Text
    Label.Font = Theme.Fonts.Body
    Label.TextSize = Theme.TextSizes.Body
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = TopRow
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0.3, 0, 1, 0)
    ValueLabel.Position = UDim2.new(0.7, 0, 0, 0)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(value) .. suffix
    ValueLabel.TextColor3 = Theme.Colors.Accent
    ValueLabel.Font = Theme.Fonts.Header
    ValueLabel.TextSize = Theme.TextSizes.Body
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = TopRow
    
    -- Slider track
    local Track = Instance.new("Frame")
    Track.Size = UDim2.new(1, 0, 0, 8)
    Track.Position = UDim2.new(0, 0, 0, 28)
    Track.BackgroundColor3 = Theme.Colors.Surface
    Track.Parent = Frame
    Instance.new("UICorner", Track).CornerRadius = Theme.Corners.Toggle
    
    -- Slider fill
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Theme.Colors.Accent
    Fill.Parent = Track
    Instance.new("UICorner", Fill).CornerRadius = Theme.Corners.Toggle
    
    -- Slider knob
    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 16, 0, 16)
    Knob.Position = UDim2.new((value - min) / (max - min), -8, 0.5, -8)
    Knob.BackgroundColor3 = Theme.Colors.Text
    Knob.Parent = Track
    Instance.new("UICorner", Knob).CornerRadius = Theme.Corners.Toggle
    
    local KnobStroke = Instance.new("UIStroke", Knob)
    KnobStroke.Color = Theme.Colors.Accent
    KnobStroke.Thickness = 2
    KnobStroke.Transparency = 1
    
    local dragging = false
    
    -- Safe callback execution
    local function FireCallback()
        if Safety then
            local success, err = Safety.Call(callback, value)
            if not success then
                warn("[FamyyPrivate] Slider callback error:", err)
            end
        else
            local success, err = pcall(callback, value)
            if not success then
                warn("[FamyyPrivate] Slider callback error:", err)
            end
        end
    end
    
    -- Update slider position
    local function UpdateSlider(input)
        local pos = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
        local newValue = min + (max - min) * pos
        
        -- Apply step if specified
        if step then
            newValue = math.floor(newValue / step + 0.5) * step
        else
            newValue = math.floor(newValue)
        end
        
        newValue = math.clamp(newValue, min, max)
        
        if newValue ~= value then
            value = newValue
            local normalizedPos = (value - min) / (max - min)
            ValueLabel.Text = tostring(value) .. suffix
            Tween.Play(Fill, {Size = UDim2.new(normalizedPos, 0, 1, 0)}, 0.1)
            Tween.Play(Knob, {Position = UDim2.new(normalizedPos, -8, 0.5, -8)}, 0.1)
            FireCallback()
        end
    end
    
    -- Input handlers
    local inputBeganConn = Track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            Tween.Play(KnobStroke, {Transparency = 0}, 0.15)
            Tween.Play(Knob, {Size = UDim2.new(0, 18, 0, 18), Position = UDim2.new((value - min) / (max - min), -9, 0.5, -9)}, 0.15)
            UpdateSlider(input)
        end
    end)
    
    local inputChangedConn = UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or 
                         input.UserInputType == Enum.UserInputType.Touch) then
            UpdateSlider(input)
        end
    end)
    
    local inputEndedConn = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            Tween.Play(KnobStroke, {Transparency = 1}, 0.15)
            Tween.Play(Knob, {Size = UDim2.new(0, 16, 0, 16), Position = UDim2.new((value - min) / (max - min), -8, 0.5, -8)}, 0.15)
        end
    end)
    
    if Connections then
        Connections:Track(inputBeganConn)
        Connections:Track(inputChangedConn)
        Connections:Track(inputEndedConn)
    end
    
    -- Controller
    local Controller = {}
    
    --[[
        Sets the slider value
        @param newValue number - New value
        @param fireCallback boolean? - Whether to fire callback (default: true)
    ]]
    function Controller:Set(newValue, fireCallback)
        value = math.clamp(newValue, min, max)
        local pos = (value - min) / (max - min)
        ValueLabel.Text = tostring(value) .. suffix
        Tween.Play(Fill, {Size = UDim2.new(pos, 0, 1, 0)}, 0.1)
        Tween.Play(Knob, {Position = UDim2.new(pos, -8, 0.5, -8)}, 0.1)
        if fireCallback ~= false then
            FireCallback()
        end
    end
    
    --[[
        Gets the current value
        @return number
    ]]
    function Controller:Get()
        return value
    end
    
    --[[
        Sets a new callback
        @param newCallback function
    ]]
    function Controller:SetCallback(newCallback)
        callback = newCallback or function() end
    end
    
    --[[
        Destroys the slider
    ]]
    function Controller:Destroy()
        Frame:Destroy()
    end
    
    Controller.Frame = Frame
    return Controller
end

return Slider
