repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Kiểm tra getgenv()
if not getgenv then
    game.Players.LocalPlayer:Kick("Executor không hỗ trợ getgenv()! Vui lòng dùng executor như Synapse X hoặc Arceus X.")
    return
end

getgenv().Key = "pino_ontop"
getgenv().Image = "rbxassetid://1234567890" -- Thay bằng Asset ID của hình lá cờ Việt Nam bạn upload
getgenv().ToggleUI = "E" -- Phím để ẩn/hiện UI (có thể đổi thành phím khác)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService") or error("Không thể lấy RunService!")
local UserInputService = game:GetService("UserInputService") or error("Không thể lấy UserInputService!")
local HttpService = game:GetService("HttpService") or error("Không thể lấy HttpService!")
local TeleportService = game:GetService("TeleportService") or error("Không thể lấy TeleportService!")
local VoiceChatService = game:GetService("VoiceChatService") or error("Không thể lấy VoiceChatService!")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")

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

-- Tạo nút Toggle UI (dùng hệ thống bạn gửi)
task.spawn(function()
    if not getgenv().LoadedMobileUI == true then
        getgenv().LoadedMobileUI = true
        local OpenUI = Instance.new("ScreenGui")
        local ImageButton = Instance.new("ImageButton")
        local UICorner = Instance.new("UICorner")
        OpenUI.Name = "OpenUI"
        OpenUI.Parent = game:GetService("CoreGui")
        OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        ImageButton.Parent = OpenUI
        ImageButton.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
        ImageButton.BackgroundTransparency = 0.8
        ImageButton.Position = UDim2.new(0.9, 0, 0.1, 0) -- Gần góc trên bên phải
        ImageButton.Size = UDim2.new(0, 50, 0, 50)
        ImageButton.Image = getgenv().Image
        ImageButton.ImageTransparency = 0 -- Đảm bảo hình ảnh hiển thị rõ
        ImageButton.Transparency = 0 -- Đảm bảo nút hiển thị rõ
        ImageButton.Draggable = true
        UICorner.CornerRadius = UDim.new(0, 200)
        UICorner.Parent = ImageButton
        ImageButton.MouseButton1Click:Connect(function()
            game:GetService("VirtualInputManager"):SendKeyEvent(true, getgenv().ToggleUI, false, game)
        end)
        -- Debug: Kiểm tra xem nút có được tạo không
        print("Nút Toggle UI đã được tạo tại vị trí: " .. tostring(ImageButton.Position))
    end
end)

-- Tải Fluent UI và kiểm tra lỗi
local Fluent
local success, errorMessage = pcall(function()
    Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)
if not success or not Fluent then
    game.Players.LocalPlayer:Kick("Không thể tải Fluent UI! Lỗi: " .. tostring(errorMessage) .. ". Vui lòng thử lại hoặc dùng executor khác.")
    return
end

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
    MinimizeKey = Enum.KeyCode.E -- Phím "E" để ẩn/hiện UI, khớp với getgenv().ToggleUI
})

-- Khởi tạo fluentGui với kiểm tra an toàn
local fluentGui
if Window and Window.ScreenGui then
    fluentGui = Window.ScreenGui
    fluentGui.Name = "FluentUI"
    fluentGui.Parent = playerGui
    fluentGui.ResetOnSpawn = false
else
    fluentGui = Instance.new("ScreenGui")
    fluentGui.Name = "FluentUI"
    fluentGui.Parent = playerGui
    fluentGui.ResetOnSpawn = false
    warn("Cảnh báo: Fluent UI không khởi tạo ScreenGui đúng cách, đã tạo ScreenGui thủ công.")
end

local isMobile = UserInputService.TouchEnabled

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

local function runScript(scriptName, url, notifyTitle)
    if ScriptStates[scriptName] then
        Fluent:Notify({
            Title = notifyTitle,
            Content = scriptName .. " đã được chạy trước đó!",
            Duration = 3
        })
        return
    end
    Fluent:Notify({
        Title = notifyTitle,
        Content = "Đang chạy " .. scriptName .. "...",
        Duration = 3
    })
    pcall(function()
        loadstring(game:HttpGet(url))()
        ScriptStates[scriptName] = true
    end)
end

