local Tunnel = module("evolution", "lib/Tunnel")
local Proxy = module("evolution", "lib/Proxy")
Evolution = Proxy.getInterface("evolution")

RegisterCommand("teste", function(_, args, rawCommand)
    Evolution.setCharacter("male")
end)

-- Client = {}
-- Tunnel.bindInterface("teste", Client)

-- function Client.teste()
--     print("^2[SUCESSO] Servidor chamou a função no cliente!^7")
-- end
