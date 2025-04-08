local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local VoiceChatService = game:GetService("VoiceChatService")

-- Tải Platinum UI Library
local PlatinumUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/PatinumUILibrary.lua"))()

-- Kiểm tra thiết bị (mobile hay PC)
local isMobile = UserInputService.TouchEnabled

-- Thời gian bắt đầu để tính thời gian UI hiển thị
local startTime = tick()

-- Tạo cửa sổ chính với Platinum UI
local Window = PlatinumUI:CreateWindow("Lion Hub 🇻🇳", "Pino_azure")

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

-- Thông báo chào mừng
local executorName = "Unknown"
if syn then executorName = "Synapse X"
elseif fluxus then executorName = "Fluxus"
elseif krnl then executorName = "Krnl"
elseif delta then executorName = "Delta"
elseif getexecutorname then executorName = getexecutorname() end

PlatinumUI:Notify("Welcome To Lion Hub", "MỪNG 50 NĂM GIẢI PHÓNG ĐẤT NƯỚC\nExecutor: " .. executorName, 5)

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
        wait(60)
    end
end)

-- Tạo các tab với Platinum UI
local Tabs = {
    MainHub = Window:CreateTab("Main Hub"),
    Kaitun = Window:CreateTab("Kaitun"),
    Main = Window:CreateTab("Main"),
    UserInfo = Window:CreateTab("User Info"),
    Updates = Window:CreateTab("Updates"),
    AllExecutorScripts = Window:CreateTab("All Executor Scripts"),
    WindUILibInfo = Window:CreateTab("WindUI Lib Info"),
}

-- Tab: Main Hub
Tabs.MainHub:CreateSection("Main Hub Script")
Tabs.MainHub:CreateButton("MainHub", "Run MainHub script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua"))()
end)

-- Tab: Kaitun
Tabs.Kaitun:CreateSection("Kaitun Scripts")
Tabs.Kaitun:CreateButton("Kaitun", "Run Kaitun script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Kaitun.lua"))()
end)
Tabs.Kaitun:CreateButton("KaitunDF", "Run KaitunDF script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunDF.lua"))()
end)
Tabs.Kaitun:CreateButton("Marukaitun", "Run Marukaitun-Mobile script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Marukaitun.lua"))()
end)
Tabs.Kaitun:CreateButton("KaitunFisch", "Run KaitunFisch script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunfisch.lua"))()
end)
Tabs.Kaitun:CreateButton("KaitunAd", "Run KaitunAd script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunAd.lua"))()
end)
Tabs.Kaitun:CreateButton("KaitunKI", "Run KaitunKI script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunKI.lua"))()
end)
Tabs.Kaitun:CreateButton("KaitunAR", "Run KaitunAR script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunar.lua"))()
end)
Tabs.Kaitun:CreateButton("KaitunAV", "Run KaitunAV script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunAV.lua"))()
end)

-- Tab: Main
Tabs.Main:CreateSection("Scripts")
Tabs.Main:CreateButton("W-Azure", "Run W-Azure script (Locked)", function()
    -- Nút bị khóa nên không làm gì
end, true) -- Thêm tham số true để khóa nút
Tabs.Main:CreateButton("Maru Hub", "Run Maru Hub-Mobile script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/maru.lua"))()
end)
Tabs.Main:CreateButton("Banana Hub 1", "Run Banana Hub (Version 1)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana1.lua"))()
end)
Tabs.Main:CreateButton("Banana Hub 2", "Run Banana Hub (Version 2)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana2.lua"))()
end)
Tabs.Main:CreateButton("Banana Hub 3", "Run Banana Hub (Version 3)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/main.lua"))()
end)
Tabs.Main:CreateButton("Join JobId", "Join a server using JobId", function()
    local jobId = PlatinumUI:CreateInput("Enter JobId", "Please enter the JobId of the server:")
    if jobId and jobId ~= "" then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId, player)
    end
end)

