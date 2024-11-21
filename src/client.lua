-- Debug function
local function debugPrint(message, data)
    if Config.debug then
        print(message)
        if data then
            print(json.encode(data, { indent = true }))
        end
    end
end

-- Listen for the ND:characterLoaded event
AddEventHandler("ND:characterLoaded", function(character)
    debugPrint("Event Triggered: ND:characterLoaded", character)

    -- Trigger a server-side event to get the clothing data
    TriggerServerEvent("ND_Characters:requestClothing")
end)

-- Receive the clothing data from the server
RegisterNetEvent("ND_Characters:sendClothing", function(clothing)
    debugPrint("Event Received: ND_Characters:sendClothing", clothing)

    if not clothing or type(clothing) ~= "table" then
        debugPrint("Error: Invalid clothing data received.")
        return
    end

    -- Get the local player ped
    local ped = PlayerPedId()
    debugPrint("Local Player Ped ID", { ped = ped })

    -- Apply the clothing using five-appearance exports
    if clothing.components then
        debugPrint("Applying Components", clothing.components)
        exports["five-appearance"]:setPedComponents(ped, clothing.components)
    end
    if clothing.props then
        debugPrint("Applying Props", clothing.props)
        exports["five-appearance"]:setPedProps(ped, clothing.props)
    end

    debugPrint("Clothing applied successfully.")
end)
