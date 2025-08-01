-- Services
local ServerScriptService: ServerScriptService = game:GetService("ServerScriptService")

-- Folders
local modules: Folder = ServerScriptService:WaitForChild("Modules")

-- Require
require(modules:WaitForChild("CannonFactory"))

-- Log
warn("All modules loaded successfully")