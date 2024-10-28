-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local ButtonContainer = Instance.new("Frame")
local ButtonNames = {"Player", "Misc", "Teleports", "Shop", "Aimlock"}

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame Setup
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Active = true
MainFrame.Draggable = true

-- Close Button Setup
CloseButton.Parent = MainFrame
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0.05, 0, 0.05, 0)
CloseButton.Position = UDim2.new(0.95, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- Close the GUI when X is clicked
end)

-- Button Container Setup
ButtonContainer.Parent = MainFrame
ButtonContainer.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ButtonContainer.Size = UDim2.new(1, 0, 1, 0)

-- Create Buttons
for i, buttonName in ipairs(ButtonNames) do
    local Button = Instance.new("TextButton")
    Button.Parent = ButtonContainer
    Button.Text = buttonName
    Button.Size = UDim2.new(1, 0, 0.2, 0)
    Button.Position = UDim2.new(0, 0, (i - 1) * 0.2, 0) -- Position buttons vertically
    Button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    
    -- Placeholder for button functionality
    Button.MouseButton1Click:Connect(function()
        print(buttonName .. " button clicked") -- You can replace this with your own functionality
    end)
end
