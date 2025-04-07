local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")

-- Tải Luna Interface Suite từ source
local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/main/source.lua"))()

-- Kiểm tra thiết bị (mobile hay PC)
local isMobile = UserInputService.TouchEnabled

-- Chọn Asset ID dựa trên thiết bị
local thumbnailImage
if isMobile then
    thumbnailImage = "rbxassetid://5341014178" -- Ảnh cho mobile
else
    thumbnailImage = "rbxassetid://13953902891" -- Ảnh cho PC
end

-- Thời gian bắt đầu để tính thời gian UI hiển thị
local startTime = tick()

-- Hàm định dạng thời gian
local function formatTime(seconds)
    local minutes = math.floor(seconds / 60)
    local remainingSeconds = math.floor(seconds % 60)
    if minutes > 0 then
        return string.format("%d phút %d giây", minutes, remainingSeconds)
    else
        return string.format("%d giây", remainingSeconds)
    end
end

-- Hàm tạo thông báo kiểu Codex
local function createCodexNotification()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CodexNotification"
    ScreenGui.Parent = playerGui
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 300, 0, 100)
    Frame.Position = UDim2.new(1, 310, 0, 10) -- Ban đầu nằm ngoài màn hình (bên phải)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Frame

    -- Dòng 1: Welcome To Lion Hub
    local Line1 = Instance.new("TextLabel")
    Line1.Size = UDim2.new(1, 0, 0, 30)
    Line1.Position = UDim2.new(0, 0, 0, 5)
    Line1.BackgroundTransparency = 1
    Line1.Text = "Welcome To Lion Hub"
    Line1.TextColor3 = Color3.fromRGB(255, 215, 0)
    Line1.TextSize = 20
    Line1.Font = Enum.Font.GothamBold
    Line1.TextXAlignment = Enum.TextXAlignment.Center
    Line1.Parent = Frame

    -- Dòng 2: 🇻🇳 MỪNG 50 NĂM GIẢI PHÓNG ĐẤT NƯỚC 🇻🇳
    local Line2 = Instance.new("TextLabel")
    Line2.Size = UDim2.new(1, 0, 0, 30)
    Line2.Position = UDim2.new(0, 0, 0, 35)
    Line2.BackgroundTransparency = 1
    Line2.Text = "🇻🇳 MỪNG 50 NĂM GIẢI PHÓNG ĐẤT NƯỚC 🇻🇳"
    Line2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Line2.TextSize = 16
    Line2.Font = Enum.Font.Gotham
    Line2.TextXAlignment = Enum.TextXAlignment.Center
    Line2.Parent = Frame

    -- Dòng 3: Tên Executor
    local executorName = "Unknown"
    if syn then executorName = "Synapse X"
    elseif fluxus then executorName = "Fluxus"
    elseif krnl then executorName = "Krnl"
    elseif delta then executorName = "Delta"
    elseif getexecutorname then executorName = getexecutorname() end

    local Line3 = Instance.new("TextLabel")
    Line3.Size = UDim2.new(1, 0, 0, 30)
    Line3.Position = UDim2.new(0, 0, 0, 65)
    Line3.BackgroundTransparency = 1
    Line3.Text = "Executor: " .. executorName
    Line3.TextColor3 = Color3.fromRGB(200, 200, 200)
    Line3.TextSize = 14
    Line3.Font = Enum.Font.Gotham
    Line3.TextXAlignment = Enum.TextXAlignment.Center
    Line3.Parent = Frame

    -- Hiệu ứng slide-in
    local tweenIn = TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -310, 0, 10) -- Di chuyển vào màn hình
    })
    tweenIn:Play()

    -- Chờ 5 giây rồi slide-out
    wait(5)
    local tweenOut = TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(1, 310, 0, 10) -- Di chuyển ra ngoài màn hình
    })
    tweenOut:Play()
    tweenOut.Completed:Connect(function()
        ScreenGui:Destroy()
    end)
end

-- Gửi Webhook khi UI được tải thành công
local function sendWebhook()
    local executorName = "Unknown"
    if syn then executorName = "Synapse X"
    elseif fluxus then executorName = "Fluxus"
    elseif krnl then executorName = "Krnl"
    elseif delta then executorName = "Delta"
    elseif getexecutorname then executorName = getexecutorname() end

    local loadTime = tick() - startTime
    local formattedTime = formatTime(loadTime)
    local webhookData = {
        ["username"] = "EXCUTOR SUCCESS",
        ["embeds"] = {{
            ["title"] = "Executor Success",
            ["fields"] = {
                {["name"] = "User Name", ["value"] = player.Name, ["inline"] = true},
                {["name"] = "Executor", ["value"] = executorName, ["inline"] = true},
                {["name"] = "Load Time", ["value"] = formattedTime, ["inline"] = true},
            },
            ["color"] = 16711680, -- Màu đỏ
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }

    local WEBHOOK_URL = "https://discord.com/api/webhooks/1358378646355710015/KvJJWS0CI54NoCNucVz4KtEUw5Vwq_qdPjROHYQpTx6NywUz8ueX6LiB0tbdpjeMNIrM"
    local request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    if request then
        request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode(webhookData)
        })
    end
