-- GUI Elements
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabContainer = Instance.new("Frame")
local TeleportsTab = Instance.new("Frame")
local AimlockTab = Instance.new("Frame")
local PlayerTab = Instance.new("Frame")
local ShopTab = Instance.new("Frame")
local MiscTab = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")

local tabs = {"Teleports", "Aimlock", "Player", "Shop", "Misc"}
local currentTab = nil  -- To track the currently visible tab

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame Setup
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Active = true
MainFrame.Draggable = true  -- Allow moving the GUI

-- Close Button Setup
CloseButton.Parent = MainFrame
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0.05, 0, 0.05, 0)
CloseButton.Position = UDim2.new(0.95, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- Close the GUI when X is clicked
end)

-- Tab Container Setup
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TabContainer.Size = UDim2.new(0.2, 0, 1, 0) -- Tabs on the left side
TabContainer.Position = UDim2.new(0, 0, 0, 0)

-- Function to create tabs
local function createTab(tabFrame, backgroundColor)
    tabFrame.Parent = MainFrame
    tabFrame.BackgroundColor3 = backgroundColor
    tabFrame.Size = UDim2.new(0.8, 0, 0.9, 0) -- Adjusted to fit next to tabs
    tabFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
    tabFrame.Visible = false -- Start all tabs as hidden
end

-- Create Tabs and Buttons
for _, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Parent = TabContainer
    tabButton.Text = tabName
    tabButton.Size = UDim2.new(1, 0, 0.2, 0) -- Smaller tabs
    tabButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)

    -- Tab click functionality
    tabButton.MouseButton1Click:Connect(function()
        -- Hide the current tab if one is open
        if currentTab then
            currentTab.Visible = false
        end
        
        -- Show the selected tab
        if tabName == "Teleports" then
            TeleportsTab.Visible = true
            currentTab = TeleportsTab
        elseif tabName == "Aimlock" then
            AimlockTab.Visible = true
            currentTab = AimlockTab
        elseif tabName == "Player" then
            PlayerTab.Visible = true
            currentTab = PlayerTab
        elseif tabName == "Shop" then
            ShopTab.Visible = true
            currentTab = ShopTab
        elseif tabName == "Misc" then
            MiscTab.Visible = true
            currentTab = MiscTab
        end
    end)
end

-- Create the tab frames
createTab(TeleportsTab, Color3.new(0.3, 0.5, 0.5))
createTab(AimlockTab, Color3.new(0.5, 0.3, 0.5))
createTab(PlayerTab, Color3.new(0.5, 0.5, 0.3))
createTab(ShopTab, Color3.new(0.3, 0.3, 0.5))
createTab(MiscTab, Color3.new(0.5, 0.3, 0.3))

-- Make the first tab visible by default
currentTab = TeleportsTab
currentTab.Visible = true
