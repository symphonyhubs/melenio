local UI_Library = {}
UI_Library.__index = UI_Library

function UI_Library.new()
    local self = setmetatable({}, UI_Library)
    self.tabs = {}
    return self
end

-- Function to create a new ScreenGui
function UI_Library:CreateScreenGui(name)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = name
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false
    return ScreenGui
end

-- Function to create a new Frame
function UI_Library:CreateFrame(parent, size, position, bgColor)
    local Frame = Instance.new("Frame")
    Frame.Size = size
    Frame.Position = position
    Frame.BackgroundColor3 = bgColor
    Frame.BorderSizePixel = 0
    Frame.Parent = parent
    Frame.Active = true
    Frame.Draggable = true
    return Frame
end

-- Function to create a new TextLabel
function UI_Library:CreateTextLabel(parent, size, position, text, font, textColor, textSize)
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = size
    TextLabel.Position = position
    TextLabel.Text = text
    TextLabel.Font = font
    TextLabel.TextColor3 = textColor
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextScaled = true
    TextLabel.TextSize = textSize
    TextLabel.Parent = parent
    return TextLabel
end

-- Function to create a new Button
function UI_Library:CreateButton(parent, size, position, text, font, textColor, textSize)
    local Button = Instance.new("TextButton")
    Button.Size = size
    Button.Position = position
    Button.Text = text
    Button.Font = font
    Button.TextColor3 = textColor
    Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextScaled = true
    Button.TextSize = textSize
    Button.Parent = parent
    return Button
end

-- Function to create a window
function UI_Library:CreateWindow(title)
    local screenGui = self:CreateScreenGui("WindowGUI")

    local windowFrame = self:CreateFrame(screenGui, UDim2.new(0, 600, 0, 400), UDim2.new(0.2, 0, 0.2, 0), Color3.fromRGB(4, 4, 4))

    local titleLabel = self:CreateTextLabel(windowFrame, UDim2.new(0, 600, 0, 50), UDim2.new(0, 0, 0, 0), title, Enum.Font.PermanentMarker, Color3.fromRGB(255, 255, 255), 18)

    local closeButton = self:CreateButton(windowFrame, UDim2.new(0, 50, 0, 50), UDim2.new(0.9, 0, 0, 0), "X", Enum.Font.PermanentMarker, Color3.fromRGB(255, 0, 0), 18)
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    self.windowFrame = windowFrame

    -- Create Tab Holder
    local tabHolder = Instance.new("Frame")
    tabHolder.Size = UDim2.new(1, 0, 1, -50)
    tabHolder.Position = UDim2.new(0, 0, 0, 50)
    tabHolder.BackgroundTransparency = 1
    tabHolder.Parent = windowFrame
    self.tabHolder = tabHolder

    return windowFrame
end

-- Function to create a tab
function UI_Library:CreateTab(tabName)
    local tabButton = self:CreateButton(self.windowFrame, UDim2.new(0, 100, 0, 50), UDim2.new(0, #self.tabs * 100, 0, 0), tabName, Enum.Font.PermanentMarker, Color3.fromRGB(0, 0, 0), 14)
    tabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    local tabFrame = self:CreateFrame(self.tabHolder, UDim2.new(1, 0, 1, -50), UDim2.new(0, 0, 0, 0), Color3.fromRGB(4, 4, 4))
    tabFrame.Visible = false

    tabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(self.tabs) do
            tab.frame.Visible = false
        end
        tabFrame.Visible = true
    end)

    table.insert(self.tabs, {button = tabButton, frame = tabFrame})
    return tabFrame
end

-- Function to create a section
function UI_Library:CreateSection(parent, sectionName)
    local sectionFrame = self:CreateFrame(parent, UDim2.new(1, 0, 0, 100), UDim2.new(0, 0, 0, 0), Color3.fromRGB(6, 6, 6))
    local sectionLabel = self:CreateTextLabel(sectionFrame, UDim2.new(1, 0, 0, 20), UDim2.new(0, 0, 0, 0), sectionName, Enum.Font.PermanentMarker, Color3.fromRGB(255, 255, 255), 14)
    sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
    sectionLabel.Position = UDim2.new(0, 10, 0, 0)
    return sectionFrame
end

-- Function to initialize the default UI
function UI_Library:Init()
    self:CreateWindow("Milenio X Hub")
end

return UI_Library
