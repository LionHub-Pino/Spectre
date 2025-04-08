local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local VoiceChatService = game:GetService("VoiceChatService")

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
            ["color"] = 65280,
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

spawn(function()
    sendWebhook()
end)

-- Thông báo kiểu Codex khi script chạy
local executorName = "Unknown"
if syn then executorName = "Synapse X"
elseif fluxus then executorName = "Fluxus"
elseif krnl then executorName = "Krnl"
elseif delta then executorName = "Delta"
elseif getexecutorname then executorName = getexecutorname() end

WindUI:Notify({
    Title = "Welcome To Lion Hub",
    Content = "MỪNG 50 NĂM GIẢI PHÓNG ĐẤT NƯỚC\nExecutor: " .. executorName,
    Icon = "bell",
    Duration = 5,
})

-- Tạo ScreenGui cho thông tin (infoFrame)
local infoGui = Instance.new("ScreenGui")
infoGui.Name = "InfoGui"
infoGui.Parent = playerGui
infoGui.ResetOnSpawn = false

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

local dragging, dragInput, dragStart, startPos
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
        infoFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 10)
infoCorner.Parent = infoFrame

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

local executorLabel = Instance.new("TextLabel")
executorLabel.Size = UDim2.new(1, 0, 0, 20)
executorLabel.Position = UDim2.new(0, 0, 0, 105)
executorLabel.BackgroundTransparency = 1
executorLabel.Text = "Executor: " .. executorName
executorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
executorLabel.TextSize = isMobile and 12 or 14
executorLabel.Font = Enum.Font.SourceSans
executorLabel.TextXAlignment = Enum.TextXAlignment.Center
executorLabel.Parent = infoFrame

local thanksLabel = Instance.new("TextLabel")
thanksLabel.Size = UDim2.new(1, 0, 0, 30)
thanksLabel.Position = UDim2.new(0, 0, 0, 125)
thanksLabel.BackgroundTransparency = 1
thanksLabel.Text = "Cảm Ơn Đã Tin Tưởng Dùng Lion Hub"
thanksLabel.TextColor3 = Color3.fromRGB(0, 120, 215)
thanksLabel.TextSize = isMobile and 12 or 14
thanksLabel.Font = Enum.Font.SourceSansItalic
thanksLabel.TextXAlignment = Enum.TextXAlignment.Center
thanksLabel.Parent = infoFrame

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

-- Anti-AFK
spawn(function()
    while true do
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        wait(60) -- Giả lập hành động mỗi 60 giây để tránh AFK
    end
end)

-- Tạo các tab
local Tabs = {
    MainHub = Window:Tab({ Title = "Main Hub", Icon = "star", Desc = "Main Hub scripts." }),
    Kaitun = Window:Tab({ Title = "Kaitun", Icon = "flame", Desc = "Kaitun scripts." }),
    Main = Window:Tab({ Title = "Main", Icon = "shield", Desc = "Main features and scripts." }),
    UserInfo = Window:Tab({ Title = "User Info", Icon = "user", Desc = "User and server information." }),
    Updates = Window:Tab({ Title = "Updates", Icon = "bell", Desc = "Update logs and details." }),
    AllExecutorScripts = Window:Tab({ Title = "All Executor Scripts", Icon = "code", Desc = "Collection of executor UI scripts." }),
    WindUILibInfo = Window:Tab({ Title = "WindUI Lib Info", Icon = "info", Desc = "Information about WindUI library." }),
}

Window:SelectTab(1)

-- Tab: Main Hub
Tabs.MainHub:Section({ Title = "Main Hub Script" })
Tabs.MainHub:Button({
    Title = "MainHub",
    Desc = "Run MainHub script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua"))()
    end
})

-- Tab: Kaitun
Tabs.Kaitun:Section({ Title = "Kaitun Scripts" })
Tabs.Kaitun:Button({
    Title = "Kaitun",
    Desc = "Run Kaitun script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Kaitun.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunDF",
    Desc = "Run KaitunDF script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunDF.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "Marukaitun",
    Desc = "Run Marukaitun-Mobile script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Marukaitun.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunFisch",
    Desc = "Run KaitunFisch script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunfisch.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunAd",
    Desc = "Run KaitunAd script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunAd.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunKI",
    Desc = "Run KaitunKI script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunKI.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunAR",
    Desc = "Run KaitunAR script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunar.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunAV",
    Desc = "Run KaitunAV script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunAV.lua"))()
    end
})

-- Tab: Main
Tabs.Main:Section({ Title = "Scripts" })
Tabs.Main:Button({
    Title = "W-Azure",
    Desc = "This script is currently locked.",
    Callback = function()
        Window:Notification({
            Title = "Lion Hub",
            Text = "W-Azure script is locked and cannot be used.",
            Duration = 3
        })
    end,
    -- WindUI không có thuộc tính Locked trực tiếp, nên tôi để Callback thông báo khi nhấn
})
Tabs.Main:Button({
    Title = "Maru Hub",
    Desc = "Run Maru Hub-Mobile script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/maru.lua"))()
    end
})
Tabs.Main:Button({
    Title = "Banana Hub 1",
    Desc = "Run Banana Hub (Version 1)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana1.lua"))()
    end
})
Tabs.Main:Button({
    Title = "Banana Hub 2",
    Desc = "Run Banana Hub (Version 2)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana2.lua"))()
    end
})
Tabs.Main:Button({
    Title = "Banana Hub 3",
    Desc = "Run Banana Hub (Version 3)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/main.lua"))()
    end
})
Tabs.Main:Button({
    Title = "Join JobId",
    Desc = "Join a server using JobId",
    Callback = function()
        local jobId = Window:Prompt({
            Title = "Enter JobId",
            Text = "Please enter the JobId of the server:",
            Buttons = { "Join", "Cancel" }
        })
        if jobId and jobId ~= "" then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId, player)
        end
    end
})

