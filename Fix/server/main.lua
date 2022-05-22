AddEventHandler('chatMessage', function(source, n, msg)
	local msg = string.lower(msg)
	if msg == "/fix" then
		TriggerClientEvent('zakyboss:fix', source)
		CancelEvent()
	end
end)
