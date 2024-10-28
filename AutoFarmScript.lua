-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local TabContainer = Instance.new("Frame")
local ButtonNames = {"Player", "Misc", "Teleports", "Shop", "Aimlock"}
local Tabs = {}

-- Player GUI Setup
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame Setup
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
MainFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
MainFrame.Active = true
MainFrame.Draggable = true

-- Close Button Setup
CloseButton.Parent = MainFrame
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0.05, 0, 0.05, 0)
CloseButton.Position = UDim2.new(0.95, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- Close the GUI when X is clicked
end)

-- Tab Container Setup
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TabContainer.Size = UDim2.new(0.2, 0, 1, 0)
TabContainer.Position = UDim2.new(0, 0, 0, 0)

-- Create Tabs
for i, buttonName in ipairs(ButtonNames) do
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = TabContainer
    TabButton.Text = buttonName
    TabButton.Size = UDim2.new(1, 0, 0.2, 0)
    TabButton.Position = UDim2.new(0, 0, (i - 1) * 0.2, 0)
    TabButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    TabButton.BorderSizePixel = 0
    TabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(Tabs) do
            tab.Visible = false -- Hide all tabs
        end
        Tabs[buttonName].Visible = true -- Show the selected tab
    end)

    -- Create tab content
    local TabContent = Instance.new("Frame")
    TabContent.Parent = MainFrame
    TabContent.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    TabContent.Size = UDim2.new(0.8, 0, 1, 0)
    TabContent.Position = UDim2.new(0.2, 0, 0, 0)
    TabContent.Visible = false -- Initially hidden
    Tabs[buttonName] = TabContent

    -- Add content to the tab (example)
    local Label = Instance.new("TextLabel")
    Label.Parent = TabContent
    Label.Text = buttonName .. " Content"
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.new(1, 1, 1)
end

-- Default to show the first tab
Tabs[ButtonNames[1]].Visible = true
