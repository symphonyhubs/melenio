local UI_Library = {}

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

    local windowFrame = self:CreateFrame(screenGui, UDim2.new(0, 400, 0, 300), UDim2.new(0.3, 0, 0.3, 0), Color3.fromRGB(4, 4, 4))

    local titleLabel = self:CreateTextLabel(windowFrame, UDim2.new(0, 400, 0, 50), UDim2.new(0, 0, 0, 0), title, Enum.Font.PermanentMarker, Color3.fromRGB(255, 255, 255), 18)

    local closeButton = self:CreateButton(windowFrame, UDim2.new(0, 50, 0, 50), UDim2.new(0.9, 0, 0, 0), "X", Enum.Font.PermanentMarker, Color3.fromRGB(255, 0, 0), 18)
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    return windowFrame
end

-- Function to initialize the default UI
function UI_Library:Init()
    local screenGui = self:CreateScreenGui("UI")

    local mainFrame = self:CreateFrame(screenGui, UDim2.new(0, 529, 0, 317), UDim2.new(0.221, 0, 0.177, 0), Color3.fromRGB(4, 4, 4))
    
    local title = self:CreateTextLabel(mainFrame, UDim2.new(0, 366, 0, 43), UDim2.new(0.169, 0, 0.027, 0), "Milenio X Hub [BETA]", Enum.Font.PermanentMarker, Color3.fromRGB(254, 254, 254), 14)
    
    local mainButton = self:CreateButton(mainFrame, UDim2.new(0, 100, 0, 40), UDim2.new(0.059, 0, 0.006, 0), "Main", Enum.Font.PermanentMarker, Color3.fromRGB(0, 0, 0), 14)
end

return UI_Library
