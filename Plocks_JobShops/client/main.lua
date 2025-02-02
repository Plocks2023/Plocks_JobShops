RegisterNetEvent("showNotification")
AddEventHandler("showNotification", function(message)
    ShowNotification(message)
end)

RegisterCommand('JobShopsCoords', function()
    local coords,heading = GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())
    lib.setClipboard("{\njobs = '', --Set Your Job here\ncss = '', --If You have a CSS then you can add it here\ncoords = vector3(".. coords.x..", ".. coords.y ..", " .. coords.z.."),\nheading = ".. heading ..",\nPedModel = 's_m_m_fiboffice_01',-- Set your Ped model here,\nlabel = 'Your Label...',\n},")
    ShowNotification('Erfolgreich Kopiert gehe nun in Plocks_JobShops Config.lua und füge es bei Config.JobMenu hinzu')
end)

TriggerEvent('chat:addSuggestion', '/JobShopsCoords', 'Speichert deine aktuellen Koordinaten für Job Shops. Du kannst sie in der Config.lua eingeben.', {})
