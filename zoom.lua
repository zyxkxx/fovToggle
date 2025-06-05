local Players = game:GetService("Players")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

player.CameraMinZoomDistance = 0.5
player.CameraMaxZoomDistance = 300
camera.CameraCollisionMode = Enum.CameraCollisionMode.Disabled
