function user_setup()
    state.WeaponMode:options('Aettir')
    state.MeleeMode:options('TP', 'Hybrid', 'Parry', 'Meva', 'AoE')
    state.MeleeMode:set('TP')
end

function init_gear_sets()

    sets.weapons["Aettir"] = {main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}}}

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body="Runeist Coat +4",
        hands="Nyame Gauntlets",
        legs="Eri. Leg Guards +3",
        feet="Erilaz Greaves +3",
        neck="Elite Royal Collar",
        waist="Null Belt",
        left_ear="Alabaster Earring",
        right_ear={ name="Erilaz Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
        left_ring="Gurebu's Ring",
        right_ring="Murky Ring",
        back="Null Shawl",
    }

    sets.idle.AoE = set_combine(sets.idle, {
        body="Erilaz Surcoat +3",
        -- waist="Flume Belt +1",
    })

    sets.engaged = {
        sub="Utu Grip",
        ammo="Coiste Bodhar",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Anu Torque",
        waist="Sailfi Belt +1",
        left_ear="Sherida Earring",
        right_ear="Crep. Earring",
        left_ring=gear.left_chirich_ring,
        right_ring=gear.right_chirich_ring,
        back="Null Shawl",
    }

    sets.engaged.Hybrid = {
        sub="Utu Grip",
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Nyame Flanchard",
        feet="Turms Leggings +1",
        neck="Anu Torque",
        waist="Sailfi Belt +1",
        left_ear="Sherida Earring",
        right_ear="Crep. Earring",
        left_ring=gear.left_chirich_ring,
        right_ring=gear.right_chirich_ring,
        back="Null Shawl",
    }

    sets.engaged.Parry = {
        -- sub={ name="Refined Grip +1", augments={'Path: A',}},
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Erilaz Surcoat +3",
        hands="Turms Mittens +1",
        legs="Eri. Leg Guards +3",
        feet="Turms Leggings +1",
        -- neck="Loricate Torque +1",
        -- waist="Flume Belt +1",
        -- left_ear="Tuisto Earring",
        -- right_ear="Erilaz Earring +1",
        -- left_ring="Defending Ring",
        -- right_ring="Moonlight Ring",
        -- back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

    sets.engaged.Meva = {
        -- sub={ name="Refined Grip +1", augments={'Path: A',}},
        ammo="Staunch Tathlum +1",
        -- head={ name="Nyame Helm", augments={'Path: B',}},
        body="Runeist Coat +4",
        hands="Erilaz Gauntlets +3",
        legs="Eri. Leg Guards +3",
        feet="Erilaz Greaves +3",
        -- neck={ name="Futhark Torque +2", augments={'Path: A',}},
        -- waist="Flume Belt +1",
        -- left_ear="Tuisto Earring",
        right_ear="Erilaz Earring +1",
        -- left_ring="Defending Ring",
        -- right_ring="Moonlight Ring",
        -- back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

    sets.engaged.AoE = set_combine(sets.engaged.Parry, {})

    sets.Enmity = {
        -- ammo="Sapience Orb",
        legs="Eri. Leg Guards +3",
        feet="Erilaz Greaves +3",
        -- neck="Moonlight Necklace",
        -- left_ring="Petrov Ring",
        -- back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

    sets.WS = {}

    sets.JA = {}

    sets.JA['Vallation'] = set_combine(sets.Enmity, {
        body="Runeist Coat",
        -- legs="Futhark Trousers",
    })

    sets.JA['Valiance'] = set_combine(sets.JA['Vallation'])
    sets.JA['Pflug'] = set_combine(sets.Enmity, {feet="Runeist's Boots"})
    sets.JA['Battuta'] = set_combine(sets.Enmity, {head="Futhark Bandeau"})
    sets.JA['Liement'] = set_combine(sets.Enmity, {body="Futhark Coat"})
    sets.JA['Lunge'] = {
        -- ammo="Ghastly Tathlum +1",
        -- head=gear.Herc_MAB_head,
        -- body="Carm. Sc. Mail +1",
        -- hands="Carmine Fin. Ga. +1",
        -- legs=gear.Herc_MAB_legs,
        -- feet=gear.Herc_MAB_feet,
        -- neck="Baetyl Pendant",
        -- ear1="Crematio Earring",
        -- ear2="Friomisi Earring",
        -- ring1={name="Fenrir Ring +1", bag="wardrobe3"},
        -- ring2={name="Fenrir Ring +1", bag="wardrobe4"},
        -- back="Argocham. Mantle",
        -- waist="Eschan Stone",
    }
    sets.JA['Swipe'] = set_combine(sets.JA['Lunge'])
    sets.JA['Gambit'] = set_combine(sets.Enmity, {hands="Runeist's Mitons"})
    sets.JA['Rayke'] = set_combine(sets.Enmity, {feet="Futhark Boots"})
    sets.JA['Elemental Sforzo'] = set_combine(sets.Enmity, {body="Futhark Coat"})
    sets.JA['Swordplay'] = set_combine(sets.Enmity, {hands="Futhark Mitons"})
    sets.JA['Vivacious Pulse'] = {
        head="Erilaz Galea +3",
        left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
    }

    sets.WS = {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        left_ear="Sherida Earring",
        right_ear="Ishvara Earring",
        -- left_ring="Niqmaddu Ring",
        -- right_ring="Regal Ring",
    }

    sets.WS['Resolution'] = set_combine(sets.WS, {})
    sets.WS['Dimidiation'] = set_combine(sets.WS, {})
    sets.WS['Herculean Slash'] = set_combine(sets.JA['Lunge'])

    sets.precast.FastCast = {
        head="Runeist Bandeau",
        body="Erilaz Surcoat +3",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Agwu's Slops",
        feet="Agwu's Pigaches",
        left_ear="Etiolation Earring",
        left_ring="Kishar Ring",
        right_ring="Prolix Ring",
    }

    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast, {
        -- legs="Futhark Trousers",
    })

    sets.midcast['Enhancing Magic'] = {
        head="Erilaz Galea +3",
        hands="Runeist Mitons",
        -- legs="Futhark Trousers",
        left_ring=gear.left_stikini_ring,
        right_ring=gear.right_stikini_ring,
    }

    sets.midcast.SIRD = {
		-- ammo="Staunch Tathlum +1", -- 10
		-- legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}, -- 20
		-- neck="Moonlight Necklace", -- 15
		-- waist="Audumbla Sash", -- 10
    }

    sets.midcast.Cure = {
        -- waist="Sroda Belt"
    }

    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
        -- head="Futhark Bandeau",
    })
    sets.midcast.Phalanx.SIRD = set_combine(sets.midcast.Phalanx, sets.midcast.SIRD)
    sets.midcast.Temper = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Flash = set_combine(sets.Enmity, {})
    sets.midcast.Foil = set_combine(sets.Enmity)
    sets.midcast.Regen = {head="Runeist Bandeau", right_ear="Erilaz Earring +1", waist="Sroda Belt"}
    sets.midcast.Refresh = {
        head="Erilaz Galea +3",
    }
    sets.midcast['Divine Magic'] = set_combine(sets.Enmity)

    sets.midcast['Blue Magic'] = {}
    sets.midcast['Blue Magic'].Enmity = set_combine(sets.Enmity)
    sets.midcast['Blue Magic'].SIRD = set_combine(sets.midcast.SIRD)
    sets.midcast['Blue Magic'].Enmity.SIRD = set_combine(sets.midcast['Blue Magic'].Enmity, sets.midcast['Blue Magic'].SIRD)

    sets.buff.Embolden = {back={ name="Evasionist's Cape", augments={'Enmity+3','"Embolden"+15','"Dbl.Atk."+2',}}}
end

function job_midcast(spell)
    equipSet = sets.midcast
    message = ''

    if spell.type == 'BlueMagic' then
        if blue_magic_emnity_spells:contains(spell.english) then
            equipSet = equipSet['Blue Magic'].Enmity
            message = 'Blue magic enmity set'
        -- elseif blue_magic_healing_spells:contains(spell.english) then
        --     equipSet = equipSet['Blue Magic'].Cure
        --     message = 'Blue magic healing set'
        end
    end

    if equipSet[state.MagicMode.value] then
        equipSet = equipSet[state.MagicMode.value]
        message = message..' ('..state.MagicMode.value..')'
    end

    if message ~= '' then
        log('job_midcast: '..message)
    end
    return equipSet
end