end

-- Tạo Key System với Luna Interface Suite
local correctKeys = { 
    "pino_ontop", 
    "LionHub", 
    "VietNam", 
    "Lion2025", 
    "HubVN50", 
    "PinoKing", 
    "VNPower", 
    "LionTop1", 
    "KeyFreeVN", 
    "UnlockLion", 
    "SuperHub", 
    "LionMaster", 
    "VNForever" 
}
local keyInput = ""

local KeyWindow = Luna:CreateWindow({
    Title = "Lion Hub Key System",
    Size = Vector2.new(400, 300),
    Theme = "Dark"
})

KeyWindow:AddLabel({
    Text = "🇻🇳 Nhập key để tiếp tục 🇻🇳",
    Position = Vector2.new(10, 10),
    Size = Vector2.new(380, 30)
})

local KeyTextbox = KeyWindow:AddTextbox({
    Placeholder = "Nhập Key",
    Position = Vector2.new(10, 50),
    Size = Vector2.new(380, 30),
    Callback = function(value)
        keyInput = value
    end
})

KeyWindow:AddButton({
    Text = "Xác Nhận",
    Position = Vector2.new(10, 90),
    Size = Vector2.new(380, 30),
    Callback = function()
        for _, key in pairs(correctKeys) do
            if keyInput == key then
                Luna:Notify({
                    Title = "Thành Công",
                    Text = "Key hợp lệ! Đang tải Lion Hub...",
                    Duration = 3
                })
                KeyWindow:Destroy()
                loadMainUI()
                spawn(function() sendWebhook() end)
                spawn(function() createCodexNotification() end) -- Hiển thị thông báo kiểu Codex
                return
            end
        end
        Luna:Notify({
            Title = "Lỗi",
            Text = "Key không đúng! Tham gia Discord: https://discord.gg/wmUmGVG6ut",
            Duration = 5
        })
    end
})

-- Biến toàn cục để lưu trữ MainWindow và trạng thái UI
local MainWindow
local uiVisible = true

-- Hàm toggle UI
local function toggleUI()
    uiVisible = not uiVisible
    if MainWindow then
        MainWindow.Visible = uiVisible
        Luna:Notify({ Title = "LionHub", Text = uiVisible and "UI đã được bật!" or "UI đã được tắt!", Duration = 3 })
    end
end

-- Thêm phím tắt để toggle UI (nhấn phím "T")
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.T then
        toggleUI()
    end
end)

