if _G.ZypherHubLoaded then return end
_G.ZypherHubLoaded = true

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
local FirstUI = Instance.new("Frame")
local SecondUI = Instance.new("Frame")
local AnimationText = Instance.new("TextLabel")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local HideButton = Instance.new("TextButton")

-- Category System
local CategoryFrame = Instance.new("Frame")
local GeneralCategory = Instance.new("TextButton")
local DojoQuestCategory = Instance.new("TextButton")
local SeaEventsCategory = Instance.new("TextButton")
local RaceV4Category = Instance.new("TextButton")
local FruitsCategory = Instance.new("TextButton")
local SettingsCategory = Instance.new("TextButton")

-- Parent to CoreGui
ScreenGui.Parent = game.CoreGui

-- First UI
FirstUI.Parent = ScreenGui
FirstUI.Size = UDim2.new(0, 900, 0, 500)
FirstUI.Position = UDim2.new(0.5, -450, 0.5, -250)
FirstUI.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
FirstUI.BackgroundTransparency = 0.2
FirstUI.Visible = true

local FirstUICorner = Instance.new("UICorner")
FirstUICorner.Parent = FirstUI
FirstUICorner.CornerRadius = UDim.new(0, 12)

-- Second Animation UI
SecondUI.Parent = ScreenGui
SecondUI.Size = UDim2.new(0, 900, 0, 500)
SecondUI.Position = UDim2.new(0.5, -450, 0.5, -250)
SecondUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SecondUI.BackgroundTransparency = 0
SecondUI.Visible = false

local SecondUICorner = Instance.new("UICorner")
SecondUICorner.Parent = SecondUI
SecondUICorner.CornerRadius = UDim.new(0, 12)

-- Animation Text
AnimationText.Parent = SecondUI
AnimationText.Size = UDim2.new(0, 400, 0, 50)
AnimationText.Position = UDim2.new(0.5, -200, 0.5, -25)
AnimationText.Text = "Zypher Hub Premium Script"
AnimationText.Font = Enum.Font.GothamBold
AnimationText.TextSize = 22
AnimationText.TextColor3 = Color3.fromRGB(255, 255, 255)
AnimationText.BackgroundTransparency = 1
AnimationText.Visible = false

-- Main UI
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BackgroundTransparency = 0.2
MainFrame.Size = UDim2.new(0, 900, 0, 500)
MainFrame.Position = UDim2.new(0.5, -450, 0.5, -250)
MainFrame.Visible = false

UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 12)

-- Title
Title.Parent = MainFrame
Title.Text = "Zypher Hub | Premium Script Bloxfruit"
Title.Size = UDim2.new(0, 400, 0, 35)
Title.Position = UDim2.new(0, 50, 0, 5)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Hide/Show UI Button
HideButton.Parent = ScreenGui
HideButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
HideButton.Size = UDim2.new(0, 90, 0, 40)
HideButton.Position = UDim2.new(0.02, 0, 0.3, 0)
HideButton.Text = "❮"
HideButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HideButton.Font = Enum.Font.GothamBold
HideButton.TextSize = 20
HideButton.Visible = true

local UIVisible = true
local AnimationFinished = false

-- Hide/Show UI Function
HideButton.MouseButton1Click:Connect(function()
    if not AnimationFinished then return end
    UIVisible = not UIVisible
    MainFrame.Visible = UIVisible
    HideButton.Text = UIVisible and "❮" or "❯"
end)

-- Fix UI Dragging (Only from Header)
local Dragging, DragInput, StartPos, DragStart = false, nil, nil, nil

Title.InputBegan:Connect(function(input)
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

Title.InputChanged:Connect(function(input)
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

-- Fix: Animation UI is not draggable
SecondUI.Active = false
FirstUI.Active = false

-- Fix: Second Animation Shrinking
task.wait(2)
SecondUI.Visible = true
FirstUI.Visible = false
task.wait(2.5)
AnimationText.Visible = true
task.wait(2.5)
MainFrame.Visible = true

TweenService:Create(SecondUI, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 0, 0, 0),
    Position = UDim2.new(0.5, 0, 0.5, 0)
}):Play()

task.wait(0.5)
SecondUI.Visible = false
AnimationFinished = true
HideButton.Visible = true

-- Category System UI
CategoryFrame.Parent = MainFrame
CategoryFrame.Size = UDim2.new(0, 200, 0, 150)
CategoryFrame.Position = UDim2.new(0, 10, 0, 50)
CategoryFrame.BackgroundTransparency = 1

-- Create Category Buttons
local function CreateCategoryButton(name, position, parent)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = position
    button.Text = name
    button.Font = Enum.Font.GothamBold
    button.TextSize = 18
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundTransparency = 1
    return button
end

GeneralCategory = CreateCategoryButton("General", UDim2.new(0, 0, 0, 0), CategoryFrame)
DojoQuestCategory = CreateCategoryButton("Dojo Quest", UDim2.new(0, 0, 0, 30), CategoryFrame)
SeaEventsCategory = CreateCategoryButton("Sea Events", UDim2.new(0, 0, 0, 60), CategoryFrame)
RaceV4Category = CreateCategoryButton("Race V4 Quest", UDim2.new(0, 0, 0, 90), CategoryFrame)
FruitsCategory = CreateCategoryButton("Fruits", UDim2.new(0, 0, 0, 120), CategoryFrame)
SettingsCategory = CreateCategoryButton("Settings", UDim2.new(0, 0, 0, 150), CategoryFrame)

-- Final Script ✅
