-- StarterPlayerScripts
local StarterPlayerScripts: StarterPlayerScripts = script.Parent

-- Modules
local modules: Folder = StarterPlayerScripts:WaitForChild("Modules")

-- Require
require(modules:WaitForChild("CannonClient"))

-- Log
warn("All modules loaded successfully")