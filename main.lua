local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- Tải Fluent UI Lib từ URL mới
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/refs/heads/master/Example.lua"))()

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

-- Tạo cửa sổ Fluent
local Options = Fluent.Options
local Window = Fluent:CreateWindow({
    Title = "Lion Hub 🇻🇳",
    SubTitle = "Mừng 50 Năm Giải Phóng Đất Nước",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "Dark",
    Acrylic = true,
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Hệ thống khóa (Key System)
local KeySystem = Fluent:CreateKeySystem({
    Title = "Lion Hub Key System",
    Description = "Nhập key chính xác để tiếp tục.",
    Keys = { "pino_ontop", "LionHub", "VietNam" },
    SaveKey = true,
    Image = thumbnailImage,
    Discord = "https://discord.gg/wmUmGVG6ut"
})

-- Hàm định dạng thời gian thành "phút giây"
local function formatTime(seconds)
    local minutes = math.floor(seconds / 60)
    local remainingSeconds = math.floor(seconds % 60)
    if minutes > 0 then
        return string.format("%d phút %d giây", minutes, remainingSeconds)
    else
        return string.format("%d giây", remainingSeconds)
    end
end

-- Gửi Webhook khi UI được tải thành công
local function sendWebhook()
    local executorName = "Unknown"
    if syn then
        executorName = "Synapse X"
    elseif fluxus then
        executorName = "Fluxus"
    elseif krnl then
        executorName = "Krnl"
    elseif delta then
        executorName = "Delta"
    elseif getexecutorname then
        executorName = getexecutorname()
    end

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
            ["color"] = 65280, -- Màu xanh lá
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }

    local WEBHOOK_URL = "https://discord.com/api/webhooks/1358378646355710015/KvJJWS0CI54NoCNucVz4KtEUw5Vwq_qdPjROHYQpTx6NywUz8ueX6LiB0tbdpjeMNIrM"
    local request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    if request then
        request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(webhookData)
        })
    end
end

-- Gửi webhook ngay sau khi UI được tải
spawn(function()
    sendWebhook()
end)

-- Tạo ScreenGui cho thông tin
local infoGui = Instance.new("ScreenGui")
infoGui.Name = "InfoGui"
infoGui.Parent = playerGui
infoGui.ResetOnSpawn = false

-- Tạo Frame cho thông tin
local infoFrame = Instance.new("Frame")
if isMobile then
    infoFrame.Size = UDim2.new(0, 250, 0, 160)
    infoFrame.Position = UDim2.new(0.5, -125, 0, 5)
else
    infoFrame.Size = UDim2.new(0, 300, 0, 180)
    infoFrame.Position = UDim2.new(0.5, -150, 0, 10)
end
infoFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
infoFrame.BorderSizePixel = 0
infoFrame.Parent = infoGui

-- Tính năng kéo thả cho infoFrame
local dragging = false
local dragInput
local dragStart
local startPos

infoFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = infoFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
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
        infoFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 10)
infoCorner.Parent = infoFrame

-- Tạo TextLabel cho dòng "Mừng 50 Năm Giải Phóng Đất Nước"
local celebrationLabel = Instance.new("TextLabel")
celebrationLabel.Size = UDim2.new(1, 0, 0, 40)
celebrationLabel.Position = UDim2.new(0, 0, 0, 5)
celebrationLabel.BackgroundTransparency = 1
celebrationLabel.Text = "🇻🇳 Mừng 50 Năm Giải Phóng Đất Nước 🇻🇳"
celebrationLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
celebrationLabel.TextSize = isMobile and 18 or 22
celebrationLabel.Font = Enum.Font.SourceSansBold
celebrationLabel.TextXAlignment = Enum.TextXAlignment.Center
celebrationLabel.Parent = infoFrame

-- Tạo TextLabel cho FPS
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, 0, 0, 20)
fpsLabel.Position = UDim2.new(0, 0, 0, 45)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: 0"
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextSize = isMobile and 14 or 16
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextXAlignment = Enum.TextXAlignment.Center
fpsLabel.Parent = infoFrame

-- Tạo TextLabel cho User Name
local userLabel = Instance.new("TextLabel")
userLabel.Size = UDim2.new(1, 0, 0, 20)
userLabel.Position = UDim2.new(0, 0, 0, 65)
userLabel.BackgroundTransparency = 1
userLabel.Text = "User: " .. player.Name
userLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
userLabel.TextSize = isMobile and 12 or 14
userLabel.Font = Enum.Font.SourceSans
userLabel.TextXAlignment = Enum.TextXAlignment.Center
userLabel.Parent = infoFrame

