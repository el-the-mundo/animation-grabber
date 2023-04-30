getgenv().clearTable = false

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChild("Humanoid")
local consoleInput
local animationTable = {}

rconsolename("Animation Stealer V1 | Light Destroyer ! !!! !!")
rconsoleprint("Welcome! Type console: cmds to view the list of commands.\n")

function animationSteal()
    for i, v in pairs(Humanoid:GetPlayingAnimationTracks()) do
        if not table.find(animationTable, v.Name) then
            rconsolewarn(v.Name..": "..string.sub(v.Animation.AnimationId, 33, 5000))
            table.insert(animationTable, v.Name)
        end
        
      task.spawn(function()
        consoleInput = rconsoleinput()
        if consoleInput == "console: cmds" then
            rconsoleerr("Prefix: console:")
            rconsoleerr("console: clearTable - Clears the table which contains already played animations. (This is used to re-print animations.)")
            rconsoleerr("console: clear - Clears whatever has been printed.")
            rconsoleerr("console: clearAll - Clears both the table and the console.")
        elseif consoleInput == "console: clearTable" then
            table.clear(animationTable)
            rconsoleprint("Cleared Table!\n")
        elseif consoleInput == "console: clear" then
            rconsoleclear()
        elseif consoleInput == "console: clearAll" then
            rconsoleclear()
            table.clear(animationTable)
            rconsoleprint("All has been cleared.\n")
            end
        end)
    end
end

while wait() do
    animationSteal()
end
