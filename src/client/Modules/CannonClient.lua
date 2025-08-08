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
local exit: TextButton

-- Cannon
local enterPrompt: ProximityPrompt

-- Simple variables
local modelName: string

-- Functions
local function enterCannon(prompt: ProximityPrompt)
    enterPrompt = prompt
    modelName = prompt.Parent.Parent.Name -- this is model name

    cannonGui.Enabled = true
    enterPrompt.Enabled = false

    requestEnterCannon:FireServer(modelName)
end

local function exitCannon()
    cannonGui.Enabled = false
    enterPrompt.Enabled = true

    requestExitCannon:FireServer(modelName)
end

local function setupGui()
    playerGui = player:WaitForChild("PlayerGui")
    cannonGui = playerGui:WaitForChild("Cannon")
    exit = cannonGui:WaitForChild("Exit")

    -- Connect exit event even reconnects when respawn cuz of player.CharacterAdded
    exit.MouseButton1Click:Connect(exitCannon)
end

-- Function calls
setupGui()

-- Events
player.CharacterAdded:Connect(setupGui)

ProximityPromptService.PromptTriggered:Connect(enterCannon)

-- Log
warn("Loaded CannonClient")

return {}