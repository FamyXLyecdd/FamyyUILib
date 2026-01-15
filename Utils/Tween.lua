--[[
    FAMYY PRIVATE - Tween Utilities
    Animation helper functions with consistent easing
]]

local TweenService = game:GetService("TweenService")

--// Types
export type TweenConfig = {
    Time: number?,
    EasingStyle: Enum.EasingStyle?,
    EasingDirection: Enum.EasingDirection?,
}

--// Module
local Tween = {}

-- Default tween configuration
Tween.Defaults = {
    Time = 0.3,
    EasingStyle = Enum.EasingStyle.Quart,
    EasingDirection = Enum.EasingDirection.Out,
}

--[[
    Creates and plays a tween animation
    @param object Instance - The object to animate
    @param properties table - Properties to animate
    @param time number? - Duration in seconds (default: 0.3)
    @param config TweenConfig? - Optional configuration overrides
    @return Tween - The created tween object
]]
function Tween.Play(object: Instance, properties: {[string]: any}, time: number?, config: TweenConfig?): Tween
    local cfg = config or {}
    local tweenInfo = TweenInfo.new(
        time or cfg.Time or Tween.Defaults.Time,
        cfg.EasingStyle or Tween.Defaults.EasingStyle,
        cfg.EasingDirection or Tween.Defaults.EasingDirection
    )
    
    local tween = TweenService:Create(object, tweenInfo, properties)
    tween:Play()
    return tween
end

--[[
    Creates a tween without playing it
    @param object Instance - The object to animate
    @param properties table - Properties to animate
    @param time number? - Duration in seconds
    @param config TweenConfig? - Optional configuration
    @return Tween
]]
function Tween.Create(object: Instance, properties: {[string]: any}, time: number?, config: TweenConfig?): Tween
    local cfg = config or {}
    local tweenInfo = TweenInfo.new(
        time or cfg.Time or Tween.Defaults.Time,
        cfg.EasingStyle or Tween.Defaults.EasingStyle,
        cfg.EasingDirection or Tween.Defaults.EasingDirection
    )
    
    return TweenService:Create(object, tweenInfo, properties)
end

--[[
    Quick fade in animation
    @param object GuiObject - The GUI object to fade
    @param time number? - Duration
]]
function Tween.FadeIn(object: GuiObject, time: number?)
    Tween.Play(object, {BackgroundTransparency = 0}, time or 0.2)
end

--[[
    Quick fade out animation
    @param object GuiObject - The GUI object to fade
    @param time number? - Duration
]]
function Tween.FadeOut(object: GuiObject, time: number?)
    Tween.Play(object, {BackgroundTransparency = 1}, time or 0.2)
end

--[[
    Slide animation from a direction
    @param object GuiObject - The GUI object to slide
    @param targetPosition UDim2 - Final position
    @param time number? - Duration
]]
function Tween.SlideTo(object: GuiObject, targetPosition: UDim2, time: number?)
    Tween.Play(object, {Position = targetPosition}, time or 0.3)
end

--[[
    Scale animation
    @param object GuiObject - The GUI object to scale
    @param targetSize UDim2 - Final size
    @param time number? - Duration
]]
function Tween.ScaleTo(object: GuiObject, targetSize: UDim2, time: number?)
    Tween.Play(object, {Size = targetSize}, time or 0.3)
end

return Tween
