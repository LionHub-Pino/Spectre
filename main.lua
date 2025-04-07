local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- Tải Orion UI Library từ link thay thế
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Ui.lua"))()

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

-- Tạo Key System với Orion
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

local KeyWindow = OrionLib:MakeWindow({
    Name = "Lion Hub Key System",
    IntroText = "🇻🇳 Nhập key để tiếp tục 🇻🇳",
    HidePremium = true,
    SaveConfig = false
})

local KeyTab = KeyWindow:MakeTab({
    Name = "Key",
    Icon = thumbnailImage
})

KeyTab:AddTextbox({
    Name = "Nhập Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        keyInput = value
    end
})

KeyTab:AddButton({
    Name = "Xác Nhận",
    Callback = function()
        for _, key in pairs(correctKeys) do
            if keyInput == key then
                OrionLib:MakeNotification({
                    Name = "Thành Công",
                    Content = "Key hợp lệ! Đang tải Lion Hub...",
                    Image = thumbnailImage,
                    Time = 3
                })
                KeyWindow:Destroy()
                loadMainUI()
                spawn(function() sendWebhook() end)
                return
            end
        end
        OrionLib:MakeNotification({
            Name = "Lỗi",
            Content = "Key không đúng! Tham gia Discord: https://discord.gg/wmUmGVG6ut",
            Image = thumbnailImage,
            Time = 5
        })
    end
})

-- Hàm tải UI chính
function loadMainUI()
    local Window = OrionLib:MakeWindow({
        Name = "Lion Hub 🇻🇳",
        IntroText = "🇻🇳 Mừng 50 Năm Giải Phóng Đất Nước 🇻🇳",
        HidePremium = true,
        SaveConfig = true,
        ConfigFolder = "LionHubData"
    })

    -- Tạo các tab
    local Tabs = {
        MainHubTab = Window:MakeTab({ Name = "MainHub", Icon = "rbxassetid://4483345998" }),
        KaitunTab = Window:MakeTab({ Name = "Kaitun", Icon = "rbxassetid://6026568198" }),
        MainTab = Window:MakeTab({ Name = "Main", Icon = "rbxassetid://6031071055" }),
        NotificationTab = Window:MakeTab({ Name = "Nhật Ký Cập Nhật", Icon = "rbxassetid://6022668898" })
    }

    -- Tab: MainHub
    Tabs.MainHubTab:AddSection({ Name = "MainHub Script" })
    Tabs.MainHubTab:AddButton({
        Name = "MainHub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua"))()
            OrionLib:MakeNotification({ Name = "LionHub", Content = "Đã chạy script MainHub!", Time = 3 })
        end
    })

    -- Tab: Kaitun
    Tabs.KaitunTab:AddSection({ Name = "Kaitun Scripts" })
    Tabs.KaitunTab:AddButton({
        Name = "Kaitun",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Kaitun.lua"))()
        end
    })
    Tabs.KaitunTab:AddButton({
        Name = "KaitunDF",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunDF.lua"))()
        end
    })
    Tabs.KaitunTab:AddButton({
        Name = "Marukaitun",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Marukaitun.lua"))()
        end
    })
    Tabs.KaitunTab:AddButton({
        Name = "KaitunFisch",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunfisch.lua"))()
        end
    })
    Tabs.KaitunTab:AddButton({
        Name = "KaitunAd",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunAd.lua"))()
        end
    })
    Tabs.KaitunTab:AddButton({
        Name = "KaitunKI",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunKI.lua"))()
        end
    })
    Tabs.KaitunTab:AddButton({
        Name = "KaitunAR",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunar.lua"))()
        end
    })
    Tabs.KaitunTab:AddButton({
        Name = "KaitunAV",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunAV.lua"))()
        end
    })

    -- Tab: Main
    Tabs.MainTab:AddSection({ Name = "Script" })
    Tabs.MainTab:AddButton({
        Name = "W-Azure",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/wazure.lua"))()
        end
    })
    Tabs.MainTab:AddButton({
        Name = "Maru Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/maru.lua"))()
        end
    })
    Tabs.MainTab:AddButton({
        Name = "Banana Hub 1",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana1.lua"))()
        end
    })
    Tabs.MainTab:AddButton({
        Name = "Banana Hub 2",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana2.lua"))()
        end
    })
    Tabs.MainTab:AddButton({
        Name = "Banana Hub 3",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/main.lua"))()
        end
    })
    Tabs.MainTab:AddButton({
        Name = "All Executor Here",
        Callback = function()
            if setclipboard then
                setclipboard("https://lion-executor.pages.dev/")
                OrionLib:MakeNotification({ Name = "LionHub", Content = "Đã sao chép link: https://lion-executor.pages.dev/", Time = 3 })
            else
                OrionLib:MakeNotification({ Name = "LionHub", Content = "Executor không hỗ trợ sao chép. Link: https://lion-executor.pages.dev/", Time = 5 })
            end
        end
    })
    Tabs.MainTab:AddButton({
        Name = "Server Discord Hỗ Trợ",
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
                OrionLib:MakeNotification({ Name = "LionHub", Content = "Executor không hỗ trợ mở link Discord. Link: https://discord.gg/wmUmGVG6ut", Time = 5 })
            end
        end
    })

    Tabs.MainTab:AddSection({ Name = "Cài Đặt Giao Diện" })
    Tabs.MainTab:AddDropdown({
        Name = "Đổi Giao Diện",
        Options = { "Dark", "Light", "Aqua", "Green", "Amethyst" },
        Default = "Dark",
        Callback = function(value)
            OrionLib:MakeNotification({ Name = "LionHub", Content = "Đã đổi giao diện thành " .. value, Time = 3 })
            -- Orion không có SetTheme, nên đây chỉ là thông báo
        end
    })

    -- Tab: Nhật Ký Cập Nhật
    Tabs.NotificationTab:AddSection({ Name = "Thông Tin Cập Nhật" })
    Tabs.NotificationTab:AddButton({
        Name = "Xem Nhật Ký Cập Nhật",
        Callback = function()
            OrionLib:MakeNotification({ Name = "Nhật Ký Cập Nhật - Phần 1", Content = "- Tiếng Anh-Tiếng Việt\n- Có sẵn trên mọi client\n- Dùng Được trên tất cả client", Time = 5 })
            wait(5.1)
            OrionLib:MakeNotification({ Name = "Nhật Ký Cập Nhật - Phần 2", Content = "- Android - iOS - PC\n- Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt", Time = 5 })
            wait(5.1)
            OrionLib:MakeNotification({ Name = "Nhật Ký Cập Nhật - Phần 3", Content = "- Hỗ Trợ các công cụ\n- Và Update Mỗi Tuần", Time = 5 })
        end
    })
