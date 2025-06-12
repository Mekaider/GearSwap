-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    lockstyleset = 5

    -- select_default_macro_book()
    set_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Precast Sets -----------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +3"}
    sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3"}
    sets.precast.JA['Life Cycle'] = {head="Bagua Galero +3", body="Geomancy Tunic +3", back=gear.GEO_Idle_Cape,}


    -- Fast cast sets for spells

    sets.precast.FC = {
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

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        -- back="Perimede Cape",
        -- waist="Siegel Sash",
        })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +3"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        -- ear1="Mendi. Earring", --5
        -- ring1="Lebeche Ring", --(2)
        -- back="Perimede Cape", --(4)
        })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak"})
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield"})


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Jhakri Coronal +2",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        legs="Jhakri Slops +2",
        feet="Jhakri Pigaches +2",
        -- neck="Fotia Gorget",
        ear1="Moonshade Earring",
        -- ear2="Brutal Earring",
        -- ring1="Petrov Ring",
        -- ring2="Hetairoi Ring",
        -- waist="Fotia Belt",
        }

    sets.precast.WS['Hexastrike'] = set_combine(sets.precast.WS, {
        -- neck="Caro Necklace",
        -- waist="Grunfeld Rope",
        })

    sets.precast.WS['Exudation'] = sets.precast.WS['Hexastrike']

    sets.precast.WS['Flash Nova'] = {
        -- head="Azimuth Hood +3",
        -- body="Azimuth Coat +3",
        -- hands="Jhakri Cuffs +2",
        -- legs="Azimuth Tights +3",
        feet="Azimuth Gaiters +2",
        -- neck="Saevus Pendant +1",
        -- ear1="Malignance Earring",
        -- ear2="Regal Earring",
        -- ring1="Freke Ring",
        -- ring2="Metamor. Ring +1",
        -- back=gear.GEO_MAB_Cape,
        -- waist="Refoccilation Stone",
        }

    ------------------------------------------------------------------------
    ----------------------------- Midcast Sets -----------------------------
    ------------------------------------------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = sets.precast.FC -- Haste

   sets.midcast.Geomancy = {
        main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        neck = "Bagua Charm +2",
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

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        -- neck="Nuna Gorget +1",
        -- ring2="Metamor. Ring +1",
        -- waist="Luminary Sash",
        })

    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        -- neck="Malison Medallion",
        -- ring1={name="Haoma's Ring", bag="wardrobe3"},
        -- ring2={name="Haoma's Ring", bag="wardrobe4"},
        -- back="Oretan. Cape +1",
        })

    sets.midcast['Enhancing Magic'] = {
        -- main=gear.Gada_ENH,
        sub="Ammurapi Shield",
        -- ammo="Pemphredo Tathlum",
        -- head="Befouled Crown",
        -- body="Telchine Chas.",
        -- hands="Telchine Gloves",
        -- legs="Telchine Braconi",
        -- feet="Telchine Pigaches",
        -- neck="Incanter's Torque",
        -- ear1="Mimir Earring",
        -- ear2="Andoaa Earring",
        -- ring1={name="Stikini Ring +1", bag="wardrobe3"},
        -- ring2={name="Stikini Ring +1", bag="wardrobe4"},
        -- back="Fi Follet Cape +1",
        -- waist="Olympus Sash",
        }

    sets.midcast.EnhancingDuration = {
        -- main=gear.Gada_ENH,
        sub="Ammurapi Shield",
        -- head="Telchine Cap",
        -- body="Telchine Chas.",
        -- hands="Telchine Gloves",
        -- legs="Telchine Braconi",
        -- feet="Telchine Pigaches",
        waist="Embla Sash",
        }

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        -- main="Bolelabunga",
        })

    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        -- head="Amalric Coif +1",
        })

    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        -- neck="Nodens Gorget",
        -- waist="Siegel Sash",
        })

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
        -- main="Vadose Rod",
        -- sub="Ammurapi Shield",
        -- head="Amalric Coif +1",
        -- ear2="Magnetic Earring",
        })

    sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Protect


    sets.midcast.MndEnfeebles = {
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
    } -- MND/Magic accuracy

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
        -- ammo="Pemphredo Tathlum",
        -- waist="Acuity Belt +1",
        }) -- INT/Magic accuracy

    sets.midcast.LockedEnfeebles = {} -- {body="Geomancy Tunic +3"}

    sets.midcast.Dispelga = set_combine(sets.midcast.IntEnfeebles, {main="Daybreak", sub="Ammurapi Shield"})

    sets.midcast['Dark Magic'] = {
        }

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        })

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = sets.midcast['Dark Magic']

    -- Elemental Magic sets

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

    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
        -- ear2="Digni. Earring",
        })

    sets.midcast.GeoElem = set_combine(sets.midcast['Elemental Magic'], {
        main="Bunzi's Rod",
        -- sub="Ammurapi Shield",
        })

    sets.midcast.GeoElem.Seidr = set_combine(sets.midcast['Elemental Magic'].Seidr, {})

    sets.midcast.Impact = set_combine(sets.midcast.IntEnfeebles, {
        -- head=empty,
        -- body="Twilight Cloak",
        -- hands="Geo. Mitaines +3",
        --ring2="Archon Ring",
        })

    -- Initializes trusts at iLvl 119
    sets.midcast.Trust = sets.precast.FC

    ------------------------------------------------------------------------------------------------
    ------------------------------------------ Idle Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

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

    sets.resting = set_combine(sets.idle, {
        waist="Shinjutsu-no-Obi",
        })

    sets.idle.DT = set_combine(sets.idle, {
        -- head="Azimuth Hood +3", --12/12
        -- hands="Azimuth Gloves +3", --12/12
        -- legs="Azimuth Tights +3",
        -- neck="Loricate Torque +1", --6/6
        -- ear2="Odnowa Earring +1", --3/3
        -- back=gear.GEO_Idle_Cape, --5/5
        -- waist="Plat. Mog. Belt", --3/3
        })

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {
        -- -- Pet: -DT (37.5% to cap) / Pet: Regen
		main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
        sub="Genmei Shield", --10/0/0/0
        -- main="Idris", --0/0/25/0
        -- head="Azimuth Hood +3", --12/12/0/5
        -- body="Telchine Chas.", --0/0/0/3
        hands="Geo. mitaines +2", --3/0/13/0
        -- legs="Telchine Braconi", --0/0/0/3
        -- feet="Bagua Sandals +3", --0/0/0/5
        neck="Bagua Charm +2",
        -- ear1="Lugalbanda Earring",
        -- ear2="Odnowa Earring +1", --3/3/0/0
        -- ring2="Defending Ring", --10/10/0/0
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
        -- waist="Isa Belt" --0/0/3/1
        })

    sets.idle.DT.Pet = set_combine(sets.idle.Pet, {
        -- hands="Azimuth Gloves +3", --12/12
        -- back=gear.GEO_Idle_Cape, --5/5
        -- waist="Plat. Mog. Belt" --3/3
        })

    sets.PetHP = {} -- {head="Bagua Galero +3"}

    -- .Indi sets are for when an Indi-spell is active.
    --sets.idle.Indi = set_combine(sets.idle, {})
    --sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {})
    --sets.idle.DT.Indi = set_combine(sets.idle.DT, {})
    --sets.idle.DT.Pet.Indi = set_combine(sets.idle.DT.Pet, {})

    sets.Moving = {right_ring="Shneddick Ring"}

    sets.latent_refresh = {} -- {waist="Fucho-no-Obi"}

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {        }


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.magic_burst = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Agwu's Cap",
        body="Azimuth Coat +2",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Agwu's Pigaches",
        neck={ name="Bagua Charm +2", augments={'Path: A',}},
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear={ name="Azimuth Earring", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+6',}},
        left_ring="Freke Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }

    sets.buff.Doom = {}-- {ring1={name="Saida Ring", bag="wardrobe3"}, ring2={name="Saida Ring", bag="wardrobe4"},}
    sets.Obi = {}-- {waist="Hachirin-no-Obi"}
    -- sets.CP = {back="Mecisto. Mantle"}

end
