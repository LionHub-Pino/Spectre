local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Tải WindUI Lib
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()

-- Tạo cửa sổ WindUI với key system tích hợp
local Window = WindUI:CreateWindow({
    Title = "Lion-Hub",
    Icon = "door-open",
    Author = "Pino_Azure",
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
            Image = "rbxassetid://18220445082",
            Title = "Lion-Hub Key System"
        },
    },
})

-- Tạo một ScreenGui riêng cho FPS và User Name
local infoGui = Instance.new("ScreenGui")
infoGui.Name = "InfoGui"
infoGui.Parent = playerGui
infoGui.ResetOnSpawn = false

-- Kiểm tra thiết bị
local isMobile = UserInputService.TouchEnabled

-- Tạo Frame cho window FPS với giao diện giống WindUI
local infoFrame = Instance.new("Frame")
if isMobile then
    infoFrame.Size = UDim2.new(0, 150, 0, 80)
    infoFrame.Position = UDim2.new(0.5, -75, 0, 5)
else
    infoFrame.Size = UDim2.new(0, 200, 0, 100)
    infoFrame.Position = UDim2.new(0.5, -100, 0, 10)
end
infoFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
infoFrame.BorderSizePixel = 1
infoFrame.BorderColor3 = Color3.fromRGB(50, 50, 50)
infoFrame.Parent = infoGui

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 8)
infoCorner.Parent = infoFrame

-- Tạo TextLabel cho FPS
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, -10, 0, 30)
fpsLabel.Position = UDim2.new(0, 5, 0, 5)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: 0"
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextSize = isMobile and 14 or 16
fpsLabel.Font = Enum.Font.GothamBold
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.Parent = infoFrame

-- Tạo TextLabel cho User Name với hiệu ứng cầu vồng
local userLabel = Instance.new("TextLabel")
userLabel.Size = UDim2.new(1, -10, 0, 20)
userLabel.Position = UDim2.new(0, 5, 0, 35)
userLabel.BackgroundTransparency = 1
userLabel.Text = "User: " .. player.Name
userLabel.TextSize = isMobile and 12 or 14
userLabel.Font = Enum.Font.Gotham
userLabel.TextXAlignment = Enum.TextXAlignment.Left
userLabel.Parent = infoFrame

-- Hiệu ứng cầu vồng cho User Name
RunService.RenderStepped:Connect(function()
    local hue = (tick() % 5) / 5
    local color = Color3.fromHSV(hue, 1, 1)
    userLabel.TextColor3 = color
end)

-- Tạo TextLabel cho dòng cảm ơn
local thanksLabel = Instance.new("TextLabel")
thanksLabel.Size = UDim2.new(1, -10, 0, 30)
thanksLabel.Position = UDim2.new(0, 5, 0, 55)
thanksLabel.BackgroundTransparency = 1
thanksLabel.Text = ""
thanksLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
thanksLabel.TextSize = isMobile and 12 or 14
thanksLabel.Font = Enum.Font.GothamItalic
thanksLabel.TextXAlignment = Enum.TextXAlignment.Left
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

-- Cập nhật FPS
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
end)

-- Thời gian bắt đầu chạy UI
local startTime = os.time()

-- Tạo TextLabel cho giờ Việt Nam (trong Window)
local vietnamTimeLabel = Instance.new("TextLabel")
vietnamTimeLabel.Size = UDim2.new(0, 150, 0, 20)
vietnamTimeLabel.Position = UDim2.new(1, -160, 0, 5)
vietnamTimeLabel.BackgroundTransparency = 1
vietnamTimeLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
vietnamTimeLabel.TextSize = 14
vietnamTimeLabel.Font = Enum.Font.Gotham
vietnamTimeLabel.TextXAlignment = Enum.TextXAlignment.Right
vietnamTimeLabel.Parent = Window:GetGUIRef()

-- Tạo TextLabel cho thời gian hoạt động (trong Window)
local timeWorkLabel = Instance.new("TextLabel")
timeWorkLabel.Size = UDim2.new(0, 150, 0, 20)
timeWorkLabel.Position = UDim2.new(1, -160, 0, 25)
timeWorkLabel.BackgroundTransparency = 1
timeWorkLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
timeWorkLabel.TextSize = 14
timeWorkLabel.Font = Enum.Font.Gotham
timeWorkLabel.TextXAlignment = Enum.TextXAlignment.Right
timeWorkLabel.Parent = Window:GetGUIRef()

-- Cập nhật thời gian
RunService.RenderStepped:Connect(function()
    local vietnamTime = os.time() + 7 * 3600
    vietnamTimeLabel.Text = "VN Time: " .. os.date("%H:%M:%S", vietnamTime)

    local elapsed = os.time() - startTime
    local hours = math.floor(elapsed / 3600)
    local minutes = math.floor((elapsed % 3600) / 60)
    local seconds = elapsed % 60
    timeWorkLabel.Text = string.format("Time Work: %02d:%02d:%02d", hours, minutes, seconds)
end)

-- Tùy chỉnh nút mở UI
Window:EditOpenButton({
    Title = "Mở Lion-Hub",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 10),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    Draggable = true,
})

-- Tạo các tab
local Tabs = {
    MainHubTab = Window:Tab({ Title = "MainHub", Icon = "star", Desc = "Script MainHub chính." }),
    KaitunTab = Window:Tab({ Title = "Kaitun", Icon = "flame", Desc = "Các script Kaitun." }),
    MainTab = Window:Tab({ Title = "Chính", Icon = "home", Desc = "Các tính năng chính và script." }),
    NotificationTab = Window:Tab({ Title = "Nhật Ký Cập Nhật", Icon = "bell", Desc = "Thông tin cập nhật và chi tiết." }),
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

-- Tab: Chính
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
                Title = "Lion-Hub",
                Text = "Đã sao chép link: https://lion-executor.pages.dev/",
                Duration = 3
            })
        else
            Window:Notification({
                Title = "Lion-Hub",
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
                Title = "Lion-Hub",
                Text = "Executor của bạn không hỗ trợ mở link Discord. Vui lòng sao chép link: https://discord.gg/wmUmGVG6ut",
                Duration = 5
            })
        end
    end
})

Tabs.MainTab:Section({ Title = "Cài Đặt Giao Diện" })

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
            Title = "Lion-Hub",
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
