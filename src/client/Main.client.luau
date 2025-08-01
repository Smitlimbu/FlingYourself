-- StarterPlayerScripts
local StarterPlayerScripts: StarterPlayerScripts = script.Parent

-- Modules
local modules: Folder = StarterPlayerScripts:WaitForChild("Modules")

-- Require
require(modules:WaitForChild("CannonUI"))

-- Log
warn("All modules loaded successfully")