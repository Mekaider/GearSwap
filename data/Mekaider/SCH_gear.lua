function user_setup()
    send_command('lua l schud')

    coroutine.schedule(function()
        send_command('xb bar Basic')
    end, 2)
end

function user_file_unload()
    send_command('lua u schud')
end

function init_gear_sets()
    sets.idle = {
        main="Mpaca's Staff",
        sub="Kaja Grip",
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body=gear.sch_emp_body,
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs=gear.sch_emp_legs,
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Null Belt",
        left_ear="Infused Earring",
        right_ear="Lugalbanda Earring",
        left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
        back={ name="Lugh's Cape", augments={'HP+15','Eva.+20 /Mag. Eva.+20','Mag. Evasion+5','"Fast Cast"+10','Phys. dmg. taken-10%',}},
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
    sets.JA['Tabula Rasa'] = {legs=gear.sch_relic_legs}
    sets.JA['Enlightenment'] = {body=gear.sch_relic_body}

    sets.precast.FastCast = {
        --    /RDM --15
		ammo="Incantor Stone",
		main={ name="Musa", augments={'Path: C',}}, -- 10
		sub="Kaja Grip",
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Agwu's Robe",
		hands=gear.sch_af_hands,
		legs="Agwu's Slops",
		feet="Regal Pumps",
		neck="Voltsurge Torque",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back={ name="Lugh's Cape", augments={'HP+15','Eva.+20 /Mag. Eva.+20','Mag. Evasion+5','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.precast.FastCast.Grimoire = set_combine(sets.precast.FastCast, {head=gear.sch_relic_head, feet=gear.sch_af_feet})

    sets.precast.FastCast.Dispelga = set_combine(sets.precast.FastCast, {main="Daybreak", sub="Ammurapi Shield"})

    sets.midcast.Cure = {
        main="Daybreak",
        sub="Genmei Shield",
        ammo="Staunch Tathlum +1",
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body=gear.sch_emp_body,
        hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
        legs=gear.sch_af_legs,
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        -- neck="Sibyl Scarf",
        waist="Null Belt",
        left_ear="Infused Earring",
        right_ear="Lugalbanda Earring",
        left_ring="Stikini Ring +1",
        right_ring="Shneddick Ring",
        back="Aurist's Cape",
    }

    sets.midcast.Cure.Weather = set_combine(sets.midcast.Cure, {
        main="Chatoyant Staff",
        sub="Kaja Grip",
        waist="Hachirin-no-Obi",
        back="Twilight Cape"
    })

    -- sets.midcast.NaSpell = {}

    -- sets.midcast.Erase = {}

    sets.midcast.Cursna = {
        -- main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+2','"Mag.Atk.Bns."+16','DMG:+7',}},
        -- sub="Genmei Shield",
        body=gear.sch_relic_body,
        legs=gear.sch_af_legs,
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        -- neck="Henic Torque",
        -- left_ring="Menelaus's Ring",
    }

    sets.midcast['Enhancing Magic'] = {
        main={ name="Musa", augments={'Path: C',}},
        sub="Kaja Grip",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
        body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +8',}},
        hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
        feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		waist="Embla Sash",
		left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
    }

    -- sets.midcast.BarElement = {}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        head=gear.sch_emp_head,
        back={ name="Lugh's Cape", augments={'HP+15','Eva.+20 /Mag. Eva.+20','Mag. Evasion+5','"Fast Cast"+10','Phys. dmg. taken-10%',}},
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
        head=gear.sch_af_head,
        body=gear.sch_af_body,
        hands=gear.sch_af_hands,
        legs=gear.sch_af_legs,
        feet=gear.sch_af_feet,
		waist="Obstin. Sash",
		left_ring="Kishar Ring",
        right_ring=gear.right_stikini_ring,
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
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
        head=gear.sch_af_head,
        body=gear.sch_af_body,
        hands=gear.sch_af_hands,
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.Kaustra = {
        main="Bunzi's Rod", --10
        sub="Ammurapi Shield",
        -- ammo="Ghastly Tathlum +1",
        -- head="Arbatel Bonnet +2",
        body=gear.sch_emp_body,
        -- hands="Arbatel Bracers +2", --15
        legs=gear.sch_emp_legs,
        -- feet="Arbatel Loafers +2", --(5)
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring=gear.left_stikini_ring,
        right_ring="Freke Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
        waist="Hachirin-no-Obi",
    }

    -- sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {})
    -- sets.midcast.Aspir = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Stun = {
        main={ name="Musa", augments={'Path: C',}},
        sub="Kaja Grip",
        ammo="Pemphredo Tathlum",
        head=gear.sch_af_head,
        body=gear.sch_af_body,
        hands=gear.sch_af_hands,
        legs=gear.sch_af_legs,
        feet=gear.sch_af_feet,
        neck="Null Loop",
        waist="Null Belt",
        left_ear="Regal Earring",
        -- right_ear={ name="Arbatel Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Enmity-4',}},
        left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
        back="Null Shawl",
    }

    sets.midcast.Stun['Dark Arts'] = set_combine(sets.midcast.Stun, {
        main={ name="Musa", augments={'Path: C',}},
        sub="Kaja Grip",
        ammo="Pemphredo Tathlum",
        head=gear.sch_af_head,
        body=gear.sch_af_body,
        hands=gear.sch_af_hands,
        legs=gear.sch_af_legs,
        feet=gear.sch_af_feet,
        neck="Null Loop",
        waist="Null Belt",
        left_ear="Regal Earring",
        -- right_ear={ name="Arbatel Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Enmity-4',}},
        left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
        back="Null Shawl",
    })

    sets.midcast['Elemental Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head=gear.sch_emp_head,
        body=gear.sch_emp_body,
        hands=gear.sch_emp_hands,
        legs=gear.sch_emp_legs,
        feet=gear.sch_emp_feet,
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        waist="Sacro Cord",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring=gear.left_stikini_ring,
        right_ring="Freke Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
        -- left_ring = "Mujin Band"
    })

    sets.midcast['Elemental Magic'].MagicAcc = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Elemental Magic'].Immanence = {}

    sets.midcast.Helix = set_combine(sets.midcast['Elemental Magic'], {})
    sets.midcast['Luminohelix II'] = set_combine(sets.midcast.Helix, {main="Daybreak"})

    sets.midcast.Helix.Immanence = set_combine(sets.midcast['Elemental Magic'].Immanence)

    -- todo: magic burst set

    -- todo: maybe shift this up to the include, so weaponlock logic can be applied
    sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak", sub="Ammurapi Shield"})

    sets.Obi = {waist="Hachirin-no-Obi"}

    sets.buff['Sublimation: Activated'] = {head=gear.sch_af_head, body="Peda. Gown +1"}

    -- sets.buff.sleep = {}

    sets.Klimaform = {feet=gear.sch_emp_feet}
    sets.Perpetuance = {hands=gear.sch_emp_hands}
    sets.Ebullience = {head=gear.sch_emp_head}
    sets.Rapture = {head=gear.sch_emp_head}
    sets.Penury = {legs=gear.sch_emp_legs}
    sets.Parsimony = {legs=gear.sch_emp_legs}
    sets.Celerity = {feet=gear.sch_relic_feet}
    sets.Alacrity = {feet=gear.sch_relic_feet}
end
