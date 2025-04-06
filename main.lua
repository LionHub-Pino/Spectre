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
local function lEncode(data)
    return HttpService:JSONEncode(data)
end
local function lDecode(data)
    return HttpService:JSONDecode(data)
end
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

-- Kiểm tra nonce (loại bỏ vòng lặp không cần thiết, chỉ cần đảm bảo nonce ngẫu nhiên)
for _ = 1, 5 do
    local nonce1, nonce2 = generateNonce(), generateNonce()
    if nonce1 == nonce2 then
        onMessage("platoboost nonce error.")
        error("nonce error")
    end
    task.wait(0.2)
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

-- UI ô nhập key tối ưu
task.spawn(function()
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local PlayerGui = Player:WaitForChild("PlayerGui")

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = PlayerGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    local Frame = Instance.new("Frame")
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.5, -180, 0.5, -110)
    Frame.Size = UDim2.new(0, 360, 0, 220)

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Frame

    local Topbar = Instance.new("Frame")
    Topbar.Name = "Topbar"
    Topbar.Parent = Frame
    Topbar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Topbar.BorderSizePixel = 0
    Topbar.Size = UDim2.new(1, 0, 0, 30)

    local TopbarCorner = Instance.new("UICorner")
    TopbarCorner.CornerRadius = UDim.new(0, 8)
    TopbarCorner.Parent = Topbar

    local Title = Instance.new("TextLabel")
    Title.Parent = Topbar
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.Text = "Platoboost Key System"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = Enum.Font.SourceSansBold
    Title.TextXAlignment = Enum.TextXAlignment.Center

    local Exit = Instance.new("TextButton")
    Exit.Parent = Topbar
    Exit.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Exit.BackgroundTransparency = 0.3
    Exit.BorderSizePixel = 0
    Exit.Position = UDim2.new(0.92, 0, 0.15, 0)
    Exit.Size = UDim2.new(0, 24, 0, 24)
    Exit.Font = Enum.Font.SourceSansBold
    Exit.Text = "X"
    Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
    Exit.TextSize = 16

    local Minimize = Instance.new("TextButton")
    Minimize.Parent = Topbar
    Minimize.BackgroundColor3 = Color3.fromRGB(85, 255, 0)
    Minimize.BackgroundTransparency = 0.3
    Minimize.BorderSizePixel = 0
    Minimize.Position = UDim2.new(0.83, 0, 0.15, 0)
    Minimize.Size = UDim2.new(0, 24, 0, 24)
    Minimize.Font = Enum.Font.SourceSansBold
    Minimize.Text = "-"
    Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
    Minimize.TextSize = 16

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Parent = Frame
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Position = UDim2.new(0, 0, 0, 35)
    ContentFrame.Size = UDim2.new(1, 0, 1, -35)

    local TextBox = Instance.new("TextBox")
    TextBox.Parent = ContentFrame
    TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TextBox.BorderSizePixel = 0
    TextBox.Position = UDim2.new(0.5, -140, 0, 20)
    TextBox.Size = UDim2.new(0, 280, 0, 40)
    TextBox.Font = Enum.Font.SourceSans
    TextBox.Text = ""
    TextBox.PlaceholderText = "Nhập key của bạn tại đây"
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextSize = 16
    TextBox.TextWrapped = true

    local TextBoxCorner = Instance.new("UICorner")
    TextBoxCorner.CornerRadius = UDim.new(0, 4)
    TextBoxCorner.Parent = TextBox

    local CheckKey = Instance.new("TextButton")
    CheckKey.Parent = ContentFrame
    CheckKey.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    CheckKey.BorderSizePixel = 0
    CheckKey.Position = UDim2.new(0.5, -140, 0, 80)
    CheckKey.Size = UDim2.new(0, 130, 0, 35)
    CheckKey.Font = Enum.Font.SourceSansBold
    CheckKey.Text = "Kiểm Tra Key"
    CheckKey.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckKey.TextSize = 16

    local CheckKeyCorner = Instance.new("UICorner")
    CheckKeyCorner.CornerRadius = UDim.new(0, 4)
    CheckKeyCorner.Parent = CheckKey

    local GetKey = Instance.new("TextButton")
    GetKey.Parent = ContentFrame
    GetKey.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    GetKey.BorderSizePixel = 0
    GetKey.Position = UDim2.new(0.5, 10, 0, 80)
    GetKey.Size = UDim2.new(0, 130, 0, 35)
    GetKey.Font = Enum.Font.SourceSansBold
    GetKey.Text = "Lấy Key"
    GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
    GetKey.TextSize = 16

    local GetKeyCorner = Instance.new("UICorner")
    GetKeyCorner.CornerRadius = UDim.new(0, 4)
    GetKeyCorner.Parent = GetKey

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Parent = ContentFrame
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position = UDim2.new(0, 0, 0, 130)
    StatusLabel.Size = UDim2.new(1, 0, 0, 20)
    StatusLabel.Font = Enum.Font.SourceSans
    StatusLabel.Text = ""
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    StatusLabel.TextSize = 14
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Center

    -- Sự kiện nút
    CheckKey.MouseButton1Click:Connect(function()
        local key = TextBox.Text
        if key == "" then
            StatusLabel.Text = "Vui lòng nhập key!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            return
        end
        StatusLabel.Text = "Đang kiểm tra key..."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        if verifyKey(key) then
            StatusLabel.Text = "Key hợp lệ! Đang tải script..."
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            task.wait(1)
            ScreenGui:Destroy()
            -- Chạy script chính của bạn ở đây
            loadstring(game:HttpGet("https://pastebin.com/raw/DTrES0c6"))()
        else
            StatusLabel.Text = "Key không hợp lệ!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)

    GetKey.MouseButton1Click:Connect(function()
        local success, link = copyLink()
        if success then
            StatusLabel.Text = "Đã sao chép link key!"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            TextBox.Text = link -- Hiển thị link trong TextBox
        else
            StatusLabel.Text = "Không thể lấy link!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)

    Exit.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    Minimize.MouseButton1Click:Connect(function()
        ScreenGui.Enabled = not ScreenGui.Enabled
        Minimize.Text = ScreenGui.Enabled and "-" or "+"
    end)
end)
