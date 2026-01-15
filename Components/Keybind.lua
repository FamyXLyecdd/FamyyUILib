--[[
    FAMYY PRIVATE - Keybind Component
    Interactive keybind picker
]]

local UserInputService = game:GetService("UserInputService")

local Keybind = {}

-- Blacklisted keys that shouldn't be bindable
local BLACKLIST = {
    [Enum.KeyCode.Unknown] = true,
    [Enum.KeyCode.W] = true,
    [Enum.KeyCode.A] = true,
    [Enum.KeyCode.S] = true,
    [Enum.KeyCode.D] = true,
    [Enum.KeyCode.Space] = true,
    [Enum.KeyCode.Escape] = true,
    [Enum.KeyCode.Tab] = true,
    [Enum.KeyCode.Backspace] = true,
    [Enum.KeyCode.Return] = true,
}

--[[
    Creates a new keybind component
    @param parent Instance - Parent container
    @param config table - Configuration options
        - Label: string - Keybind label text
        - Default: Enum.KeyCode - Default key
        - Callback: function - Called when keybind is pressed
        - ChangedCallback: function - Called when keybind is changed
        - Mode: string - "toggle" | "hold" (default: "toggle")
        - Theme: table - Theme configuration
        - Tween: table - Tween utility module
        - Connections: table - Connection manager
    @return table - Keybind controller
]]
function Keybind.new(parent, config)
    local Theme = config.Theme
    local Tween = config.Tween
    local Connections = config.Connections
    local Safety = config.Safety
    
    local label = config.Label or "Keybind"
    local key = config.Default or Enum.KeyCode.None
    local callback = config.Callback or function() end
    local changedCallback = config.ChangedCallback or function() end
    local mode = config.Mode or "toggle"
    
    local listening = false
    local state = false -- For toggle mode
    
    -- Main frame
    local Frame = Instance.new("Frame")
    Frame.Name = "Keybind_" .. label
    Frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.ToggleHeight)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent
    
    -- Label
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -80, 1, 0)
    Label.Position = UDim2.new(0, 0, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = label
    Label.TextColor3 = Theme.Colors.Text
    Label.Font = Theme.Fonts.Body
    Label.TextSize = Theme.TextSizes.Body
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame
    
    -- Key button
    local KeyBtn = Instance.new("TextButton")
    KeyBtn.Size = UDim2.new(0, 70, 0, 26)
    KeyBtn.Position = UDim2.new(1, -70, 0.5, -13)
    KeyBtn.BackgroundColor3 = Theme.Colors.Surface
    KeyBtn.Text = key.Name or "None"
    KeyBtn.TextColor3 = Theme.Colors.TextDim
    KeyBtn.Font = Theme.Fonts.Body
    KeyBtn.TextSize = Theme.TextSizes.Caption
    KeyBtn.AutoButtonColor = false
    KeyBtn.Parent = Frame
    
    Instance.new("UICorner", KeyBtn).CornerRadius = Theme.Corners.Button
    
    local KeyStroke = Instance.new("UIStroke", KeyBtn)
    KeyStroke.Color = Theme.Colors.TextDim
    KeyStroke.Thickness = Theme.Stroke.Default
    KeyStroke.Transparency = 0.5
    
    -- Safe callback execution
    local function FireCallback(isActive)
        if Safety then
            local success, err = Safety.Call(callback, isActive)
            if not success then
                warn("[FamyyPrivate] Keybind callback error:", err)
            end
        else
            local success, err = pcall(callback, isActive)
            if not success then
                warn("[FamyyPrivate] Keybind callback error:", err)
            end
        end
    end
    
    local function FireChangedCallback(newKey)
        if Safety then
            local success, err = Safety.Call(changedCallback, newKey)
            if not success then
                warn("[FamyyPrivate] Keybind changed callback error:", err)
            end
        else
            local success, err = pcall(changedCallback, newKey)
            if not success then
                warn("[FamyyPrivate] Keybind changed callback error:", err)
            end
        end
    end
    
    -- Start listening for new key
    local function StartListening()
        listening = true
        KeyBtn.Text = "..."
        Tween.Play(KeyBtn, {BackgroundColor3 = Theme.Colors.Accent}, 0.15)
        Tween.Play(KeyStroke, {Color = Theme.Colors.Accent, Transparency = 0}, 0.15)
        Tween.Play(KeyBtn, {TextColor3 = Theme.Colors.Text}, 0.15)
    end
    
    local function StopListening(newKey)
        listening = false
        if newKey then
            key = newKey
            KeyBtn.Text = key.Name
            FireChangedCallback(key)
        else
            KeyBtn.Text = key.Name or "None"
        end
        Tween.Play(KeyBtn, {BackgroundColor3 = Theme.Colors.Surface}, 0.15)
        Tween.Play(KeyStroke, {Color = Theme.Colors.TextDim, Transparency = 0.5}, 0.15)
        Tween.Play(KeyBtn, {TextColor3 = Theme.Colors.TextDim}, 0.15)
    end
    
    -- Click to change keybind
    local clickConn = KeyBtn.MouseButton1Click:Connect(function()
        if listening then
            StopListening(nil)
        else
            StartListening()
        end
    end)
    
    -- Input handler
    local inputBeganConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if listening then
            -- Capture new keybind
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if input.KeyCode == Enum.KeyCode.Escape then
                    -- Cancel
                    StopListening(nil)
                elseif not BLACKLIST[input.KeyCode] then
                    StopListening(input.KeyCode)
                end
            elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                -- Ignore - this is the click to start listening
            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                -- Right click to clear
                key = Enum.KeyCode.None
                StopListening(Enum.KeyCode.None)
            end
            return
        end
        
        -- Normal keybind activation
        if gameProcessed then return end
        
        if input.KeyCode == key then
            if mode == "toggle" then
                state = not state
                FireCallback(state)
            else -- hold mode
                state = true
                FireCallback(true)
            end
        end
    end)
    
    local inputEndedConn
    if mode == "hold" then
        inputEndedConn = UserInputService.InputEnded:Connect(function(input)
            if input.KeyCode == key and state then
                state = false
                FireCallback(false)
            end
        end)
    end
    
    if Connections then
        Connections:Track(clickConn)
        Connections:Track(inputBeganConn)
        if inputEndedConn then
            Connections:Track(inputEndedConn)
        end
    end
    
    -- Hover effect
    local enterConn = KeyBtn.MouseEnter:Connect(function()
        if not listening then
            Tween.Play(KeyBtn, {BackgroundColor3 = Theme.Colors.SurfaceHover}, 0.15)
            Tween.Play(KeyStroke, {Transparency = 0.2}, 0.15)
        end
    end)
    
    local leaveConn = KeyBtn.MouseLeave:Connect(function()
        if not listening then
            Tween.Play(KeyBtn, {BackgroundColor3 = Theme.Colors.Surface}, 0.15)
            Tween.Play(KeyStroke, {Transparency = 0.5}, 0.15)
        end
    end)
    
    if Connections then
        Connections:Track(enterConn)
        Connections:Track(leaveConn)
    end
    
    -- Controller
    local Controller = {}
    
    --[[
        Sets the keybind
        @param newKey Enum.KeyCode
        @param fireCallback boolean? - Whether to fire changed callback (default: true)
    ]]
    function Controller:Set(newKey, fireCallback)
        key = newKey
        KeyBtn.Text = key.Name or "None"
        if fireCallback ~= false then
            FireChangedCallback(key)
        end
    end
    
    --[[
        Gets the current keybind
        @return Enum.KeyCode
    ]]
    function Controller:Get()
        return key
    end
    
    --[[
        Gets the current state (for toggle mode)
        @return boolean
    ]]
    function Controller:GetState()
        return state
    end
    
    --[[
        Sets the state (for toggle mode)
        @param newState boolean
        @param fireCallback boolean?
    ]]
    function Controller:SetState(newState, fireCallback)
        state = newState
        if fireCallback ~= false then
            FireCallback(state)
        end
    end
    
    --[[
        Destroys the keybind
    ]]
    function Controller:Destroy()
        Frame:Destroy()
    end
    
    Controller.Frame = Frame
    return Controller
end

return Keybind
