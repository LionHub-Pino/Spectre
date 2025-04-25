local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local VoiceChatService = game:GetService("VoiceChatService")

-- Biến cờ để ngăn script chạy lại
if _G.LionHubLoaded then
    return
end
_G.LionHubLoaded = true

-- Kiểm tra xem UI đã được tạo chưa để tránh loop
if playerGui:FindFirstChild("WindUI") then
    return
end

-- Tải WindUI Lib
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
    Title = "Krnl Mobile",
    Icon = "door-open",
    Author = "Pino_azure",
    Folder = "LionHubData",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HasOutline = false,
    KeySystem = { 
        Key = { "pino_ontop", "LionHub", "VietNam", "Seggay" },
        Note = "Nhập key chính xác để tiếp tục.",
        URL = "https://discord.gg/wmUmGVG6ut",
        SaveKey = true,
        Thumbnail = {
            Image = thumbnailImage,
            Title = "Lion Hub Key System"
        },
    },
})

-- Lưu tham chiếu ScreenGui để ẩn/hiện
local windUiGui = playerGui:FindFirstChild("WindUI") or Window.ScreenGui

-- Anti-AFK
spawn(function()
    while true do
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        wait(60)
    end
end)

-- Biến để theo dõi trạng thái
local ScriptStates = {}
local ToggleStates = {}
local ConfigFile = "LionHubData/ToggleStates.json"

-- Hàm lưu trạng thái công tắc
local function saveToggleStates()
    local data = {}
    for toggleName, state in pairs(ToggleStates) do
        data[toggleName] = state
    end
    local success, err = pcall(function()
        makefolder("LionHubData")
        writefile(ConfigFile, HttpService:JSONEncode(data))
    end)
    if not success then
        warn("Lỗi khi lưu trạng thái công tắc: " .. err)
    end
end

-- Hàm tải trạng thái công tắc
local function loadToggleStates()
    local success, data = pcall(function()
        if isfile(ConfigFile) then
            return HttpService:JSONDecode(readfile(ConfigFile))
        end
        return {}
    end)
    if success then
        for toggleName, state in pairs(data) do
            ToggleStates[toggleName] = state
        end
    else
        warn("Lỗi khi tải trạng thái công tắc: " .. tostring(data))
    end
end

-- Tải trạng thái công tắc khi khởi động
loadToggleStates()

-- Hàm để chạy hoặc dừng script
local function toggleScript(scriptName, url, enabled, notifyTitle, notifyIcon)
    if ToggleStates[scriptName] == enabled then
        return -- Ngăn chạy lại nếu trạng thái không thay đổi
    end
    ToggleStates[scriptName] = enabled
    saveToggleStates()
    
    if enabled then
        if not ScriptStates[scriptName] then
            WindUI:Notify({
                Title = notifyTitle,
                Content = "Đang chạy " .. scriptName .. "...",
                Icon = notifyIcon,
                Duration = 3,
            })
            pcall(function()
                loadstring(game:HttpGet(url))()
                ScriptStates[scriptName] = true
            end)
        else
            WindUI:Notify({
                Title = notifyTitle,
                Content = scriptName .. " đã được chạy trước đó!",
                Icon = notifyIcon,
                Duration = 3,
            })
        end
    else
        WindUI:Notify({
            Title = notifyTitle,
            Content = "Đã tắt " .. scriptName .. ". Lưu ý: Script có thể không dừng hoàn toàn.",
            Icon = notifyIcon,
            Duration = 3,
        })
        ScriptStates[scriptName] = false
    end
end

-- Tạo các tab với WindUI
local Tabs = {
    MainHub = Window:Tab({ Title = "Main Hub", Icon = "star", Desc = "Main Hub scripts." }),
    Kaitun = Window:Tab({ Title = "Kaitun", Icon = "flame", Desc = "Kaitun scripts." }),
    Main = Window:Tab({ Title = "Main", Icon = "shield", Desc = "Main features and scripts." }),
    AutoBounty = Window:Tab({ Title = "AutoBounty", Icon = "sword", Desc = "Automated bounty hunting features." }),
    Updates = Window:Tab({ Title = "Updates", Icon = "bell", Desc = "Update logs and details." }),
    Leviathan = Window:Tab({ Title = "Leviathan", Icon = "anchor", Desc = "Leviathan scripts and features." }),
}

