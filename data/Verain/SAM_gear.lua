function user_setup()
    state.WeaponSet = M{['description']='Weapon', 'Dojikiri', 'ShiningOne'}

    lockstyleset = 7
    set_lockstyle()
end

function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.Dojikiri = {main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},sub="Utu Grip"}
    sets.ShiningOne = {main="Shining One", sub="Utu Grip"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Idle Sets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.Moving = {right_ring="Shneddick Ring"}

    sets.idle = {
        ammo="Coiste Bodhar",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Loricate Torque +1",
        waist="Sailfi Belt +1",
        left_ear="Odnowa Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warden's Ring",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body="Flamma Korazin +2",
		hands="Flam. Manopolas +2",
		legs={ name="Ryuo Hakama +1", augments={'Accuracy+25','"Store TP"+5','Phys. dmg. taken -4',}},
		feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
		neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		left_ear="Telos Earring",
		right_ear="Schere Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Chirich Ring +1",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

    sets.engaged.Acc = {}

    sets.engaged.PDL = {}

    sets.engaged.Hybrid = {}

    sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
    sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.Hybrid)
    sets.engaged.PDL.DT = set_combine(sets.engaged.PDL, sets.engaged.Hybrid)

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weaponskill Sets --------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.WS = {
        ammo="Knobkierrie",
        head="Mpaca's Cap",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Ephramad's Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS.Acc = {}

    sets.precast.WS.PDL = {}

    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, { 
        head={ name="Nyame Helm", augments={'Path: B',}},
        waist="Orpheus's Sash",
        right_ear="Friomisi Earring",
    })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- JA Sets -----------------------------------------------
    ------------------------------------------------------------------------------------------------

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Magic Precast Sets ------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.FC = {}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Magic Midcast Sets ------------------------------------
    ------------------------------------------------------------------------------------------------
end