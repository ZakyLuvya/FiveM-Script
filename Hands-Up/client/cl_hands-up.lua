handsUp = false
dict = 'random@mugging3'

Citizen.CreateThread(function()
    Citizen.Wait(150)

    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
end)

function togglehandsup()
    local ped = PlayerPedId()
    if not handsUp and IsPedOnFoot(ped) then
        --TaskHandsUp(ped, -1, -1, -1, true) se si usa questo non ci si può muovere con le mani alzate
        TaskPlayAnim(ped, dict, 'handsup_standing_base', 5.0, -5.5, -1, 49, 0.0, 0, 0, 0)
        handsUp = true
    else
        ClearPedTasks(ped)
        handsUp = false
    end
end

RegisterCommand('handsup', function()
    togglehandsup()
end, false)

RegisterKeyMapping('handsup', 'Alza le mani', 'keyboard', 'x')