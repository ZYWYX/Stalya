fx_version 'cerulean'
game 'gta5'

ui_page 'client/radio/index.html'

files {
	"client/radio/index.html",
	"client/radio/on.ogg",
	"client/radio/off.ogg",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "utils/*.lua",
    "data/Constants.lua",
    "data/item/*.lua",
    "data/*.lua",
    "events/*.lua",
    "gcphone/*.lua",
    "OnResourceStart.lua"
}

dependencies {
	"mumble-voip",
}

client_scripts {
    "client/*.lua",
    "client/radio/*.lua"
}