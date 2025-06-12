function user_setup()
    lockstyleset = 3
    set_lockstyle()
end

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    ---- Precast Sets ----

    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {
        feet="Wicce Sabots +2"
    }

    sets.precast.JA.Manafont = {} -- {body="Arch. Coat +1"}

    -- Fast cast sets for spells
    sets.precast.FC = {
        -- main={ name="Marin Staff +1", augments={'Path: A',}},
        -- sub="Enki Strap",
        head="Agwu's Cap",
        body="Agwu's Robe",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Agwu's Pigaches",
        neck="Loricate Torque +1",
        waist="Luminary Sash",
        left_ear="Calamitous Earring",
        right_ear="Malignance Earring",
        left_ring="Defending Ring",
        right_ring="Kishar Ring",
        back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, { })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak", waist="Shinjutsu-no-Obi +1"})
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})
    sets.precast.Storm = set_combine(sets.precast.FC, {ring2={name="Stikini Ring +1", bag="wardrobe4"},})

    sets.precast.FC.DeathMode = {}

    sets.precast.FC.Impact.DeathMode = set_combine(sets.precast.FC.DeathMode, {head=empty, body="Twilight Cloak", waist="Shinjutsu-no-Obi +1"})

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Vidohunir'] = {} -- INT

    sets.precast.WS['Myrkr'] = {} -- Max MP


    ---- Midcast Sets ----

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Cure = {}

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})

    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {})

    sets.midcast['Enhancing Magic'] = {}

    sets.midcast.EnhancingDuration = {}

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {})

    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {})

    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {})

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {})

    sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {ring1="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Protect

    sets.midcast.MndEnfeebles = {} -- MND/Magic accuracy

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {}) -- INT/Magic accuracy

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
    sets.midcast.Dispelga = set_combine(sets.midcast.IntEnfeebles, {main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})

    sets.midcast['Dark Magic'] = {}

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
        -- feet="Volte Gaiters",
    })

    sets.midcast.Death = {}

    sets.midcast.Death.Resistant = set_combine(sets.midcast.Death, {})

    -- Elemental Magic sets

    sets.midcast['Elemental Magic'] = {
        -- main={ name="Marin Staff +1", augments={'Path: A',}},
        -- sub="Enki Strap",
        head="Wicce Petasos +2",
        body="Wicce Coat +2",
        hands="Wicce Gloves +2",
        legs="Wicce Chausses +2",
        feet="Wicce Sabots +2",
        neck="Src. Stole +2",
        waist="Eschan Stone",
        left_ear="Friomisi Earring",
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring="Metamor. Ring +1",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    }

    sets.midcast['Elemental Magic'].DeathMode = set_combine(sets.midcast['Elemental Magic'], {
        -- main=gear.Grioavolr_MB,
        -- sub="Enki Strap",
        -- ammo="Ghastly Tathlum +1",
        -- legs="Amalric Slops +1",
        -- feet="Merlinic Crackows",
        -- back=gear.BLM_Death_Cape,
        })

    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
        -- sub="Khonsu",
        -- ammo="Pemphredo Tathlum",
        -- legs="Merlinic Shalwar",
        -- neck="Sanctity Necklace",
        -- waist="Sacro Cord",
        })

    sets.midcast['Elemental Magic'].Spaekona = set_combine(sets.midcast['Elemental Magic'], {
        -- sub="Khonsu",
        -- ammo="Pemphredo Tathlum",
        -- body="Spaekona's Coat +2",
        -- legs="Merlinic Shalwar",
        -- feet="Merlinic Crackows",
        -- neck="Erra Pendant",
        })

    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        -- head=empty,
        -- body="Twilight Cloak",
        -- ring2="Archon Ring",
        })

    sets.midcast.Impact.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
        -- sub="Khonsu",
        -- head=empty,
        -- body="Twilight Cloak",
    })

    sets.resting = {
        main="Chatoyant Staff",
        waist="Shinjutsu-no-Obi +1",
    }

    -- Idle sets

    sets.idle = {
        -- main="Mpaca's Staff",
        -- sub="Enki Strap",
        head="Wicce Petasos +2",
        body="Wicce Coat +2",
        hands="Wicce Gloves +2",
        legs="Assid. Pants +1",
        feet="Wicce Sabots +2",
        neck="Loricate Torque +1",
        waist="Eschan Stone",
        left_ear="Calamitous Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Fortified Ring",
        back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.idle.DT = set_combine(sets.idle, {})

    sets.idle.ManaWall = {
        feet="Wicce Sabots +2", 
    }

    sets.idle.DeathMode = {}

    sets.Moving = {right_ring="Shneddick Ring"}

    sets.idle.Town = set_combine(sets.idle, sets.Moving)

    -- Defense sets

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    sets.latent_refresh = {waist="Fucho-no-obi"}
    sets.latent_dt = {ear2="Sorcerer's Earring"}

    sets.magic_burst = {
        -- main={ name="Marin Staff +1", augments={'Path: A',}},
        -- sub="Enki Strap",
        ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",
        body="Wicce Coat +2",
        hands="Agwu's Gages",
        legs="Wicce Chausses +2",
        feet="Agwu's Pigaches",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
        waist="Eschan Stone",
        left_ear="Friomisi Earring",
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring="Mujin Band",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    }

    sets.magic_burst.Resistant = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group

    sets.engaged = {
        head="Nyame Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Nyame Flanchard",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Loricate Torque +1",
        waist="Eschan Stone",
        left_ear="Telos Earring",
        right_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Rajas Ring",
        back="Repulse Mantle",
    }

    sets.buff.Doom = {}

    sets.DarkAffinity = {
        -- head="Pixie Hairpin +1",
        -- ring2="Archon Ring"
    }
    sets.Obi = {
        waist="Hachirin-no-Obi"
    }
    -- sets.CP = {back="Mecisto. Mantle"}

    sets.buff.Sublimation = {
        waist="Embla Sash"
    }
end