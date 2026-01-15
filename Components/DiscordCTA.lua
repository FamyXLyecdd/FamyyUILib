--[[
    FAMYY PRIVATE - Discord CTA Component
    Discord invite button with clipboard copy
]]

local DiscordCTA = {}

--[[
    Creates a new Discord CTA button
    @param parent Instance - Parent container
    @param config table - Configuration options
        - InviteCode: string - Discord invite code (without discord.gg/)
        - Title: string - Button title (default: "JOIN DISCORD")
        - Subtitle: string - Button subtitle
        - Theme: table - Theme configuration
        - Tween: table - Tween utility
        - Connections: table - Connection manager
        - Notify: function - Notification function (optional)
    @return table - DiscordCTA controller
]]
function DiscordCTA.new(parent, config)
    local Theme = config.Theme
    local Tween = config.Tween
    local Connections = config.Connections
    local Notify = config.Notify
    
    local inviteCode = config.InviteCode or "discord"
    local title = config.Title or "JOIN DISCORD"
    local subtitle = config.Subtitle or "Get Scripts, Configs & Support"
    
    local originalTitle = title
    
    -- Main button
    local Btn = Instance.new("TextButton")
    Btn.Name = "DiscordCTA"
    Btn.Size = UDim2.new(1, 0, 0, Theme.Sizes.DiscordCTAHeight)
    Btn.BackgroundColor3 = Theme.Colors.Discord
    Btn.Text = ""
    Btn.AutoButtonColor = false
    Btn.Parent = parent
    
    Instance.new("UICorner", Btn).CornerRadius = Theme.Corners.Card
    
    -- Discord icon
    local Icon = Instance.new("ImageLabel")
    Icon.Size = UDim2.new(0, 32, 0, 32)
    Icon.Position = UDim2.new(0, 10, 0.5, -16)
    Icon.BackgroundTransparency = 1
    Icon.Image = "rbxassetid://16047585258"
    Icon.Parent = Btn
    
    -- Title
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -60, 0, 16)
    TitleLabel.Position = UDim2.new(0, 50, 0.5, -9)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.new(1, 1, 1)
    TitleLabel.Font = Theme.Fonts.Title
    TitleLabel.TextSize = Theme.TextSizes.Header
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = Btn
    
    -- Subtitle
    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Size = UDim2.new(1, -60, 0, 12)
    SubtitleLabel.Position = UDim2.new(0, 50, 0.5, 7)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Text = subtitle
    SubtitleLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
    SubtitleLabel.Font = Theme.Fonts.Header
    SubtitleLabel.TextSize = Theme.TextSizes.Small
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubtitleLabel.Parent = Btn
    
    -- Hover effect
    if Connections then
        Connections:Track(Btn.MouseEnter:Connect(function()
            Tween.Play(Btn, {BackgroundColor3 = Theme.Colors.DiscordHover}, 0.15)
        end))
        
        Connections:Track(Btn.MouseLeave:Connect(function()
            Tween.Play(Btn, {BackgroundColor3 = Theme.Colors.Discord}, 0.15)
        end))
    end
    
    -- Click handler
    local clicking = false
    if Connections then
        Connections:Track(Btn.MouseButton1Click:Connect(function()
            if clicking then return end
            clicking = true
            
            -- Copy to clipboard
            local success = pcall(function()
                if setclipboard then
                    setclipboard("https://discord.gg/" .. inviteCode)
                elseif toclipboard then
                    toclipboard("https://discord.gg/" .. inviteCode)
                end
            end)
            
            -- Visual feedback
            TitleLabel.Text = "LINK COPIED!"
            TitleLabel.TextColor3 = Theme.Colors.Success
            Tween.Play(Btn, {BackgroundColor3 = Theme.Colors.Card}, 0.15)
            
            -- Show notification if available
            if Notify then
                Notify("Discord", "Invite link copied to clipboard!", 2, "success")
            end
            
            -- Reset after delay
            task.delay(1.5, function()
                TitleLabel.Text = originalTitle
                TitleLabel.TextColor3 = Color3.new(1, 1, 1)
                Tween.Play(Btn, {BackgroundColor3 = Theme.Colors.Discord}, 0.15)
                clicking = false
            end)
        end))
    end
    
    -- Controller
    local Controller = {}
    
    --[[
        Updates the invite code
        @param code string
    ]]
    function Controller:SetInviteCode(code)
        inviteCode = code
    end
    
    --[[
        Updates the title
        @param newTitle string
    ]]
    function Controller:SetTitle(newTitle)
        title = newTitle
        originalTitle = newTitle
        TitleLabel.Text = newTitle
    end
    
    --[[
        Updates the subtitle
        @param newSubtitle string
    ]]
    function Controller:SetSubtitle(newSubtitle)
        SubtitleLabel.Text = newSubtitle
    end
    
    --[[
        Destroys the button
    ]]
    function Controller:Destroy()
        Btn:Destroy()
    end
    
    Controller.Frame = Btn
    return Controller
end

return DiscordCTA
