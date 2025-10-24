function user_setup()
    state.WeaponMode:options('Unlocked', 'Tishtrya')
end

function init_gear_sets()
    sets.weapons['Tishtrya'] = {main="Tishtrya", sub="Genmei Shield"}

    sets.idle = {
        main="Daybreak",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Azimuth Hood +2",
		body="Azimuth Coat +2",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Azimuth Gaiters +2",
		neck="Loricate Torque +1",
		waist="Shinjutsu-no-Obi",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Gelatinous Ring",
		right_ring="Fortified Ring",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}

    sets.idle.Pet = set_combine(sets.idle, {
        main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
        sub="Genmei Shield",
        -- head="Azimuth Hood +3",
        hands="Geo. Mitaines +2",
        neck="Bagua Charm +2",
        back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
    })

    sets.engaged = {
        ammo="Oshasha's Treatise",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Null Loop",
        waist="Witful Belt",
        left_ear="Etiolation Earring",
        right_ear="Crep. Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    }

    sets.WS = {}

    sets.JA['Bolster'] = {body="Bagua Tunic +3"}
    sets.JA['Full Circle'] = {head="Azimuth Hood +2", hands="Bagua Mitaines +3"}
    sets.JA['Life Cycle'] = {
        back={ name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
    }

    sets.precast.FastCast = {
        main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Agwu's Cap",
		body="Agwu's Robe",
		hands="Agwu's Gages",
		legs="Geomancy Pants +2",
		feet="Agwu's Pigaches",
		neck="Loricate Torque +1",
		waist="Shinjutsu-no-Obi",
		left_ear="Etiolation Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		-- right_ring="Gelatinous Ring",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}

    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.midcast.Geomancy = {
        main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
        range="Dunna",
        head="Azimuth Hood +3",
        neck="Bagua Charm +2",
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring={name="Stikini Ring +1", bag="wardrobe2"},
        back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
    }

    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +19',}},
        legs={ name="Bagua Pants", augments={'Enhances "Mending Halation" effect',}},
        feet="Azimuth Gaiters +2",
    })

    sets.midcast.Cure = {
        main="Daybreak",
        sub="Sors Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body="Jhakri Robe +2",
        hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="Loricate Torque +1",
        waist="Shinjutsu-no-Obi",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Gelatinous Ring",
        right_ring="Fortified Ring",
        back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
    }

    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        -- right_ring="Menelaus's Ring",
    })

    sets.midcast['Enhancing Magic'] = {
        sub="Ammurapi Shield",
        waist="Embla Sash",
        left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
        right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
    }

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        -- main="Bolelabunga",
    })

    sets.midcast['Enfeebling Magic'] = {
        main="Daybreak",
        sub="Ammurapi Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Azimuth Hood +2",
        body="Azimuth Coat +2",
        hands="Azimuth Gloves",
        legs="Nyame Flanchard",
        feet="Azimuth Gaiters +2",
        neck={ name="Bagua Charm +2", augments={'Path: A',}},
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear={ name="Azimuth Earring", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+6',}},
        left_ring="Kishar Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Indi. eff. dur. +17','Pet: Damage taken -2%','Damage taken-2%',}},
    }

    sets.midcast['Dark Magic'] = {
        -- main="Bunzi's Rod",
        -- sub="Ammurapi Shield",
        -- ammo="Pemphredo Tathlum",
        -- head="Azimuth Hood +3",
        -- body="Shamash Robe",
        -- hands="Jhakri Cuffs +2",
        -- legs="Azimuth Tights +3",
        -- feet="Agwu's Pigaches",
        -- neck="Erra Pendant",
        -- waist="Eschan Stone",
        -- left_ear="Regal Earring",
        -- right_ear="Malignance Earring",
        -- left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        -- right_ring={name="Stikini Ring +1", bag="wardrobe2"},
        -- back="Fi Follet Cape +1",
    }

    sets.midcast['Elemental Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Azimuth Hood +2",
		body="Azimuth Coat +2",
        hands="Jhakri Cuffs +2",
        legs="Jhakri Slops +2",
        feet="Azimuth Gaiters +2",
        neck={ name="Bagua Charm +2", augments={'Path: A',}},
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear={ name="Azimuth Earring", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+6',}},
        left_ring="Freke Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.buff['Sublimation: Activated'] = {waist="Embla Sash"}
    sets.buff.sleep = {main="Lorg Mor"}
end
