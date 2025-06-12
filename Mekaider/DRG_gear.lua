function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'PDL')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'DT')

    state.WeaponSet = M{['description']='Weapon', 'Trishula', 'Naegling'}

    -- select_default_macro_book()
    lockstyleset = 15
    set_lockstyle()
    -- send_command('lua l pettp')
end

function user_unload()
    -- send_command('lua u pettp')
end

function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.Trishula = {main={ name="Trishula", augments={'Path: A',}}, sub="Utu Grip"}
    sets.Naegling = {main="Naegling"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Idle Sets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Infused Earring",
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.idle.DT = set_combine(sets.idle, {})

    sets.idle.Pet = set_combine(sets.idle, {})

    sets.idle.DT.Pet = set_combine(sets.idle.Pet, {})

    sets.idle.Weak = sets.idle.DT

    sets.Moving = {legs="Carmine Cuisses +1"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
        ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body="Pelt. Plackart +2",
        hands={ name="Acro Gauntlets", augments={'Accuracy+25','"Store TP"+6','Crit. hit damage +3%',}},
        legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
        feet="Flam. Gambieras +2",
        neck="Anu Torque",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Moonlight Ring",
        back="Null Shawl",
    }

    sets.engaged.Acc = set_combine(sets.engaged, {})

    sets.engaged.PDL = set_combine(sets.engaged, {})

    sets.engaged.DT = set_combine(sets.engaged, {
        head="Hjarrandi Helm",
        neck="Loricate Torque +1",
        body="Hjarrandi Breast.",
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
    })

    sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.DT)
    sets.engaged.PDL.DT = set_combine(sets.engaged.PDL, sets.engaged.DT)

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weaponskill Sets --------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.WS = {
        ammo="Knobkierrie",
        head="Flam. Zucchetto +2",
        body="Dagon Breast.",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Sulev. Leggings +2",
        neck="Anu Torque",
        waist="Soil Belt",
        left_ear="Sherida Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Flam. Zucchetto +2",
        body="Pelt. Plackart +2",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Sulev. Leggings +2",
        neck="Anu Torque",
        waist="Soil Belt",
        left_ear="Sherida Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    })

    -- sets.precast.WS['Stardiver'] = {}

    -- sets.precast.WS['Stardiver'].PDL = set_combine(sets.precast.WS['Stardiver'], {
    --     ammo="Knobkierrie",
    --     head="Flam. Zucchetto +2",
    --     body="Pelt. Plackart +2",
    --     hands="Gleti's Gauntlets",
    --     legs="Gleti's Breeches",
    --     feet="Sulev. Leggings +2",
    --     neck="Anu Torque",
    --     waist="Soil Belt",
    --     left_ear="Sherida Earring",
    --     right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    --     left_ring="Niqmaddu Ring",
    --     right_ring="Regal Ring",
    --     back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    -- })

    sets.precast.WS['Savage Blade'] = {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Anu Torque",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Regal Ring",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- JA Sets -----------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.JA['Spirit Surge'] = {body="Ptero. Mail +3"}
    sets.precast.JA['Call Wyvern'] = {body="Ptero. Mail +3"}
    sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais +3"}

    sets.precast.JA['Spirit Link'] = {}

    sets.precast.JA['Steady Wing'] = {}

    sets.precast.JA['Jump'] = {}

    sets.precast.JA['High Jump'] = sets.precast.JA['Jump']
    sets.precast.JA['Spirit Jump'] = sets.precast.JA['Jump']
    sets.precast.JA['Soul Jump'] = set_combine(sets.precast.JA['Jump'], {body="Vishap Mail +3", hands="Emi. Gauntlets +1", legs=gear.Valo_STP_legs})
    sets.precast.JA['Super Jump'] = {}

    sets.precast.JA['Angon'] = {ammo="Angon", hands="Ptero. Fin. G. +3"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Magic Precast Sets ------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Fast cast sets for spells
    sets.precast.FC = {}

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