
## Evolution Framework FiveM

Evolution é um framework moderno, leve e altamente performático para FiveM, criado do zero para facilitar o desenvolvimento de servidores RP e não RP.
## Documentação da API

### Client-side

| Referência  | Inteface       |  Descrição                           |
| :---------- | :--------- | :---------------------------------- |
| `setCharacter("male")` | `client/server` | Altera o modelo do personagem entre Homem e Mulher (male, female) |
| `noClip()` | `client/server` | Entra ou sai do modo no-clip |
| `setHealth(value)` | `client/server` | Setar vida para o personagem |
| `setArmour(value)` | `client/server` | Setar colete para o personagem |
| `create2DText(text, x, y, scale, r, g, b, a)` | `client/server` | Criar um texto 2D |
| `create3DText(text, coords, scale, r, g, b, a)` | `client/server` | Criar um texto 3D |
| `removeText(id)` | `client/server` | Remover um texto 2D/3D especifico |
| `setVisible(state)` | `client/server` | Setar o personagem como visivel/invisivel (true, false) |
| `freezeChar(state)` | `client/server` | Fixar o personagem na coordenada atual (true, false) |
| `giveWeapon(hash, ammo)` | `client/server` | Setar armamento para o personagem |
| `removeWeapon(hash)` | `client/server` | Remover armamento especifico do personagem |
| `removeAllWeapons()` | `client/server` | Remover todos armamentos do personagem |

## Exemplo de uso

```lua
local Tunnel = module("evolution", "lib/Tunnel")
local Proxy = module("evolution", "lib/Proxy")
Evolution = Proxy.getInterface("evolution")

RegisterCommand("teste", function(_, args, rawCommand)
    Evolution.setCharacter("male")
end)

RegisterCommand("nc", function(_, args, rawCommand)
    Evolution.noClip()
end)

RegisterCommand("text", function(_, args, rawCommand)
    local text2D = Evolution.create2DText("Meu Texto", 0.5, 0.1, 0.4, 0, 255, 0, 255)
    local text3D = Evolution.create3DText("Texto 3D", GetEntityCoords(PlayerPedId()), 0.4, 255, 0, 0, 255)

    print("ID 2D: " .. tostring(text2D))
    print("ID 3D: " .. tostring(text3D))

    print("REMOVENDO...")
    Wait(2000)
    Evolution.removeText(text2D)
    Evolution.removeText(text3D)
end)
```

## Colaboradores

- [@DeeX](https://www.github.com/dxofc)

- [@Erick](https://github.com/erick-sx)

## Licença

[MIT](https://choosealicense.com/licenses/mit/)

