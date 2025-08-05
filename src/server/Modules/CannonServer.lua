-- Services
local ServerScriptService: ServerScriptService = game:GetService("ServerScriptService")
local Workspace: Workspace = game:GetService("Workspace")
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
local mainCannon = CannonClass.new(config.MainCannon)

-- Log
warn("Loaded CannonServer")

return {}