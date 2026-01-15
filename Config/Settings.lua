--[[
    FAMYY PRIVATE - Settings Persistence
    Save/Load configuration using exploit file system
]]

local HttpService = game:GetService("HttpService")

local Settings = {}
Settings.__index = Settings

-- Default settings structure
Settings.Defaults = {
    UIKeybind = "RightShift",
    UIVisible = true,
    UIPosition = {X = 0.05, Y = 0.5},
    Theme = "Default",
    Notifications = true,
    NotificationDuration = 3,
    SavedConfigs = {},
}

-- File paths
local SAVE_FOLDER = "FamyyPrivate"
local SETTINGS_FILE = "FamyyPrivate/settings.json"

--[[
    Creates a new settings manager instance
    @param configName string? - Optional config name for game-specific settings
    @return SettingsManager
]]
function Settings.new(configName)
    local self = setmetatable({}, Settings)
    self.configName = configName or "global"
    self.data = {}
    self.callbacks = {}
    
    -- Copy defaults
    for key, value in pairs(Settings.Defaults) do
        if type(value) == "table" then
            self.data[key] = {}
            for k, v in pairs(value) do
                self.data[key][k] = v
            end
        else
            self.data[key] = value
        end
    end
    
    return self
end

--[[
    Checks if file system functions are available
    @return boolean
]]
function Settings.HasFileSystem()
    return writefile ~= nil and readfile ~= nil and isfile ~= nil and makefolder ~= nil
end

--[[
    Ensures the save folder exists
]]
function Settings:EnsureFolder()
    if not Settings.HasFileSystem() then return false end
    
    if not isfolder(SAVE_FOLDER) then
        makefolder(SAVE_FOLDER)
    end
    return true
end

--[[
    Saves current settings to file
    @return boolean - Success status
]]
function Settings:Save()
    if not Settings.HasFileSystem() then
        warn("[FamyyPrivate] File system not available, settings not saved")
        return false
    end
    
    self:EnsureFolder()
    
    local success, encoded = pcall(function()
        return HttpService:JSONEncode(self.data)
    end)
    
    if not success then
        warn("[FamyyPrivate] Failed to encode settings:", encoded)
        return false
    end
    
    local writeSuccess, writeError = pcall(function()
        writefile(SETTINGS_FILE, encoded)
    end)
    
    if not writeSuccess then
        warn("[FamyyPrivate] Failed to write settings:", writeError)
        return false
    end
    
    return true
end

--[[
    Loads settings from file
    @return boolean - Success status
]]
function Settings:Load()
    if not Settings.HasFileSystem() then
        return false
    end
    
    if not isfile(SETTINGS_FILE) then
        return false
    end
    
    local readSuccess, content = pcall(function()
        return readfile(SETTINGS_FILE)
    end)
    
    if not readSuccess then
        warn("[FamyyPrivate] Failed to read settings:", content)
        return false
    end
    
    local decodeSuccess, decoded = pcall(function()
        return HttpService:JSONDecode(content)
    end)
    
    if not decodeSuccess then
        warn("[FamyyPrivate] Failed to decode settings:", decoded)
        return false
    end
    
    -- Merge loaded data with defaults (keeps new defaults if added)
    for key, value in pairs(decoded) do
        if self.data[key] ~= nil then
            self.data[key] = value
        end
    end
    
    return true
end

--[[
    Gets a setting value
    @param key string - The setting key
    @param default any? - Default value if not found
    @return any
]]
function Settings:Get(key, default)
    if self.data[key] ~= nil then
        return self.data[key]
    end
    return default
end

--[[
    Sets a setting value
    @param key string - The setting key
    @param value any - The value to set
    @param autoSave boolean? - Auto-save after setting (default: true)
]]
function Settings:Set(key, value, autoSave)
    self.data[key] = value
    
    -- Fire callbacks
    if self.callbacks[key] then
        for _, callback in ipairs(self.callbacks[key]) do
            task.spawn(callback, value)
        end
    end
    
    if autoSave ~= false then
        self:Save()
    end
end

--[[
    Registers a callback for when a setting changes
    @param key string - The setting key to watch
    @param callback function - Function to call with new value
]]
function Settings:OnChange(key, callback)
    if not self.callbacks[key] then
        self.callbacks[key] = {}
    end
    table.insert(self.callbacks[key], callback)
end

--[[
    Saves a named configuration (for game-specific configs)
    @param name string - Config name
    @param config table - Config data
]]
function Settings:SaveConfig(name, config)
    local configs = self:Get("SavedConfigs", {})
    configs[name] = {
        timestamp = os.time(),
        data = config,
    }
    self:Set("SavedConfigs", configs)
end

--[[
    Loads a named configuration
    @param name string - Config name
    @return table? - The config data or nil
]]
function Settings:LoadConfig(name)
    local configs = self:Get("SavedConfigs", {})
    if configs[name] then
        return configs[name].data
    end
    return nil
end

--[[
    Lists all saved configurations
    @return {string} - Array of config names
]]
function Settings:ListConfigs()
    local configs = self:Get("SavedConfigs", {})
    local names = {}
    for name in pairs(configs) do
        table.insert(names, name)
    end
    return names
end

--[[
    Deletes a named configuration
    @param name string - Config name
]]
function Settings:DeleteConfig(name)
    local configs = self:Get("SavedConfigs", {})
    configs[name] = nil
    self:Set("SavedConfigs", configs)
end

--[[
    Resets all settings to defaults
]]
function Settings:Reset()
    for key, value in pairs(Settings.Defaults) do
        if type(value) == "table" then
            self.data[key] = {}
            for k, v in pairs(value) do
                self.data[key][k] = v
            end
        else
            self.data[key] = value
        end
    end
    self:Save()
end

return Settings
