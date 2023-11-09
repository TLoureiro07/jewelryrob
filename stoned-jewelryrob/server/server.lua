if Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
end
---------- Variaveis ---------
local Cooldown = false


VTunnel = {}

RegisterServerEvent('artheist:server:syncHeistStart')
AddEventHandler('artheist:server:syncHeistStart', function()
    TriggerClientEvent('artheist:client:syncHeistStart', -1)
end)

RegisterServerEvent('artheist:server:syncPainting')
AddEventHandler('artheist:server:syncPainting', function(x)
    TriggerClientEvent('artheist:client:syncPainting', -1, x)
end)

RegisterServerEvent('artheist:server:syncAllPainting')
AddEventHandler('artheist:server:syncAllPainting', function()
    TriggerClientEvent('artheist:client:syncAllPainting', -1)
end)
RegisterServerEvent('artheist:server:rewardItem')
AddEventHandler('artheist:server:rewardItem', function(scene)
    local _source = source
    

    if Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(_source)
        xPlayer.addInventoryItem(Config.ItemPaint, Config.PaintingAmount)
            -- Registro de log no Discord
			local playerName = xPlayer.getName()
			local steamName = GetPlayerName(source)
			local identifier = tostring(source)
			local discord = "No Discord Info"
			local identifiers = GetPlayerIdentifiers(source)
			local ident = "No Identifier"
	
			local steamHex = "No Steam Hex Info"
			for _, id in ipairs(GetPlayerIdentifiers(source)) do
				if string.find(id, "discord:") then
					discord = id:gsub("discord:", "<@")
				elseif string.find(id, "steam:") then
					steamHex = id:gsub("steam:", "")
				end
			end
	
			for _, id in ipairs(identifiers) do
				if string.find(id, "license:") then
					ident = id:gsub("license:", "")
					break
				end
			end
	
			local timestamp = os.date("%A, %B %d, %Y at %I:%M %p")
			local footer = {
				text = 'Stoned Scripts' .. " | " .. timestamp,
				icon_url = "https://cdn.discordapp.com/attachments/1110843596753612901/1111289432348315718/aa586f1d0a95730f4fbc88ba884d7b9fe1afd5dd.png"
			}

			
			local steamProfileLink = "https://steamcommunity.com/profiles/"
			if steamHex ~= "No Steam Hex Info" then
				steamProfileLink = steamProfileLink .. tonumber(steamHex, 16)
			end

	
			local information = {
				{
					color = "16776960",
					author = {
						name = Logs.ServerName .. " - Jewelry Robbery",
						icon_url = Logs.IconURL,
					},
					title = "> Painting Robbed",
					description = "**Item name:** " .. "`" .. Config.ItemPaint .. "`" .. "\n**Amount:** " .. Config.PaintingAmount .. "\n\n> **Player Information:**\n\n **Character Name**: " .. playerName .. " | **Name Steam:** " .. steamName .. "\n**ID IN-GAME:** " .. identifier .. "\n**Discord:** " .. discord .. "> " .. "\n**Identifier:** " .. ident .."\n**Steam Profile:** [Click here](" .. steamProfileLink .. ")",
					footer = footer
				}
			}
	
			PerformHttpRequest(Logs.Webhook, function(err, text, headers) end, "POST", json.encode({ username = Logs.BotName, embeds = information }), { ["Content-Type"] = "application/json" })
			
    elseif Config.Framework == 'qb' then
        -------------
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(Config.ItemPaint, Config.PaintingAmount)
        TriggerClientEvent("inventory:client:ItemBox", Player.PlayerData.source, QBCore.Shared.Items[Config.ItemPaint], "add")

            -- Registro de log no Discord
			local Player = QBCore.Functions.GetPlayer(source)
			local playerName = Player.PlayerData.name
			local steamName = GetPlayerName(source)
			local identifier = tostring(source)
			local discord = "No Discord Info"
			local identifiers = GetPlayerIdentifiers(source)
			local ident = "No Identifier"
	
			local steamHex = "No Steam Hex Info"
			for _, id in ipairs(GetPlayerIdentifiers(source)) do
				if string.find(id, "discord:") then
					discord = id:gsub("discord:", "<@")
				elseif string.find(id, "steam:") then
					steamHex = id:gsub("steam:", "")
				end
			end
	
			for _, id in ipairs(identifiers) do
				if string.find(id, "license:") then
					ident = id:gsub("license:", "")
					break
				end
			end
	
			local timestamp = os.date("%A, %B %d, %Y at %I:%M %p")
			local footer = {
				text = 'Stoned Scripts' .. " | " .. timestamp,
				icon_url = "https://cdn.discordapp.com/attachments/1110843596753612901/1111289432348315718/aa586f1d0a95730f4fbc88ba884d7b9fe1afd5dd.png"
			}

			
			local steamProfileLink = "https://steamcommunity.com/profiles/"
			if steamHex ~= "No Steam Hex Info" then
				steamProfileLink = steamProfileLink .. tonumber(steamHex, 16)
			end

	
			local information = {
				{
					color = "16776960",
					author = {
						name = Logs.ServerName .. " - Jewelry Robbery",
						icon_url = Logs.IconURL,
					},
					title = "> Painting Robbed",
					description = "**Item name:** " .. "`" .. Config.ItemPaint .. "`" .."\n**Amount:** " .. Config.PaintingAmount .. "\n\n> **Player Information:**\n\n **Character Name**: " .. playerName .. " | **Name Steam:** " .. steamName .. "\n**ID IN-GAME:** " .. identifier .. "\n**Discord:** " .. discord .. "> " .. "\n**Identifier:** " .. ident .. "\n**Steam Hex:** " .. steamHex .. "\n**Steam Profile:** [Click here](" .. steamProfileLink .. ")",
					footer = footer
				}
			}
	
			PerformHttpRequest(Logs.Webhook, function(err, text, headers) end, "POST", json.encode({ username = Logs.BotName, embeds = information }), { ["Content-Type"] = "application/json" })
    end
    TriggerClientEvent("stoned-vang:notif", source, _L("give_reward") .. Config.PaintingAmount .. "x " .._L('PaintingName'), "success")
end)

