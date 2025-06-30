function user_setup()
    state.WeaponLock:set(true)
end

function init_gear_sets()
    sets.weapons['SavageBlade'] = {main="Naegling", sub="Machaera +2"}
    sets.weapons['SeraphBlade'] = {main={ name="Crocea Mors", augments={'Path: C',}}, sub="Daybreak"}
    sets.weapons['BlackHalo'] = {main="Maxentius", sub="Machaera +2"}
    sets.weapons['Evisceration'] = {main="Tauret", sub="Gleti's Knife"}
    sets.weapons['AeolianEdge'] = {main="Tauret", sub="Machaera +2"}

    sets.weapons.Shield = {sub="Sacro Bulwark"}

    sets.Moving = {right_ring="Shneddick Ring"}

    sets.idle = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="Lethargy Sayon +3",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Loricate Torque +1",
        waist="Null Belt",
        left_ear="Etiolation Earring",
        right_ear="Infused Earring",
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring={name="Stikini Ring +1", bag="wardrobe2"},
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Anu Torque",
        waist="Sailfi Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring={name="Chirich Ring +1", bag="wardrobe1"},
        right_ring={name="Chirich Ring +1", bag="wardrobe2"},
        back="Null Shawl",
    }

    -- High DW
    sets.engaged.DualWield = set_combine(sets.engaged, {
        waist="Reiki Yotai",
        -- left_ear="Suppanomimi",
        left_ear="Eabani Earring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

    -- 0 DW
    sets.engaged.DualWield.NoDW = sets.engaged

    -- 11 DW
    sets.engaged.DualWield.LowDW = set_combine(sets.engaged, {
        waist="Reiki Yotai",
        left_ear="Eabani Earring",
    })

    -- 21 DW
    sets.engaged.DualWield.MidDW = set_combine(sets.engaged, {
        waist="Reiki Yotai",
        left_ear="Eabani Earring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

    sets.WS = {
        ammo="Coiste Bodhar",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Leth. Houseaux +3",
        neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        left_ring="Chirich Ring +1",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Savage Blade'] = {
        ammo="Oshasha's Treatise",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Leth. Houseaux +3",
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        left_ring="Cornelia's Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Black Halo'] = sets.WS['Savage Blade']

    sets.WS['Seraph Blade'] = {
        ammo="Ghastly Tathlum",
        head="Leth. Chappel +3",
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
        neck="Sibyl Scarf",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Moonshade Earring",
        left_ring="Cornelia's Ring",
        right_ring="Freke Ring",
        back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Aeolian Edge'] = sets.WS['Seraph Blade']

    sets.WS['Sanguine Blade'] = {
        ammo="Ghastly Tathlum",
        head="Leth. Chappel +3",
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
        neck="Sibyl Scarf",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
        left_ring="Cornelia's Ring",
        right_ring="Freke Ring",
        back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.JA = {}

    sets.precast.FastCast = {
        head="Atro. Chapeau +2",
        body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
        neck="Voltsurge Torque",
        waist="Embla Sash",
        left_ear="Malignance Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
        back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.precast.FastCast.Dispelga = set_combine(sets.precast.FastCast, {main="Daybreak", sub="Ammurapi Shield"})

    sets.midcast.Cure = {
        main="Daybreak",
        sub="Sors Shield",
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body="Bunzi's Robe",
        hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="Loricate Torque +1",
        waist="Shinjutsu-no-Obi",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Gelatinous Ring",
        right_ring="Fortified Ring",
    }

    sets.midcast.NaSpell = {
        head="Vanya Hood",
        feet="Vanya Clogs",
    }

    -- sets.midcast.Cursna = {}

    sets.midcast['Enhancing Magic'] = {
        -- main=gear.Colada_ENH,
        sub="Ammurapi Shield",
		-- ammo="Staunch Tathlum",
		body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
        hands="Atrophy Gloves +2",
        feet="Leth. Houseaux +3",
		neck="Dls. Torque +2", --25
        waist="Embla Sash",
		-- left_ring="Stikini Ring +1",
		-- right_ring="Stikini Ring +1",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
        back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +9','Enh. Mag. eff. dur. +20',}},
    }

    sets.midcast['Enhancing Magic'].Skill = set_combine(sets.midcast['Enhancing Magic'], {
        body="Viti. Tabard +1",
        -- hands="Viti. Gloves +3",
        legs="Atrophy Tights",
        feet="Leth. Houseaux +3",
    })

    sets.midcast['Enhancing Magic'].Composure = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast['Enhancing Magic'].Composure.Others = set_combine(sets.midcast['Enhancing Magic'], {
        head="Leth. Chappel +3",
        body="Lethargy Sayon +3",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
    })

    sets.midcast.Refresh = {
        -- head="Amalric Coif +1", -- +1
        body="Atrophy Tabard +2", -- +3
        legs="Leth. Fuseau +3", -- +3
    }

    -- sets.midcast.BarElement = {}

    -- General enfeebling set for magic accuracy where potency and duration are not important
    sets.midcast['Enfeebling Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Regal Gem",
        head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs="Leth. Fuseau +3",
        feet="Viti. Boots +4",
        neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Obstin. Sash",
        left_ear="Malignance Earring",
        right_ear="Snotra Earring",
        -- right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast['Enfeebling Magic'].Immunobreak = set_combine(sets.midcast['Enfeebling Magic'], {
        legs={ name="Chironic Hose", augments={'MND+8','Mag. Acc.+23','"Store TP"+6',}},
    })

    -- Potency set
    sets.midcast['Enfeebling Magic'].Potency = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Enfeebling Magic'].Potency.Immunobreak = set_combine(sets.midcast['Enfeebling Magic'].Potency, {
        legs={ name="Chironic Hose", augments={'MND+8','Mag. Acc.+23','"Store TP"+6',}},
    })

    sets.midcast['Enfeebling Magic'].Duration = set_combine(sets.midcast['Enfeebling Magic'], {
        head="Leth. Chappel +3",
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
    })

    sets.midcast['Enfeebling Magic'].Duration.MagicAcc = set_combine(sets.midcast['Enfeebling Magic'].Duration, {
        range="Ullr",
        ammo=empty,
    })

    sets.midcast['Enfeebling Magic'].Duration.Immunobreak = set_combine(sets.midcast['Enfeebling Magic'].Duration, {
        legs={ name="Chironic Hose", augments={'MND+8','Mag. Acc.+23','"Store TP"+6',}},
    })

    sets.midcast['Distract III'] = {
        main={ name="Bunzi's Rod", augments={'Path: A',}},
        sub="Ammurapi Shield",
        ammo="Regal Gem",
        head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs="Leth. Fuseau +3",
        feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
        neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Obstin. Sash",
        left_ear="Malignance Earring",
        right_ear="Snotra Earring",
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring={name="Stikini Ring +1", bag="wardrobe2"},
        back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast['Frazzle III'] = sets.midcast['Distract III']

    sets.midcast['Elemental Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum",
        head="Leth. Chappel +3",
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
        neck="Sibyl Scarf",
        waist="Eschan Stone",
        left_ear="Etiolation Earring",
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast['Elemental Magic'].MagicAcc = set_combine(sets.midcast['Elemental Magic'], {
        range="Ullr",
        ammo=empty,
    })

    -- sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {})

    -- todo: review this set
    sets.midcast['Dark Magic'] = {
        main={ name="Crocea Mors", augments={'Path: C',}},
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Leth. Chappel +3",
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
        neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
        left_ring="Kishar Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back="Null Shawl",
    }

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.buff['Sublimation: Activated'] = {waist="Embla Sash"}
end
