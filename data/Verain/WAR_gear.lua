function user_setup()
    state.WeaponMode:options('Naegling', 'Club', 'ShiningOne')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.weapons.Naegling = {main="Naegling", sub="Blurred Shield +1"}
    sets.weapons.Club = {main={name="Loxotic Mace +1", augments={'Path: A',}}, sub="Blurred Shield +1"}
    sets.weapons.ShiningOne = {main="Shining One", sub="Utu Grip"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Idle Sets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Loricate Torque +1",
		waist="Sailfi Belt +1",
		left_ear="Odnowa Earring",
		right_ear="Infused Earring",
		left_ring="Defending Ring",
		right_ring="Warden's Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
		ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body="Hjarrandi Breast.",
        hands="Sakpata's Gauntlets",
        legs="Pumm. Cuisses +3",
        feet="Flam. Gambieras +2",
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Schere Earring",
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Chirich Ring +1",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.DT = set_combine(sets.engaged, {
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
    })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weaponskill Sets --------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.WS = {
		ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="War. Beads +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		left_ear="Thrud Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Niqmaddu Ring",
		right_ring="Epaminondas's Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- JA Sets -----------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.JA['Berserk'] = {}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Magic Precast Sets ------------------------------------
    ------------------------------------------------------------------------------------------------


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Magic Midcast Sets ------------------------------------
    ------------------------------------------------------------------------------------------------
end
