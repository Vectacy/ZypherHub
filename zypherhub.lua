local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SideBar = Instance.new("Frame")
local GeneralsButton = Instance.new("TextButton")
local UIStroke = Instance.new("UIStroke")
local UICorner = Instance.new("UICorner")
local Shadow = Instance.new("ImageLabel")

-- Dragging Variables
local UserInputService = game:GetService("UserInputService")
local Dragging, DragInput, StartPos, DragStart

ScreenGui.Parent = game.CoreGui

-- Main UI Frame (Final Fixes)
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Dark transparent background
MainFrame.BackgroundTransparency = 0.25 -- Adjusted for smooth transparency
MainFrame.Size = UDim2.new(0, 950, 0, 550) -- Increased size for perfect match
MainFrame.Position = UDim2.new(0.38, -475, 0.5, -275) -- Positioned slightly to the left
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Fully optimized dragging

-- Smooth UI Corners
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- UI Stroke for a Soft Border
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(60, 60, 60)

-- Shadow Effect for UI
Shadow.Parent = MainFrame
Shadow.BackgroundTransparency = 1
Shadow.Size = UDim2.new(1, 15, 1, 15)
Shadow.Position = UDim2.new(0, -7, 0, -7)
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageTransparency = 0.35

-- Title Bar (Final Fixes)
Title.Parent = MainFrame
Title.Text = "Zypher Hub | Premium Script Bloxfruit"
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20

-- Sidebar (Dark Transparent Fix)
SideBar.Parent = MainFrame
SideBar.Size = UDim2.new(0, 200, 1, -35)
SideBar.Position = UDim2.new(0, 0, 0, 35)
SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SideBar.BackgroundTransparency = 0.25 -- Dark transparent like reference

-- Generals Button
GeneralsButton.Parent = SideBar
GeneralsButton.Text = "Generals"
GeneralsButton.Size = UDim2.new(1, 0, 0, 45)
GeneralsButton.Position = UDim2.new(0, 0, 0, 0)
GeneralsButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
GeneralsButton.BackgroundTransparency = 0.25
GeneralsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GeneralsButton.Font = Enum.Font.SourceSansBold
GeneralsButton.TextSize = 16
GeneralsButton.BorderSizePixel = 0

-- Dragging Function (Fully Optimized)
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = input.Position
        StartPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        DragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == DragInput and Dragging then
        local Delta = input.Position - DragStart
        MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)
