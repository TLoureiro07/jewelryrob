fx_version 'cerulean'
game 'gta5'

author 'Loureiro#0111'

description 'Jewelty Robbery - Stoned Scripts'

version '1.1'

shared_scripts {
    'config/config.lua',
	'config/functions.lua',
	'locales/locale.lua',
    'locales/translations/*.lua'
}

server_scripts {
	'server/server.lua',
	'config/svconfig.lua'
}

client_scripts {
	'client/client.lua'
}

escrow_ignore {
    'config/config.lua',
	'config/functions.lua',
    'locales/translations/*.lua'
}

lua54 'yes'
