-- Tải thư viện Orion
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Tạo cửa sổ Orion với Key System mặc định
local Window = OrionLib:MakeWindow({
    Name = "Lion-Hub",
    IntroText = "Chào Mừng Đến Với LionHub by @Pino_Azure",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "LionHubConfig",
    IntroEnabled = true, -- Bật Key System
    IntroKey = "Pino_Ontop" -- Key mặc định
})

-- Tab: Update Log
local UpdateTab = Window:MakeTab({
    Name = "Update Log",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})
UpdateTab:AddLabel("English-Vietnam")
UpdateTab:AddLabel("Available on all clients")
UpdateTab:AddLabel("Dùng Được trên tất cả client")
UpdateTab:AddLabel("Android -IOS -PC")
UpdateTab:AddLabel("Support Vietnamese script for Vietnamese people")
UpdateTab:AddLabel("Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt")
UpdateTab:AddLabel("Support tools")
UpdateTab:AddLabel("Hỗ Trợ các công cụ")

-- Tab: Main
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})
MainTab:AddButton({
    Name = "W-Azure",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/wazure.lua"))()
    end
})
MainTab:AddButton({
    Name = "Maru Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/maru.lua"))()
    end
})
MainTab:AddButton({
    Name = "Banana Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/banana.lua"))()
    end
})

-- Khởi tạo Orion
OrionLib:Init()

-- Thông báo chào mừng (tùy chọn)
OrionLib:MakeNotification({
    Name = "Lion-Hub",
    Content = "Nhập key 'Pino_Ontop' để truy cập!",
    Image = "rbxassetid://4483362458",
    Time = 5
})
