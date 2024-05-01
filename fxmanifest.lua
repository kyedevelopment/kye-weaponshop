fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kye.Dev | discord.gg/kye'

client_scripts {
    'main.lua',
    'config.lua',
}
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}
server_scripts {
    'server.lua',
    'config.lua',
}

shared_script '@es_extended/imports.lua'

escrow_ignore 'config.lua'

dependencies '@ox_lib'