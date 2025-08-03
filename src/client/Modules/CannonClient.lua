-- Services
local Players = game:GetService("Players")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace: Workspace = game:GetService("Workspace")

-- Folders
local remotes: Folder = ReplicatedStorage:WaitForChild("Remotes")

-- Remotes
local cannonEntered: RemoteEvent = remotes:WaitForChild("CannonEntered")

-- Cannon
local cannon: Model
local enterPrompt: ProximityPrompt

-- On cannon entered
cannonEntered.OnClientEvent:Connect(function(cannonName: string)
    print(Players.LocalPlayer.Name .. " entered cannon!")

    cannon = Workspace:WaitForChild(cannonName)
    enterPrompt = cannon:WaitForChild("Barrel"):WaitForChild("EnterPrompt")

    enterPrompt.Enabled = false
end)

-- Log
warn("Loaded CannonClient")

return {}