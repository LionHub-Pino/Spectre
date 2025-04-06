local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- Lấy thời gian khởi tạo UI
local startTime = tick()

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

-- Tạo cửa sổ WindUI với key system tích hợp
local Window = WindUI:CreateWindow({
    Title = "LionHub",
    Icon = "door-open",
    Author = "🇻🇳 Mừng 50 Năm Giải Phóng Đất Nước 🇻🇳",
    Folder = "LionHubData",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HasOutline = false,
    KeySystem = { 
        Key = { "pino_ontop", "LionHub" },
        Note = "Nhập key chính xác để tiếp tục.",
        URL = "https://discord.gg/wmUmGVG6ut",
        SaveKey = true,
        Thumbnail = {
            Image = thumbnailImage,
            Title = "LionHub Key System"
        },
    },
})

-- Tạo một ScreenGui riêng cho FPS, User Name, và các thông tin khác
local infoGui = Instance.new("ScreenGui")
infoGui.Name = "InfoGui"
infoGui.Parent = playerGui
infoGui.ResetOnSpawn = false

-- Tạo Frame cho window thông tin (tăng kích thước)
local infoFrame = Instance.new("Frame")
if isMobile then
    infoFrame.Size = UDim2.new(0, 300, 0, 200) -- Tăng kích thước cho mobile
    infoFrame.Position = UDim2.new(0.5, -150, 0, 5)
else
    infoFrame.Size = UDim2.new(0, 350, 0, 220) -- Tăng kích thước cho PC
    infoFrame.Position = UDim2.new(0.5, -175, 0, 10)
end
infoFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
infoFrame.BorderSizePixel = 0
infoFrame.Parent = infoGui

-- Thêm gradient cho nền
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))
})
gradient.Rotation = 45
gradient.Parent = infoFrame

-- Thêm viền (stroke)
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 215, 0)
stroke.Thickness = 2
stroke.Transparency = 0.5
stroke.Parent = infoFrame

-- Thêm tính năng kéo thả cho infoFrame
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

-- Tạo TextLabel cho dòng "Mừng 50 Năm Giải Phóng Đất Nước" kèm lá cờ Việt Nam
local celebrationLabel = Instance.new("TextLabel")
celebrationLabel.Size = UDim2.new(1, 0, 0, 40)
celebrationLabel.Position = UDim2.new(0, 0, 0, 10)
celebrationLabel.BackgroundTransparency = 1
celebrationLabel.Text = "🇻🇳 Mừng 50 Năm Giải Phóng Đất Nước 🇻🇳"
celebrationLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
celebrationLabel.TextSize = isMobile and 20 or 24
celebrationLabel.Font = Enum.Font.GothamBold
celebrationLabel.TextXAlignment = Enum.TextXAlignment.Center
celebrationLabel.Parent = infoFrame

-- Tạo TextLabel cho FPS
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, 0, 0, 30)
fpsLabel.Position = UDim2.new(0, 0, 0, 50)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: 0"
fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 127)
fpsLabel.TextSize = isMobile and 16 or 18
fpsLabel.Font = Enum.Font.Gotham
fpsLabel.TextXAlignment = Enum.TextXAlignment.Center
fpsLabel.Parent = infoFrame

-- Tạo TextLabel cho User Name
local userLabel = Instance.new("TextLabel")
userLabel.Size = UDim2.new(1, 0, 0, 30)
userLabel.Position = UDim2.new(0, 0, 0, 80)
userLabel.BackgroundTransparency = 1
userLabel.Text = "User: " .. player.Name
userLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
userLabel.TextSize = isMobile and 14 or 16
userLabel.Font = Enum.Font.Gotham
userLabel.TextXAlignment = Enum.TextXAlignment.Center
userLabel.Parent = infoFrame

-- Tạo TextLabel cho ngày, tháng, năm Việt Nam
local vietnamDateLabel = Instance.new("TextLabel")
vietnamDateLabel.Size = UDim2.new(1, 0, 0, 30)
vietnamDateLabel.Position = UDim2.new(0, 0, 0, 110)
vietnamDateLabel.BackgroundTransparency = 1
vietnamDateLabel.Text = "VN Date: " .. os.date("%d/%m/%Y", os.time() + 7 * 3600)
vietnamDateLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
vietnamDateLabel.TextSize = isMobile and 14 or 16
vietnamDateLabel.Font = Enum.Font.Gotham
vietnamDateLabel.TextXAlignment = Enum.TextXAlignment.Center
vietnamDateLabel.Parent = infoFrame

-- Tạo TextLabel cho Executor
local executorLabel = Instance.new("TextLabel")
executorLabel.Size = UDim2.new(1, 0, 0, 30)
executorLabel.Position = UDim2.new(0, 0, 0, 140)
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
executorLabel.TextSize = isMobile and 14 or 16
executorLabel.Font = Enum.Font.Gotham
executorLabel.TextXAlignment = Enum.TextXAlignment.Center
executorLabel.Parent = infoFrame

-- Tạo TextLabel cho dòng cảm ơn với hiệu ứng đánh máy
local thanksLabel = Instance.new("TextLabel")
thanksLabel.Size = UDim2.new(1, 0, 0, 30)
thanksLabel.Position = UDim2.new(0, 0, 0, 170)
thanksLabel.BackgroundTransparency = 1
thanksLabel.Text = ""
thanksLabel.TextColor3 = Color3.fromRGB(0, 120, 215)
thanksLabel.TextSize = isMobile and 14 or 16
thanksLabel.Font = Enum.Font.GothamItalic
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
    -- Cập nhật FPS
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastTime >= 1 then
        local fps = math.floor(frameCount / (currentTime - lastTime))
        fpsLabel.Text = "FPS: " .. fps
        frameCount = 0
        lastTime = currentTime
    end

    -- Cập nhật ngày, tháng, năm Việt Nam
    vietnamDateLabel.Text = "VN Date: " .. os.date("%d/%m/%Y", os.time() + 7 * 3600)
