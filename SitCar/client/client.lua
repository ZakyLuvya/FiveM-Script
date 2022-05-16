local nelveh = false
RegisterCommand('sc', function()
    local vehicle   = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
    local vehCoords, pCoords = GetEntityCoords(vehicle), GetEntityCoords(PlayerPedId())
    if GetDistanceBetweenCoords(vehCoords, pCoords, true) < 3.0 then
        if not nelveh then
            TaskEnterVehicle(PlayerPedId(), vehicle, 2000, 1, 1.0, 1, 0)
            Citizen.Wait(2000)
            TaskLeaveVehicle(PlayerPedId(), vehicle, 16)
            Citizen.Wait(0)
            nelveh = true
            AttachEntityToEntity(PlayerPedId(), vehicle, -1, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
            ExecuteCommand('e sit5')
            exports['okokNotify']:Alert('NOTIFICA', 'Sei entrato nel veicolo!', 5000, 'info')
        else
            nelveh = false
            DetachEntity(PlayerPedId())
            ExecuteCommand('e c')
            exports['okokNotify']:Alert('NOTIFICA', 'Sei uscito dal veicolo!', 5000, 'info')
        end
    else
        exports['okokNotify']:Alert('NOTIFICA', 'Non ci sono veicoli nelle vicinanze!', 5000, 'info')
    end
end)