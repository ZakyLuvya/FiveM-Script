function Scrivistacazzodiscritta(x, y, z, text, scale)
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


local fradibo = false
RegisterCommand('staff', function(source, args, rawCommand)
    if args[1] == "on" then 
        fradibo = true
        ESX.ShowNotification("Staff attivato")
    elseif args[1] == "off" then 
        fradibo = false 
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
            if fradibo == true then
                Scrivistacazzodiscritta(Mycoords.x,  Mycoords.y,  Mycoords.z + 1, "STAFF", 0.6)
            end
        end
    end
end)