end)

-- Gửi thông báo qua webhook khi UI khởi tạo
local webhookUrl = "https://discord.com/api/webhooks/1358378646355710015/KvJJWS0CI54NoCNucVz4KtEUw5Vwq_qdPjROHYQpTx6NywUz8ueX6LiB0tbdpjeMNIrM"

-- Lấy avatar của nhân vật "executor" (UserId = 156)
local executorUserId = 156 -- UserId của "executor", bro có thể thay nếu có ID chính xác hơn
local thumbnailType = Enum.ThumbnailType.AvatarBust
local thumbnailSize = Enum.ThumbnailSize.Size420x420
local success, avatarUrl = pcall(function()
    return Players:GetUserThumbnailAsync(executorUserId, thumbnailType, thumbnailSize)
end)

if not success then
    warn("Không thể lấy avatar của executor, dùng avatar của người chơi hiện tại.")
    avatarUrl = Players:GetUserThumbnailAsync(player.UserId, thumbnailType, thumbnailSize)
end

-- Tính thời gian UI đã hoạt động (tính bằng giây)
local uptime = math.floor(tick() - startTime)

-- Tạo embed cho webhook
local embed = {
    title = "Executor Success",
    description = "UI đã hoạt động được **" .. uptime .. " giây**.",
    color = 0x00FF00, -- Màu xanh lá
    thumbnail = {
        url = avatarUrl
    }
}

-- Gửi webhook
spawn(function()
    local success, err = pcall(function()
        HttpService:PostAsync(
            webhookUrl,
            HttpService:JSONEncode({
                embeds = { embed }
            }),
            Enum.HttpContentType.ApplicationJson
        )
    end)
    if not success then
        warn("Không thể gửi webhook: " .. tostring(err))
    end
end)

-- Tùy chỉnh nút mở UI
local success, err = pcall(function()
    Window:EditOpenButton({
        Title = "Mở LionHub",
        Icon = "monitor",
        CornerRadius = UDim.new(0, 10),
        StrokeThickness = 2,
        Color = ColorSequence.new(
            Color3.fromHex("FF0F7B"), 
            Color3.fromHex("F89B29")
        ),
        Draggable = true,
    })
end)

-- Kiểm tra xem nút mở UI có được tạo thành công không
if not success then
    warn("Không thể tạo nút mở UI: " .. tostring(err))
    Window:Notification({
        Title = "LionHub",
        Text = "Không thể tạo nút mở UI. Dùng nút trong tab Main để bật/tắt UI.",
        Duration = 5
    })
else
    Window:Notification({
        Title = "LionHub",
        Text = "Nút mở UI đã được tạo. Nếu không thấy, dùng nút trong tab Main.",
        Duration = 5
    })
end

-- Tạo các tab
local Tabs = {
    MainHubTab = Window:Tab({ Title = "MainHub", Icon = "star", Desc = "Script MainHub chính." }),
    KaitunTab = Window:Tab({ Title = "Kaitun", Icon = "flame", Desc = "Các script Kaitun." }),
    MainTab = Window:Tab({ Title = "Main", Icon = "shield", Desc = "Các tính năng chính và script." }),
    NotificationTab = Window:Tab({ Title = "Nhật Ký Cập Nhật", Icon = "bell", Desc = "Thông tin cập nhật và chi tiết." }),
    ConsoleTab = Window:Tab({ Title = "Console", Icon = "terminal", Desc = "Giao diện Console của Roblox." }),
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
    Desc = "Chạy script Marukaitun",
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
    Desc = "Chạy script Maru Hub",
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
        local HttpService = game:GetService("HttpService")
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

-- Thêm nút bật/tắt UI trong tab Main (dự phòng)
Tabs.MainTab:Section({ Title = "Cài Đặt UI" })

Tabs.MainTab:Button({
    Title = "Bật/Tắt UI",
    Desc = "Bật hoặc tắt giao diện LionHub",
    Callback = function()
        Window:Toggle()
        Window:Notification({
            Title = "LionHub",
            Text = "Đã bật/tắt UI. Nếu không thấy nút mở, hãy kiểm tra lại!",
            Duration = 3
        })
    end
})

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

-- Tab: Console
Tabs.ConsoleTab:Section({ Title = "Console Roblox" })

Tabs.ConsoleTab:Button({
    Title = "Mở Developer Console",
    Desc = "Nhấn F9 để mở Console chính thức của Roblox",
    Callback = function()
        Window:Notification({
            Title = "LionHub",
            Text = "Vui lòng nhấn phím F9 để mở Developer Console của Roblox!",
            Duration = 5
        })
    end
})

Tabs.ConsoleTab:Textbox({
    Title = "Nhập Lệnh Console",
    Desc = "Nhập lệnh Lua (VD: print('Hello World')) và kết quả sẽ hiển thị trong Developer Console",
    Default = "",
    Callback = function(value)
        local success, err = pcall(function()
            local func = loadstring(value)
            if func then
                func()
                Window:Notification({
                    Title = "LionHub",
                    Text = "Lệnh đã được thực thi! Kiểm tra Developer Console (F9).",
                    Duration = 3
                })
            else
                Window:Notification({
                    Title = "LionHub",
                    Text = "Lệnh không hợp lệ! Vui lòng kiểm tra lại.",
                    Duration = 3
                })
            end
        end)
        if not success then
            Window:Notification({
                Title = "LionHub",
                Text = "Lỗi khi thực thi lệnh: " .. tostring(err),
                Duration = 5
            })
        end
    end
})
