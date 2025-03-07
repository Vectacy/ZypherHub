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

-- Add "General" tab to the navigator
local GeneralButton = createNavButton("General", 2) -- New "General" Tab

-- Auto Farm UI
local AutoFarmFrame = Instance.new("Frame")
AutoFarmFrame.Parent = MainFrame
AutoFarmFrame.Size = UDim2.new(0.7, 0, 0.85, 0)
AutoFarmFrame.Position = UDim2.new(0.25, 0, 0.1, 0)
AutoFarmFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
AutoFarmFrame.BackgroundTransparency = 0.2 -- 80% Transparent
AutoFarmFrame.Visible = false

local AutoFarmCorner = Instance.new("UICorner")
AutoFarmCorner.CornerRadius = UDim.new(0, 12)
AutoFarmCorner.Parent = AutoFarmFrame

local AutoFarmLabel = Instance.new("TextLabel")
AutoFarmLabel.Parent = AutoFarmFrame
AutoFarmLabel.Size = UDim2.new(1, -20, 0, 30)
AutoFarmLabel.Position = UDim2.new(0, 10, 0, 10)
AutoFarmLabel.Text = "Auto Farm"
AutoFarmLabel.Font = Enum.Font.GothamBold
AutoFarmLabel.TextSize = 18
AutoFarmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmLabel.BackgroundTransparency = 1

local AutoFarmToggle = Instance.new("TextButton")
AutoFarmToggle.Parent = AutoFarmFrame
AutoFarmToggle.Size = UDim2.new(0, 120, 0, 40)
AutoFarmToggle.Position = UDim2.new(0, 20, 0, 50)
AutoFarmToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AutoFarmToggle.Text = "OFF"
AutoFarmToggle.Font = Enum.Font.GothamBold
AutoFarmToggle.TextSize = 18
AutoFarmToggle.TextColor3 = Color3.fromRGB(255, 255, 255)

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = AutoFarmToggle

local AutoFarmEnabled = false
AutoFarmToggle.MouseButton1Click:Connect(function()
    AutoFarmEnabled = not AutoFarmEnabled
    AutoFarmToggle.Text = AutoFarmEnabled and "ON" or "OFF"
    AutoFarmToggle.BackgroundColor3 = AutoFarmEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
end)

FootballButton.MouseButton1Click:Connect(function()
    AutoFarmFrame.Visible = false
end)

MiscButton.MouseButton1Click:Connect(function()
    AutoFarmFrame.Visible = false
end)

GeneralButton.MouseButton1Click:Connect(function()
    AutoFarmFrame.Visible = true
end)
