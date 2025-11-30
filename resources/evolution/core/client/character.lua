local Tunnel = module("evolution", "lib/Tunnel")
local Proxy = module("evolution", "lib/Proxy")

Evolution = {}
Proxy.bindInterface("evolution", Evolution)
Tunnel.bindInterface("evolution", Evolution)

local noclipActive = false
local noclipThread = nil

function Evolution.setHealth(value)
    SetEntityHealth(PlayerPedId(), value)
end

function Evolution.setArmour(value)
    SetPedArmour(PlayerPedId(), value)
end

function Evolution.setCharacter(gender)
    if gender == "male" then
        modelHash = "mp_m_freemode_01"
    elseif gender == "female" then
        modelHash = "mp_f_freemode_01"
    else
        return
    end

    local model = GetHashKey(modelHash)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    local ped = PlayerPedId()
    SetPedDefaultComponentVariation(ped)
    SetModelAsNoLongerNeeded(model)
    SetEntityVisible(ped, true)
end

function Evolution.noClip()
    noclipActive = not noclipActive
    local ped = PlayerPedId()

    if noclipActive then
        SetEntityInvincible(ped, true)
        SetEntityVisible(ped, false, false)

        if not noclipThread then
            noclipThread = Citizen.CreateThread(function()
                while noclipActive do
                    Citizen.Wait(0)

                    local ped = PlayerPedId()
                    local x, y, z = table.unpack(GetEntityCoords(ped, true))
                    local dx, dy, dz = getCamDirection()

                    local speed = IsControlPressed(0, 21) and 6.0 or 1.5

                    SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)

                    if IsControlPressed(0, 32) then
                        x = x + speed * dx
                        y = y + speed * dy
                        z = z + speed * dz
                    end

                    if IsControlPressed(0, 269) then
                        x = x - speed * dx
                        y = y - speed * dy
                        z = z - speed * dz
                    end

                    SetEntityCoordsNoOffset(ped, x, y, z, true, true, true)
                end
                local ped = PlayerPedId()
                SetEntityInvincible(ped, false)
                SetEntityVisible(ped, true, false)
                noclipThread = nil
            end)
        end
    end
end

function getCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()

    local x = -math.sin(heading * math.pi / 180.0)
    local y = math.cos(heading * math.pi / 180.0)
    local z = math.sin(pitch * math.pi / 180.0)

    local len = math.sqrt(x * x + y * y + z * z)
    if len ~= 0 then
        x = x / len
        y = y / len
        z = z / len
    end

    return x, y, z
end
