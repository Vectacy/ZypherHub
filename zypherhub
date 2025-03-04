-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- Create Main Window
local Window = Rayfield:CreateWindow({
    Name = "VNHAX Script Beta",
    LoadingTitle = "Loading VNHAX Script...",
    LoadingSubtitle = "Please wait...",
    ConfigurationSaving = { Enabled = true, FolderName = "VNHAX" },
    Discord = { Enabled = false }
})

-- Colors
local TitleColor = Color3.fromRGB(225, 152, 37) -- Orange Title
local DescColor = Color3.fromRGB(110, 198, 255) -- Light Blue Description

-- Function to create categories
function CreateCategory(Name)
    return Window:CreateTab({ Name = Name, Icon = "" }) -- No icon, just text
end

-- Function to add description
function AddDescription(Category, Text)
    local Label = Category:CreateLabel(Text)
    Label.TextColor3 = DescColor
end

-- Function to add toggle button
function AddToggle(Category, Name, Description, Callback)
    local Toggle = Category:CreateToggle({
        Name = Name,
        CurrentValue = false,
        Flag = Name,
        Callback = function(Value)
            Callback(Value)
        end
    })
end

-- Anti-Cheat Bypass Function
function BypassAntiCheat()
    -- Disables basic anti-cheat checks
    if game:GetService("Players").LocalPlayer then
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local oldNamecall = mt.__namecall

        mt.__namecall = newcclosure(function(self, ...)
            local args = {...}
            local method = getnamecallmethod()
            if method == "Kick" or method == "Ban" then
                return nil -- Prevents kick or ban functions from executing
            end
            return oldNamecall(self, ...)
        end)

        setreadonly(mt, true)
    end
end

-- FARM CATEGORY
local FarmTab = CreateCategory("Farm")
AddDescription(FarmTab, "• Auto Farm")

AddToggle(FarmTab, "Auto Farm", "Automatically farms enemies", function(Value)
    if Value then
        print("Auto Farm Enabled")
        BypassAntiCheat()
        while Value and wait(1) do
            -- Insert auto farm logic here (e.g., attack NPCs, teleport, etc.)
            print("Farming...")
        end
    else
        print("Auto Farm Disabled")
    end
end)

AddDescription(FarmTab, "• Get Quest")

AddToggle(FarmTab, "Get Quest", "Automatically gets quests before farming", function(Value)
    if Value then
        print("Get Quest Enabled")
        BypassAntiCheat()
        -- Insert quest automation script here
    else
        print("Get Quest Disabled")
    end
end)

-- BOSSES CATEGORY
local BossTab = CreateCategory("Bosses")
AddDescription(BossTab, "• Defeat bosses efficiently")

-- SEA EVENTS CATEGORY
local SeaTab = CreateCategory("Sea Events")
AddDescription(SeaTab, "• Auto navigate through sea events")

-- VISUAL CATEGORY
local VisualTab = CreateCategory("Visual")
AddDescription(VisualTab, "• Enhance visuals for better experience")

-- ITEMS CATEGORY
local ItemsTab = CreateCategory("Items")
AddDescription(ItemsTab, "• Auto Collect Items")

-- PVP CATEGORY
local PvPTab = CreateCategory("PVP")
AddDescription(PvPTab, "• PVP Tool")

-- TRAVEL CATEGORY
local TravelTab = CreateCategory("Travel")
AddDescription(TravelTab, "• Travel to any island")

-- FRUITS CATEGORY
local FruitsTab = CreateCategory("Fruits")
AddDescription(FruitsTab, "• Manage and buy fruits efficiently")

-- SETTINGS CATEGORY
local SettingsTab = CreateCategory("Settings")
AddDescription(SettingsTab, "• Adjust script configurations")

-- SHOP CATEGORY
local ShopTab = CreateCategory("Shop")
AddDescription(ShopTab, "• Access shop features")

Rayfield:Notify({
    Title = "VNHAX Script Beta",
    Content = "Script loaded successfully!",
    Duration = 5,
    Image = nil,
    Actions = { Ignore = { Name = "OK", Callback = function() end } }
})
