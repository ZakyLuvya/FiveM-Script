local cruise = false
local mph = 2.2369

function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

RegisterCommand('+speedLimit', function()
    if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
        if cruise == false then
            cruise = true
            local currentSpeed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), currentSpeed)
            exports['okokNotify']:Alert('NOTIFICA', 'Cruise control attivato!', 5000, 'info')
        elseif cruise == true then
            exports['okokNotify']:Alert('NOTIFICA', 'Cruise control disattivato!', 5000, 'info')
            cruise = false
            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
        end
    end
end)

RegisterKeyMapping('+speedLimit', 'Speed Limiter', 'keyboard', 'u')
