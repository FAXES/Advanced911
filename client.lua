-----------------------------------
--- Advanced 911, Made by FAXES ---
-----------------------------------

RegisterNetEvent("Fax:SendCall")
AddEventHandler("Fax:SendCall", function(service, desc, callid)
  local ped = GetPlayerPed(PlayerId())
  for i, team in ipairs(teams) do
    local pedList = team[2]
    if checkPed(ped, pedList) then
      return TriggerServerEvent("Fax:SendCallToTeam", desc, callid)
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
