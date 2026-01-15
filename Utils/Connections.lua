--[[
    FAMYY PRIVATE - Connection Manager
    Tracks and manages RBXScriptConnections to prevent memory leaks
]]

--// Types
export type ConnectionManager = {
    Track: (self: ConnectionManager, connection: RBXScriptConnection) -> RBXScriptConnection,
    TrackMultiple: (self: ConnectionManager, connections: {RBXScriptConnection}) -> (),
    Disconnect: (self: ConnectionManager, connection: RBXScriptConnection) -> (),
    DisconnectAll: (self: ConnectionManager) -> (),
    GetCount: (self: ConnectionManager) -> number,
}

--// Module
local Connections = {}
Connections.__index = Connections

--[[
    Creates a new connection manager instance
    @return ConnectionManager
]]
function Connections.new(): ConnectionManager
    local self = setmetatable({}, Connections)
    self._connections = {} :: {RBXScriptConnection}
    return self
end

--[[
    Tracks a connection for later cleanup
    @param connection RBXScriptConnection - The connection to track
    @return RBXScriptConnection - The same connection (for chaining)
]]
function Connections:Track(connection: RBXScriptConnection): RBXScriptConnection
    if connection then
        table.insert(self._connections, connection)
    end
    return connection
end

--[[
    Tracks multiple connections at once
    @param connections {RBXScriptConnection} - Array of connections
]]
function Connections:TrackMultiple(connections: {RBXScriptConnection})
    for _, conn in ipairs(connections) do
        self:Track(conn)
    end
end

--[[
    Disconnects a specific connection and removes it from tracking
    @param connection RBXScriptConnection - The connection to disconnect
]]
function Connections:Disconnect(connection: RBXScriptConnection)
    for i, conn in ipairs(self._connections) do
        if conn == connection then
            if conn.Connected then
                conn:Disconnect()
            end
            table.remove(self._connections, i)
            break
        end
    end
end

--[[
    Disconnects all tracked connections and clears the list
]]
function Connections:DisconnectAll()
    for _, conn in ipairs(self._connections) do
        if conn and conn.Connected then
            conn:Disconnect()
        end
    end
    self._connections = {}
end

--[[
    Returns the number of tracked connections
    @return number
]]
function Connections:GetCount(): number
    return #self._connections
end

--[[
    Creates a scoped connection that auto-disconnects when the object is destroyed
    @param object Instance - The instance to watch
    @param connection RBXScriptConnection - The connection to auto-disconnect
    @return RBXScriptConnection
]]
function Connections:TrackScoped(object: Instance, connection: RBXScriptConnection): RBXScriptConnection
    self:Track(connection)
    
    local destroyConn
    destroyConn = object.Destroying:Connect(function()
        self:Disconnect(connection)
        if destroyConn then
            destroyConn:Disconnect()
        end
    end)
    self:Track(destroyConn)
    
    return connection
end

return Connections
