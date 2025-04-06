local service = 3217 -- Thay bằng Platoboost Service ID của bạn
local secret = "b4fc504c-13ea-4c85-b632-0e9419ddf993" -- Thay bằng Platoboost API Secret Key của bạn
local useNonce = true

-- Hiển thị thông báo trong chat
local onMessage = function(message)
    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", { Text = message })
end

-- Chờ game load
repeat task.wait(1) until game:IsLoaded()

-- Biến và hàm cơ bản
local requestSending = false
local fSetClipboard, fRequest, fStringChar, fToString, fStringSub, fOsTime, fMathRandom, fMathFloor, fGetHwid = setclipboard or toclipboard, request or http_request or syn_request, string.char, tostring, string.sub, os.time, math.random, math.floor, gethwid or function() return game:GetService("Players").LocalPlayer.UserId end
local cachedLink, cachedTime = "", 0
local HttpService = game:GetService("HttpService")

-- Hàm JSON và Digest
local lEncode = HttpService.JSONEncode
local lDecode = HttpService.JSONDecode
local function lDigest(input)
    local inputStr = tostring(input)
    local hash = {}
    for i = 1, #inputStr do
        hash[#hash + 1] = string.byte(inputStr, i)
    end
    return table.concat(hash, "", 1, #hash):lower():match("(%x+)")
end

-- Chọn host
local host = "https://api.platoboost.com"
if fRequest({ Url = host .. "/public/connectivity", Method = "GET" }).StatusCode ~= 200 then
    host = "https://api.platoboost.net"
end

-- Lấy link từ Platoboost
local function cacheLink()
    if cachedTime + 600 < fOsTime() then
        local response = fRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({ service = service, identifier = lDigest(fGetHwid()) }),
            Headers = { ["Content-Type"] = "application/json" }
        })
        if response.StatusCode == 200 then
            local decoded = lDecode(response.Body)
            if decoded.success then
                cachedLink = decoded.data.url
                cachedTime = fOsTime()
                return true, cachedLink
            else
                onMessage(decoded.message)
                return false
            end
        elseif response.StatusCode == 429 then
            onMessage("you are being rate limited, please wait 20 seconds.")
            return false
        else
            onMessage("Failed to cache link.")
            return false
        end
    end
    return true, cachedLink
end

cacheLink()

-- Tạo nonce
local function generateNonce()
    local str = ""
    for _ = 1, 16 do
        str = str .. fStringChar(fMathFloor(fMathRandom() * 26) + 97)
    end
    return str
end

-- Sao chép link
local function copyLink()
    local success, link = cacheLink()
    if success then
        fSetClipboard(link)
        return true, link
    end
    return false
end

-- Xác thực key
local function verifyKey(key)
    if requestSending then
        onMessage("Request in progress, please wait.")
        return false
    end
    requestSending = true

    local nonce = generateNonce()
    local endpoint = host .. "/public/whitelist/" .. fToString(service) .. "?identifier=" .. lDigest(fGetHwid()) .. "&key=" .. key
    if useNonce then endpoint = endpoint .. "&nonce=" .. nonce end

    local response = fRequest({ Url = endpoint, Method = "GET" })
    requestSending = false

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body)
        if decoded.success and decoded.data.valid then
            if useNonce and decoded.data.hash ~= lDigest("true-" .. nonce .. "-" .. secret) then
                onMessage("Failed to verify integrity.")
                return false
            end
            return true
        elseif fStringSub(key, 1, 4) == "FREE_" then
            return redeemKey(key)
        else
            onMessage(decoded.message or "Key is invalid.")
            return false
        end
    elseif response.StatusCode == 429 then
        onMessage("Rate limited, wait 20 seconds.")
        return false
    else
        onMessage("Server error, try again later.")
        return false
    end
end

-- Redeem key
local function redeemKey(key)
    local nonce = generateNonce()
    local endpoint = host .. "/public/redeem/" .. fToString(service)
    local body = { identifier = lDigest(fGetHwid()), key = key }
    if useNonce then body.nonce = nonce end

    local response = fRequest({
        Url = endpoint,
        Method = "POST",
        Body = lEncode(body),
        Headers = { ["Content-Type"] = "application/json" }
    })

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body)
        if decoded.success and decoded.data.valid then
            if useNonce and decoded.data.hash ~= lDigest("true-" .. nonce .. "-" .. secret) then
                onMessage("Failed to verify integrity.")
                return false
            end
            return true
        elseif fStringSub(decoded.message, 1, 27) == "unique constraint violation" then
            onMessage("Key already active, wait for it to expire.")
            return false
        else
            onMessage(decoded.message or "Key is invalid.")
            return false
        end
    elseif response.StatusCode == 429 then
        onMessage("Rate limited, wait 20 seconds.")
        return false
    else
        onMessage("Server error, try again later.")
        return false
    end
