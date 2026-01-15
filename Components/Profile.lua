--[[
    FAMYY PRIVATE - Profile Component
    User profile card with avatar and welcome message
]]

local Players = game:GetService("Players")

local Profile = {}

--[[
    Creates a new profile component
    @param parent Instance - Parent container
    @param config table - Configuration options
        - UserId: number - Player user ID
        - ShowDisplayName: boolean - Show display name (default: true)
        - Theme: table - Theme configuration
        - Connections: table - Connection manager
    @return table - Profile controller
]]
function Profile.new(parent, config)
    local Theme = config.Theme
    local Connections = config.Connections
    
    local userId = config.UserId or Players.LocalPlayer.UserId
    local showDisplayName = config.ShowDisplayName ~= false
    
    -- Main frame
    local Frame = Instance.new("Frame")
    Frame.Name = "Profile"
    Frame.Size = UDim2.new(1, 0, 0, Theme.Sizes.ProfileHeight)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent
    
    -- Profile picture
    local PFP = Instance.new("ImageLabel")
    PFP.Size = UDim2.new(0, 50, 0, 50)
    PFP.Position = UDim2.new(0, 0, 0.5, -25)
    PFP.BackgroundColor3 = Theme.Colors.Card
    PFP.Parent = Frame
    Instance.new("UICorner", PFP).CornerRadius = UDim.new(1, 0)
    
    -- Load avatar async
    task.spawn(function()
        local success, image = pcall(function()
            return Players:GetUserThumbnailAsync(
                userId,
                Enum.ThumbnailType.HeadShot,
                Enum.ThumbnailSize.Size100x100
            )
        end)
        if success and image then
            PFP.Image = image
        end
    end)
    
    -- Get player name
    local playerName = "Player"
    local displayName = nil
    
    local player = Players:GetPlayerByUserId(userId)
    if player then
        playerName = player.Name
        displayName = player.DisplayName
    else
        -- Try to get name from web (for non-local players)
        task.spawn(function()
            local success, name = pcall(function()
                return Players:GetNameFromUserIdAsync(userId)
            end)
            if success and name then
                playerName = name
                TextBox.Text = "Welcome, <font color=\"rgb(255,255,255)\"><b>" .. playerName .. "</b></font>"
            end
        end)
    end
    
    -- Welcome text
    local TextBox = Instance.new("TextLabel")
    TextBox.Size = UDim2.new(1, -65, 0, 40)
    TextBox.Position = UDim2.new(0, 65, 0.5, -20)
    TextBox.BackgroundTransparency = 1
    TextBox.RichText = true
    TextBox.TextColor3 = Theme.Colors.TextDim
    TextBox.Font = Theme.Fonts.Body
    TextBox.TextSize = 16
    TextBox.TextScaled = true
    TextBox.TextXAlignment = Enum.TextXAlignment.Left
    TextBox.Parent = Frame
    
    local Constraint = Instance.new("UITextSizeConstraint", TextBox)
    Constraint.MaxTextSize = 18
    Constraint.MinTextSize = 10
    
    -- Set text
    local nameToShow = showDisplayName and displayName or playerName
    if not nameToShow or nameToShow == "" then
        nameToShow = playerName
    end
    TextBox.Text = "Welcome, <font color=\"rgb(255,255,255)\"><b>" .. nameToShow .. "</b></font>"
    
    -- Controller
    local Controller = {}
    
    --[[
        Updates the welcome message
        @param message string
    ]]
    function Controller:SetMessage(message)
        TextBox.Text = message
    end
    
    --[[
        Destroys the profile
    ]]
    function Controller:Destroy()
        Frame:Destroy()
    end
    
    Controller.Frame = Frame
    return Controller
end

return Profile
