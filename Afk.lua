-- Demon Soul Simulator | Auto Attack (Tool-based)
-- Button kecil, draggable

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local autoAttack = false
local attackDelay = 0.15 -- ubah lebih kecil = lebih cepat (aman 0.1–0.2)

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AutoAttackGUI"
gui.Parent = lp:WaitForChild("PlayerGui")

local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0, 120, 0, 35)
btn.Position = UDim2.new(0, 20, 0.6, 0)
btn.Text = "AUTO ATTACK : OFF"
btn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
btn.TextColor3 = Color3.new(1,1,1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 12
btn.Active = true
btn.Draggable = true
btn.BorderSizePixel = 0
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

-- Toggle
btn.MouseButton1Click:Connect(function()
    autoAttack = not autoAttack
    if autoAttack then
        btn.Text = "AUTO ATTACK : ON"
        btn.BackgroundColor3 = Color3.fromRGB(0, 140, 0)
    else
        btn.Text = "AUTO ATTACK : OFF"
        btn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
    end
end)

-- Auto attack loop (Tool-based)
task.spawn(function()
    while task.wait() do
        if autoAttack then
            local char = lp.Character
            if char then
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                    task.wait(attackDelay)
                else
                    task.wait(0.2)
                end
            end
        end
    end
end)
