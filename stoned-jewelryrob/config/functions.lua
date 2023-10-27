
--███╗░░██╗░█████╗░████████╗██╗███████╗██╗░█████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗
--████╗░██║██╔══██╗╚══██╔══╝██║██╔════╝██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
--██╔██╗██║██║░░██║░░░██║░░░██║█████╗░░██║██║░░╚═╝███████║░░░██║░░░██║██║░░██║██╔██╗██║
--██║╚████║██║░░██║░░░██║░░░██║██╔══╝░░██║██║░░██╗██╔══██║░░░██║░░░██║██║░░██║██║╚████║
--██║░╚███║╚█████╔╝░░░██║░░░██║██║░░░░░██║╚█████╔╝██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║
--╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝

function SendTextMessagee(msg, type)
    if type == 'inform' then
        TriggerEvent('codem-notification:Create', msg, 'info', _L('jewelry_robbery'), 7000)
		--exports['Roda_Notifications']:showNotify(msg, 'info', 5000)
		--exports['okokNotify']:Alert("Craft", msg, 5000, 'info')
		--exports['mythic_notify']:SendAlert('inform', msg)
		--QBCore.Functions.Notify(msg, 'info')
    end
    if type == 'error' then
        TriggerEvent('codem-notification:Create', msg, 'error',  _L('jewelry_robbery'), 7000)
		--exports['Roda_Notifications']:showNotify(msg, 'error', 5000)
		--exports['okokNotify']:Alert("Craft", msg, 5000, 'error')
		--exports['mythic_notify']:SendAlert('error', msg)
		--QBCore.Functions.Notify(msg, 'error')
    end
    if type == 'success' then
        TriggerEvent('codem-notification:Create', msg, 'success',  _L('jewelry_robbery'), 7000)
		--exports['Roda_Notifications']:showNotify(msg, 'success', 5000)
		--exports['okokNotify']:Alert("Craft", msg, 5000, 'success')
		--exports['mythic_notify']:SendAlert('success', msg)
		--QBCore.Functions.Notify(msg, 'success')
    end
end

--██████╗ ██╗     ██╗██████╗ ███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ █████╗ ██╗     ██╗     ███████╗██╗ ██████╗ ███╗   ██╗
--██╔══██╗██║     ██║██╔══██╗██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔══██╗██║     ██║     ██╔════╝██║██╔════╝ ████╗  ██║
--██████╔╝██║     ██║██████╔╝███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ███████║██║     ██║     ███████╗██║██║  ███╗██╔██╗ ██║
--██╔══██╗██║     ██║██╔═══╝ ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██╔══██║██║     ██║     ╚════██║██║██║   ██║██║╚██╗██║
--██████╔╝███████╗██║██║     ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗██║  ██║███████╗███████╗███████║██║╚██████╔╝██║ ╚████║
--╚═════╝ ╚══════╝╚═╝╚═╝     ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝      

function PoliceCall()
	if Config.Dispatch.Type == 'standalone' then
		TriggerServerEvent('stoned-vangrob:PoliceAlertStandalone')
	elseif Config.Dispatch.Type == 'linden_alerts' then
		TriggerServerEvent('stoned-vangrob:server:PoliceAlertMessage') 
	elseif Config.Dispatch.Type == 'qb_defaultalert' then
    	TriggerServerEvent('police:server:policeAlert', 'Attempted Jewelry Robbery')
    elseif Config.Dispatch.Type == 'cd_dispatch' then
		local data = exports['cd_dispatch']:GetPlayerInfo()
		TriggerServerEvent('cd_dispatch:AddNotification', {
			job_table = {'police', "sheriff" }, 
			coords = data.coords,
			title = '10-15 - Jewelry Robbery',
			message = 'A '..data.sex..' Robbing Jewelry at '..data.street, 
			flash = 0,
			unique_id = data.unique_id,
			sound = 1,
			blip = {
				sprite = Config.Dispatch.BlipSprite, 
				scale = Config.Dispatch.BlipScale, 
				colour = Config.Dispatch.BlipColor,
				flashes = false, 
				text = '911 - Jewelry Robbery',
				time = 5,
				radius = 0,
			}
		})
	end
end
