-- Roblox GUI Script with Animations and Slider Toggles
-- Using black and red theme with transparency and rounded edges

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
local User = game.Players.LocalPlayer.Name

-- Loading Screen
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Parent = ScreenGui
LoadingFrame.Size = UDim2.new(0.4, 0, 0.2, 0)
LoadingFrame.Position = UDim2.new(0.3, 0, 0.4, 0)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoadingFrame.BackgroundTransparency = 0.4
LoadingFrame.BorderSizePixel = 0
LoadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingFrame.ClipsDescendants = true
LoadingFrame.Visible = true
LoadingFrame.BackgroundTransparency = 0.2
LoadingFrame.UICorner = Instance.new("UICorner", LoadingFrame)
LoadingFrame.UICorner.CornerRadius = UDim.new(0, 12)

local LoadingText = Instance.new("TextLabel")
LoadingText.Parent = LoadingFrame
LoadingText.Size = UDim2.new(1, 0, 1, 0)
LoadingText.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingText.Text = "Loading..."
LoadingText.TextColor3 = Color3.fromRGB(255, 0, 0)
LoadingText.TextSize = 32
LoadingText.TextTransparency = 0
LoadingText.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingText.BackgroundTransparency = 1

-- Animate Loading Screen
local TweenService = game:GetService("TweenService")
local function loadingAnimation()
    wait(1)
    LoadingText.Text = "Loaded"
    wait(1)
    LoadingText.Text = "Welcome, " .. User
    wait(1)
    LoadingText.Text = "Press Start to open the script"
end
loadingAnimation()

-- Main GUI Window
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.5, 0, 0.7, 0)
MainFrame.Position = UDim2.new(0.25, 0, 0.15, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0.3
MainFrame.Visible = false
MainFrame.UICorner = Instance.new("UICorner", MainFrame)
MainFrame.UICorner.CornerRadius = UDim.new(0, 12)

local XButton = Instance.new("TextButton")
XButton.Parent = MainFrame
XButton.Text = "X"
XButton.Position = UDim2.new(0.95, 0, 0.01, 0)
XButton.TextColor3 = Color3.fromRGB(255, 0, 0)
XButton.BackgroundTransparency = 1

-- Tab Button Styles
local tabs = {"Teleports", "Aimlock", "Player", "Shop", "Misc"}
for i, tabName in pairs(tabs) do
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = MainFrame
    TabButton.Size = UDim2.new(0.2, 0, 0.08, 0)
    TabButton.Position = UDim2.new(0.02, 0, 0.1 + (i - 1) * 0.1, 0)
    TabButton.Text = tabName
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    TabButton.BackgroundTransparency = 0.3
    TabButton.UICorner = Instance.new("UICorner", TabButton)
    TabButton.UICorner.CornerRadius = UDim.new(0, 8)
end

-- Slider Toggle
local function createToggle(parent, pos)
    local Toggle = Instance.new("Frame")
    Toggle.Parent = parent
    Toggle.Size = UDim2.new(0.1, 0, 0.05, 0)
    Toggle.Position = pos
    Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Toggle.UICorner = Instance.new("UICorner", Toggle)
    Toggle.UICorner.CornerRadius = UDim.new(0, 12)
    
    local Slider = Instance.new("Frame")
    Slider.Parent = Toggle
    Slider.Size = UDim2.new(0.5, 0, 1, 0)
    Slider.Position = UDim2.new(0, 0, 0, 0)
    Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Slider.UICorner = Instance.new("UICorner", Slider)
    Slider.UICorner.CornerRadius = UDim.new(0, 12)
    
    -- Toggle functionality
    local toggled = false
    Toggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            Toggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            Slider:TweenPosition(UDim2.new(0.5, 0, 0, 0), "Out", "Quad", 0.2)
        else
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            Slider:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.2)
        end
    end)
end

-- Add toggle to each tab
for i = 1, #tabs do
    createToggle(MainFrame, UDim2.new(0.3, 0, 0.1 * i, 0))
end

-- Close GUI with X button
XButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Show MainFrame after loading
MainFrame.Visible = true
--ayyyowthhwas,here§?