-- Tab: User Info
Tabs.UserInfo:CreateSection("User Information")
local serverRegionLabel = Tabs.UserInfo:CreateLabel("Server Region: Unknown")
local inServerForLabel = Tabs.UserInfo:CreateLabel("In Server For: 0s")
local fpsInfoLabel = Tabs.UserInfo:CreateLabel("FPS: 0")
local latencyLabel = Tabs.UserInfo:CreateLabel("Latency: 0ms")
local totalFriendsLabel = Tabs.UserInfo:CreateLabel("Total Friends: 0")
local onlineFriendsLabel = Tabs.UserInfo:CreateLabel("Online Friends: 0")
local offlineFriendsLabel = Tabs.UserInfo:CreateLabel("Offline Friends: 0")
local inServerFriendsLabel = Tabs.UserInfo:CreateLabel("Friends in Server: 0")
local playersInServerLabel = Tabs.UserInfo:CreateLabel("Players in Server: 0")

spawn(function()
    while wait(1) do
        local region = "Unknown"
        pcall(function()
            region = VoiceChatService:GetVoiceRegion() or "Unknown"
        end)
        serverRegionLabel:UpdateText("Server Region: " .. region)

        local inServerTime = tick() - startTime
        inServerForLabel:UpdateText("In Server For: " .. formatTime(inServerTime))

        local fps = math.floor(frameCount / (tick() - lastTime))
        fpsInfoLabel:UpdateText("FPS: " .. fps)

        local ping = player:GetNetworkPing() * 1000
        latencyLabel:UpdateText("Latency: " .. math.floor(ping) .. "ms")

        local playerCount = #Players:GetPlayers()
        playersInServerLabel:UpdateText("Players in Server: " .. playerCount)
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
        totalFriendsLabel:UpdateText("Total Friends: " .. totalFriends)
        onlineFriendsLabel:UpdateText("Online Friends: " .. onlineFriends)
        offlineFriendsLabel:UpdateText("Offline Friends: " .. offlineFriends)
        inServerFriendsLabel:UpdateText("Friends in Server: " .. inServerFriends)
    end
end)

-- Tab: Updates
Tabs.Updates:CreateSection("Update Logs")
Tabs.Updates:CreateButton("View Updates", "View update logs", function()
    PlatinumUI:Notify("Update Log - Part 1", "- English-Vietnamese\n- Available on all clients\n- Works on all clients", 5)
    wait(5.1)
    PlatinumUI:Notify("Update Log - Part 2", "- Android - iOS - PC\n- Supports Vietnamese scripts for Vietnamese users", 5)
    wait(5.1)
    PlatinumUI:Notify("Update Log - Part 3", "- Tool support\n- Weekly updates", 5)
end)

-- Tab: All Executor Scripts
Tabs.AllExecutorScripts:CreateSection("Executor UI Scripts")
Tabs.AllExecutorScripts:CreateButton("Fluent UI", "Run Fluent UI script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/refs/heads/master/Example.lua"))()
end)
Tabs.AllExecutorScripts:CreateButton("WindUI", "Run WindUI script", function()
    loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
end)
Tabs.AllExecutorScripts:CreateButton("Delta UI", "Copy Delta UI link", function()
    if setclipboard then
        setclipboard("https://delta-executor.com/")
        PlatinumUI:Notify("Lion Hub", "Copied Delta UI link!", 3)
    end
end)

-- Tab: WindUI Lib Info
Tabs.WindUILibInfo:CreateSection("WindUI Library Info")
Tabs.WindUILibInfo:CreateLabel("WindUI Library")
Tabs.WindUILibInfo:CreateLabel("Version: Latest")
Tabs.WindUILibInfo:CreateLabel("Author: Unknown")
Tabs.WindUILibInfo:CreateLabel("Source: https://tree-hub.vercel.app/api/UI/WindUI")
Tabs.WindUILibInfo:CreateLabel("Description: A powerful UI library for Roblox scripting.")
Tabs.WindUILibInfo:CreateButton("Copy Source Link", "Copy WindUI source link", function()
    if setclipboard then
        setclipboard("https://tree-hub.vercel.app/api/UI/WindUI")
        PlatinumUI:Notify("Lion Hub", "Copied WindUI source link!", 3)
    end
end)
