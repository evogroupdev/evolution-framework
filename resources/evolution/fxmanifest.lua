fx_version "cerulean"
game "gta5"

resource_type "map" { gameTypes = { ["basic-gamemode"] = true } }
map "session/map.lua"

client_script {
    "lib/utils.lua",
    "utils/mapClean.lua",
    "core/client/*",
    "session/fivem/client.lua",
    "session/spawnmanager/client.lua",
    "session/mapmanager/client.lua",
    "session/mapmanager/shared.lua"
}

server_script {
    "lib/utils.lua",
    "core/server/*",
    "session/sessionmanager/server.lua",
    "session/mapmanager/server.lua",
    "session/mapmanager/shared.lua"
}


files {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    "lib/Tools.lua"
}
