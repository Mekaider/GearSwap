-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    send_command('bind ^b gs c toggle MagicBurst')
    send_command('bind %~r gs c cycle RegenMode')
    -- send_command('bind ^` input /ja Immanence <me>')
    -- send_command('bind ^- gs c scholar light')
    -- send_command('bind ^= gs c scholar dark')
    -- send_command('bind ^[ gs c scholar power')
    -- send_command('bind ^] gs c scholar accuracy')
    -- send_command('bind ^; gs c scholar speed')
    -- send_command('bind !w input /ma "Aspir II" <t>')
    -- send_command('bind !o input /ma "Regen V" <stpc>')
    -- send_command('bind ![ gs c scholar aoe')
    -- send_command('bind !] gs c scholar duration')
    -- send_command('bind !; gs c scholar cost')
    -- -- send_command('bind @c gs c toggle CP')
    -- send_command('bind @h gs c cycle HelixMode')
    -- send_command('bind @r gs c cycle RegenMode')
    -- send_command('bind @s gs c toggle StormSurge')
    -- send_command('bind @w gs c toggle WeaponLock')

    -- send_command('bind ^numpad0 input /Myrkr')

    -- select_default_macro_book()
    lockstyleset = 5
    set_lockstyle()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^b')
    send_command('unbind ~r')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +3"}
    sets.precast.JA['Enlightenment'] = {body="Peda. Gown +2"}
    sets.precast.JA['Sublimation'] = {
        head="Acad. Mortar. +2", --4
        body="Peda. Gown +2", --5
        }

    -- Fast cast sets for spells
    sets.precast.FC = {
    --    /RDM --15
		ammo="Incantor Stone",
		main={ name="Musa", augments={'Path: C',}}, -- 10
        sub="Kaja Grip",
		head={ name="Peda. M.Board +2", augments={'Enh. "Altruism" and "Focalization"',}},
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

    sets.precast.FC.Grimoire = {head="Peda. M.Board +2", feet="Acad. Loafers +3"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Embla Sash"})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        -- feet="Kaykaus Boots +1", --7
        -- ear1="Mendi. Earring", --5
        -- ring1="Lebeche Ring", --(2)
        })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak", waist="Shinjutsu-no-Obi +1"})
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield"})
    sets.precast.Storm = set_combine(sets.precast.FC, {
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring={name="Stikini Ring +1", bag="wardrobe2"},
    })

    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.WS = {
        --ammo="Floestone",
        -- head="Nyame Helm",
        -- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- legs="Nyame Flanchard",
        -- feet="Nyame Sollerets",
        -- neck="Fotia Gorget",
        -- ear1="Moonshade Earring",
        -- ear2="Telos Earring",
        -- ring1="Cornelia's Ring",
        -- ring2="Epaminondas's Ring",
        -- back="Relucent Cape",
        -- waist="Fotia Belt",
        }

    sets.precast.WS['Omniscience'] = set_combine(sets.precast.WS, {
        -- ammo="Ghastly Tathlum +1",
        -- head="Pixie Hairpin +1",
        -- body="Arbatel Gown +2",
        hands="Arbatel Bracers +2",
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +2",
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        -- ear1="Malignance Earring",
        ear2="Regal Earring",
        -- ring2="Archon Ring",
        -- back=gear.SCH_MAB_Cape,
        -- waist="Sacro Cord",
        })


    sets.precast.WS['Myrkr'] = {
        -- ammo="Ghastly Tathlum +1",
        -- head="Pixie Hairpin +1",
        -- body="Amalric Doublet +1",
        -- hands="Kaykaus Cuffs +1",
        -- legs="Amalric Slops +1",
        -- feet="Kaykaus Boots +1",
        -- neck="Nuna Gorget +1",
        -- ear1="Halasz Earring",
        -- ear2="Etiolation Earring",
        -- ring1={name="Fenrir Ring +1", bag="wardrobe5"},
        -- ring1={name="Fenrir Ring +1", bag="wardrobe6"},
        -- back="Fi Follet Cape +1",
        -- waist="Shinjutsu-no-Obi +1",
        } -- Max MP


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

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
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring={name="Stikini Ring +1", bag="wardrobe2"},
        back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.CureWeather = set_combine(sets.midcast.Cure, {
        main="Chatoyant Staff", --10
        sub="Kaja Grip", --0/(-5)
        waist="Korin Obi",
    })

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        -- neck="Nuna Gorget +1",
        -- ring1={name="Stikini Ring +1", bag="wardrobe5"},
        -- ring2="Metamor. Ring +1",
        -- waist="Luminary Sash",
        })

    sets.midcast.StatusRemoval = sets.precast.FC

    sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
        -- main=gear.Gada_ENH,
        -- sub="Ammurapi Shield",
        feet="Vanya Clogs",
    })

    sets.midcast['Enhancing Magic'] = {
		main={ name="Musa", augments={'Path: C',}},
        sub="Kaja Grip",
        -- main=gear.Gada_ENH,
        -- sub="Ammurapi Shield",
        body="Peda. Gown +2",
		waist="Embla Sash",
		left_ear={ name="Etiolation Earring", priority=1},
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},	
        }

    sets.midcast.EnhancingDuration = {
		main={ name="Musa", augments={'Path: C',}},
        sub="Kaja Grip",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
        -- body={ name="Peda. Gown +2", augments={'Enhances "Enlightenment" effect',}}, -- switch to Peda. when +3
        body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
        hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
        feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
        waist="Embla Sash",
    }

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        head="Arbatel Bonnet +2",
        body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
        -- hands=gear.Telchine_ENH_hands,
        -- legs=gear.Telchine_ENH_legs,
        -- feet=gear.Telchine_ENH_feet,
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
        -- back="Bookworm's Cape",
        })

    sets.midcast.RegenDuration = set_combine(sets.midcast.EnhancingDuration, {
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
        back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
        })

    sets.midcast.Haste = sets.midcast.EnhancingDuration

    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        -- head="Amalric Coif +1",
        -- waist="Gishdubar Sash",
        -- back="Grapevine Cape",
        })

    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        neck="Nodens Gorget",
        -- waist="Siegel Sash",
        })

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
        -- main="Vadose Rod",
        -- sub="Ammurapi Shield",
        -- ammo="Staunch Tathlum +1",
        -- head="Amalric Coif +1",
        -- hands="Regal Cuffs",
        -- ear1="Halasz Earring",
        -- ear2="Magnetic Earring",
        -- ring1="Freke Ring",
        -- waist="Emphatikos Rope",
        })

    sets.midcast.Storm = sets.midcast.EnhancingDuration

    sets.midcast.Stormsurge = set_combine(sets.midcast.Storm, {feet="Peda. Loafers +3"})

    sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Shell

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Arbatel Bonnet +2",
        body="Arbatel Gown +2",
        hands="Arbatel Bracers +2",
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +2",
		waist="Obstin. Sash",
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
        }

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {

        })

    sets.midcast.ElementalEnfeeble = sets.midcast.Enfeebles
    sets.midcast.Dispelga = set_combine(sets.midcast.IntEnfeebles, {main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})

    sets.midcast['Dark Magic'] = {
        -- main="Rubicundity",
        -- sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +2",
        -- body="Acad. Gown +3",
        hands="Acad. Bracers +2",
        -- legs="Peda. Pants +3",
        -- feet="Acad. Loafers +3",
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        -- ear1="Malignance Earring",
        -- ear2="Mani Earring",
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring={name="Stikini Ring +1", bag="wardrobe2"},
        -- back="Aurist's Cape +1",
        -- waist="Acuity Belt +1",
        }

    sets.midcast.Kaustra = {
        main="Bunzi's Rod", --10
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head="Arbatel Bonnet +2",
        -- body="Arbatel Gown +2",
        hands="Arbatel Bracers +2", --15
        -- legs="Amalric Slops +1",
        feet="Arbatel Loafers +2", --(5)
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        -- ear1="Malignance Earring",
        ear2="Regal Earring",
        -- ring1="Freke Ring",
        -- ring2="Metamor. Ring +1",
        -- back=gear.SCH_MAB_Cape,
        -- waist="Hachirin-no-Obi",
        } -- INT

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        -- main="Rubicundity", --20
        -- sub="Ammurapi Shield",
        -- head="Pixie Hairpin +1",
        -- legs="Peda. Pants +3",  --15
        -- feet="Agwu's Pigaches", --20
        -- neck="Erra Pendant", --5
        -- ear1="Hirudinea Earring", --5
        -- ring1="Evanescence Ring", --10
        -- ring2="Archon Ring",
        -- waist="Fucho-no-obi", --8
        })

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = sets.midcast.IntEnfeebles

    -- Elemental Magic
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
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring={name="Stikini Ring +1", bag="wardrobe1"},
        right_ring="Freke Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Phys. dmg. taken-8%',}},
    }

    sets.midcast['Elemental Magic'].Seidr = set_combine(sets.midcast['Elemental Magic'], {
        -- ammo="Pemphredo Tathlum",
        -- body="Seidr Cotehardie",
        -- legs="Arbatel Pants +3",
        -- feet="Arbatel Loafers +3",
        })

    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
        -- legs="Arbatel Pants +3",
        -- feet="Arbatel Loafers +3",
        })

    sets.midcast.Impact = sets.midcast['Elemental Magic'].Resistant

    --Helix sets will be combined with Elemental Magic set in midcast
    sets.midcast.Helix = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        -- ear1="Crematio Earring",
        -- waist="Skrymir Cord +1",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
        }

    sets.midcast.DarkHelix = set_combine(sets.midcast.Helix, {
        -- head="Pixie Hairpin +1",
        -- ring2="Archon Ring",
        })

    sets.midcast.LightHelix = set_combine(sets.midcast.Helix, {
        -- main="Daybreak",
        -- sub="Ammurapi Shield",
        -- ring2="Weather. Ring +1"
        })

    -- Initializes trusts at iLvl 119
    sets.midcast.Trust = sets.precast.FC


    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        main="Mpaca's Staff",
        sub="Kaja Grip",
        ammo="Incantor Stone",
        head="Null Masque",
        body="Arbatel Gown +2",
        hands={ name="Chironic Gloves", augments={'CHR+2','Phys. dmg. taken -4%','"Refresh"+1',}},
        legs="Assid. Pants +1",
        feet={ name="Chironic Slippers", augments={'STR+2','CHR+6','"Refresh"+1','Accuracy+12 Attack+12',}},
        neck="Sibyl Scarf",
        waist="Null Belt",
        left_ear="Etiolation Earring",
        right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
        left_ring="Gurebu's Ring",
        right_ring="Stikini Ring +1",
        back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.idle.DT = set_combine(sets.idle, {
        -- main="Daybreak",
        -- sub="Genmei Shield", --10/0
        -- ammo="Staunch Tathlum +1", --3/3
        head="Arbatel Bonnet +2", --10/10
        -- body="Arbatel Gown +2", --12/12
        -- hands="Nyame Gauntlets", --7/7
        -- legs="Arbatel Pants +3", --11/11
        -- feet="Arbatel Loafers +3",
        -- neck="Warder's Charm +1",
        -- back="Moonlight Cape", --6/6
        -- waist="Plat. Mog. Belt", --3/3
        })

    sets.resting = set_combine(sets.idle, {
        main="Chatoyant Staff",
        waist="Shinjutsu-no-Obi +1",
        })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Defense Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT
    sets.Moving = {right_ring="Shneddick Ring"}
    sets.idle.Town = set_combine(sets.idle, sets.Moving)
    sets.latent_refresh = {waist="Fucho-no-obi"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Loricate Torque +1",
        waist="Witful Belt",
        left_ear="Etiolation Earring",
        right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.magic_burst = {
        main="Mpaca's Staff",
        sub="Enki Strap",
        ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",
        body="Agwu's Robe",
        hands="Arbatel Bracers +2",
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +2",
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring="Freke Ring",
        right_ring="Mujin Band",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Phys. dmg. taken-8%',}},
    }

    sets.immanence_low_damage = set_combine(sets.precast.FC, {
        -- main="Siriti",
        -- sub="Sors Shield",
        -- body="Seidr Cotehardie",
        -- legs="Acad. Pants +3",
        -- feet="Acad. Loafers +3",
        -- ear1="Halasz Earring",
        })

    sets.buff['Ebullience'] = {head="Arbatel Bonnet +2"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +2"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +2"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +2", back="Lugh's Cape"}
    sets.buff['Penury'] = {legs="Arbatel Pants +3"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +3"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +3"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +2"}

    sets.buff.FullSublimation = {
        head="Acad. Mortar. +2", --4
        body="Peda. Gown +2", --5
    --    main="Siriti", --1
    --    sub="Genmei Shield", --10/0
    --    ear1="Savant's Earring", --1
       waist="Embla Sash", --5
       }

    sets.buff.Doom = {
        -- neck="Nicander's Necklace", --20
        -- ring1={name="Eshmun's Ring", bag="wardrobe5"}, --20
        -- ring2={name="Eshmun's Ring", bag="wardrobe6"}, --20
        -- waist="Gishdubar Sash", --10
        }

    sets.LightArts = {legs="Acad. Pants +3", feet="Acad. Loafers +3"}
    sets.DarkArts = {body="Acad. Gown +3", feet="Acad. Loafers +3"}

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.Bookworm = {} -- {back="Bookworm's Cape"}
    -- sets.CP = {back="Mecisto. Mantle"}

end
