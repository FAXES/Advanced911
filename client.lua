-----------------------------------------------------
--- Advanced 911, Made by FAXES modified by Lenzh ---
-----------------------------------------------------

--- CONFIG ---
ESX                              = nil
local PlayerData        = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

---------------------------------------------------------------------------------
RegisterNetEvent('Fax:SendCall')
AddEventHandler('Fax:SendCall', function(service, desc, callid)
    local ped = GetPlayerPed(PlayerId())

	if service == "pd" then
		if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
			TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid)
		end
	 elseif service == "ems" then
		if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
			TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid)
        end
    elseif service == "all" then
		if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' or PlayerData.job ~= nil and PlayerData.job.name == 'police' then
			TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid)
        end
    end
end)
