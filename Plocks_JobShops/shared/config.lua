Config = {}

Config.Debug = true

Config.labels = {
    {itemName = 'armour', label = 'Schutzweste'},
    {itemName = 'weapon_flashlight', label = 'Taschenlampe'},
    {itemName = 'medkit', label = 'Medikit'},
    {itemName = 'bandage', label = 'Verband'},
    {itemName = 'ammo-9', label = 'Pistolen Munition'}, --OX Inventory
    {itemName = 'ammo-shotgun', label = 'Pump Munition'}, --OX Inventory
    {itemName = 'weapon_pistol', label = 'Pistole'},
    {itemmName = 'WEAPON_NIGHTSTICK', label = 'Schlagstock'},
    {itemName = 'WEAPON_PUMPSHOTGUN', label = 'Pump'},
    {itemName = 'WEAPON_SMG', label = 'SMG'},
    {itemName = 'megaphone', label = 'Megaphone'},


}

Config.JobMenu = { --/JobShopsCoords for new Shops
    {
        jobs = 'police',
        css = 'police',
        coords = vector3(480.3481, -996.7374, 29.68978),
        heading = 86.76974,
        PedModel = 's_m_m_fiboffice_01',
        label = 'Um den Police Shop zu öffnen'
    },
    {
        jobs = 'ambulance',
        css = nil,
        coords = vector3(-1833.4791259766, -385.00042724609, 48.393531799316),
        heading = 60.042087554932,
        PedModel = 's_m_m_fiboffice_01',
        label = 'Um die Apotheke zu öffnen',
    },

}

Config.ShopItems = {
    ['police'] = {
        {name = 'armour', label = 'Schutzweste', price = 200, max = 2},
        {name = 'ammo-9', label = 'Pistolen Munition', price = 0, max = 300}, --OX Inventory
        {name = 'ammo-shotgun', label = 'Pump Munition', price = 0, max = 300},
        {name = 'weapon_pistol', label = 'Pistole', price = 700, max = 1},
        {name = 'weapon_flashlight', label = 'Taschenlampe', price = 150, max = 1},
        {name = 'WEAPON_NIGHTSTICK', label = 'Schlagstock', price = 60, max = 1},
        {name = 'WEAPON_STUNGUN', label = 'Taser', price = 400, max = 1},
        {name = 'WEAPON_PUMPSHOTGUN', label = 'Pump', price = 800, max = 1},
        {name = 'WEAPON_SMG', label = 'SMG', price = 2600, max = 1},
        {name = 'megaphone', label = 'Megaphone', price = 500, max = 1},

    },
    ['ambulance'] = {
        {name = 'medikit', label = 'Medikit', price = 20, max = 100},
        {name = 'bandage', label = 'Verband', price = 2, max = 200}
    }
}
