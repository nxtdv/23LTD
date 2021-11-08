local ESX = exports.es_extended:getSharedObject()

RegisterNetEvent('totalBuy')
AddEventHandler('totalBuy', function(total, price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getMoney()
    if xMoney >= price then
        xPlayer.removeAccountMoney('bank', price)
        for _, v in pairs(total) do
            xPlayer.addInventoryItem(v.item, v.poid)
        end
        TriggerClientEvent('esx:showNotification', _src, "<C>- ~y~Type~s~ : ~b~Achat~s~\n- ~y~Prix~s~ : ~g~"..price.."~s~ $</C>")
    else
        TriggerClientEvent('esx:showNotification', _src, "<C>- ~y~Type : Erreur \n- ~y~Pas assez d'argent</C>")
    end
end)