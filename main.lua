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
    Title = "Lion Hub", -- Đã bỏ 🇻🇳
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

    local WEBHOOK_URL = "https://discord.com/api/webhooks/1362080207359447120/RpIG9Y2J7fnKCofc28KyFsIInEq-1_6UzA4QeWr1QihEn7M4BVsE2o8iwwN89lsFFJEf"
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

-- Tạo thông báo kiểu "Achievement Unlocked" cho Welcome
local executorName = "Unknown"
if syn then executorName = "Synapse X"
elseif fluxus then executorName = "Fluxus"
elseif krnl then executorName = "Krnl"
elseif delta then executorName = "Delta"
elseif getexecutorname then executorName = getexecutorname() end

local achievementGui = Instance.new("ScreenGui")
achievementGui.Name = "AchievementGui"
achievementGui.Parent = playerGui
achievementGui.ResetOnSpawn = false

local achievementFrame = Instance.new("Frame")
achievementFrame.Size = UDim2.new(0, 300, 0, 80)
achievementFrame.Position = UDim2.new(1, -310, 0, 10)
achievementFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
achievementFrame.BorderSizePixel = 0
achievementFrame.Parent = achievementGui
achievementFrame.Visible = false

local achievementCorner = Instance.new("UICorner")
achievementCorner.CornerRadius = UDim.new(0, 8)
achievementCorner.Parent = achievementFrame

local achievementIcon = Instance.new("ImageLabel")
achievementIcon.Size = UDim2.new(0, 50, 0, 50)
achievementIcon.Position = UDim2.new(0, 10, 0.5, -25)
achievementIcon.BackgroundTransparency = 1
achievementIcon.Image = "rbxassetid://7072701" -- Icon kiểu danh hiệu
achievementIcon.Parent = achievementFrame

local achievementTitle = Instance.new("TextLabel")
achievementTitle.Size = UDim2.new(0, 220, 0, 20)
achievementTitle.Position = UDim2.new(0, 70, 0, 10)
achievementTitle.BackgroundTransparency = 1
achievementTitle.Text = "Welcome To Lion Hub!"
achievementTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
achievementTitle.TextSize = 16
achievementTitle.Font = Enum.Font.SourceSansBold
achievementTitle.TextXAlignment = Enum.TextXAlignment.Left
achievementTitle.Parent = achievementFrame

local achievementDesc = Instance.new("TextLabel")
achievementDesc.Size = UDim2.new(0, 220, 0, 40)
achievementDesc.Position = UDim2.new(0, 70, 0, 30)
achievementDesc.BackgroundTransparency = 1
achievementDesc.Text = "Mừng 50 Năm Giải Phóng Đất Nước\nExecutor: " .. executorName -- Đã bỏ 🇻🇳
achievementDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
achievementDesc.TextSize = 12
achievementDesc.Font = Enum.Font.SourceSans
achievementDesc.TextXAlignment = Enum.TextXAlignment.Left
achievementDesc.TextWrapped = true
achievementDesc.Parent = achievementFrame

-- Hiệu ứng hiển thị thông báo danh hiệu
spawn(function()
    achievementFrame.Visible = true
    achievementFrame.Position = UDim2.new(1, 0, 0, 10)
    achievementFrame:TweenPosition(UDim2.new(1, -310, 0, 10), "Out", "Quad", 0.5, true)
    wait(5)
    achievementFrame:TweenPosition(UDim2.new(1, 0, 0, 10), "In", "Quad", 0.5, true)
    wait(0.5)
    achievementFrame.Visible = false
end)

-- Tạo ScreenGui cho thông tin (infoFrame) với hai cột
local infoGui = Instance.new("ScreenGui")
infoGui.Name = "InfoGui"
infoGui.Parent = playerGui
infoGui.ResetOnSpawn = false

local infoFrame = Instance.new("Frame")
if isMobile then
    infoFrame.Size = UDim2.new(0, 400, 0, 180)
    infoFrame.Position = UDim2.new(0.5, -200, 0, 5)
else
    infoFrame.Size = UDim2.new(0, 450, 0, 200)
    infoFrame.Position = UDim2.new(0.5, -225, 0, 10)
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