-- Đảm bảo tab đầu tiên được chọn
Window:SelectTab(1)

-- Tab: Main Hub
Tabs.MainHub:Section({ Title = "Main Hub Script" })
local mainHubToggle = Tabs.MainHub:Toggle({
    Title = "MainHub",
    Desc = "Bật để chạy MainHub script",
    Value = ToggleStates["MainHub"] or false,
    Callback = function(enabled)
        toggleScript("MainHub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/mainhub.lua", enabled, "MainHub", "star")
    end
})
if ToggleStates["MainHub"] then
    toggleScript("MainHub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/mainhub.lua", true, "MainHub", "star")
end

Tabs.MainHub:Toggle({
    Title = "Auto Close UI",
    Desc = "Bật để ẩn UI (bật lại để hiện)",
    Value = ToggleStates["AutoCloseUI"] or false,
    Callback = function(enabled)
        ToggleStates["AutoCloseUI"] = enabled
        saveToggleStates()
        if enabled then
            WindUI:Notify({
                Title = "Auto Close UI",
                Content = "Đang ẩn UI...",
                Icon = "door-open",
                Duration = 2,
            })
            wait(2)
            local success, err = pcall(function()
                windUiGui.Enabled = false -- Ẩn UI
            end)
            if not success then
                WindUI:Notify({
                    Title = "Auto Close UI",
                    Content = "Lỗi khi ẩn UI: " .. tostring(err),
                    Icon = "door-open",
                    Duration = 5,
                })
            end
        else
            WindUI:Notify({
                Title = "Auto Close UI",
                Content = "Đang hiện UI...",
                Icon = "door-open",
                Duration = 2,
            })
            local success, err = pcall(function()
                windUiGui.Enabled = true -- Hiện UI
            end)
            if not success then
                WindUI:Notify({
                    Title = "Auto Close UI",
                    Content = "Lỗi khi hiện UI: " .. tostring(err),
                    Icon = "door-open",
                    Duration = 5,
                })
            end
        end
    end
})

-- Tab: Kaitun
Tabs.Kaitun:Section({ Title = "Kaitun Scripts" })
local kaitunToggle = Tabs.Kaitun:Toggle({
    Title = "Kaitun",
    Desc = "Bật để chạy Kaitun script",
    Value = ToggleStates["Kaitun"] or false,
    Callback = function(enabled)
        toggleScript("Kaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Kaitun.lua", enabled, "Kaitun", "flame")
    end
})
if ToggleStates["Kaitun"] then
    toggleScript("Kaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Kaitun.lua", true, "Kaitun", "flame")
end

