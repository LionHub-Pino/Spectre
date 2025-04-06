-- (Phần đầu mã giữ nguyên, chỉ hiển thị phần thay đổi từ Tabs trở đi)

-- Tạo các tab (không có ConsoleTab)
local Tabs = {
    MainHubTab = Window:Tab({ Title = "MainHub", Icon = "star", Desc = "Script MainHub chính." }),
    KaitunTab = Window:Tab({ Title = "Kaitun", Icon = "flame", Desc = "Các script Kaitun." }),
    MainTab = Window:Tab({ Title = "Main", Icon = "shield", Desc = "Các tính năng chính và script." }),
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
    Title = "Marukaitun (Mobile)", -- Đổi thành "Marukaitun (Mobile)"
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
    Title = "Maru Hub (Mobile)", -- Đổi thành "Maru Hub (Mobile)"
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
