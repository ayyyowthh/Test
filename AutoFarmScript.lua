
local customText = "Nigger" 


local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")


local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0) -- Fullscreen
frame.BackgroundColor3 = Color3.new(1, 0, 0) 
frame.Parent = screenGui


local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0.5, 0, 0.1, 0) 
textLabel.Position = UDim2.new(0.25, 0, 0.45, 0) 
textLabel.BackgroundTransparency = 1
textLabel.Text = customText
textLabel.TextScaled = true
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextColor3 = Color3.new(1, 1, 1) 
textLabel.Parent = frame


local isRed = true
while true do
    if isRed then
        frame.BackgroundColor3 = Color3.new(0, 0, 1) 
    else
        frame.BackgroundColor3 = Color3.new(1, 0, 0) 
    end
    isRed = not isRed
    wait(1) 
end
