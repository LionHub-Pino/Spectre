-- Tải WindUI Lib
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()

-- Tạo cửa sổ WindUI với key system
local Window = WindUI:CreateWindow({
    Title = "Lion-Hub",
    Icon = "door-open",
    Author = "Pino_Azure",
    Folder = "LionHubData",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 170,
    HasOutline = true,
    KeySystem = { 
        Key = { "pino_ontop", "LionHub" },
        Note = "Nhập key chính xác để tiếp tục.",
        SaveKey = true,
    },
})

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
    MainTab = Window:Tab({ Title = "Chính", Icon = "home", Desc = "Các tính năng chính và script." }),
    UpdateTab = Window:Tab({ Title = "Nhật Ký Cập Nhật", Icon = "info", Desc = "Thông tin cập nhật và chi tiết." }),
}

-- Chọn tab mặc định
Window:SelectTab(1)

-- Tab: Chính
Tabs.MainTab:Section({ Title = "Script" })

Tabs.MainTab:Button({
    Title = "W-Azure",
    Desc = "Chạy script W-Azure",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/wazure.lua"))()
    end
})

Tabs.MainTab:Button({
    Title = "Maru Hub",
    Desc = "Chạy script Maru Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/maru.lua"))()
    end
})

Tabs.MainTab:Button({
    Title = "Banana Hub",
    Desc = "Chạy script Banana Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/banana.lua"))()
    end
})

Tabs.MainTab:Button({
    Title = "Server Discord Hỗ Trợ",
    Desc = "Tham gia server Discord để được hỗ trợ",
    Callback = function()
        -- Mở link Discord
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
Tabs.UpdateTab:Section({ Title = "Chi Tiết" })

Tabs.UpdateTab:Paragraph({
    Title = "Chi Tiết",
    Text = "- Tiếng Anh-Tiếng Việt\n- Có sẵn trên mọi client\n- Dùng Được trên tất cả client\n- Android - iOS - PC\n- Hỗ trợ script tiếng Việt cho người Việt\n- Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt\n- Hỗ trợ các công cụ\n- Hỗ Trợ các công cụ\n- Và Update Mỗi Tuần"
})

-- Tạo nút hình tròn để đóng/mở giao diện
local uiEnabled = true
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50) -- Kích thước hình tròn (50x50)
toggleButton.Position = UDim2.new(0, 10, 0, 10) -- Góc trên bên trái
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215) -- Màu xanh dương
toggleButton.Text = "" -- Không hiển thị chữ
toggleButton.BorderSizePixel = 0
toggleButton.BackgroundTransparency = 0

-- Làm nút thành hình tròn
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0) -- Bo tròn hoàn toàn (hình tròn)
corner.Parent = toggleButton

-- Tạo ScreenGui riêng cho nút
local buttonGui = Instance.new("ScreenGui")
buttonGui.Name = "ToggleButtonGui"
buttonGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
toggleButton.Parent = buttonGui

-- Thêm hiệu ứng hover
local function updateButtonColor()
    if uiEnabled then
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215) -- Màu xanh dương khi UI bật
    else
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi UI tắt
    end
end

toggleButton.MouseEnter:Connect(function()
    if uiEnabled then
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255) -- Sáng hơn khi hover
    else
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

toggleButton.MouseLeave:Connect(function()
    updateButtonColor()
end)

-- Logic nút đóng/mở
toggleButton.MouseButton1Click:Connect(function()
    uiEnabled = not uiEnabled
    local windGui = buttonGui.Parent:FindFirstChild("WindUI") -- Tìm GUI của WindUI
    if windGui then
        windGui.Enabled = uiEnabled
        updateButtonColor()
        print(uiEnabled and "UI đã được bật" or "UI đã được tắt")
    else
        print("Không tìm thấy WindUI GUI!")
    end
end)

-- Đảm bảo nút luôn hiển thị trên cùng
buttonGui.DisplayOrder = 10

-- Thông báo chào mừng
Window:Notification({
    Title = "Lion-Hub",
    Text = "Chào mừng đến với Lion-Hub!",
    Duration = 3
})
