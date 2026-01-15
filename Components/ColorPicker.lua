--[[
    FAMYY PRIVATE - ColorPicker Component
    Interactive color selection with HSV color wheel
]]

local UserInputService = game:GetService("UserInputService")

local ColorPicker = {}

--[[
    Creates a new color picker component
    @param parent Instance - Parent container
    @param config table - Configuration options
        - Label: string - Picker label text
        - Default: Color3 - Default color
        - Callback: function - Called when color changes
        - Theme: table - Theme configuration
        - Tween: table - Tween utility module
        - Connections: table - Connection manager
    @return table - ColorPicker controller
]]
function ColorPicker.new(parent, config)
    local Theme = config.Theme
    local Tween = config.Tween
    local Connections = config.Connections
    local Safety = config.Safety
    
    local label = config.Label or "Color"
    local color = config.Default or Color3.fromRGB(255, 255, 255)
    local callback = config.Callback or function() end
    
    local isOpen = false
    local hue, saturation, value = color:ToHSV()
    
    local pickerHeight = 150
    
    -- Main frame
    local Frame = Instance.new("Frame")
    Frame.Name = "ColorPicker_" .. label
    Frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.ToggleHeight)
    Frame.BackgroundTransparency = 1
    Frame.ClipsDescendants = false
    Frame.Parent = parent
    
    -- Label
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -50, 1, 0)
    Label.Position = UDim2.new(0, 0, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = label
    Label.TextColor3 = Theme.Colors.Text
    Label.Font = Theme.Fonts.Body
    Label.TextSize = Theme.TextSizes.Body
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame
    
    -- Color preview button
    local Preview = Instance.new("TextButton")
    Preview.Size = UDim2.new(0, 40, 0, 24)
    Preview.Position = UDim2.new(1, -40, 0.5, -12)
    Preview.BackgroundColor3 = color
    Preview.Text = ""
    Preview.AutoButtonColor = false
    Preview.Parent = Frame
    
    Instance.new("UICorner", Preview).CornerRadius = Theme.Corners.Button
    
    local PreviewStroke = Instance.new("UIStroke", Preview)
    PreviewStroke.Color = Theme.Colors.Text
    PreviewStroke.Thickness = Theme.Stroke.Default
    PreviewStroke.Transparency = 0.5
    
    -- Picker container (dropdown)
    local PickerContainer = Instance.new("Frame")
    PickerContainer.Size = UDim2.new(1, 0, 0, 0)
    PickerContainer.Position = UDim2.new(0, 0, 0, Theme.Sizes.ToggleHeight + 4)
    PickerContainer.BackgroundColor3 = Theme.Colors.Surface
    PickerContainer.ClipsDescendants = true
    PickerContainer.Visible = false
    PickerContainer.ZIndex = 10
    PickerContainer.Parent = Frame
    
    Instance.new("UICorner", PickerContainer).CornerRadius = Theme.Corners.Card
    local PickerStroke = Instance.new("UIStroke", PickerContainer)
    PickerStroke.Color = Theme.Colors.Accent
    PickerStroke.Thickness = Theme.Stroke.Default
    
    local PickerPadding = Instance.new("UIPadding", PickerContainer)
    PickerPadding.PaddingTop = UDim.new(0, 8)
    PickerPadding.PaddingBottom = UDim.new(0, 8)
    PickerPadding.PaddingLeft = UDim.new(0, 8)
    PickerPadding.PaddingRight = UDim.new(0, 8)
    
    -- Saturation/Value picker (main color area)
    local SatValPicker = Instance.new("ImageButton")
    SatValPicker.Size = UDim2.new(1, -25, 0, 100)
    SatValPicker.Position = UDim2.new(0, 0, 0, 0)
    SatValPicker.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
    SatValPicker.AutoButtonColor = false
    SatValPicker.ZIndex = 11
    SatValPicker.Parent = PickerContainer
    Instance.new("UICorner", SatValPicker).CornerRadius = Theme.Corners.Button
    
    -- Saturation gradient (white to transparent)
    local SatGradient = Instance.new("UIGradient", SatValPicker)
    SatGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)),
    })
    SatGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1),
    })
    
    -- Value overlay (black gradient from bottom)
    local ValueOverlay = Instance.new("Frame")
    ValueOverlay.Size = UDim2.new(1, 0, 1, 0)
    ValueOverlay.BackgroundColor3 = Color3.new(0, 0, 0)
    ValueOverlay.ZIndex = 12
    ValueOverlay.Parent = SatValPicker
    Instance.new("UICorner", ValueOverlay).CornerRadius = Theme.Corners.Button
    
    local ValueGradient = Instance.new("UIGradient", ValueOverlay)
    ValueGradient.Rotation = 90
    ValueGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(1, 0),
    })
    
    -- Sat/Val cursor
    local SatValCursor = Instance.new("Frame")
    SatValCursor.Size = UDim2.new(0, 12, 0, 12)
    SatValCursor.BackgroundColor3 = Color3.new(1, 1, 1)
    SatValCursor.ZIndex = 13
    SatValCursor.Parent = SatValPicker
    Instance.new("UICorner", SatValCursor).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", SatValCursor).Thickness = 2
    
    -- Hue slider
    local HueSlider = Instance.new("ImageButton")
    HueSlider.Size = UDim2.new(0, 15, 0, 100)
    HueSlider.Position = UDim2.new(1, -15, 0, 0)
    HueSlider.BackgroundColor3 = Color3.new(1, 1, 1)
    HueSlider.AutoButtonColor = false
    HueSlider.ZIndex = 11
    HueSlider.Parent = PickerContainer
    Instance.new("UICorner", HueSlider).CornerRadius = Theme.Corners.Button
    
    -- Hue gradient
    local HueGradient = Instance.new("UIGradient", HueSlider)
    HueGradient.Rotation = 90
    HueGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
        ColorSequenceKeypoint.new(0.167, Color3.fromHSV(0.167, 1, 1)),
        ColorSequenceKeypoint.new(0.333, Color3.fromHSV(0.333, 1, 1)),
        ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
        ColorSequenceKeypoint.new(0.667, Color3.fromHSV(0.667, 1, 1)),
        ColorSequenceKeypoint.new(0.833, Color3.fromHSV(0.833, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
    })
    
    -- Hue cursor
    local HueCursor = Instance.new("Frame")
    HueCursor.Size = UDim2.new(1, 4, 0, 6)
    HueCursor.Position = UDim2.new(0, -2, 0, hue * 100 - 3)
    HueCursor.BackgroundColor3 = Color3.new(1, 1, 1)
    HueCursor.ZIndex = 12
    HueCursor.Parent = HueSlider
    Instance.new("UICorner", HueCursor).CornerRadius = UDim.new(0, 2)
    Instance.new("UIStroke", HueCursor).Thickness = 1
    
    -- RGB display
    local RGBLabel = Instance.new("TextLabel")
    RGBLabel.Size = UDim2.new(1, 0, 0, 20)
    RGBLabel.Position = UDim2.new(0, 0, 0, 108)
    RGBLabel.BackgroundTransparency = 1
    RGBLabel.TextColor3 = Theme.Colors.TextDim
    RGBLabel.Font = Theme.Fonts.Caption
    RGBLabel.TextSize = Theme.TextSizes.Small
    RGBLabel.ZIndex = 11
    RGBLabel.Parent = PickerContainer
    
    local function UpdateRGBLabel()
        local r = math.floor(color.R * 255)
        local g = math.floor(color.G * 255)
        local b = math.floor(color.B * 255)
        RGBLabel.Text = string.format("RGB: %d, %d, %d", r, g, b)
    end
    UpdateRGBLabel()
    
    -- Safe callback
    local function FireCallback()
        if Safety then
            local success, err = Safety.Call(callback, color)
            if not success then
                warn("[FamyyPrivate] ColorPicker callback error:", err)
            end
        else
            local success, err = pcall(callback, color)
            if not success then
                warn("[FamyyPrivate] ColorPicker callback error:", err)
            end
        end
    end
    
    -- Update color
    local function UpdateColor()
        color = Color3.fromHSV(hue, saturation, value)
        Preview.BackgroundColor3 = color
        SatValPicker.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        
        -- Update cursors
        SatValCursor.Position = UDim2.new(saturation, -6, 1 - value, -6)
        HueCursor.Position = UDim2.new(0, -2, hue, -3)
        
        UpdateRGBLabel()
        FireCallback()
    end
    
    -- Sat/Val dragging
    local draggingSV = false
    
    local svInputBegan = SatValPicker.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            draggingSV = true
            local pos = Vector2.new(
                math.clamp((input.Position.X - SatValPicker.AbsolutePosition.X) / SatValPicker.AbsoluteSize.X, 0, 1),
                math.clamp((input.Position.Y - SatValPicker.AbsolutePosition.Y) / SatValPicker.AbsoluteSize.Y, 0, 1)
            )
            saturation = pos.X
            value = 1 - pos.Y
            UpdateColor()
        end
    end)
    
    -- Hue dragging
    local draggingHue = false
    
    local hueInputBegan = HueSlider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            draggingHue = true
            local pos = math.clamp((input.Position.Y - HueSlider.AbsolutePosition.Y) / HueSlider.AbsoluteSize.Y, 0, 1)
            hue = pos
            UpdateColor()
        end
    end)
    
    local inputChangedConn = UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or 
           input.UserInputType == Enum.UserInputType.Touch then
            if draggingSV then
                local pos = Vector2.new(
                    math.clamp((input.Position.X - SatValPicker.AbsolutePosition.X) / SatValPicker.AbsoluteSize.X, 0, 1),
                    math.clamp((input.Position.Y - SatValPicker.AbsolutePosition.Y) / SatValPicker.AbsoluteSize.Y, 0, 1)
                )
                saturation = pos.X
                value = 1 - pos.Y
                UpdateColor()
            elseif draggingHue then
                local pos = math.clamp((input.Position.Y - HueSlider.AbsolutePosition.Y) / HueSlider.AbsoluteSize.Y, 0, 1)
                hue = pos
                UpdateColor()
            end
        end
    end)
    
    local inputEndedConn = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            draggingSV = false
            draggingHue = false
        end
    end)
    
    if Connections then
        Connections:Track(svInputBegan)
        Connections:Track(hueInputBegan)
        Connections:Track(inputChangedConn)
        Connections:Track(inputEndedConn)
    end
    
    -- Toggle picker
    local function TogglePicker()
        isOpen = not isOpen
        if isOpen then
            PickerContainer.Visible = true
            Tween.Play(PickerContainer, {Size = UDim2.new(1, 0, 0, pickerHeight)}, 0.2)
            Tween.Play(PreviewStroke, {Color = Theme.Colors.Accent, Transparency = 0}, 0.15)
        else
            Tween.Play(PickerContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
            Tween.Play(PreviewStroke, {Color = Theme.Colors.Text, Transparency = 0.5}, 0.15)
            task.delay(0.2, function()
                if not isOpen then
                    PickerContainer.Visible = false
                end
            end)
        end
    end
    
    local previewClick = Preview.MouseButton1Click:Connect(TogglePicker)
    
    if Connections then
        Connections:Track(previewClick)
    end
    
    -- Hover effect
    local enterConn = Preview.MouseEnter:Connect(function()
        Tween.Play(PreviewStroke, {Transparency = 0}, 0.15)
    end)
    
    local leaveConn = Preview.MouseLeave:Connect(function()
        if not isOpen then
            Tween.Play(PreviewStroke, {Transparency = 0.5}, 0.15)
        end
    end)
    
    if Connections then
        Connections:Track(enterConn)
        Connections:Track(leaveConn)
    end
    
    -- Initialize cursor positions
    UpdateColor()
    
    -- Controller
    local Controller = {}
    
    --[[
        Sets the color
        @param newColor Color3
        @param fireCallback boolean?
    ]]
    function Controller:Set(newColor, fireCallback)
        color = newColor
        hue, saturation, value = color:ToHSV()
        Preview.BackgroundColor3 = color
        SatValPicker.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        SatValCursor.Position = UDim2.new(saturation, -6, 1 - value, -6)
        HueCursor.Position = UDim2.new(0, -2, hue, -3)
        UpdateRGBLabel()
        if fireCallback ~= false then
            FireCallback()
        end
    end
    
    --[[
        Gets the current color
        @return Color3
    ]]
    function Controller:Get()
        return color
    end
    
    --[[
        Gets RGB values
        @return number, number, number
    ]]
    function Controller:GetRGB()
        return math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255)
    end
    
    --[[
        Sets color from RGB values
        @param r number
        @param g number
        @param b number
    ]]
    function Controller:SetRGB(r, g, b)
        self:Set(Color3.fromRGB(r, g, b))
    end
    
    --[[
        Closes the picker
    ]]
    function Controller:Close()
        if isOpen then
            TogglePicker()
        end
    end
    
    --[[
        Destroys the picker
    ]]
    function Controller:Destroy()
        Frame:Destroy()
    end
    
    Controller.Frame = Frame
    return Controller
end

return ColorPicker