end

-- Bắt đầu script WindUI
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Tải WindUI Lib
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()

-- Kiểm tra thiết bị
local isMobile = UserInputService.TouchEnabled
local thumbnailImage = isMobile and "rbxassetid://5341014178" or "rbxassetid://13953902891"

-- Thời gian bắt đầu
local startTime = tick()

-- Tạo cửa sổ WindUI với KeySystem tối ưu
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
        Key = { "" },
        Note = "Nhập key từ Platoboost để tiếp tục",
        URL = "", -- Không dùng link mặc định
        SaveKey = true,
        Thumbnail = {
            Image = thumbnailImage,
            Title = "Lion Hub Key System"
        },
    },
})

-- Ghi đè KeySystem
local function overrideKeySystem()
    local keyFrame = playerGui:WaitForChild("WindUI"):WaitForChild("KeySystem")
    local keyInput = keyFrame:WaitForChild("KeyInput")
    local submitButton = keyFrame:WaitForChild("SubmitButton")
    local statusLabel = keyFrame:WaitForChild("StatusLabel")
    local getKeyButton = keyFrame:WaitForChild("GetKeyButton")

    submitButton.MouseButton1Click:Connect(function()
        local key = keyInput.Text
        if key == "" then
            statusLabel.Text = "Vui lòng nhập key!"
            statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            return
        end
        statusLabel.Text = "Đang kiểm tra key..."
        statusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        if verifyKey(key) then
            statusLabel.Text = "Key hợp lệ! Đang tải UI..."
            statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            task.wait(1)
            keyFrame.Visible = false
            Window.MainFrame.Visible = true
            if WindUI.Config.KeySystem.SaveKey then
                writefile(WindUI.Config.Folder .. "/SavedKey.txt", key)
            end
        else
            statusLabel.Text = "Key không hợp lệ!"
            statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)

    getKeyButton.MouseButton1Click:Connect(function()
        local success, link = copyLink()
        if success then
            statusLabel.Text = "Đã sao chép link key!"
            statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            WindUI:Notify({
                Title = "Lion Hub",
                Content = "Link key đã được sao chép: " .. link,
                Duration = 5
            })
        else
            statusLabel.Text = "Không thể lấy link!"
            statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)
end

spawn(overrideKeySystem)

-- Hàm định dạng thời gian
local function formatTime(seconds)
    local minutes = math.floor(seconds / 60)
    local remainingSeconds = math.floor(seconds % 60)
    return minutes > 0 and string.format("%d phút %d giây", minutes, remainingSeconds) or string.format("%d giây", remainingSeconds)
end

