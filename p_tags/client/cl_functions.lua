function Functions:UpdateHandle()
	LocalPlayer.Ped.Handle = PlayerPedId()
end

function Functions:SetTag()
	for _, i in pairs(GetActivePlayers()) do
		if NetworkIsPlayerActive(i) then

			local iPed = GetPlayerPed(i)
			local playerName = GetPlayerName(i)
			local playerId = GetPlayerServerId(i)
			
			if iPed ~= LocalPlayer.Ped.Handle then 
				if DoesEntityExist(iPed) then
					local headLabelId = CreateMpGamerTag(iPed, " ", 0, 0, " ", 0)
										SetMpGamerTagName(headLabelId, " ")
										SetMpGamerTagVisibility(headLabelId, 0, false)
										RemoveMpGamerTag(headLabelId) 

					distance = #(GetEntityCoords(LocalPlayer.Ped.Handle) - GetEntityCoords(iPed)) 
					if distance < 15 then 
						DrawText3D(GetEntityCoords(iPed)["x"], GetEntityCoords(iPed)["y"], GetEntityCoords(iPed)["z"]+1, "[~".. RoleColor .."~".. UserRole .. "~w~]  |  ~q~" .. playerName .."~w~ | [~y~" .. playerId .. "~w~] ")
					end
				end
			end
		end
	end
end

function DrawText3D(x, y, z, text)
	local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
	local dist = #(GetGameplayCamCoords() - vec(x, y, z))

	local scale = (4.00001 / dist) * 0.3
	if scale > 0.2 then
		scale = 0.2
	elseif scale < 0.15 then
		scale = 0.15
	end

	local fov = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov

	if onScreen then
		SetTextFont(false and fontId or 4)
		SetTextScale(scale, scale)
		SetTextProportional(true)
		SetTextColour(210, 210, 210, 180)
		SetTextCentre(true)
		SetTextDropshadow(50, 210, 210, 210, 255)
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(_x, _y - 0.025)
	end
end
