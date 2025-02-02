RegisterServerEvent("shop:buyItem")
AddEventHandler("shop:buyItem", function(itemName, amount, totalPrice)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        print("[ERROR] Spieler nicht gefunden!")
        return
    end

    local playerMoney = xPlayer.getAccount("money").money
    if playerMoney >= totalPrice then
        xPlayer.removeAccountMoney("money", totalPrice)
        if Config.Debug then
            print('Geld entfernt')
        end

        xPlayer.addInventoryItem(itemName, amount)

        local itemLabel = itemName
        if Config.labels then
            for _, v in pairs(Config.labels) do
                if v.itemName == itemName then
                    itemLabel = v.label
                    break
                end
            end
        end
        print(totalPrice)

        TriggerClientEvent("showNotification", source, '~g~Kauf erfolgreich!\n~w~Item: ~o~' .. itemLabel .. '\n~w~Menge: ~o~' .. amount.. 'x')
    else
        TriggerClientEvent("showNotification", source, '~r~Du hast nicht genug Geld~w~')
    end
end)
