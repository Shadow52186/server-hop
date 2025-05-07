local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gameId = game.PlaceId

-- ฟังก์ชันสำหรับการเปลี่ยนเซิร์ฟเวอร์
local function teleportToNewServer()
    print("[SERVER-HOP] ⏩ Attempting to change server...")
    local servers = TeleportService:GetTeleportSetting("AvailableServers") or {}

    if #servers > 0 then
        local randomServer = servers[math.random(1, #servers)]
        print("[SERVER-HOP] ✅ Found available server. Teleporting now...")
        TeleportService:TeleportToPlaceInstance(gameId, randomServer, player)
    else
        print("[SERVER-HOP] ⚠️ No server list found. Teleporting to new random instance...")
        TeleportService:Teleport(gameId)
    end
end

-- ตั้งเวลา 30 นาที (1800 วินาที)
local TIME_INTERVAL = 10

-- รันสคริปต์เมื่อเริ่มทำงาน
task.spawn(function()
    print("[SERVER-HOP] 🚀 Script started. Waiting " .. TIME_INTERVAL .. " seconds before hopping.")
    while true do
        task.wait(TIME_INTERVAL)
        print("[SERVER-HOP] ⏳ Time reached. Preparing to hop...")
        teleportToNewServer()
    end
end)
