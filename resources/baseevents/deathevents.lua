local canDie = true
Citizen.CreateThread(function()
    while true do
        Wait(100)

        local player = PlayerId()

        if NetworkIsPlayerActive(player) then
            local ped = PlayerPedId()

            if GetEntityHealth(ped) < 100 and canDie then
                print(GetEntityHealth(ped))
                canDie = false
                local killer, killerweapon = NetworkGetEntityKillerOfPlayer(player)
                local killerentitytype = GetEntityType(killer)
                local killertype = -1
                local killerinvehicle = false
                local killervehiclename = ''
                local killervehicleseat = 0
                if killerentitytype == 1 then
                    killertype = GetPedType(killer)
                    if IsPedInAnyVehicle(killer, false) == 1 then
                        killerinvehicle = true
                        killervehiclename = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(killer)))
                        killervehicleseat = GetPedVehicleSeat(killer)
                    else
                        killerinvehicle = false
                    end
                end

                local killerid = GetPlayerByEntityID(killer)
                if killer ~= ped and killerid ~= nil and NetworkIsPlayerActive(killerid) then
                    killerid = GetPlayerServerId(killerid)
                else
                    killerid = -1
                end

                if killer == ped or killer == -1 then
                    TriggerServerEvent('baseevents:onPlayerDied', killertype, { table.unpack(GetEntityCoords(ped)) })
                else
                    TriggerServerEvent('baseevents:onPlayerKilled', killerid, { killertype = killertype, weaponhash = killerweapon, killerinveh = killerinvehicle, killervehseat = killervehicleseat, killervehname = killervehiclename, killerpos = { table.unpack(GetEntityCoords(ped)) } })
                end
            end
        end
    end
end)

function GetPlayerByEntityID(id)
    for i = 0, 32 do
        if (NetworkIsPlayerActive(i) and GetPlayerPed(i) == id) then return i end
    end
    return nil
end

RegisterNetEvent('wejdenehop')
AddEventHandler('wejdenehop', function()
    print(GetEntityHealth(PlayerPedId()))
    canDie = true
end)