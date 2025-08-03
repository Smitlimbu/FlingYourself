local Cannon = {}
Cannon.__index = Cannon

-- Services
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Constructure
function Cannon.new(config: {})
    local self = setmetatable({}, Cannon)

    self.model = config.model

    self.enterPrompt = self.model:WaitForChild("Barrel"):WaitForChild("EnterPrompt")

    -- Folders
    local remotes: Folder = ReplicatedStorage:WaitForChild("Remotes")

    -- Remotes
    local cannonEntered: RemoteEvent = remotes:WaitForChild("CannonEntered")

    -- Events
    self.enterPrompt.Triggered:Connect(function(player)
        cannonEntered:FireClient(player, self.model.Name)
    end)

    return self
end

return Cannon