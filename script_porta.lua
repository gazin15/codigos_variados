local Model = script.Parent

-- Variáveis botão/porta
local button1 = Model.Button1.ProximityPrompt
local door1 = Model.Door1
local button2 = Model.Button2.ProximityPrompt
local door2 = Model.Door2

-- Variáveis sons
local somApertarBotao = Model.Button1.Push
local listaSonsFechar = {door1.Close1, door1.Close2, door1.Close3}
local listaSonsAbrir = {door1.Open1, door1.Open2, door1.Open3}


local portaAberta = false
local debounce = false
local TEMPO_ABRIR_FECHAR = 2.5


local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(2) 

local function AbrirPorta()
	local tween1 = TweenService:Create(door1, tweenInfo, {Position = door1.Position + Vector3.new(4, 0, 0)})
	tween1:Play()
	local tween2 = TweenService:Create(door2, tweenInfo, {Position = door2.Position + Vector3.new(-4, 0, 0)})
	tween2:Play()
	
	local somTocarAbrir = listaSonsAbrir[math.random(1, #listaSonsAbrir)] 
	somTocarAbrir:Play()
	wait(TEMPO_ABRIR_FECHAR)
	portaAberta = not portaAberta
	debounce = false
end

local function FecharPorta()
	local tween1 = TweenService:Create(door1, tweenInfo, {Position = door1.Position + Vector3.new(-4, 0, 0)})
	tween1:Play()
	local tween2 = TweenService:Create(door2, tweenInfo, {Position = door2.Position + Vector3.new(4, 0, 0)})
	tween2:Play()
	
	local somTocarFechar = listaSonsFechar[math.random(1, #listaSonsFechar)] 
	somTocarFechar:Play()
	wait(TEMPO_ABRIR_FECHAR)
	portaAberta = not portaAberta 
	debounce = false
end

local function onTriggered(player)
	local playerEstaComCartao = false
	playerEstaComCartao = player.Character:FindFirstChild('KeyCard L1')
	
	if playerEstaComCartao and debounce == false then
		debounce = true
		if not portaAberta then 

			AbrirPorta()
		else
			FecharPorta()
		end
	end
end

button1.Triggered:Connect(onTriggered)
button2.Triggered:Connect(onTriggered)
