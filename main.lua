local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local VoiceChatService = game:GetService("VoiceChatService")

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
        return string.format("%d minutes %d seconds", minutes, remainingSeconds)
    else
        return string.format("%d seconds", remainingSeconds)
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
        ["username"] = "EXECUTOR SUCCESS",
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

-- Biến toàn cục để lưu trữ MainWindow và trạng thái UI
local MainWindow
local uiVisible = true

-- Hàm toggle UI
local function toggleUI()
    uiVisible = not uiVisible
    if MainWindow then
        MainWindow.Visible = uiVisible
        Luna:Notify({ Title = "Lion Hub", Text = uiVisible and "UI has been enabled!" or "UI has been disabled!", Duration = 3 })
    end
end

-- Thêm phím tắt để toggle UI (nhấn phím "T")
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.T then
        toggleUI()
    end
end)

-- Hàm lấy thông tin bạn bè
local function getFriendsInfo(friendsInServerLabel, friendsOnlineLabel, friendsOfflineLabel, friendsAllLabel)
    local success, result = pcall(function()
        local friends = Players:GetFriendsAsync(player.UserId)
        local totalFriends = 0
        local onlineFriends = 0
        local offlineFriends = 0
        local inServerFriends = 0
        local currentPlayers = Players:GetPlayers()
        local inServerUserIds = {}

        -- Lấy danh sách UserId của người chơi trong server
        for _, p in ipairs(currentPlayers) do
            if p ~= player then
                inServerUserIds[p.UserId] = true
            end
        end

        -- Đếm bạn bè
        while true do
            local friendPage = friends:GetCurrentPage()
            for _, friend in ipairs(friendPage) do
                totalFriends = totalFriends + 1
                if friend.IsOnline then
                    onlineFriends = onlineFriends + 1
                    -- Kiểm tra xem bạn có trong server không
                    if inServerUserIds[friend.Id] then
                        inServerFriends = inServerFriends + 1
                    end
                else
                    offlineFriends = offlineFriends + 1
                end
            end
            if friends.IsFinished then
                break
            end
            friends:AdvanceToNextPageAsync()
        end

        return totalFriends, onlineFriends, offlineFriends, inServerFriends
    end)

    if success then
        friendsAllLabel.Text = "All: " .. result[1] .. " friends"
        friendsOnlineLabel.Text = "Online: " .. result[2] .. " friends"
        friendsOfflineLabel.Text = "Offline: " .. result[3] .. " friends"
        friendsInServerLabel.Text = "In Server: " .. result[4] .. " friends"
    else
        friendsAllLabel.Text = "All: Error"
        friendsOnlineLabel.Text = "Online: Error"
        friendsOfflineLabel.Text = "Offline: Error"
        friendsInServerLabel.Text = "In Server: Error"
    end
end