-- Hàm tải UI chính
function loadMainUI()
    MainWindow = Luna:CreateWindow({
        Title = "Lion Hub 🇻🇳",
        Size = Vector2.new(600, 400),
        Theme = "Dark"
    })

    MainWindow:AddLabel({
        Text = "🇻🇳 Mừng 50 Năm Giải Phóng Đất Nước 🇻🇳",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(580, 30)
    })

    -- Tạo Tab Container
    local TabContainer = MainWindow:AddTabContainer({
        Position = Vector2.new(10, 50),
        Size = Vector2.new(580, 340)
    })

    -- Tạo các tab (đã bỏ Vietnam Time)
    local MainHubTab = TabContainer:AddTab({ Name = "MainHub" })
    local KaitunTab = TabContainer:AddTab({ Name = "Kaitun" })
    local MainTab = TabContainer:AddTab({ Name = "Main" })
    local NotificationTab = TabContainer:AddTab({ Name = "Nhật Ký Cập Nhật" })
    local UserInfoTab = TabContainer:AddTab({ Name = "Thông Tin User" })
    local UtilitiesTab = TabContainer:AddTab({ Name = "Utilities" })
    local UILibTab = TabContainer:AddTab({ Name = "UI LIB By Luna (Not Mine)" })
    local AllUIExecutorTab = TabContainer:AddTab({ Name = "All UI Executor Script" })
    local SettingUITab = TabContainer:AddTab({ Name = "Setting UI" })
    local ContactTab = TabContainer:AddTab({ Name = "Contact" })
    local CreditsTab = TabContainer:AddTab({ Name = "Credits" })

    -- Tab: MainHub
    MainHubTab:AddButton({
        Text = "MainHub",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua"))()
            Luna:Notify({ Title = "LionHub", Text = "Đã chạy script MainHub!", Duration = 3 })
        end
    })

    -- Tab: Kaitun
    KaitunTab:AddButton({
        Text = "Kaitun",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Kaitun.lua"))()
        end
    })
    KaitunTab:AddButton({
        Text = "KaitunDF",
        Position = Vector2.new(10, 50),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunDF.lua"))()
        end
    })
    KaitunTab:AddButton({
        Text = "Marukaitun",
        Position = Vector2.new(10, 90),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Marukaitun.lua"))()
        end
    })
    KaitunTab:AddButton({
        Text = "KaitunFisch",
        Position = Vector2.new(10, 130),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunfisch.lua"))()
        end
    })
    KaitunTab:AddButton({
        Text = "KaitunAd",
        Position = Vector2.new(10, 170),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunAd.lua"))()
        end
    })
    KaitunTab:AddButton({
        Text = "KaitunKI",
        Position = Vector2.new(10, 210),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunKI.lua"))()
        end
    })
    KaitunTab:AddButton({
        Text = "KaitunAR",
        Position = Vector2.new(10, 250),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunar.lua"))()
        end
    })
    KaitunTab:AddButton({
        Text = "KaitunAV",
        Position = Vector2.new(10, 290),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunAV.lua"))()
        end
    })

    -- Tab: Main
    MainTab:AddButton({
        Text = "W-Azure",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/wazure.lua"))()
        end
    })
    MainTab:AddButton({
        Text = "Maru Hub",
        Position = Vector2.new(10, 50),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/maru.lua"))()
        end
    })
    MainTab:AddButton({
        Text = "Banana Hub 1",
        Position = Vector2.new(10, 90),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana1.lua"))()
        end
    })
    MainTab:AddButton({
        Text = "Banana Hub 2",
        Position = Vector2.new(10, 130),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana2.lua"))()
        end
    })
    MainTab:AddButton({
        Text = "Banana Hub 3",
        Position = Vector2.new(10, 170),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/main.lua"))()
        end
    })
    MainTab:AddButton({
        Text = "All Executor Here",
        Position = Vector2.new(10, 210),
        Size = Vector2.new(560, 30),
        Callback = function()
            if setclipboard then
                setclipboard("https://lion-executor.pages.dev/")
                Luna:Notify({ Title = "LionHub", Text = "Đã sao chép link: https://lion-executor.pages.dev/", Duration = 3 })
            else
                Luna:Notify({ Title = "LionHub", Text = "Executor không hỗ trợ sao chép. Link: https://lion-executor.pages.dev/", Duration = 5 })
            end
        end
    })
    MainTab:AddButton({
        Text = "Server Discord Hỗ Trợ",
        Position = Vector2.new(10, 250),
        Size = Vector2.new(560, 30),
        Callback = function()
            local request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
            if request then
                request({
                    Url = "http://127.0.0.1:6463/rpc?v=1",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        ["Origin"] = "https://discord.com"
                    },
                    Body = HttpService:JSONEncode({
                        cmd = "INVITE_BROWSER",
                        args = { code = "wmUmGVG6ut" },
                        nonce = HttpService:GenerateGUID(false)
                    })
                })
            else
                Luna:Notify({ Title = "LionHub", Text = "Executor không hỗ trợ mở link Discord. Link: https://discord.gg/wmUmGVG6ut", Duration = 5 })
            end
        end
    })

    -- Tab: Nhật Ký Cập Nhật
    NotificationTab:AddButton({
        Text = "Xem Nhật Ký Cập Nhật",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30),
        Callback = function()
            Luna:Notify({ Title = "Nhật Ký Cập Nhật - Phần 1", Text = "- Tiếng Anh-Tiếng Việt\n- Có sẵn trên mọi client\n- Dùng Được trên tất cả client", Duration = 5 })
            wait(5.1)
            Luna:Notify({ Title = "Nhật Ký Cập Nhật - Phần 2", Text = "- Android - iOS - PC\n- Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt", Duration = 5 })
            wait(5.1)
            Luna:Notify({ Title = "Nhật Ký Cập Nhật - Phần 3", Text = "- Hỗ Trợ các công cụ\n- Và Update Mỗi Tuần", Duration = 5 })
        end
    })

    -- Tab: Thông Tin User
    UserInfoTab:AddLabel({
        Text = "Hello, " .. player.Name,
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30)
    })

    -- Server Info Section
    UserInfoTab:AddLabel({
        Text = "SERVER",
        Position = Vector2.new(10, 50),
        Size = Vector2.new(270, 20)
    })
    UserInfoTab:AddLabel({
        Text = "Players: " .. #Players:GetPlayers() .. "/" .. game.Players.MaxPlayers,
        Position = Vector2.new(10, 80),
        Size = Vector2.new(270, 20)
    })
    local latencyLabel = UserInfoTab:AddLabel({
        Text = "Latency: Calculating...",
        Position = Vector2.new(10, 100),
        Size = Vector2.new(270, 20)
    })
    UserInfoTab:AddLabel({
        Text = "Server Region: US", -- Giả định
        Position = Vector2.new(10, 120),
        Size = Vector2.new(270, 20)
    })
    local inServerLabel = UserInfoTab:AddLabel({
        Text = "In server for: Calculating...",
        Position = Vector2.new(10, 140),
        Size = Vector2.new(270, 20)
    })
    UserInfoTab:AddButton({
        Text = "Join Script",
        Position = Vector2.new(10, 160),
        Size = Vector2.new(270, 30),
        Callback = function()
            if setclipboard then
                setclipboard("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua")
                Luna:Notify({ Title = "LionHub", Text = "Đã sao chép link script!", Duration = 3 })
            else
                Luna:Notify({ Title = "LionHub", Text = "Executor không hỗ trợ sao chép. Link: https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua", Duration = 5 })
            end
        end
    })

    -- Wave Section (Executor Info)
    UserInfoTab:AddLabel({
        Text = "WAVE",
        Position = Vector2.new(300, 50),
        Size = Vector2.new(270, 20)
    })
    local executorLabel = UserInfoTab:AddLabel({
        Text = "Executor: Unknown",
        Position = Vector2.new(300, 80),
        Size = Vector2.new(270, 20)
    })
    local executorName = "Unknown"
    if syn then executorName = "Synapse X"
    elseif fluxus then executorName = "Fluxus"
    elseif krnl then executorName = "Krnl"
    elseif delta then executorName = "Delta"
    elseif getexecutorname then executorName = getexecutorname() end
    executorLabel.Text = "Executor: " .. executorName

    -- Friends Section
    UserInfoTab:AddLabel({
        Text = "FRIENDS",
        Position = Vector2.new(300, 110),
        Size = Vector2.new(270, 20)
    })
    UserInfoTab:AddLabel({
        Text = "In Server: 0 friends", -- Giả định
        Position = Vector2.new(300, 140),
        Size = Vector2.new(270, 20)
    })
    UserInfoTab:AddLabel({
        Text = "Online: 2 friends", -- Giả định
        Position = Vector2.new(300, 160),
        Size = Vector2.new(270, 20)
    })
    UserInfoTab:AddLabel({
        Text = "Offline: 28 friends", -- Giả định
        Position = Vector2.new(300, 180),
        Size = Vector2.new(270, 20)
    })
    UserInfoTab:AddLabel({
        Text = "All: 100 friends", -- Giả định
        Position = Vector2.new(300, 200),
        Size = Vector2.new(270, 20)
    })

    -- Discord Section
    UserInfoTab:AddLabel({
        Text = "DISCORD",
        Position = Vector2.new(10, 210),
        Size = Vector2.new(560, 20)
    })
    UserInfoTab:AddButton({
        Text = "Tap to join the Discord Server",
        Position = Vector2.new(10, 240),
        Size = Vector2.new(560, 30),
        Callback = function()
            local request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
            if request then
                request({
                    Url = "http://127.0.0.1:6463/rpc?v=1",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        ["Origin"] = "https://discord.com"
                    },
                    Body = HttpService:JSONEncode({
                        cmd = "INVITE_BROWSER",
                        args = { code = "wmUmGVG6ut" },
                        nonce = HttpService:GenerateGUID(false)
                    })
                })
            else
                Luna:Notify({ Title = "LionHub", Text = "Executor không hỗ trợ mở link Discord. Link: https://discord.gg/wmUmGVG6ut", Duration = 5 })
            end
        end
    })

    -- Tab: Utilities
    -- Anti AFK
    local antiAfkEnabled = false
    UtilitiesTab:AddLabel({
        Text = "ANTI AFK",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 20)
    })
    UtilitiesTab:AddButton({
        Text = "Toggle Anti AFK (OFF)",
        Position = Vector2.new(10, 40),
        Size = Vector2.new(560, 30),
        Callback = function()
            antiAfkEnabled = not antiAfkEnabled
            if antiAfkEnabled then
                spawn(function()
                    while antiAfkEnabled do
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):ClickButton2(Vector2.new())
                        wait(10)
                    end
                end)
                Luna:Notify({ Title = "LionHub", Text = "Anti AFK đã được bật!", Duration = 3 })
            else
                Luna:Notify({ Title = "LionHub", Text = "Anti AFK đã được tắt!", Duration = 3 })
            end
            UtilitiesTab:AddButton({
                Text = "Toggle Anti AFK (" .. (antiAfkEnabled and "ON" or "OFF") .. ")",
                Position = Vector2.new(10, 40),
                Size = Vector2.new(560, 30),
                Callback = function() end
            })
        end
    })

    -- Rejoin Game
    local rejoinEnabled = false
    local rejoinTime = 300 -- 5 phút (300 giây)
    local rejoinTimer = rejoinTime
    local rejoinLabel = UtilitiesTab:AddLabel({
        Text = "Rejoin Timer: " .. formatTime(rejoinTimer),
        Position = Vector2.new(10, 100),
        Size = Vector2.new(560, 20)
    })
    UtilitiesTab:AddLabel({
        Text = "REJOIN GAME",
        Position = Vector2.new(10, 70),
        Size = Vector2.new(560, 20)
    })
    UtilitiesTab:AddButton({
        Text = "Toggle Auto Rejoin (OFF)",
        Position = Vector2.new(10, 130),
        Size = Vector2.new(560, 30),
        Callback = function()
            rejoinEnabled = not rejoinEnabled
            if rejoinEnabled then
                rejoinTimer = rejoinTime
                spawn(function()
                    while rejoinEnabled do
                        rejoinTimer = rejoinTimer - 1
                        rejoinLabel.Text = "Rejoin Timer: " .. formatTime(rejoinTimer)
                        if rejoinTimer <= 0 then
                            TeleportService:Teleport(game.PlaceId, player)
                            rejoinTimer = rejoinTime
                        end
                        wait(1)
                    end
                end)
                Luna:Notify({ Title = "LionHub", Text = "Auto Rejoin đã được bật!", Duration = 3 })
            else
                Luna:Notify({ Title = "LionHub", Text = "Auto Rejoin đã được tắt!", Duration = 3 })
            end
            UtilitiesTab:AddButton({
                Text = "Toggle Auto Rejoin (" .. (rejoinEnabled and "ON" or "OFF") .. ")",
                Position = Vector2.new(10, 130),
                Size = Vector2.new(560, 30),
                Callback = function() end
            })
        end
    })

    -- Join JobID
    local jobIdInput = ""
    UtilitiesTab:AddLabel({
        Text = "JOIN JOBID",
        Position = Vector2.new(10, 170),
        Size = Vector2.new(560, 20)
    })
    UtilitiesTab:AddTextbox({
        Placeholder = "Enter JobID",
        Position = Vector2.new(10, 200),
        Size = Vector2.new(560, 30),
        Callback = function(value)
            jobIdInput = value
        end
    })
    UtilitiesTab:AddButton({
        Text = "Join JobID",
        Position = Vector2.new(10, 240),
        Size = Vector2.new(560, 30),
        Callback = function()
            if jobIdInput ~= "" then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, jobIdInput, player)
                Luna:Notify({ Title = "LionHub", Text = "Đang tham gia server với JobID: " .. jobIdInput, Duration = 3 })
            else
                Luna:Notify({ Title = "LionHub", Text = "Vui lòng nhập JobID!", Duration = 3 })
            end
        end
    })

    -- Tab: UI LIB By Luna (Not Mine)
    UILibTab:AddLabel({
        Text = "This UI is powered by Luna Interface Suite",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30)
    })
    UILibTab:AddLabel({
        Text = "Created by Nebula Softworks",
        Position = Vector2.new(10, 40),
        Size = Vector2.new(560, 20)
    })
    UILibTab:AddLabel({
        Text = "Source: https://github.com/Nebula-Softworks/Luna-Interface-Suite",
        Position = Vector2.new(10, 60),
        Size = Vector2.new(560, 20)
    })
    UILibTab:AddLabel({
        Text = "Note: This UI library is not created by me.",
        Position = Vector2.new(10, 90),
        Size = Vector2.new(560, 20)
    })

    -- Tab: All UI Executor Script
    AllUIExecutorTab:AddLabel({
        Text = "ALL UI EXECUTOR SCRIPTS",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30)
    })
    AllUIExecutorTab:AddButton({
        Text = "Orion UI",
        Position = Vector2.new(10, 50),
        Size = Vector2.new(560, 30),
        Callback = function()
            if setclipboard then
                setclipboard("https://raw.githubusercontent.com/shlexware/Orion/main/source")
                Luna:Notify({ Title = "LionHub", Text = "Đã sao chép link Orion UI!", Duration = 3 })
            else
                Luna:Notify({ Title = "LionHub", Text = "Executor không hỗ trợ sao chép. Link: https://raw.githubusercontent.com/shlexware/Orion/main/source", Duration = 5 })
            end
        end
    })
    AllUIExecutorTab:AddButton({
        Text = "WindUI",
        Position = Vector2.new(10, 90),
        Size = Vector2.new(560, 30),
        Callback = function()
            if setclipboard then
                setclipboard("https://raw.githubusercontent.com/ItzWind/Wind-UI/main/WindUI.lua")
                Luna:Notify({ Title = "LionHub", Text = "Đã sao chép link WindUI!", Duration = 3 })
            else
                Luna:Notify({ Title = "LionHub", Text = "Executor không hỗ trợ sao chép. Link: https://raw.githubusercontent.com/ItzWind/Wind-UI/main/WindUI.lua", Duration = 5 })
            end
        end
    })
    AllUIExecutorTab:AddButton({
        Text = "Fluent UI",
        Position = Vector2.new(10, 130),
        Size = Vector2.new(560, 30),
        Callback = function()
            if setclipboard then
                setclipboard("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Main.lua")
                Luna:Notify({ Title = "LionHub", Text = "Đã sao chép link Fluent UI!", Duration = 3 })
            else
                Luna:Notify({ Title = "LionHub", Text = "Executor không hỗ trợ sao chép. Link: https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Main.lua", Duration = 5 })
            end
        end
    })
    AllUIExecutorTab:AddButton({
        Text = "Arceus UI",
        Position = Vector2.new(10, 170),
        Size = Vector2.new(560, 30),
        Callback = function()
            if setclipboard then
                setclipboard("https://raw.githubusercontent.com/ArceusX/arceus-ui/main/source.lua")
                Luna:Notify({ Title = "LionHub", Text = "Đã sao chép link Arceus UI!", Duration = 3 })
            else
                Luna:Notify({ Title = "LionHub", Text = "Executor không hỗ trợ sao chép. Link: https://raw.githubusercontent.com/ArceusX/arceus-ui/main/source.lua", Duration = 5 })
            end
        end
    })

    -- Tab: Setting UI
    SettingUITab:AddLabel({
        Text = "UI SETTINGS",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30)
    })
    SettingUITab:AddLabel({
        Text = "Theme: Dark",
        Position = Vector2.new(10, 50),
        Size = Vector2.new(270, 20)
    })
    SettingUITab:AddButton({
        Text = "Toggle Theme (Dark/Light)",
        Position = Vector2.new(10, 80),
        Size = Vector2.new(270, 30),
        Callback = function()
            Luna:Notify({ Title = "LionHub", Text = "Theme toggle is not supported by Luna Interface Suite.", Duration = 3 })
        end
    })
    SettingUITab:AddLabel({
        Text = "Window Size: 600x400",
        Position = Vector2.new(300, 50),
        Size = Vector2.new(270, 20)
    })
    SettingUITab:AddButton({
        Text = "Resize Window (Smaller)",
        Position = Vector2.new(300, 80),
        Size = Vector2.new(270, 30),
        Callback = function()
            MainWindow.Size = Vector2.new(500, 300)
            Luna:Notify({ Title = "LionHub", Text = "Window resized to 500x300!", Duration = 3 })
        end
    })
    SettingUITab:AddButton({
        Text = "Resize Window (Larger)",
        Position = Vector2.new(300, 120),
        Size = Vector2.new(270, 30),
        Callback = function()
            MainWindow.Size = Vector2.new(700, 500)
            Luna:Notify({ Title = "LionHub", Text = "Window resized to 700x500!", Duration = 3 })
        end
    })
    SettingUITab:AddButton({
        Text = "Toggle UI (Press T or Click)",
        Position = Vector2.new(10, 160),
        Size = Vector2.new(560, 30),
        Callback = function()
            toggleUI()
        end
    })

    -- Tab: Contact
    ContactTab:AddLabel({
        Text = "CONTACT INFORMATION",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30)
    })
    ContactTab:AddLabel({
        Text = "Discord: https://discord.gg/wmUmGVG6ut",
        Position = Vector2.new(10, 50),
        Size = Vector2.new(560, 20)
    })
    ContactTab:AddButton({
        Text = "Join Discord Server",
        Position = Vector2.new(10, 80),
        Size = Vector2.new(560, 30),
        Callback = function()
            local request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
            if request then
                request({
                    Url = "http://127.0.0.1:6463/rpc?v=1",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        ["Origin"] = "https://discord.com"
                    },
                    Body = HttpService:JSONEncode({
                        cmd = "INVITE_BROWSER",
                        args = { code = "wmUmGVG6ut" },
                        nonce = HttpService:GenerateGUID(false)
                    })
                })
            else
                Luna:Notify({ Title = "LionHub", Text = "Executor không hỗ trợ mở link Discord. Link: https://discord.gg/wmUmGVG6ut", Duration = 5 })
            end
        end
    })
    ContactTab:AddLabel({
        Text = "Email: lionhub.support@example.com",
        Position = Vector2.new(10, 120),
        Size = Vector2.new(560, 20)
    })
    ContactTab:AddButton({
        Text = "Copy Email",
        Position = Vector2.new(10, 150),
        Size = Vector2.new(560, 30),
        Callback = function()
            if setclipboard then
                setclipboard("lionhub.support@example.com")
                Luna:Notify({ Title = "LionHub", Text = "Đã sao chép email!", Duration = 3 })
            else
                Luna:Notify({ Title = "LionHub", Text = "Executor không hỗ trợ sao chép. Email: lionhub.support@example.com", Duration = 5 })
            end
        end
    })

    -- Tab: Credits
    CreditsTab:AddLabel({
        Text = "CREDITS",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30)
    })
    CreditsTab:AddLabel({
        Text = "Developer: LionHub Team",
        Position = Vector2.new(10, 50),
        Size = Vector2.new(560, 20)
    })
    CreditsTab:AddLabel({
        Text = "UI Library: Luna Interface Suite by Nebula Softworks",
        Position = Vector2.new(10, 80),
        Size = Vector2.new(560, 20)
    })
    CreditsTab:AddLabel({
        Text = "Special Thanks: All users who support Lion Hub!",
        Position = Vector2.new(10, 110),
        Size = Vector2.new(560, 20)
    })

    -- Cập nhật thông tin động (Latency, In Server For)
    local joinTime = tick()
    local lastTime = tick()
    local frameCount = 0
    RunService.RenderStepped:Connect(function()
        -- Cập nhật Latency (Ping)
        frameCount = frameCount + 1
        local currentTime = tick()
        if currentTime - lastTime >= 1 then
            local fps = math.floor(frameCount / (currentTime - lastTime))
            latencyLabel.Text = "Latency: " .. tostring(math.floor(player:GetNetworkPing() * 1000)) .. "ms"
            frameCount = 0
            lastTime = currentTime
        end

        -- Cập nhật thời gian trong server
        local timeInServer = tick() - joinTime
        local minutes = math.floor(timeInServer / 60)
        local seconds = math.floor(timeInServer % 60)
        inServerLabel.Text = "In server for: " .. string.format("%02d:%02d", minutes, seconds)
    end)

    -- Thêm tính năng kéo để thay đổi kích thước (resize) trên PC
    if not isMobile then
        local resizing = false
        local resizeStartPos
        local originalSize = MainWindow.Size

        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if not gameProcessedEvent and input.UserInputType == Enum.UserInputType.MouseButton1 then
                local mousePos = input.Position
                local windowPos = MainWindow.Position
                local windowSize = MainWindow.Size

                -- Kiểm tra xem chuột có nằm ở góc dưới bên phải của UI không (vùng resize)
                if mousePos.X >= windowPos.X + windowSize.X - 20 and
                   mousePos.X <= windowPos.X + windowSize.X and
                   mousePos.Y >= windowPos.Y + windowSize.Y - 20 and
                   mousePos.Y <= windowPos.Y + windowSize.Y then
                    resizing = true
                    resizeStartPos = mousePos
                    originalSize = windowSize
                end
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                resizing = false
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
                local mousePos = input.Position
                local delta = mousePos - resizeStartPos
                local newSize = Vector2.new(
                    math.max(400, originalSize.X + delta.X), -- Giới hạn kích thước tối thiểu
                    math.max(300, originalSize.Y + delta.Y)
                )
                MainWindow.Size = newSize

                -- Cập nhật lại kích thước TabContainer để khớp với kích thước mới
                TabContainer.Size = Vector2.new(newSize.X - 20, newSize.Y - 60)
            end
        end)
    end
