-- Key for authentication
local requiredKey = "c{Qc}FzDa.]6XvO}v,hARTfd#]Isq["

-- Prompt the user for a key
local player = game:GetService("Players").LocalPlayer
local userInput = ""

-- Create a basic key input GUI
local keyGui = Instance.new("ScreenGui")
keyGui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.2, 0)
frame.Position = UDim2.new(0.35, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Parent = keyGui

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0.3, 0)
textBox.Position = UDim2.new(0.1, 0, 0.35, 0)
textBox.PlaceholderText = "Enter Key"
textBox.Text = ""
textBox.TextScaled = true
textBox.BackgroundColor3 = Color3.new(1, 1, 1)
textBox.Parent = frame

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0.8, 0, 0.3, 0)
submitButton.Position = UDim2.new(0.1, 0, 0.7, 0)
submitButton.Text = "Submit"
submitButton.TextScaled = true
submitButton.BackgroundColor3 = Color3.new(0, 0.5, 0)
submitButton.Parent = frame

-- Connect button to check key
local correctKeyEntered = false
submitButton.MouseButton1Click:Connect(function()
    if textBox.Text == requiredKey then
        correctKeyEntered = true
        keyGui:Destroy()
    else
        textBox.Text = ""
        textBox.PlaceholderText = "Wrong Key. Try Again."
    end
end)

-- Wait until the correct key is entered
repeat
    task.wait()
until correctKeyEntered

-- Main Script (Executes after key is verified)
local customText = "Nigger" -- Change this text as needed

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")

-- Create the Frame (Background)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0) -- Fullscreen
mainFrame.BackgroundColor3 = Color3.new(1, 0, 0) -- Initial color (Red)
mainFrame.Parent = screenGui

-- Create the TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0.5, 0, 0.1, 0) -- Half width, 10% height
textLabel.Position = UDim2.new(0.25, 0, 0.45, 0) -- Center of the screen
textLabel.BackgroundTransparency = 1
textLabel.Text = customText
textLabel.TextScaled = true
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
textLabel.Parent = mainFrame

-- Color switching logic
local isRed = true
while true do
    if isRed then
        mainFrame.BackgroundColor3 = Color3.new(0, 0, 1) -- Blue
    else
        mainFrame.BackgroundColor3 = Color3.new(1, 0, 0) -- Red
    end
    isRed = not isRed
    task.wait(1) -- Switch every 1 second
end
