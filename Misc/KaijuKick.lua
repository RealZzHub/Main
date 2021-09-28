local s = Instance.new("Sound", game.Workspace)
s.Name = math.random()
s.SoundId = "rbxassetid://131644951"
s:Play()

game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Notice",
        Text = "Kaiju Paradise Kick Script is disabled temporarily."
    })
wait(2)
s:Destroy()
