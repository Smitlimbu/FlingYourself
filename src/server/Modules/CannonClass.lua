local Cannon = {}
Cannon.__index = Cannon

-- Services
local Workspace: Workspace = game:GetService("Workspace")

-- Constructure
function Cannon.new(config: {})
    local self = setmetatable({}, Cannon)

    self.model = Workspace:WaitForChild(config.modelName)
    self.playersInside = {}

    return self
end

-- Class methods
function Cannon:addPlayer(player: Player)
    self.playersInside[player] = true
end

function Cannon:removePlayer(player: Player)
    self.playersInside[player] = nil
end

return Cannon