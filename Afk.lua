local VirtualUser = game:GetService("VirtualUser")
local player = game.Players.LocalPlayer

game.StarterGui:SetCore("SendNotification", {
    Title = "Anti AFK",
    Text = "Anti AFK AKTIF",
    Duration = 5
})

player.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)
