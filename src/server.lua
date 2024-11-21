-- Event to handle clothing request from the client
RegisterNetEvent("ND_Characters:requestClothing", function()
    local src = source
    local player = NDCore.getPlayer(src)

    if not player then
        print("Player not found.")
        return
    end

    -- Get clothing data from player
    local clothing = player.getData("clothing")
    if not clothing or type(clothing) ~= "table" then
        print("No clothing data found for player.")
        return
    end

    -- Send the clothing data back to the client
    TriggerClientEvent("ND_Characters:sendClothing", src, clothing)
end)
