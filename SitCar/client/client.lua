ESX = exports.es_extended:getSharedObject()

local seduto = false

RegisterCommand('sitcar', function()
    local ped = PlayerPedId()
    local vehicle   = ESX.Game.GetClosestVehicle(GetEntityCoords(ped))
    local vehCoords, pCoords = GetEntityCoords(vehicle), GetEntityCoords(ped)
    if GetDistanceBetweenCoords(vehCoords, pCoords, true) < 3.0 then
        if not seduto then
            TaskEnterVehicle(ped, vehicle, 2000, 1, 1.0, 1, 0)
            Citizen.Wait(2000)
            TaskLeaveVehicle(ped, vehicle, 16)
            Citizen.Wait(0)
            seduto = true
            AttachEntityToEntity(ped, vehicle, -1, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
            ExecuteCommand('e sit5')
            ESX.ShowNotification("Sei entrato nel veicolo")
        else
            seduto = false
            DetachEntity(ped)
            ExecuteCommand('e c')
            ESX.ShowNotification("Sei uscito dal veicolo")
        end
    else
        ESX.ShowNotification("Non ci sono veicoli nelle vicinanze")
    end
end)
