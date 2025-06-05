local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera

local fovDefault = 120
local fovToggle = 70
local currentFOV = fovDefault
local targetFOV = fovDefault

local toggled = false
local transitionTime = 0.25
local elapsedTime = 0

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.Q then
		toggled = not toggled
		if toggled then
			targetFOV = fovToggle
		else
			targetFOV = fovDefault
		end
		elapsedTime = 0
	end
end)

RunService.RenderStepped:Connect(function(dt)
	if currentFOV ~= targetFOV then
		elapsedTime = elapsedTime + dt
		local alpha = math.clamp(elapsedTime / transitionTime, 0, 1)
		currentFOV = currentFOV + (targetFOV - currentFOV) * alpha
		if alpha == 1 then
			currentFOV = targetFOV 
		end
		camera.FieldOfView = currentFOV
	else
		camera.FieldOfView = currentFOV
	end
end)
