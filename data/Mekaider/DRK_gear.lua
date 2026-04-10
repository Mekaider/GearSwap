function user_setup()
    state.MeleeMode:options('TP', 'DT')
    state.WeaponMode = M{['description']='Weapon', 'Caladbolg', 'Apocalypse', 'Naegling'}
end

function user_unload()
end

function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.weapons.Caladbolg = {main="Caladbolg", sub="Utu Grip"}
    sets.weapons.Apocalypse = {main="Apocalypse", sub="Utu Grip"}
    sets.weapons.Naegling = {main="Naegling", sub="Blurred Shield +1"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Idle Sets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Elite Royal Collar",
        waist="Carrier's Sash",
        left_ear="Alabaster Earring",
        right_ear="Eabani Earring",
        left_ring=gear.left_moonlight_ring,
        right_ring=gear.right_moonlight_ring,
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Flam. Zucchetto +2",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Ig. Flanchard +3",
        feet="Flam. Gambieras +2",
        neck={ name="Abyssal Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Moonlight Ring",
        back="Null Shawl",
    }

    sets.engaged.DT = set_combine(sets.engaged, {
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        left_ring=gear.left_moonlight_ring,
        right_ring=gear.right_moonlight_ring,
    })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weaponskill Sets --------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.WS = {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Abyssal Beads +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Heath. Earring +1",
        left_ring="Cornelia's ring",
        right_ring="Sroda ring",
        back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Savage Blade'] = {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Heath. Earring +1",
        left_ring="Niqmaddu Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Resolution'] = set_combine(sets.WS, {
        head="Sakpata's Helm", --7/7
        body="Sakpata's Plate", --10/10
        hands="Sakpata's Gauntlets", --8/8
        legs="Sakpata's Cuisses", --9/9
        feet="Sakpata's Leggings", --6/6
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
    })

    sets.WS['Torcleaver'] = set_combine(sets.WS, {})

    -- sets.JA

    sets.precast.FastCast = {
        ammo="Sapience Orb",
        head="Sakpata's Helm",
        body="Sacro Breastplate",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        feet={ name="Odyssean Greaves", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','"Fast Cast"+6','STR+8','Mag. Acc.+1',}},
        neck="Voltsurge Torque",
        right_ear="Malignance Earring",
        left_ring="Kishar Ring",
        right_ring="Prolix Ring",
    }

    sets.midcast['Enfeebling Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Null Masque",
        body="Ignominy Cuirass +2",
        neck="Null Loop",
        waist="Null Belt",
        left_ear="Crep. Earring",
        right_ear="Malignance Earring",
        left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
        back="Null Shawl",
    }
    -- sets.midcast['Dark Magic']
    -- sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {})
end
