-- Load and initialize the include file.
include('Mekaider-Include')

lockstyle_set = 9
set_lockstyle(lockstyle_set)

state.WeaponMode:options('Moralltach', 'Naegling', 'Unlocked')
state.WeaponMode:set('Moralltach')

state.ShieldMode:options('Srivatsa', 'Aegis', 'Priwen', 'Blurred Shield +1')
state.ShieldMode:set('Srivatsa')

state.MeleeMode:options('TP', 'PDT', 'AoE', 'Meva')
state.MeleeMode:set('PDT')

state.MagicMode:options('Normal', 'SIRD')
state.MagicMode:set('Normal')

-- state.DebugMode:set(true)

send_command('bind ~f9 gs c cycle ShieldMode')

function file_unload_custom()
    send_command('unbind ~f9')
end

function get_sets()
    sets.weapons["Moralltach"] = {main={ name="Moralltach", augments={'Path: C',}}}
    sets.weapons["Naegling"] = {main="Naegling"}

    -- 3074 HP, no shield
	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Chev. Armet +2",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Thureous Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
	}

    sets.idle.AoE = {
		ammo="Staunch Tathlum +1",
		head="Chev. Armet +2",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Chev. Cuisses +2",
		feet="Sakpata's Leggings",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Thureous Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
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
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
		back="Null Shawl",
    }

    sets.engaged.PDT = {
        ammo="Staunch Tathlum +1",
        head="Chev. Armet +2",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Chev. Cuisses +2",
        feet="Sakpata's Leggings",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Thureous Earring",
        right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
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
        left_ear="Thureous Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }


    sets.Enmity = {
		ammo="Sapience Orb",
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Moonlight Necklace",
        waist="Creed Baudrier",
        left_ear="Thureous Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Apeile Ring +1",
        right_ring="Petrov Ring",
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

	sets.JA['Invincible'] = set_combine( sets.Enmity, { legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}} })
	sets.JA['Shield Bash'] = set_combine( sets.Enmity, { hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}} })
	sets.JA['Holy Circle'] = set_combine( sets.Enmity, {})
	sets.JA['Sentinel'] = set_combine( sets.Enmity, { feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}} })
	sets.JA['Cover'] = set_combine( sets.Enmity, { feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}} })
	sets.JA['Provoke'] = set_combine( sets.Enmity, {})
	sets.JA['Rampart'] = set_combine( sets.Enmity, { head={ name="Cab. Coronet +3", augments={'Enhances "Iron Will" effect',}} })
	sets.JA['Divine Emblem'] = set_combine( sets.Enmity, {})
	sets.JA['Sepulcher'] = set_combine( sets.Enmity, {})
	sets.JA['Palisade'] = set_combine( sets.Enmity, {})
	sets.JA['Intervene'] = set_combine( sets.Enmity, {})
	sets.JA['Iron Will'] = set_combine( sets.Enmity, { head={ name="Cab. Coronet +3", augments={'Enhances "Iron Will" effect',}} })
	sets.JA['Fealty'] = set_combine( sets.Enmity, { body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}} })
	sets.JA['Chivalry'] = set_combine( sets.Enmity, { hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}} })
	sets.JA['Majesty'] = set_combine( sets.Enmity, {})

    sets.precast.FastCast = {
        ammo="Sapience Orb", -- 2
        head="Chev. Armet +2", -- 8
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8
        feet={ name="Odyssean Greaves", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','"Fast Cast"+6','STR+8','Mag. Acc.+1',}}, -- 11
        neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=2},
        waist= {name="Creed Baudrier", priority=3},
    }
    
    sets.midcast.SIRD = {
        ammo="Staunch Tathlum +1", -- 10
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, -- 20
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}, -- 20
        neck="Moonlight Necklace", -- 15
        feet={ name="Odyssean Greaves", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','"Fast Cast"+6','STR+8','Mag. Acc.+1',}}, -- 20
        waist="Audumbla Sash", -- 10
    }

    sets.midcast.FastCast.SIRD = set_combine(sets.precast.FastCast, sets.midcast.SIRD)


    sets.midcast.Cure = {
        ammo="Sapience Orb",
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands="Macabre Gaunt. +1",
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Odyssean Greaves", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','"Fast Cast"+6','STR+8','Mag. Acc.+1',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Thureous Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Moonlight Ring",
        right_ring="Moonlight Ring",
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }

    sets.midcast['Healing Magic'] = sets.midcast.Cure

    sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure, sets.midcast.SIRD)

    -- 3007 HP, no shield
    sets.midcast['Enhancing Magic'] = {
        ammo="Sapience Orb",
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body="Shab. Cuirass +1",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Thureous Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }

    sets.midcast['Protect'] = set_combine(sets.midcast['Enhancing Magic'], {
        main={ name="Moralltach", augments={'Path: C',}},
        sub="Srivatsa"
    })

    sets.midcast.Phalanx = {
		main="Sakpata's Sword", -- 5
		sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}}, -- 2
		ammo="Staunch Tathlum +1",
        body="Shab. Cuirass +1",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, -- 5
		legs="Sakpata's Cuisses", -- 5
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, -- 5
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		left_ear="Thureous Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }

    sets.midcast.Phalanx.SIRD = set_combine(sets.midcast.Phalanx, sets.midcast.SIRD)

    sets.midcast.Reprisal = {
        ammo="Sapience Orb",
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body="Shab. Cuirass +1",
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Odyssean Greaves", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','"Fast Cast"+6','STR+8','Mag. Acc.+1',}},
        neck="Moonlight Necklace",
        waist="Creed Baudrier",
        left_ear="Thureous Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    }

    sets.midcast.Reprisal.SIRD = set_combine(sets.midcast.Reprisal, sets.midcast.SIRD)

    sets.midcast['Divine Magic'] = sets.precast.FastCast

    sets.midcast.Flash = set_combine(sets.Enmity, {})

    sets.midcast.Flash.SIRD = set_combine(sets.midcast.Flash, sets.midcast.SIRD)

    sets.midcast['Enfeebling Magic'] = {}

    sets.midcast['Blue Magic'] = {}
    sets.midcast['Blue Magic'].Enmity = sets.Enmity
    sets.midcast['Blue Magic'].SIRD = sets.midcast.SIRD
    sets.midcast['Blue Magic'].Enmity.SIRD = set_combine(sets.midcast['Blue Magic'].Enmity, sets.midcast['Blue Magic'].SIRD)
    sets.midcast['Blue Magic'].Cure = sets.midcast.Cure
    sets.midcast['Blue Magic'].Cure.SIRD = set_combine(sets.midcast['Blue Magic'].Cure, sets.midcast['Blue Magic'].SIRD)
end

function midcast_custom(spell)
    equipSet = sets.midcast
    message = ''

    if spell.type == 'BlueMagic' then
        if blue_magic_emnity_spells:contains(spell.english) then
            equipSet = equipSet['Blue Magic'].Enmity
            message = 'Blue magic enmity set'
        elseif blue_magic_healing_spells:contains(spell.english) then
            equipSet = equipSet['Blue Magic'].Cure
            message = 'Blue magic healing set'
        end
    end

    if equipSet[state.MagicMode.value] then
        equipSet = equipSet[state.MagicMode.value]
        message = message..' ('..state.MagicMode.value..')'
    end

    if message ~= '' then
        log('midcast_custom: '..message)
    end
    return equipSet
end
