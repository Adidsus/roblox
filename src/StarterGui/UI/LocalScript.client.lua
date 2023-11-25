local player = game.Players.LocalPlayer

local money = player:WaitForChild("leaderstats"):WaitForChild("Cash")

script.Parent.Currency.Text = money.Value

money.Changed:Connect(function(newValue)
    script.Parent.Currency.Text = newValue
end)