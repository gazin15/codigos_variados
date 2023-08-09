local module = {}

local db = false
local drop = false

function module.Dropper(hit, pasta, teamname, tempo, saidaa, botao)
	if db == false then
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		if player and player.Team.Name == teamname then
			botao.CanTouch = false
			botao.CanCollide = false
			for _, bloco in ipairs(pasta:GetChildren()) do
				if bloco:IsA("BasePart") then
					bloco.Transparency = 0
					print("bloco")
					drop = true
				end				
			end
		end
	end


while drop do
		local clone = game.ServerStorage.tycoon.Hamburger:Clone()
		clone:Clone()
		print("clone")
		clone.Position = saidaa
		clone.Parent = game.Workspace
		clone.Anchored = false
		wait(tempo)	
		db = true
		end
end

return module
