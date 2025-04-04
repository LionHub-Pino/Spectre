-- Tải thư viện Orion
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Cấu hình Platoboost
local service = 3217 -- Thay bằng service ID của bạn từ Platoboost
local secret = "b4fc504c-13ea-4c85-b632-0e9419ddf993" -- Thay bằng secret của bạn
local useNonce = true

-- Callback thông báo
local onMessage = function(message)
    OrionLib:MakeNotification({
        Name = "Lion-Hub Status",
        Content = message,
        Image = "rbxassetid://4483362458",
        Time = 5
    })
end

-- Chờ game tải
repeat task.wait(1) until game:IsLoaded()

-- Hàm cơ bản
local fSetClipboard, fRequest, fStringChar, fToString, fStringSub, fOsTime, fMathRandom, fMathFloor, fGetHwid = 
    setclipboard or toclipboard, 
    request or http_request or syn_request, 
    string.char, 
    tostring, 
    string.sub, 
    os.time, 
    math.random, 
    math.floor, 
    gethwid or function() return game:GetService("Players").LocalPlayer.UserId end

local cachedLink, cachedTime = "", 0
local host = "https://api.platoboost.com"
local hostResponse = fRequest({Url = host .. "/public/connectivity", Method = "GET"})
if hostResponse.StatusCode ~= 200 then
    host = "https://api.platoboost.net"
end

-- Hàm cacheLink (lấy link từ Platoboost)
function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response = fRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({service = service, identifier = lDigest(fGetHwid())}),
            Headers = {["Content-Type"] = "application/json"}
        })
        if response.StatusCode == 200 then
            local decoded = lDecode(response.Body)
            if decoded.success then
                cachedLink = decoded.data.url
                cachedTime = fOsTime()
                return true, cachedLink
            else
                onMessage(decoded.message)
                return false, decoded.message
            end
        else
            onMessage("Failed to cache link.")
            return false, "Failed to cache link."
        end
    else
        return true, cachedLink
    end
end

-- Hàm tạo nonce
local generateNonce = function()
    local str = ""
    for _ = 1, 16 do
        str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97)
    end
    return str
end

-- Hàm sao chép link
local copyLink = function()
    local success, link = cacheLink()
    if success then
        fSetClipboard(link)
        onMessage("Link copied! Paste it into your browser to get a key.")
    end
end

-- Hàm kiểm tra key
local verifyKey = function(key)
    local nonce = generateNonce()
    local endpoint = host .. "/public/whitelist/" .. fToString(service) .. "?identifier=" .. lDigest(fGetHwid()) .. "&key=" .. key
    if useNonce then endpoint = endpoint .. "&nonce=" .. nonce end

    local response = fRequest({Url = endpoint, Method = "GET"})
    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body)
        if decoded.success and decoded.data.valid then
            if useNonce then
                if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                    onMessage("Key is valid!")
                    return true
                else
                    onMessage("Failed to verify integrity.")
                    return false
                end
            else
                onMessage("Key is valid!")
                return true
            end
        else
            onMessage("Key is invalid.")
            return false
        end
    else
        onMessage("Server error, try again later.")
        return false
    end
end

-- Tạo cửa sổ Orion
local Window = OrionLib:MakeWindow({
    Name = "Lion-Hub",
    IntroText = "Chào Mừng Đến Với LionHub by @Pino_Azure",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "LionHubConfig"
})

-- Tab: Key System
local KeyTab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

KeyTab:AddButton({
    Name = "Copy Link",
    Callback = function()
        copyLink()
    end
})

KeyTab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = false,
    Callback = function(key)
        if verifyKey(key) then
            -- Tạo tab Update Log
            local UpdateTab = Window:MakeTab({
                Name = "Update Log",
                Icon = "rbxassetid://4483362458",
                PremiumOnly = false
            })
            UpdateTab:AddLabel("English-Vietnam")
            UpdateTab:AddLabel("Available on all clients")
            UpdateTab:AddLabel("Dùng Được trên tất cả client")
            UpdateTab:AddLabel("Android -IOS -PC")
            UpdateTab:AddLabel("Support Vietnamese script for Vietnamese people")
            UpdateTab:AddLabel("Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt")
            UpdateTab:AddLabel("Support tools")
            UpdateTab:AddLabel("Hỗ Trợ các công cụ")

            -- Tạo tab Main
            local MainTab = Window:MakeTab({
                Name = "Main",
                Icon = "rbxassetid://4483362458",
                PremiumOnly = false
            })
            MainTab:AddButton({
                Name = "W-Azure",
                Callback = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/wazure.lua"))()
                end
            })
            MainTab:AddButton({
                Name = "Maru Hub",
                Callback = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/maru.lua"))()
                end
            })
            MainTab:AddButton({
                Name = "Banana Hub",
                Callback = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/banana.lua"))()
                end
            })
        end
    end
})

-- Khởi tạo Orion
OrionLib:Init()
