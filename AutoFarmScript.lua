-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local TabContainer = Instance.new("Frame")
local Tabs = {}
local TabButtons = {}

-- Tab Names
local tabNames = {"Teleports", "Aimlock", "Player", "Shop", "Misc"}

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

-- Tab Container Setup
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TabContainer.Size = UDim2.new(0.2, 0, 1, 0)
TabContainer.Position = UDim2.new(0, 0, 0, 0)

-- Create Tabs and Buttons
for _, tabName in ipairs(tabNames) do
    -- Create Tab Button
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = TabContainer
    TabButton.Text = tabName
    TabButton.Size = UDim2.new(1, 0, 0.2, 0)
    TabButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    TabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(Tabs) do
            tab.Visible = false -- Hide all tabs
        end
        Tabs[tabName].Visible = true -- Show selected tab
    end)
    TabButtons[tabName] = TabButton -- Store the tab button reference

    -- Create Tab Frame
    local TabFrame = Instance.new("Frame")
    TabFrame.Parent = MainFrame
    TabFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    TabFrame.Size = UDim2.new(0.8, 0, 1, 0)
    TabFrame.Position = UDim2.new(0.2, 0, 0, 0)
    TabFrame.Visible = false -- Start with all tabs hidden
    Tabs[tabName] = TabFrame -- Store the tab frame reference

    -- Add a button to each tab (example)
    local ExampleButton = Instance.new("TextButton")
    ExampleButton.Parent = TabFrame
    ExampleButton.Text = "Action for " .. tabName
    ExampleButton.Size = UDim2.new(0.5, 0, 0.1, 0)
    ExampleButton.Position = UDim2.new(0.25, 0, 0.1, 0)
    ExampleButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    ExampleButton.MouseButton1Click:Connect(function()
        print(tabName .. " action executed") -- Placeholder for actual functionality
    end)
end

-- Set the first tab to be visible
Tabs["Misc"].Visible = true
