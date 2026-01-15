--[[
    FAMYY PRIVATE - Safety Utilities
    Error handling and safe execution wrappers
]]

--// Module
local Safety = {}

--[[
    Safely executes a callback with error handling
    @param callback function - The function to execute
    @param ... any - Arguments to pass to the callback
    @return boolean, any - Success status and result/error
]]
function Safety.Call(callback: (...any) -> ...any, ...: any): (boolean, any)
    if type(callback) ~= "function" then
        return false, "Expected function, got " .. type(callback)
    end
    return pcall(callback, ...)
end

--[[
    Safely executes a callback, ignoring errors
    @param callback function - The function to execute
    @param ... any - Arguments to pass
    @return any - The result or nil if failed
]]
function Safety.Try(callback: (...any) -> ...any, ...: any): any
    local success, result = pcall(callback, ...)
    if success then
        return result
    end
    return nil
end

--[[
    Wraps a callback in error protection
    @param callback function - The callback to wrap
    @param errorHandler function? - Optional error handler
    @return function - The wrapped function
]]
function Safety.Wrap(callback: (...any) -> ...any, errorHandler: ((string) -> ())?): (...any) -> ...any
    return function(...)
        local success, result = pcall(callback, ...)
        if not success then
            if errorHandler then
                errorHandler(tostring(result))
            else
                warn("[FamyyPrivate] Callback error:", result)
            end
        end
        return result
    end
end

--[[
    Validates a value against an expected type
    @param value any - The value to validate
    @param expectedType string - The expected type
    @param default any - Default value if validation fails
    @return any - The value or default
]]
function Safety.ValidateType(value: any, expectedType: string, default: any): any
    if type(value) == expectedType then
        return value
    end
    return default
end

--[[
    Validates a number is within a range
    @param value number - The value to validate
    @param min number - Minimum value
    @param max number - Maximum value
    @param default number - Default if invalid
    @return number
]]
function Safety.ValidateRange(value: any, min: number, max: number, default: number): number
    if type(value) == "number" then
        return math.clamp(value, min, max)
    end
    return default
end

--[[
    Safely gets a service
    @param serviceName string - Name of the service
    @return Instance? - The service or nil
]]
function Safety.GetService(serviceName: string): Instance?
    local success, service = pcall(function()
        return game:GetService(serviceName)
    end)
    return success and service or nil
end

--[[
    Checks if running in an exploit environment
    @return boolean, string - Is exploit, environment name
]]
function Safety.GetEnvironment(): (boolean, string)
    -- Check for common exploit globals
    if identifyexecutor then
        local success, name = pcall(identifyexecutor)
        if success then
            return true, name or "Unknown"
        end
    end
    
    -- Check for common exploit functions
    local exploitFunctions = {"getgenv", "getrenv", "getgc", "hookfunction", "newcclosure"}
    for _, funcName in ipairs(exploitFunctions) do
        if getfenv()[funcName] or _G[funcName] then
            return true, "Generic Exploit"
        end
    end
    
    return false, "Studio/Client"
end

--[[
    Gets the appropriate GUI parent based on environment
    @return Instance - The GUI parent
]]
function Safety.GetGuiParent(): Instance
    -- Try exploit-specific GUI containers first
    if gethui then
        local success, result = pcall(gethui)
        if success and result then
            return result
        end
    end
    
    -- Fallback to CoreGui
    local CoreGui = Safety.GetService("CoreGui")
    if CoreGui then
        return CoreGui
    end
    
    -- Last resort: PlayerGui
    local Players = Safety.GetService("Players")
    if Players and Players.LocalPlayer then
        return Players.LocalPlayer:WaitForChild("PlayerGui")
    end
    
    error("[FamyyPrivate] Could not find suitable GUI parent")
end

return Safety
