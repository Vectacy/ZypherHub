if _G.ZypherHubLoaded then return end
_G.ZypherHubLoaded = true -- Anti-duplicate protection for Delta Executor

local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
if not string.find(gameName, "Blox Fruits") then
    -- Kick message UI (Cleaner and properly managed)
    local ScreenGui = Instance.new("ScreenGui")
    local KickFrame = Instance.new("Frame")
    local KickMessage = Instance.new("TextLabel")
    local OkayButton = Instance.new("TextButton")

    ScreenGui.Parent = game.CoreGui

    KickFrame.Parent = ScreenGui
    KickFrame.Size = UDim2.new(0, 400, 0, 200)
    KickFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
    KickFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    KickFrame.BackgroundTransparency = 0.2

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = KickFrame

    KickMessage.Parent = KickFrame
    KickMessage.Size = UDim2.new(1, -20, 0.6, 0)
    KickMessage.Position = UDim2.new(0, 10, 0, 30)
    KickMessage.Text = "This script only works in Blox Fruits!"
    KickMessage.Font = Enum.Font.GothamBold
    KickMessage.TextSize = 18
    KickMessage.TextWrapped = true
    KickMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
    KickMessage.BackgroundTransparency = 1

    OkayButton.Parent = KickFrame
    OkayButton.Size = UDim2.new(0, 120, 0, 40)
    OkayButton.Position = UDim2.new(0.5, -60, 0.8, 0)
    OkayButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red Button
    OkayButton.Text = "Okay"
    OkayButton.Font = Enum.Font.GothamBold
    OkayButton.TextSize = 18
    OkayButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = OkayButton

    OkayButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    return
end

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
local FirstUI = Instance.new("Frame") -- First UI (No Animation)
local SecondUI = Instance.new("Frame") -- Second Animation UI
local AnimationText = Instance.new("TextLabel") -- Animation text
local MainFrame = Instance.new("Frame") -- Main UI
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local HideButton = Instance.new("TextButton")

-- Parent to CoreGui
ScreenGui.Parent = game.CoreGui

-- First UI (No Animation)
FirstUI.Parent = ScreenGui
FirstUI.Size = UDim2.new(0, 900, 0, 500)
FirstUI.Position = UDim2.new(0.5, -450, 0.5, -250)
FirstUI.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
FirstUI.BackgroundTransparency = 0.2
FirstUI.Visible = true

local FirstUICorner = Instance.new("UICorner")
FirstUICorner.CornerRadius = UDim.new(0, 12)
FirstUICorner.Parent = FirstUI

-- Second Animation UI (Instant Black Background)
SecondUI.Parent = ScreenGui
SecondUI.Size = UDim2.new(0, 900, 0, 500)
SecondUI.Position = UDim2.new(0.5, -450, 0.5, -250)
SecondUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SecondUI.BackgroundTransparency = 0
SecondUI.Visible = false

-- Animation Text (Appears from Middle)
AnimationText.Parent = SecondUI
AnimationText.Size = UDim2.new(0, 400, 0, 50)
AnimationText.Position = UDim2.new(0.5, -200, 0.5, -25)
AnimationText.Text = "Zypher Hub Premium Script"
AnimationText.Font = Enum.Font.GothamBold
AnimationText.TextSize = 22
AnimationText.TextColor3 = Color3.fromRGB(255, 255, 255)
AnimationText.BackgroundTransparency = 1

-- Main UI
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BackgroundTransparency = 0.2
MainFrame.Size = UDim2.new(0, 900, 0, 500)
MainFrame.Position = UDim2.new(0.5, -450, 0.5, -250)
MainFrame.Visible = false

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

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

-- Hide/Show UI Button (Fixed)
HideButton.Parent = ScreenGui
HideButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
HideButton.Size = UDim2.new(0, 90, 0, 40)
HideButton.Position = UDim2.new(0.02, 0, 0.3, 0)
HideButton.Text = "❮"
HideButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HideButton.Font = Enum.Font.GothamBold
HideButton.TextSize = 20
HideButton.Visible = false -- Initially hidden

local UIVisible = true -- Track UI visibility
local AnimationFinished = false -- Track animation state

HideButton.MouseButton1Click:Connect(function()
    if not AnimationFinished then return end -- Prevent interaction during animation

    UIVisible = not UIVisible -- Toggle state

    if UIVisible then
        MainFrame.Visible = true
        HideButton.Text = "❮"
    else
        MainFrame.Visible = false
        HideButton.Text = "❯"
    end
end)

-- Animation Sequence (Ensure UI Button is enabled only after animation)
task.wait(2)
SecondUI.Visible = true
FirstUI.Visible = false -- Removes first UI when the second UI appears

-- Animation Text Moves from Middle
TweenService:Create(AnimationText, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -200, 0.5, 0)}):Play()

task.wait(2.5)
MainFrame.Visible = true

TweenService:Create(SecondUI, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 0, 0, 0),
    Position = UDim2.new(0.5, 0, 0.5, 0)
}):Play()

task.wait(0.5)
SecondUI.Visible = false
AnimationFinished = true -- Animation is complete
HideButton.Visible = true -- Show hide/show UI button after animation

-- Dragging Support (Fixed for Delta Executor)
local Dragging, DragInput, StartPos, DragStart

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        DragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == DragInput and Dragging then
        local Delta = input.Position - DragStart
        MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)
