--[[
    FAMYY PRIVATE - Label Component
    Simple text label with optional styling
]]

local Label = {}

--[[
    Creates a new label component
    @param parent Instance - Parent container
    @param config table - Configuration options
        - Text: string - Label text
        - Color: Color3 - Text color (optional)
        - Size: string - "small" | "normal" | "large"
        - Bold: boolean - Use bold font
        - RichText: boolean - Enable rich text
        - Theme: table - Theme configuration
    @return table - Label controller
]]
function Label.new(parent, config)
    local Theme = config.Theme
    
    local text = config.Text or "Label"
    local color = config.Color or Theme.Colors.Text
    local size = config.Size or "normal"
    local bold = config.Bold or false
    local richText = config.RichText or false
    
    -- Size mapping
    local textSizes = {
        small = Theme.TextSizes.Small,
        normal = Theme.TextSizes.Body,
        large = Theme.TextSizes.Header,
    }
    
    local heights = {
        small = 16,
        normal = Theme.Sizes.LabelHeight,
        large = 24,
    }
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "Label"
    TextLabel.Size = UDim2.new(1, 0, 0, heights[size] or heights.normal)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = text
    TextLabel.TextColor3 = color
    TextLabel.Font = bold and Theme.Fonts.Header or Theme.Fonts.Caption
    TextLabel.TextSize = textSizes[size] or textSizes.normal
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.RichText = richText
    TextLabel.Parent = parent
    
    -- Controller
    local Controller = {}
    
    --[[
        Sets the label text
        @param newText string
    ]]
    function Controller:SetText(newText)
        TextLabel.Text = newText
    end
    
    --[[
        Sets the label color
        @param newColor Color3
    ]]
    function Controller:SetColor(newColor)
        TextLabel.TextColor3 = newColor
    end
    
    --[[
        Gets the label text
        @return string
    ]]
    function Controller:GetText()
        return TextLabel.Text
    end
    
    --[[
        Destroys the label
    ]]
    function Controller:Destroy()
        TextLabel:Destroy()
    end
    
    Controller.Frame = TextLabel
    return Controller
end

return Label
