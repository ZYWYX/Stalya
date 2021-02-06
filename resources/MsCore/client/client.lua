local spawnPos = vector3(686.245, 577.950, 130.461)
local Timer = 0
AddEventHandler('onClientMapStart', function()
    if Timer ~= 0 then return end
    exports.spawnmanager:setAutoSpawnCallback(function()
        exports.spawnmanager:spawnPlayer({
             x = spawnPos.x,
             y = spawnPos.y,
             z = spawnPos.z,
             model = 'u_m_y_imporage'
         }, function()
            TriggerEvent('Ms:WaitCharacter')
        end)
    end)

    -- enable auto-spawn
    exports.spawnmanager:setAutoSpawn(true)

    -- and force respawn when the game type starts
    exports.spawnmanager:forceRespawn()
    Timer = GetGameTimer()
end)

--TriggerEvent('onClientMapStart')
MumbleSetServerAddress('5.5.5.5', 30120)
SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, false, false, false)