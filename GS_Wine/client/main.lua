--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
--─██████████████─████████████████───██████████████─██████──██████─██████████████────██████████████─██████████████─████████████████───██████████─██████████████─██████████████─██████████████─
--─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
--─██░░██████████─██░░████████░░██───██░░██████░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██████████─██░░████████░░██───████░░████─██░░██████░░██─██████░░██████─██░░██████████─
--─██░░██─────────██░░██────██░░██───██░░██──██░░██─██░░██──██░░██─██░░██────────────██░░██─────────██░░██─────────██░░██────██░░██─────██░░██───██░░██──██░░██─────██░░██─────██░░██─────────
--─██░░██─────────██░░████████░░██───██░░██──██░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██─────────██░░████████░░██─────██░░██───██░░██████░░██─────██░░██─────██░░██████████─
--─██░░██──██████─██░░░░░░░░░░░░██───██░░██──██░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░░░██─────██░░██───██░░░░░░░░░░██─────██░░██─────██░░░░░░░░░░██─
--─██░░██──██░░██─██░░██████░░████───██░░██──██░░██─██░░██──██░░██─██░░██████████────██████████░░██─██░░██─────────██░░██████░░████─────██░░██───██░░██████████─────██░░██─────██████████░░██─
--─██░░██──██░░██─██░░██──██░░██─────██░░██──██░░██─██░░░░██░░░░██─██░░██────────────────────██░░██─██░░██─────────██░░██──██░░██───────██░░██───██░░██─────────────██░░██─────────────██░░██─
--─██░░██████░░██─██░░██──██░░██████─██░░██████░░██─████░░░░░░████─██░░██████████────██████████░░██─██░░██████████─██░░██──██░░██████─████░░████─██░░██─────────────██░░██─────██████████░░██─
--─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░░░░░██───████░░████───██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░██─██░░██─────────────██░░██─────██░░░░░░░░░░██─
--─██████████████─██████──██████████─██████████████─────██████─────██████████████────██████████████─██████████████─██████──██████████─██████████─██████─────────────██████─────██████████████─
--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Citizen.CreateThread(function()
    for i, v in pairs(Config.Blipovi) do
        local blip = AddBlipForCoord(v.Kordinate.x, v.Kordinate.y, v.Kordinate.z)

        SetBlipSprite(blip, v.Ikonica)

        if v.Boja ~= nil then
            SetBlipColour(blip, v.Boja)
        end

        SetBlipDisplay(blip, v.Pokazuj)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.Ime) -- Stavi ime blipu
        EndTextCommandSetBlipName(blip)


        local display = v.Pokazuj

        SetBlipDisplay(blip, display)
    end
end)

CreateThread(function()
    for k, v in pairs(Config.Vinarija) do
        exports.qtarget:AddBoxZone("branje", vector3(v.branjekorde.x, v.branjekorde.y, v.branjekorde.z - 1), 1, 1, {
            name = "branje",
            heading = v.branjekorde.w,
            debugPoly = false,
            minZ = v.branjekorde.z - 1,
            maxZ = v.branjekorde.z + 2,
        }, {
            options = {
                {
                    action = function()
                        lib.progressCircle({
                            duration = v.pickingtime * 1000,
                            position = 'bottom',
                            label = _U('picking'),
                            useWhileDead = false,
                            canCancel = false,
                            disable = {
                                move = true,
                                combat = true,
                                mouse = false,
                                car = true,
                            },
                            anim = {
                                dict = v.pickingdict,
                                clip = v.pickingclip
                            },
                        })
                        TriggerServerEvent('GS_Wine:ub', v.grapeitem, v.grapecount)
                    end,
                    icon = v.pickingicon,
                    label = _U('pick'),
                },
            },
            distance = 2.0
        })
    end
end)

