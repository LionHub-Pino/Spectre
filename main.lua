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

-- Định nghĩa key mặc định
local defaultKey = "pino_ontop"
local isKeyVerified = false

-- Tab: Key System
local keyTab = Window:AddTab({ Title = "Key System", Icon = "key" })
keyTab:AddParagraph({
    Title = "Welcome to Lion-Hub",
    Content = "Nhập key để truy cập giao diện."
})
local keyInput = keyTab:AddTextbox({
    Title = "Enter Key",
    Default = "",
    Placeholder = "Key...",
    Callback = function(value)
        if value == defaultKey then
            isKeyVerified = true
            Fluent:Notify({
                Title = "Lion-Hub",
                Content = "Key Correct! Đã mở khóa giao diện.",
                Duration = 3
            })

            -- Tab: Update Log
            local updateTab = Window:AddTab({ Title = "Update Log", Icon = "info" })
            updateTab:AddParagraph({
                Title = "Details",
                Content = "- English-Vietnam\n- Available on all clients\n- Dùng Được trên tất cả client\n- Android -IOS -PC\n- Support Vietnamese script for Vietnamese people\n- Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt\n- Support tools\n- Hỗ Trợ các công cụ\n- Join Discord Để Thêm Ý Kiến https://discord.gg/tZRNMYhS"
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
        else
            Fluent:Notify({
                Title = "Lion-Hub",
                Content = "Key Incorrect! Key không đúng, thử lại!",
                Duration = 3
            })
        end
    end
})

-- Tạo nút đóng/mở giao diện kiểu W-Azure
local uiEnabled = true
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 10) -- Góc trên bên trái
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215) -- Màu xanh dương giống Kavo UI
toggleButton.Text = "Close UI"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 16
toggleButton.BorderSizePixel = 2
toggleButton.BorderColor3 = Color3.fromRGB(255, 255, 255) -- Viền trắng giống Kavo UI

-- Tạo ScreenGui riêng cho nút
local buttonGui = Instance.new("ScreenGui")
buttonGui.Name = "ToggleButtonGui"
buttonGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
toggleButton.Parent = buttonGui

-- Thêm hiệu ứng hover giống Kavo UI
local function updateButtonColor()
    if uiEnabled then
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        toggleButton.Text = "Close UI"
    else
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        toggleButton.Text = "Open UI"
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
keyTab:Select()