-- Tạo TextLabel cho ngày, tháng, năm Việt Nam
local vietnamDateLabel = Instance.new("TextLabel")
vietnamDateLabel.Size = UDim2.new(1, 0, 0, 20)
vietnamDateLabel.Position = UDim2.new(0, 0, 0, 85)
vietnamDateLabel.BackgroundTransparency = 1
vietnamDateLabel.Text = "VN Date: " .. os.date("%d/%m/%Y", os.time() + 7 * 3600)
vietnamDateLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
vietnamDateLabel.TextSize = isMobile and 12 or 14
vietnamDateLabel.Font = Enum.Font.SourceSans
vietnamDateLabel.TextXAlignment = Enum.TextXAlignment.Center
vietnamDateLabel.Parent = infoFrame

-- Tạo TextLabel cho Executor
local executorLabel = Instance.new("TextLabel")
executorLabel.Size = UDim2.new(1, 0, 0, 20)
executorLabel.Position = UDim2.new(0, 0, 0, 105)
executorLabel.BackgroundTransparency = 1
local executorName = "Unknown"
if syn then
    executorName = "Synapse X"
elseif fluxus then
    executorName = "Fluxus"
elseif krnl then
    executorName = "Krnl"
elseif delta then
    executorName = "Delta"
elseif getexecutorname then
    executorName = getexecutorname()
end
executorLabel.Text = "Executor: " .. executorName
executorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
executorLabel.TextSize = isMobile and 12 or 14
executorLabel.Font = Enum.Font.SourceSans
executorLabel.TextXAlignment = Enum.TextXAlignment.Center
executorLabel.Parent = infoFrame

-- Tạo TextLabel cho dòng cảm ơn với hiệu ứng đánh máy
local thanksLabel = Instance.new("TextLabel")
thanksLabel.Size = UDim2.new(1, 0, 0, 30)
thanksLabel.Position = UDim2.new(0, 0, 0, 125)
thanksLabel.BackgroundTransparency = 1
thanksLabel.Text = ""
thanksLabel.TextColor3 = Color3.fromRGB(0, 120, 215)
thanksLabel.TextSize = isMobile and 12 or 14
thanksLabel.Font = Enum.Font.SourceSansItalic
thanksLabel.TextXAlignment = Enum.TextXAlignment.Center
thanksLabel.Parent = infoFrame

-- Hiệu ứng đánh máy cho dòng cảm ơn
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

-- Cập nhật FPS và ngày, tháng, năm Việt Nam
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
    vietnamDateLabel.Text = "VN Date: " .. os.date("%d/%m/%Y", os.time() + 7 * 3600)
end)

-- Tạo các tab
local Tabs = {
    MainHubTab = Window:AddTab({ Title = "MainHub", Icon = "star" }),
    KaitunTab = Window:AddTab({ Title = "Kaitun", Icon = "flame" }),
    MainTab = Window:AddTab({ Title = "Main", Icon = "shield" }),
    NotificationTab = Window:AddTab({ Title = "Nhật Ký Cập Nhật", Icon = "bell" })
}

-- Tab: MainHub
local MainHubSection = Tabs.MainHubTab:AddSection("MainHub Script")
MainHubSection:AddButton({
    Title = "MainHub",
    Description = "Chạy script MainHub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua"))()
    end
})

-- Tab: Kaitun
local KaitunSection = Tabs.KaitunTab:AddSection("Kaitun Scripts")
KaitunSection:AddButton({
    Title = "Kaitun",
    Description = "Chạy script Kaitun",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Kaitun.lua"))()
    end
})
KaitunSection:AddButton({
    Title = "KaitunDF",
    Description = "Chạy script KaitunDF",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunDF.lua"))()
    end
})
KaitunSection:AddButton({
    Title = "Marukaitun",
    Description = "Chạy script Marukaitun-Mobile",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Marukaitun.lua"))()
    end
})
KaitunSection:AddButton({
    Title = "KaitunFisch",
    Description = "Chạy script KaitunFisch",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunfisch.lua"))()
    end
})
KaitunSection:AddButton({
    Title = "KaitunAd",
    Description = "Chạy script KaitunAd",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunAd.lua"))()
    end
})
KaitunSection:AddButton({
    Title = "KaitunKI",
    Description = "Chạy script KaitunKI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunKI.lua"))()
    end
})
KaitunSection:AddButton({
    Title = "KaitunAR",
    Description = "Chạy script KaitunAR",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunar.lua"))()
    end
})
KaitunSection:AddButton({
    Title = "KaitunAV",
    Description = "Chạy script KaitunAV",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunAV.lua"))()
    end
})

