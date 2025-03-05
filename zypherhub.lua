local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Header = Instance.new("TextLabel")
local FarmButton = Instance.new("TextButton")

-- Parent UI to Player's GUI
ScreenGui.Parent = game:GetService("CoreGui")

-- Main UI Frame (Bigger Size)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Dark background
MainFrame.Size = UDim2.new(0, 500, 0, 300) -- Increased size
MainFrame.Position = UDim2.new(0.5, -250, 0.3, 0) -- Centered
MainFrame.BorderSizePixel = 0

-- Header
Header.Name = "Header"
Header.Parent = MainFrame
Header.BackgroundColor3 = Color3.fromRGB(180, 120, 30) -- Gold color
Header.Size = UDim2.new(1, 0, 0, 35) -- Slightly taller
Header.Font = Enum.Font.GothamBold
Header.Text = "Kingmod iOS - v1.0"
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.TextSize = 20
Header.BorderSizePixel = 0

-- "Farm" Button (Like "Player ESP" in Kingmod UI)
FarmButton.Name = "FarmButton"
FarmButton.Parent = MainFrame
FarmButton.BackgroundColor3 = Color3.fromRGB(255, 170, 80) -- Orange color
FarmButton.Size = UDim2.new(0, 100, 0, 30)
FarmButton.Position = UDim2.new(0, 10, 0, 45) -- Adjusted below header
FarmButton.Font = Enum.Font.GothamBold
FarmButton.Text = "Farm"
FarmButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FarmButton.TextSize = 16
FarmButton.BorderSizePixel = 0

print("Updated UI Loaded Successfully!")
