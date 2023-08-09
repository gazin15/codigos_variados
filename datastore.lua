local datastoreservice = game:GetService("DataStoreService")
local datastore = datastoreservice:GetDataStore("Money")

game.Players.PlayerAdded:Connect(function(player)
	local sucess, playerdata = pcall(function()
	return datastore:GetAsync(player.UserId)
end)
if sucess then
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player	

	local Money = Instance.new("IntValue")
	Money.Name = "Money"
	Money.Value = playerdata or 0
	Money.Parent = leaderstats

	else
	warn("data Store falhou")
	end
end)

game.Players.PlayerRemoving:Connect(function(plr)
local sucess, playerdata = pcall(function()
	datastore:SetAsync(plr.UserId, plr.leaderstats.Money.Value)
end)
	if not sucess then
		warn("data store falhou na saida")
	end
end)
