local ScreenGui = Instance.new("ScreenGui")
local Loader = Instance.new("Frame")
local LoadText = Instance.new("TextLabel")

-- Set up ScreenGui and Loader frame
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Loader.Name = "Loader"
Loader.Parent = ScreenGui
Loader.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Loader.BackgroundTransparency = 0.3
Loader.Size = UDim2.new(0, 300, 0, 100)
Loader.Position = UDim2.new(0.5, -150, 0.5, -50)
Loader.AnchorPoint = Vector2.new(0.5, 0.5)
Loader.ClipsDescendants = true
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
            -- Call function here to display main GUI after loader
            displayMainGui()
        end
    )
end)()
--simawashere
