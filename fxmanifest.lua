fx_version 'cerulean'
game 'gta5'

author 'Stoic'
description 'Character clothing sync using five-appearance and ND Framework'
version '1.0.0'

-- Configuration files
shared_scripts {
    'config.lua' -- Config file to manage debug settings
}

-- Client-side scripts
client_scripts {
    'client.lua'
}

-- Server-side scripts
server_scripts {
    'server.lua'
}

-- Dependencies
dependencies {
    'five-appearance', -- Ensures the five-appearance resource is running
    'ND_Core'     -- Ensures ND Framework is available
}
