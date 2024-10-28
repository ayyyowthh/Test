-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
local Loader = Instance.new("Frame")
local LoadText = Instance.new("TextLabel")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local TabContainer = Instance.new("Frame")
local ContentFrame = Instance.new("Frame") -- Frame for tab content
local Tabs = {"Player", "Aimlock", "Teleports", "Shop", "Misc"}
local ButtonStates = {}

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
    MainFrame.Size = UDim2.new(0, 600, 0, 400) -- Increased size
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = true

    -- Enable dragging
    local dragging
    local dragInput
    local startPos

    local function update(input)
        local delta = input.Position - startPos
        MainFrame.Position = UDim2.new(MainFrame.Position.X.Scale, MainFrame.Position.X.Offset + delta.X, MainFrame.Position.Y.Scale, MainFrame.Position.Y.Offset + delta.Y)
    end

    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            startPos = input.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            update(input)
        end
    end)

    -- Round out the MainFrame
    local UICornerMain = Instance.new("UICorner")
    UICornerMain.CornerRadius = UDim.new(0, 15)
    UICornerMain.Parent = MainFrame

    -- Create Tab Container
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 0.5
    TabContainer.Size = UDim2.new(0, 100, 1, 0) -- Sufficient width for tabs
    TabContainer.Position = UDim2.new(0, 0, 0, 0)

    -- Create Content Frame for displaying tab content
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ContentFrame.BackgroundTransparency = 0.5
    ContentFrame.Size = UDim2.new(1, -100, 1, 0)
    ContentFrame.Position = UDim2.new(0, 100, 0, 0)

    -- Create tabs and button states
    for i, tabName in ipairs(Tabs) do
        ButtonStates[tabName] = false -- Initialize button state

        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName .. "Button"
        TabButton.Parent = TabContainer
        TabButton.Size = UDim2.new(1, 0, 0, 50)
        TabButton.Position = UDim2.new(0, 0, (i - 1) * 0.2, 0) -- Space out the tabs
        TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.Text = tabName
        TabButton.TextSize = 20

        -- Round out the tab buttons
        local UICornerTab = Instance.new("UICorner")
        UICornerTab.CornerRadius = UDim.new(0, 10)
        UICornerTab.Parent = TabButton

        TabButton.MouseButton1Click:Connect(function()
            -- Clear content
            for _, child in ipairs(ContentFrame:GetChildren()) do
                if child:IsA("TextButton") or child:IsA("Frame") then
                    child:Destroy()
                end
            end
            
            -- Highlight selected tab
            for _, btn in ipairs(TabContainer:GetChildren()) do
                if btn:IsA("TextButton") then
                    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                end
            end
            TabButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Highlight selected tab

            -- Add content based on the selected tab
            if tabName == "Player" then
                local Button1 = Instance.new("TextButton")
                Button1.Parent = ContentFrame
                Button1.Size = UDim2.new(0, 150, 0, 50)
                Button1.Position = UDim2.new(0.5, -75, 0.5, -25)
                Button1.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
                Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button1.Text = "Player Button 1"
                Button1.TextSize = 20

                Button1.MouseButton1Click:Connect(function()
                    ButtonStates["Player"] = not ButtonStates["Player"]
                    Button1.BackgroundColor3 = ButtonStates["Player"] and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
                end)
            elseif tabName == "Aimlock" then
                local Button1 = Instance.new("TextButton")
                Button1.Parent = ContentFrame
                Button1.Size = UDim2.new(0, 150, 0, 50)
                Button1.Position = UDim2.new(0.5, -75, 0.5, -25)
                Button1.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
                Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button1.Text = "Aimlock Button 1"
                Button1.TextSize = 20

                Button1.MouseButton1Click:Connect(function()
                    ButtonStates["Aimlock"] = not ButtonStates["Aimlock"]
                    Button1.BackgroundColor3 = ButtonStates["Aimlock"] and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
                end)
            elseif tabName == "Teleports" then
                local Button1 = Instance.new("TextButton")
                Button1.Parent = ContentFrame
                Button1.Size = UDim2.new(0, 150, 0, 50)
                Button1.Position = UDim2.new(0.5, -75, 0.5, -25)
                Button1.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
                Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button1.Text = "Teleport Button 1"
                Button1.TextSize = 20

                Button1.MouseButton1Click:Connect(function()
                    ButtonStates["Teleports"] = not ButtonStates["Teleports"]
                    Button1.BackgroundColor3 = ButtonStates["Teleports"] and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
                end)
            elseif tabName == "Shop" then
                local Button1 = Instance.new("TextButton")
                Button1.Parent = ContentFrame
                Button1.Size = UDim2.new(0, 150, 0, 50)
                Button1.Position = UDim2.new(0.5, -75, 0.5, -25)
                Button1.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
                Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button1.Text = "Shop Button 1"
                Button1.TextSize = 20

                Button1.MouseButton1Click:Connect(function()
                    ButtonStates["Shop"] = not ButtonStates["Shop"]
                    Button1.BackgroundColor3 = ButtonStates["Shop"] and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
                end)
            elseif tabName == "Misc" then
                local Button1 = Instance.new("TextButton")
                Button1.Parent = ContentFrame
                Button1.Size = UDim2.new(0, 150, 0, 50)
                Button1.Position = UDim2.new(0.5, -75, 0.5, -25)
                Button1.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
                Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button1.Text = "Misc Button 1"
                Button1.TextSize = 20

                Button1.MouseButton1Click:Connect(function()
                    ButtonStates["Misc"] = not ButtonStates["Misc"]
                    Button1.BackgroundColor3 = ButtonStates["Misc"] and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
                end)
            end
        end)
    end

    -- Create Close Button
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    CloseButton.Size = UDim2.new(0, 100, 0, 50)
    CloseButton.Position = UDim2.new(1, -120, 0, 10)
    CloseButton.Text = "Close"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 20

    CloseButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        Loader.Visible = true
        LoadText.Text = "Loading..."
        animateText(LoadText, "Goodbye!", 1, 28)
        wait(1)
        ScreenGui:Destroy()
    end)
end

-- Start loading animation
animateText(LoadText, "Loading complete!", 1, 28)

wait(2) -- Wait for a while to see the loading text
Loader.Visible = false
displayMainGui()
--maybeworking?
