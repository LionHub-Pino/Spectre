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
        Key = { "pino_ontop", "LionHub" }, -- Thay đổi key thành pino_ontop và LionHub
        Note = "Enter the correct key to proceed.",
        SaveKey = true, -- Lưu key để không cần nhập lại
    },
})

-- Tùy chỉnh nút mở UI
Window:EditOpenButton({
    Title = "Open Lion-Hub",
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
    MainTab = Window:Tab({ Title = "Main", Icon = "home", Desc = "Main features and scripts." }),
    UpdateTab = Window:Tab({ Title = "Update Log", Icon = "info", Desc = "Update information and details." }),
}

-- Chọn tab mặc định
Window:SelectTab(1)

-- Tab: Main
Tabs.MainTab:Section({ Title = "Scripts" })

Tabs.MainTab:Button({
    Title = "W-Azure",
    Desc = "Run W-Azure script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/wazure.lua"))()
    end
})

Tabs.MainTab:Button({
    Title = "Maru Hub",
    Desc = "Run Maru Hub script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/maru.lua"))()
    end
})

Tabs.MainTab:Button({
    Title = "Banana Hub",
    Desc = "Run Banana Hub script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/banana.lua"))()
    end
})

Tabs.MainTab:Button({
    Title = "Blox Fruits Hub",
    Desc = "Run Blox Fruits script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/refs/heads/main/main.lua"))()
    end
})

Tabs.MainTab:Section({ Title = "Theme Settings" })

Tabs.MainTab:Dropdown({
    Title = "Change Theme",
    Values = { "Dark", "Light", "Aqua", "Green", "Amethyst" },
    Value = "Dark",
    Callback = function(value)
        WindUI:SetTheme(value)
        Window:Notification({
            Title = "Lion-Hub",
            Text = "Đã đổi theme thành " .. value,
            Duration = 3
        })
    end
})

-- Tab: Update Log
Tabs.UpdateTab:Section({ Title = "Details" })

Tabs.UpdateTab:Paragraph({
    Title = "Details",
    Text = "- English-Vietnam\n- Available on all clients\n- Dùng Được trên tất cả client\n- Android -IOS -PC\n- Support Vietnamese script for Vietnamese people\n- Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt\n- Support tools\n- Hỗ Trợ các công cụ"
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
