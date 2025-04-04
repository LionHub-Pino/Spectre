-- Pino-Script-Tong-Hop with Rayfield UI by Grok
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Lion-Hub",
   LoadingTitle = "Chào Mừng Đến Với LionsHub",
   LoadingSubtitle = "by @Pino_Azure",
   Theme = "Ocean",
   ConfigurationSaving = {
      Enabled = true,
      FileName = "Vexalix Hub"
   },
   KeySystem = true,
   KeySettings = {
      Title = "Pino_Azure Welcome",
      Subtitle = "Key System",
      Note = "key là Pino_Ontop",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"Pino_Ontop"}
   }
})

-- Tab: Update Log
local Tab = Window:CreateTab("Update Log", 4483362458)
Tab:CreateLabel("English-Vietnam")
Tab:CreateLabel("Available on all clients")
Tab:CreateLabel("Dùng Được trên tất cả client")
Tab:CreateLabel("Android -IOS -PC")
Tab:CreateLabel("Support Vietnamese script for Vietnamese people")
Tab:CreateLabel("Hỗ Trợ Script Tiếng Việt Dành Cho Người Việt")
Tab:CreateLabel("Support tools")
Tab:CreateLabel("Hỗ Trợ các công cụ")

-- Tab: Main (Chỉ giữ W-Azure, Maru Hub, Banana Hub)
local Tab = Window:CreateTab("Main", 4483362458)
Tab:CreateButton({
   Name = "W-Azure",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/wazure.lua"))()
   end
})
Tab:CreateButton({
   Name = "Maru Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/maru.lua"))()
   end
})
Tab:CreateButton({
   Name = "Banana Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/tulathangngu/Vietnam/main/banana.lua"))()
   end
})

Rayfield:LoadConfiguration()
