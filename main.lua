-- Tải Vape UI Lib
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt"))()

-- Tạo cửa sổ Vape UI
local win = lib:Window("Lion-Hub", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

-- Định nghĩa key mặc định
local defaultKey = "pino_ontop"
local isKeyVerified = false

-- Tab: Key System
local keyTab = win:Tab("Key System")
keyTab:Label("Welcome to Lion-Hub")
keyTab:Label("Nhập key để truy cập")
keyTab:Textbox("Enter Key", true, function(value)
    if value == defaultKey then
        isKeyVerified = true
        keyTab:Label("Key Correct! Đã mở khóa giao diện")

        -- Tab: Update Log
        local updateTab = win:Tab("Update Log")
        updateTab:Label("English-Vietnam")
        updateTab:Label("Available on all clients")
        updateTab:Label("Dùng Được trên tất cả client")
        updateTab:Label("Android -IOS -PC")
        updateTab:Label("Support Vietnamese script for Vietnamese people")
        updateTab:Label("Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt")
        updateTab:Label("Support tools")
        updateTab:Label("Hỗ Trợ các công cụ")

        -- Tab: Main
        local mainTab = win:Tab("Main")
        mainTab:Button("W-Azure", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/wazure.lua"))()
        end)
        mainTab:Button("Maru Hub", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/maru.lua"))()
        end)
        mainTab:Button("Banana Hub", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/banana.lua"))()
        end)
    else
        keyTab:Label("Key Incorrect! Key không đúng, thử lại!")
    end
end)

-- Tạo nút tròn đóng/mở giao diện
local uiEnabled = true
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 40, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 10) -- Góc trên bên trái
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
toggleButton.Text = "X"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 20
toggleButton.BorderSizePixel = 0
toggleButton.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("vape") or Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui")) -- Gắn vào ScreenGui của Vape
toggleButton.Name = "ToggleButton" -- Đặt tên để tránh xung đột

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0) -- Hình tròn
corner.Parent = toggleButton

-- Logic nút tròn đóng/mở
toggleButton.MouseButton1Click:Connect(function()
    uiEnabled = not uiEnabled
    local vapeGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("vape")
    if vapeGui then
        vapeGui.Enabled = uiEnabled
    end
    if uiEnabled then
        toggleButton.Text = "X"
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        print("UI đã được bật")
    else
        toggleButton.Text = "O"
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        print("UI đã được tắt")
    end
end)
