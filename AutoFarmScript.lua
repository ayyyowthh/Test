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
local TabButtons = {}

local tabs = {"Teleports", "Aimlock", "Player", "Shop", "Misc"}

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

-- Create Tabs
for _, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Parent = TabContainer
    tabButton.Text = tabName
    tabButton.Size = UDim2.new(1, 0, 0.2, 0) -- Smaller tabs
    tabButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    
    -- Tab click functionality (we'll implement it later)
    tabButton.MouseButton1Click:Connect(function()
        -- Logic to switch tabs goes here later
        TeleportsTab.Visible = false
        AimlockTab.Visible = false
        PlayerTab.Visible = false
        ShopTab.Visible = false
        MiscTab.Visible = false

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

    table.insert(TabButtons, tabButton)
end

-- Tab Frames Setup
local function createTab(tabFrame, backgroundColor)
    tabFrame.Parent = MainFrame
    tabFrame.BackgroundColor3 = backgroundColor
    tabFrame.Size = UDim2.new(0.8, 0, 0.9, 0) -- Adjusted to fit next to tabs
    tabFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
    tabFrame.Visible = false -- Start all tabs as hidden
end

createTab(TeleportsTab, Color3.new(0.3, 0.5, 0.5))
createTab(AimlockTab, Color3.new(0.5, 0.3, 0.5))
createTab(PlayerTab, Color3.new(0.5, 0.5, 0.3))
createTab(ShopTab, Color3.new(0.3, 0.3, 0.5))
createTab(MiscTab, Color3.new(0.5, 0.3, 0.3))

-- Make the first tab visible by default
TeleportsTab.Visible = true
