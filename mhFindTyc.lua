local plrTycoon = game:GetService("Players").LocalPlayer.ActiveTycoon.Value
local tycoons = game:GetService("Workspace").Tycoons

function teleportBase()
    for _, tycoonModel in ipairs(tycoons:GetChildren()) do
        if tycoonModel == plrTycoon then
            return tycoons:FindFirstChild(tycoonModel.Name)
        end
    end
end

local foundTycoon = teleportBase()

if foundTycoon then
    print("", foundTycoon:GetFullName())
else
    print("Cannot find tycoon")
end
