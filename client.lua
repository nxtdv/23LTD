ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

local Panier = {}
local pTotal = 0
local qty = 0

LTD = function()

    local main = RageUI.CreateMenu("", "Supermarket", nil, nil, "root_cause", "shopui_title_ltdgasoline")

    RageUI.Visible(main, not RageUI.Visible(main)) 
    FreezeEntityPosition(PlayerPedId(), true)
    while main do
        Citizen.Wait(0)

        RageUI.IsVisible(main, function()
                        
            RageUI.Separator("Panier : ~o~"..qty.." ~s~/ ~b~"..ltd.itemMax.."")
            RageUI.Separator("Total : ~g~" ..pTotal.. "$~s~")

            if qty > 0 then
                for k, v in pairs(Panier) do
                    RageUI.Button(v.label, ltd.description, {RightLabel = "~y~"..v.prix.."$"}, true, { 
                        onSelected = function()
                            table.remove(Panier, k)
                            pTotal = pTotal - v.prix
                            qty = qty - v.poid
                            rUtils.ImportantNotif("<C> - 1 "..v.label.."</C>")
                        end 
                    })
                end
                RageUI.Button("~g~Confirmer le panier", nil, {RightLabel = "→→"}, true, { 
                    onSelected = function()
                        TriggerServerEvent("totalBuy", Panier, pTotal)
                        for k, _ in pairs (Panier) do
                            Panier[k] = nil
                            pTotal = 0
                            qty = 0
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
                            if qty >= ltd.itemMax then
                                rUtils.ImportantNotif("<C>~o~Panier au max</C>")
                            else
                                rUtils.ImportantNotif("<C>"..v.notif.."</C>", "info")
                                table.insert(Panier, {label = v.label,item = v.item, prix = v.prix, poid = v.poid})
                                pTotal = pTotal + v.prix
                                qty = qty + v.poid
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