ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

local cart = {}
local priceTotal = 0
local qtyTotal = 0

LTD = function()

    local main = RageUI.CreateMenu("", "Supermarket", nil, nil, "root_cause", "shopui_title_ltdgasoline")

    RageUI.Visible(main, not RageUI.Visible(main)) 
    FreezeEntityPosition(PlayerPedId(), true)
    while main do
        Citizen.Wait(0)

        RageUI.IsVisible(main, function()
                        
            RageUI.Separator("Panier : ~o~"..qtyTotal.." ~s~/ ~b~"..ltd.itemMax.."")
            RageUI.Separator("Total : ~g~" ..priceTotal.. "$~s~")

            if qtyTotal > 0 then
                for k, v in pairs(cart) do
                    RageUI.Button(v.label, ltd.description, {RightLabel = "~y~"..v.prix.."$"}, true, { 
                        onSelected = function()
                            table.remove(cart, k)
                            priceTotal = priceTotal - v.prix
                            qtyTotal = qtyTotal - v.poid
                            rUtils.ImportantNotif("<C> - 1 "..v.label.."</C>")
                        end 
                    })
                end
                RageUI.Button("~g~Confirmer le panier", nil, {RightLabel = "→→"}, true, { 
                    onSelected = function()
                        TriggerServerEvent("totalBuy", cart, priceTotal)
                        for k, _ in pairs (cart) do
                            cart[k] = nil
                            priceTotal = 0
                            qtyTotal = 0
                        end
                    end 
                })
            else
                RageUI.Separator("~r~Aucun article dans le panier~s~")
            end 

        end)
        if not RageUI.Visible(main) and not RageUI.Visible(sub) then
            FreezeEntityPosition(PlayerPedId(), false)
            main = RMenu:DeleteType('main', true)
        end
    end
end

Citizen.CreateThread(function()
    while true do 
        local rgba = {120, 169, 255}
        local rgbb = {255,0,0}
        local interval = 200
        local pPed = PlayerPedId()
        local pPos = GetEntityCoords(pPed)
        local dist 
        for _, v in pairs(ltd.stand) do
            dist = #(pPos - v.pos)
            if v.valid == true then
                if dist <= 50.0 then
                    interval = 1
                    DrawMarker(29, v.pos.x, v.pos.y, v.pos.z + 0.6, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, rgbb[1], rgbb[2], rgbb[3], 255, nil, true, true, nil, false, false, false, false)
                    DrawMarker(6,v.pos.x, v.pos.y, v.pos.z - 0.95, 0.0, 0.0, 360.0, 0.0, 224.0, 0.0, vec3(0.45, 0.45, 0.45), rgbb[1], rgbb[2], rgbb[3], 100)
                    if dist <= 1.0 then 
                        ESX.ShowHelpNotification('Appuyez sur ~INPUT_PICKUP~ pour accéder à la supérette')
                        if IsControlJustPressed(1, 38) then
                            LTD()
                            rgbb = {120, 169, 255}
                        end
                    end
                end
            else
                if dist <= 50.0 then
                    interval = 1
                    DrawMarker(32, v.pos.x, v.pos.y, v.pos.z + 0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, rgba[1], rgba[2], rgba[3], 100, nil, true, true, nil, false, false, false, false)
                    DrawMarker(6,v.pos.x, v.pos.y, v.pos.z - 0.95, 0.0, 0.0, 360.0, 0.0, 224.0, 0.0, vec3(0.45, 0.45, 0.45), rgba[1], rgba[2], rgba[3], 100)
                    if dist <= 1.0 then 
                        ESX.ShowHelpNotification(v.message)
                        if IsControlJustPressed(1, 38) then
                            if qtyTotal >= ltd.itemMax then
                                rUtils.ImportantNotif("<C>~o~Panier au max</C>")
                            else
                                rUtils.ImportantNotif("<C>"..v.notif.."</C>", "info")
                                table.insert(cart, {label = v.label,item = v.item, prix = v.prix, poid = v.poid})
                                priceTotal = priceTotal + v.prix
                                qtyTotal = qtyTotal + v.poid
                                rgba = {255,0,0}
                            end
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)