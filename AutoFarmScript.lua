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
    
    -- Add a click event to change tab visibility (we'll implement it later)
    tabButton.MouseButton1Click:Connect(function()
        -- Logic to switch tabs goes here later
    end)

    table.insert(TabButtons, tabButton)
end

-- Tab Frames Setup
local function createTab(tabFrame, backgroundColor)
    tabFrame.Parent = MainFrame
    tabFrame.BackgroundColor3 = backgroundColor
    tabFrame.Size = UDim2.new(1, 0, 0.9, 0)
    tabFrame.Position = UDim2.new(0, 0, 0.1, 0)
    tabFrame.Visible = false -- Start all tabs as hidden
end

createTab(TeleportsTab, Color3.new(0.3, 0.5, 0.5))
createTab(AimlockTab, Color3.new(0.5, 0.3, 0.5))
createTab(PlayerTab, Color3.new(0.5, 0.5, 0.3))
createTab(ShopTab, Color3.new(0.3, 0.3, 0.5))
createTab(MiscTab, Color3.new(0.5, 0.3, 0.3))

-- Make the first tab visible by default
TeleportsTab.Visible = true
