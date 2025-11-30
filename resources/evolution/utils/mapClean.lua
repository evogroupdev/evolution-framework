--- CLASSE RESPONSAVEL POR DESATIVAR NATIVOS INUTILIZÁVEL EM RP

local DisableDispatch = true
local scenarios = {
    "WORLD_VEHICLE_ATTRACTOR",
    "WORLD_VEHICLE_AMBULANCE",
    "WORLD_VEHICLE_BICYCLE_BMX",
    "WORLD_VEHICLE_BICYCLE_BMX_BALLAS",
    "WORLD_VEHICLE_BICYCLE_BMX_FAMILY",
    "WORLD_VEHICLE_BICYCLE_BMX_HARMONY",
    "WORLD_VEHICLE_BICYCLE_BMX_VAGOS",
    "WORLD_VEHICLE_BICYCLE_MOUNTAIN",
    "WORLD_VEHICLE_BICYCLE_ROAD",
    "WORLD_VEHICLE_BIKE_OFF_ROAD_RACE",
    "WORLD_VEHICLE_BIKER",
    "WORLD_VEHICLE_BOAT_IDLE",
    "WORLD_VEHICLE_BOAT_IDLE_ALAMO",
    "WORLD_VEHICLE_BOAT_IDLE_MARQUIS",
    "WORLD_VEHICLE_BOAT_IDLE_MARQUIS",
    "WORLD_VEHICLE_BROKEN_DOWN",
    "WORLD_VEHICLE_BUSINESSMEN",
    "WORLD_VEHICLE_HELI_LIFEGUARD",
    "WORLD_VEHICLE_CLUCKIN_BELL_TRAILER",
    "WORLD_VEHICLE_CONSTRUCTION_SOLO",
    "WORLD_VEHICLE_CONSTRUCTION_PASSENGERS",
    "WORLD_VEHICLE_DRIVE_PASSENGERS",
    "WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED",
    "WORLD_VEHICLE_DRIVE_SOLO",
    "WORLD_VEHICLE_FARM_WORKER",
    "WORLD_VEHICLE_FIRE_TRUCK",
    "WORLD_VEHICLE_EMPTY",
    "WORLD_VEHICLE_MARIACHI",
    "WORLD_VEHICLE_MECHANIC",
    "WORLD_VEHICLE_MILITARY_PLANES_BIG",
    "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
    "WORLD_VEHICLE_PARK_PARALLEL",
    "WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN",
    "WORLD_VEHICLE_PASSENGER_EXIT",
    "WORLD_VEHICLE_POLICE_BIKE",
    "WORLD_VEHICLE_POLICE_CAR",
    "WORLD_VEHICLE_POLICE",
    "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
    "WORLD_VEHICLE_QUARRY",
    "WORLD_VEHICLE_SALTON",
    "WORLD_VEHICLE_SALTON_DIRT_BIKE",
    "WORLD_VEHICLE_SECURITY_CAR",
    "WORLD_VEHICLE_STREETRACE",
    "WORLD_VEHICLE_TOURBUS",
    "WORLD_VEHICLE_TOURIST",
    "WORLD_VEHICLE_TANDL",
    "WORLD_VEHICLE_TRACTOR",
    "WORLD_VEHICLE_TRACTOR_BEACH",
    "WORLD_VEHICLE_TRUCK_LOGS",
    "WORLD_VEHICLE_TRUCKS_TRAILERS",
    "WORLD_VEHICLE_DISTANT_EMPTY_GROUND"
}

