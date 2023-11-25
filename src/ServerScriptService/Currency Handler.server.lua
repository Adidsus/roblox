local player = game.Players.LocalPlayer
local money = player:WaitForChild("leaderstats"):WaitForChild("Cash")

while wait(2) do
	money.Value = money.Value + 5
end