-- Gửi Webhook
local function sendWebhook()
    local executorName = identifyexecutor and identifyexecutor() or "Unknown"
    local loadTime = tick() - startTime
    local webhookData = {
        ["username"] = "EXCUTOR SUCCESS",
        ["embeds"] = {{
            ["title"] = "Executor Success",
            ["fields"] = {
                {["name"] = "User Name", ["value"] = player.Name, ["inline"] = true},
                {["name"] = "Executor", ["value"] = executorName, ["inline"] = true},
                {["name"] = "Load Time", ["value"] = formatTime(loadTime), ["inline"] = true},
            },
            ["color"] = 65280,
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }
    local WEBHOOK_URL = "https://discord.com/api/webhooks/1302946589714944010/O72glyYCgZKXbGEWOkB2HySrooODHM_zVtg-M5HSRliFj5qUAUNipks_JW7aXJ9DlN46"
    fRequest({
        Url = WEBHOOK_URL,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = lEncode(webhookData)
    })
end

spawn(sendWebhook)

-- Tạo ScreenGui cho thông tin
local infoGui = Instance.new("ScreenGui", playerGui)
infoGui.Name = "InfoGui"
infoGui.ResetOnSpawn = false

local infoFrame = Instance.new("Frame", infoGui)
infoFrame.Size = isMobile and UDim2.new(0, 250, 0, 160) or UDim2.new(0, 300, 0, 180)
infoFrame.Position = isMobile and UDim2.new(0.5, -125, 0, 5) or UDim2.new(0.5, -150, 0, 10)
infoFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
infoFrame.BorderSizePixel = 0

local infoCorner = Instance.new("UICorner", infoFrame)
infoCorner.CornerRadius = UDim.new(0, 10)

-- Tính năng kéo thả
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

-- Các label thông tin
local celebrationLabel = Instance.new("TextLabel", infoFrame)
celebrationLabel.Size = UDim2.new(1, 0, 0, 40)
celebrationLabel.Position = UDim2.new(0, 0, 0, 5)
celebrationLabel.BackgroundTransparency = 1
celebrationLabel.Text = "🇻🇳 Mừng 50 Năm Giải Phóng Đất Nước 🇻🇳"
celebrationLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
celebrationLabel.TextSize = isMobile and 18 or 22
celebrationLabel.Font = Enum.Font.SourceSansBold
celebrationLabel.TextXAlignment = Enum.TextXAlignment.Center

local fpsLabel = Instance.new("TextLabel", infoFrame)
fpsLabel.Size = UDim2.new(1, 0, 0, 20)
fpsLabel.Position = UDim2.new(0, 0, 0, 45)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: 0"
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextSize = isMobile and 14 or 16
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextXAlignment = Enum.TextXAlignment.Center

local userLabel = Instance.new("TextLabel", infoFrame)
userLabel.Size = UDim2.new(1, 0, 0, 20)
userLabel.Position = UDim2.new(0, 0, 0, 65)
userLabel.BackgroundTransparency = 1
userLabel.Text = "User: " .. player.Name
userLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
userLabel.TextSize = isMobile and 12 or 14
userLabel.Font = Enum.Font.SourceSans
userLabel.TextXAlignment = Enum.TextXAlignment.Center

local vietnamDateLabel = Instance.new("TextLabel", infoFrame)
vietnamDateLabel.Size = UDim2.new(1, 0, 0, 20)
vietnamDateLabel.Position = UDim2.new(0, 0, 0, 85)
vietnamDateLabel.BackgroundTransparency = 1
vietnamDateLabel.Text = "VN Date: " .. os.date("%d/%m/%Y", os.time() + 7 * 3600)
vietnamDateLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
vietnamDateLabel.TextSize = isMobile and 12 or 14
vietnamDateLabel.Font = Enum.Font.SourceSans
vietnamDateLabel.TextXAlignment = Enum.TextXAlignment.Center

local executorLabel = Instance.new("TextLabel", infoFrame)
executorLabel.Size = UDim2.new(1, 0, 0, 20)
executorLabel.Position = UDim2.new(0, 0, 0, 105)
executorLabel.BackgroundTransparency = 1
executorLabel.Text = "Executor: " .. (identifyexecutor and identifyexecutor() or "Unknown")
executorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
executorLabel.TextSize = isMobile and 12 or 14
executorLabel.Font = Enum.Font.SourceSans
executorLabel.TextXAlignment = Enum.TextXAlignment.Center

local thanksLabel = Instance.new("TextLabel", infoFrame)
thanksLabel.Size = UDim2.new(1, 0, 0, 30)
thanksLabel.Position = UDim2.new(0, 0, 0, 125)
thanksLabel.BackgroundTransparency = 1
thanksLabel.Text = ""
thanksLabel.TextColor3 = Color3.fromRGB(0, 120, 215)
thanksLabel.TextSize = isMobile and 12 or 14
thanksLabel.Font = Enum.Font.SourceSansItalic
thanksLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Hiệu ứng đánh máy
local thanksText = "Cảm Ơn Đã Tin Tưởng Dùng Lion Hub"
local isTyping, currentIndex = true, 0
spawn(function()
    while true do
        if isTyping then
            currentIndex = currentIndex + 1
            thanksLabel.Text = fStringSub(thanksText, 1, currentIndex)
            if currentIndex >= #thanksText then
                isTyping = false
                wait(1)
            end
        else
            currentIndex = currentIndex - 1
            thanksLabel.Text = fStringSub(thanksText, 1, currentIndex)
            if currentIndex <= 0 then
                isTyping = true
                wait(0.5)
            end
        end
        wait(0.1)
    end
end)

-- Cập nhật FPS và ngày
local lastTime, frameCount = tick(), 0
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastTime >= 1 then
        fpsLabel.Text = "FPS: " .. math.floor(frameCount / (currentTime - lastTime))
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
    Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
    Draggable = true,
})

