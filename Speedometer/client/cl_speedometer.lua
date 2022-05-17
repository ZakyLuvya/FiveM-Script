local mph = 2.2369
local kmph = 3.6

function drawSpeedometer(kmh)
    if kmh < 1 then kmh = 0 end
    SetTextFont(2)
    SetTextProportional(0)
    SetTextScale(0.5,0.5)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(getSpeedColor(kmh)..kmh.." kmh")
    DrawText(0.10,0.73)
end

function getSpeedColor(kmh)
    if kmh < 65 then
        return ""
    end
    if kmh >- 65 and kmh < 125 then
        return ""
    end
    if kmh > 125 then
        return ""
    end 
end

Citizen.CreateThread(function()
    while true do
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        local getKmh = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*mph)
        drawSpeedometer(math.floor(getKmh))
        end
        Citizen.Wait(1)
    end
end)