CreateThread(function ()
    for k,v in pairs(Config.Vinarija) do
        local prop = v.barrelprop
        local korde = v.barrelkorde

        RequestModel(GetHashKey(prop))
        while not HasModelLoaded(prop) do
            Wait(500)
        end
  
        local Bure = CreateObject(prop, korde, false, true)
        FreezeEntityPosition(Bure, true)
        SetEntityInvincible(Bure, true)
        PlaceObjectOnGroundProperly(Bure)
        SetModelAsNoLongerNeeded(prop)

        exports.qtarget:AddTargetModel(prop, {
            options = {
                {
                    action = function ()
                        ESX.TriggerServerCallback('GS_Wine:hg',  function(ima)
                            if ima then
                                lib.progressCircle({
                                    duration = v.puttingtime * 1000,
                                    position = 'bottom',
                                    label = _U('putting'),
                                    useWhileDead = false,
                                    canCancel = false,
                                    disable = {
                                        move = true,
                                        combat = true,
                                        mouse = false,
                                        car = true,
                                    },
                                    anim = {
                                        dict = v.puttingdict,
                                        clip = v.puttingclip
                                    },
                                })
                                TriggerServerEvent('GS_Wine:h',v.grapeitem,v.needgrape,v.wineitem,v.winecount,v.waitforwine * 1000)
                                obavesti(_U('successput')..v.needgrape.._U('grape')..v.waitforwine.._U('seconds'),'','success','top',4500)
                            else
                                obavesti(_U('noenough')..v.needgrape,'','warning','top',1000)
                            end
                        end)
                    end,
                    icon = 'fas fa-hand',
                    label = _U('barreltext'),
                },
            },
            distance = 2
        })
    end
end)

CreateThread(function ()
    for k,v in pairs(Config.Vinarija) do
        RequestModel(GetHashKey(v.model))
        while not HasModelLoaded(GetHashKey(v.model)) do
          Wait(1)
        end
        PostaviPeda = CreatePed(4, v.model, vector3(v.coords.x, v.coords.y, v.coords.z - 1) , v.coords.w, false, true)
        TaskStartScenarioInPlace(PostaviPeda, v.pedscenario, 0, true)
        FreezeEntityPosition(PostaviPeda, true) 
        SetEntityInvincible(PostaviPeda, true)
        SetBlockingOfNonTemporaryEvents(PostaviPeda, true)
          exports.qtarget:AddBoxZone('prodaja', vector3(v.coords.x, v.coords.y, v.coords.z - 1), v.coords.w, 1.0, {
              name= 'prodaja',
              heading= v.coords.w,
              debugPoly= false,
              minZ= v.coords.z -1,
              maxZ= v.coords.z +2,
              }, {
                options = {
                  {
                    action = function ()
                        ESX.TriggerServerCallback('getajitem', function (ima)
                            if ima then
                                ESX.Streaming.RequestAnimDict(v.pregovaranjedict, function ()
                                    TaskPlayAnim(PostaviPeda, v.pregovaranjedict, v.pregovaranjeclip, 8.0, -8.0, -1, 2, 0, false, false, false)
                                end)
                                lib.progressCircle({
                                    duration = 4000,
                                    position = 'bottom',
                                    label = _U('dealing'),
                                    useWhileDead = false,
                                    canCancel = false,
                                    disable = {
                                        move = true,
                                        combat = true,
                                        mouse = false,
                                        car = true,
                                    },
                                    anim = {
                                        dict = v.pregovaranjedict,
                                        clip = v.pregovaranjeclip
                                    },
                                })
                                Wait(500)
                                ESX.Streaming.RequestAnimDict(v.rukovanjedict, function ()
                                    TaskPlayAnim(PostaviPeda, v.rukovanjedict, v.rukovanjeclip, 8.0, -8.0, -1, 2, 0, false, false, false)
                                end)
                                ESX.Streaming.RequestAnimDict(v.rukovanjedict, function ()
                                    TaskPlayAnim(PlayerPedId(), v.rukovanjedict, v.rukovanjeclip, 8.0, -8.0, -1, 2, 0, false, false, false)
                                end)
                                Wait(3000)
                                ClearPedTasks(PostaviPeda)
                                ClearPedTasks(PlayerPedId())
                                obavesti(_U('founddeal'),'','success','top',1000)
                                TaskStartScenarioInPlace(PostaviPeda, v.pedscenario, 0, true)
                                TriggerServerEvent('GS_Wine:se')
                            else
                                obavesti(_U('nowine'),'','error','top',1000)
                            end
                        end)
                    end,
                    icon = v.pedicon,
                    label = _U('sellnpctext'),
                  }
                },
                distance = 2.0
            })
    end
end)