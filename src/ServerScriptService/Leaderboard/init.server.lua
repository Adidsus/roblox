game.Players.PlayerAdded:Connect(function(player)
    
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local cash = Instance.new("IntValue")
    cash.Name = "Cash"
	cash.Parent = leaderstats
    -- cash.Value = 10
    local money = player:WaitForChild("Cash")

    print("player money" .. money.Value)
    cash.Value = money.Value

    money.Changed:Connect(function(newValue)
        cash.Value = newValue
    end)

end)