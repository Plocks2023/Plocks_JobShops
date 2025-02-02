for k, v in pairs(Config.JobMenu) do
    local playerState = LocalPlayer.state
    local NPCPosition = v.coords

    local isNearPed = false
    local isAtPed = false
    local isPedLoaded = false

    local pedModel = GetHashKey(v.PedModel)
    local npc

    Citizen.CreateThread(function()
        while true do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local distance = Vdist(playerCoords, v.coords)

            isNearPed = false
            isAtPed = false

            if distance < 20.0 and playerState.job.name == v.jobs then
                isNearPed = true
                if not isPedLoaded then
                    RequestModel(pedModel)
                    while not HasModelLoaded(pedModel) do
                        Wait(10)
                    end

                    npc = CreatePed(4, pedModel, v.coords, v.heading, false, false)
                    FreezeEntityPosition(npc, true)
                    SetEntityHeading(npc, v.heading)
                    SetEntityInvincible(npc, true)
                    SetBlockingOfNonTemporaryEvents(npc, true)

                    isPedLoaded = true
                end
            elseif isPedLoaded then
                DeleteEntity(npc)
                SetModelAsNoLongerNeeded(pedModel)
                isPedLoaded = false
            end

            if distance < 2.0 then
                isAtPed = true
            end
            Citizen.Wait(500)
        end
    end)

    Citizen.CreateThread(function()
        while true do
            if isAtPed and playerState.job.name == v.jobs then
                ESX.ShowHelpNotification(v.label)
                if IsControlJustReleased(0, 38) then
                    if Config.Debug then
                        print('Job: ' .. json.encode(playerState.job, { indent = true }))
                    end
                    if playerState.job.name == v.jobs then
                        if Config.Debug then
                            print('Alles geht\n Der Job des Users ist: ' .. playerState.job.name)
                        end
                        local playerJob = LocalPlayer.state.job.name
                        local css = v.css
                        OpenShop(playerJob, css)
                    end
                end
            end
            Citizen.Wait(1)
        end
    end)
end
