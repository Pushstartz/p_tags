Functions = {}
UserRole = ""
RoleColor = ""
LocalPlayer = {
	Ped = {
		Handle = 0
	}
}

RegisterFontFile("comic")
fontId = RegisterFontId("Comic Sans MS")
TriggerServerEvent("sendRole")

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for name, func in pairs(Functions) do
            func()
        end
    end
end)

RegisterNetEvent("requestRole", function(role, color)
    UserRole = role
    RoleColor = color
end)