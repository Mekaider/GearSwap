function user_setup()
    state.MeleeMode:options('TP', 'DT')
    state.WeaponMode = M{['description']='Weapon', 'Trishula', 'Naegling'}
end

function user_unload()
end

function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.weapons.Trishula = {main="Trishula", sub="Utu Grip"}
    sets.weapons.Naegling = {main="Naegling"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Idle Sets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Nyame Flanchard",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Loricate Torque +1",
        waist="Sailfi Belt +1",
        left_ear="Odnowa Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warden's Ring",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.Moving = {right_ring="Shneddick Ring"}

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
        neck="Dgn. Collar +2",
        waist="Sailfi Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Chirich Ring +1",
        right_ring="Niqmaddu Ring",
        back="Null Shawl",
    }

    -- sets.engaged.OneHand = {}

    sets.engaged.DT = set_combine(sets.engaged, {
        head="Hjarrandi Helm",
        body="Hjarrandi Breast.",
        -- neck="Loricate Torque +1",
        left_ring="Defending Ring",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weaponskill Sets --------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.WS = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        -- legs="Pelt. Cuissots +3", -- only while using Shining One - change when get a better polearm
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Ishvara Earring",
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Impulse Drive'] = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +3",
        body="Hjarrandi Breast.",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Impulse Drive'].PDL = {
        ammo="Knobkierrie",
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Gleti's Boots",
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Stardiver'] = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +3",
        body="Pelt. Plackart +3",
        hands="Pel. Vambraces +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Light Belt",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Stardiver'].PDL = set_combine(sets.WS['Stardiver'], {})

    sets.WS['Savage Blade'] = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- JA Sets -----------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.JA['Spirit Surge'] = {body="Ptero. Mail +3"}
    sets.JA['Call Wyvern'] = {body="Ptero. Mail +3"}
    sets.JA['Ancient Circle'] = {legs="Vishap Brais +3"}

    sets.JA['Spirit Link'] = {}

    sets.JA['Steady Wing'] = {}

    sets.JA['Jump'] = {
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.JA['High Jump'] = sets.JA['Jump']
    sets.JA['Spirit Jump'] = sets.JA['Jump']
    sets.JA['Soul Jump'] = set_combine(sets.JA['Jump'], {body="Vishap Mail +3", hands="Emi. Gauntlets +1", legs=gear.Valo_STP_legs})
    sets.JA['Super Jump'] = {}

    sets.JA['Angon'] = {ammo="Angon", hands="Ptero. Fin. G. +3"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Magic  Sets ------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Fast cast sets for spells
    sets.FC = {}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Magic Midcast Sets ------------------------------------
    ------------------------------------------------------------------------------------------------

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Other Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

end
