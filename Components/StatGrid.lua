--[[
    FAMYY PRIVATE - StatGrid Component
    Real-time stats display grid (FPS, Ping, Time, Game)
]]

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local MarketplaceService = game:GetService("MarketplaceService")

local StatGrid = {}

--[[
    Creates a new stat grid component
    @param parent Instance - Parent container
    @param config table - Configuration options
        - ShowFPS: boolean - Show FPS stat (default: true)
        - ShowPing: boolean - Show Ping stat (default: true)
        - ShowTime: boolean - Show Playtime stat (default: true)
        - ShowGame: boolean - Show Game name stat (default: true)
        - Theme: table - Theme configuration
        - Tween: table - Tween utility
        - Connections: table - Connection manager
    @return table - StatGrid controller
]]
function StatGrid.new(parent, config)
    local Theme = config.Theme
    local Tween = config.Tween
    local Connections = config.Connections
    
    local showFPS = config.ShowFPS ~= false
    local showPing = config.ShowPing ~= false
    local showTime = config.ShowTime ~= false
    local showGame = config.ShowGame ~= false
    
    local startTime = os.time()
    local running = true
    
    -- Main frame
    local Frame = Instance.new("Frame")
    Frame.Name = "StatGrid"
    Frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.StatGridHeight)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent
    
    -- Grid layout
    local Grid = Instance.new("UIGridLayout", Frame)
    Grid.CellSize = UDim2.new(0.48, 0, 0, 50)
    Grid.CellPadding = UDim2.new(0, 8, 0, 8)
    Grid.SortOrder = Enum.SortOrder.LayoutOrder
    
    local valueLabels = {}
    
    -- Create a stat card
    local function CreateCard(label, layoutOrder)
        local Card = Instance.new("Frame")
        Card.BackgroundColor3 = Theme.Colors.Card
        Card.LayoutOrder = layoutOrder
        Card.Parent = Frame
        Instance.new("UICorner", Card).CornerRadius = Theme.Corners.Card
        
        -- Hover effect
        if Connections then
            Connections:Track(Card.MouseEnter:Connect(function()
                Tween.Play(Card, {BackgroundColor3 = Theme.Colors.CardHover}, 0.15)
            end))
            Connections:Track(Card.MouseLeave:Connect(function()
                Tween.Play(Card, {BackgroundColor3 = Theme.Colors.Card}, 0.15)
            end))
        end
        
        -- Label
        local Lbl = Instance.new("TextLabel")
        Lbl.Size = UDim2.new(1, 0, 0, 12)
        Lbl.Position = UDim2.new(0, 0, 0, 8)
        Lbl.BackgroundTransparency = 1
        Lbl.Text = label
        Lbl.TextColor3 = Theme.Colors.TextDim
        Lbl.Font = Theme.Fonts.Header
        Lbl.TextSize = Theme.TextSizes.Tiny
        Lbl.TextXAlignment = Enum.TextXAlignment.Center
        Lbl.Parent = Card
        
        -- Value
        local Val = Instance.new("TextLabel")
        Val.Size = UDim2.new(1, 0, 0, 20)
        Val.Position = UDim2.new(0, 0, 0.5, 2)
        Val.BackgroundTransparency = 1
        Val.Text = "..."
        Val.TextColor3 = Theme.Colors.Text
        Val.Font = Theme.Fonts.Header
        Val.TextSize = Theme.TextSizes.Header
        Val.TextScaled = true
        Val.TextXAlignment = Enum.TextXAlignment.Center
        Val.Parent = Card
        
        local Constraint = Instance.new("UITextSizeConstraint", Val)
        Constraint.MaxTextSize = 18
        Constraint.MinTextSize = 10
        
        return Val
    end
    
    -- Create cards based on config
    local order = 0
    if showFPS then
        order = order + 1
        valueLabels.FPS = CreateCard("FPS", order)
    end
    if showPing then
        order = order + 1
        valueLabels.Ping = CreateCard("PING", order)
    end
    if showTime then
        order = order + 1
        valueLabels.Time = CreateCard("TIME", order)
    end
    if showGame then
        order = order + 1
        valueLabels.Game = CreateCard("GAME", order)
    end
    
    -- Update FPS and Ping
    if (showFPS or showPing) and Connections then
        Connections:Track(RunService.RenderStepped:Connect(function(dt)
            if not running then return end
            
            if showFPS and valueLabels.FPS then
                local fps = math.floor(1 / dt)
                valueLabels.FPS.Text = tostring(fps)
                
                if fps >= 50 then
                    valueLabels.FPS.TextColor3 = Theme.Colors.Success
                elseif fps >= 30 then
                    valueLabels.FPS.TextColor3 = Theme.Colors.Warning
                else
                    valueLabels.FPS.TextColor3 = Theme.Colors.Error
                end
            end
            
            if showPing and valueLabels.Ping then
                local success, ping = pcall(function()
                    return math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
                end)
                
                if success then
                    valueLabels.Ping.Text = ping .. "ms"
                    
                    if ping < 100 then
                        valueLabels.Ping.TextColor3 = Theme.Colors.Success
                    elseif ping < 200 then
                        valueLabels.Ping.TextColor3 = Theme.Colors.Warning
                    else
                        valueLabels.Ping.TextColor3 = Theme.Colors.Error
                    end
                end
            end
        end))
    end
    
    -- Update time and load game name
    task.spawn(function()
        -- Get game name
        if showGame and valueLabels.Game then
            local success, info = pcall(function()
                return MarketplaceService:GetProductInfo(game.PlaceId)
            end)
            if success and info and info.Name then
                valueLabels.Game.Text = info.Name
            else
                valueLabels.Game.Text = "Unknown"
            end
        end
        
        -- Update time loop
        while running and Frame and Frame.Parent do
            if showTime and valueLabels.Time then
                local elapsed = os.time() - startTime
                local minutes = math.floor(elapsed / 60)
                local seconds = elapsed % 60
                valueLabels.Time.Text = string.format("%02d:%02d", minutes, seconds)
            end
            task.wait(1)
        end
    end)
    
    -- Controller
    local Controller = {}
    
    --[[
        Gets a stat value
        @param stat string - "FPS" | "Ping" | "Time" | "Game"
        @return string
    ]]
    function Controller:GetValue(stat)
        if valueLabels[stat] then
            return valueLabels[stat].Text
        end
        return nil
    end
    
    --[[
        Destroys the stat grid
    ]]
    function Controller:Destroy()
        running = false
        Frame:Destroy()
    end
    
    Controller.Frame = Frame
    return Controller
end

return StatGrid
