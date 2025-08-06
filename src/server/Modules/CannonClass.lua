local Cannon = {}
Cannon.__index = Cannon

-- Services
local Workspace: Workspace = game:GetService("Workspace")

-- Constructure
function Cannon.new(config: {})
    local self = setmetatable({}, Cannon)

    -- Configs
    self.modelName = config.modelName

    self.model = Workspace:WaitForChild(self.modelName)
    self.playersInside = {}

    return self
end

-- Class methods
function Cannon:addPlayer(player: Player)
    self.playersInside[player] = true

    print(self.playersInside) -- just a log haha
    print(player.Name .. " added to cannon")
end

function Cannon:removePlayer(player: Player)
    self.playersInside[player] = nil

    print(self.playersInside)
    print(player.Name .. " removed from cannon")
end

return Cannon