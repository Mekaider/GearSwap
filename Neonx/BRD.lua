-- Load and initialize the include file.
include('Mekaider-Include')

state.WeaponMode:options('Naegling', 'Carnwenhan')
state.MeleeMode:options('TP')
state.WeaponLock:set(true)

function get_sets()
    sets.instruments.Potency = {range="Gjallarhorn"}
    sets.instruments.ExtraSongs = {range="Daurdabla"}
    sets.instruments.LullabyHarp = {range="Daurdabla"}
    sets.instruments.MiracleCheer = {range="Miracle Cheer"}

    sets.weapons.Songs = {main="Carnwenhan", sub="Kali"}

    sets.weapons.Naegling = {main="Naegling", sub="Centovente"}
    sets.weapons.Carnwenhan = {main="Carnwenhan", sub="Gleti's Knife"}
    sets.weapons.Shield = {sub="Ammurapi Shield"}

    sets.Moving = {right_ring="Shneddick Ring"}
    
    sets.idle = {
        range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
        head="Fili Calot +3",
        body="Bunzi's Robe",
        hands="Bunzi's Gloves",
        legs="Bunzi's Pants",
        feet="Bunzi's Sabots",
        neck="Elite Royal Collar",
        waist="Null Belt",
        left_ear="Etiolation Earring",
        right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},      
        left_ring={name="Moonlight Ring", bag="wardrobe1", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe2", priority=2},
        back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
      }

    sets.engaged = {
        range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
        head="Aya. Zucchetto +2",
        body="Ashera Harness",
        hands="Bunzi's Gloves",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bard's Charm +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring={name="Moonlight Ring", bag="wardrobe1", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe2", priority=2},
        back="Null Shawl",
    }

    -- acts as fallback set, if DW required > 21
    sets.engaged.DualWield = set_combine(sets.engaged, {
        hands={ name="Gazu Bracelets +1", augments={'Path: A'}}, -- needed to cap gear haste, ideally wouldn't need these here
        waist="Reiki Yotai",
        left_ear="Eabani Earring",
        right_ear="Suppanomimi",
        back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    }) -- 26DW

    sets.engaged.DualWield.Naegling = set_combine(sets.engaged.DualWield, {
        hands={ name="Gazu Bracelets +1", augments={'Path: A'}}, -- used for acc with TP bonus offhand
    })

    sets.engaged.DualWield.NoDW = sets.engaged
    sets.engaged.DualWield.Naegling.NoDW = set_combine(sets.engaged.DualWield.NoDW, {
        hands={ name="Gazu Bracelets +1", augments={'Path: A'}}, -- used for acc with TP bonus offhand
    })

    sets.engaged.DualWield.MinDW = set_combine(sets.engaged, {
        left_ear="Eabani Earring",
        right_ear="Suppanomimi",
    }) -- 9 DW required

    sets.engaged.DualWield.Naegling.MinDW = set_combine(sets.engaged.DualWield.MinDW, {
        hands={ name="Gazu Bracelets +1", augments={'Path: A'}}
    })

    sets.engaged.DualWield.LowDW = set_combine(sets.engaged, {
        hands={ name="Gazu Bracelets +1", augments={'Path: A'}}, -- needed to cap gear haste, ideally wouldn't need these here
        waist="Reiki Yotai",
        left_ear="Eabani Earring",
    }) -- 11 DW required

    sets.engaged.DualWield.Naegling.LowDW = set_combine(sets.engaged.DualWield.LowDW, {
        hands={ name="Gazu Bracelets +1", augments={'Path: A'}}
    })

    sets.engaged.DualWield.MidDW = set_combine(sets.engaged, {
        hands={ name="Gazu Bracelets +1", augments={'Path: A'}}, -- needed to cap gear haste, ideally wouldn't need these here
        waist="Reiki Yotai",
        left_ear="Eabani Earring",
        back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    }) -- 21 DW required -- @19

    sets.engaged.DualWield.Naegling.MidDW = set_combine(sets.engaged.DualWield.MidDW, {
        hands={ name="Gazu Bracelets +1", augments={'Path: A'}}, -- used for acc with TP bonus offhand
    })

    sets.WS = {
        range={ name="Linos", augments={'Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bard's Charm +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        left_ring={name="Moonlight Ring", bag="wardrobe1", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe2", priority=2},
        back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Savage Blade'] = {
        range={ name="Linos", augments={'Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        left_ring="Moonlight Ring",
        right_ring="Cornelia's Ring",
        back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    } 

    sets.JA = {}

    sets.precast.FastCast = {
        head="Bunzi's Hat",
        body="Inyanga Jubbah +2",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Aya. Cosciales +2",
        feet="Bunzi's Sabots",
        left_ear="Etiolation Earring",
        left_ring="Kishar Ring",
        back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.precast.FastCast['BardSong'] = set_combine(sets.precast.FastCast, {head="Fili Calot +3"})

    sets.midcast.Songs.Potency = {
        head="Fili Calot +3",
        body="Fili Hongreline +3",
        hands="Fili Manchettes",
        legs="Inyanga Shalwar +2",
        feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        waist="Flume Belt +1",
        -- left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=3},
        left_ear={ name="Etiolation Earring", priority=1}, -- 1
        left_ring={name="Moonlight Ring", bag="wardrobe1", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe2", priority=2},
        back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},    
    }

    sets.midcast.Songs.Enfeebling = {
        head="Fili Calot +3",
        body="Fili Hongreline +3",
        hands="Fili Manchettes",
        legs="Inyanga Shalwar +2",
        feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        waist="Flume Belt +1",
        left_ear="Regal Earring",
        right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},      left_ring={name="Moonlight Ring", bag="wardrobe1", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe2", priority=2},
        back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},    
    }

    sets.midcast['Horde Lullaby II'] = {
        head="Fili Calot +3",
        body="Fili Hongreline +3",
        hands="Inyan. Dastanas +2",
        legs="Inyanga Shalwar +2",
        feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        left_ear={ name="Etiolation Earring", priority=1}, -- 1
        right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},      left_ring={name="Moonlight Ring", bag="wardrobe1", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe2", priority=2},
        back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},  
      }

    sets.midcast.Carol = {hands="Mousai Gages +1"}
    sets.midcast.Etude = {head="Mousai Turban +1"}
    sets.midcast.Lullaby = {body="Fili Hongreline +3"}
    sets.midcast.Madrigal = {head="Fili Calot +3", feet="Bunzi's Sabots"} -- feet="Fili Cothurnes +1"}
    sets.midcast.Mambo = {feet="Mou. Crackows +1"}
    sets.midcast.March = {hands="Fili Manchettes"}
    sets.midcast.Minne = {legs="Mou. Seraweels +1"}
    sets.midcast.Minuet = {body="Fili Hongreline +3"}
    sets.midcast.Paeon = {} -- {head="Brioso Roundlet +3"}
    sets.midcast.Prelude = {feet="Fili Cothurnes +1"}
    sets.midcast.Threnody = {body="Mou. Manteel +1"}
    -- sets.midcast['Adventurer\'s Dirge'] = {} -- {range="Marsyas", hands="Bihu Cuffs +3"}
    -- sets.midcast['Foe Sirvente'] = {} -- {head="Bihu Roundlet +3"}
    -- sets.midcast['Magic Finale'] = {} -- {legs="Fili Rhingrave +1"}
    -- sets.midcast["Sentinel's Scherzo"] = {} -- {feet="Fili Cothurnes +1"}
    -- sets.midcast["Chocobo Mazurka"] = {} -- {range="Marsyas"}

    sets.midcast['Enhancing Magic'] = {
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
        hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
        feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +8',}},
        waist="Embla Sash",
    }

end
