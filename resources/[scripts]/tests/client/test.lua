local Tunnel = module("evolution", "lib/Tunnel")
local Proxy = module("evolution", "lib/Proxy")
Evolution = Proxy.getInterface("evolution")

RegisterCommand("male", function(_, args, rawCommand)
    Evolution.setCharacter(1)
end)

RegisterCommand("female", function(_, args, rawCommand)
    Evolution.setCharacter(2)
end)

RegisterCommand("nc", function(_, args, rawCommand)
    Evolution.noClip()
end)

RegisterCommand("text", function(_, args, rawCommand)
    local text2D = Evolution.create2DText("Meu Texto 2D", 0.5, 0.1, 0.4, 0, 255, 0, 255)
    local text3D = Evolution.create3DText("Texto 3D", GetEntityCoords(PlayerPedId()), 0.4, 255, 0, 0, 255)

    print("ID 2D: " .. tostring(text2D))
    print("ID 3D: " .. tostring(text3D))

    print("REMOVENDO...")
    Wait(2000)
    Evolution.removeText(text2D)
    Evolution.removeText(text3D)
end)