end

-- Tạo ScreenGui cho thông tin
local infoGui = Instance.new("ScreenGui")
infoGui.Name = "InfoGui"
infoGui.Parent = playerGui
infoGui.ResetOnSpawn = false

-- Tạo Frame cho thông tin
local infoFrame = Instance.new("Frame")
if isMobile then
    infoFrame.Size = UDim2.new(0, 300, 0, 180) -- Giảm chiều cao vì bỏ VN Date
    infoFrame.Position = UDim2.new(0.5, -150, 0, 10)
else
    infoFrame.Size = UDim2.new(0, 350, 0, 200) -- Giảm chiều cao vì bỏ VN Date
    infoFrame.Position = UDim2.new(0.5, -175, 0, 15)
end
infoFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
infoFrame.BorderSizePixel = 0
infoFrame.Parent = infoGui

-- Thêm tính năng kéo thả
local dragging, dragInput, dragStart, startPos
infoFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = infoFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

infoFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        infoFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 12)
infoCorner.Parent = infoFrame

-- TextLabel "Mừng 50 Năm Giải Phóng Đất Nước"
local celebrationLabel = Instance.new("TextLabel")
celebrationLabel.Size = UDim2.new(1, 0, 0, 40)
celebrationLabel.Position = UDim2.new(0, 0, 0, 5)
celebrationLabel.BackgroundTransparency = 1
celebrationLabel.Text = "🇻🇳 Mừng 50 Năm Giải Phóng Đất Nước 🇻🇳"
celebrationLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
celebrationLabel.TextSize = isMobile and 20 or 24
celebrationLabel.Font = Enum.Font.GothamBold
celebrationLabel.TextXAlignment = Enum.TextXAlignment.Center
celebrationLabel.Parent = infoFrame