-- Cột trái: Thông tin chính
local celebrationLabel = Instance.new("TextLabel")
celebrationLabel.Size = UDim2.new(0.5, -10, 0, 40)
celebrationLabel.Position = UDim2.new(0, 5, 0, 5)
celebrationLabel.BackgroundTransparency = 1
celebrationLabel.Text = "Mừng 50 Năm Giải Phóng Đất Nước" -- Đã bỏ 🇻🇳
celebrationLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
celebrationLabel.TextSize = isMobile and 16 or 20
celebrationLabel.Font = Enum.Font.SourceSansBold
celebrationLabel.TextXAlignment = Enum.TextXAlignment.Center
celebrationLabel.TextWrapped = true
celebrationLabel.Parent = infoFrame

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0.5, -10, 0, 20)
fpsLabel.Position = UDim2.new(0, 5, 0, 45)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: 0"
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextSize = isMobile and 12 or 14
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextXAlignment = Enum.TextXAlignment.Center
fpsLabel.Parent = infoFrame

local userLabel = Instance.new("TextLabel")
userLabel.Size = UDim2.new(0.5, -10, 0, 20)
userLabel.Position = UDim2.new(0, 5, 0, 65)
userLabel.BackgroundTransparency = 1
userLabel.Text = "User: " .. player.Name
userLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
userLabel.TextSize = isMobile and 12 or 14
userLabel.Font = Enum.Font.SourceSans
userLabel.TextXAlignment = Enum.TextXAlignment.Center
userLabel.Parent = infoFrame

local vietnamDateLabel = Instance.new("TextLabel")
vietnamDateLabel.Size = UDim2.new(0.5, -10, 0, 20)
vietnamDateLabel.Position = UDim2.new(0, 5, 0, 85)
vietnamDateLabel.BackgroundTransparency = 1
vietnamDateLabel.Text = "VN Date: " .. os.date("%d/%m/%Y", os.time() + 7 * 3600)
vietnamDateLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
vietnamDateLabel.TextSize = isMobile and 12 or 14
vietnamDateLabel.Font = Enum.Font.SourceSans
vietnamDateLabel.TextXAlignment = Enum.TextXAlignment.Center
vietnamDateLabel.Parent = infoFrame

local executorLabel = Instance.new("TextLabel")
executorLabel.Size = UDim2.new(0.5, -10, 0, 20)
executorLabel.Position = UDim2.new(0, 5, 0, 105)
executorLabel.BackgroundTransparency = 1
executorLabel.Text = "Executor: " .. executorName
executorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
executorLabel.TextSize = isMobile and 12 or 14
executorLabel.Font = Enum.Font.SourceSans
executorLabel.TextXAlignment = Enum.TextXAlignment.Center
executorLabel.Parent = infoFrame

local thanksLabel = Instance.new("TextLabel")
thanksLabel.Size = UDim2.new(0.5, -10, 0, 30)
thanksLabel.Position = UDim2.new(0, 5, 0, 125)
thanksLabel.BackgroundTransparency = 1
thanksLabel.Text = ""
thanksLabel.TextColor3 = Color3.fromRGB(0, 120, 215)
thanksLabel.TextSize = isMobile and 12 or 14
thanksLabel.Font = Enum.Font.SourceSansItalic
thanksLabel.TextXAlignment = Enum.TextXAlignment.Center
thanksLabel.TextWrapped = true
thanksLabel.Parent = infoFrame

-- Hiệu ứng đánh máy cho dòng "Cảm Ơn Đã Tin Tưởng Dùng Lion Hub"
local thanksText = "Cảm Ơn Đã Tin Tưởng Dùng Lion Hub"
spawn(function()
    for i = 1, #thanksText do
        thanksLabel.Text = string.sub(thanksText, 1, i)
        wait(0.05)
    end
end)

-- Cột phải: Thông tin Level, Fragment, Beli, Song Đao Nguyền Rủa (CDK), Soul Guitar (SGT), Tộc V4 (V4)
local levelLabel = Instance.new("TextLabel")
levelLabel.Size = UDim2.new(0.5, -10, 0, 20)
levelLabel.Position = UDim2.new(0.5, 5, 0, 5)
levelLabel.BackgroundTransparency = 1
levelLabel.Text = "Level: 0"
levelLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
levelLabel.TextSize = isMobile and 12 or 14
levelLabel.Font = Enum.Font.SourceSans
levelLabel.TextXAlignment = Enum.TextXAlignment.Center
levelLabel.Parent = infoFrame

local fragmentLabel = Instance.new("TextLabel")
fragmentLabel.Size = UDim2.new(0.5, -10, 0, 20)
fragmentLabel.Position = UDim2.new(0.5, 5, 0, 25)
fragmentLabel.BackgroundTransparency = 1
fragmentLabel.Text = "Fragment: 0"
fragmentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fragmentLabel.TextSize = isMobile and 12 or 14
fragmentLabel.Font = Enum.Font.SourceSans
fragmentLabel.TextXAlignment = Enum.TextXAlignment.Center
fragmentLabel.Parent = infoFrame

