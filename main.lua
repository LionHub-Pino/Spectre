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
if playerGui:FindFirstChild("FluentUI") then
    return
end

-- Tải Fluent UI Lib
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Kiểm tra thiết bị (mobile hay PC)
local isMobile = UserInputService.TouchEnabled

-- Chọn Asset ID dựa trên thiết bị
local thumbnailImage
if isMobile then
    thumbnailImage = "rbxassetid://5341014178" -- Ảnh cho mobile
else
    thumbnailImage = "rbxassetid://13953902891" -- Ảnh cho PC
end

-- Tạo cửa sổ Fluent UI
local Window = Fluent:CreateWindow({
    Title = "Krnl Mobile",
    SubTitle = "by Pino_azure",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "Dark",
    Acrylic = true,
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Lưu tham chiếu ScreenGui để ẩn/hiện
local fluentUiGui = Window.ScreenGui

-- Key System
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Danh sách key hợp lệ
local validKeys = { "pino_ontop", "LionHub", "VietNam", "Seggay" }

-- Lấy key từ getgenv()
getgenv().Key = "7850effa4147304aa1da207a" -- Key sẽ được lấy từ main.lua

-- Kiểm tra key hợp lệ
if not table.find(validKeys, getgenv().Key) then
    Fluent:Notify({
        Title = "Key System",
        Content = "Key không hợp lệ! Vui lòng kiểm tra lại.",
        Duration = 5
    })
    game:Shutdown()
    return
else
    Fluent:Notify({
        Title = "Key System",
        Content = "Key hợp lệ! Đang tải UI...",
        Duration = 3
    })
end

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
            Fluent:Notify({
                Title = notifyTitle,
                Content = "Đang chạy " .. scriptName .. "...",
                Duration = 3
            })
            pcall(function()
                loadstring(game:HttpGet(url))()
                ScriptStates[scriptName] = true
            end)
        else
            Fluent:Notify({
                Title = notifyTitle,
                Content = scriptName .. " đã được chạy trước đó!",
                Duration = 3
            })
        end
    else
        Fluent:Notify({
            Title = notifyTitle,
            Content = "Đã tắt " .. scriptName .. ". Lưu ý: Script có thể không dừng hoàn toàn.",
            Duration = 3
        })
        ScriptStates[scriptName] = false
    end
end

-- Tạo các tab với Fluent UI
local Tabs = {
    MainHub = Window:AddTab({ Title = "Main Hub", Icon = "lucide-star" }),
    Kaitun = Window:AddTab({ Title = "Kaitun", Icon = "lucide-flame" }),
    Main = Window:AddTab({ Title = "Main", Icon = "lucide-shield" }),
    AutoBounty = Window:AddTab({ Title = "AutoBounty", Icon = "lucide-sword" }),
    Updates = Window:AddTab({ Title = "Updates", Icon = "lucide-bell" }),
    Leviathan = Window:AddTab({ Title = "Leviathan", Icon = "lucide-anchor" })
}

-- Đảm bảo tab đầu tiên được chọn
Window:SelectTab(1)

-- Tab: Main Hub
Tabs.MainHub:AddSection("Main Hub Script")
local mainHubToggle = Tabs.MainHub:AddToggle("MainHubToggle", {
    Title = "MainHub",
    Description = "Bật để chạy MainHub script",
    Default = ToggleStates["MainHub"] or false
})
mainHubToggle:OnChanged(function(value)
    toggleScript("MainHub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/mainhub.lua", value, "MainHub", "lucide-star")
end)
if ToggleStates["MainHub"] then
    toggleScript("MainHub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/mainhub.lua", true, "MainHub", "lucide-star")
end

Tabs.MainHub:AddToggle("AutoCloseUIToggle", {
    Title = "Auto Close UI",
    Description = "Bật để ẩn UI (bật lại để hiện)",
    Default = ToggleStates["AutoCloseUI"] or false
}):OnChanged(function(value)
    ToggleStates["AutoCloseUI"] = value
    saveToggleStates()
    if value then
        Fluent:Notify({
            Title = "Auto Close UI",
            Content = "Đang ẩn UI...",
            Duration = 2
        })
        wait(2)
        local success, err = pcall(function()
            fluentUiGui.Enabled = false -- Ẩn UI
        end)
        if not success then
            Fluent:Notify({
                Title = "Auto Close UI",
                Content = "Lỗi khi ẩn UI: " .. tostring(err),
                Duration = 5
            })
        end
    else
        Fluent:Notify({
            Title = "Auto Close UI",
            Content = "Đang hiện UI...",
            Duration = 2
        })
        local success, err = pcall(function()
            fluentUiGui.Enabled = true -- Hiện UI
        end)
        if not success then
            Fluent:Notify({
                Title = "Auto Close UI",
                Content = "Lỗi khi hiện UI: " .. tostring(err),
                Duration = 5
            })
        end
    end
})

-- Tab: Kaitun
Tabs.Kaitun:AddSection("Kaitun Scripts")
local kaitunToggle = Tabs.Kaitun:AddToggle("KaitunToggle", {
    Title = "Kaitun",
    Description = "Bật để chạy Kaitun script",
    Default = ToggleStates["Kaitun"] or false
})
kaitunToggle:OnChanged(function(value)
    toggleScript("Kaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Kaitun.lua", value, "Kaitun", "lucide-flame")
end)
if ToggleStates["Kaitun"] then
    toggleScript("Kaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Kaitun.lua", true, "Kaitun", "lucide-flame")
end

local kaitunDFToggle = Tabs.Kaitun:AddToggle("KaitunDFToggle", {
    Title = "KaitunDF",
    Description = "Bật để chạy KaitunDF script",
    Default = ToggleStates["KaitunDF"] or false
})
kaitunDFToggle:OnChanged(function(value)
    toggleScript("KaitunDF", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunDF.lua", value, "KaitunDF", "lucide-flame")
end)
if ToggleStates["KaitunDF"] then
    toggleScript("KaitunDF", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunDF.lua", true, "KaitunDF", "lucide-flame")
end

local marukaitunToggle = Tabs.Kaitun:AddToggle("MarukaitunToggle", {
    Title = "Marukaitun",
    Description = "Bật để chạy Marukaitun-Mobile script",
    Default = ToggleStates["Marukaitun"] or false
})
marukaitunToggle:OnChanged(function(value)
    toggleScript("Marukaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Marukaitun.lua", value, "Marukaitun", "lucide-flame")
end)
if ToggleStates["Marukaitun"] then
    toggleScript("Marukaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Marukaitun.lua", true, "Marukaitun", "lucide-flame")
end

local kaitunFischToggle = Tabs.Kaitun:AddToggle("KaitunFischToggle", {
    Title = "KaitunFisch",
    Description = "Bật để chạy KaitunFisch script",
    Default = ToggleStates["KaitunFisch"] or false
})
kaitunFischToggle:OnChanged(function(value)
    toggleScript("KaitunFisch", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunfisch.lua", value, "KaitunFisch", "lucide-flame")
end)
if ToggleStates["KaitunFisch"] then
    toggleScript("KaitunFisch", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunfisch.lua", true, "KaitunFisch", "lucide-flame")
end

local kaitunAdToggle = Tabs.Kaitun:AddToggle("KaitunAdToggle", {
    Title = "KaitunAd",
    Description = "Bật để chạy KaitunAd script",
    Default = ToggleStates["KaitunAd"] or false
})
kaitunAdToggle:OnChanged(function(value)
    toggleScript("KaitunAd", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunAd.lua", value, "KaitunAd", "lucide-flame")
end)
if ToggleStates["KaitunAd"] then
    toggleScript("KaitunAd", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunAd.lua", true, "KaitunAd", "lucide-flame")
end

local kaitunKIToggle = Tabs.Kaitun:AddToggle("KaitunKIToggle", {
    Title = "KaitunKI",
    Description = "Bật để chạy KaitunKI script",
    Default = ToggleStates["KaitunKI"] or false
})
kaitunKIToggle:OnChanged(function(value)
    toggleScript("KaitunKI", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunKI.lua", value, "KaitunKI", "lucide-flame")
end)
if ToggleStates["KaitunKI"] then
    toggleScript("KaitunKI", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunKI.lua", true, "KaitunKI", "lucide-flame")
end

local kaitunARToggle = Tabs.Kaitun:AddToggle("KaitunARToggle", {
    Title = "KaitunAR",
    Description = "Bật để chạy KaitunAR script",
    Default = ToggleStates["KaitunAR"] or false
})
kaitunARToggle:OnChanged(function(value)
    toggleScript("KaitunAR", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunar.lua", value, "KaitunAR", "lucide-flame")
end)
if ToggleStates["KaitunAR"] then
    toggleScript("KaitunAR", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunar.lua", true, "KaitunAR", "lucide-flame")
end

local kaitunAVToggle = Tabs.Kaitun:AddToggle("KaitunAVToggle", {
    Title = "KaitunAV",
    Description = "Bật để chạy KaitunAV script",
    Default = ToggleStates["KaitunAV"] or false
})
kaitunAVToggle:OnChanged(function(value)
    toggleScript("KaitunAV", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunAV.lua", value, "KaitunAV", "lucide-flame")
end)
if ToggleStates["KaitunAV"] then
    toggleScript("KaitunAV", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunAV.lua", true, "KaitunAV", "lucide-flame")
end

-- Tab: Main
Tabs.Main:AddSection("Scripts")
local wAzureToggle = Tabs.Main:AddToggle("WAzureToggle", {
    Title = "W-Azure",
    Description = "Bật để chạy W-Azure script (Locked)",
    Default = ToggleStates["W-Azure"] or false,
    Disabled = true
})
wAzureToggle:OnChanged(function(value)
    Fluent:Notify({
        Title = "W-Azure",
        Content = "Nút này bị khóa, không thể chạy!",
        Duration = 3
    })
end)

local maruHubToggle = Tabs.Main:AddToggle("MaruHubToggle", {
    Title = "Maru Hub",
    Description = "Bật để chạy Maru Hub-Mobile script",
    Default = ToggleStates["Maru Hub"] or false
})
maruHubToggle:OnChanged(function(value)
    toggleScript("Maru Hub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/maru.lua", value, "Maru Hub", "lucide-shield")
end)
if ToggleStates["Maru Hub"] then
    toggleScript("Maru Hub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/maru.lua", true, "Maru Hub", "lucide-shield")
end

local bananaHub1Toggle = Tabs.Main:AddToggle("BananaHub1Toggle", {
    Title = "Banana Hub 1",
    Description = "Bật để chạy Banana Hub (Version 1)",
    Default = ToggleStates["Banana Hub 1"] or false
})
bananaHub1Toggle:OnChanged(function(value)
    toggleScript("Banana Hub 1", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana1.lua", value, "Banana Hub 1", "lucide-shield")
end)
if ToggleStates["Banana Hub 1"] then
    toggleScript("Banana Hub 1", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana1.lua", true, "Banana Hub 1", "lucide-shield")
end

local bananaHub2Toggle = Tabs.Main:AddToggle("BananaHub2Toggle", {
    Title = "Banana Hub 2",
    Description = "Bật để chạy Banana Hub (Version 2)",
    Default = ToggleStates["Banana Hub 2"] or false
})
bananaHub2Toggle:OnChanged(function(value)
    toggleScript("Banana Hub 2", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana2.lua", value, "Banana Hub 2", "lucide-shield")
end)
if ToggleStates["Banana Hub 2"] then
    toggleScript("Banana Hub 2", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana2.lua", true, "Banana Hub 2", "lucide-shield")
end

local bananaHub3Toggle = Tabs.Main:AddToggle("BananaHub3Toggle", {
    Title = "Banana Hub 3",
    Description = "Bật để chạy Banana Hub (Version 3)",
    Default = ToggleStates["Banana Hub 3"] or false
})
bananaHub3Toggle:OnChanged(function(value)
    toggleScript("Banana Hub 3", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana.lua", value, "Banana Hub 3", "lucide-shield")
end)
if ToggleStates["Banana Hub 3"] then
    toggleScript("Banana Hub 3", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana.lua", true, "Banana Hub 3", "lucide-shield")
end

-- Tab: AutoBounty
Tabs.AutoBounty:AddSection("AutoBounty Features")
local wAzureAutoBountyToggle = Tabs.AutoBounty:AddToggle("WAzureAutoBountyToggle", {
    Title = "W-Azure AutoBounty",
    Description = "Bật để chạy W-Azure AutoBounty script",
    Default = ToggleStates["W-Azure AutoBounty"] or false
})
wAzureAutoBountyToggle:OnChanged(function(value)
    toggleScript("W-Azure AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/wazureBounty.lua", value, "W-Azure AutoBounty", "lucide-sword")
end)
if ToggleStates["W-Azure AutoBounty"] then
    toggleScript("W-Azure AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/wazureBounty.lua", true, "W-Azure AutoBounty", "lucide-sword")
end

local bananaAutoBountyToggle = Tabs.AutoBounty:AddToggle("BananaAutoBountyToggle", {
    Title = "Banana AutoBounty",
    Description = "Bật để chạy Banana AutoBounty script",
    Default = ToggleStates["Banana AutoBounty"] or false
})
bananaAutoBountyToggle:OnChanged(function(value)
    toggleScript("Banana AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/AutoBounty.lua", value, "Banana AutoBounty", "lucide-sword")
end)
if ToggleStates["Banana AutoBounty"] then
    toggleScript("Banana AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/AutoBounty.lua", true, "Banana AutoBounty", "lucide-sword")
end

Tabs.AutoBounty:AddButton({
    Title = "Check Bounty",
    Description = "Kiểm tra số tiền thưởng hiện tại",
    Callback = function()
        local bounty = 0
        pcall(function()
            bounty = player.Data.Bounty.Value
        end)
        Fluent:Notify({
            Title = "Bounty",
            Content = "Số tiền thưởng hiện tại: " .. tostring(bounty),
            Duration = 5
        })
    end
})

-- Tab: Updates
Tabs.Updates:AddSection("Update Logs")
Tabs.Updates:AddButton({
    Title = "View Updates",
    Description = "Xem nhật ký cập nhật",
    Callback = function()
        Fluent:Notify({
            Title = "Update Log - Part 1",
            Content = "- Hỗ trợ tiếng Anh và tiếng Việt\n- Hoạt động trên mọi client\n- Tương thích với tất cả client",
            Duration = 5
        })
        wait(5.1)
        Fluent:Notify({
            Title = "Update Log - Part 2",
            Content = "- Hỗ trợ Android, iOS, PC\n- Script tiếng Việt cho người dùng Việt Nam",
            Duration = 5
        })
        wait(5.1)
        Fluent:Notify({
            Title = "Update Log - Part 3",
            Content = "- Hỗ trợ công cụ\n- Cập nhật hàng tuần",
            Duration = 5
        })
    end
})

-- Tab: Leviathan
Tabs.Leviathan:AddSection("Leviathan Script")
local leviathanToggle = Tabs.Leviathan:AddToggle("LeviathanToggle", {
    Title = "Run Leviathan",
    Description = "Bật để chạy Leviathan script",
    Default = ToggleStates["Leviathan"] or false
})
leviathanToggle:OnChanged(function(value)
    toggleScript("Leviathan", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Leviathan.lua", value, "Leviathan", "lucide-anchor")
end)
if ToggleStates["Leviathan"] then
    toggleScript("Leviathan", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Leviathan.lua", true, "Leviathan", "lucide-anchor")
end
