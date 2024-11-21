-- Debug function
local function debugPrint(message, data)
    if Config.debug then
        print(message)
        if data then
            print(json.encode(data, { indent = true }))
        end
    end
end

-- Event to handle clothing request from the client
RegisterNetEvent("ND_Characters:requestClothing", function()
    local src = source
    debugPrint("Event Triggered: ND_Characters:requestClothing", { source = src })

    local player = NDCore.getPlayer(src)
    if not player then
        debugPrint("Error: Player not found.", { source = src })
        return
    end

    debugPrint("Player Data Retrieved", { player = player })

    -- Get clothing data from player
    local clothing = player.getData("clothing")
    debugPrint("Retrieved Clothing Data", clothing)

    if not clothing or type(clothing) ~= "table" then
        debugPrint("Error: No valid clothing data found for player.", { playerId = src })
        return
    end

    -- Send the clothing data back to the client
    TriggerClientEvent("ND_Characters:sendClothing", src, clothing)
    debugPrint("Event Triggered: ND_Characters:sendClothing", clothing)
end)