-- TextLabel FPS
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, 0, 0, 20)
fpsLabel.Position = UDim2.new(0, 0, 0, 45)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: 0"
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextSize = isMobile and 16 or 18
fpsLabel.Font = Enum.Font.Gotham
fpsLabel.TextXAlignment = Enum.TextXAlignment.Center
fpsLabel.Parent = infoFrame

-- TextLabel User Name
local userLabel = Instance.new("TextLabel")
userLabel.Size = UDim2.new(1, 0, 0, 20)
userLabel.Position = UDim2.new(0, 0, 0, 65)
userLabel.BackgroundTransparency = 1
userLabel.Text = "User: " .. player.Name
userLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
userLabel.TextSize = isMobile and 14 or 16
userLabel.Font = Enum.Font.Gotham
userLabel.TextXAlignment = Enum.TextXAlignment.Center
userLabel.Parent = infoFrame

-- TextLabel Executor
local executorLabel = Instance.new("TextLabel")
executorLabel.Size = UDim2.new(1, 0, 0, 20)
executorLabel.Position = UDim2.new(0, 0, 0, 85) -- Điều chỉnh vị trí vì bỏ VN Date
executorLabel.BackgroundTransparency = 1
local executorName = "Unknown"
if syn then executorName = "Synapse X"
elseif fluxus then executorName = "Fluxus"
elseif krnl then executorName = "Krnl"
elseif delta then executorName = "Delta"
elseif getexecutorname then executorName = getexecutorname() end
executorLabel.Text = "Executor: " .. executorName
executorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
executorLabel.TextSize = isMobile and 14 or 16
executorLabel.Font = Enum.Font.Gotham
executorLabel.TextXAlignment = Enum.TextXAlignment.Center
executorLabel.Parent = infoFrame

