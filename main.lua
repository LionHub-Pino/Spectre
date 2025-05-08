--// Services
local UserInputService = game:GetService("UserInputService");--// Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/lates-lib/main/Main.lua"))()
local Window = Library:CreateWindow({
    Title = "Executor : Potassium | MAIN SCRIPT",
    Theme = "Dark",
    Size = UDim2.fromOffset(570, 370),
    Transparency = 0.2,
    Blurring = true,
    MinimizeKeybind = Enum.KeyCode.LeftAlt,
})local Themes = {
    Light = {
        Primary = Color3.fromRGB(232, 232, 232),
        Secondary = Color3.fromRGB(255, 255, 255),
        Component = Color3.fromRGB(245, 245, 245),
        Interactables = Color3.fromRGB(235, 235, 235),
        Tab = Color3.fromRGB(50, 50, 50),
        Title = Color3.fromRGB(0, 0, 0),
        Description = Color3.fromRGB(100, 100, 100),
        Shadow = Color3.fromRGB(255, 255, 255),
        Outline = Color3.fromRGB(210, 210, 210),
        Icon = Color3.fromRGB(100, 100, 100),
    },
    Dark = {
        Primary = Color3.fromRGB(30, 30, 30),
        Secondary = Color3.fromRGB(35, 35, 35),
        Component = Color3.fromRGB(40, 40, 40),
        Interactables = Color3.fromRGB(45, 45, 45),
        Tab = Color3.fromRGB(200, 200, 200),
        Title = Color3.fromRGB(240,240,240),
        Description = Color3.fromRGB(200,200,200),
        Shadow = Color3.fromRGB(0, 0, 0),
        Outline = Color3.fromRGB(40, 40, 40),
        Icon = Color3.fromRGB(220, 220, 220),
    },
    Void = {
        Primary = Color3.fromRGB(15, 15, 15),
        Secondary = Color3.fromRGB(20, 20, 20),
        Component = Color3.fromRGB(25, 25, 25),
        Interactables = Color3.fromRGB(30, 30, 30),
        Tab = Color3.fromRGB(200, 200, 200),
        Title = Color3.fromRGB(240,240,240),
        Description = Color3.fromRGB(200,200,200),
        Shadow = Color3.fromRGB(0, 0, 0),
        Outline = Color3.fromRGB(40, 40, 40),
        Icon = Color3.fromRGB(220, 220, 220),
    },
}--// Set the default theme
Window:SetTheme(Themes.Dark)--// Sections
Window:AddTabSection({
    Name = "Main",
    Order = 1,
})Window:AddTabSection({
    Name = "Settings",
    Order = 2,
})--// Tab [LION HUB] - Đặt ở đầu
local LionHubTab = Window:AddTab({
    Title = "Lion Hub",
    Section = "Main",
    Icon = "rbxassetid://11963373994"
})
Window:AddButton({
    Title = "MainHub",
    Description = "Chạy script Lion Hub",
    Tab = LionHubTab,
    Callback = function()
        local success, result = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/main/mainhub.lua")))
        Window:Notify({
            Title = success and "Thành công!" or "Lỗi!",
            Description = success and "MainHub đã chạy!" or ("Lỗi: " .. tostring(result)),
            Duration = 5
        })
    end,
})--// Tab [MARU HUB - VERSION MOBILE]
local MaruHubTab = Window:AddTab({
    Title = "Maru Hub - Version Mobile",
    Section = "Main",
    Icon = "rbxassetid://11963373994"
})
local maruHubScripts = {
    {Name = "Banana", File = "banana.lua"},
    {Name = "Banana1", File = "banana1.lua"},
    {Name = "Banana2", File = "banana2.lua"},
    {Name = "Wazure", File = "wazure.lua"},
    {Name = "Maru", File = "maru.lua"}
}
for _, script in ipairs(maruHubScripts) do
    Window:AddButton({
        Title = script.Name,
        Description = "Chạy script " .. script.Name,
        Tab = MaruHubTab,
        Callback = function()
            local success, result = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/main/" .. script.File)))
            Window:Notify({
                Title = success and "Thành công!" or "Lỗi!",
                Description = success and script.Name .. " đã chạy!" or ("Lỗi: " .. tostring(result)),
                Duration = 5
            })
        end,
    })
