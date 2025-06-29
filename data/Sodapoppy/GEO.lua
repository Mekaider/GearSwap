-- Load and initialize the include file.
include('Mekaider-Include')

state.WeaponMode:options('Unlocked', 'Tishtrya')

state.MeleeMode:options('DT')

send_command('gs c display')

function get_sets()
    sets.weapons['Tishtrya'] = {main="Tishtrya", sub="Genmei Shield"}

    sets.Moving = {right_ring="Shneddick Ring"}

    sets.idle = {
        main="Daybreak",
        sub="Genmei Shield",
        range="Dunna",
        head="Null Masque",
        body="Shamash Robe",
        hands="Bagua Mitaines +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Azimuth Gaiters +3",
        neck="Sibyl Scarf",
        waist="Null Belt",
        left_ear="Etiolation Earring",
        right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
        left_ring="Gurebu's Ring",
        right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
        back={ name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.idle.Pet = set_combine(sets.idle, {
        main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
        sub="Genmei Shield",
        head="Azimuth Hood +3",
        hands="Geo. Mitaines +1",
        back={ name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
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
    sets.JA['Full Circle'] = {head="Azimuth Hood +3", hands="Bagua Mitaines +3"}
    sets.JA['Life Cycle'] = {
        back={ name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
    }

    sets.precast.FastCast = {
        main="Mpaca's Staff",
        sub="Kaja Grip",
        range="Dunna",
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body="Agwu's Robe",
        hands="Agwu's Gages",
		legs="Geomancy Pants",
        feet="Regal Pumps +1",
        neck="Loricate Torque +1",
        waist="Embla Sash",
        left_ear="Etiolation Earring",
        right_ear="Malignance Earring",
        left_ring="Kishar Ring",
        right_ring="Naji's Loop",
        back={ name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.midcast.Geomancy = {
        main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
        range="Dunna",
        head="Azimuth Hood +3",
        neck="Bagua Charm +2",
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring={name="Stikini Ring +1", bag="wardrobe2"},
        back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
    }

    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
        legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}},
        feet="Azimuth Gaiters +3",
    })

    sets.midcast.Cure = {
        main="Daybreak",
        sub="Sors Shield",
        ammo="Hydrocera",
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body="Vanya Robe",
        hands={ name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        legs="Nyame Flanchard",
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        neck="Henic Torque",
        waist="Embla Sash",
        left_ear="Mendi. Earring",
        right_ear="Regal Earring",
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring="Naji's Loop",
        back="Fi Follet Cape +1",
    }

    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        right_ring="Menelaus's Ring",
    })

    sets.midcast['Enhancing Magic'] = {
        main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+2','"Mag.Atk.Bns."+16','DMG:+7',}},
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
        body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
        hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
        feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
        waist="Embla Sash",
        left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
        right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
        back="Fi Follet Cape +1",
    }

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        main="Bolelabunga",
    })

    sets.midcast['Enfeebling Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Azimuth Hood +3",
        body="Azimuth Coat +3",
        hands="Azimuth Gloves +3",
        legs="Azimuth Tights +3",
        feet="Azimuth Gaiters +3",
        neck="Null Loop",
        waist="Luminary Sash",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
        right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
        back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
    }

    sets.midcast['Dark Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Azimuth Hood +3",
        body="Shamash Robe",
        hands="Jhakri Cuffs +2",
        legs="Azimuth Tights +3",
        feet="Agwu's Pigaches",
        neck="Erra Pendant",
        waist="Eschan Stone",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring={name="Stikini Ring +1", bag="wardrobe2"},
        back="Fi Follet Cape +1",
    }

    sets.midcast['Elemental Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head="Azimuth Hood +3",
        body="Azimuth Coat +3",
        hands="Azimuth Gloves +3",
        legs="Azimuth Tights +3",
        feet="Azimuth Gaiters +3",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
		left_ring="Kishar Ring",
        right_ring="Freke Ring",
    }

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.buff['Sublimation: Activated'] = {waist="Embla Sash"}
    sets.buff.sleep = {main="Lorg Mor"}
end
