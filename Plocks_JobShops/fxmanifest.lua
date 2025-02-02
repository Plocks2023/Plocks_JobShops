-- Resource Metadata
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

lua54 'yes'

author 'itsplocks'
description 'Fivem ESX Job Shops Script'
version '1.0'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    '@oxmysql/lib/MySQL.lua',
    'shared/config.lua',
}

-- What to run
client_scripts {
    'client/main.lua',
    'client/npc.lua',
    'client/functions.lua',
}

server_script {
    'server/main.lua',
    'server/functions.lua',
}

dependencies {
    'es_extended',
    'esx_menu_default',
}

