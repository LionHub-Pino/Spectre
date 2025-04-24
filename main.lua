local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Tải WindUI Lib (quay lại WindUI để hỗ trợ Key System)
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()

-- Kiểm tra thiết bị (mobile hay PC)
local isMobile = UserInputService.TouchEnabled

-- Chọn Asset ID dựa trên thiết bị
local thumbnailImage
if isMobile then
    thumbnailImage = "rbxassetid://5341014178" -- Ảnh cho mobile
else
    thumbnailImage = "rbxassetid://13953902891" -- Ảnh cho PC
end

-- Tạo cửa sổ WindUI với key system tích hợp
local Window = WindUI:CreateWindow({
    Title = "YOUR MOM",
    Icon = "door-open",
    Author = "Pino_azure",
    Folder = "LionHubData",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HasOutline = false,
    KeySystem = { 
        Key = { "pino_ontop", "LionHub", "VietNam" },
        Note = "Nhập key chính xác để tiếp tục.",
        URL = "https://discord.gg/wmUmGVG6ut",
        SaveKey = true,
        Thumbnail = {
            Image = thumbnailImage,
            Title = "Lion Hub Key System"
        },
    },
})

-- Tạo các tab với WindUI
local Tabs = {
    Main = Window:Tab({ Title = "Main", Icon = "shield", Desc = "Main features and scripts." }),
    Kaitun = Window:Tab({ Title = "Kaitun", Icon = "flame", Desc = "Kaitun scripts." }),
    AutoBounty = Window:Tab({ Title = "AutoBounty", Icon = "sword", Desc = "Automated bounty hunting features." }),
    Updates = Window:Tab({ Title = "Updates", Icon = "bell", Desc = "Update logs and details." }),
    Leviathan = Window:Tab({ Title = "Leviathan", Icon = "anchor", Desc = "Leviathan scripts and features." }),
}

-- Đảm bảo tab đầu tiên (Main) được chọn
Window:SelectTab(1)

-- Tab: Main
Tabs.Main:Section({ Title = "Scripts" })
Tabs.Main:Button({
    Title = "W-Azure",
    Desc = "Run W-Azure script (Locked)",
    Locked = true,
    Callback = function()
        -- Nút bị khóa nên không làm gì
    end
})
Tabs.Main:Button({
    Title = "Maru Hub",
    Desc = "Run Maru Hub-Mobile script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/maru.lua"))()
    end
})
Tabs.Main:Button({
    Title = "Banana Hub 1",
    Desc = "Run Banana Hub (Version 1)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana1.lua"))()
    end
})
Tabs.Main:Button({
    Title = "Banana Hub 2",
    Desc = "Run Banana Hub (Version 2)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana2.lua"))()
    end
})
Tabs.Main:Button({
    Title = "Banana Hub 3",
    Desc = "Run Banana Hub (Version 3)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana.lua"))()
    end
})

-- Tab: Kaitun
Tabs.Kaitun:Section({ Title = "Kaitun Scripts" })
Tabs.Kaitun:Button({
    Title = "Kaitun",
    Desc = "Run Kaitun script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Kaitun.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunDF",
    Desc = "Run KaitunDF script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunDF.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "Marukaitun",
    Desc = "Run Marukaitun-Mobile script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Marukaitun.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunFisch",
    Desc = "Run KaitunFisch script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunfisch.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunAd",
    Desc = "Run KaitunAd script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunAd.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunKI",
    Desc = "Run KaitunKI script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunKI.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunAR",
    Desc = "Run KaitunAR script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunar.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunAV",
    Desc = "Run KaitunAV script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunAV.lua"))()
    end
})

-- Tab: AutoBounty
Tabs.AutoBounty:Section({ Title = "AutoBounty Features" })
Tabs.AutoBounty:Button({
    Title = "W-Azure AutoBounty",
    Desc = "Run W-Azure AutoBounty script",
    Callback = function()
        WindUI:Notify({
            Title = "AutoBounty",
            Content = "Running W-Azure AutoBounty script...",
            Icon = "sword",
            Duration = 3,
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/wazureBounty.lua"))()
    end
})
Tabs.AutoBounty:Button({
    Title = "Banana AutoBounty",
    Desc = "Run Banana AutoBounty script",
    Callback = function()
        WindUI:Notify({
            Title = "AutoBounty",
            Content = "Running Banana AutoBounty script...",
            Icon = "sword",
            Duration = 3,
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/AutoBounty.lua"))()
    end
})

-- Tab: Updates
Tabs.Updates:Section({ Title = "Update Logs" })
Tabs.Updates:Button({
    Title = "View Updates",
    Callback = function()
        WindUI:Notify({
            Title = "Update Log - Part 1",
            Content = "- English-Vietnamese\n- Available on all clients\n- Works on all clients",
            Icon = "bell",
            Duration = 5,
        })
        wait(5.1)
        WindUI:Notify({
            Title = "Update Log - Part 2",
            Content = "- Android - iOS - PC\n- Supports Vietnamese scripts for Vietnamese users",
            Icon = "bell",
            Duration = 5,
        })
        wait(5.1)
        WindUI:Notify({
            Title = "Update Log - Part 3",
            Content = "- Tool support\n- Weekly updates",
            Icon = "bell",
            Duration = 5,
        })
    end
})

-- Tab: Leviathan
Tabs.Leviathan:Section({ Title = "Leviathan Script" })
Tabs.Leviathan:Button({
    Title = "Run Leviathan",
    Desc = "Execute the Leviathan script",
    Callback = function()
        WindUI:Notify({
            Title = "Leviathan",
            Content = "Running Leviathan script...",
            Icon = "anchor",
            Duration = 3,
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Leviathan.lua"))()
    end
})
