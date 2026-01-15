--[[
    FAMYY PRIVATE - Divider Component
    Visual separator line
]]

local Divider = {}

--[[
    Creates a new divider component
    @param parent Instance - Parent container
    @param config table - Configuration options
        - Color: Color3 - Line color (optional)
        - Thickness: number - Line thickness
        - Padding: number - Vertical padding
        - Theme: table - Theme configuration
    @return table - Divider controller
]]
function Divider.new(parent, config)
    local Theme = config.Theme
    
    local color = config.Color or Theme.Colors.Surface
    local thickness = config.Thickness or Theme.Sizes.DividerHeight
    local padding = config.Padding or 8
    
    -- Container for padding
    local Container = Instance.new("Frame")
    Container.Name = "Divider"
    Container.Size = UDim2.new(1, 0, 0, thickness + (padding * 2))
    Container.BackgroundTransparency = 1
    Container.Parent = parent
    
    -- Actual line
    local Line = Instance.new("Frame")
    Line.Size = UDim2.new(1, 0, 0, thickness)
    Line.Position = UDim2.new(0, 0, 0.5, -thickness / 2)
    Line.BackgroundColor3 = color
    Line.BorderSizePixel = 0
    Line.Parent = Container
    
    -- Controller
    local Controller = {}
    
    --[[
        Sets the divider color
        @param newColor Color3
    ]]
    function Controller:SetColor(newColor)
        Line.BackgroundColor3 = newColor
    end
    
    --[[
        Destroys the divider
    ]]
    function Controller:Destroy()
        Container:Destroy()
    end
    
    Controller.Frame = Container
    return Controller
end

return Divider
