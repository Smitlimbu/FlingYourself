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
local isInCannon: boolean = false

-- Functions
local function enterCannon(prompt: ProximityPrompt)
    enterPrompt = prompt
    modelName = prompt.Parent.Parent.Name -- this is model name

    cannonGui.Enabled = true
    enterPrompt.Enabled = false
    isInCannon = true

    requestEnterCannon:FireServer(modelName)
end

local function exitCannon()
    cannonGui.Enabled = false
    enterPrompt.Enabled = true
    isInCannon = false

    requestExitCannon:FireServer(modelName)
end

local function setupGui()
    playerGui = player:WaitForChild("PlayerGui")
    cannonGui = playerGui:WaitForChild("Cannon")
    exit = cannonGui:WaitForChild("Exit")

    -- Connect exit event even reconnects when respawn cuz of player.CharacterAdded
    exit.MouseButton1Click:Connect(exitCannon)
end

local function setupDeathListener()
    local character: Model = player.Character or player.CharacterAdded:Wait()
    local humanoid: Humanoid = character:WaitForChild("Humanoid")

    -- when player dies we just exit the cannon
    humanoid.Died:Connect(function()
        if isInCannon then
            exitCannon()
        end
    end)
end

-- Function calls
setupGui()
setupDeathListener()

-- Events
player.CharacterAdded:Connect(function()
    setupGui()
    setupDeathListener()
end)

ProximityPromptService.PromptTriggered:Connect(enterCannon)

-- Log
warn("Loaded CannonClient")

return {}