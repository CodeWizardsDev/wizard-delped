local loop = false
local breakloop = false
local confcommand = Config.Command or "deletepeds"
local confpermission = Config.Permission or "group.god"
local confpermission2 = Config.PermissionAllowed or false
local confpermission3 = confpermission2 and IsPlayerAceAllowed(source, confpermission) or true
local confcooldown = Config.CoolDown or false
local confcooldown2 = confcooldown and Config.CoolDownTime or 10
local confdistance = Config.Distance or 100.0
local confretry = Config.Retry or 3

local deadonly = Config.DeadOnly == true
local delwalking = Config.DelWalking == true
local deldriver = Config.DelDriver == true
local breaknotif = false
local cooldowns = {}

local function Notify(text, notiftype)
    if not breaknotif then
        if Config.Notify == 'StandAlone' then
            SetNotificationTextEntry("STRING")
            AddTextComponentString(text)
            DrawNotification(false, false)
        elseif Config.Notify == 'QBCore' then
            local QBCore = exports['qb-core']:GetCoreObject()
            QBCore.Functions.Notify(text, notiftype)
        elseif Config.Notify == 'Esx' then
            TriggerClientEvent('esx:showNotification', source, text, notiftype, 5000)
        elseif Config.Notify == 'OkOk' then
            exports['okokNotify']:Alert('Wizard DelPed', text, 5000, notiftype, true)
        elseif Config.Notify == 'Ox' then
            lib.notify({
                title = 'Wizard DelPed',
                description = text,
                type = notiftype
            })
        else
            print('^1ERROR: Your Notification System is Not Supported')
        end

        breaknotif = true
    end
end

local function GetNearbyPeds(position, distance)
    local nearbyPeds = {}
    local allPeds = GetGamePool("CPed")

    for _, ped in ipairs(allPeds) do
        if ped ~= PlayerPedId() then
            local pedPos = GetEntityCoords(ped)
            local dist = #(position - pedPos)

            if dist <= distance then
                table.insert(nearbyPeds, ped)
            end
        end
    end

    return nearbyPeds
end

local function DeleteNearestPed(ped, timeoutMax)
    local timeout = 0
    SetEntityAsMissionEntity(ped, true, true)
    DeletePed(ped)

    if DoesEntityExist(ped) then
        Notify(Lang.Retry, 'error')

        while (DoesEntityExist(ped) and timeout < timeoutMax) do
            DeletePed(ped)

            if not DoesEntityExist(ped) then
                Notify(Lang.Deleted, 'success')
            end

            timeout = timeout + 1
            Citizen.Wait(500)

            if DoesEntityExist(ped) and (timeout == timeoutMax - 1) then
                Notify(Lang.Failed, 'error')
            end
        end
    else
        Notify(Lang.Deleted, 'success')
    end
end

local function Delete(dis2)
    local playerPed = GetPlayerPed(-1)

    if DoesEntityExist(playerPed) and IsPedOnFoot(playerPed) then
        local pos = GetEntityCoords(playerPed)
        local nearbyPeds = GetNearbyPeds(pos, dis2)

        for _, ped in ipairs(nearbyPeds) do
            if deadonly then
                if IsPedDeadOrDying(ped) then
                    DeleteNearestPed(ped, confretry)
                end
            else
                if delwalking then
                    if IsPedOnFoot(ped) then
                        DeleteNearestPed(ped, confretry)
                    end
                elseif deldriver then
                    if IsPedInAnyVehicle(ped, true) then
                        DeleteNearestPed(ped, confretry)
                    end
                end
            end
        end

        loop = false
    end
end

local function GetPedInDirection(entFrom, coordFrom, coordTo)
    local rayHandle = StartShapeTestCapsule(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7)
    local _, _, _, _, ped = GetShapeTestResult(rayHandle)

    if IsEntityAPed(ped) then
        return ped
    end
end


local function DoLoop(dis)
    Citizen.CreateThread(function()
        while loop do
            Delete(dis)
            Citizen.Wait(1)
        end
    end)
end

function DeletePeds(exporttries, exportdis, exporttype, pos)
    if exporttries == 'none' then exporttries = confretry end
    if exportdis == 'none' then exportdis = confdistance end
    if exporttype == 'none' then if deadonly then exporttype = 'dead' elseif not deadonly and delwalking then exporttype = 'walking' elseif not deadonly and deldriver then exporttype = 'driving' elseif not deadonly and not delwalking and not deldriving then exporttype = 'all' end end
    if pos then playerPed = GetPlayerPed(-1) pos = GetEntityCoords(playerPed) end
    Citizen.CreateThread(function()

        local nearbyPeds = GetNearbyPeds(pos, exportdis)

        for _, ped in ipairs(nearbyPeds) do
            if exporttype == 'dead' then
                if IsPedDeadOrDying(ped) then
                    DeleteNearestPed(ped, exporttries)
                end
            elseif exporttype == 'all' then
                DeleteNearestPed(ped, exporttries)
            elseif exporttype == 'walking' then
                if IsPedOnFoot(ped) then
                    DeleteNearestPed(ped, exporttries)
                end
            elseif exporttype == 'driving' then
                if IsPedInAnyVehicle(ped) then
                    DeleteNearestPed(ped, exporttries)
                end
            end
        end
    end)
end

RegisterNetEvent('wizard-delped:DeletePeds')
AddEventHandler('wizard-delped:DeletePeds', function(exporttries, exportdis, exporttype, pos)
	DeletePeds(exporttries, exportdis, exporttype, pos)
end)

RegisterCommand('testped', function(source, args, rawCommand)
    exports['wizard-delped']:DeletePeds(5, 15.0, 'all', vector3(789.85, -1765.84, 29.68))
end)

RegisterCommand(Config.Command, function(source, args, rawCommand)
    local playerId = source
    local currentTime = GetGameTimer()
    local cooldown = cooldowns[playerId] or 0
    local confcooldown2 = confcooldown2 or 0
    local confdistance = Config.Distance
    breaknotif = false

    if (currentTime - cooldown) < confcooldown2 * 1000 then
        local cooldowntimer = math.ceil((confcooldown2 * 1000 - (currentTime - cooldown)) / 1000)
        Notify(Lang.CoolDown .. cooldowntimer .. ' seconds', 'error')
    else
        if confpermission3 then
            local playerPed = GetPlayerPed(playerId)
            loop = true

            if args[1] then
                confdistance = tonumber(args[1])
                DoLoop(confdistance)
            else
                DoLoop(confdistance)
            end
        else
            Notify(Lang.NoPerm, 'error')
        end

        cooldowns[playerId] = currentTime
    end
end)
TriggerEvent("chat:addSuggestion", "/" .. Config.Command .. " <distance>", "Delete dead ped (GOD)")
