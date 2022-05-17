RegisterCommand("map", function(source)
    mappa = not mappa
    if mappa then
        DisplayRadar(false)
        exports['okokNotify']:Alert('NOTIFICA', 'Minimappa Disattivata', 5000, 'info')
    else
        DisplayRadar(true)
        exports['okokNotify']:Alert('NOTIFICA', 'Minimappa Attivata', 5000, 'info')
    end
end)
