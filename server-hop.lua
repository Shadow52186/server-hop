local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gameId = game.PlaceId

-- ฟังก์ชันสำหรับการเปลี่ยนเซิร์ฟเวอร์
local function teleportToNewServer()
    print("Changing server...")
    local servers = TeleportService:GetTeleportSetting("AvailableServers") or {}

    if #servers > 0 then
        local randomServer = servers[math.random(1, #servers)]
        TeleportService:TeleportToPlaceInstance(gameId, randomServer, player)
    else
        -- หากไม่มีเซิร์ฟเวอร์ที่เลือกไว้ ใช้ฟังก์ชันค้นหาเซิร์ฟเวอร์ใหม่
        TeleportService:Teleport(gameId)
    end
end

-- ตั้งเวลา 30 นาที (1800 วินาที)
local TIME_INTERVAL = 20 -- 30 minutes in seconds

-- รันสคริปต์เมื่อเริ่มทำงาน
task.spawn(function()
    while true do
        task.wait(TIME_INTERVAL)
        teleportToNewServer()
    end
end)
