Config = {}

--[[ 
items of your shops format below 
label = 'name of gun', 
description = 'price of gun', 
icon = 'image shown on the menu', 
args = {weapon = 'spawn code', amount = purchase price, label = 'name of gun' },
close = false  <---- this keep menu open when they select this item, if you want menu to close when selected simply remove this
--]]

Config.Radius = 5.0 --default is 3.0 | radius player has to be from coords of location

Config.webhook = '' --optional logs of when weapons are purchased

Config.ammo = 2000 --how much ammo comes with each gun.

Config.weaponshop = {
    { label = 'Ap pistol', description = '$45,000', icon = 'https://cdn.discordapp.com/attachments/944092742894624789/1112630079823020082/584646201.png', args = { weapon = 'WEAPON_APPISTOL', amount = 45000, label = 'Ap Pistol' }, close = true },
    { label = 'Combat Pistol',  description = '$25,000',icon = 'https://cdn.discordapp.com/attachments/944092742894624789/1112629967122092042/1593441988.png', args = { weapon = 'WEAPON_COMBATPISTOL', amount = 25000, label = 'Combat Pistol' }, close = true },
    { label = 'Mini SMG', description = '$125,000', icon = 'https://cdn.discordapp.com/attachments/944092742894624789/1113294121067610162/WEAPON_MINISMG.png', args = { weapon = 'WEAPON_MINISMG', amount = 125000, label = 'Mini SMG'}, close = true},
}

Config.blackweaponshop = {
    { label = 'Carbine Rifle', description = '$350,000', icon = 'https://cdn.discordapp.com/attachments/944092742894624789/1113307136815005706/WEAPON_CARBINERIFLE.png', args = { weapon = 'WEAPON_CARBINERIFLE', amount = 350000, label = 'Carbine Rifle' }, close = true },
    { label = 'Special Carbine', description = '$7,500,000', icon = 'https://cdn.discordapp.com/attachments/944092742894624789/1113307356957265940/WEAPON_SPECIALCARBINE.png', args = { weapon = 'WEAPON_SPECIALCARBINE', amount = 7500000, label = 'Special Carbine' }, close = true },
    { label = 'Assault Rifle', description = '$7,500,000', icon = '', args = { weapon = 'WEAPON_ASSAULTRIFLE', amount = 7500000, label = 'Assault Rifle' }, close = true },
    { label = 'Combat MG', description = '$6,000,000', icon = '', args = { weapon = 'WEAPON_COMBATMG', amount = 6000000, label = 'Combat MG' }, close = true },
}

Config.weaponlocation = {
    { x = -660.8086, y = -938.4613, z = 21.8294 },
    { x = 814.8391, y = -2153.5591, z = 29.6192 },
    { x = 248.7355, y = -50.2662, z = 69.9413 },
    { x = 16.4087, y = -1109.1301, z = 29.7972 },
    { x = -1308.9879, y = -392.8968, z = 36.6958 },
    { x = 843.0615, y = -1030.1461, z = 28.1949 },
    { x = 219.73, y = -2537.78, z = 5.3 },
    { x = 2025.78, y = 2753.54, z = 56.63 },
    { x = 1429.36, y = 1142.55, z = 114.21 }
}

Config.blackweaponlocation = {
    { x = 307.52,  y = -1005.36,  z = 29.32 },
}

return Config