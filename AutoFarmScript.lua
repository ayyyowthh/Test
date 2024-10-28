-- GUI Elements
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local SaveButton = Instance.new("TextButton")
local TeleportButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame Setup
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame.Size = UDim2.new(0.2, 0, 0.3, 0)

-- Variables for storing position
local savedPosition = nil

-- Save Position Button
SaveButton.Parent = Frame
SaveButton.Text = "Save Position"
SaveButton.Size = UDim2.new(1, 0, 0.5, 0)
SaveButton.BackgroundColor3 = Color3.new(0.3, 0.8, 0.3)
SaveButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    if character and character:FindFirstChild("HumanoidRootPart") then
        savedPosition = character.HumanoidRootPart.CFrame
        print("Position saved!")
    else
        warn("Unable to save position.")
    end
end)

-- Teleport Button
TeleportButton.Parent = Frame
TeleportButton.Text = "Teleport to Saved Position"
TeleportButton.Position = UDim2.new(0, 0, 0.5, 0)
TeleportButton.Size = UDim2.new(1, 0, 0.5, 0)
TeleportButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.8)
TeleportButton.MouseButton1Click:Connect(function()
    if savedPosition then
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = savedPosition
            print("Teleported to saved position!")
        else
            warn("Character or HumanoidRootPart not found!")
        end
    else
        warn("No saved position to teleport to.")
    end
end)

-- Teleport Function (For manual calls or other uses)
function teleportToCoordinates(x, y, z)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z))
    else
        warn("Character or HumanoidRootPart not found!")
    end
end
