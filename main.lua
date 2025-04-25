repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Kiểm tra getgenv()
if not getgenv then
    game.Players.LocalPlayer:Kick("Executor không hỗ trợ getgenv()! Vui lòng dùng executor như Synapse X hoặc Arceus X.")
    return
end

getgenv().Key = "pino_ontop"

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService") or error("Không thể lấy RunService!")
local UserInputService = game:GetService("UserInputService") or error("Không thể lấy UserInputService!")
local HttpService = game:GetService("HttpService") or error("Không thể lấy HttpService!")
local TeleportService = game:GetService("TeleportService") or error("Không thể lấy TeleportService!")
local VoiceChatService = game:GetService("VoiceChatService") or error("Không thể lấy VoiceChatService!")

if _G.LionHubLoaded then
    return
end
_G.LionHubLoaded = true

if playerGui:FindFirstChild("FluentUI") then
    return
end

local ValidKeys = { "pino_ontop", "LionHub", "VietNam", "Seggay" }
if not getgenv().Key or not table.find(ValidKeys, getgenv().Key) then
    game.Players.LocalPlayer:Kick("Key không hợp lệ! Vui lòng nhập key đúng: pino_ontop, LionHub, VietNam, hoặc Seggay.")
    return
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = Fluent.SaveManager
local InterfaceManager = Fluent.InterfaceManager

