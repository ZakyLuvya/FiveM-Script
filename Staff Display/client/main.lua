function staffhud(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(true)
	SetTextColour(255, 0, 0, 255)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 700
end


local sthud = false
RegisterCommand('staff', function(source, args, rawCommand)
    if args[1] == "on" then 
        sthud = true
        exports['okokNotify']:Alert('NOTIFICA', 'Staff attivato!', 5000, 'info')
    else args[1] == "off" then 
        sthud = false 
        exports['okokNotify']:Alert('NOTIFICA', 'Staff Disattivato!', 5000, 'info')
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local offset = 1
        local Mycoords = GetEntityCoords(GetPlayerPed(-1), false)
        local coords = GetEntityCoords(PlayerPedId(), false)
        local dist = Vdist2(Mycoords, coords)
        if dist < 5 then
            if sthud == true then
                staffhud(Mycoords.x,  Mycoords.y,  Mycoords.z + 1, "STAFF", 0.6)
            end
        end
    end
end)
