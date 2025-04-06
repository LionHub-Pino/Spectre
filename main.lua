local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

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

-- Thời gian bắt đầu để tính thời gian UI hiển thị
local startTime = tick()

-- Tạo cửa sổ WindUI với key system tích hợp
local Window = WindUI:CreateWindow({
    Title = "Lion Hub 🇻🇳",
    Icon = "door-open",
    Author = "🇻🇳 Mừng 50 Năm Giải Phóng Đất Nước 🇻🇳",
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

    local WEBHOOK_URL = "https://discord.com/api/webhooks/1302946589714944010/O72glyYCgZKXbGEWOkB2HySrooODHM_zVtg-M5HSRliFj5qUAUNipks_JW7aXJ9DlN46"
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

-- Tùy chỉnh nút mở UI
Window:EditOpenButton({
    Title = "🇻🇳 Mở Lion Hub 🇻🇳",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 10),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    Draggable = true,
})

-- Tạo các tab (không có ConsoleTab)
local Tabs = {
    MainHubTab = Window:Tab({ Title = "MainHub", Icon = "star", Desc = "Script MainHub chính." }),
    KaitunTab = Window:Tab({ Title = "Kaitun", Icon = "flame", Desc = "Các script Kaitun." }),
    MainTab = Window:Tab({ Title = "Main", Icon = "shield", Desc = "Các tính năng chính và script." }),
    NotificationTab = Window:Tab({ Title = "Nhật Ký Cập Nhật", Icon = "bell", Desc = "Thông tin cập nhật và chi tiết." }),
}

-- Chọn tab mặc định
Window:SelectTab(1)

-- Tab: MainHub
Tabs.MainHubTab:Section({ Title = "MainHub Script" })

Tabs.MainHubTab:Button({
    Title = "MainHub",
    Desc = "Chạy script MainHub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua"))()
    end
})

-- Tab: Kaitun
Tabs.KaitunTab:Section({ Title = "Kaitun Scripts" })

Tabs.KaitunTab:Button({
    Title = "Kaitun",
    Desc = "Chạy script Kaitun",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Kaitun.lua"))()
    end
})

Tabs.KaitunTab:Button({
    Title = "KaitunDF",
    Desc = "Chạy script KaitunDF",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunDF.lua"))()
    end
})

Tabs.KaitunTab:Button({
    Title = "Marukaitun",
    Desc = "Chạy script Marukaitun-Mobile",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Marukaitun.lua"))()
    end
})

Tabs.KaitunTab:Button({
    Title = "KaitunFisch",
    Desc = "Chạy script KaitunFisch",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunfisch.lua"))()
    end
})

Tabs.KaitunTab:Button({
    Title = "KaitunAd",
    Desc = "Chạy script KaitunAd",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunAd.lua"))()
    end
})

Tabs.KaitunTab:Button({
    Title = "KaitunKI",
    Desc = "Chạy script KaitunKI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunKI.lua"))()
    end
})

Tabs.KaitunTab:Button({
    Title = "KaitunAR",
    Desc = "Chạy script Kaitunar",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunar.lua"))()
    end
})

Tabs.KaitunTab:Button({
    Title = "KaitunAV",
    Desc = "Chạy script KaitunAV",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunAV.lua"))()
    end
})

-- Tab: Main
Tabs.MainTab:Section({ Title = "Script" })

Tabs.MainTab:Button({
    Title = "W-Azure",
    Desc = "Chạy script W-Azure",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/wazure.lua"))()
    end
})

Tabs.MainTab:Button({
    Title = "Maru Hub",
    Desc = "Chạy script Maru Hub-Mobile",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/maru.lua"))()
    end
})

Tabs.MainTab:Button({
    Title = "Banana Hub 1",
    Desc = "Chạy script Banana Hub (Phiên bản 1)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana1.lua"))()
    end
})

Tabs.MainTab:Button({
    Title = "Banana Hub 2",
    Desc = "Chạy script Banana Hub (Phiên bản 2)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana2.lua"))()
    end
})

Tabs.MainTab:Button({
    Title = "Banana Hub 3",
    Desc = "Chạy script Banana Hub (Phiên bản 3)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/main.lua"))()
    end
})

Tabs.MainTab:Button({
    Title = "All Executor Here",
    Desc = "Sao chép link tải executor",
    Callback = function()
        if setclipboard then
            setclipboard("https://lion-executor.pages.dev/")
            Window:Notification({
                Title = "LionHub",
                Text = "Đã sao chép link: https://lion-executor.pages.dev/",
                Duration = 3
            })
        else
            Window:Notification({
                Title = "LionHub",
                Text = "Executor không hỗ trợ sao chép. Link: https://lion-executor.pages.dev/",
                Duration = 5
            })
        end
    end
})

Tabs.MainTab:Button({
    Title = "Server Discord Hỗ Trợ",
    Desc = "Tham gia server Discord để được hỗ trợ",
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
            Window:Notification({
                Title = "LionHub",
                Text = "Executor của bạn không hỗ trợ mở link Discord. Vui lòng sao chép link: https://discord.gg/wmUmGVG6ut",
                Duration = 5
            })
        end
    end
})

Tabs.MainTab:Section({ Title = "Cài Đặt Giao Diện" })

Tabs.MainTab:Dropdown({
    Title = "Đổi Giao Diện",
    Values = { "Tối", "Sáng", "Xanh Nước Biển", "Xanh Lá", "Tím" },
    Value = "Tối",
    Callback = function(value)
        local themeMap = {
            ["Tối"] = "Dark",
            ["Sáng"] = "Light",
            ["Xanh Nước Biển"] = "Aqua",
            ["Xanh Lá"] = "Green",
            ["Tím"] = "Amethyst"
        }
        WindUI:SetTheme(themeMap[value])
        Window:Notification({
            Title = "LionHub",
            Text = "Đã đổi giao diện thành " .. value,
            Duration = 3
        })
    end
})

-- Tab: Nhật Ký Cập Nhật
Tabs.NotificationTab:Section({ Title = "Thông Tin Cập Nhật" })

Tabs.NotificationTab:Button({
    Title = "Xem Nhật Ký Cập Nhật",
    Callback = function() 
        WindUI:Notify({
            Title = "Nhật Ký Cập Nhật - Phần 1",
            Content = "- Tiếng Anh-Tiếng Việt\n- Có sẵn trên mọi client\n- Dùng Được trên tất cả client",
            Icon = "bell",
            Duration = 5,
        })
        wait(5.1)
        WindUI:Notify({
            Title = "Nhật Ký Cập Nhật - Phần 2",
            Content = "- Android - iOS - PC\n- Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt",
            Icon = "bell",
            Duration = 5,
        })
        wait(5.1)
        WindUI:Notify({
            Title = "Nhật Ký Cập Nhật - Phần 3",
            Content = "- Hỗ Trợ các công cụ\n- Và Update Mỗi Tuần",
            Icon = "bell",
            Duration = 5,
        })
    end
})