-- Hàm tải UI chính
function loadMainUI()
    MainWindow = Luna:CreateWindow({
        Title = "Lion Hub 🇻🇳",
        Size = Vector2.new(600, 400),
        Theme = "Dark"
    })

    MainWindow:AddText({
        Text = "🇻🇳 Celebrating 50 Years of Liberation 🇻🇳",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(580, 30)
    })

    -- Tạo Tab Container
    local TabContainer = MainWindow:AddTabContainer({
        Position = Vector2.new(10, 50),
        Size = Vector2.new(580, 340)
    })

    -- Tạo các tab
    local MainHubTab = TabContainer:AddTab({ Name = "MainHub" })
    local KaitunTab = TabContainer:AddTab({ Name = "Kaitun" })
    local MainTab = TabContainer:AddTab({ Name = "Main" })
    local UpdateLogTab = TabContainer:AddTab({ Name = "Update Log" })
    local UserInfoTab = TabContainer:AddTab({ Name = "User Info" })
    local UtilitiesTab = TabContainer:AddTab({ Name = "Utilities" })
    local UILibTab = TabContainer:AddTab({ Name = "UI LIB By Luna (Not Mine)" })
    local AllUIExecutorTab = TabContainer:AddTab({ Name = "All UI Executor Script" })
    local UISettingsTab = TabContainer:AddTab({ Name = "UI Settings" })
    local ContactTab = TabContainer:AddTab({ Name = "Contact" })
    local CreditsTab = TabContainer:AddTab({ Name = "Credits" })

    -- Tab: MainHub
    MainHubTab:AddButton({
        Text = "MainHub",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua"))()
            Luna:Notify({ Title = "Lion Hub", Text = "MainHub script executed!", Duration = 3 })
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
        Text = "All Executors Here",
        Position = Vector2.new(10, 210),
        Size = Vector2.new(560, 30),
        Callback = function()
            if setclipboard then
                setclipboard("https://lion-executor.pages.dev/")
                Luna:Notify({ Title = "Lion Hub", Text = "Copied link: https://lion-executor.pages.dev/", Duration = 3 })
            else
                Luna:Notify({ Title = "Lion Hub", Text = "Executor does not support clipboard. Link: https://lion-executor.pages.dev/", Duration = 5 })
            end
        end
    })
    MainTab:AddButton({
        Text = "Support Discord Server",
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
                Luna:Notify({ Title = "Lion Hub", Text = "Executor does not support Discord link. Link: https://discord.gg/wmUmGVG6ut", Duration = 5 })
            end
        end
    })

    -- Tab: Update Log
    UpdateLogTab:AddButton({
        Text = "View Update Log",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30),
        Callback = function()
            Luna:Notify({ Title = "Update Log - Part 1", Text = "- English-Vietnamese\n- Available on all clients\n- Compatible with all clients", Duration = 5 })
            wait(5.1)
            Luna:Notify({ Title = "Update Log - Part 2", Text = "- Android - iOS - PC\n- Supports Vietnamese scripts for Vietnamese users", Duration = 5 })
            wait(5.1)
            Luna:Notify({ Title = "Update Log - Part 3", Text = "- Supports various tools\n- Weekly updates", Duration = 5 })
        end
    })

    -- Tab: User Info (Chuyển thông tin từ infoFrame vào đây)
    local executorName = "Unknown"
    if syn then executorName = "Synapse X"
    elseif fluxus then executorName = "Fluxus"
    elseif krnl then executorName = "Krnl"
    elseif delta then executorName = "Delta"
    elseif getexecutorname then executorName = getexecutorname() end

    UserInfoTab:AddText({
        Text = "Hello, " .. player.Name,
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30)
    })

    -- Thêm thông tin từ infoFrame vào tab User Info
    local fpsLabel = UserInfoTab:AddText({
        Text = "FPS: 0",
        Position = Vector2.new(10, 40),
        Size = Vector2.new(560, 20)
    })
    UserInfoTab:AddText({
        Text = "User: " .. player.Name,
        Position = Vector2.new(10, 60),
        Size = Vector2.new(560, 20)
    })
    UserInfoTab:AddText({
        Text = "Executor: " .. executorName,
        Position = Vector2.new(10, 80),
        Size = Vector2.new(560, 20)
    })
    UserInfoTab:AddText({
        Text = "Thank You for Trusting Lion Hub",
        Position = Vector2.new(10, 100),
        Size = Vector2.new(560, 20)
    })

    -- Server Info Section
    UserInfoTab:AddText({
        Text = "SERVER",
        Position = Vector2.new(10, 130),
        Size = Vector2.new(270, 20)
    })
    UserInfoTab:AddText({
        Text = "Players: " .. #Players:GetPlayers() .. "/" .. game.Players.MaxPlayers,
        Position = Vector2.new(10, 150),
        Size = Vector2.new(270, 20)
    })
    local latencyLabel = UserInfoTab:AddText({
        Text = "Latency: Calculating...",
        Position = Vector2.new(10, 170),
        Size = Vector2.new(270, 20)
    })
    local serverRegionLabel = UserInfoTab:AddText({
        Text = "Server Region: Calculating...",
        Position = Vector2.new(10, 190),
        Size = Vector2.new(270, 20)
    })
    local inServerLabel = UserInfoTab:AddText({
        Text = "In server for: Calculating...",
        Position = Vector2.new(10, 210),
        Size = Vector2.new(270, 20)
    })
    UserInfoTab:AddButton({
        Text = "Join Script",
        Position = Vector2.new(10, 230),
        Size = Vector2.new(270, 30),
        Callback = function()
            if setclipboard then
                setclipboard("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua")
                Luna:Notify({ Title = "Lion Hub", Text = "Copied script link!", Duration = 3 })
            else
                Luna:Notify({ Title = "Lion Hub", Text = "Executor does not support clipboard. Link: https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua", Duration = 5 })
            end
        end
    })

    -- Wave Section (Executor Info)
    UserInfoTab:AddText({
        Text = "WAVE",
        Position = Vector2.new(300, 130),
        Size = Vector2.new(270, 20)
    })
    local executorLabel = UserInfoTab:AddText({
        Text = "Executor: " .. executorName,
        Position = Vector2.new(300, 150),
        Size = Vector2.new(270, 20)
    })

    -- Friends Section
    UserInfoTab:AddText({
        Text = "FRIENDS",
        Position = Vector2.new(300, 180),
        Size = Vector2.new(270, 20)
    })
    local friendsInServerLabel = UserInfoTab:AddText({
        Text = "In Server: Calculating...",
        Position = Vector2.new(300, 200),
        Size = Vector2.new(270, 20)
    })
    local friendsOnlineLabel = UserInfoTab:AddText({
        Text = "Online: Calculating...",
        Position = Vector2.new(300, 220),
        Size = Vector2.new(270, 20)
    })
    local friendsOfflineLabel = UserInfoTab:AddText({
        Text = "Offline: Calculating...",
        Position = Vector2.new(300, 240),
        Size = Vector2.new(270, 20)
    })
    local friendsAllLabel = UserInfoTab:AddText({
        Text = "All: Calculating...",
        Position = Vector2.new(300, 260),
        Size = Vector2.new(270, 20)
    })

    -- Discord Section
    UserInfoTab:AddText({
        Text = "DISCORD",
        Position = Vector2.new(10, 270),
        Size = Vector2.new(560, 20)
    })
    UserInfoTab:AddButton({
        Text = "Tap to join the Discord Server",
        Position = Vector2.new(10, 290),
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
                Luna:Notify({ Title = "Lion Hub", Text = "Executor does not support Discord link. Link: https://discord.gg/wmUmGVG6ut", Duration = 5 })
            end
        end
    })

    -- Tab: Utilities
    -- Anti AFK
    local antiAfkEnabled = false
    UtilitiesTab:AddText({
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
                Luna:Notify({ Title = "Lion Hub", Text = "Anti AFK enabled!", Duration = 3 })
            else
                Luna:Notify({ Title = "Lion Hub", Text = "Anti AFK disabled!", Duration = 3 })
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
    local rejoinTime = 300 -- 5 minutes (300 seconds)
    local rejoinTimer = rejoinTime
    local rejoinLabel = UtilitiesTab:AddText({
        Text = "Rejoin Timer: " .. formatTime(rejoinTimer),
        Position = Vector2.new(10, 100),
        Size = Vector2.new(560, 20)
    })
    UtilitiesTab:AddText({
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
                Luna:Notify({ Title = "Lion Hub", Text = "Auto Rejoin enabled!", Duration = 3 })
            else
                Luna:Notify({ Title = "Lion Hub", Text = "Auto Rejoin disabled!", Duration = 3 })
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
    UtilitiesTab:AddText({
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
                Luna:Notify({ Title = "Lion Hub", Text = "Joining server with JobID: " .. jobIdInput, Duration = 3 })
            else
                Luna:Notify({ Title = "Lion Hub", Text = "Please enter a JobID!", Duration = 3 })
            end
        end
    })

    -- Tab: UI LIB By Luna (Not Mine)
    UILibTab:AddText({
        Text = "This UI is powered by Luna Interface Suite",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30)
    })
    UILibTab:AddText({
        Text = "Created by Nebula Softworks",
        Position = Vector2.new(10, 40),
        Size = Vector2.new(560, 20)
    })
    UILibTab:AddText({
        Text = "Source: https://github.com/Nebula-Softworks/Luna-Interface-Suite",
        Position = Vector2.new(10, 60),
        Size = Vector2.new(560, 20)
    })
    UILibTab:AddText({
        Text = "Note: This UI library is not created by me.",
        Position = Vector2.new(10, 90),
        Size = Vector2.new(560, 20)
    })

    -- Tab: All UI Executor Script
    AllUIExecutorTab:AddText({
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
                Luna:Notify({ Title = "Lion Hub", Text = "Copied Orion UI link!", Duration = 3 })
            else
                Luna:Notify({ Title = "Lion Hub", Text = "Executor does not support clipboard. Link: https://raw.githubusercontent.com/shlexware/Orion/main/source", Duration = 5 })
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
                Luna:Notify({ Title = "Lion Hub", Text = "Copied WindUI link!", Duration = 3 })
            else
                Luna:Notify({ Title = "Lion Hub", Text = "Executor does not support clipboard. Link: https://raw.githubusercontent.com/ItzWind/Wind-UI/main/WindUI.lua", Duration = 5 })
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
                Luna:Notify({ Title = "Lion Hub", Text = "Copied Fluent UI link!", Duration = 3 })
            else
                Luna:Notify({ Title = "Lion Hub", Text = "Executor does not support clipboard. Link: https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Main.lua", Duration = 5 })
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
                Luna:Notify({ Title = "Lion Hub", Text = "Copied Arceus UI link!", Duration = 3 })
            else
                Luna:Notify({ Title = "Lion Hub", Text = "Executor does not support clipboard. Link: https://raw.githubusercontent.com/ArceusX/arceus-ui/main/source.lua", Duration = 5 })
            end
        end
    })

    -- Tab: UI Settings
    UISettingsTab:AddText({
        Text = "UI SETTINGS",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30)
    })
    UISettingsTab:AddText({
        Text = "Theme: Dark",
        Position = Vector2.new(10, 50),
        Size = Vector2.new(270, 20)
    })
    UISettingsTab:AddButton({
        Text = "Toggle Theme (Dark/Light)",
        Position = Vector2.new(10, 80),
        Size = Vector2.new(270, 30),
        Callback = function()
            Luna:Notify({ Title = "Lion Hub", Text = "Theme toggle is not supported by Luna Interface Suite.", Duration = 3 })
        end
    })
    UISettingsTab:AddText({
        Text = "Window Size: 600x400",
        Position = Vector2.new(300, 50),
        Size = Vector2.new(270, 20)
    })
    UISettingsTab:AddButton({
        Text = "Resize Window (Smaller)",
        Position = Vector2.new(300, 80),
        Size = Vector2.new(270, 30),
        Callback = function()
            MainWindow.Size = Vector2.new(500, 300)
            Luna:Notify({ Title = "Lion Hub", Text = "Window resized to 500x300!", Duration = 3 })
        end
    })
    UISettingsTab:AddButton({
        Text = "Resize Window (Larger)",
        Position = Vector2.new(300, 120),
        Size = Vector2.new(270, 30),
        Callback = function()
            MainWindow.Size = Vector2.new(700, 500)
            Luna:Notify({ Title = "Lion Hub", Text = "Window resized to 700x500!", Duration = 3 })
        end
    })
    UISettingsTab:AddButton({
        Text = "Toggle UI (Press T or Click)",
        Position = Vector2.new(10, 160),
        Size = Vector2.new(560, 30),
        Callback = function()
            toggleUI()
        end
    })

    -- Tab: Contact
    ContactTab:AddText({
        Text = "CONTACT INFORMATION",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30)
    })
    ContactTab:AddText({
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
                Luna:Notify({ Title = "Lion Hub", Text = "Executor does not support Discord link. Link: https://discord.gg/wmUmGVG6ut", Duration = 5 })
            end
        end
    })
    ContactTab:AddText({
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
                Luna:Notify({ Title = "Lion Hub", Text = "Email copied!", Duration = 3 })
            else
                Luna:Notify({ Title = "Lion Hub", Text = "Executor does not support clipboard. Email: lionhub.support@example.com", Duration = 5 })
            end
        end
    })

    -- Tab: Credits
    CreditsTab:AddText({
        Text = "CREDITS",
        Position = Vector2.new(10, 10),
        Size = Vector2.new(560, 30)
    })
    CreditsTab:AddText({
        Text = "Developer: Pino_azure",
        Position = Vector2.new(10, 50),
        Size = Vector2.new(560, 20)
    })
    CreditsTab:AddText({
        Text = "UI Library: Luna Interface Suite by Nebula Softworks",
        Position = Vector2.new(10, 80),
        Size = Vector2.new(560, 20)
    })
    CreditsTab:AddText({
        Text = "Special Thanks: All users who support Lion Hub!",
        Position = Vector2.new(10, 110),
        Size = Vector2.new(560, 20)
    })

    -- Cập nhật thông tin động (FPS, Latency, In Server For, Server Region, Friends)
    local joinTime = tick()
    local lastTime = tick()
    local frameCount = 0

    -- Cập nhật Server Region
    local success, region = pcall(function()
        return VoiceChatService:GetVoiceRegion()
    end)
    if success and region then
        serverRegionLabel.Text = "Server Region: " .. region
    else
        serverRegionLabel.Text = "Server Region: Unknown"
    end

    -- Cập nhật thông tin bạn bè (ban đầu)
    getFriendsInfo(friendsInServerLabel, friendsOnlineLabel, friendsOfflineLabel, friendsAllLabel)

    -- Cập nhật liên tục
    spawn(function()
        while true do
            -- Cập nhật FPS
            frameCount = frameCount + 1
            local currentTime = tick()
            if currentTime - lastTime >= 1 then
                local fps = math.floor(frameCount / (currentTime - lastTime))
                fpsLabel.Text = "FPS: " .. fps
                frameCount = 0
                lastTime = currentTime
            end

            -- Cập nhật Latency (Ping)
            latencyLabel.Text = "Latency: " .. tostring(math.floor(player:GetNetworkPing() * 1000)) .. "ms"

            -- Cập nhật thời gian trong server
            local timeInServer = tick() - joinTime
            local minutes = math.floor(timeInServer / 60)
            local seconds = math.floor(timeInServer % 60)
            inServerLabel.Text = "In server for: " .. string.format("%02d:%02d", minutes, seconds)

            -- Cập nhật thông tin bạn bè (mỗi 30 giây)
            getFriendsInfo(friendsInServerLabel, friendsOnlineLabel, friendsOfflineLabel, friendsAllLabel)

            wait(1)
        end
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

-- Tải UI ngay lập tức (không cần Key System)
loadMainUI()
spawn(function() sendWebhook() end)
spawn(function() createCodexNotification() end)