RegisterServerEvent('artheist:server:finishHeist')
AddEventHandler('artheist:server:finishHeist', function()
    Cooldown = true
    local timer = Config.Cooldown * 60000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            Cooldown = false
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
local timers = 0
local andamento = false
local roubando = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKJEWELRY
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('stoned-jewelryrob:checkJewelry')
AddEventHandler('stoned-jewelryrob:checkJewelry', function()
    local source = source
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(src))
    local count = 0
	

    if Config.Framework == 'esx' then
        for _, v in ipairs(ESX.GetPlayers()) do
            local Player = ESX.GetPlayerFromId(v)
            if Player.job.name == "police" then
                count = count + 1
            end
        end

        if count < Config.MinimumPoliceToRob then
			local faltaPolicias = Config.MinimumPoliceToRob - count
            TriggerClientEvent("stoned-vang:notif", source, _L("need_police") .. _L("need_count") .. faltaPolicias, "error")

        elseif Cooldown then
            local timer = Config.Cooldown * 60000 -- Tempo em milissegundos
            local remainingTime = timer / 1000 -- Armazene o tempo restante em segundos
            TriggerClientEvent("stoned-vang:notif", source, _L("cooldown"), "error")
            while timer > 0 do
                --TriggerClientEvent("stoned-vang:notif", source, _L("cooldown") .. _L("cooldown_count") .. remainingTime .. "s", "error")
                Wait(1000)
                timer = timer - 1000
                remainingTime = timer / 1000 -- Atualize o tempo restante em segundos a cada segundo
                
            end
            

            Cooldown = false -- Quando o cooldown terminar, defina-o como falso novamente
        else
            --print("iniciou")
            TriggerClientEvent('stoned-jewelryrob:startHeist', source)
            Cooldown = true -- Ative o cooldown
            -- Registro de log no Discord
			local playerName = xPlayer.getName()
			local steamName = GetPlayerName(source)
			local identifier = tostring(source)
			local discord = "No Discord Info"
			local identifiers = GetPlayerIdentifiers(source)
			local ident = "No Identifier"
	
			local steamHex = "No Steam Hex Info"
			for _, id in ipairs(GetPlayerIdentifiers(source)) do
				if string.find(id, "discord:") then
					discord = id:gsub("discord:", "<@")
				elseif string.find(id, "steam:") then
					steamHex = id:gsub("steam:", "")
				end
			end
	
			for _, id in ipairs(identifiers) do
				if string.find(id, "license:") then
					ident = id:gsub("license:", "")
					break
				end
			end
	
			local timestamp = os.date("%A, %B %d, %Y at %I:%M %p")
			local footer = {
				text = 'Stoned Scripts' .. " | " .. timestamp,
				icon_url = "https://cdn.discordapp.com/attachments/1110843596753612901/1111289432348315718/aa586f1d0a95730f4fbc88ba884d7b9fe1afd5dd.png"
			}

			
			local steamProfileLink = "https://steamcommunity.com/profiles/"
			if steamHex ~= "No Steam Hex Info" then
				steamProfileLink = steamProfileLink .. tonumber(steamHex, 16)
			end

	
			local information = {
				{
					color = "16776960",
					author = {
						name = Logs.ServerName .. " - Jewelry Robbery",
						icon_url = Logs.IconURL,
					},
					title = "> Robbery Started",
					description = "**Location:** " .. "`" .. coords .. "`" .. "\n\n> **Player Information:**\n\n **Character Name**: " .. playerName .. " | **Name Steam:** " .. steamName .. "\n**ID IN-GAME:** " .. identifier .. "\n**Discord:** " .. discord .. "> " .. "\n**Identifier:** " .. ident .. "\n**Steam Profile:** [Click here](" .. steamProfileLink .. ")",
					footer = footer
				}
			}
	
			PerformHttpRequest(Logs.Webhook, function(err, text, headers) end, "POST", json.encode({ username = Logs.BotName, embeds = information }), { ["Content-Type"] = "application/json" })
			
            
        end
    elseif Config.Framework == 'qb' then
        local players = QBCore.Functions.GetPlayers()
		local Player = QBCore.Functions.GetPlayer(source)
            
        --[[for _, playerId in ipairs(players) do
            local xPlayer = QBCore.Functions.GetPlayer(playerId)
            if xPlayer and xPlayer.job.name == 'police' then
                TriggerClientEvent('stoned-atmrob:killBlip', playerId)
            end
        end]]
		for _, playerId in pairs(QBCore.Functions.GetPlayers()) do
			local Player = QBCore.Functions.GetPlayer(playerId)
			if Player.PlayerData.job.name == "police" then
				count = count + 1
			end
		end

        if count < Config.MinimumPoliceToRob then
			local faltaPolicias = Config.MinimumPoliceToRob - count
            TriggerClientEvent("stoned-vang:notif", source, _L("need_police") .. _L("need_count") .. faltaPolicias, "error")

        elseif Cooldown then
            local timer = Config.Cooldown * 60000 -- Tempo em milissegundos
            local remainingTime = timer / 1000 -- Armazene o tempo restante em segundos
            TriggerClientEvent("stoned-vang:notif", source, _L("cooldown"), "error")
            while timer > 0 do
                --TriggerClientEvent("stoned-vang:notif", source, _L("cooldown") .. _L("cooldown_count") .. remainingTime .. "s", "error")
                Wait(1000)
                timer = timer - 1000
                remainingTime = timer / 1000 -- Atualize o tempo restante em segundos a cada segundo
                
            end
            
            Cooldown = false -- Quando o cooldown terminar, defina-o como falso novamente
        else
            -- LOG Discord
			local Player = QBCore.Functions.GetPlayer(source)
			local playerName = Player.PlayerData.name
			local steamName = GetPlayerName(source)
			local identifier = tostring(source)
			local discord = "No Discord Info"
			local identifiers = GetPlayerIdentifiers(source)
			local ident = "No Identifier"
	
			local steamHex = "No Steam Hex Info"
			for _, id in ipairs(GetPlayerIdentifiers(source)) do
				if string.find(id, "discord:") then
					discord = id:gsub("discord:", "<@")
				elseif string.find(id, "steam:") then
					steamHex = id:gsub("steam:", "")
				end
			end
	
			for _, id in ipairs(identifiers) do
				if string.find(id, "license:") then
					ident = id:gsub("license:", "")
					break
				end
			end
	
			local timestamp = os.date("%A, %B %d, %Y at %I:%M %p")
			local footer = {
				text = 'Stoned Scripts' .. " | " .. timestamp,
				icon_url = "https://cdn.discordapp.com/attachments/1110843596753612901/1111289432348315718/aa586f1d0a95730f4fbc88ba884d7b9fe1afd5dd.png"
			}

			
			local steamProfileLink = "https://steamcommunity.com/profiles/"
			if steamHex ~= "No Steam Hex Info" then
				steamProfileLink = steamProfileLink .. tonumber(steamHex, 16)
			end

	
			local information = {
				{
					color = "16776960",
					author = {
						name = Logs.ServerName .. " - Jewelry Robbery",
						icon_url = Logs.IconURL,
					},
					title = "> Robbery Started",
					description = "**Location:** " .. "`" .. coords .. "`" .. "\n\n> **Player Information:**\n\n **Character Name**: " .. playerName .. " | **Name Steam:** " .. steamName .. "\n**ID IN-GAME:** " .. identifier .. "\n**Discord:** " .. discord .. "> " .. "\n**Identifier:** " .. ident .. "\n**Steam Profile:** [Click here](" .. steamProfileLink .. ")",
					footer = footer
				}
			}
	
			PerformHttpRequest(Logs.Webhook, function(err, text, headers) end, "POST", json.encode({ username = Logs.BotName, embeds = information }), { ["Content-Type"] = "application/json" })
			
            --print("iniciou")
            TriggerClientEvent('stoned-jewelryrob:startHeist', source)
            Cooldown = true -- Ative o cooldown
            
        end

    end
end)


