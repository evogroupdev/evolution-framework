local Tunnel = module("evolution", "lib/Tunnel")

Evolution = Tunnel.getInterface("evolution")

RegisterCommand("testee", function(source, args, rawCommand)
    Evolution.setCharacter(source, "male")
end)
