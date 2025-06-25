function user_setup() end

function init_gear_sets()
    sets.weapons['SavageBlade'] = {main="Naegling", sub="Thibron"}
    sets.weapons['SeraphBlade'] = {main={ name="Crocea Mors", augments={'Path: C',}}, sub="Daybreak"}
    sets.weapons['BlackHalo'] = {main="Maxentius", sub="Thibron"}
    sets.weapons['Evisceration'] = {main="Tauret", sub="Gleti's Knife"}
    sets.weapons['AeolianEdge'] = {main="Tauret", sub="Thibron"}

    sets.weapons.Shield = {sub="Sacro Bulwark"}

    sets.idle = {
        main="Daybreak",
        sub="Sacro Bulwark",
        ammo="Staunch Tathlum +1",
        head={ name="Vitiation Chapeau", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="Shamash Robe",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Lengo Pants", augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Stikini Ring +1",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Anu Torque",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Petrov Ring",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    }

    -- High DW
    sets.engaged.DualWield = set_combine(sets.engaged, {
        waist="Reiki Yotai",
        left_ear="Suppanomimi",
        right_ear="Eabani Earring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

    -- 11 DW
    sets.engaged.DualWield.LowDW = set_combine(sets.engaged, {
        waist="Reiki Yotai",
        right_ear="Eabani Earring",
    })

    -- 21 DW
    sets.engaged.DualWield.MidDW = set_combine(sets.engaged, {
        waist="Reiki Yotai",
        right_ear="Eabani Earring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

    -- sets.WS = {}

    sets.WS['Savage Blade'] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Sroda Ring",
        right_ring="Cornelia's Ring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    }

    sets.WS['Black Halo'] = sets.WS['Savage Blade']

    -- sets.JA = {}

    sets.precast.FastCast = {
        body={ name="Vitiation Tabard", augments={'Enhances "Chainspell" effect',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="Lengo Pants", augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1',}},
        neck="Voltsurge Torque",
        left_ear="Malignance Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Kishar Ring",
        right_ring="Prolix Ring",
    }

    sets.midcast.Cure = {
        main="Daybreak",
        sub="Sacro Bulwark",
        ammo="Pemphredo Tathlum",
        head={ name="Vitiation Chapeau", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="Bunzi's Robe",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        neck="Sibyl Scarf",
        waist="Sacro Cord",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring="Defending Ring",
        right_ring="Stikini Ring +1",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    }

    -- sets.midcast.NaSpell = {}

    -- sets.midcast.Cursna = {}

    sets.midcast['Enhancing Magic'] = {}

    sets.midcast['Enhancing Magic'].Skill = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast['Enhancing Magic'].Composure = sets.midcast['Enhancing Magic']

    sets.midcast['Enhancing Magic'].Composure.Others = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast.Refresh = {}

    -- sets.midcast.BarElement = {}

    sets.midcast['Enfeebling Magic'] = {}

    sets.midcast['Enfeebling Magic'].Immunobreak = set_combine(sets.midcast['Enfeebling Magic'], {})

    -- Potency set
    sets.midcast['Enfeebling Magic'].Potency = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Enfeebling Magic'].Potency.Immunobreak = set_combine(sets.midcast['Enfeebling Magic'].Potency, {})

    sets.midcast['Enfeebling Magic'].Duration = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Enfeebling Magic'].Duration.MagicAcc = set_combine(sets.midcast['Enfeebling Magic'].Duration, {})

    sets.midcast['Enfeebling Magic'].Duration.Immunobreak = set_combine(sets.midcast['Enfeebling Magic'].Duration, {})

    sets.midcast['Elemental Magic'] = {
        main={ name="Bunzi's Rod", augments={'Path: A',}},
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Bunzi's Hat",
        body="Shamash Robe",
        hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs="Bunzi's Pants",
        feet="Bunzi's Sabots",
        neck="Sibyl Scarf",
        waist="Sacro Cord",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring="Freke Ring",
        right_ring="Metamorph Ring",
        back="Null Shawl",
    }

    sets.midcast['Elemental Magic'].MagicAcc = set_combine(sets.midcast['Elemental Magic'], {})

    -- sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Dark Magic'] = {}

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.buff['Sublimation: Activated'] = {waist="Embla Sash"}
end