-- Tạo các tab
local Tabs = {
    MainHubTab = Window:Tab({ Title = "MainHub", Icon = "star", Desc = "Script MainHub chính." }),
    KaitunTab = Window:Tab({ Title = "Kaitun", Icon = "flame", Desc = "Các script Kaitun." }),
    MainTab = Window:Tab({ Title = "Main", Icon = "shield", Desc = "Các tính năng chính và script." }),
    NotificationTab = Window:Tab({ Title = "Nhật Ký Cập Nhật", Icon = "bell", Desc = "Thông tin cập nhật và chi tiết." }),
}

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
local kaitunScripts = {
    { "Kaitun", "Kaitun.lua" },
    { "KaitunDF", "KaitunDF.lua" },
    { "Marukaitun", "Marukaitun.lua" },
    { "KaitunFisch", "kaitunfisch.lua" },
    { "KaitunAd", "KaitunAd.lua" },
    { "KaitunKI", "kaitunKI.lua" },
    { "KaitunAR", "kaitunar.lua" },
    { "KaitunAV", "kaitunAV.lua" },
}
for _, script in ipairs(kaitunScripts) do
    Tabs.KaitunTab:Button({
        Title = script[1],
        Desc = "Chạy script " .. script[1],
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/" .. script[2]))()
        end
    })
end

-- Tab: Main
Tabs.MainTab:Section({ Title = "Script" })
local mainScripts = {
    { "W-Azure", "wazure.lua" },
    { "Maru Hub", "maru.lua" },
    { "Banana Hub 1", "banana1.lua" },
    { "Banana Hub 2", "banana2.lua" },
    { "Banana Hub 3", "main.lua" },
}
for _, script in ipairs(mainScripts) do
    Tabs.MainTab:Button({
        Title = script[1],
        Desc = "Chạy script " .. script[1],
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LionHub-Pino/Vietnam/refs/heads/main/" .. script[2]))()
        end
    })
end

Tabs.MainTab:Button({
    Title = "All Executor Here",
    Desc = "Sao chép link tải executor",
    Callback = function()
        if fSetClipboard then
            fSetClipboard("https://lion-executor.pages.dev/")
            Window:Notification({ Title = "LionHub", Text = "Đã sao chép link!", Duration = 3 })
        else
            Window:Notification({ Title = "LionHub", Text = "Executor không hỗ trợ sao chép!", Duration = 5 })
        end
    end
})

Tabs.MainTab:Button({
    Title = "Server Discord Hỗ Trợ",
    Desc = "Tham gia server Discord",
    Callback = function()
        fRequest({
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json", ["Origin"] = "https://discord.com" },
            Body = lEncode({ cmd = "INVITE_BROWSER", args = { code = "wmUmGVG6ut" }, nonce = HttpService:GenerateGUID(false) })
        })
    end
})

Tabs.MainTab:Section({ Title = "Cài Đặt Giao Diện" })
Tabs.MainTab:Dropdown({
    Title = "Đổi Giao Diện",
    Values = { "Tối", "Sáng", "Xanh Nước Biển", "Xanh Lá", "Tím" },
    Value = "Tối",
    Callback = function(value)
        local themeMap = { ["Tối"] = "Dark", ["Sáng"] = "Light", ["Xanh Nước Biển"] = "Aqua", ["Xanh Lá"] = "Green", ["Tím"] = "Amethyst" }
        WindUI:SetTheme(themeMap[value])
        Window:Notification({ Title = "LionHub", Text = "Đã đổi giao diện thành " .. value, Duration = 3 })
    end
})

-- Tab: Nhật Ký Cập Nhật
Tabs.NotificationTab:Section({ Title = "Thông Tin Cập Nhật" })
Tabs.NotificationTab:Button({
    Title = "Xem Nhật Ký Cập Nhật",
    Callback = function()
        local updates = {
            { "Phần 1", "- Tiếng Anh-Tiếng Việt\n- Có sẵn trên mọi client\n- Dùng Được trên tất cả client" },
            { "Phần 2", "- Android - iOS - PC\n- Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt" },
            { "Phần 3", "- Hỗ Trợ các công cụ\n- Và Update Mỗi Tuần" },
        }
        for i, update in ipairs(updates) do
            WindUI:Notify({ Title = "Nhật Ký Cập Nhật - " .. update[1], Content = update[2], Icon = "bell", Duration = 5 })
            if i < #updates then wait(5.1) end
        end
    end
})