-- Tab: Main
local MainSection = Tabs.MainTab:AddSection("Script")
MainSection:AddButton({
    Title = "W-Azure",
    Description = "Chạy script W-Azure",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/wazure.lua"))()
    end
})
MainSection:AddButton({
    Title = "Maru Hub",
    Description = "Chạy script Maru Hub-Mobile",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/maru.lua"))()
    end
})
MainSection:AddButton({
    Title = "Banana Hub 1",
    Description = "Chạy script Banana Hub (Phiên bản 1)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana1.lua"))()
    end
})
MainSection:AddButton({
    Title = "Banana Hub 2",
    Description = "Chạy script Banana Hub (Phiên bản 2)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana2.lua"))()
    end
})
MainSection:AddButton({
    Title = "Banana Hub 3",
    Description = "Chạy script Banana Hub (Phiên bản 3)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/main.lua"))()
    end
})
MainSection:AddButton({
    Title = "All Executor Here",
    Description = "Sao chép link tải executor",
    Callback = function()
        if setclipboard then
            setclipboard("https://lion-executor.pages.dev/")
            Fluent:Notify({
                Title = "LionHub",
                Content = "Đã sao chép link: https://lion-executor.pages.dev/",
                Duration = 3
            })
        else
            Fluent:Notify({
                Title = "LionHub",
                Content = "Executor không hỗ trợ sao chép. Link: https://lion-executor.pages.dev/",
                Duration = 5
            })
        end
    end
})
MainSection:AddButton({
    Title = "Server Discord Hỗ Trợ",
    Description = "Tham gia server Discord để được hỗ trợ",
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
                    args = {
                        code = "wmUmGVG6ut"
                    },
                    nonce = HttpService:GenerateGUID(false)
                })
            })
        else
            Fluent:Notify({
                Title = "LionHub",
                Content = "Executor của bạn không hỗ trợ mở link Discord. Vui lòng sao chép link: https://discord.gg/wmUmGVG6ut",
                Duration = 5
            })
        end
    end
})

local SettingsSection = Tabs.MainTab:AddSection("Cài Đặt Giao Diện")
SettingsSection:AddDropdown({
    Title = "Đổi Giao Diện",
    Values = { "Tối", "Sáng", "Xanh Nước Biển", "Xanh Lá", "Tím" },
    Default = "Tối",
    Callback = function(value)
        local themeMap = {
            ["Tối"] = "Dark",
            ["Sáng"] = "Light",
            ["Xanh Nước Biển"] = "Aqua",
            ["Xanh Lá"] = "Green",
            ["Tím"] = "Amethyst"
        }
        Fluent:ChangeTheme(themeMap[value])
        Fluent:Notify({
            Title = "LionHub",
            Content = "Đã đổi giao diện thành " .. value,
            Duration = 3
        })
    end
})

-- Tab: Nhật Ký Cập Nhật
local NotificationSection = Tabs.NotificationTab:AddSection("Thông Tin Cập Nhật")
NotificationSection:AddButton({
    Title = "Xem Nhật Ký Cập Nhật",
    Callback = function()
        Fluent:Notify({
            Title = "Nhật Ký Cập Nhật - Phần 1",
            Content = "- Tiếng Anh-Tiếng Việt\n- Có sẵn trên mọi client\n- Dùng Được trên tất cả client",
            Duration = 5
        })
        wait(5.1)
        Fluent:Notify({
            Title = "Nhật Ký Cập Nhật - Phần 2",
            Content = "- Android - iOS - PC\n- Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt",
            Duration = 5
        })
        wait(5.1)
        Fluent:Notify({
            Title = "Nhật Ký Cập Nhật - Phần 3",
            Content = "- Hỗ Trợ các công cụ\n- Và Update Mỗi Tuần",
            Duration = 5
        })
    end
})

-- Chọn tab mặc định
Window:SelectTab(1)
