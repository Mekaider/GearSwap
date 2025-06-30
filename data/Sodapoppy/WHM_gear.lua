function user_setup()
    state.WeaponMode:options('Tishtrya', 'Unlocked')
    state.WeaponMode:set('Unlocked')

    state.MeleeMode = M{['description']='Melee Mode', 'Normal'}
    state.ExtraMagicModes:options('None', 'SIRD', 'Immunobreak')
end

function init_gear_sets()
    sets.weapons['Yagrush'] = {main="Yagrush", sub="Genmei Shield"}
    sets.weapons['Tishtrya'] = {main="Tishtrya", sub="Genmei Shield"}

    sets.idle = {
        main="Daybreak",
        sub="Genmei Shield",
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body="Shamash Robe",
        hands="Ebers Mitts +3",
        legs="Ebers Pant. +3",
        feet="Ebers Duckbills +3",
        neck="Sibyl Scarf",
        waist="Null Belt",
        left_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
        right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 MND+11',}},
        left_ring="Gurebu's Ring",
        right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
    }

    sets.resting = {main="Chatoyant Staff", waist="Shinjutsu-no-Obi +1"}

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
        right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 MND+11',}},
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    }

    sets.engaged.DualWield = {}

    sets.WS = {}

    sets.JA = {}
    sets.JA['Benediction'] = {body="Piety Bliaut +1"}
    sets.JA['Afflatus Misery'] = {legs="Piety Pantaln. +1"}

    sets.precast.FastCast = {
        ammo="Incantor Stone",
        head="Ebers Cap +3",
        body="Inyanga Jubbah +2",
        hands="Ebers Mitts +3",
        legs="Pinga Pants",
        feet="Regal Pumps +1",
        neck={ name="Clr. Torque +2", augments={'Path: A',}},
        waist="Embla Sash",
        left_ear="Etiolation Earring",
        right_ear="Malignance Earring",
        left_ring="Kishar Ring",
        right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
        back={ name="Alaunus's Cape", augments={'"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast, {})

    sets.precast.FastCast.Cure = set_combine(sets.precast.FastCast, {})

    sets.precast.FastCast.Curaga = sets.precast.FastCast.Cure

    sets.midcast.Cure = {
        main="Raetic Rod +1", -- 23(+10)
        sub="Thuellaic Ecu +1",
        ammo="Pemphredo Tathlum",
        head="Kaykaus Mitra +1",
        body="Theo. Bliaut +3",
        hands="Theophany Mitts +3",
        legs="Ebers Pant. +3",
        feet="Kaykaus Boots +1", -- 11(+2)/(-12)
        neck="Clr. Torque +2",
        waist="Luminary Sash",
        left_ear="Regal Earring",
        right_ear={ name = "Ebers Earring +2", augments = { 'System: 1 ID: 1676 Val: 0', 'Accuracy+18', 'Mag. Acc.+18', 'Damage taken-7%', 'STR+11 MND+11', } },
        left_ring="Naji's Loop",
        back={ name = "Alaunus's Cape", augments = { 'MND+20', 'Eva.+20 /Mag. Eva.+20', 'MND+10', 'Enmity-10', 'Phys. dmg. taken-10%', } },
    }
    sets.midcast.Cure.Weather = set_combine(sets.midcast.Cure, {waist="Hachirin-no-Obi"})

    sets.midcast.Cure['Afflatus Solace'] = set_combine(sets.midcast.Cure, {body="Ebers Bliaut +3"})
    sets.midcast.Cure.Weather['Afflatus Solace'] = set_combine(sets.midcast.Cure['Afflatus Solace'], {waist="Hachirin-no-Obi"})

    sets.midcast.NaSpell = {
        main="Yagrush",
        hands="Ebers Mitts +3",
        legs="Ebers Pant. +3",
        -- get a mending cape
    }

    sets.midcast.Erase = {
        main="Yagrush",
        legs="Ebers Pant. +3",
        neck="Clr. Torque +2",
    }

    sets.midcast.Cursna = {
        main="Yagrush",
        sub="Thuellaic Ecu +1",
        ammo="Pemphredo Tathlum",
        head="Kaykaus Mitra +1",
        body="Ebers Bliaut +3",
        hands={ name="Fanatic Gloves", augments={'MP+20','Healing magic skill +4',}},
        legs="Th. Pant. +3",
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        neck={ name="Clr. Torque +2", augments={'Path: A',}},
        right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 MND+11',}},
        left_ring="Menelaus's Ring",
        right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
        back={ name="Alaunus's Cape", augments={'"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast['Enhancing Magic'] = {
        main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+2','"Mag.Atk.Bns."+16','DMG:+7',}},
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
        body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
        hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
        feet="Theo. Duckbills +3",
        waist="Embla Sash",
        left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
        right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
        back="Fi Follet Cape +1",
    }

    sets.midcast.BarElement = {
        main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+2','"Mag.Atk.Bns."+16','DMG:+7',}},
        sub="Ammurapi Shield",
        head="Ebers Cap +3",
        body="Ebers Bliaut +3",
        hands="Ebers Mitts +3",
        legs={ name="Piety Pantaln. +1", augments={'Enhances "Afflatus Misery" effect',}},
        feet="Ebers Duckbills +3",
        waist="Embla Sash",
        left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
        right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
        back="Fi Follet Cape +1",
    }

    sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +3"})

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        main="Bolelabunga",
        head="Inyanga Tiara +2",
        body={ name = "Piety Bliaut +1", augments={'Enhances "Benediction" effect',}},
        hands="Ebers Mitts +3",
        legs="Th. Pant. +3",
    })

    -- sets.midcast.Protect = {left_ring="Sheltered Ring"}

    sets.midcast['Divine Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Theophany Cap +3",
        body="Theo. Bliaut +3",
        hands={ name="Fanatic Gloves", augments={'MP+20','Healing magic skill +4',}},
        legs="Th. Pant. +3",
        feet="Theo. Duckbills +3",
        neck="Jokushu Chain",
        waist="Luminary Sash",
        left_ear="Regal Earring",
        right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 MND+11',}},
        left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
        right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
    }

    sets.midcast['Enfeebling Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Theophany Cap +3",
        body="Theo. Bliaut +3",
        hands="Theophany Mitts +3",
        legs={ name="Chironic Hose", augments={'INT+15','Mag. Acc.+23','Accuracy+13 Attack+13','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
        feet="Theo. Duckbills +3",
        neck="Null Loop",
        waist="Obstin. Sash",
        left_ear="Regal Earring",
        right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 MND+11',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Null Shawl",
    }

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.buff['Sublimation: Activated'] = {waist="Embla Sash"}
    sets.buff.sleep = {main="Lorg Mor"}
end