-- Hàm xóa map, chỉ giữ lại nhân vật người chơi
local function clearMap()
    local localPlayer = Players.LocalPlayer
    local character = localPlayer.Character

    -- Kiểm tra xem nhân vật có tồn tại không
    if not character then
        Fluent:Notify({
            Title = "Lỗi",
            Content = "Nhân vật của bạn chưa tải, không thể xóa map!",
            Duration = 3
        })
        return
    end

    -- Duyệt qua tất cả các đối tượng trong Workspace
    for _, object in pairs(Workspace:GetChildren()) do
        -- Bỏ qua nhân vật của người chơi
        if object ~= character then
            -- Bỏ qua Terrain và Baseplate (nếu muốn giữ lại nền cơ bản)
            if object.Name ~= "Terrain" and object.Name ~= "Baseplate" then
                -- Xóa đối tượng
                pcall(function()
                    object:Destroy()
                end)
            end
        end
    end

    Fluent:Notify({
        Title = "Thành công",
        Content = "Đã xóa map, chỉ giữ lại nhân vật người chơi!",
        Duration = 5
    })
end

-- Script đồng hồ đếm thời gian
local timerGui
local timerLabel
local isTimerRunning = false
local elapsedTime = 0

-- Hàm định dạng thời gian (MM:SS)
local function formatTime(seconds)
    local minutes = math.floor(seconds / 60)
    local secs = math.floor(seconds % 60)
    return string.format("%02d:%02d", minutes, secs)
end

-- Hàm tạo hoặc bật/tắt đồng hồ
local function toggleTimer()
    if isTimerRunning then
        -- Tắt đồng hồ
        if timerGui then
            timerGui:Destroy()
        end
        isTimerRunning = false
        elapsedTime = 0
        Fluent:Notify({
            Title = "Timer",
            Content = "Đã tắt đồng hồ đếm thời gian!",
            Duration = 3
        })
        return
    end

    isTimerRunning = true
    Fluent:Notify({
        Title = "Timer",
        Content = "Đã bật đồng hồ đếm thời gian!",
        Duration = 3
    })

    -- Tạo ScreenGui
    timerGui = Instance.new("ScreenGui")
    timerGui.Name = "TimerGui"
    timerGui.Parent = CoreGui
    timerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Tạo Frame (ô nhỏ)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 100, 0, 40)
    frame.Position = UDim2.new(0, 10, 0, 10) -- Góc trên bên trái
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.BackgroundTransparency = 0.3
    frame.BorderSizePixel = 0
    frame.Parent = timerGui

    -- Làm góc bo tròn cho Frame
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = frame

    -- Tạo TextLabel hiển thị thời gian
    timerLabel = Instance.new("TextLabel")
    timerLabel.Size = UDim2.new(1, 0, 1, 0)
    timerLabel.BackgroundTransparency = 1
    timerLabel.Text = "00:00"
    timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    timerLabel.TextScaled = true
    timerLabel.Font = Enum.Font.SourceSansBold
    timerLabel.Parent = frame

    -- Cập nhật thời gian
    local connection
    connection = RunService.Heartbeat:Connect(function(deltaTime)
        if not isTimerRunning then
            connection:Disconnect()
            return
        end
        elapsedTime = elapsedTime + deltaTime
        timerLabel.Text = formatTime(elapsedTime)
    end)
end

local Tabs = {
    MainHub = Window:AddTab({ Title = "Main Hub", Icon = "star" }),
    Kaitun = Window:AddTab({ Title = "Kaitun", Icon = "flame" }),
    Main = Window:AddTab({ Title = "Main", Icon = "shield" }),
    AutoBounty = Window:AddTab({ Title = "AutoBounty", Icon = "sword" }),
    Updates = Window:AddTab({ Title = "Updates", Icon = "bell" }),
    Leviathan = Window:AddTab({ Title = "Leviathan", Icon = "anchor" }),
    Utilities = Window:AddTab({ Title = "Utilities", Icon = "wrench" }) -- Tab chứa các tiện ích
}

Window:SelectTab(1)

local mainHubSection = Tabs.MainHub:AddSection("Main Hub Script")
mainHubSection:AddButton({
    Title = "Run MainHub",
    Description = "Nhấn để chạy MainHub script",
    Callback = function()
        runScript("MainHub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/mainhub.lua", "MainHub")
    end
})

local kaitunSection = Tabs.Kaitun:AddSection("Kaitun Scripts")
kaitunSection:AddButton({
    Title = "Run Kaitun",
    Description = "Nhấn để chạy Kaitun script",
    Callback = function()
        runScript("Kaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Kaitun.lua", "Kaitun")
    end
})

