RegisterCommand('clear', function(source, args)
    TriggerEvent('chat:clear')
end, false)

TriggerEvent('chat:addSuggestion', '/clear', 'Pulisci la chat')
