--[[
    FAMYY PRIVATE - TextInput Component
    Text input field with placeholder and validation
]]

local UserInputService = game:GetService("UserInputService")

local TextInput = {}

--[[
    Creates a new text input component
    @param parent Instance - Parent container
    @param config table - Configuration options
        - Label: string - Input label text
        - Placeholder: string - Placeholder text
        - Default: string - Default value
        - ClearOnFocus: boolean - Clear text on focus
        - Numeric: boolean - Only allow numbers
        - MaxLength: number - Maximum character length
        - Callback: function - Called when value changes
        - Theme: table - Theme configuration
        - Tween: table - Tween utility module
        - Connections: table - Connection manager
    @return table - TextInput controller
]]
function TextInput.new(parent, config)
    local Theme = config.Theme
    local Tween = config.Tween
    local Connections = config.Connections
    local Safety = config.Safety
    
    local label = config.Label or "Input"
    local placeholder = config.Placeholder or "Enter text..."
    local value = config.Default or ""
    local clearOnFocus = config.ClearOnFocus or false
    local numeric = config.Numeric or false
    local maxLength = config.MaxLength
    local callback = config.Callback or function() end
    
    -- Main frame
    local Frame = Instance.new("Frame")
    Frame.Name = "TextInput_" .. label
    Frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.InputHeight)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent
    
    -- Label
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.4, -5, 1, 0)
    Label.Position = UDim2.new(0, 0, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = label
    Label.TextColor3 = Theme.Colors.Text
    Label.Font = Theme.Fonts.Body
    Label.TextSize = Theme.TextSizes.Body
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame
    
    -- Input container
    local InputContainer = Instance.new("Frame")
    InputContainer.Size = UDim2.new(0.6, 0, 0, 28)
    InputContainer.Position = UDim2.new(0.4, 0, 0.5, -14)
    InputContainer.BackgroundColor3 = Theme.Colors.Surface
    InputContainer.Parent = Frame
    Instance.new("UICorner", InputContainer).CornerRadius = Theme.Corners.Input
    
    local InputStroke = Instance.new("UIStroke", InputContainer)
    InputStroke.Color = Theme.Colors.TextDim
    InputStroke.Thickness = Theme.Stroke.Default
    InputStroke.Transparency = 0.5
    
    -- Text box
    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(1, -16, 1, 0)
    TextBox.Position = UDim2.new(0, 8, 0, 0)
    TextBox.BackgroundTransparency = 1
    TextBox.Text = value
    TextBox.PlaceholderText = placeholder
    TextBox.PlaceholderColor3 = Theme.Colors.TextMuted
    TextBox.TextColor3 = Theme.Colors.Text
    TextBox.Font = Theme.Fonts.Body
    TextBox.TextSize = Theme.TextSizes.Caption
    TextBox.TextXAlignment = Enum.TextXAlignment.Left
    TextBox.ClearTextOnFocus = clearOnFocus
    TextBox.Parent = InputContainer
    
    -- Safe callback execution
    local function FireCallback()
        if Safety then
            local success, err = Safety.Call(callback, value)
            if not success then
                warn("[FamyyPrivate] TextInput callback error:", err)
            end
        else
            local success, err = pcall(callback, value)
            if not success then
                warn("[FamyyPrivate] TextInput callback error:", err)
            end
        end
    end
    
    -- Focus effects
    local focusedConn = TextBox.Focused:Connect(function()
        Tween.Play(InputStroke, {Color = Theme.Colors.Accent, Transparency = 0}, 0.15)
        Tween.Play(InputContainer, {BackgroundColor3 = Theme.Colors.SurfaceHover}, 0.15)
    end)
    
    local focusLostConn = TextBox.FocusLost:Connect(function(enterPressed)
        Tween.Play(InputStroke, {Color = Theme.Colors.TextDim, Transparency = 0.5}, 0.15)
        Tween.Play(InputContainer, {BackgroundColor3 = Theme.Colors.Surface}, 0.15)
        
        local newValue = TextBox.Text
        
        -- Apply validation
        if numeric then
            newValue = newValue:gsub("[^%d%.%-]", "")
            TextBox.Text = newValue
        end
        
        if maxLength and #newValue > maxLength then
            newValue = newValue:sub(1, maxLength)
            TextBox.Text = newValue
        end
        
        if newValue ~= value then
            value = newValue
            FireCallback()
        end
    end)
    
    -- Live input validation for numeric
    local changedConn
    if numeric then
        changedConn = TextBox:GetPropertyChangedSignal("Text"):Connect(function()
            local text = TextBox.Text
            local filtered = text:gsub("[^%d%.%-]", "")
            if text ~= filtered then
                TextBox.Text = filtered
            end
        end)
    end
    
    if Connections then
        Connections:Track(focusedConn)
        Connections:Track(focusLostConn)
        if changedConn then
            Connections:Track(changedConn)
        end
    end
    
    -- Hover effect
    local enterConn = InputContainer.MouseEnter:Connect(function()
        if not TextBox:IsFocused() then
            Tween.Play(InputStroke, {Transparency = 0.2}, 0.15)
        end
    end)
    
    local leaveConn = InputContainer.MouseLeave:Connect(function()
        if not TextBox:IsFocused() then
            Tween.Play(InputStroke, {Transparency = 0.5}, 0.15)
        end
    end)
    
    if Connections then
        Connections:Track(enterConn)
        Connections:Track(leaveConn)
    end
    
    -- Controller
    local Controller = {}
    
    --[[
        Sets the input value
        @param newValue string - New value
        @param fireCallback boolean? - Whether to fire callback (default: true)
    ]]
    function Controller:Set(newValue, fireCallback)
        value = tostring(newValue)
        TextBox.Text = value
        if fireCallback ~= false then
            FireCallback()
        end
    end
    
    --[[
        Gets the current value
        @return string
    ]]
    function Controller:Get()
        return value
    end
    
    --[[
        Gets the numeric value (if numeric mode)
        @return number
    ]]
    function Controller:GetNumber()
        return tonumber(value) or 0
    end
    
    --[[
        Focuses the input
    ]]
    function Controller:Focus()
        TextBox:CaptureFocus()
    end
    
    --[[
        Sets the placeholder text
        @param text string
    ]]
    function Controller:SetPlaceholder(text)
        TextBox.PlaceholderText = text
    end
    
    --[[
        Destroys the input
    ]]
    function Controller:Destroy()
        Frame:Destroy()
    end
    
    Controller.Frame = Frame
    return Controller
end

return TextInput
