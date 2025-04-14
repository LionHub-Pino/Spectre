local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")

-- Kiểm tra thiết bị
local isMobile = UserInputService.TouchEnabled
local thumbnailImage = isMobile and "rbxassetid://5341014178" or "rbxassetid://13953902891"

-- Thời gian bắt đầu để tính thời gian tải
local startTime = tick()

-- Key System GUI
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "KeyGui"
KeyGui.Parent = playerGui
KeyGui.ResetOnSpawn = false

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 300, 0, 200)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyFrame.Parent = KeyGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 8)
KeyCorner.Parent = KeyFrame

local KeyThumbnail = Instance.new("ImageLabel")
KeyThumbnail.Size = UDim2.new(0, 50, 0, 50)
KeyThumbnail.Position = UDim2.new(0.5, -25, 0, 10)
KeyThumbnail.BackgroundTransparency = 1
KeyThumbnail.Image = thumbnailImage
KeyThumbnail.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(0, 260, 0, 30)
KeyTitle.Position = UDim2.new(0.5, -130, 0, 70)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "Lion Hub Key System"
KeyTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
KeyTitle.TextSize = 16
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.Parent = KeyFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0, 260, 0, 40)
KeyInput.Position = UDim2.new(0.5, -130, 0, 110)
KeyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderText = "Nhập key..."
KeyInput.Text = ""
KeyInput.Parent = KeyFrame

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0, 100, 0, 40)
SubmitButton.Position = UDim2.new(0.5, -50, 0, 160)
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.Text = "Xác nhận"
SubmitButton.Parent = KeyFrame

local validKeys = { "pino_ontop", "LionHub", "VietNam" }
SubmitButton.MouseButton1Click:Connect(function()
    local enteredKey = KeyInput.Text
    for _, key in ipairs(validKeys) do
        if enteredKey == key then
            KeyGui:Destroy()
            initializeUI()
            return
        end
    end
    KeyInput.Text = ""
    KeyInput.PlaceholderText = "Key sai! Thử lại."
end)

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

-- Hàm gửi webhook
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

-- Hàm hiển thị thông báo tùy chỉnh
local function showNotification(title, content, duration)
    local notifyGui = Instance.new("ScreenGui", playerGui)
    notifyGui.ResetOnSpawn = false
    local notifyFrame = Instance.new("Frame", notifyGui)
    notifyFrame.Size = UDim2.new(0, 250, 0, 80)
    notifyFrame.Position = UDim2.new(0.5, -125, 0, 10)
    notifyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    local corner = Instance.new("UICorner", notifyFrame)
    corner.CornerRadius = UDim.new(0, 8)
    local notifyTitle = Instance.new("TextLabel", notifyFrame)
    notifyTitle.Size = UDim2.new(1, -10, 0, 20)
    notifyTitle.Position = UDim2.new(0, 5, 0, 5)
    notifyTitle.BackgroundTransparency = 1
    notifyTitle.Text = title
    notifyTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    notifyTitle.TextSize = 16
    notifyTitle.Font = Enum.Font.SourceSansBold
    local notifyText = Instance.new("TextLabel", notifyFrame)
    notifyText.Size = UDim2.new(1, -10, 0, 50)
    notifyText.Position = UDim2.new(0, 5, 0, 25)
    notifyText.BackgroundTransparency = 1
    notifyText.Text = content
    notifyText.TextColor3 = Color3.fromRGB(200, 200, 200)
    notifyText.TextSize = 12
    notifyText.Font = Enum.Font.SourceSans
    notifyText.TextWrapped = true
    spawn(function()
        wait(duration or 3)
        notifyGui:Destroy()
    end)
end

