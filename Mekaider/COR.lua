-- Load and initialize the include file.
include('Mekaider-Include')
send_command('gs c update')

lockstyle_set = 21
set_lockstyle(lockstyle_set)

-- state.DebugMode:set(true)

state.WeaponMode:options(
    'SavageBlade',
    'Evisceration',
    'AeolianEdge',
    'Leaden(M)',
    'Leaden(R)',
    'LastStand(M)',
    'LastStand(R)',
    'HotShot(M)',
    'Unlocked'
)
state.WeaponMode:set('SavageBlade')
state.MeleeMode:options('TP', 'DT')
state.MeleeMode:set('DT')

function get_sets() 
    sets.weapons['SavageBlade'] = {main="Naegling", sub="Gleti's Knife", ranged="Ataktos"}
    sets.weapons['Evisceration'] = {main="Tauret", sub="Gleti's Knife", ranged="Ataktos"}
    sets.weapons['AeolianEdge'] = {main="Tauret", sub="Naegling", ranged="Ataktos"}
    sets.weapons['Leaden(M)'] = {
        main={ name="Rostam", augments={'Path: B'}, bag="Wardrobe 1"},
        sub="Tauret",
        ranged="Death Penalty"
    }
    sets.weapons['Leaden(R)'] = {
        main={ name="Rostam", augments={'Path: B'}, bag="Wardrobe 1"}, 
        sub="Kustawi +1",
        ranged="Death Penalty",
    }
    sets.weapons['LastStand(M)'] = {
        main={ name="Rostam", augments={'Path: B'}, bag="Wardrobe 1"},
        sub="Gleti's Knife",
        ranged="Fomalhaut"
    }
    sets.weapons['LastStand(R)'] = {
        main={ name="Rostam", augments={'Path: B'}, bag="Wardrobe 1"}, 
        sub="Kustawi +1",
        ranged="Fomalhaut"
    }
    sets.weapons['HotShot(M)'] = {
        main={ name="Rostam", augments={'Path: B'}, bag="Wardrobe 1"},
        sub="Tauret",
        ranged="Fomalhaut"
    }
    sets.weapons['HotShot(R)'] = {
        main="Naegling",
        sub="Tauret",
        ranged="Fomalhaut"
    }
    sets.weapons.Shield = {sub="Nusku Shield"}

    ammo.bullet.RA = "Chrono Bullet"
    ammo.bullet.WS = "Chrono Bullet"
    ammo.bullet.MAB = "Living Bullet"
    ammo.bullet.QD = "Living Bullet"


    sets.Moving = {right_ring="Shneddick Ring"}
    
    sets.idle = {
        ammo=ammo.bullet.RA,
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Elite Royal Collar",
        waist="Carrier's Sash",
        left_ear="Odnowa Earring +1",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Purity Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged = {
        ammo=ammo.bullet.RA,
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','VIT+5',}},
        neck="Iskur Gorget",
        waist="Sailfi Belt +1",
        left_ear="Telos Earring",
        right_ear="Cessance Earring",
        left_ring="Petrov Ring",
        right_ring="Epona's Ring",
        back="Null Shawl",
    }

    sets.engaged.DT = set_combine(sets.engaged, {
        head = "Malignance Chapeau", -- 6/6
        body = "Malignance Tabard", -- 9/9
        hands = "Malignance Gloves", -- 5/5
        legs = "Malignance Tights", -- 7/7
        feet = "Malignance Boots", -- 4/4
        left_ring = "Defending Ring", -- 10/10
        -- legs="Chas. Culottes +3", --12/12
    })

    -- doubles as MaxDW set
    sets.engaged.DualWield = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        hands={ name="Floral Gauntlets", augments={'Rng.Acc.+14','Accuracy+13','"Triple Atk."+2','Magic dmg. taken -3%',}}, -- 5
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}, -- 6
        waist="Reiki Yotai", -- 7
        left_ear="Suppanomimi", -- 5
        right_ear="Eabani Earring", -- 4
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

    sets.engaged.DualWield.LowDW = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        left_ear="Suppanomimi", -- 5
    })

    sets.engaged.DualWield.MidDW = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        right_ear="Suppanomimi", -- 5
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

    sets.engaged.DualWield.DT = set_combine(sets.engaged.DT, {
        waist="Reiki Yotai", -- 7
        left_ear="Eabani Earring", -- 4
        right_ear="Suppanomimi", -- 5
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

    sets.engaged.DualWield.DT.LowDW = set_combine(sets.engaged, {
        waist="Reiki Yotai", -- 7
        left_ear="Eabani Earring", -- 4   
    })

    sets.engaged.DualWield.DT.MidDW = set_combine(sets.engaged, {
        waist="Reiki Yotai", -- 7
        left_ear="Eabani Earring", -- 4
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

    sets.precast.RA = {
        ammo=ammo.bullet.RA,
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
		feet="Meg. Jam. +1", -- 10/0
		neck={ name="Comm. Charm +2", augments={'Path: A',}}, -- 4/0
    }

    sets.precast.RA.Flurry = sets.precast.RA
    sets.precast.RA.FlurryII = sets.precast.RA

    sets.midcast.RA = {
        ammo=ammo.bullet.RA,
        head="Ikenga's Hat",
        body="Ikenga's Vest",
        hands="Ikenga's Gloves",
        legs="Ikenga's Trousers",
        feet="Ikenga's Clogs",
        neck="Iskur Gorget",
        waist="Yemaya Belt",
        left_ear="Telos Earring",
        right_ear="Dedition Earring",
        left_ring="Cacoethic Ring +1",
        right_ring="Dingir Ring",
        back="Gunslinger's Cape",
    }

    sets.PhantomRoll = {
        main={ name="Rostam", augments={'Path: C'}, bag="Wardrobe 1", priority=1},
        range="Compensator",
		head={ name="Lanun Tricorne", augments={'Enhances "Winning Streak" effect',}}, -- 50% Job ability Bonus
		hands="Chasseur's Gants +3", --60 sec Duration
		neck="Regal Necklace", -- 20 sec Duration
		right_ring="Luzaf's Ring", -- 16 yalm range
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.PhantomRoll["Caster's Roll"] = {}
    sets.PhantomRoll["Courser's Roll"] = {}
    sets.PhantomRoll["Blitzer's Roll"] = {}
    sets.PhantomRoll["Tactician's Roll"] = {}
    sets.PhantomRoll["Allies' Roll"] = set_combine(sets.PhantomRoll, {hands="Chasseur's Gants +3"})

    sets.QuickDraw = {
        ammo=ammo.bullet.QD,
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Carmine Fin. Ga. +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
        left_ear="Hecate's Earring",
        right_ear="Friomisi Earring",
        -- ring1="Dingir Ring",
        -- ring2={name="Fenrir Ring +1", bag="wardrobe6"},
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Mag. Evasion+15',}},    
        waist="Skrymir Cord +1",
    }

    sets.QuickDraw.Enhance = set_combine(sets.QuickDraw, {feet=""})

    sets.QuickDraw.StoreTP = {
        ammo=ammo.bullet.QD,
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",  
    }

    sets.QuickDraw['Light Shot'] = {}
    sets.QuickDraw['Light Shot'].Enhance = set_combine(sets.QuickDraw['Light Shot'], {feet=""})
    sets.QuickDraw['Dark Shot'] = sets.QuickDraw['Light Shot']
    sets.QuickDraw['Dark Shot'].Enhance = set_combine(sets.QuickDraw['Dark Shot'], {feet=""})

    sets.WS = {
        ammo=ammo.bullet.WS,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        left_ear="Moonshade Earring",
        right_ear="Ishvara Earring",
        left_ring="Epaminondas's Ring",
		right_ring="Regal Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        waist="Windbuffet Belt +1",
    }

    sets.WS['Savage Blade'] = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Chasseur's Gants +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist="Windbuffet Belt +1",
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Regal Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    -- sets.WS['Hot Shot'] = {}
    -- sets.WS['Hot Shot'].PDL = {}

    sets.WS['Last Stand'] = {
        ammo=ammo.bullet.WS,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Chasseur's Gants +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Iskur Gorget",
        waist="Light Belt",
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Dingir Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Wildfire'] = {
        ammo=ammo.bullet.MAB,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Comm. Charm +2", augments={'Path: A',}},
        waist="Skrymir Cord",
        left_ear="Crematio Earring",
        right_ear="Friomisi Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Dingir Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Mag. Evasion+15',}},
    }

    sets.WS['Leaden Salute'] = set_combine(sets.WS['Wildfire'], {
        -- head="Pixie Hairpin +1",
        ear1="Moonshade Earring",
        -- ring1="Archon Ring",
    })

    sets.WS['Aeolian Edge'] = sets.WS['Wildfire']

    sets.Obi = {waist="Hachirin-no-Obi"}
end
