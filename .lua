local P=game:GetService("Players")

local R=game:GetService("ReplicatedStorage")

local L=P.LocalPlayer



local Z=require(L.PlayerScripts.Controllers.ZombieClient).Zombies



if type(Z)~="table" then

	for _,v in pairs(getgc(true)) do

		if type(v)=="table" and rawget(v,"Zombies") and rawget(v,"ZombieModels") then

			Z=v.Zombies

			break

		end

	end

end



local D=R.ZombieRemotes.ZombieDamage



local function H()

	local M=L.Character and L.Character:FindFirstChildOfClass("Humanoid")

	if M then M.HipHeight=25 end

end



H()

L.CharacterAdded:Connect(function() task.wait(1) H() end)



task.spawn(function()

	while task.wait(.2) do

		H()



		for id,data in pairs(Z) do

			if data and not data.IsDying and data.Health>0 then

				D:FireServer(id,math.huge)

			end

		end

	end

end)
