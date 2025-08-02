local Cannon = {}
Cannon.__index = Cannon

-- Constructure
function Cannon.new(config: {})
    local self = setmetatable({}, Cannon)

    self.model = config.model

    self.enterPrompt = self.model:WaitForChild("Barrel"):WaitForChild("EnterPrompt")

    -- Events
    self.enterPrompt.Triggered:Connect(function(player)
        print(player.Name .. " entered cannon!!")
    end)

    return self
end

return Cannon