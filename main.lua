local Config = require('config')

local inWeaponShopRadius = false
local inBlackWeaponShopRadius = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        local playerCoords = GetEntityCoords(PlayerPedId())

        for _, location in ipairs(Config.weaponlocation) do
            local distance = GetDistanceBetweenCoords(playerCoords, location.x, location.y, location.z, true)
            if distance < Config.Radius then
                inWeaponShopRadius = true
                --lib.showTextUI('[E] - Weaponshop', {
                --    position = "right-center",
                --    icon = 'hand',
                --    style = {
                --        borderRadius = 0,
                --        backgroundColor = 'rgba(0, 0, 0, 0.4)',
                --        boxShadow = '0 0 10px rgba(0, 0, 0, 0.5)',
                --        color = 'white',
                --    }
                --})

                break -- Break the loop if player is inside a weapon shop radius
            else 
                inWeaponShopRadius = false
            end
            Citizen.Wait(100)
        end

        for _, location in ipairs(Config.blackweaponlocation) do
            local distance = GetDistanceBetweenCoords(playerCoords, location.x, location.y, location.z, true)
            if distance < Config.Radius then
                inBlackWeaponShopRadius = true
                --lib.showTextUI('[E] - BlackWeaponshop', {
                --    position = "right-center",
                --    icon = 'hand',
                --    style = {
                --        borderRadius = 0,
                --        backgroundColor = 'rgba(0, 0, 0, 0.4)',
                --        boxShadow = '0 0 10px rgba(0, 0, 0, 0.5)',
                --        color = 'white'
                --    }
                --})

                break -- Break the loop if player is inside a weapon shop radius
            else 
                inBlackWeaponShopRadius = false
            end
            Citizen.Wait(100)
        end

        --if not inWeaponShopRadius and not inBlackWeaponShopRadius then
        --    lib.hideTextUI()
        --    lib.hideMenu('weaponshop_menu', 'blackweaponshop_menu')
        --end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(6)
        if inWeaponShopRadius then
            if IsControlJustReleased(0, 38) then -- "E" key
                lib.showMenu('weaponshop_menu')
            end
        end

        if inBlackWeaponShopRadius then
            if IsControlJustReleased(0, 38) then -- "E" key
                lib.showMenu('blackweaponshop_menu')
            end
        end
    end
end)

lib.registerMenu({
    id = 'weaponshop_menu',
    title = 'Weapon Shop',
    position = 'bottom-right',
    options = Config.weaponshop
}, function(selected, scrollIndex, args)
if args.weapon then
    TriggerServerEvent('kye_development:weapon', args.amount, args.weapon, args.label)
end
end)

lib.registerMenu({
    id = 'blackweaponshop_menu',
    title = 'Black Weapon Shop',
    position = 'bottom-right',
    options = Config.blackweaponshop
}, function(selected, scrollIndex, args)
if args.weapon then
    TriggerServerEvent('kye_development:blackweapon', args.amount, args.weapon, args.label)
end
end)

RegisterNetEvent('weaponshop:notify')
AddEventHandler('weaponshop:notify', function(title, message, position, type)
    lib.notify({
        title = title,
        description = message,
        position = position,
        type = type
    })
end)

RegisterNetEvent("playerAceChecked")
AddEventHandler("playerAceChecked", function(hasAcePermission)
    if hasAcePermission then
        bmarketaccess = true
        Citizen.CreateThread(function()
            for _, location in ipairs(Config.blackweaponlocation) do
                local blip = AddBlipForCoord(location.x, location.y, location.z)
                SetBlipSprite(blip, 313)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 0.7)
                SetBlipColour(blip, 0)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('Blackmarket')
                EndTextCommandSetBlipName(blip)
            end
            collectgarbage()
        end)
    else
        bmarketaccess = false
        return
    end
end)


Citizen.CreateThread(function()
    TriggerServerEvent("checkPlayerAce")
    for _, location in ipairs(Config.weaponlocation) do
        local blip = AddBlipForCoord(location.x, location.y, location.z)
        SetBlipSprite(blip, 313)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 0)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Gunstore')
        EndTextCommandSetBlipName(blip)
    end
    collectgarbage()
end)

--Citizen.CreateThread(function()
--    for _, location in ipairs(Config.blackweaponlocation) do
--        local blip = AddBlipForCoord(location.x, location.y, location.z)
--        SetBlipSprite(blip, 313)
--        SetBlipDisplay(blip, 4)
--        SetBlipScale(blip, 0.7)
--        SetBlipColour(blip, 0)
--        SetBlipAsShortRange(blip, true)
--        BeginTextCommandSetBlipName("STRING")
--        AddTextComponentString('Blackmarket')
--        EndTextCommandSetBlipName(blip)
--    end
--    collectgarbage()
--end)