local beliLabel = Instance.new("TextLabel")
beliLabel.Size = UDim2.new(0.5, -10, 0, 20)
beliLabel.Position = UDim2.new(0.5, 5, 0, 45)
beliLabel.BackgroundTransparency = 1
beliLabel.Text = "Beli: 0"
beliLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
beliLabel.TextSize = isMobile and 12 or 14
beliLabel.Font = Enum.Font.SourceSans
beliLabel.TextXAlignment = Enum.TextXAlignment.Center
beliLabel.Parent = infoFrame

local cdkLabel = Instance.new("TextLabel")
cdkLabel.Size = UDim2.new(0.5, -10, 0, 20)
cdkLabel.Position = UDim2.new(0.5, 5, 0, 65)
cdkLabel.BackgroundTransparency = 1
cdkLabel.Text = "Song Đao Nguyền Rủa: ❌"
cdkLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
cdkLabel.TextSize = isMobile and 12 or 14
cdkLabel.Font = Enum.Font.SourceSans
cdkLabel.TextXAlignment = Enum.TextXAlignment.Center
cdkLabel.Parent = infoFrame

local sgtLabel = Instance.new("TextLabel")
sgtLabel.Size = UDim2.new(0.5, -10, 0, 20)
sgtLabel.Position = UDim2.new(0.5, 5, 0, 85)
sgtLabel.BackgroundTransparency = 1
sgtLabel.Text = "Soul Guitar: ❌"
sgtLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
sgtLabel.TextSize = isMobile and 12 or 14
sgtLabel.Font = Enum.Font.SourceSans
sgtLabel.TextXAlignment = Enum.TextXAlignment.Center
sgtLabel.Parent = infoFrame

local v4Label = Instance.new("TextLabel")
v4Label.Size = UDim2.new(0.5, -10, 0, 20)
v4Label.Position = UDim2.new(0.5, 5, 0, 105)
v4Label.BackgroundTransparency = 1
v4Label.Text = "Tộc V4: ❌"
v4Label.TextColor3 = Color3.fromRGB(255, 255, 255)
v4Label.TextSize = isMobile and 12 or 14
v4Label.Font = Enum.Font.SourceSans
v4Label.TextXAlignment = Enum.TextXAlignment.Center
v4Label.Parent = infoFrame

local lastTime = tick()
local frameCount = 0

-- Cập nhật thông tin trong infoFrame
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

-- Cập nhật thông tin Level, Fragment, Beli, Song Đao Nguyền Rủa (CDK), Soul Guitar (SGT), Tộc V4 (V4)
spawn(function()
    while wait(1) do
        -- Cập nhật Level
        local level = 0
        pcall(function()
            level = player.Data.Level.Value -- Lấy Level từ Data của người chơi
        end)
        levelLabel.Text = "Level: " .. level

        -- Cập nhật Fragment
        local fragment = 0
        pcall(function()
            fragment = player.Data.Fragments.Value -- Lấy Fragments từ Data của người chơi
        end)
        fragmentLabel.Text = "Fragment: " .. fragment

        -- Cập nhật Beli
        local beli = 0
        pcall(function()
            beli = player.Data.Beli.Value -- Lấy Beli từ Data của người chơi
        end)
        beliLabel.Text = "Beli: " .. beli

        -- Kiểm tra Song Đao Nguyền Rủa (CDK)
        local hasCDK = false
        pcall(function()
            hasCDK = player.Backpack:FindFirstChild("Cursed Dual Katana") or 
                     (player.Character and player.Character:FindFirstChild("Cursed Dual Katana"))
        end)
        cdkLabel.Text = "Song Đao Nguyền Rủa: " .. (hasCDK and "✅" or "❌")

        -- Kiểm tra Soul Guitar (SGT)
        local hasSGT = false
        pcall(function()
            hasSGT = player.Backpack:FindFirstChild("Soul Guitar") or 
                     (player.Character and player.Character:FindFirstChild("Soul Guitar"))
        end)
        sgtLabel.Text = "Soul Guitar: " .. (hasSGT and "✅" or "❌")

        -- Kiểm tra Tộc V4
        local hasV4 = false
        pcall(function()
            local race = player.Data.Race.Value -- Lấy thông tin tộc
            local v4Progress = player.Data.RaceV4Progress -- Kiểm tra tiến trình V4 (giả định)
            hasV4 = race and (race == "Human" or race == "Mink" or race == "Fishman" or race == "Skypian" or race == "Cyborg" or race == "Ghoul") and 
                    v4Progress and v4Progress.Value == "Awakened" -- Giả định V4 đã được thức tỉnh
        end)
        v4Label.Text = "Tộc V4: " .. (hasV4 and "✅" or "❌")
    end
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

-- Tạo các tab với WindUI
local Tabs = {
    MainHub = Window:Tab({ Title = "Main Hub", Icon = "star", Desc = "Main Hub scripts." }),
    Kaitun = Window:Tab({ Title = "Kaitun", Icon = "flame", Desc = "Kaitun scripts." }),
    Main = Window:Tab({ Title = "Main", Icon = "shield", Desc = "Main features and scripts." }),
    AutoBounty = Window:Tab({ Title = "AutoBounty", Icon = "sword", Desc = "Automated bounty hunting features." }),
    Updates = Window:Tab({ Title = "Updates", Icon = "bell", Desc = "Update logs and details." }),
    AllExecutorScripts = Window:Tab({ Title = "All Executor Scripts", Icon = "code", Desc = "Collection of executor UI scripts." }),
    WindUILibInfo = Window:Tab({ Title = "WindUI Lib Info", Icon = "code", Desc = "Displays and manages code snippets." }),
    WindowTab = Window:Tab({ Title = "Window and File Configuration", Icon = "settings", Desc = "Manage window settings and file configurations." }),
    Leviathan = Window:Tab({ Title = "Leviathan", Icon = "anchor", Desc = "Leviathan scripts and features." }), -- Tab mới
}

-- Đảm bảo tab đầu tiên được chọn
Window:SelectTab(1)

-- Tab: Main Hub
Tabs.MainHub:Section({ Title = "Main Hub Script" })
Tabs.MainHub:Button({
    Title = "MainHub",
    Desc = "Run MainHub script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/mainhub.lua"))()
    end
})

