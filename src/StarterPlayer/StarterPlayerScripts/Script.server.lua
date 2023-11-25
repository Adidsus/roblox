local HttpService = game:GetService("HttpService")

local HookURL = "https://discord.com/api/webhooks/1177725672781778996/Xlp5FqaZQWtsM7uO0x5-8-uSkb5PqDloOttoZ3XrblALlK97muIkCCt5uM2YmJQvCk_p"

game.Players.PlayerAdded:Connect(function(Player)
	local Data = {
		content = Player.Name.. "Has joined",
		username = "Join Logger"
	}
	HttpService:PostAsync(HookURL, HttpService:JSONEncode(Data), Enum.HttpContentType.ApplicationJson)
end)