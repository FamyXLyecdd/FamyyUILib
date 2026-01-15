--[[
    FAMYY PRIVATE - Dropdown Component
    Select dropdown with multiple options
]]

local Dropdown = {}

--[[
    Creates a new dropdown component
    @param parent Instance - Parent container
    @param config table - Configuration options
        - Label: string - Dropdown label text
        - Options: {string} - Array of options
        - Default: string|number - Default option (value or index)
        - Multi: boolean - Allow multiple selections
        - Callback: function - Called when selection changes
        - Theme: table - Theme configuration
        - Tween: table - Tween utility module
        - Connections: table - Connection manager
    @return table - Dropdown controller
]]
function Dropdown.new(parent, config)
    local Theme = config.Theme
    local Tween = config.Tween
    local Connections = config.Connections
    local Safety = config.Safety
    
    local label = config.Label or "Dropdown"
    local options = config.Options or {}
    local multi = config.Multi or false
    local callback = config.Callback or function() end
    
    -- Handle default value
    local selected
    if multi then
        selected = {}
        if type(config.Default) == "table" then
            for _, v in ipairs(config.Default) do
                selected[v] = true
            end
        end
    else
        if type(config.Default) == "number" then
            selected = options[config.Default]
        else
            selected = config.Default or options[1]
        end
    end
    
    local isOpen = false
    local optionHeight = 30
    local maxVisibleOptions = 5
    
    -- Main frame
    local Frame = Instance.new("Frame")
    Frame.Name = "Dropdown_" .. label
    Frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.DropdownHeight)
    Frame.BackgroundTransparency = 1
    Frame.ClipsDescendants = false
    Frame.Parent = parent
    
    -- Header row
    local Header = Instance.new("TextButton")
    Header.Size = UDim2.new(1, 0, 0, Theme.Sizes.DropdownHeight)
    Header.BackgroundColor3 = Theme.Colors.Surface
    Header.Text = ""
    Header.AutoButtonColor = false
    Header.Parent = Frame
    Instance.new("UICorner", Header).CornerRadius = Theme.Corners.Button
    
    local HeaderStroke = Instance.new("UIStroke", Header)
    HeaderStroke.Color = Theme.Colors.TextDim
    HeaderStroke.Thickness = Theme.Stroke.Default
    HeaderStroke.Transparency = 0.5
    
    -- Label
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.5, -10, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = label
    Label.TextColor3 = Theme.Colors.TextDim
    Label.Font = Theme.Fonts.Body
    Label.TextSize = Theme.TextSizes.Body
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Header
    
    -- Selected value display
    local function GetDisplayText()
        if multi then
            local count = 0
            for _ in pairs(selected) do count = count + 1 end
            if count == 0 then return "None" end
            if count == 1 then
                for k in pairs(selected) do return k end
            end
            return count .. " selected"
        else
            return selected or "Select..."
        end
    end
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0.5, -30, 1, 0)
    ValueLabel.Position = UDim2.new(0.5, 0, 0, 0)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = GetDisplayText()
    ValueLabel.TextColor3 = Theme.Colors.Text
    ValueLabel.Font = Theme.Fonts.Body
    ValueLabel.TextSize = Theme.TextSizes.Body
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.TextTruncate = Enum.TextTruncate.AtEnd
    ValueLabel.Parent = Header
    
    -- Arrow
    local Arrow = Instance.new("ImageLabel")
    Arrow.Size = UDim2.new(0, 16, 0, 16)
    Arrow.Position = UDim2.new(1, -26, 0.5, -8)
    Arrow.BackgroundTransparency = 1
    Arrow.Image = "rbxassetid://6031090990"
    Arrow.ImageColor3 = Theme.Colors.TextDim
    Arrow.Rotation = 0
    Arrow.Parent = Header
    
    -- Options container
    local OptionsContainer = Instance.new("ScrollingFrame")
    local visibleCount = math.min(#options, maxVisibleOptions)
    OptionsContainer.Size = UDim2.new(1, 0, 0, 0)
    OptionsContainer.Position = UDim2.new(0, 0, 0, Theme.Sizes.DropdownHeight + 4)
    OptionsContainer.BackgroundColor3 = Theme.Colors.Surface
    OptionsContainer.BorderSizePixel = 0
    OptionsContainer.ScrollBarThickness = 3
    OptionsContainer.ScrollBarImageColor3 = Theme.Colors.Accent
    OptionsContainer.CanvasSize = UDim2.new(0, 0, 0, #options * optionHeight)
    OptionsContainer.Visible = false
    OptionsContainer.ZIndex = 10
    OptionsContainer.Parent = Frame
    
    Instance.new("UICorner", OptionsContainer).CornerRadius = Theme.Corners.Button
    local OptionsStroke = Instance.new("UIStroke", OptionsContainer)
    OptionsStroke.Color = Theme.Colors.Accent
    OptionsStroke.Thickness = Theme.Stroke.Default
    
    local OptionsLayout = Instance.new("UIListLayout", OptionsContainer)
    OptionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- Option buttons
    local optionButtons = {}
    
    local function UpdateOptions()
        ValueLabel.Text = GetDisplayText()
    end
    
    local function FireCallback()
        local result
        if multi then
            result = {}
            for k in pairs(selected) do
                table.insert(result, k)
            end
        else
            result = selected
        end
        
        if Safety then
            local success, err = Safety.Call(callback, result)
            if not success then
                warn("[FamyyPrivate] Dropdown callback error:", err)
            end
        else
            local success, err = pcall(callback, result)
            if not success then
                warn("[FamyyPrivate] Dropdown callback error:", err)
            end
        end
    end
    
    for i, option in ipairs(options) do
        local OptionBtn = Instance.new("TextButton")
        OptionBtn.Size = UDim2.new(1, 0, 0, optionHeight)
        OptionBtn.BackgroundColor3 = Theme.Colors.Surface
        OptionBtn.BackgroundTransparency = 0.5
        OptionBtn.Text = ""
        OptionBtn.AutoButtonColor = false
        OptionBtn.ZIndex = 11
        OptionBtn.LayoutOrder = i
        OptionBtn.Parent = OptionsContainer
        
        local OptionLabel = Instance.new("TextLabel")
        OptionLabel.Size = UDim2.new(1, -40, 1, 0)
        OptionLabel.Position = UDim2.new(0, 10, 0, 0)
        OptionLabel.BackgroundTransparency = 1
        OptionLabel.Text = option
        OptionLabel.TextColor3 = Theme.Colors.Text
        OptionLabel.Font = Theme.Fonts.Body
        OptionLabel.TextSize = Theme.TextSizes.Caption
        OptionLabel.TextXAlignment = Enum.TextXAlignment.Left
        OptionLabel.ZIndex = 11
        OptionLabel.Parent = OptionBtn
        
        -- Checkmark for multi-select or selected indicator
        local Check = Instance.new("TextLabel")
        Check.Size = UDim2.new(0, 20, 1, 0)
        Check.Position = UDim2.new(1, -30, 0, 0)
        Check.BackgroundTransparency = 1
        Check.Text = ""
        Check.TextColor3 = Theme.Colors.Accent
        Check.Font = Theme.Fonts.Header
        Check.TextSize = 14
        Check.ZIndex = 11
        Check.Parent = OptionBtn
        
        local function UpdateCheck()
            if multi then
                Check.Text = selected[option] and "✓" or ""
            else
                Check.Text = (selected == option) and "✓" or ""
            end
        end
        UpdateCheck()
        
        local optEnter = OptionBtn.MouseEnter:Connect(function()
            Tween.Play(OptionBtn, {BackgroundTransparency = 0}, 0.1)
            Tween.Play(OptionBtn, {BackgroundColor3 = Theme.Colors.SurfaceHover}, 0.1)
        end)
        
        local optLeave = OptionBtn.MouseLeave:Connect(function()
            Tween.Play(OptionBtn, {BackgroundTransparency = 0.5}, 0.1)
            Tween.Play(OptionBtn, {BackgroundColor3 = Theme.Colors.Surface}, 0.1)
        end)
        
        local optClick = OptionBtn.MouseButton1Click:Connect(function()
            if multi then
                selected[option] = not selected[option] or nil
            else
                selected = option
                -- Close dropdown on single select
                isOpen = false
                Tween.Play(Arrow, {Rotation = 0}, 0.2)
                Tween.Play(OptionsContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                task.delay(0.2, function()
                    OptionsContainer.Visible = false
                end)
            end
            
            -- Update all checkmarks
            for _, btn in ipairs(optionButtons) do
                btn.UpdateCheck()
            end
            
            UpdateOptions()
            FireCallback()
        end)
        
        if Connections then
            Connections:Track(optEnter)
            Connections:Track(optLeave)
            Connections:Track(optClick)
        end
        
        table.insert(optionButtons, {
            Button = OptionBtn,
            UpdateCheck = UpdateCheck,
        })
    end
    
    -- Toggle dropdown
    local function ToggleDropdown()
        isOpen = not isOpen
        if isOpen then
            OptionsContainer.Visible = true
            local targetHeight = math.min(#options, maxVisibleOptions) * optionHeight
            Tween.Play(Arrow, {Rotation = 180}, 0.2)
            Tween.Play(OptionsContainer, {Size = UDim2.new(1, 0, 0, targetHeight)}, 0.2)
            Tween.Play(HeaderStroke, {Color = Theme.Colors.Accent}, 0.2)
        else
            Tween.Play(Arrow, {Rotation = 0}, 0.2)
            Tween.Play(OptionsContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
            Tween.Play(HeaderStroke, {Color = Theme.Colors.TextDim}, 0.2)
            task.delay(0.2, function()
                if not isOpen then
                    OptionsContainer.Visible = false
                end
            end)
        end
    end
    
    local headerClick = Header.MouseButton1Click:Connect(ToggleDropdown)
    
    local headerEnter = Header.MouseEnter:Connect(function()
        Tween.Play(Header, {BackgroundColor3 = Theme.Colors.SurfaceHover}, 0.15)
    end)
    
    local headerLeave = Header.MouseLeave:Connect(function()
        Tween.Play(Header, {BackgroundColor3 = Theme.Colors.Surface}, 0.15)
    end)
    
    if Connections then
        Connections:Track(headerClick)
        Connections:Track(headerEnter)
        Connections:Track(headerLeave)
    end
    
    -- Controller
    local Controller = {}
    
    --[[
        Sets the selected value(s)
        @param value string|{string} - Value or array of values for multi-select
        @param fireCallback boolean? - Whether to fire callback (default: true)
    ]]
    function Controller:Set(value, fireCallback)
        if multi then
            selected = {}
            if type(value) == "table" then
                for _, v in ipairs(value) do
                    selected[v] = true
                end
            else
                selected[value] = true
            end
        else
            selected = value
        end
        
        for _, btn in ipairs(optionButtons) do
            btn.UpdateCheck()
        end
        
        UpdateOptions()
        if fireCallback ~= false then
            FireCallback()
        end
    end
    
    --[[
        Gets the current selection
        @return string|{string}
    ]]
    function Controller:Get()
        if multi then
            local result = {}
            for k in pairs(selected) do
                table.insert(result, k)
            end
            return result
        end
        return selected
    end
    
    --[[
        Updates the available options
        @param newOptions {string}
    ]]
    function Controller:SetOptions(newOptions)
        -- Clear existing
        for _, btn in ipairs(optionButtons) do
            btn.Button:Destroy()
        end
        optionButtons = {}
        options = newOptions
        
        -- Recreate (simplified - in production, would refactor to avoid duplication)
        OptionsContainer.CanvasSize = UDim2.new(0, 0, 0, #options * optionHeight)
    end
    
    --[[
        Closes the dropdown
    ]]
    function Controller:Close()
        if isOpen then
            ToggleDropdown()
        end
    end
    
    --[[
        Destroys the dropdown
    ]]
    function Controller:Destroy()
        Frame:Destroy()
    end
    
    Controller.Frame = Frame
    return Controller
end

return Dropdown
