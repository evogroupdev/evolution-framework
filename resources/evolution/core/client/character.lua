local Tunnel = module("evolution", "lib/Tunnel")
local Proxy = module("evolution", "lib/Proxy")

Evolution = {}
Proxy.bindInterface("evolution", Evolution)
Tunnel.bindInterface("evolution", Evolution)

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