local kaitunDFToggle = Tabs.Kaitun:Toggle({
    Title = "KaitunDF",
    Desc = "Bật để chạy KaitunDF script",
    Value = ToggleStates["KaitunDF"] or false,
    Callback = function(enabled)
        toggleScript("KaitunDF", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunDF.lua", enabled, "KaitunDF", "flame")
    end
})
if ToggleStates["KaitunDF"] then
    toggleScript("KaitunDF", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunDF.lua", true, "KaitunDF", "flame")
end

local marukaitunToggle = Tabs.Kaitun:Toggle({
    Title = "Marukaitun",
    Desc = "Bật để chạy Marukaitun-Mobile script",
    Value = ToggleStates["Marukaitun"] or false,
    Callback = function(enabled)
        toggleScript("Marukaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Marukaitun.lua", enabled, "Marukaitun", "flame")
    end
})
if ToggleStates["Marukaitun"] then
    toggleScript("Marukaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Marukaitun.lua", true, "Marukaitun", "flame")
end

local kaitunFischToggle = Tabs.Kaitun:Toggle({
    Title = "KaitunFisch",
    Desc = "Bật để chạy KaitunFisch script",
    Value = ToggleStates["KaitunFisch"] or false,
    Callback = function(enabled)
        toggleScript("KaitunFisch", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunfisch.lua", enabled, "KaitunFisch", "flame")
    end
})
if ToggleStates["KaitunFisch"] then
    toggleScript("KaitunFisch", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunfisch.lua", true, "KaitunFisch", "flame")
end

local kaitunAdToggle = Tabs.Kaitun:Toggle({
    Title = "KaitunAd",
    Desc = "Bật để chạy KaitunAd script",
    Value = ToggleStates["KaitunAd"] or false,
    Callback = function(enabled)
        toggleScript("KaitunAd", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunAd.lua", enabled, "KaitunAd", "flame")
    end
})
if ToggleStates["KaitunAd"] then
    toggleScript("KaitunAd", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunAd.lua", true, "KaitunAd", "flame")
end

local kaitunKIToggle = Tabs.Kaitun:Toggle({
    Title = "KaitunKI",
    Desc = "Bật để chạy KaitunKI script",
    Value = ToggleStates["KaitunKI"] or false,
    Callback = function(enabled)
        toggleScript("KaitunKI", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunKI.lua", enabled, "KaitunKI", "flame")
    end
})
if ToggleStates["KaitunKI"] then
    toggleScript("KaitunKI", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunKI.lua", true, "KaitunKI", "flame")
end

local kaitunARToggle = Tabs.Kaitun:Toggle({
    Title = "KaitunAR",
    Desc = "Bật để chạy KaitunAR script",
    Value = ToggleStates["KaitunAR"] or false,
    Callback = function(enabled)
        toggleScript("KaitunAR", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunar.lua", enabled, "KaitunAR", "flame")
    end
})
if ToggleStates["KaitunAR"] then
    toggleScript("KaitunAR", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunar.lua", true, "KaitunAR", "flame")
end

local kaitunAVToggle = Tabs.Kaitun:Toggle({
    Title = "KaitunAV",
    Desc = "Bật để chạy KaitunAV script",
    Value = ToggleStates["KaitunAV"] or false,
    Callback = function(enabled)
        toggleScript("KaitunAV", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunAV.lua", enabled, "KaitunAV", "flame")
    end
})
if ToggleStates["KaitunAV"] then
    toggleScript("KaitunAV", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunAV.lua", true, "KaitunAV", "flame")
end

-- Tab: Main
Tabs.Main:Section({ Title = "Scripts" })
local wAzureToggle = Tabs.Main:Toggle({
    Title = "W-Azure",
    Desc = "Bật để chạy W-Azure script (Locked)",
    Value = ToggleStates["W-Azure"] or false,
    Locked = true,
    Callback = function(enabled)
        WindUI:Notify({
            Title = "W-Azure",
            Content = "Nút này bị khóa, không thể chạy!",
            Icon = "shield",
            Duration = 3,
        })
    end
})

local maruHubToggle = Tabs.Main:Toggle({
    Title = "Maru Hub",
    Desc = "Bật để chạy Maru Hub-Mobile script",
    Value = ToggleStates["Maru Hub"] or false,
    Callback = function(enabled)
        toggleScript("Maru Hub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/maru.lua", enabled, "Maru Hub", "shield")
    end
})
if ToggleStates["Maru Hub"] then
    toggleScript("Maru Hub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/maru.lua", true, "Maru Hub", "shield")
end

local bananaHub1Toggle = Tabs.Main:Toggle({
    Title = "Banana Hub 1",
    Desc = "Bật để chạy Banana Hub (Version 1)",
    Value = ToggleStates["Banana Hub 1"] or false,
    Callback = function(enabled)
        toggleScript("Banana Hub 1", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana1.lua", enabled, "Banana Hub 1", "shield")
    end
})
if ToggleStates["Banana Hub 1"] then
    toggleScript("Banana Hub 1", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana1.lua", true, "Banana Hub 1", "shield")
end

local bananaHub2Toggle = Tabs.Main:Toggle({
    Title = "Banana Hub 2",
    Desc = "Bật để chạy Banana Hub (Version 2)",
    Value = ToggleStates["Banana Hub 2"] or false,
    Callback = function(enabled)
        toggleScript("Banana Hub 2", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana2.lua", enabled, "Banana Hub 2", "shield")
    end
})
if ToggleStates["Banana Hub 2"] then
    toggleScript("Banana Hub 2", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana2.lua", true, "Banana Hub 2", "shield")
end

local bananaHub3Toggle = Tabs.Main:Toggle({
    Title = "Banana Hub 3",
    Desc = "Bật để chạy Banana Hub (Version 3)",
    Value = ToggleStates["Banana Hub 3"] or false,
    Callback = function(enabled)
        toggleScript("Banana Hub 3", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana.lua", enabled, "Banana Hub 3", "shield")
    end
})
if ToggleStates["Banana Hub 3"] then
    toggleScript("Banana Hub 3", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana.lua", true, "Banana Hub 3", "shield")
end

-- Tab: AutoBounty
Tabs.AutoBounty:Section({ Title = "AutoBounty Features" })
local wAzureAutoBountyToggle = Tabs.AutoBounty:Toggle({
    Title = "W-Azure AutoBounty",
    Desc = "Bật để chạy W-Azure AutoBounty script",
    Value = ToggleStates["W-Azure AutoBounty"] or false,
    Callback = function(enabled)
        toggleScript("W-Azure AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/wazureBounty.lua", enabled, "W-Azure AutoBounty", "sword")
    end
})
if ToggleStates["W-Azure AutoBounty"] then
    toggleScript("W-Azure AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/wazureBounty.lua", true, "W-Azure AutoBounty", "sword")
end

local bananaAutoBountyToggle = Tabs.AutoBounty:Toggle({
    Title = "Banana AutoBounty",
    Desc = "Bật để chạy Banana AutoBounty script",
    Value = ToggleStates["Banana AutoBounty"] or false,
    Callback = function(enabled)
        toggleScript("Banana AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/AutoBounty.lua", enabled, "Banana AutoBounty", "sword")
    end
})
if ToggleStates["Banana AutoBounty"] then
    toggleScript("Banana AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/AutoBounty.lua", true, "Banana AutoBounty", "sword")
end

Tabs.AutoBounty:Button({
    Title = "Check Bounty",
    Desc = "Kiểm tra số tiền thưởng hiện tại",
    Callback = function()
        local bounty = 0
        pcall(function()
            bounty = player.Data.Bounty.Value
        end)
        WindUI:Notify({
            Title = "Bounty",
            Content = "Số tiền thưởng hiện tại: " .. tostring(bounty),
            Icon = "coin",
            Duration = 5,
        })
    end
})

-- Tab: Updates
Tabs.Updates:Section({ Title = "Update Logs" })
Tabs.Updates:Button({
    Title = "View Updates",
    Desc = "Xem nhật ký cập nhật",
    Callback = function()
        WindUI:Notify({
            Title = "Update Log - Part 1",
            Content = "- Hỗ trợ tiếng Anh và tiếng Việt\n- Hoạt động trên mọi client\n- Tương thích với tất cả client",
            Icon = "bell",
            Duration = 5,
        })
        wait(5.1)
        WindUI:Notify({
            Title = "Update Log - Part 2",
            Content = "- Hỗ trợ Android, iOS, PC\n- Script tiếng Việt cho người dùng Việt Nam",
            Icon = "bell",
            Duration = 5,
        })
        wait(5.1)
        WindUI:Notify({
            Title = "Update Log - Part 3",
            Content = "- Hỗ trợ công cụ\n- Cập nhật hàng tuần",
            Icon = "bell",
            Duration = 5,
        })
    end
})

-- Tab: Leviathan
Tabs.Leviathan:Section({ Title = "Leviathan Script" })
local leviathanToggle = Tabs.Leviathan:Toggle({
    Title = "Run Leviathan",
    Desc = "Bật để chạy Leviathan script",
    Value = ToggleStates["Leviathan"] or false,
    Callback = function(enabled)
        toggleScript("Leviathan", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Leviathan.lua", enabled, "Leviathan", "anchor")
    end
})
if ToggleStates["Leviathan"] then
    toggleScript("Leviathan", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Leviathan.lua", true, "Leviathan", "anchor")
end