-- Tab: User Info
Tabs.UserInfo:Section({ Title = "User Information" })
local serverRegionLabel = Tabs.UserInfo:Label({ Text = "Server Region: Unknown" })
local inServerForLabel = Tabs.UserInfo:Label({ Text = "In Server For: 0s" })
local fpsInfoLabel = Tabs.UserInfo:Label({ Text = "FPS: 0" })
local latencyLabel = Tabs.UserInfo:Label({ Text = "Latency: 0ms" })
local totalFriendsLabel = Tabs.UserInfo:Label({ Text = "Total Friends: 0" })
local onlineFriendsLabel = Tabs.UserInfo:Label({ Text = "Online Friends: 0" })
local offlineFriendsLabel = Tabs.UserInfo:Label({ Text = "Offline Friends: 0" })
local inServerFriendsLabel = Tabs.UserInfo:Label({ Text = "Friends in Server: 0" })
local playersInServerLabel = Tabs.UserInfo:Label({ Text = "Players in Server: 0" })

spawn(function()
    while wait(1) do
        local region = "Unknown"
        pcall(function()
            region = VoiceChatService:GetVoiceRegion() or "Unknown"
        end)
        serverRegionLabel:SetText("Server Region: " .. region)

        local inServerTime = tick() - startTime
        inServerForLabel:SetText("In Server For: " .. formatTime(inServerTime))

        local fps = math.floor(frameCount / (tick() - lastTime))
        fpsInfoLabel:SetText("FPS: " .. fps)

        local ping = player:GetNetworkPing() * 1000
        latencyLabel:SetText("Latency: " .. math.floor(ping) .. "ms")

        local playerCount = #Players:GetPlayers()
        playersInServerLabel:SetText("Players in Server: " .. playerCount)
    end
end)

spawn(function()
    while wait(30) do
        local totalFriends, onlineFriends, offlineFriends, inServerFriends = 0, 0, 0, 0
        local success, friends = pcall(function()
            return Players:GetFriendsAsync(player.UserId)
        end)
        if success then
            for friend in friends do
                totalFriends = totalFriends + 1
                if friend.IsOnline then
                    onlineFriends = onlineFriends + 1
                    for _, p in pairs(Players:GetPlayers()) do
                        if p.UserId == friend.UserId then
                            inServerFriends = inServerFriends + 1
                            break
                        end
                    end
                else
                    offlineFriends = offlineFriends + 1
                end
            end
        end
        totalFriendsLabel:SetText("Total Friends: " .. totalFriends)
        onlineFriendsLabel:SetText("Online Friends: " .. onlineFriends)
        offlineFriendsLabel:SetText("Offline Friends: " .. offlineFriends)
        inServerFriendsLabel:SetText("Friends in Server: " .. inServerFriends)
    end
end)

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

-- Tab: All Executor Scripts
Tabs.AllExecutorScripts:Section({ Title = "Executor UI Scripts" })
Tabs.AllExecutorScripts:Button({
    Title = "Fluent UI",
    Desc = "Run Fluent UI script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/refs/heads/master/Example.lua"))()
    end
})
Tabs.AllExecutorScripts:Button({
    Title = "WindUI",
    Desc = "Run WindUI script",
    Callback = function()
        loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
    end
})
Tabs.AllExecutorScripts:Button({
    Title = "Delta UI",
    Desc = "Copy Delta UI link",
    Callback = function()
        if setclipboard then
            setclipboard("https://delta-executor.com/")
            Window:Notification({ Title = "Lion Hub", Text = "Copied Delta UI link!", Duration = 3 })
        end
    end
})

-- Tab: WindUI Lib Info
Tabs.WindUILibInfo:Section({ Title = "WindUI Library Info" })
Tabs.WindUILibInfo:Label({ Text = "WindUI Library" })
Tabs.WindUILibInfo:Label({ Text = "Version: Latest" })
Tabs.WindUILibInfo:Label({ Text = "Author: Unknown" })
Tabs.WindUILibInfo:Label({ Text = "Source: https://tree-hub.vercel.app/api/UI/WindUI" })
Tabs.WindUILibInfo:Label({ Text = "Description: A powerful UI library for Roblox scripting." })
Tabs.WindUILibInfo:Button({
    Title = "Copy Source Link",
    Callback = function()
        if setclipboard then
            setclipboard("https://tree-hub.vercel.app/api/UI/WindUI")
            Window:Notification({ Title = "Lion Hub", Text = "Copied WindUI source link!", Duration = 3 })
        end
    end
})
