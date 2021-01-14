ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('chatMessage', function(playerId, playerName, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		playerName = GetRealPlayerName(playerId)
		TriggerClientEvent('chat:addMessage', -1, {args = {_U('ooc_prefix', playerName), message}, color = {128, 128, 128}})
	end
end)

RegisterCommand('twt', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('fd_rpchat: Не можете да използвате тази команда през конзолата!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {args = {_U('twt_prefix', playerName), args}, color = {0, 153, 204}})
	end
end, false)

RegisterCommand('in', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('fd_rpchat: Не можете да използвате тази команда през конзолата!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {args = {_U('in_prefix', playerName), args}, color = {211, 77, 167}})
	end
end, false)

RegisterCommand('dw', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('fd_rpchat: Не можете да използвате тази команда през конзолата!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('dw_prefix'), args, {38, 38, 38})
	end
end, false)

RegisterCommand('olx', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('fd_rpchat: Не можете да използвате тази команда през конзолата!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('olx_prefix', playerName), args, {255, 176, 2})
	end
end, false)

RegisterCommand('112', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('fd_rpchat: Не можете да използвате тази команда през конзолата!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('112_prefix', playerName), args, {195, 0, 0})
	end
end, false)

function GetRealPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if Config.EnableESXIdentity then
			if Config.OnlyFirstname then
				return xPlayer.get('firstName')
			else
				return xPlayer.getName()
			end
		else
			return xPlayer.getName()
		end
	else
		return GetPlayerName(playerId)
	end
end
