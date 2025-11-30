local Tunnel = module("evolution", "lib/Tunnel")
local Proxy = module("evolution", "lib/Proxy")

Evolution = {}
Proxy.bindInterface("evolution", Evolution)
Tunnel.bindInterface("evolution", Evolution)

local activeTexts = {}


function Evolution.create2DText(text, x, y, scale, r, g, b, a)
    scale = scale or 0.35
    r = r or 255
    g = g or 255
    b = b or 255
    a = a or 255

    local id = #activeTexts + 1
    activeTexts[id] = { type = "2d", text = text, x = x, y = y, scale = scale, r = r, g = g, b = b, a = a }
    return id
end

function Evolution.create3DText(text, coords, scale, r, g, b, a)
    scale = scale or 0.35
    r = r or 255
    g = g or 255
    b = b or 255
    a = a or 255

    local id = #activeTexts + 1
    activeTexts[id] = { type = "3d", text = text, coords = coords, scale = scale, r = r, g = g, b = b, a = a }
    return id
end

function Evolution.removeText(id)
    if id and activeTexts[id] then
        activeTexts[id] = nil
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for id, data in pairs(activeTexts) do
            if data then
                if data.type == "2d" then
                    DrawText2D(data.text, data.x, data.y, data.scale, data.r, data.g, data.b, data.a)
                elseif data.type == "3d" then
                    local x, y, z = table.unpack(data.coords)
                    local onScreen, sx, sy = World3dToScreen2d(x, y, z)
                    if onScreen then
                        DrawText2D(data.text, sx, sy, data.scale, data.r, data.g, data.b, data.a)
                    end
                end
            end
        end
    end
end)

function DrawText2D(text, x, y, scale, r, g, b, a)
    SetTextFont(4)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextOutline()
    SetTextCentre(false)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end
