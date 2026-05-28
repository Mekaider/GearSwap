function user_setup()
    state.MeleeMode:options('TP', 'Hybrid', 'DT')
    state.WeaponMode = M{['description']='Weapon', 'Trishula', 'Naegling'}

    send_command('lua l pettp')
end

function user_unload()
    send_command('lua u pettp')
end

function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.weapons.Trishula = {main="Trishula", sub="Utu Grip"}
    sets.weapons.Naegling = {main="Naegling", sub="Diamond Buckler"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Idle Sets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Peltast's Mezail +3",
        body="Sacro Breastplate",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Elite Royal Collar",
        waist="Carrier's Sash",
        left_ear="Alabaster Earring",
        right_ear="Infused Earring",
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.idle.Pet = set_combine(sets.idle, {})

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
        ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body="Pelt. Plackart +3",
        hands="Pel. Vambraces +3",
        legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
        feet="Flam. Gambieras +2",
        neck="Vim Torque +1",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    }

    -- sets.engaged.Pet = {}

    sets.engaged.Hybrid = set_combine(sets.engaged, {
        head="Hjarrandi Helm",
        neck="Loricate Torque +1",
        body="Hjarrandi Breast.",
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
    })

    -- sets.engaged.Hybrid.Pet

    -- sets.engaged.DT = {}

    -- sets.engaged.DT.Pet = {}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weaponskill Sets --------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.WS = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Ptero. Fin. G. +4",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Regal Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Stardiver'] = {
        main="Trishula",
        sub="Utu Grip",
        ammo="Coiste Bodhar",
        head="Ptero. Armet +3",
        body="Nyame Mail",
        hands="Pel. Vambraces +3",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Soil Belt",
        left_ear="Moonshade Earring",
        right_ear="Sherida Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Sroda Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.WS['Leg Sweep'] = {
        ammo="Pemphredo Tathlum",
        head="Peltast's Mezail +3",
        body="Pelt. Plackart +3",
        hands="Pel. Vambraces +3",
        legs="Pelt. Cuissots +3",
        feet="Pelt. Schyn. +3",
        neck="Null Loop",
        waist="Null Belt",
        left_ear="Moonshade Earring",
        right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back="Null Shawl",
    }

    sets.WS['Flat Blade'] = set_combine(sets.WS['Leg Sweep'])

    sets.WS['Savage Blade'] = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Ptero. Fin. G. +4",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Regal Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- JA Sets -----------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.JA['Spirit Surge'] = {} -- {body="Ptero. Mail +3"}
    sets.JA['Call Wyvern'] = {} -- {body="Ptero. Mail +3"}
    sets.JA['Ancient Circle'] = {legs="Vishap Brais +2"}
    sets.JA['Spirit Link'] = {hands="Pel. Vambraces +3"}
    sets.JA['Steady Wing'] = {}
    sets.JA['Jump'] = set_combine(sets.engaged, {
        body="Vishap Mail +2",
        hands="Vis. Fng. Gaunt. +2",
        legs="Ptero. Brais +3",
    })
    sets.JA['High Jump'] = set_combine(sets.JA['Jump'])
    sets.JA['Soul Jump'] = set_combine(sets.JA['Jump'])
    sets.JA['Spirit Jump'] = set_combine(sets.JA['Jump'], {feet="Pelt. Schyn. +3"})
    sets.JA['Super Jump'] = {}
    sets.JA['Angon'] = {ammo="Angon", hands="Ptero. Fin. G. +4"}

    sets['Healing Breath'] = {
        head="Ptero. Armet +3",
        legs="Vishap Brais +2"
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Magic Precast Sets ------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Fast cast sets for spells
    sets.precast.FastCast = {
        ammo="Sapience Orb",
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body="Sacro Breastplate",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Enif Cosciales",
        neck="Voltsurge Torque",
        left_ring="Prolix Ring",
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Magic Midcast Sets ------------------------------------
    ------------------------------------------------------------------------------------------------

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Other Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.buff.Doom = {
        -- neck="Nicander's Necklace", --20
        -- ring1={name="Eshmun's Ring", bag="wardrobe3"}, --20
        -- ring2={name="Eshmun's Ring", bag="wardrobe4"}, --20
        -- waist="Gishdubar Sash", --10
    }

end
