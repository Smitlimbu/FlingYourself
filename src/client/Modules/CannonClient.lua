-- Services
local Players: Players = game:GetService("Players")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProximityPromptService: ProximityPromptService = game:GetService("ProximityPromptService")

-- Player
local player: Player = Players.LocalPlayer

-- Folders
local remotes: Folder = ReplicatedStorage:WaitForChild("Remotes")

-- Remotes
local requestEnterCannon: RemoteEvent = remotes:WaitForChild("RequestEnterCannon")
local requestExitCannon: RemoteEvent  = remotes:WaitForChild("RequestExitCannon")

-- GUI elements
local playerGui: PlayerGui
local cannonGui: ScreenGui
local actions: Frame
local fling: TextButton
local exit: TextButton

-- Cannon
local enterPrompt: ProximityPrompt

-- Simple variables
local modelName: string

-- Functions
local function setupGui()
    playerGui = player:WaitForChild("PlayerGui")
    cannonGui = playerGui:WaitForChild("Cannon")
    actions = cannonGui:WaitForChild("Actions")
    fling = actions:WaitForChild("Fling")
    exit = actions:WaitForChild("Exit")
end

-- Function calls
setupGui()

-- Events

-- On respawn
player.CharacterAdded:Connect(function()
    setupGui()
end)

-- On cannon enter
ProximityPromptService.PromptTriggered:Connect(function(prompt, playerWhoTriggered)
    enterPrompt = prompt
    modelName = prompt.Parent.Parent.Name -- this is model

    cannonGui.Enabled = true
    enterPrompt.Enabled = false

    requestEnterCannon:FireServer(modelName)
end)

-- On cannon exit
exit.MouseButton1Click:Connect(function()
    cannonGui.Enabled = false
    enterPrompt.Enabled = true

    requestExitCannon:FireServer(modelName)
end)

-- Log
warn("Loaded CannonClient")

return {}