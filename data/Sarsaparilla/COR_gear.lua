function user_setup()
    state.WeaponMode:options(
        'SavageBlade',
        'Evisceration',
        'AeolianEdge',
        'Leaden(M)',
        'Leaden(R)',
        'LastStand(M)',
        'LastStand(R)',
        'HotShot(M)'
    )
    state.MeleeMode:options('Normal', 'DT')
    -- state.MeleeMode:set('DT')
end

function init_gear_sets()
    sets.weapons['SavageBlade'] = { main = "Naegling", sub = "Gleti's Knife", ranged = "Ataktos" }
    sets.weapons['Evisceration'] = { main = "Tauret", sub = "Gleti's Knife", ranged = "Ataktos" }
    sets.weapons['AeolianEdge'] = { main = "Tauret", sub = "Naegling", ranged = "Ataktos" }
    sets.weapons['Leaden(M)'] = {
        main = { name = "Rostam", augments = { 'Path: B' }},
        sub = "Tauret",
        ranged = "Molybdosis"
    }
    sets.weapons['Leaden(R)'] = {
        main = { name = "Rostam", augments = { 'Path: B' }},
        sub = "Kustawi +1",
        ranged = "Molybdosis",
    }
    sets.weapons['LastStand(M)'] = {
        main = { name = "Rostam", augments = { 'Path: B' }},
        sub = "Gleti's Knife",
        ranged = "Fomalhaut"
    }
    sets.weapons['LastStand(R)'] = {
        main = { name = "Rostam", augments = { 'Path: B' }},
        sub = "Kustawi +1",
        ranged = "Fomalhaut"
    }
    sets.weapons['HotShot(M)'] = {
        main = { name = "Rostam", augments = { 'Path: B' }},
        sub = "Tauret",
        ranged = "Fomalhaut"
    }
    sets.weapons['HotShot(R)'] = {
        main = "Naegling",
        sub = "Tauret",
        ranged = "Fomalhaut"
    }
    sets.weapons.Shield = { sub = "Nusku Shield" }

    ammo.bullet.RA = "Chrono Bullet"
    ammo.bullet.WS = "Chrono Bullet"
    ammo.bullet.MAB = "Chrono Bullet"
    ammo.bullet.QD = "Chrono Bullet"

    sets.idle = {
        ammo = ammo.bullet.RA,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Elite Royal Collar",
        waist="Flume Belt +1",
        left_ear="Infused Earring",
        right_ear="Etiolation Earring",
        left_ring="Defending Ring",
        right_ring="Warden's Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged = {
        ammo=ammo.bullet.RA,
        head="Malignance Chapeau",
        body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet="Malignance Boots", -- 4/4
		neck="Iskur Gorget",
		waist="sailfi belt +1",
		left_ear="Telos Earring",
        right_ear="Crep. Earring",
		left_ring="Rajas Ring",
		right_ring="Petrov Ring",
		back="Null Shawl"
	}

    sets.engaged.DT = set_combine(sets.engaged, {
        head="Malignance Chapeau",  -- 6/6
        body="Malignance Tabard",   -- 9/9
        hands="Malignance Gloves",  -- 5/5
        legs="Chas. Culottes +3", --12/12
        feet="Malignance Boots",    -- 4/4
        left_ring="Defending Ring", -- 10/10
    })

    -- doubles as MaxDW set
    sets.engaged.DualWield = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, -- 6
        hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
        -- legs = { name = "Carmine Cuisses +1", augments = { 'Accuracy+20', 'Attack+12', '"Dual Wield"+6', } },               -- 6
        waist = "Reiki Yotai",
        left_ear="Suppanomimi",                                                                                           -- 5
        right_ear="Eabani Earring",                                                                                       -- 4
        back={name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    }) -- depends on 2% haste from Gleti's offhand to cap

    sets.engaged.DualWield.DT = set_combine(sets.engaged.DT, {
  		hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
        waist="Reiki Yotai",     -- 7
        left_ear="Suppanomimi", -- 4
        right_ear="Eabani Earring", -- 5
        back={name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    }) -- depends on 2% haste from Gleti's offhand to cap

    sets.engaged.DualWield.NoDW = set_combine(sets.engaged)
    sets.engaged.DualWield.DT.NoDW = set_combine(sets.engaged.DT)

    -- 9 DW required
    sets.engaged.DualWield.MinDW = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, -- 6
        right_ear="Eabani Earring", -- 4
    })
    sets.engaged.DualWield.DT.MinDW = set_combine(sets.engaged.DT, {
        left_ear="Suppanomimi",                                                                                           -- 5
        right_ear="Eabani Earring",
    })

    -- 11 DW required
    sets.engaged.DualWield.LowDW = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, -- 6
        -- waist="Reiki Yotai",     -- 7
        right_ear="Suppanomimi", -- 5
    })

    sets.engaged.DualWield.DT.LowDW = set_combine(sets.engaged.DT, {
        waist = "Reiki Yotai",     -- 7
        right_ear = "Eabani Earring", -- 4
    }) -- depends on 2% haste from Gleti's offhand to cap

    -- 21 DW required
    sets.engaged.DualWield.MidDW = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, -- 6
        right_ear="Suppanomimi", -- 5
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

    sets.engaged.DualWield.DT.MidDW = set_combine(sets.engaged.DT, {
        waist = "Reiki Yotai",     -- 7
        right_ear = "Eabani Earring", -- 4
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

    sets.precast.RA = {
        ammo = ammo.bullet.RA,
        feet="Meg. Jam. +2", -- 10/0
        neck = { name = "Comm. Charm +2", augments = { 'Path: A', } },
        waist="Yemaya Belt", --0/5
        right_ring="Crepuscular Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Mag. Evasion+15',}},
    }

    sets.precast.RA.Flurry = set_combine(sets.precast.RA)
    sets.precast.RA.FlurryII = set_combine(sets.precast.RA)

    sets.midcast.RA = {
        ammo = ammo.bullet.RA,
        head="Ikenga's Hat",
        body="Chasseur's Frac +3",
        hands="Ikenga's Gloves",
        legs="Chas. Culottes +3",
        feet="Ikenga's Clogs",
        neck="Iskur Gorget",
        waist="Yemaya Belt",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Rajas Ring",
        right_ring="Crepuscular Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Mag. Evasion+15',}},
    }

    sets.PhantomRoll = {
        main={ name="Rostam", augments={'Path: C'}, bag="Wardrobe 2", priority=1},
        range={ name="Compensator", augments={'DMG:+15','Rng.Acc.+15','Rng.Atk.+15',}},
		head={ name="Lanun Tricorne", augments={'Enhances "Winning Streak" effect',}}, -- 50% Job ability Bonus
        hands="Chasseur's Gants +3",
		neck="Regal Necklace", -- 20 sec Duration
		left_ring="Luzaf's Ring", -- 16 yalm range
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.PhantomRoll["Caster's Roll"] = set_combine(sets.PhantomRoll, {legs="Chas. Culottes +3"})
    sets.PhantomRoll["Courser's Roll"] = set_combine(sets.PhantomRoll, {feet="Chass. Bottes +3"})
    sets.PhantomRoll["Blitzer's Roll"] = set_combine(sets.PhantomRoll, {head="Chass. Tricorne +3"})
    sets.PhantomRoll["Tactician's Roll"] = set_combine(sets.PhantomRoll, {body="Chasseur's Frac +3"})
    sets.PhantomRoll["Allies' Roll"] = set_combine(sets.PhantomRoll, {hands="Chasseur's Gants +3"})

    sets.QuickDraw = {
        ammo = ammo.bullet.QD,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
        neck={ name="Comm. Charm +2", augments={'Path: A',}},
        waist="Eschan Stone",
        left_ear="Hermetic Earring",
        left_ring="Kishar Ring",
        right_ring="Dingir Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Mag. Evasion+15',}},
    }

    sets.QuickDraw.Enhance = set_combine(sets.QuickDraw, {feet="Chass. Bottes +3"})

    sets.QuickDraw.StoreTP = {
        ammo = ammo.bullet.QD,
        head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
        legs="Chas. Culottes +3",
		feet="Malignance Boots",
    }

    sets.QuickDraw['Light Shot'] = {}
    sets.QuickDraw['Light Shot'].Enhance = set_combine(sets.QuickDraw['Light Shot'], {feet="Chass. Bottes +3"})
    sets.QuickDraw['Dark Shot'] = set_combine(sets.QuickDraw['Light Shot'])
    sets.QuickDraw['Dark Shot'].Enhance = set_combine(sets.QuickDraw['Dark Shot'], {feet="Chass. Bottes +3"})

    sets.WS = {
        ammo=ammo.bullet.WS,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Chasseur's Gants +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Ishvara Earring",
        right_ear="Telos Earring",
        left_ring="Cornelia's Ring",
        right_ring="Vehemence Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Savage Blade'] = {
        ammo=ammo.bullet.WS,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Chasseur's Gants +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Cornelia's Ring",
        right_ring="Vehemence Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }



    sets.WS['Last Stand'] = {
        ammo=ammo.bullet.WS,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Chasseur's Gants +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
        neck="Rep. Plat. Medal",
        waist="Light Belt",
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Cornelia's Ring",
        right_ring="Dingir Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Wildfire'] = {
        ammo = ammo.bullet.MAB,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
        neck={ name="Comm. Charm +2", augments={'Path: A',}},
        waist="Eschan Stone",
        left_ear="Hermetic Earring",
        right_ear="Ishvara Earring",
        left_ring="Cornelia's Ring",
        right_ring="Dingir Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Mag. Evasion+15',}},
    }

    sets.WS['Hot Shot'] = set_combine(sets.WS['Wildfire'])
    -- sets.WS['Hot Shot'].PDL = {}

    sets.WS['Leaden Salute'] = set_combine(sets.WS['Wildfire'], {
        head="Pixie Hairpin +1",
        ear1 = "Moonshade Earring",
    })

    sets.WS['Aeolian Edge'] = set_combine(sets.WS['Wildfire'])

    sets.WS['Burning Blade'] = set_combine(sets.WS['Wildfire'])
    sets.WS['Red Lotus Blade'] = set_combine(sets.WS['Wildfire'])

    -- sets.Obi = { waist = "Hachirin-no-Obi" }
end
