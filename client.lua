-----------------------------------
--- Advanced 911, Made by FAXES ---
-----------------------------------

--- CONFIG ---
local leoPeds = {
    "s_m_y_cop_01",
}

local fdPeds = {
    "s_m_y_fireman_01",
    "s_m_m_paramedic_01",
}

---------------------------------------------------------------------------------
RegisterNetEvent('Fax:SendCall')
AddEventHandler('Fax:SendCall', function(service, desc, callid)
    local ped = GetPlayerPed(PlayerId())

	if service == "pd" then
		if checkPed(ped, leoPeds) then
			TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid)
		end
	elseif service == "fd" then
		if checkPed(ped, fdPeds) then
			TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid)
		end
	elseif service == "ems" then
		if checkPed(ped, fdPeds) then
			TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid)
        end
    end
end)

function checkPed(ped, PedList)
	for i = 1, #PedList do
		if GetHashKey(PedList[i]) == GetEntityModel(ped) then
			return true
		end
	end
	return false
end