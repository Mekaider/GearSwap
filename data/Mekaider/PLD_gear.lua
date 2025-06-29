
function user_setup()
    state.WeaponMode:options('Burtgang', 'Moralltach', 'Naegling')
    state.ShieldMode:options('Priwen', 'Duban', 'Srivatsa', 'Aegis', 'Blurred Shield +1')
end

function init_gear_sets()
    sets.weapons["Burtgang"] = {main="Burtgang"}
    sets.weapons["Moralltach"] = {main={ name="Moralltach", augments={'Path: C',}}}
    sets.weapons["Naegling"] = {main="Naegling"}

    -- 3074 HP, no shield
	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",
		body="Sacro Breastplate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Elite Royal Collar",
		waist="Carrier's Sash",
        left_ear="Tuisto Earring",
		right_ear="Eabani Earring",
        left_ring=gear.left_moonlight_ring,
        right_ring=gear.right_moonlight_ring,
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
	}

    sets.idle.AoE = {
		ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Chev. Cuisses +3",
		feet="Sakpata's Leggings",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Flume Belt +1",
        left_ear="Tuisto Earring",
		right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
        left_ring=gear.left_moonlight_ring,
        right_ring=gear.right_moonlight_ring,
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }

    sets.Moving = {right_ring="Shneddick Ring"}

    sets.engaged = {
        ammo="Coiste Bodhar",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Null Loop",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
        left_ring=gear.left_moonlight_ring,
        right_ring=gear.right_moonlight_ring,
		back="Null Shawl",
    }

    sets.engaged.PDT = {
        ammo="Staunch Tathlum +1",
        head="Chev. Armet +3",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Chev. Cuisses +3",
        feet="Sakpata's Leggings",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Tuisto Earring",
        right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
        left_ring=gear.left_moonlight_ring,
        right_ring=gear.right_moonlight_ring,
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }

    sets.engaged.AoE = set_combine(sets.engaged.PDT, {waist="Flume Belt +1"})

    sets.engaged.Meva = {
        ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring=gear.left_moonlight_ring,
        right_ring=gear.right_moonlight_ring,
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }

    sets.engaged.DualWield = set_combine(sets.engaged, {
        left_ear="Eabani Earring", -- 4
        right_ear="Suppanomimi", -- 5
    })


    -- gear cap: 200
    -- Crusade +30
    -- Burtgang +23
    -- remaining 147
    sets.Enmity = {
		ammo="Sapience Orb",
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet="Chev. Sabatons +2",
        neck="Moonlight Necklace",
        waist="Creed Baudrier",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Apeile Ring +1",
        right_ring="Apeile Ring",
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }

    sets.WS = {
        ammo="Oshasha's Treatise",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Plat. Mog. Belt", priority=20},
        left_ear="Thrud Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=19},
        left_ring="Regal Ring",
        right_ring="Ephramad's Ring",
        back="Null Shawl",
    }

    sets.WS['Atonement'] = sets.Enmity

	sets.JA['Invincible'] = set_combine( sets.Enmity, { legs={ name="Cab. Breeches", augments={'Enhances "Invincible" effect',}} })
	sets.JA['Shield Bash'] = set_combine( sets.Enmity, { hands={ name="Cab. Gauntlets +2", augments={'Enhances "Chivalry" effect',}} })
	sets.JA['Holy Circle'] = set_combine( sets.Enmity, {})
	sets.JA['Sentinel'] = set_combine( sets.Enmity, {feet="Cab. Surcoat"})
	sets.JA['Cover'] = set_combine( sets.Enmity, { feet={ name="Cab. Leggings", augments={'Enhances "Guardian" effect',}} })
	sets.JA['Provoke'] = set_combine( sets.Enmity, {})
	sets.JA['Rampart'] = set_combine( sets.Enmity, { head={ name="Cab. Coronet", augments={'Enhances "Iron Will" effect',}} })
	sets.JA['Divine Emblem'] = set_combine( sets.Enmity, {feet="Chev. Sabatons +2"})
	sets.JA['Sepulcher'] = set_combine( sets.Enmity, {})
	sets.JA['Palisade'] = set_combine( sets.Enmity, {})
	sets.JA['Intervene'] = set_combine( sets.Enmity, {})
	sets.JA['Fealty'] = set_combine( sets.Enmity, {body="Cab. Surcoat"})
	sets.JA['Chivalry'] = set_combine( sets.Enmity, { hands={ name="Cab. Gauntlets +2", augments={'Enhances "Chivalry" effect',}} })
	sets.JA['Majesty'] = set_combine( sets.Enmity, {})

    sets.precast.FastCast = {
        ammo="Sapience Orb",
        head="Chev. Armet +3",
        body="Sacro Breastplate",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Sakpata's Cuisses",
        feet="Chev. Sabatons +2",
        neck="Voltsurge Torque",
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Kishar Ring",
        right_ring="Prolix Ring",
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.SIRD = {
        ammo="Staunch Tathlum +1", -- 11
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, -- 20
        legs={ name="Founder's Hose", augments={'MND+3','Breath dmg. taken -3%',}}, -- 30
        neck="Moonlight Necklace", -- 15
        feet={ name="Odyssean Greaves", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','"Fast Cast"+6','STR+8','Mag. Acc.+1',}}, -- 20
        waist="Audumbla Sash", -- 10
    } -- 106, 14% over considering merits

    sets.midcast.FastCast.SIRD = set_combine(sets.precast.FastCast, sets.midcast.SIRD)


    sets.midcast.Cure = {
        ammo="Sapience Orb",
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands="Macabre Gaunt. +1",
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Odyssean Greaves", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','"Fast Cast"+6','STR+8','Mag. Acc.+1',}},
        neck="Sacro Gorget",
        waist="Creed Baudrier",
        left_ear="Thureous Earring",
        right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
        left_ring=gear.left_moonlight_ring,
        right_ring=gear.right_moonlight_ring,
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }

    sets.midcast['Healing Magic'] = sets.midcast.Cure

    sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure, sets.midcast.SIRD)

    -- 3007 HP, no shield
    sets.midcast['Enhancing Magic'] = {
        ammo="Sapience Orb",
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body="Shab. Cuirass +1",
        hands="Regal Gauntlets",
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Thureous Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={name="Stikini Ring +1", bag="wardrobe3"},
        right_ring={name="Stikini Ring +1", bag="wardrobe4"},
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }

    sets.midcast['Protect'] = set_combine(sets.midcast['Enhancing Magic'], {
        main={ name="Moralltach", augments={'Path: C',}},
        sub="Srivatsa"
    })

    sets.midcast.Phalanx = {
        main="Sakpata's Sword",
        sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}},
        ammo="Staunch Tathlum +1",
        head={ name="Odyssean Helm", augments={'Pet: INT+4','INT+10','Phalanx +5','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
        body={ name="Odyss. Chestplate", augments={'MND+13','"Mag.Atk.Bns."+19','Phalanx +5','Accuracy+14 Attack+14',}},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs="Sakpata's Cuisses",
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Moonlight Necklace",
        waist="Audumbla Sash",
        left_ear="Thureous Earring",
        right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
        left_ring=gear.left_moonlight_ring,
        right_ring=gear.right_moonlight_ring,
        back={ name="Weard Mantle", augments={'VIT+1','DEX+1','Enmity+3','Phalanx +2',}},
    }

    sets.midcast.Phalanx.SIRD = set_combine(sets.midcast.Phalanx, sets.midcast.SIRD)

    sets.midcast.Reprisal = {
        ammo="Sapience Orb",
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body="Shab. Cuirass +1",
        hands="Regal Gauntlets",
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Odyssean Greaves", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','"Fast Cast"+6','STR+8','Mag. Acc.+1',}},
        neck="Moonlight Necklace",
        waist="Creed Baudrier",
        left_ear="Thureous Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring=gear.left_moonlight_ring,
        right_ring=gear.right_moonlight_ring,
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }

    sets.midcast.Reprisal.SIRD = set_combine(sets.midcast.Reprisal, sets.midcast.SIRD)

    sets.midcast.Crusade = set_combine(sets.Enmity, {
        body="Shab. Cuirass +1",
        hands="Regal Gauntlets",
    })

    sets.midcast['Divine Magic'] = sets.precast.FastCast

    sets.midcast['Enlight II'] = {
        head="Jumalik Helm",
        body="Rev. Surcoat +1",
        left_ring={name="Stikini Ring +1", bag="wardrobe3"},
        right_ring={name="Stikini Ring +1", bag="wardrobe4"},
    }

    sets.midcast.Flash = set_combine(sets.Enmity, {
        feet="Chev. Sabatons +2",
    })

    sets.midcast.Flash.SIRD = set_combine(sets.midcast.Flash, sets.midcast.SIRD)

    sets.midcast['Enfeebling Magic'] = {}

    sets.midcast['Blue Magic'] = {}
    sets.midcast['Blue Magic'].Enmity = sets.Enmity
    sets.midcast['Blue Magic'].SIRD = sets.midcast.SIRD
    sets.midcast['Blue Magic'].Enmity.SIRD = set_combine(sets.midcast['Blue Magic'].Enmity, sets.midcast['Blue Magic'].SIRD)
    sets.midcast['Blue Magic'].Cure = sets.midcast.Cure
    sets.midcast['Blue Magic'].Cure.SIRD = set_combine(sets.midcast['Blue Magic'].Cure, sets.midcast['Blue Magic'].SIRD)
end
