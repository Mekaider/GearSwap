function user_setup()
    -- send_command('gs c display on')
    -- send_command('gs c debug')
end

function init_gear_sets()
    sets.idle = {
        main="Mpaca's Staff",
        sub="Kaja Grip",
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body="Shamash Robe",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Null Belt",
        left_ear="Etiolation Earring",
        right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
        left_ring="Gurebu's Ring",
        right_ring=gear.right_stikini_ring,
        back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
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
        right_ear="Crep. Earring",
        left_ring=gear.left_chirich_ring,
        right_ring=gear.right_chirich_ring,
        back="Null Shawl",
    }

    sets.WS = {
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
        left_ring=gear.left_chirich_ring,
        right_ring=gear.right_chirich_ring,
        back="Null Shawl",
    }

    sets.JA = {}
    sets.JA['Tabula Rasa'] = {} -- {legs="Peda. Pants +3"}
    sets.JA['Enlightenment'] = {body="Peda. Gown +2"}

    sets.precast.FastCast = {
        --    /RDM --15
		ammo="Incantor Stone",
		main={ name="Musa", augments={'Path: C',}}, -- 10
        sub="Kaja Grip",
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Agwu's Robe",
		hands="Acad. Bracers +2",
		legs="Agwu's Slops",
		feet="Regal Pumps +1",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.precast.FastCast.Grimoire = set_combine(sets.precast.FastCast, {head="Peda. M.Board +2"}) -- feet="Acad. Loafers +3"

    sets.precast.FastCast.Dispelga = set_combine(sets.precast.FastCast, {main="Daybreak", sub="Ammurapi Shield"})

    sets.midcast.Cure = {
        main={ name="Musa", augments={'Path: C',}},
        sub="Kaja Grip",
        ammo="Pemphredo Tathlum",
        head="Kaykaus Mitra +1",
        body={ name="Peda. Gown +2", augments={'Enhances "Enlightenment" effect',}},
        hands="Acad. Bracers +2",
        legs="Pinga Pants",
        feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
        neck="Henic Torque",
        waist="Shinjutsu-no-Obi +1",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
        back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.Cure.Weather = set_combine(sets.midcast.Cure, {
        main="Chatoyant Staff",
        sub="Kaja Grip",
        waist="Hachirin-no-Obi"
    })

    -- sets.midcast.NaSpell = {}

    -- sets.midcast.Erase = {}

    sets.midcast.Cursna = {
        main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+2','"Mag.Atk.Bns."+16','DMG:+7',}},
        sub="Genmei Shield",
        body={ name="Peda. Gown +2", augments={'Enhances "Enlightenment" effect',}},
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        neck="Henic Torque",
        left_ring="Menelaus's Ring",
    }

    sets.midcast['Enhancing Magic'] = {
        main={ name="Musa", augments={'Path: C',}},
        sub="Kaja Grip",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
        -- body="Peda. Gown +2",
        body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
        hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
        feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		waist="Embla Sash",
		left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
    }

    -- sets.midcast.BarElement = {}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        head="Arbatel Bonnet +2",
  		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    })

    -- sets.midcast.Regen.Potency = {}
    -- sets.midcast.Regen.Duration = {}

    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget"})

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})

    -- sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], right_ring="Sheltered Ring")
    -- same for protectra, shell, shellra


    sets.midcast['Divine Magic'] = {}

    sets.midcast['Enfeebling Magic'] = {
        main="Bunzi's Rod",
		sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Arbatel Bonnet +2",
        body="Arbatel Gown +2",
        hands="Arbatel Bracers +2",
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +2",
		waist="Obstin. Sash",
		left_ring="Kishar Ring",
        right_ring=gear.right_stikini_ring,
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
    }
    sets.midcast['Enfeebling Magic'].MagicAcc = set_combine(sets.midcast['Enfeebling Magic'], {
        left_ring=gear.left_stikini_ring,
    })

    sets.midcast['Enfeebling Magic']['Light Arts'] = set_combine(sets.midcast['Enfeebling Magic'], {
        -- legs="Acad. Pants +3",
        -- feet="Acad. Loafers +3"
    })

    sets.midcast['Enfeebling Magic'].MagicAcc['Light Arts'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Enfeebling Magic']['Dark Arts'] = set_combine(sets.midcast['Enfeebling Magic'], {
        -- body="Acad. Gown +3",
        -- feet="Acad. Loafers +3"
    })

    sets.midcast['Enfeebling Magic'].MagicAcc['Dark Arts'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +2",
        hands="Acad. Bracers +2",
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
    }

    sets.midcast.Kaustra = {
        main="Bunzi's Rod", --10
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head="Arbatel Bonnet +2",
        body="Arbatel Gown +2",
        hands="Arbatel Bracers +2", --15
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +2", --(5)
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring=gear.left_stikini_ring,
        right_ring="Freke Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Phys. dmg. taken-8%',}},
        waist="Hachirin-no-Obi",
    }

    -- sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {})
    -- sets.midcast.Aspir = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Stun = {
        main="Mpaca's Staff",
        sub="Kaja Grip",
        ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +2",
        body="Arbatel Gown +2",
        hands="Acad. Bracers +2",
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +2",
        neck="Null Loop",
        waist="Null Belt",
        left_ear="Regal Earring",
        right_ear={ name="Arbatel Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Enmity-4',}},
        left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
        back="Null Shawl",
    }

    sets.midcast.Stun['Dark Arts'] = set_combine(sets.midcast.Stun, {
        main="Mpaca's Staff",
        sub="Kaja Grip",
        ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +2",
        body="Arbatel Gown +2",
        hands="Acad. Bracers +2",
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +2",
        neck="Null Loop",
        waist="Null Belt",
        left_ear="Regal Earring",
        right_ear={ name="Arbatel Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Enmity-4',}},
        left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
        back="Null Shawl",
    })

    sets.midcast['Elemental Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head="Arbatel Bonnet +2",
        body="Arbatel Gown +2",
        hands="Arbatel Bracers +2",
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +2",
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        waist="Sacro Cord",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring=gear.left_stikini_ring,
        right_ring="Freke Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Phys. dmg. taken-8%',}},
    }

    sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
        left_ring = "Mujin Band"
    })

    sets.midcast['Elemental Magic'].MagicAcc = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Elemental Magic'].Immanence = {
        main="Malignance Pole",
        sub="Kaja Grip",
        ammo="Staunch Tathlum +1",
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body={ name="Vanya Robe", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        hands="Acad. Bracers +2",
        legs="Pinga Pants",
        feet="Regal Pumps +1",
        neck="Elite Royal Collar",
        waist="Embla Sash",
        left_ring=gear.left_chirich_ring,
        right_ring=gear.right_chirich_ring,
        back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.Helix = set_combine(sets.midcast['Elemental Magic'], {})
    sets.midcast['Luminohelix II'] = set_combine(sets.midcast.Helix, {main="Daybreak"})

    sets.midcast.Helix.Immanence = sets.midcast['Elemental Magic'].Immanence

    -- todo: magic burst set

    -- todo: maybe shift this up to the include, so weaponlock logic can be applied
    sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak", sub="Ammurapi Shield"})

    sets.Obi = {waist="Hachirin-no-Obi"}

    sets.buff['Sublimation: Activated'] = {head="Acad. Mortar. +2", body="Peda. Gown +2"}

    -- sets.buff.sleep = {}

    sets.Klimaform = {feet="Arbatel Loafers +2"}
    sets.Perpetuance = {hands="Arbatel Bracers +2"}
    sets.Ebullience = {head="Arbatel Bonnet +2"}
    sets.Rapture = {head="Arbatel Bonnet +2"}

    sets.Penury = {legs="Arbatel Pants +3"}
    sets.Parsimony = {legs="Arbatel Pants +3"}
    -- sets.Celerity = {feet="Peda. Loafers +3"}
    -- sets.Alacrity = {feet="Peda. Loafers +3"}
end
