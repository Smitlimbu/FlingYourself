-- Services
local ServerScriptService: ServerScriptService = game:GetService("ServerScriptService")
local Workspace: Workspace = game:GetService("Workspace")

-- Folders
local modules: Folder = ServerScriptService:WaitForChild("Modules")

-- Classes
local CannonClass: ModuleScript = require(modules:WaitForChild("CannonClass"))

-- Instances
local mainCannon = CannonClass.new(
    {
        model = Workspace:WaitForChild("MainCannon")
    }
)

-- Log
warn("Loaded CannonFactory")

return {}