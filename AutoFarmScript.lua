-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
local Loader = Instance.new("Frame")
local LoadText = Instance.new("TextLabel")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local TabContainer = Instance.new("Frame")
local User = game.Players.LocalPlayer.Name
local UIS = game:GetService("UserInputService")

-- Function to create a button with a toggle switch
local function createToggleButton(parent, name, position)
    local button = Instance.new("TextButton")
    local toggle = Instance.new("Frame")
    local toggleCircle = Instance.new("Frame")

    button.Name = name
    button.Size = UDim2.new(0, 100, 0, 30)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = parent

    toggle.Size = UDim2.new(0, 50, 0, 20)
    toggle.Position = UDim2.new(0, 55, 0, 5)
    toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Parent = button

    toggleCircle.Size = UDim2.new(0, 20, 0, 20)
    toggleCircle.Position = UDim2.new(0, 0, 0, 0)
    toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleCircle.Parent = toggle

    local toggled = false
    button.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            toggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green when on
            toggleCircle.Position = UDim2.new(1, -20, 0, 0) -- Move to the right
        else
            toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White when off
            toggleCircle.Position = UDim2.new(0, 0, 0, 0) -- Move to the left
        end
    end)

    return button
end

-- Set up Loader frame
Loader.Name = "Loader"
Loader.Parent = ScreenGui
Loader.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Loader.BackgroundTransparency = 0.5
Loader.Size = UDim2.new(0, 300, 0, 200)
Loader.Position = UDim2.new(0.5, -150, 0.5, -100)
Loader.AnchorPoint = Vector2.new(0.5, 0.5)

-- Load text
LoadText.Name = "LoadText"
LoadText.Parent = Loader
LoadText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoadText.Size = UDim2.new(1, 0, 0, 50)
LoadText.Position = UDim2.new(0, 0, 0, 75)
LoadText.Text = "Loading..."
LoadText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadText.TextScaled = true

-- Function to create Main GUI
local function createMainGUI()
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BackgroundTransparency = 0.5
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.Visible = false

    -- Create close button
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        Loader.Visible = true
        LoadText.Text = "Loading..."
    end)

    -- Create Tab Container
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TabContainer.Size = UDim2.new(0, 400, 0, 300)
    TabContainer.Position = UDim2.new(0, 0, 0, 30)

    -- Create tabs
    local tabNames = {"Player", "Aimlock", "Teleports", "Shop", "Misc"}
    for i, tabName in ipairs(tabNames) do
        local tabButton = Instance.new("TextButton")
        tabButton.Name = tabName
        tabButton.Size = UDim2.new(0, 80, 0, 30)
        tabButton.Position = UDim2.new(0, 80 * (i - 1), 0, 0)
        tabButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        tabButton.Text = tabName
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.Parent = MainFrame

        tabButton.MouseButton1Click:Connect(function()
            -- Hide all content frames first
            for _, button in ipairs(TabContainer:GetChildren()) do
                if button:IsA("Frame") then
                    button.Visible = false
                end
            end

            -- Show corresponding content frame
            local contentFrame = Instance.new("Frame")
            contentFrame.Size = UDim2.new(1, 0, 1, 0)
            contentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            contentFrame.Parent = TabContainer

            -- Add two toggle buttons for each tab
            createToggleButton(contentFrame, tabName .. " Toggle 1", UDim2.new(0, 10, 0, 10))
            createToggleButton(contentFrame, tabName .. " Toggle 2", UDim2.new(0, 10, 0, 50))

            contentFrame.Visible = true
        end)
    end

    -- Initialize first tab
    tabNames[1].MouseButton1Click:Fire()
end

-- Animate loader text
for i = 1, 3 do
    LoadText.Text = string.rep(".", i)
    wait(0.5)
end

LoadText.Text = "Loaded"
wait(1)

LoadText.Text = "Welcome " .. User
wait(1)

Loader.Visible = false
MainFrame.Visible = true
createMainGUI()

-- Allow the GUI to be movable
local dragging
local dragInput
local dragStart
local startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Finally, let's ensure that the GUI is visible when the script is executed
ScreenGui.Parent = game.CoreGui
--none111
