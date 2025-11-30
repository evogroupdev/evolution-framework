local Tunnel = module("evolution", "lib/Tunnel")

Evolution = Tunnel.getInterface("evolution")

RegisterCommand("testee", function(source, args, rawCommand)
    Evolution.setCharacter(source, "male")
end)

-- Client = Tunnel.getInterface("teste") -- mesmo nome!

-- RegisterCommand("teste", function(source, args, rawCommand)
--     if source == 0 then
--         print("Comando só pode ser usado por jogador!")
--         return
--     end

--     print("Chamando função no cliente do player " .. source)
--     Client.teste(source) -- ← source obrigatório aqui
-- end)