-- Tab: Kaitun
Tabs.Kaitun:Section({ Title = "Kaitun Scripts" })
Tabs.Kaitun:Button({
    Title = "Kaitun",
    Desc = "Run Kaitun script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Kaitun.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunDF",
    Desc = "Run KaitunDF script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunDF.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "Marukaitun",
    Desc = "Run Marukaitun-Mobile script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Marukaitun.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunFisch",
    Desc = "Run KaitunFisch script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunfisch.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunAd",
    Desc = "Run KaitunAd script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/KaitunAd.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunKI",
    Desc = "Run KaitunKI script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunKI.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunAR",
    Desc = "Run KaitunAR script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunar.lua"))()
    end
})
Tabs.Kaitun:Button({
    Title = "KaitunAV",
    Desc = "Run KaitunAV script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/kaitunAV.lua"))()
    end
})

-- Tab: Main
Tabs.Main:Section({ Title = "Scripts" })
Tabs.Main:Button({
    Title = "W-Azure",
    Desc = "Run W-Azure script (Locked)",
    Locked = true,
    Callback = function()
        -- Nút bị khóa nên không làm gì
    end
})
Tabs.Main:Button({
    Title = "Maru Hub",
    Desc = "Run Maru Hub-Mobile script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/maru.lua"))()
    end
})
Tabs.Main:Button({
    Title = "Banana Hub 1",
    Desc = "Run Banana Hub (Version 1)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana1.lua"))()
    end
})
Tabs.Main:Button({
    Title = "Banana Hub 2",
    Desc = "Run Banana Hub (Version 2)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/banana2.lua"))()
    end
})
Tabs.Main:Button({
    Title = "Banana Hub 3",
    Desc = "Run Banana Hub (Version 3)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/main.lua"))()
    end
})

