-----------------------------------------------------
--- Advanced 911, Made by FAXES modified by Lenzh ---
-----------------------------------------------------
RegisterCommand("911", function(source, args, rawCommand)
    local service = args[1]
    local desc = table.concat(args, " ", 2)
    local s = source

    if service == "pd" then
        if desc == nil then
            TriggerClientEvent("chatMessage", source, "^1Please specify a call description.")
        else
            callid = s
            TriggerClientEvent("Fax:SendCall", -1, service, desc, callid)
            TriggerClientEvent("chatMessage", source, "^1911 Call Sent to " .. service .. ".")
        end

    elseif service == "ems" then
        if desc == nil then
            TriggerClientEvent("chatMessage", source, "^1Please specify a call description.")
        else
            callid = s
            TriggerClientEvent("Fax:SendCall", s, service, desc, callid)
            TriggerClientEvent("chatMessage", source, "^1911 Call Sent to " .. service .. ".")
        end

    elseif service == "all" then
        if desc == nil then
            TriggerClientEvent("chatMessage", source, "^1Please specify a call description.")
        else
            callid = s
            TriggerClientEvent("Fax:SendCall", s, service, desc, callid)
            TriggerClientEvent("chatMessage", source, "^1911 Call Sent to " .. service .. ".")
        end

    else
        TriggerClientEvent("chatMessage", source, "^5Please specify a service. Eg; pd, ems, all")
    end
end)


RegisterServerEvent("Fax:SendCallToTeam")

AddEventHandler("Fax:SendCallToTeam", function(service, desc, callid)

	local s = source
	local coords = GetEntityCoords(Playerid(GetPlayerFromServerId(s)))
	local street1 = GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
	local streetName = (GetStreetNameFromHashKey(street1))



	if service == "pd" then

			TriggerClientEvent("chatMessage", s, "^1911 Call [ID:" .. callid .. "]^3 [LOCATION:" ..streetName.. " ^4" .. desc)

		elseif service == "ems" then

			TriggerClientEvent("chatMessage", s, "^1911 Call [ID:" .. callid .. "]^3 [LOCATION:" ..streetName.. " ^4 " .. desc)

        elseif service == "all" then

			TriggerClientEvent("chatMessage", s, "^1911 Call [ID:" .. callid .. "]^3 [LOCATION:" ..streetName.. " ^4" .. desc)

	end

end)