kaitunSection:AddButton({
    Title = "Run KaitunDF",
    Description = "Nhấn để chạy KaitunDF script",
    Callback = function()
        runScript("KaitunDF", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunDF.lua", "KaitunDF")
    end
})

kaitunSection:AddButton({
    Title = "Run Marukaitun",
    Description = "Nhấn để chạy Marukaitun-Mobile script",
    Callback = function()
        runScript("Marukaitun", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Marukaitun.lua", "Marukaitun")
    end
})

kaitunSection:AddButton({
    Title = "Run KaitunFisch",
    Description = "Nhấn để chạy KaitunFisch script",
    Callback = function()
        runScript("KaitunFisch", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunfisch.lua", "KaitunFisch")
    end
})

kaitunSection:AddButton({
    Title = "Run KaitunAd",
    Description = "Nhấn để chạy KaitunAd script",
    Callback = function()
        runScript("KaitunAd", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunAd.lua", "KaitunAd")
    end
})

kaitunSection:AddButton({
    Title = "Run KaitunKI",
    Description = "Nhấn để chạy KaitunKI script",
    Callback = function()
        runScript("KaitunKI", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunKI.lua", "KaitunKI")
    end
})

kaitunSection:AddButton({
    Title = "Run KaitunAR",
    Description = "Nhấn để chạy KaitunAR script",
    Callback = function()
        runScript("KaitunAR", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunar.lua", "KaitunAR")
    end
})

kaitunSection:AddButton({
    Title = "Run KaitunAV",
    Description = "Nhấn để chạy KaitunAV script",
    Callback = function()
        runScript("KaitunAV", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunAV.lua", "KaitunAV")
    end
})

local mainSection = Tabs.Main:AddSection("Scripts")
mainSection:AddButton({
    Title = "Run W-Azure",
    Description = "Nhấn để chạy W-Azure script (Locked)",
    Disabled = true,
    Callback = function()
        Fluent:Notify({
            Title = "W-Azure",
            Content = "Nút này bị khóa, không thể chạy!",
            Duration = 3
        })
    end
})

mainSection:AddButton({
    Title = "Run Maru Hub",
    Description = "Nhấn để chạy Maru Hub-Mobile script",
    Callback = function()
        runScript("Maru Hub", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/maru.lua", "Maru Hub")
    end
})

mainSection:AddButton({
    Title = "Run Banana Hub 1",
    Description = "Nhấn để chạy Banana Hub (Version 1)",
    Callback = function()
        runScript("Banana Hub 1", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana1.lua", "Banana Hub 1")
    end
})

mainSection:AddButton({
    Title = "Run Banana Hub 2",
    Description = "Nhấn để chạy Banana Hub (Version 2)",
    Callback = function()
        runScript("Banana Hub 2", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana2.lua", "Banana Hub 2")
    end
})

mainSection:AddButton({
    Title = "Run Banana Hub 3",
    Description = "Nhấn để chạy Banana Hub (Version 3)",
    Callback = function()
        runScript("Banana Hub 3", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana.lua", "Banana Hub 3")
    end
})

local autoBountySection = Tabs.AutoBounty:AddSection("AutoBounty Features")
autoBountySection:AddButton({
    Title = "Run W-Azure AutoBounty",
    Description = "Nhấn để chạy W-Azure AutoBounty script",
    Callback = function()
        runScript("W-Azure AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/wazureBounty.lua", "W-Azure AutoBounty")
    end
})

autoBountySection:AddButton({
    Title = "Run Banana AutoBounty",
    Description = "Nhấn để chạy Banana AutoBounty script",
    Callback = function()
        runScript("Banana AutoBounty", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/AutoBounty.lua", "Banana AutoBounty")
    end
})

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
leviathanSection:AddButton({
    Title = "Run Leviathan",
    Description = "Nhấn để chạy Leviathan script",
    Callback = function()
        runScript("Leviathan", "https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Leviathan.lua", "Leviathan")
    end
})

-- Tab Utilities (chứa các tiện ích)
local utilitiesSection = Tabs.Utilities:AddSection("Utility Features")
utilitiesSection:AddButton({
    Title = "Clear Map",
    Description = "Xóa toàn bộ map, chỉ giữ lại nhân vật người chơi",
    Callback = function()
        clearMap()
    end
})

utilitiesSection:AddButton({
    Title = "Toggle Timer",
    Description = "Bật/tắt đồng hồ đếm thời gian",
    Callback = function()
        toggleTimer()
    end
})
