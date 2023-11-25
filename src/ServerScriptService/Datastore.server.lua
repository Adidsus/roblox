local DataStoreService = game:GetService("DataStoreService")
local SaveDataStore = DataStoreService:GetDataStore("SaveData")

game.Players.PlayerAdded:Connect(function(player)
    wait()

    local leaderstats = player:FindFirstChild("leaderstats") or Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local cash = leaderstats:FindFirstChild("Cash") or Instance.new("IntValue")
    cash.Name = "Cash"
    cash.Parent = leaderstats

    local playerId = "id_" .. player.UserId

    local success, savedData = pcall(function()
        return SaveDataStore:GetAsync(playerId)
    end)

    if success and savedData then
        cash.Value = cash.Value + savedData[1]  -- Dodaj zapisane pieniądze do aktualnej wartości
    else
        cash.Value = cash.Value  -- Nie zmieniaj wartości, jeśli nie ma wcześniejszych zapisów
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local cash = leaderstats:FindFirstChild("Cash")
        if cash then
            local playerId = "id_" .. player.UserId

            local success, error = pcall(function()
                SaveDataStore:SetAsync(playerId, {cash.Value})
				print("player money saved" .. cash.Value)
            end)

            if not success then
                warn("Failed to save data for player " .. player.Name .. ": " .. error)
            end
        end
    end
end)
