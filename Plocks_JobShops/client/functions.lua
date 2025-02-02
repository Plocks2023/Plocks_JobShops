function OpenShop(playerJob, css)
    local shopItems = Config.ShopItems[playerJob] or {}
    if #shopItems == 0 then
        ShowNotification("~r~Kein Shop für diesen Job verfügbar.")
        return
    end

    local shopElements = {}
    for _, item in ipairs(shopItems) do
        if not item.price or type(item.price) ~= "number" then
            if Config.Debug then
                print("Fehlender oder ungültiger Preis für Item: " .. tostring(item.name))
            end
            item.price = 1 -- Standardwert, falls 'price' fehlt oder ungültig ist
        end

        table.insert(shopElements, {
            label = ("%s - %d$"):format(item.label, item.price),
            name = item.name,
            price = item.price, -- Preis
            value = 1,
            type = 'slider',
            min = 1,
            max = item.max or 1 -- Standardwert für 'max', falls nicht definiert
        })
    end

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "Shop_Menu", {
        css = css,
        title = "Shop - " .. playerJob,
        align = 'top-left',
        elements = shopElements
    },
    function(data, menu)
        local item = data.current
        local amount = tonumber(item.value) or 1
        local pricePerUnit = tonumber(item.price) or 0
        local totalPrice = pricePerUnit * amount

        -- Debugging und Kaufabwicklung
        if Config.Debug then
            print(("Item: %s, Menge: %d, Einzelpreis: %d$, Gesamtpreis: %d$"):format(item.name, amount, pricePerUnit, totalPrice))
        end

        TriggerServerEvent("shop:buyItem", item.name, amount, totalPrice)
    end,
    function(data, menu)
        menu.close()
    end)
end

--Notify wie in GTA
function ShowNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end