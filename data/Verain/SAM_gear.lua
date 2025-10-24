function user_setup()
    state.WeaponMode:options('Dojikiri', 'Ichi', 'ShiningOne')
    state.MeleeMode:options('Normal', 'Meva')
end

function init_gear_sets()
    sets.weapons['Dojikiri'] = {main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},sub="Utu Grip"}
    sets.weapons['Ichi'] = {main={ name="Ichigohitofuri", augments={'DMG:+30','STR+20','Attack+20',}},sub="Utu Grip"}
    sets.weapons['ShiningOne'] = {main="Shining One", sub="Utu Grip"}

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

    sets.engaged = {
		ammo="Coiste Bodhar",
		head="Kasuga Kabuto +2",
        body="Kasuga Domaru +2",
		hands="Acro Gauntlets",
		legs="Kasuga Haidate +2",
		feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
		neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		left_ear="Telos Earring",
		right_ear="Kasuga Earring +1",
		left_ring="Niqmaddu Ring",
		right_ring="Chirich Ring +1",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

    sets.engaged.Meva = set_combine(sets.engaged, {
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        back="Null Shawl"
    })

    sets.WS = {
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

    sets.WS['Tachi: Jinpu'] = set_combine(sets.WS, {
        head={ name="Nyame Helm", augments={'Path: B',}},
        right_ear="Friomisi Earring",
    })

    sets.JA = {}

    sets.precast.FastCast = {}
end