-- TextLabel cảm ơn với hiệu ứng đánh máy
local thanksLabel = Instance.new("TextLabel")
thanksLabel.Size = UDim2.new(1, 0, 0, 30)
thanksLabel.Position = UDim2.new(0, 0, 0, 115) -- Điều chỉnh vị trí vì bỏ VN Date
thanksLabel.BackgroundTransparency = 1
thanksLabel.Text = ""
thanksLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
thanksLabel.TextSize = isMobile and 14 or 16
thanksLabel.Font = Enum.Font.GothamItalic
thanksLabel.TextXAlignment = Enum.TextXAlignment.Center
thanksLabel.Parent = infoFrame

local thanksText = "Cảm Ơn Đã Tin Tưởng Dùng Lion Hub"
local isTyping = true
local currentIndex = 0

spawn(function()
    while true do
        if isTyping then
            currentIndex = currentIndex + 1
            thanksLabel.Text = string.sub(thanksText, 1, currentIndex)
            if currentIndex >= #thanksText then
                isTyping = false
                wait(1)
            end
        else
            currentIndex = currentIndex - 1
            thanksLabel.Text = string.sub(thanksText, 1, currentIndex)
            if currentIndex <= 0 then
                isTyping = true
                wait(0.5)
            end
        end
        wait(0.1)
    end
end)

-- Cập nhật FPS
local lastTime = tick()
local frameCount = 0
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastTime >= 1 then
        local fps = math.floor(frameCount / (currentTime - lastTime))
        fpsLabel.Text = "FPS: " .. fps
        frameCount = 0
        lastTime = currentTime
    end
end)
