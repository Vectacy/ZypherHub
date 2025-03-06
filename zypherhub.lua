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
MainFrame.BackgroundTransparency = 0.3 -- Perfect transparency match
MainFrame.Size = UDim2.new(0, 850, 0, 520) -- Adjusted for exact proportions
MainFrame.Position = UDim2.new(0.38, -425, 0.5, -260) -- Positioned slightly to the left
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Full Fix for Delta Executor 2025

-- Smooth UI Corners
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- UI Stroke for a Soft Border
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(60, 60, 60)

-- Shadow Effect for UI
Shadow.Parent = MainFrame
Shadow.BackgroundTransparency = 1
Shadow.Size = UDim2.new(1, 12, 1, 12)
Shadow.Position = UDim2.new(0, -6, 0, -6)
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageTransparency = 0.4

-- Title Bar (Final Fixes)
Title.Parent = MainFrame
Title.Text = "Zypher Hub | Premium Script Bloxfruit"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1 -- Removed solid header for full transparency
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

-- Sidebar (Optimized Alignment)
SideBar.Parent = MainFrame
SideBar.Size = UDim2.new(0, 180, 1, -30)
SideBar.Position = UDim2.new(0, 0, 0, 30)
SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SideBar.BackgroundTransparency = 0.3 -- Full transparency fix

-- Generals Button
GeneralsButton.Parent = SideBar
GeneralsButton.Text = "Generals"
GeneralsButton.Size = UDim2.new(1, 0, 0, 40)
GeneralsButton.Position = UDim2.new(0, 0, 0, 0)
GeneralsButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
GeneralsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GeneralsButton.Font = Enum.Font.SourceSansBold
GeneralsButton.TextSize = 14
GeneralsButton.BorderSizePixel = 0

-- Dragging Function (Fully Fixed)
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
