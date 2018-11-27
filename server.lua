-----------------------------------
--- Advanced 911, Made by FAXES ---
-----------------------------------

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
            TriggerClientEvent("chatMessage", source, "^4911 Call Sent to " .. service .. ".")
        end

    elseif service == "fd" then
        if desc == nil then
            TriggerClientEvent("chatMessage", source, "^1Please specify a call description.")
        else
            callid = s
            TriggerClientEvent("Fax:SendCall", s, service, desc, callid)
            TriggerClientEvent("chatMessage", source, "^4911 Call Sent to " .. service .. ".")
        end

    elseif service == "ems" then
        if desc == nil then
            TriggerClientEvent("chatMessage", source, "^1Please specify a call description.")
        else
            callid = s
            TriggerClientEvent("Fax:SendCall", s, service, desc, callid)
            TriggerClientEvent("chatMessage", source, "^4911 Call Sent to " .. service .. ".")
        end

    else
        TriggerClientEvent("chatMessage", source, "^1Please specify a service. Eg; pd, fd, ems")
    end
end)

RegisterServerEvent("Fax:SendCallToTeam")
AddEventHandler("Fax:SendCallToTeam", function(service, desc, callid)
    local s = source

    if service == "pd" then
			TriggerClientEvent("chatMessage", s, "^4911 Call [ID:" .. callid .. "] " .. desc)
	elseif service == "fd" then
			TriggerClientEvent("chatMessage", s, "^4911 Call [ID:" .. callid .. "] " .. desc)
	elseif service == "ems" then
			TriggerClientEvent("chatMessage", s, "^4911 Call [ID:" .. callid .. "] " .. desc)
	end
end)