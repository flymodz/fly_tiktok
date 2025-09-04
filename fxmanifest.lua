fx_version 'cerulean'
game 'gta5'
lua54 'true'

author 'flymodz'
description 'flymodz ontop'

escrow_ignore {
    "config.lua"
}

shared_scripts {
    '@es_extended/imports.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

requires {
    'es_extended',
    'oxmysql'
}

-- BEI FEHLER AUF DISCORD MELDEN. USER: flymodzreal