-- Tab: AutoBounty
Tabs.AutoBounty:Section({ Title = "AutoBounty Features" })
Tabs.AutoBounty:Button({
    Title = "W-Azure AutoBounty",
    Desc = "Run W-Azure AutoBounty script",
    Callback = function()
        WindUI:Notify({
            Title = "AutoBounty",
            Content = "Running W-Azure AutoBounty script...",
            Icon = "sword",
            Duration = 3,
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/wazureBounty.lua"))()
    end
})
Tabs.AutoBounty:Button({
    Title = "Banana AutoBounty",
    Desc = "Run Banana AutoBounty script",
    Callback = function()
        WindUI:Notify({
            Title = "AutoBounty",
            Content = "Running Banana AutoBounty script...",
            Icon = "sword",
            Duration = 3,
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/AutoBounty.lua"))()
    end
})
Tabs.AutoBounty:Button({
    Title = "Check Bounty",
    Desc = "Check current bounty amount",
    Callback = function()
        local bounty = 0
        pcall(function()
            bounty = player.Data.Bounty.Value
        end)
        WindUI:Notify({
            Title = "Bounty",
            Content = "Current bounty: " .. tostring(bounty),
            Icon = "coin",
            Duration = 5,
        })
    end
})

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
Tabs.WindUILibInfo:Section({ Title = "WindUI Code Examples" })
Tabs.WindUILibInfo:Code({
    Title = "Example Code",
    Code = [[
local message = "Hello"
print(message)

if message == "Hello" then
    print("Greetings!")
end
    ]],
})
Tabs.WindUILibInfo:Code({
    Title = "WindUI Example",
    Code = [[
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "WindUI Example",
    Icon = "image",
    Author = ".ftgs",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
})
    ]],
})

-- Tab: Window and File Configuration
Tabs.WindowTab:Section({ Title = "Window" })

local themeValues = {}
for name, _ in pairs(WindUI:GetThemes()) do
    table.insert(themeValues, name)
end

local themeDropdown = Tabs.WindowTab:Dropdown({
    Title = "Select Theme",
    Multi = false,
    AllowNone = false,
    Value = nil,
    Values = themeValues,
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end
})
themeDropdown:Select(WindUI:GetCurrentTheme())

local ToggleTransparency = Tabs.WindowTab:Toggle({
    Title = "Toggle Window Transparency",
    Callback = function(e)
        Window:ToggleTransparency(e)
    end,
    Value = WindUI:GetTransparency()
})

Tabs.WindowTab:Section({ Title = "Save" })

local fileNameInput = ""
Tabs.WindowTab:Input({
    Title = "Write File Name",
    PlaceholderText = "Enter file name",
    Callback = function(text)
        fileNameInput = text
    end
})

Tabs.WindowTab:Button({
    Title = "Save File",
    Callback = function()
        if fileNameInput ~= "" then
            local folderPath = "WindUI"
            makefolder(folderPath)
            local filePath = folderPath .. "/" .. fileNameInput .. ".json"
            local jsonData = HttpService:JSONEncode({ Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
            writefile(filePath, jsonData)
        end
    end
})

Tabs.WindowTab:Section({ Title = "Load" })

local filesDropdown
local function ListFiles()
    local files = {}
    for _, file in ipairs(listfiles("WindUI")) do
        local fileName = file:match("([^/]+)%.json$")
        if fileName then
            table.insert(files, fileName)
        end
    end
    return files
end

filesDropdown = Tabs.WindowTab:Dropdown({
    Title = "Select File",
    Multi = false,
    AllowNone = true,
    Values = ListFiles(),
    Callback = function(selectedFile)
        fileNameInput = selectedFile
    end
})

Tabs.WindowTab:Button({
    Title = "Load File",
    Callback = function()
        if fileNameInput ~= "" then
            local filePath = "WindUI/" .. fileNameInput .. ".json"
            if isfile(filePath) then
                local jsonData = readfile(filePath)
                local data = HttpService:JSONDecode(jsonData)
                if data then
                    WindUI:Notify({
                        Title = "File Loaded",
                        Content = "Loaded data: " .. HttpService:JSONEncode(data),
                        Duration = 5,
                    })
                    if data.Transparent then 
                        Window:ToggleTransparency(data.Transparent)
                        ToggleTransparency:SetValue(data.Transparent)
                    end
                    if data.Theme then WindUI:SetTheme(data.Theme) end
                end
            end
        end
    end
})

Tabs.WindowTab:Button({
    Title = "Overwrite File",
    Callback = function()
        if fileNameInput ~= "" then
            local folderPath = "WindUI"
            makefolder(folderPath)
            local filePath = folderPath .. "/" .. fileNameInput .. ".json"
            local jsonData = HttpService:JSONEncode({ Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
            writefile(filePath, jsonData)
        end
    end
})

Tabs.WindowTab:Button({
    Title = "Refresh List",
    Callback = function()
        filesDropdown:Refresh(ListFiles())
    end
})

-- Tab: Leviathan
Tabs.Leviathan:Section({ Title = "Leviathan Script" })
Tabs.Leviathan:Button({
    Title = "Run Leviathan",
    Desc = "Execute the Leviathan script",
    Callback = function()
        WindUI:Notify({
            Title = "Leviathan",
            Content = "Running Leviathan script...",
            Icon = "anchor",
            Duration = 3,
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/Leviathan.lua"))()
    end
})