end

-- Tạo ScreenGui cho thông tin
local infoGui = Instance.new("ScreenGui")
infoGui.Name = "InfoGui"
infoGui.Parent = playerGui
infoGui.ResetOnSpawn = false

-- Tạo Frame cho thông tin
local infoFrame = Instance.new("Frame")
if isMobile then
    infoFrame.Size = UDim2.new(0, 300, 0, 200)
    infoFrame.Position = UDim2.new(0.5, -150, 0, 10)
else
    infoFrame.Size = UDim2.new(0, 350, 0, 220)
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

-- TextLabel VN Date
local vietnamDateLabel = Instance.new("TextLabel")
vietnamDateLabel.Size = UDim2.new(1, 0, 0, 20)
vietnamDateLabel.Position = UDim2.new(0, 0, 0, 85)
vietnamDateLabel.BackgroundTransparency = 1
vietnamDateLabel.Text = "VN Date: " .. os.date("%d/%m/%Y", os.time() + 7 * 3600)
vietnamDateLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
vietnamDateLabel.TextSize = isMobile and 14 or 16
vietnamDateLabel.Font = Enum.Font.Gotham
vietnamDateLabel.TextXAlignment = Enum.TextXAlignment.Center
vietnamDateLabel.Parent = infoFrame

-- TextLabel Executor
local executorLabel = Instance.new("TextLabel")
executorLabel.Size = UDim2.new(1, 0, 0, 20)
executorLabel.Position = UDim2.new(0, 0, 0, 105)
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
thanksLabel.Position = UDim2.new(0, 0, 0, 135)
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

-- Cập nhật FPS và ngày giờ
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
