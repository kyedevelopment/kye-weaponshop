local Config = require('config')

ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('kye_development:weapon')
AddEventHandler('kye_development:weapon', function(amount, weapon, label)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.hasWeapon(weapon) then
        TriggerClientEvent('weaponshop:notify', source, "", "You Already Have An " .. label, "top", "inform")
    else
        if xPlayer.getMoney() >= amount then
            xPlayer.removeMoney(amount)
            xPlayer.addWeapon(weapon, Config.ammo)
            TriggerClientEvent('weaponshop:notify', source, "", "You purchased a " .. label .. "!", "top", "success")
            local time = (os.date("%B %d, %Y at %I:%M %p"))
            local embed = {
                content = nil,
                embeds = { 
                {
                title = 'Weapon Purchase',
                description = "**Player: **" .. GetPlayerName(source) .. " (ID: "..source..")\n **Purchased:** (" ..label..")",
                ["footer"] = {
                    ["text"] = time
                },
                color = 0x808080
                } 
              }
            }
            PerformHttpRequest(Config.webhook, function(err, text, headers) end, 'POST', json.encode(embed), { ['Content-Type'] = 'application/json' })
        else
            local missingBread = amount - xPlayer.getMoney()
            TriggerClientEvent('weaponshop:notify', source, "", "You Cannot Afford " .. label .. "\nMissing $" .. missingBread .. "!", "top", "error")
        end
    end
end)

RegisterServerEvent('kye_development:blackweapon')
AddEventHandler('kye_development:blackweapon', function(amount, weapon, label)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.hasWeapon(weapon) then
        TriggerClientEvent('weaponshop:notify', source, "", "You Already Have An " .. label, "top", "inform")
    else
        if xPlayer.getAccount('black_money').money >= amount then
            xPlayer.removeAccountMoney('black_money', amount)
            xPlayer.addWeapon(weapon, Config.ammo)
            TriggerClientEvent('weaponshop:notify', source, "", "You purchased a " .. label .. "!", "top", "success")
            local time = (os.date("%B %d, %Y at %I:%M %p"))
            local embed = {
                content = nil,
                embeds = { 
                {
                title = 'Weapon Purchase',
                description = "**Player: **" .. GetPlayerName(source) .. " (ID: "..source..")\n **Purchased:** (" ..label..")",
                ["footer"] = {
                    ["text"] = time
                },
                color = 0x808080
                } 
              }
            }
            PerformHttpRequest(Config.webhook, function(err, text, headers) end, 'POST', json.encode(embed), { ['Content-Type'] = 'application/json' })
        else
            local missingBread = amount - xPlayer.getAccount('black_money').money
            TriggerClientEvent('weaponshop:notify', source, "", "You Cannot Afford " .. label .. "\nMissing $" .. missingBread .. "!", "top", "error")
        end
    end
end)

RegisterServerEvent("checkPlayerAce")
AddEventHandler("checkPlayerAce", function()
    local playerId = source
    local hasAcePermission = IsPlayerAceAllowed(playerId, "k.blackmarket")
    TriggerClientEvent("playerAceChecked", playerId, hasAcePermission)
end)