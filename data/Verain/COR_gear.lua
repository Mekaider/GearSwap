function user_setup()
    state.WeaponMode:options('SavageBlade')
    state.MeleeMode:options('Normal')
end

function init_gear_sets()
    sets.weapons['SavageBlade'] = {main="Naegling", sub="Crepuscular Knife", ranged="Fomalhaut"}

    ammo.bullet.RA = "Chrono Bullet"
    ammo.bullet.WS = "Chrono Bullet"
    ammo.bullet.MAB = "Chrono Bullet"
    ammo.bullet.QD = "Chrono Bullet"

    sets.weapons.Shield = {sub="Nusku Shield"}

    sets.idle = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Elite Royal Collar",
        waist="Null Belt",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Murky Ring",
        right_ring="Defending Ring",
        back="Null Shawl",
    }

    sets.engaged = {
        ammo=ammo.bullet.RA,
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Caro Necklace",
        waist="Kentarch Belt +1",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Epona's Ring",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    }

    -- sets.engaged.DualWield = {}

    -- sets.PhantomRoll = {}

    sets.WS = {
        ammo=ammo.bullet.RA,
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Ishvara Earring",
        left_ring="Ephramad's Ring",
        right_ring="Epaminondas's Ring",
        back="Null Shawl",
    }

    sets.WS["Savage Blade"] = {
        ammo=ammo.bullet.RA,
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Ishvara Earring",
        left_ring="Ephramad's Ring",
        right_ring="Epaminondas's Ring",
        back="Null Shawl",
    }
end
