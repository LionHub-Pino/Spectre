-- Tải Fluent UI Lib
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Tạo cửa sổ Fluent UI
local Window = Fluent:CreateWindow({
    Title = "Lion-Hub",
    SubTitle = "by Pino_Azure",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

-- Tab: Update Log
local updateTab = Window:AddTab({ Title = "Update Log", Icon = "info" })
updateTab:AddParagraph({
    Title = "Details",
    Content = "- English-Vietnam\n- Available on all clients\n- Dùng Được trên tất cả client\n- Android -IOS -PC\n- Support Vietnamese script for Vietnamese people\n- Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt\n- Support tools\n- Hỗ Trợ các công cụ"
})

-- Tab: Main
local mainTab = Window:AddTab({ Title = "Main", Icon = "home" })
mainTab:AddButton({
    Title = "W-Azure",
    Description = "Chạy script W-Azure",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/wazure.lua"))()
    end
})
mainTab:AddButton({
    Title = "Maru Hub",
    Description = "Chạy script Maru Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/maru.lua"))()
    end
})
mainTab:AddButton({
    Title = "Banana Hub",
    Description = "Chạy script Banana Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/banana.lua"))()
    end
})
mainTab:AddButton({
    Title = "Blox Fruits Hub",
    Description = "Chạy script Blox Fruits (main.lua)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/refs/heads/main/main.lua"))()
    end
})

-- Dropdown để đổi theme
mainTab:AddDropdown({
    Title = "Change Theme",
    Description = "Chọn theme cho giao diện",
    Values = {"Dark", "Light", "Aqua", "Green", "Amethyst"},
    Default = "Dark",
    Callback = function(value)
        Fluent.Options.Theme:SetValue(value)
        Fluent:Notify({
            Title = "Lion-Hub",
            Content = "Đã đổi theme thành " .. value,
            Duration = 3
        })
    end
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
    local fluentGui = Window.ScreenGui
    if fluentGui then
        fluentGui.Enabled = uiEnabled
        updateButtonColor()
        print(uiEnabled and "UI đã được bật" or "UI đã được tắt")
    else
        print("Không tìm thấy Fluent GUI!")
    end
end)

-- Đảm bảo nút luôn hiển thị trên cùng
buttonGui.DisplayOrder = 10

-- Chọn tab mặc định
updateTab:Select()

-- Thông báo chào mừng
Fluent:Notify({
    Title = "Lion-Hub",
    Content = "Chào mừng đến với Lion-Hub!",
    Duration = 3
})
