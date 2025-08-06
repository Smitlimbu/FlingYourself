-- Services
local ServerScriptService: ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Folders
local modules: Folder = ServerScriptService:WaitForChild("Modules")
local remotes: Folder = ReplicatedStorage:WaitForChild("Remotes")

-- Modules
local config: ModuleScript = require(modules:WaitForChild("CannonConfigs"))
local CannonClass: ModuleScript = require(modules:WaitForChild("CannonClass"))

-- Remotes
local requestEnterCannon: RemoteEvent = remotes:WaitForChild("RequestEnterCannon")
local requestExitCannon: RemoteEvent  = remotes:WaitForChild("RequestExitCannon")

-- Instances
local cannons = {
    ["MainCannon"] = CannonClass.new(config.MainCannon)
}

-- Events
requestEnterCannon.OnServerEvent:Connect(function(player, modelName)
    local cannon = cannons[modelName]

    if cannon then
        cannon:addPlayer(player)

    else
        warn(modelName .. " not found!")
    end
end)

requestExitCannon.OnServerEvent:Connect(function(player, modelName)
    local cannon = cannons[modelName]

    if cannon then
        cannon:removePlayer(player)

    else
        warn(modelName .. " not found!")
    end
end)

-- Log
warn("Loaded CannonServer")

return {}