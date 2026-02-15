-- Anti AFK (Movement-based) WORKING
-- Cocok untuk Demon Soul Simulator

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local function getHRP()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("HumanoidRootPart")
end

task.spawn(function()
    while true do
        task.wait(60) -- setiap 60 detik
        local hrp = getHRP()
        local cf = hrp.CFrame
        hrp.CFrame = cf * CFrame.new(0.15, 0, 0)
        task.wait(0.1)
        hrp.CFrame = cf
    end
end)
