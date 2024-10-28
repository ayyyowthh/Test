-- GUI Elements
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabContainer = Instance.new("Frame")
local TeleportsTab = Instance.new("Frame")
local AimlockTab = Instance.new("Frame")
local PlayerTab = Instance.new("Frame")
local ShopTab = Instance.new("Frame")
local MiscTab = Instance.new("Frame")
local TabButtons = {}

local tabs = {"Teleports", "Aimlock", "Player", "Shop", "Misc"}

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame Setup
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0.4, 0, 0.4, 0)

-- Tab Container Setup
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TabContainer.Size = UDim2.new(1, 0, 0.1, 0)
TabContainer.Position = UDim2.new(0, 0, 0, 0)

-- Create Tabs
for _, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Parent = TabContainer
    tabButton.Text = tabName
    tabButton.Size = UDim2.new(1 / #tabs, 0, 1, 0)
    tabButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    tabButton.MouseButton1Click:Connect(function()
        -- Hide all tabs
        TeleportsTab.Visible = false
        AimlockTab.Visible = false
        PlayerTab.Visible = false
        ShopTab.Visible = false
        MiscTab.Visible = false

        -- Show selected tab
        if tabName == "Teleports" then
            TeleportsTab.Visible = true
        elseif tabName == "Aimlock" then
            AimlockTab.Visible = true
        elseif tabName == "Player" then
            PlayerTab.Visible = true
        elseif tabName == "Shop" then
            ShopTab.Visible = true
        elseif tabName == "Misc" then
            MiscTab.Visible = true
        end
    end)
    
    tabButton.Parent = TabContainer
    table.insert(TabButtons, tabButton)
end

-- Tab Frames Setup
local function createTab(tabFrame, backgroundColor)
    tabFrame.Parent = MainFrame
    tabFrame.BackgroundColor3 = backgroundColor
    tabFrame.Size = UDim2.new(1, 0, 0.9, 0)
    tabFrame.Position = UDim2.new(0, 0, 0.1, 0)
    tabFrame.Visible = false
end

createTab(TeleportsTab, Color3.new(0.3, 0.5, 0.5))
createTab(AimlockTab, Color3.new(0.5, 0.3, 0.5))
createTab(PlayerTab, Color3.new(0.5, 0.5, 0.3))
createTab(ShopTab, Color3.new(0.3, 0.3, 0.5))
createTab(MiscTab, Color3.new(0.5, 0.3, 0.3))

-- Make the first tab visible by default
TeleportsTab.Visible = true

-- Example Content for Teleports Tab
local teleportButton = Instance.new("TextButton")
teleportButton.Parent = TeleportsTab
teleportButton.Text = "Save Current Position"
teleportButton.Size = UDim2.new(0.5, 0, 0.1, 0)
teleportButton.Position = UDim2.new(0.25, 0, 0.25, 0)
teleportButton.BackgroundColor3 = Color3.new(0.3, 0.8, 0.3)
teleportButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    if character and character:FindFirstChild("HumanoidRootPart") then
        savedPosition = character.HumanoidRootPart.CFrame
        print("Position saved!")
    else
        warn("Unable to save position.")
    end
end)

-- Additional tabs can have similar content buttons added here

