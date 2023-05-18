-----------------------------------
--- Advanced 911, Made by FAXES ---
-----------------------------------

function servicesString()
  local serviceString = ""
  for i, team in ipairs(teams) do
    local serviceName = team[1]
    if i == 1 then
      serviceString = serviceName
    else
      serviceString = serviceString .. ", " .. serviceName
    end
  end
  return serviceString
end

local servicesString = servicesString()

RegisterCommand("911", function(source, args, rawCommand)
    local service = args[1]
    local desc = table.concat(args, " ", 2)
    local s = source
    for i, team in ipairs(teams) do
      local serviceName = team[1]
      if service == serviceName then
        if desc == nil then
          TriggerClientEvent("chatMessage", source, "^1Please specify a call description.")
        else
          local callid = s
          local x, y, z = table.unpack(GetEntityCoords(vehicle, false))
          local streetName, crossing = GetStreetNameAtCoord(x, y, z)
          streetName = GetStreetNameFromHashKey(streetName)
          crossing = GetStreetNameFromHashKey(crossing)
          local location = ""
          if crossing ~= "" then
            location = streetName .. " / " .. crossing
          else
            location = streetName
          end
          TriggerClientEvent("Fax:SendCall", -1, service, desc, callid, location)
          TriggerClientEvent("chatMessage", source, "^4911 Call Sent to " .. service .. ".")
          return
        end
      end
    end
    TriggerClientEvent("chatMessage", source, "^1Please specify a service. Eg; " .. servicesString .. ".")
end)

RegisterServerEvent("Fax:SendCallToTeam")
AddEventHandler("Fax:SendCallToTeam", function(desc, callid, location)
    local s = source
    TriggerClientEvent("chatMessage", s, "^4911 Call [ID:" .. callid .. "][LOC: " .. location .. "] " .. desc)
end)
