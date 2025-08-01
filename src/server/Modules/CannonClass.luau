local Cannon = {}
Cannon.__index = Cannon

function Cannon.new(config: {})
    local self = setmetatable({}, Cannon)

    self.model = config.model

    return self
end

return Cannon