local Options = Fluent.Options
local Window = Fluent:CreateWindow({
    Title = "Krnl Mobile | Lion Hub",
    SubTitle = "by Pino_azure",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local isMobile = UserInputService.TouchEnabled

local fluentGui = playerGui:FindFirstChild("FluentUI") or Window.ScreenGui

-- Tạo nút bật/tắt UI ở ngoài Fluent UI
local toggleGui = Instance.new("ScreenGui")
toggleGui.Name = "ToggleUIGui"
toggleGui.Parent = playerGui
toggleGui.ResetOnSpawn = false

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Text = "Toggle UI"
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Parent = toggleGui
toggleButton.MouseButton1Click:Connect(function()
    fluentGui.Enabled = not fluentGui.Enabled
    Fluent:Notify({
        Title = "Toggle UI",
        Content = fluentGui.Enabled and "Đã hiện UI" or "Đã ẩn UI",
        Duration = 2
    })
end)

-- Chống AFK
spawn(function()
    while true do
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        wait(60)
    end
end)

local ScriptStates = {}
local ToggleStates = {}
local ConfigFile = "LionHubData/ToggleStates.json"

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

loadToggleStates()

local function toggleScript(scriptName, url, enabled, notifyTitle)
    if ToggleStates[scriptName] == enabled then
        return
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

local Tabs = {
    MainHub = Window:AddTab({ Title = "Main Hub", Icon = "star" }),
    Kaitun = Window:AddTab({ Title = "Kaitun", Icon = "flame" }),
    Main = Window:AddTab({ Title = "Main", Icon = "shield" }),
    AutoBounty = Window:AddTab({ Title = "AutoBounty", Icon = "sword" }),
    Updates = Window:AddTab({ Title = "Updates", Icon = "bell" }),
    Leviathan = Window:AddTab({ Title = "Leviathan", Icon = "anchor" })
}

Window:SelectTab(1)

local mainHubSection = Tabs.MainHub:AddSection("Main Hub Script")
mainHubSection:AddToggle("MainHubToggle", {
    Title = "MainHub",
    Description = "Bật để chạy MainHub script",
    Default = ToggleStates["MainHub"] or false,
    Callback = function(value)
        toggleScript("MainHub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/mainhub.lua", value, "MainHub")
    end
})
if ToggleStates["MainHub"] then
    toggleScript("MainHub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/mainhub.lua", true, "MainHub")
end

local kaitunSection = Tabs.Kaitun:AddSection("Kaitun Scripts")
kaitunSection:AddToggle("KaitunToggle", {
    Title = "Kaitun",
    Description = "Bật để chạy Kaitun script",
    Default = ToggleStates["Kaitun"] or false,
    Callback = function(value)
        toggleScript("Kaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Kaitun.lua", value, "Kaitun")
    end
})
if ToggleStates["Kaitun"] then
    toggleScript("Kaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Kaitun.lua", true, "Kaitun")
end

kaitunSection:AddToggle("KaitunDFToggle", {
    Title = "KaitunDF",
    Description = "Bật để chạy KaitunDF script",
    Default = ToggleStates["KaitunDF"] or false,
    Callback = function(value)
        toggleScript("KaitunDF", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunDF.lua", value, "KaitunDF")
    end
})
if ToggleStates["KaitunDF"] then
    toggleScript("KaitunDF", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunDF.lua", true, "KaitunDF")
end

kaitunSection:AddToggle("MarukaitunToggle", {
    Title = "Marukaitun",
    Description = "Bật để chạy Marukaitun-Mobile script",
    Default = ToggleStates["Marukaitun"] or false,
    Callback = function(value)
        toggleScript("Marukaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Marukaitun.lua", value, "Marukaitun")
    end
})
if ToggleStates["Marukaitun"] then
    toggleScript("Marukaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Marukaitun.lua", true, "Marukaitun")
end

kaitunSection:AddToggle("KaitunFischToggle", {
    Title = "KaitunFisch",
    Description = "Bật để chạy KaitunFisch script",
    Default = ToggleStates["KaitunFisch"] or false,
    Callback = function(value)
        toggleScript("KaitunFisch", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunfisch.lua", value, "KaitunFisch")
    end
})
if ToggleStates["KaitunFisch"] then
    toggleScript("KaitunFisch", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunfisch.lua", true, "KaitunFisch")
end

kaitunSection:AddToggle("KaitunAdToggle", {
    Title = "KaitunAd",
    Description = "Bật để chạy KaitunAd script",
    Default = ToggleStates["KaitunAd"] or false,
    Callback = function(value)
        toggleScript("KaitunAd", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunAd.lua", value, "KaitunAd")
    end
})
if ToggleStates["KaitunAd"] then
    toggleScript("KaitunAd", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunAd.lua", true, "KaitunAd")
end

kaitunSection:AddToggle("KaitunKIToggle", {
    Title = "KaitunKI",
    Description = "Bật để chạy KaitunKI script",
    Default = ToggleStates["KaitunKI"] or false,
    Callback = function(value)
        toggleScript("KaitunKI", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunKI.lua", value, "KaitunKI")
    end
})
if ToggleStates["KaitunKI"] then
    toggleScript("KaitunKI", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunKI.lua", true, "KaitunKI")
end

kaitunSection:AddToggle("KaitunARToggle", {
    Title = "KaitunAR",
    Description = "Bật để chạy KaitunAR script",
    Default = ToggleStates["KaitunAR"] or false,
    Callback = function(value)
        toggleScript("KaitunAR", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunar.lua", value, "KaitunAR")
    end
})
if ToggleStates["KaitunAR"] then
    toggleScript("KaitunAR", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunar.lua", true, "KaitunAR")
end

kaitunSection:AddToggle("KaitunAVToggle", {
    Title = "KaitunAV",
    Description = "Bật để chạy KaitunAV script",
    Default = ToggleStates["KaitunAV"] or false,
    Callback = function(value)
        toggleScript("KaitunAV", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunAV.lua", value, "KaitunAV")
    end
})
if ToggleStates["KaitunAV"] then
    toggleScript("KaitunAV", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunAV.lua", true, "KaitunAV")
end

local mainSection = Tabs.Main:AddSection("Scripts")
mainSection:AddToggle("WAzureToggle", {
    Title = "W-Azure",
    Description = "Bật để chạy W-Azure script (Locked)",
    Default = ToggleStates["W-Azure"] or false,
    Disabled = true,
    Callback = function(value)
        Fluent:Notify({
            Title = "W-Azure",
            Content = "Nút này bị khóa, không thể chạy!",
            Duration = 3
        })
    end
})

mainSection:AddToggle("MaruHubToggle", {
    Title = "Maru Hub",
    Description = "Bật để chạy Maru Hub-Mobile script",
    Default = ToggleStates["Maru Hub"] or false,
    Callback = function(value)
        toggleScript("Maru Hub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/maru.lua", value, "Maru Hub")
    end
})
if ToggleStates["Maru Hub"] then
    toggleScript("Maru Hub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/maru.lua", true, "Maru Hub")
end

mainSection:AddToggle("BananaHub1Toggle", {
    Title = "Banana Hub 1",
    Description = "Bật để chạy Banana Hub (Version 1)",
    Default = ToggleStates["Banana Hub 1"] or false,
    Callback = function(value)
        toggleScript("Banana Hub 1", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana1.lua", value, "Banana Hub 1")
    end
})
if ToggleStates["Banana Hub 1"] then
    toggleScript("Banana Hub 1", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana1.lua", true, "Banana Hub 1")
end

mainSection:AddToggle("BananaHub2Toggle", {
    Title = "Banana Hub 2",
    Description = "Bật để chạy Banana Hub (Version 2)",
    Default = ToggleStates["Banana Hub 2"] or false,
    Callback = function(value)
        toggleScript("Banana Hub 2", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana2.lua", value, "Banana Hub 2")
    end
})
if ToggleStates["Banana Hub 2"] then
    toggleScript("Banana Hub 2", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana2.lua", true, "Banana Hub 2")
end

mainSection:AddToggle("BananaHub3Toggle", {
    Title = "Banana Hub 3",
    Description = "Bật để chạy Banana Hub (Version 3)",
    Default = ToggleStates["Banana Hub 3"] or false,
    Callback = function(value)
        toggleScript("Banana Hub 3", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana.lua", value, "Banana Hub 3")
    end
})
if ToggleStates["Banana Hub 3"] then
    toggleScript("Banana Hub 3", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana.lua", true, "Banana Hub 3")
end

local autoBountySection = Tabs.AutoBounty:AddSection("AutoBounty Features")
autoBountySection:AddToggle("WAzureAutoBountyToggle", {
    Title = "W-Azure AutoBounty",
    Description = "Bật để chạy W-Azure AutoBounty script",
    Default = ToggleStates["W-Azure AutoBounty"] or false,
    Callback = function(value)
        toggleScript("W-Azure AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/wazureBounty.lua", value, "W-Azure AutoBounty")
    end
})
if ToggleStates["W-Azure AutoBounty"] then
    toggleScript("W-Azure AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/wazureBounty.lua", true, "W-Azure AutoBounty")
end

autoBountySection:AddToggle("BananaAutoBountyToggle", {
    Title = "Banana AutoBounty",
    Description = "Bật để chạy Banana AutoBounty script",
    Default = ToggleStates["Banana AutoBounty"] or false,
    Callback = function(value)
        toggleScript("Banana AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/AutoBounty.lua", value, "Banana AutoBounty")
    end
})
if ToggleStates["Banana AutoBounty"] then
    toggleScript("Banana AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/AutoBounty.lua", true, "Banana AutoBounty")
end

autoBountySection:AddButton({
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

local updatesSection = Tabs.Updates:AddSection("Update Logs")
updatesSection:AddButton({
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

local leviathanSection = Tabs.Leviathan:AddSection("Leviathan Script")
leviathanSection:AddToggle("LeviathanToggle", {
    Title = "Run Leviathan",
    Description = "Bật để chạy Leviathan script",
    Default = ToggleStates["Leviathan"] or false,
    Callback = function(value)
        toggleScript("Leviathan", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Leviathan.lua", value, "Leviathan")
    end
})
if ToggleStates["Leviathan"] then
    toggleScript("Leviathan", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Leviathan.lua", true, "Leviathan")
end