end--// Tab [AUTO BOUNTY]
local AutoBountyTab = Window:AddTab({
    Title = "Auto Bounty",
    Section = "Main",
    Icon = "rbxassetid://11963373994"
})
Window:AddButton({
    Title = "AutoBounty",
    Description = "Săn tiền thưởng tự động",
    Tab = AutoBountyTab,
    Callback = function()
        local success, result = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/main/AutoBounty.lua")))
        Window:Notify({
            Title = success and "Thành công!" or "Lỗi!",
            Description = success and "AutoBounty đã chạy!" or ("Lỗi: " .. tostring(result)),
            Duration = 5
        })
    end,
})
Window:AddButton({
    Title = "WazureBounty",
    Description = "Chạy script Wazure Bounty",
    Tab = AutoBountyTab,
    Callback = function()
        local success, result = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/main/wazureBounty.lua")))
        Window:Notify({
            Title = success and "Thành công!" or "Lỗi!",
            Description = success and "WazureBounty đã chạy!" or ("Lỗi: " .. tostring(result)),
            Duration = 5
        })
    end,
})--// Tab [KAITUN]
local KaitunTab = Window:AddTab({
    Title = "Kaitun",
    Section = "Main",
    Icon = "rbxassetid://11963373994"
})
local kaitunScripts = {
    {Name = "Kaitun", File = "Kaitun.lua"},
    {Name = "KaitunAd", File = "KaitunAd.lua"},
    {Name = "KaitunDf", File = "KaitunDf.lua"},
    {Name = "KaitunKl", File = "kaitunKl.lua"},
    {Name = "Kaitunar", File = "kaitunar.lua"},
    {Name = "Kaitunav", File = "kaitunav.lua"},
    {Name = "Kaitunfisch", File = "kaitunfisch.lua"},
    {Name = "Marukaitun", File = "Marukaitun.lua"}
}
for _, script in ipairs(kaitunScripts) do
    Window:AddButton({
        Title = script.Name,
        Description = "Chạy script " .. script.Name,
        Tab = KaitunTab,
        Callback = function()
            local success, result = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/main/" .. script.File)))
            Window:Notify({
                Title = success and "Thành công!" or "Lỗi!",
                Description = success and script.Name .. " đã chạy!" or ("Lỗi: " .. tostring(result)),
                Duration = 5
            })
        end,
    })
end--// Tab [LEVIATHAN] - Thêm mới
local LeviathanTab = Window:AddTab({
    Title = "Leviathan",
    Section = "Main",
    Icon = "rbxassetid://11963373994"
})
Window:AddButton({
    Title = "Leviathan",
    Description = "Chạy script Leviathan",
    Tab = LeviathanTab,
    Callback = function()
        local success, result = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/main/Leviathan.lua")))
        Window:Notify({
            Title = success and "Thành công!" or "Lỗi!",
            Description = success and "Leviathan đã chạy!" or ("Lỗi: " .. tostring(result)),
            Duration = 5
        })
    end,
})--// Tab [SETTINGS] - Giữ nguyên
local Settings = Window:AddTab({
    Title = "Settings",
    Section = "Settings",
    Icon = "rbxassetid://11293977610",
})Window:AddKeybind({
    Title = "Minimize Keybind",
    Description = "Set the keybind for Minimizing",
    Tab = Settings,
    Callback = function(Key) 
        Window:SetSetting("Keybind", Key)
    end,
}) Window:AddDropdown({
    Title = "Set Theme",
    Description = "Set the theme of the library!",
    Tab = Settings,
    Options = {
        ["Light Mode"] = "Light",
        ["Dark Mode"] = "Dark",
        ["Extra Dark"] = "Void",
    },
    Callback = function(Theme) 
        Window:SetTheme(Themes[Theme])
    end,
}) Window:AddToggle({
    Title = "UI Blur",
    Description = "If enabled, must have your Roblox graphics set to 8+ for it to work",
    Default = true,
    Tab = Settings,
    Callback = function(Boolean) 
        Window:SetSetting("Blur", Boolean)
    end,
}) Window:AddSlider({
    Title = "UI Transparency",
    Description = "Set the transparency of the UI",
    Tab = Settings,
    AllowDecimals = true,
    MaxValue = 1,
    Callback = function(Amount) 
        Window:SetSetting("Transparency", Amount)
    end,
}) Window:Notify({
    Title = "Hello World!",
    Description = "Press Left Alt to Minimize and Open the UI!", 
    Duration = 10
})--// Keybind Example
UserInputService.InputBegan:Connect(function(Key) 
    if Key == Keybind then
        warn("You have pressed the minimize keybind!");
    end
end)