-- Desativar elementos do áudio e NPCs
Citizen.CreateThread(function()
    local ped = PlayerPedId()

    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")

    SetFlyThroughWindscreenParams(25.0, 2.0, 15.0, 15.0)
    SetAudioFlag("PoliceScannerDisabled", true)
    DistantCopCarSirens(false)
    SetPlayerCanUseCover(PlayerId(), false)
    ExtendWorldBoundaryForPlayer(9999999.0, 9999999.0, 9999999.0)

    DisableIdleCamera(true)            -- Desativa câmera AFK
    ClearTimecycleModifier()           -- Remove filtro visual
    SetTransitionTimecycleModifier("") -- Remove transição de filtro
    ClearExtraTimecycleModifier()      -- Remove efeitos visuais extra
    StopGameplayCamShaking(true)       -- Para tremores de câmera
    StopGameplayHint()                 -- Para dicas visuais
    SetGarbageTrucks(false)            -- Para caminhões de lixo
    SetRandomBoats(false)              -- Para barcos aleatórios
    SetPedMoveRateOverride(ped, 1.0)   -- Garante movimento fluido
    SetPedResetFlag(ped, 240, true)    -- Força reset de estado
    SetCreateRandomCops(false)
    SetCreateRandomCopsNotOnScenarios(false)
    SetCreateRandomCopsOnScenarios(false)

    -- CLIMA E AMBIENTE
    ClearOverrideWeather()          -- Remove clima forçado
    ClearWeatherTypePersist()       -- Remove clima persistente
    SetWindSpeed(0.0)               -- Remove vento
    SetWind(0.0)                    -- Remove vento ativo
    SetCloudHatOpacity(0.0)         -- Remove nuvens visuais
    ClearFocus()                    -- Remove foco de câmera forçado
    ClearHdArea()                   -- Libera memória HD
    SetArtificialLightsState(false) -- Remove luzes artificiais forçadas

    -- FINALIZAÇÃO
    DisableScreenblurFade() -- Remove desfoque de tela

    -- Desativa NPC e NPBS BUGADOS
    SetAllVehicleGeneratorsActive(false)
    SetPedPopulationBudget(0)

    for i, v in ipairs(scenarios) do
        SetScenarioTypeEnabled(v, false)
    end

    -- Desativa o serviço de despacho (polícia, bombeiros, etc.)
    if DisableDispatch then
        for i = 1, 12 do
            EnableDispatchService(i, false)
        end
    end
end)

-- Configuração do HUD (desativação única)
local HUD_ELEMENTS = {
    HUD_WANTED_STARS = 1,          -- Estrelas de procurado
    HUD_WEAPON_ICON = 2,           -- Ícone da arma
    HUD_CASH = 3,                  -- Dinheiro do modo single-player
    HUD_MP_CASH = 4,               -- Dinheiro do modo multiplayer
    HUD_MP_MESSAGE = 5,            -- Mensagens do modo multiplayer
    HUD_VEHICLE_NAME = 6,          -- Nome do veículo ao entrar
    HUD_AREA_NAME = 7,             -- Nome da área (ex: Los Santos)
    HUD_VEHICLE_CLASS = 8,         -- Classe do veículo
    HUD_STREET_NAME = 9,           -- Nome da rua
    HUD_HELP_TEXT = 10,            -- Texto de ajuda
    HUD_FLOATING_HELP_TEXT_1 = 11, -- Texto flutuante de ajuda 1
    HUD_FLOATING_HELP_TEXT_2 = 12, -- Texto flutuante de ajuda 2
    HUD_CASH_CHANGE = 13,          -- Alterações no dinheiro
    HUD_SUBTITLE_TEXT = 15,        -- Legendas de NPCs e rádio
    HUD_RADIO_STATIONS = 16,       -- Ícone de estações de rádio
    HUD_SAVING_GAME = 17,          -- Ícone de salvamento do jogo
    HUD_GAME_STREAM = 18,          -- Streaming do jogo (SP)
    HUD_WEAPON_WHEEL_STATS = 20,   -- Estatísticas da arma na roda de armas
    MAX_HUD_COMPONENTS = 21,
    MAX_HUD_WEAPONS = 22,
    MAX_SCRIPTED_HUD_COMPONENTS = 141,

    -- **Extras**
    HUD_AMMO_DISPLAY = 24,  -- Exibição de munição (se já for feito por outro script)
    HUD_RELOAD_PROMPT = 28, -- Sugestão de recarga
    HUD_RADIO_TRACK = 35,   -- Nome da música no rádio
    HUD_DRUNK_EFFECT = 36,  -- Efeito de embriaguez
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetRadarZoomLevelThisFrame(200.0)
        CancelCurrentPoliceReport() -- Cancela rádio policial
        DisablePoliceReports()      -- Impede relatórios policiais
        SetPlayerWantedLevel(PlayerId(), 0, false)
        SetPlayerWantedLevelNow(PlayerId(), false)
        SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)

        for _, id in pairs(HUD_ELEMENTS) do
            HideHudComponentThisFrame(id)
        end
    end
end)
