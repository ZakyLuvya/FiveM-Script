RegisterNetEvent('zakyboss:fix')

local playerPed = GetPlayerPed(-1)

AddEventHandler('zakyboss:fix',function()
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 9999)
		SetVehiclePetrolTankHealth(vehicle, 9999)
		SetVehicleFixed(vehicle)
		exports['okokNotify']:Alert("NOTIFICA", "Il veicolo è stato fixato!", 5000, 'info')
	end
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end