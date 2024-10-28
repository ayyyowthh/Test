-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
local Loader = Instance.new("Frame")
local LoadText = Instance.new("TextLabel")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local TabContainer = Instance.new("Frame")
local Tabs = {"Player", "Aimlock", "Teleports", "Shop", "Misc"}
local Buttons = {}

-- Set up ScreenGui and Loader frame
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Loader.Name = "Loader"
Loader.Parent = ScreenGui
Loader.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Loader.BackgroundTransparency = 0.3
Loader.Size = UDim2.new(0, 300, 0, 100)
Loader.Position = UDim2.new(0.5, -150, 0.5, -50)
Loader.AnchorPoint = Vector2.new(0.5, 0.5)
Loader.BorderSizePixel = 0
Loader.Visible = true

-- Round out the Loader frame
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Loader

-- Set up LoadText for the loading messages
LoadText.Name = "LoadText"
LoadText.Parent = Loader
LoadText.Size = UDim2.new(1, 0, 1, 0)
LoadText.BackgroundTransparency = 1
LoadText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadText.TextSize = 28
LoadText.Font = Enum.Font.SourceSansBold
LoadText.Text = "Loading..."
LoadText.TextTransparency = 1

-- Function to animate text
local function animateText(textLabel, message, delayTime, endSize)
    textLabel.Text = message
    textLabel.TextTransparency = 1
    textLabel.TextSize = 48  -- Starting size for the shrink effect
    
    -- Fade in and shrink text
    for i = 1, 10 do
        textLabel.TextTransparency = textLabel.TextTransparency - 0.1
        textLabel.TextSize = textLabel.TextSize - ((48 - endSize) / 10)
        wait(0.05)
    end
    wait(delayTime)
end

-- Create Main GUI after loading
local function displayMainGui()
    -- Set up main GUI frame
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BackgroundTransparency = 0.3
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = true
    
    -- Round out the MainFrame
    local UICornerMain = Instance.new("UICorner")
    UICornerMain.CornerRadius = UDim.new(0, 15)
    UICornerMain.Parent = MainFrame
    
    -- Create Tab Container
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 0.5
    TabContainer.Size = UDim2.new(0, 80, 1, 0)
    TabContainer.Position = UDim2.new(0, 0, 0, 0)

    -- Create tabs
    for _, tabName in ipairs(Tabs) do
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName .. "Button"
        TabButton.Parent = TabContainer
        TabButton.Size = UDim2.new(1, 0, 0, 50)
        TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.Text = tabName
        TabButton.TextSize = 20

        -- Round out the tab buttons
        local UICornerTab = Instance.new("UICorner")
        UICornerTab.CornerRadius = UDim.new(0, 10)
        UICornerTab.Parent = TabButton

        TabButton.MouseButton1Click:Connect(function()
            -- Add functionality for switching tabs here
            for _, btn in ipairs(TabContainer:GetChildren()) do
                if btn:IsA("TextButton") then
                    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                end
            end
            TabButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Highlight selected tab
        end)
    end

    -- Create Close Button
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = MainFrame
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -40, 0, 10)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Text = "X"
    CloseButton.TextSize = 20
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Function to create toggle buttons with animation
    local function createToggleButton(parent, buttonName)
        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Name = buttonName .. "Toggle"
        ToggleButton.Parent = parent
        ToggleButton.Size = UDim2.new(0, 150, 0, 50)
        ToggleButton.Position = UDim2.new(0.5, -75, 0.5, -25)
        ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleButton.Text = buttonName
        ToggleButton.TextSize = 20

        local UICornerToggle = Instance.new("UICorner")
        UICornerToggle.CornerRadius = UDim.new(0, 10)
        UICornerToggle.Parent = ToggleButton

        local toggleState = false  -- false = off, true = on
        local toggleCircle = Instance.new("Frame")
        toggleCircle.Size = UDim2.new(0, 30, 0, 30)
        toggleCircle.Position = UDim2.new(0, 10, 0.5, -15)
        toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        toggleCircle.BorderSizePixel = 0
        toggleCircle.Parent = ToggleButton

        local function toggleAnimation()
            toggleState = not toggleState
            if toggleState then
                toggleCircle:TweenPosition(UDim2.new(0, 110, 0.5, -15), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true)
                toggleCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            else
                toggleCircle:TweenPosition(UDim2.new(0, 10, 0.5, -15), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true)
                toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
        
        ToggleButton.MouseButton1Click:Connect(toggleAnimation)
    end

    -- Create toggle buttons for each tab
    for _, tabName in ipairs(Tabs) do
        createToggleButton(MainFrame, tabName)
    end
end

-- Animation sequence
coroutine.wrap(function()
    animateText(LoadText, "Loading...", 1.5, 36)
    animateText(LoadText, "Loaded", 1.2, 28)
    animateText(LoadText, "Welcome " .. game.Players.LocalPlayer.Name, 1.5, 24)
    
    -- After animations, remove loader and show main GUI
    wait(0.5)
    Loader:TweenSizeAndPosition(
        UDim2.new(0, 0, 0, 0),
        UDim2.new(0.5, 0, 0.5, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.5,
        true,
        function()
            Loader.Visible = false
            displayMainGui()
        end
    )
end)()
--creditos!!
