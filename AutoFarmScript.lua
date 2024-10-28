-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local TabContainer = Instance.new("Frame")
local ButtonNames = {"Player", "Misc", "Teleports", "Shop", "Aimlock"}
local Tabs = {}

-- Setting up ScreenGui for local player
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Theme Colors
local backgroundColor = Color3.fromRGB(230, 200, 255) -- Light purple for the background
local buttonColor = Color3.fromRGB(210, 180, 230)     -- Slightly darker purple for the buttons
local textColor = Color3.fromRGB(90, 0, 120)          -- Dark purple for text

-- Main Frame Setup
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = backgroundColor
MainFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
MainFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
MainFrame.Active = true
MainFrame.Draggable = true

-- Close Button Setup
CloseButton.Parent = MainFrame
CloseButton.Text = "X"
CloseButton.TextColor3 = textColor
CloseButton.Size = UDim2.new(0.05, 0, 0.05, 0)
CloseButton.Position = UDim2.new(0.95, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- Close the GUI when X is clicked
end)

-- Tab Container Setup
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = buttonColor
TabContainer.Size = UDim2.new(0.2, 0, 1, 0)
TabContainer.Position = UDim2.new(0, 0, 0, 0)

-- Create Tabs
for i, buttonName in ipairs(ButtonNames) do
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = TabContainer
    TabButton.Text = buttonName
    TabButton.TextColor3 = textColor
    TabButton.Size = UDim2.new(1, 0, 0.15, 0) -- Reduced height
    TabButton.Position = UDim2.new(0, 0, (i - 1) * 0.15, 0)
    TabButton.BackgroundColor3 = buttonColor
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
    TabContent.BackgroundColor3 = backgroundColor
    TabContent.Size = UDim2.new(0.8, 0, 1, 0)
    TabContent.Position = UDim2.new(0.2, 0, 0, 0)
    TabContent.Visible = false -- Initially hidden
    Tabs[buttonName] = TabContent

    -- Create Toggle Buttons in each tab
    for j = 1, 2 do
        local ToggleButton = Instance.new("TextButton")
        local CheckBox = Instance.new("TextLabel")
        
        -- Toggle Button setup
        ToggleButton.Parent = TabContent
        ToggleButton.Text = "Toggle " .. j
        ToggleButton.TextColor3 = textColor
        ToggleButton.Size = UDim2.new(0.5, 0, 0.1, 0) -- Reduced button size
        ToggleButton.Position = UDim2.new(0.05, 0, (j - 1) * 0.2 + 0.1, 0)
        ToggleButton.BackgroundColor3 = buttonColor
        ToggleButton.BorderSizePixel = 0
        
        -- CheckBox setup
        CheckBox.Parent = TabContent
        CheckBox.Text = "" -- Empty until toggled
        CheckBox.TextColor3 = Color3.new(0, 1, 0) -- Green checkmark when toggled
        CheckBox.BackgroundColor3 = backgroundColor
        CheckBox.Size = UDim2.new(0.1, 0, 0.1, 0) -- Larger size for visibility
        CheckBox.Position = UDim2.new(0.6, 5, (j - 1) * 0.2 + 0.1, 0)
        CheckBox.BorderSizePixel = 1
        
        -- Toggle functionality
        local toggled = false
        ToggleButton.MouseButton1Click:Connect(function()
            toggled = not toggled
            if toggled then
                CheckBox.Text = "✓" -- Show checkmark
            else
                CheckBox.Text = ""   -- Remove checkmark
            end
        end)
    end
end

-- Default to show the first tab
Tabs[ButtonNames[1]].Visible = true
--Tester123
