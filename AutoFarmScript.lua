-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabContainer = Instance.new("Frame")
local WelcomeFrame = Instance.new("Frame")
local WelcomeLabel = Instance.new("TextLabel")
local StartButton = Instance.new("TextButton")
local ButtonNames = {"Player", "Misc", "Teleports", "Shop", "Aimlock"}
local Tabs = {}
local LocalPlayerName = game.Players.LocalPlayer.Name

-- Set up ScreenGui for local player
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Theme Colors
local backgroundColor = Color3.fromRGB(25, 25, 25) -- Dark black
local buttonColor = Color3.fromRGB(150, 0, 0)      -- Dark red
local textColor = Color3.fromRGB(255, 255, 255)    -- White text
local transparentBlack = Color3.fromRGB(10, 10, 10) -- Subtle black for transparency

-- Create UI Corner function
local function addRoundedCorners(uiElement, radius)
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, radius)
    uiCorner.Parent = uiElement
end

-- Main Frame Setup (Rounded)
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = backgroundColor
MainFrame.BackgroundTransparency = 0.2
MainFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
MainFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
addRoundedCorners(MainFrame, 12)  -- Adding rounded corners to Main Frame

-- Tab Container Setup
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = buttonColor
TabContainer.Size = UDim2.new(0.2, 0, 1, 0)
TabContainer.Position = UDim2.new(0, 0, 0, 0)
addRoundedCorners(TabContainer, 12)  -- Adding rounded corners to Tab Container

-- Welcome Screen Setup (Rounded and Smaller)
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.BackgroundColor3 = transparentBlack
WelcomeFrame.Size = UDim2.new(0.2, 0, 0.3, 0) -- Smaller, compact size
WelcomeFrame.Position = UDim2.new(0.4, 0, 0.35, 0)
addRoundedCorners(WelcomeFrame, 15)  -- Adding rounded corners to Welcome Frame

-- Welcome Label Setup
WelcomeLabel.Parent = WelcomeFrame
WelcomeLabel.Text = "Loading..."
WelcomeLabel.TextColor3 = textColor
WelcomeLabel.Size = UDim2.new(1, 0, 0.4, 0)
WelcomeLabel.Position = UDim2.new(0, 0, 0.3, 0)
WelcomeLabel.Font = Enum.Font.SourceSansBold
WelcomeLabel.TextScaled = true
WelcomeLabel.BackgroundTransparency = 1

-- Start Button Setup (Rounded)
StartButton.Parent = WelcomeFrame
StartButton.Text = "Start"
StartButton.TextColor3 = textColor
StartButton.Size = UDim2.new(0.6, 0, 0.2, 0)
StartButton.Position = UDim2.new(0.2, 0, 0.65, 0)
StartButton.BackgroundColor3 = buttonColor
StartButton.Visible = false
StartButton.Font = Enum.Font.SourceSansBold
StartButton.TextScaled = true
addRoundedCorners(StartButton, 10)  -- Adding rounded corners to Start Button

-- Animation Sequence
local function animateWelcome()
    -- Show Loading... with fade-in
    WelcomeLabel.Text = "Loading..."
    for i = 0, 1, 0.02 do
        WelcomeLabel.TextTransparency = 1 - i
        wait(0.05)
    end
    wait(1)

    -- Transition to Welcome (User) text
    WelcomeLabel.Text = "Welcome, " .. LocalPlayerName
    for i = 1, 0, -0.02 do
        WelcomeLabel.TextTransparency = i
        wait(0.05)
    end
    wait(1)

    -- Transition to prompt for Start
    WelcomeLabel.Text = "Press Start to open the script"
    for i = 1, 0, -0.02 do
        WelcomeLabel.TextTransparency = i
        wait(0.05)
    end
    wait(1)

    -- Show Start Button with fade-in effect
    StartButton.Visible = true
    for i = 0, 1, 0.02 do
        StartButton.TextTransparency = 1 - i
        wait(0.05)
    end
end

-- Run animation
animateWelcome()

-- Start Button functionality
StartButton.MouseButton1Click:Connect(function()
    WelcomeFrame:Destroy()
    MainFrame.Visible = true
end)

-- Create Tabs with Rounded Buttons
for i, buttonName in ipairs(ButtonNames) do
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = TabContainer
    TabButton.Text = buttonName
    TabButton.TextColor3 = textColor
    TabButton.Size = UDim2.new(1, 0, 0.15, 0)
    TabButton.Position = UDim2.new(0, 0, (i - 1) * 0.15, 0)
    TabButton.BackgroundColor3 = buttonColor
    TabButton.BorderSizePixel = 0
    addRoundedCorners(TabButton, 8)  -- Adding rounded corners to Tab Buttons

    -- Toggle visibility between tabs
    TabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(Tabs) do
            tab.Visible = false -- Hide all tabs
        end
        Tabs[buttonName].Visible = true -- Show selected tab
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
        ToggleButton.Size = UDim2.new(0.5, 0, 0.1, 0)
        ToggleButton.Position = UDim2.new(0.05, 0, (j - 1) * 0.2 + 0.1, 0)
        ToggleButton.BackgroundColor3 = buttonColor
        ToggleButton.BorderSizePixel = 0
        addRoundedCorners(ToggleButton, 6)  -- Rounded corners for toggle buttons
        
        -- CheckBox setup
        CheckBox.Parent = TabContent
        CheckBox.Text = ""
        CheckBox.TextColor3 = Color3.new(0, 1, 0) -- Green checkmark when toggled
        CheckBox.BackgroundColor3 = backgroundColor
        CheckBox.Size = UDim2.new(0.1, 0, 0.1, 0)
        CheckBox.Position = UDim2.new(0.6, 5, (j - 1) * 0.2 + 0.1, 0)
        CheckBox.BorderSizePixel = 1
        CheckBox.Font = Enum.Font.SourceSansBold
        CheckBox.TextScaled = true
        addRoundedCorners(CheckBox, 5)  -- Rounded corners for checkbox
        
        -- Toggle functionality
        local toggled = false
        ToggleButton.MouseButton1Click:Connect(function()
            toggled = not toggled
            if toggled then
                CheckBox.Text = "✓"
            else
                CheckBox.Text = ""
            end
        end)
    end
end

-- Default to show the first tab
Tabs[ButtonNames[1]].Visible = true
--Iknow!
