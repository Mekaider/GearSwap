-- Load and initialize the include file.
include('Mekaider-Include')

state.WeaponMode:options('Aettir', 'Lycurgos', 'Unlocked')
state.WeaponMode:set('Aettir')
state.MeleeMode:options('TP', 'Hybrid', 'Parry', 'Meva', 'AoE')
state.MeleeMode:set('Hybrid')
state.MagicMode:options('Normal', 'SIRD')
state.MagicMode:set('Normal')

function get_sets()

    sets.weapons["Aettir"] = {main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}}}
    sets.weapons["Lycurgos"] = {main="Lycurgos"}

    sets.Moving = {right_ring="Shneddick Ring"}

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Tuisto Earring",
        right_ear="Erilaz Earring +1",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

    sets.idle.AoE = set_combine(sets.idle, {
        body="Erilaz Surcoat +2",
        waist="Flume Belt +1",
    })

    sets.engaged = {
        sub="Utu Grip",
        ammo="Coiste Bodhar",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','VIT+5',}},
        neck="Anu Torque",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Epona's Ring",
        back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.Hybrid = {
        sub="Utu Grip",
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Ashera Harness",
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Anu Torque",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.Parry = {
        sub={ name="Refined Grip +1", augments={'Path: A',}},
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Erilaz Surcoat +2",
        hands="Turms Mittens +1",
        legs="Eri. Leg Guards +2",
        feet="Turms Leggings +1",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Tuisto Earring",
        right_ear="Erilaz Earring +1",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

    sets.engaged.Meva = {
        sub={ name="Refined Grip +1", augments={'Path: A',}},
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Erilaz Surcoat +2",
        hands="Turms Mittens +1",
        legs="Eri. Leg Guards +2",
        feet="Erilaz Greaves +2",
        neck={ name="Futhark Torque +2", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Tuisto Earring",
        right_ear="Erilaz Earring +1",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

    sets.engaged.AoE = set_combine(sets.engaged.Parry, {})

    sets.Enmity = {
        ammo="Sapience Orb",
        legs="Eri. Leg Guards +2",
        feet="Erilaz Greaves +2",
        neck="Moonlight Necklace",
        left_ring="Petrov Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

    sets.WS = {}

    sets.JA = {}

    sets.JA['Vallation'] = set_combine(sets.Enmity, {
        body="Runeist Coat",
        legs="Futhark Trousers",
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
        head="Erilaz Galea",
        ring1={name="Stikini Ring +1", bag="wardrobe3"},
        ring2={name="Stikini Ring +1", bag="wardrobe4"},
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
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
    }

    sets.WS['Resolution'] = set_combine(sets.WS, {})
    sets.WS['Dimidiation'] = set_combine(sets.WS, {})
    sets.WS['Herculean Slash'] = set_combine(sets.JA['Lunge'])

    sets.precast.FastCast = {
        ammo="Sapience Orb",
        head="Runeist Bandeau",
        body="Erilaz Surcoat +2",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Loricate Torque +1",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Tuisto Earring",
        right_ear="Eabani Earring",
        left_ring="Kishar Ring",
        right_ring="Prolix Ring",
        back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast, {
        legs="Futhark Trousers",
    })

    sets.midcast['Enhancing Magic'] = {
        head="Erilaz Galea",
        hands="Runeist Mitons",
        legs="Futhark Trousers",
        left_ring={name="Stikini Ring +1", bag="wardrobe3"},
        right_ring={name="Stikini Ring +1", bag="wardrobe4"},
    }

    sets.midcast.SIRD = {
		ammo="Staunch Tathlum +1", -- 10
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}, -- 20
		neck="Moonlight Necklace", -- 15
		waist="Audumbla Sash", -- 10
    }

    sets.midcast.Cure = {
        waist="Sroda Belt"
    }

    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
        head="Futhark Bandeau",
    })
    sets.midcast.Phalanx.SIRD = set_combine(sets.midcast.Phalanx, sets.midcast.SIRD)
    sets.midcast.Temper = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Flash = set_combine(sets.Enmity, {})
    sets.midcast.Foil = set_combine(sets.Enmity)
    sets.midcast.Regen = {head="Runeist Bandeau", right_ear="Erilaz Earring", waist="Sroda Belt"}
    sets.midcast.Refresh = {
        head="Erilaz Galea",
    }
    sets.midcast['Divine Magic'] = set_combine(sets.Enmity)

    sets.midcast['Blue Magic'] = {}
    sets.midcast['Blue Magic'].Enmity = set_combine(sets.Enmity)
    sets.midcast['Blue Magic'].SIRD = set_combine(sets.midcast.SIRD)
    sets.midcast['Blue Magic'].Enmity.SIRD = set_combine(sets.midcast['Blue Magic'].Enmity, sets.midcast['Blue Magic'].SIRD)

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