if Config.Framework == 'qb' then
    QBCore.Functions.CreateCallback("stoned-vangrob:Cooldown",function(source, cb)
        if Cooldown then
            cb(true)
        else
            cb(false)
        end
    end)

	local count = 0
    QBCore.Functions.CreateCallback("stoned_vangrob:getpolicecountqb",function(source, cb)
        for i, v in pairs(QBCore.Functions.GetQBPlayers()) do
            if v.PlayerData.job.name == "police" and (v.PlayerData.job.onduty == true or Config.RequireOnDuty == false) then
                count = count + 1
            end
        end
        cb(count)
    end)
elseif Config.Framework == 'esx' then
    ESX.RegisterServerCallback("stoned-vangrob:Cooldown", function(source, cb)
        if Cooldown then
            cb(true)
        else
            cb(false)
        end
    end)

	local count = 0
    ESX.RegisterServerCallback("stoned_vangrob:getpolicecountesx", function(source, cb)
        for i, v in pairs(ESX.GetPlayers()) do
            local Player = ESX.GetPlayerFromId(v)
            if Player.job.name == "police" then
                count = count + 1
            end
        end
        cb(count)
    end)
end 

RegisterNetEvent("jewelrystart")
AddEventHandler("jewelrystart",function()
	timers = os.time()
	andamento = true
	TriggerClientEvent('iniciandojewelry',source,x,y,z,h,sec,tipo,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CALLPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
--[[function VTunnel.callPolice(x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	TriggerClientEvent(
		"vrp_sound:fixed",
		-1,
		source,
		x,
		y,
		z,
		100,
		'alarm',
		0.1
	)

	local policia = System['user_perms']
	for l,w in pairs(policia) do
		local player = vRP.getUserSource(parseInt(w))
		if player then
			async(function()
				local ids = idgens:gen()
				vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
				blips[ids] = vRPclient.addBlip(
					player,
					x,
					y,
					z,
					1,
					59,
					"Roubo a Joalheria",
					0.5,
					true
				)
				TriggerClientEvent(
					'chatMessage',
					player,
					"911",
					{65,130,255},
					String['get_them']
				)
				SetTimeout(
					60000,
					function() vRPclient.removeBlip(
						player,blips[ids]
					) 
					idgens:free(ids) 
				end)
			end)
		end
	end
end]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- RETURNJEWELRY
-----------------------------------------------------------------------------------------------------------------------------------------
function VTunnel.returnJewelry()
	return andamento
end

function VTunnel.returnJewelry2()
	return roubando
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMEROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
local timers = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(timers) do
			if v > 0 then
				timers[k] = v - 1
			end
		end
		if andamento then
			segundos = segundos - 1
			if segundos <= 0 then
				timers = {}
				andamento = false
				roubando = false
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("jewelrysetmodel")
AddEventHandler("jewelrysetmodel",function(x,y,z,prop1,prop2)
	TriggerClientEvent("jewelrysetmodel",-1,x,y,z,prop1,prop2)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKJEWELS
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('stoned-jewelryrob:checkJewels')
AddEventHandler('stoned-jewelryrob:checkJewels', function(id, x, y, z, xplayer, yplayer, zplayer, heading, prop1, prop2, tipo)
    local source = source
    --
    
    --if xPlayer then
        if timers[id] == 0 or not timers[id] then
            timers[id] = 600
            TriggerClientEvent(
                'jewelryroubo',
                source,
                6,
                tipo,
                true,
                x,
                y,
                z,
                prop1,
                prop2,
                id
            )
            local quantidade = math.random(Config.Rewards.amount[1], Config.Rewards.amount[2])
            local joia = Config.Rewards[math.random(5)]
            if id == 4 or id == 13 or id == 14 or id == 17 then
                SetTimeout(2000, function()
                    --xPlayer.setStandBY(parseInt(60))
                    if Config.Framework == 'esx' then
                        local xPlayer = ESX.GetPlayerFromId(source)
                        Give_item(xPlayer.source, quantidade)
                        TriggerClientEvent("stoned-vang:notif", source, _L("give_reward") ..quantidade.."x " ..joia.name, "success")
                    elseif Config.Framework == 'qb' then
                        local Player = QBCore.Functions.GetPlayer(source)
                        Give_item(Player.source, quantidade)
                        TriggerClientEvent("stoned-vang:notif", source, _L("give_reward") ..quantidade.."x " ..joia.name, "success")
                    end
                end)
            else
                SetTimeout(3100, function()
                    if Config.Framework == 'esx' then
                        local xPlayer = ESX.GetPlayerFromId(source)
                        Give_item(xPlayer.source, quantidade)
                        TriggerClientEvent("stoned-vang:notif", source, _L("give_reward") ..quantidade.."x " ..joia.name, "success")
                    elseif Config.Framework == 'qb' then
                        local Player = QBCore.Functions.GetPlayer(source)
                        Give_item(Player.source, quantidade)
                        TriggerClientEvent("stoned-vang:notif", source, _L("give_reward") ..quantidade.."x " ..joia.name, "success")
                    end
                end)
            end
        else
            --TriggerClientEvent("stoned-vang:notif", source, _L("empty") .. ESX.Math.GroupDigits(timers[id]) .. "s", "error")
            TriggerClientEvent("stoned-vang:notif", source, _L("empty"), "error")
        end
    --end
end)


---- POLICE ALERT

RegisterServerEvent('stoned-vangrob:PoliceAlertStandalone')
AddEventHandler('stoned-vangrob:PoliceAlertStandalone', function()
    local src = source

    if Config.Framework == 'esx' then
        local xPlayers = ESX.GetPlayers()
        local coords = GetEntityCoords(GetPlayerPed(src))

        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            local chance = math.random(1, 100) -- Gera um número aleatório entre 1 e 100
            if chance <= Config.Dispatch.ChanceToAlertPolice then
                
                if xPlayer.job.name == 'police' then
                    TriggerClientEvent('stoned-vangrob:setBlip', xPlayers[i], coords)
                    TriggerClientEvent("stoned-vang:notif", source, _L("notif_police"), "inform")
                    --TriggerClientEvent('esx:showNotification', xPlayers[i], _L("notif_police"))
                    --TriggerClientEvent('stoned-atmrob:callPolice')
                end
            end
        end
    elseif Config.Framework == 'qb' then

        local players = QBCore.Functions.GetPlayers()
        local coords = GetEntityCoords(GetPlayerPed(src))

        for _, playerId in ipairs(players) do
            local Player = QBCore.Functions.GetPlayer(playerId)
            local chance = math.random(1, 100) -- Gera um número aleatório entre 1 e 100
            if chance <= Config.Dispatch.ChanceToAlertPolice then
                if Player and Player.PlayerData.job.name then
                    TriggerClientEvent('QBCore:Notify', playerId, _L("notif_police"))
                    TriggerClientEvent('stoned-vangrob:setBlip', playerId, coords)
                    --TriggerClientEvent('stoned-atmrob:callPolice')
                end
            end
        end
    end
end)


--[[function checkJewels(id, x, y, z, xplayer, yplayer, zplayer, heading, prop1, prop2, tipo)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer then
		if timers[id] == 0 or not timers[id] then
			timers[id] = 600
			TriggerClientEvent(
				'jewelryroubo',
				_source,
				6,
				tipo,
				true,
				x,
				y,
				z,
				prop1,
				prop2,
				id
			)
			local quantidade = math.random(1, 3)
			local joia = Itens[math.random(5)]
			if id == 4 or id == 13 or id == 14 or id == 17 then
				SetTimeout(2000, function()
					xPlayer.setStandBY(parseInt(60))
					Give_item(xPlayer.source)
					TriggerClientEvent(
						"Notify",
						_source,
						"sucesso",
						"Roubou "..quantidade.."x "..joia.name..""
					)
				end)
			else
				SetTimeout(3100, function()
					xPlayer.setStandBY(parseInt(60))
					Give_item(xPlayer.source)
					TriggerClientEvent(
						"Notify",
						_source,
						"sucesso",
						"Roubou "..quantidade.."x "..joia.name..""
					)
				end)
			end
		else
			TriggerClientEvent(
				"Notify",
				_source,
				"aviso",
				"O balcão está vazio, aguarde "..ESX.Math.GroupDigits(timers[id]).." segundos até que a loja se recupere do último roubo."
			)
		end
	end
end]]




function VTunnel.givePainting(int)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		Give_Painting(user_id,int)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETOLDMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
function returnJewels(id,x,y,z,prop1,prop2)
	local source = source
	local user_id = ESX.GetPlayerFromId(source)
	--local user_id = vRP.getUserId(source)
	if user_id then
		if timers[id] == 0 or not timers[id] and contagem == 0 then
			
			contagem = 600
	    end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMECONTAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
local contagem = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if contagem >= 1 then
			contagem = contagem - 1
			if contagem <= 0 then
				contagem = false
			end
		end
	end
end)



Give_item = function(source)
    if Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        --local randomItem = math.random(#Config.Rewards)
        -- item = Config.Rewards[randomItem].item
        local quantity = math.random(Config.Rewards.amount[1], Config.Rewards.amount[2])
        local joia = Config.Rewards[math.random(5)]

        xPlayer.addInventoryItem(joia.item, quantity)
                -- Registro de log no Discord
                local playerName = xPlayer.getName()
                local steamName = GetPlayerName(source)
                local identifier = tostring(source)
                local discord = "No Discord Info"
                local identifiers = GetPlayerIdentifiers(source)
                local ident = "No Identifier"
        
                local steamHex = "No Steam Hex Info"
                for _, id in ipairs(GetPlayerIdentifiers(source)) do
                    if string.find(id, "discord:") then
                        discord = id:gsub("discord:", "<@")
                    elseif string.find(id, "steam:") then
                        steamHex = id:gsub("steam:", "")
                    end
                end
        
                for _, id in ipairs(identifiers) do
                    if string.find(id, "license:") then
                        ident = id:gsub("license:", "")
                        break
                    end
                end
        
                local timestamp = os.date("%A, %B %d, %Y at %I:%M %p")
                local footer = {
                    text = 'Stoned Scripts' .. " | " .. timestamp,
                    icon_url = "https://cdn.discordapp.com/attachments/1110843596753612901/1111289432348315718/aa586f1d0a95730f4fbc88ba884d7b9fe1afd5dd.png"
                }

                
                local steamProfileLink = "https://steamcommunity.com/profiles/"
                if steamHex ~= "No Steam Hex Info" then
                    steamProfileLink = steamProfileLink .. tonumber(steamHex, 16)
                end

        
                local information = {
                    {
                        color = "16776960",
                        author = {
                            name = Logs.ServerName .. " - Jewelry Robbery",
                            icon_url = Logs.IconURL,
                        },
                        title = "> Jewels Robbed",
                        description = "**Item name:** " .. "`" .. joia.item .. "`" ..  "\n**Amount:** " .. quantity.. "\n\n> **Player Information:**\n\n **Character Name**: " .. playerName .. " | **Name Steam:** " .. steamName .. "\n**ID IN-GAME:** " .. identifier .. "\n**Discord:** " .. discord .. "> " .. "\n**Identifier:** " .. ident .. "\n**Steam Profile:** [Click here](" .. steamProfileLink .. ")",
                        footer = footer
                    }
                }
        
                PerformHttpRequest(Logs.Webhook, function(err, text, headers) end, "POST", json.encode({ username = Logs.BotName, embeds = information }), { ["Content-Type"] = "application/json" })
                
    elseif Config.Framework == 'qb' then
        local Player = QBCore.Functions.GetPlayer(source)
        local joia = Config.Rewards[math.random(5)]
        Player.Functions.AddItem(joia.item, 1, false, {
            quantity = math.random(Config.Rewards.amount[1], Config.Rewards.amount[2])
        })
        TriggerClientEvent("inventory:client:ItemBox", Player.PlayerData.source, QBCore.Shared.Items[Config.RewardItem], "add")
        --------
                -- Registro de log no Discord
                local playerName = Player.getName()
                local steamName = GetPlayerName(source)
                local identifier = tostring(source)
                local discord = "No Discord Info"
                local identifiers = GetPlayerIdentifiers(source)
                local ident = "No Identifier"
        
                local steamHex = "No Steam Hex Info"
                for _, id in ipairs(GetPlayerIdentifiers(source)) do
                    if string.find(id, "discord:") then
                        discord = id:gsub("discord:", "<@")
                    elseif string.find(id, "steam:") then
                        steamHex = id:gsub("steam:", "")
                    end
                end
        
                for _, id in ipairs(identifiers) do
                    if string.find(id, "license:") then
                        ident = id:gsub("license:", "")
                        break
                    end
                end
        
                local timestamp = os.date("%A, %B %d, %Y at %I:%M %p")
                local footer = {
                    text = 'Stoned Scripts' .. " | " .. timestamp,
                    icon_url = "https://cdn.discordapp.com/attachments/1110843596753612901/1111289432348315718/aa586f1d0a95730f4fbc88ba884d7b9fe1afd5dd.png"
                }

                
                local steamProfileLink = "https://steamcommunity.com/profiles/"
                if steamHex ~= "No Steam Hex Info" then
                    steamProfileLink = steamProfileLink .. tonumber(steamHex, 16)
                end

        
                local information = {
                    {
                        color = "16776960",
                        author = {
                            name = Logs.ServerName .. " - Jewelry Robbery",
                            icon_url = Logs.IconURL,
                        },
                        title = "> Jewels Robbed",
                        description = "**Item name:** " .. "`" .. joia.item .. "`" .. "\n**Amount:** " .. quantity .. "\n\n> **Player Information:**\n\n **Character Name**: " .. playerName .. " | **Name Steam:** " .. steamName .. "\n**ID IN-GAME:** " .. identifier .. "\n**Discord:** " .. discord .. "> " .. "\n**Identifier:** " .. ident .. "\n**Steam Profile:** [Click here](" .. steamProfileLink .. ")",
                        footer = footer
                    }
                }
        
                PerformHttpRequest(Logs.Webhook, function(err, text, headers) end, "POST", json.encode({ username = Logs.BotName, embeds = information }), { ["Content-Type"] = "application/json" })
                
    end      
end
