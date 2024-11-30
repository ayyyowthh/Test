-- Settings
local customText = "Your Text Here" -- Change this to your desired text

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")

-- Create the Frame (Background)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0) -- Fullscreen
frame.BackgroundColor3 = Color3.new(1, 0, 0) -- Initial color (Red)
frame.Parent = screenGui

-- Create the TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0.5, 0, 0.1, 0) -- Half width, 10% height
textLabel.Position = UDim2.new(0.25, 0, 0.45, 0) -- Center of the screen
textLabel.BackgroundTransparency = 1
textLabel.Text = customText
textLabel.TextScaled = true
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
textLabel.Parent = frame

-- Color switching logic
local isRed = true
while true do
    if isRed then
        frame.BackgroundColor3 = Color3.new(0, 0, 1) -- Blue
    else
        frame.BackgroundColor3 = Color3.new(1, 0, 0) -- Red
    end
    isRed = not isRed
    wait(1) -- Switch every 1 second
end
