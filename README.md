
## Evolution Framework FiveM

Evolution é um framework moderno, leve e altamente performático para FiveM, criado do zero para facilitar o desenvolvimento de servidores RP e não RP.
## Documentação da API

### Client-side

| Referência  | Inteface       |  Descrição                           |
| :---------- | :--------- | :---------------------------------- |
| `setCharacter(1)` | `client/server` | Altera o modelo do personagem entre Homem e Mulher (1, 2) |
| `noClip()` | `client/server` | Ativar/Desativar modo no-clip |
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
```

## Colaboradores

- [@DeeX](https://www.github.com/dxofc)

- [@Erick](https://github.com/erick-sx)

## Licença

MIT License

Copyright (c) 2025 Evolution Group

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.