-- Hàm khởi tạo UI chính
function initializeUI()
    -- Tải Ocerium UI
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/slf0Dev/Ocerium_Project/main/Library.lua"))()
    local Window = Library.Main("Lion Hub", "RightShift")

    -- Tạo tabs
    local Tabs = {
        MainHub = Window.NewTab("Main Hub"),
        Kaitun = Window.NewTab("Kaitun"),
        Main = Window.NewTab("Main"),
        AutoBounty = Window.NewTab("AutoBounty"),
        Updates = Window.NewTab("Updates"),
        AllExecutorScripts = Window.NewTab("Executor Scripts"),
        LibInfo = Window.NewTab("UI Lib Info"),
        Settings = Window.NewTab("Settings"),
    }

    -- Tab MainHub
    local MainHubSection = Tabs.MainHub.NewSection("Main Hub Script")
    MainHubSection.NewButton("MainHub", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/mainhub.lua"))()
    end)

    -- Tab Kaitun
    local KaitunSection = Tabs.Kaitun.NewSection("Kaitun Scripts")
    KaitunSection.NewButton("Kaitun", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Kaitun.lua"))()
    end)
    KaitunSection.NewButton("KaitunDF", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunDF.lua"))()
    end)
    KaitunSection.NewButton("Marukaitun", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/Marukaitun.lua"))()
    end)
    KaitunSection.NewButton("KaitunFisch", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunfisch.lua"))()
    end)
    KaitunSection.NewButton("KaitunAd", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/KaitunAd.lua"))()
    end)
    KaitunSection.NewButton("KaitunKI", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunKI.lua"))()
    end)
    KaitunSection.NewButton("KaitunAR", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunar.lua"))()
    end)
    KaitunSection.NewButton("KaitunAV", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/kaitunAV.lua"))()
    end)

    -- Tab Main
    local MainSection = Tabs.Main.NewSection("Scripts")
    MainSection.NewButton("Maru Hub", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/maru.lua"))()
    end)
    MainSection.NewButton("Banana Hub 1", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana1.lua"))()
    end)
    MainSection.NewButton("Banana Hub 2", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/banana2.lua"))()
    end)
    MainSection.NewButton("Banana Hub 3", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/main.lua"))()
    end)

    -- Tab AutoBounty
    local AutoBountySection = Tabs.AutoBounty.NewSection("AutoBounty Features")
    AutoBountySection.NewButton("W-Azure AutoBounty", function()
        showNotification("AutoBounty", "Running W-Azure AutoBounty script...", 3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/wazureBounty.lua"))()
    end)
    AutoBountySection.NewButton("Banana AutoBounty", function()
        showNotification("AutoBounty", "Running Banana AutoBounty script...", 3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/AutoBounty.lua"))()
    end)
    AutoBountySection.NewButton("Check Bounty", function()
        local bounty = 0
        pcall(function()
            bounty = player.Data.Bounty.Value
        end)
        showNotification("Bounty", "Current bounty: " .. tostring(bounty), 5)
    end)

    -- Tab Updates
    local UpdatesSection = Tabs.Updates.NewSection("Update Logs")
    UpdatesSection.NewButton("View Updates", function()
        local messages = {
            {title = "Update Log - Part 1", content = "- English-Vietnamese\n- Available on all clients\n- Works on all clients", duration = 5},
            {title = "Update Log - Part 2", content = "- Android - iOS - PC\n- Supports Vietnamese scripts for Vietnamese users", duration = 5},
            {title = "Update Log - Part 3", content = "- Tool support\n- Weekly updates", duration = 5}
        }
        for _, msg in ipairs(messages) do
            showNotification(msg.title, msg.content, msg.duration)
            wait(msg.duration + 0.1)
        end
    end)

    -- Tab AllExecutorScripts
    local ExecutorScriptsSection = Tabs.AllExecutorScripts.NewSection("Executor UI Scripts")
    ExecutorScriptsSection.NewButton("Fluent UI", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/refs/heads/master/Example.lua"))()
    end)
    ExecutorScriptsSection.NewButton("WindUI", function()
        loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
    end)
    ExecutorScriptsSection.NewButton("Delta UI", function()
        if setclipboard then
            setclipboard("https://delta-executor.com/")
            showNotification("Lion Hub", "Copied Delta UI link!", 3)
        end
    end)

    -- Tab LibInfo
    local LibInfoSection = Tabs.LibInfo.NewSection("UI Code Examples")
    LibInfoSection.NewLabel("Example Code:")
    LibInfoSection.NewLabel([[
local message = "Hello"
print(message)

if message == "Hello" then
    print("Greetings!")
end
    ]])
    LibInfoSection.NewLabel("Ocerium UI Example:")
    LibInfoSection.NewLabel([[
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/slf0Dev/Ocerium_Project/main/Library.lua"))()
local Window = Library.Main("Example UI", "RightShift")
local Tab = Window.NewTab("Tab")
local Section = Tab.NewSection("Section")
Section.NewButton("Click me", function()
    print("Button clicked!")
end)
    ]])

    -- Tab Settings
    local SettingsSection = Tabs.Settings.NewSection("Settings")
    SettingsSection.NewToggle("Toggle Info Frame", function(bool)
        infoGui.Enabled = bool
    end, true)

    -- Gửi webhook
    spawn(function()
        sendWebhook()
    end)
end

-- Achievement Notification
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
achievementCorner.Parent interiores = Instance.new("ImageLabel")
achievementIcon.Size = UDim2.new(0, 50, 0, 50)
achievementIcon.Position = UDim2.new(0, 10, 0.5, -25)
achievementIcon.BackgroundTransparency = 1
achievementIcon.Image = "rbxassetid://7072701"
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
achievementDesc.Text = "Mừng 50 Năm Giải Phóng Đất Nước\nExecutor: " .. executorName
achievementDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
achievementDesc.TextSize = 12
achievementDesc.Font = Enum.Font.SourceSans
achievementDesc.TextXAlignment = Enum.TextXAlignment.Left
achievementDesc.TextWrapped = true
achievementDesc.Parent = achievementFrame

spawn(function()
    achievementFrame.Visible = true
    achievementFrame.Position = UDim2.new(1, 0, 0, 10)
    achievementFrame:TweenPosition(UDim2.new(1, -310, 0, 10), "Out", "Quad", 0.5, true)
    wait(5)
    achievementFrame:TweenPosition(UDim2.new(1, 0, 0, 10), "In", "Quad", 0.5, true)
    wait(0.5)
    achievementFrame.Visible = false
end)

-- Khung thông tin (Info Frame)
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

local celebrationLabel = Instance.new("TextLabel")
celebrationLabel.Size = UDim2.new(0.5, -10, 0, 40)
celebrationLabel.Position = UDim2.new(0, 5, 0, 5)
celebrationLabel.BackgroundTransparency = 1
celebrationLabel.Text = "Mừng 50 Năm Giải Phóng Đất Nước"
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

local thanksText = "Cảm Ơn Đã Tin Tưởng Dùng Lion Hub"
spawn(function()
    for i = 1, #thanksText do
        thanksLabel.Text = string.sub(thanksText, 1, i)
        wait(0.05)
    end
end)

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
beliLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
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

spawn(function()
    while wait(1) do
        local level = 0
        pcall(function()
            level = player.Data.Level.Value
        end)
        levelLabel.Text = "Level: " .. level

        local fragment = 0
        pcall(function()
            fragment = player.Data.Fragments.Value
        end)
        fragmentLabel.Text = "Fragment: " .. fragment

        local beli = 0
        pcall(function()
            beli = player.Data.Beli.Value
        end)
        beliLabel.Text = "Beli: " .. beli

        local hasCDK = false
        pcall(function()
            hasCDK = player.Backpack:FindFirstChild("Cursed Dual Katana") or 
                     (player.Character and player.Character:FindFirstChild("Cursed Dual Katana"))
        end)
        cdkLabel.Text = "Song Đao Nguyền Rủa: " .. (hasCDK and "✅" or "❌")

        local hasSGT = false
        pcall(function()
            hasSGT = player.Backpack:FindFirstChild("Soul Guitar") or 
                     (player.Character and player.Character:FindFirstChild("Soul Guitar"))
        end)
        sgtLabel.Text = "Soul Guitar: " .. (hasSGT and "✅" or "❌")

        local hasV4 = false
        pcall(function()
            local race = player.Data.Race.Value
            local v4Progress = player.Data.RaceV4Progress
            hasV4 = race and (race == "Human" or race == "Mink" or race == "Fishman" or race == "Skypian" or race == "Cyborg" or race == "Ghoul") and 
                    v4Progress and v4Progress.Value == "Awakened"
        end)
        v4Label.Text = "Tộc V4: " .. (hasV4 and "✅" or "❌")
    end
end)

-- Anti-AFK
spawn(function()
    while true do
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        wait(60)
    end
end)
