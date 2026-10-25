function user_setup()
    state.WeaponMode:options('Verethragna', 'Godhands', 'Unlocked')
    state.MeleeMode:options('Normal')
end

function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.weapons['Verethragna'] = {main={ name="Verethragna", augments={'Path: A'}}}
    sets.weapons['Godhands'] = {main="Godhands"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Idle Sets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.Moving = {right_ring="Shneddick Ring"}

    sets.idle = {
        head="Null Masque",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Elite Royal Collar",
        waist="Moonbow Belt +1",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Murky Ring",
        right_ring="Purity Ring",
    	back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+8','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
		ammo="Coiste Bodhar",
		head="Bhikku Crown +3",
		body={ name="Mpaca's Doublet", augments={'Path: A',}},
		hands="Malignance Gloves",
		legs="Bhikku Hose +3",
		feet="Anch. Gaiters +4",
		neck="Anu Torque",
		waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+8','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

    --  sets.engaged.DT = set_combine(sets.engaged, {
	-- })

    sets.engaged.Impetus = set_combine(sets.engaged, {body="Bhikku Cyclas +3"})
    -- sets.engaged.DT.Impetus = set_combine(sets.engaged.DT, {body="Bhikku Cyclas +3"})

    sets.engaged.Godhands = set_combine(sets.engaged, {
        right_ear="Mache Earring +1",
    })
    sets.engaged.Godhands.Impetus = set_combine(sets.engaged.Godhands, {body="Bhikku Cyclas +3"})

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weaponskill Sets --------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.WS = {
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- Need Aug'd
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Mpaca's Hose",
		feet="Mpaca's Boots", -- Need Aug a Herc Feet
		-- neck="Mnk. Nodowa +2",
		waist="Moonbow Belt +1",
        right_ear = "Ishvara Earring",
		right_ear="Moonshade Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Regal Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+8','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

    sets.WS.Impetus = set_combine(sets.WS, {body="Bhikku Cyclas +3"})

    sets.WS['Shijin Spiral'] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Bhikku Crown +3",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Mpaca's Hose",
        feet="Mpaca's Boots",
        neck="Anu Torque",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear={ name="Bhikku Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Store TP"+4',}},
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+8','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

        sets.WS['Victory Smite'] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="Ken. Samue +1",
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Mpaca's Hose",
        feet="Mpaca's Boots",
        neck="Anu Torque",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Odr Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+8','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.WS['Victory Smite'].Impetus = set_combine(sets.WS, {body="Bhikku Cyclas +3"})

    sets.WS['Dragon Kick'] = {
        ammo="Knobkierrie",
        head="Mpaca's Cap",
        body="Bhikku Cyclas +3",
        hands="Mpaca's Gloves",
        legs="Mpaca's Hose",
        feet="Anch. Gaiters +4",
        neck="Rep. Plat. Medal",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Moonshade Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+8','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.WS['Tornado Kick'] = {
        ammo="Knobkierrie",
        head="Mpaca's Cap",
        body="Bhikku Cyclas +3",
        hands="Mpaca's Gloves",
        legs="Mpaca's Hose",
        feet="Anch. Gaiters +4",
        neck="Rep. Plat. Medal",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Moonshade Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+8','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- JA Sets -----------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.JA['Hundred Fists'] = {legs={ name="Hes. Hose +2", augments={'Enhances "Hundred Fists" effect'}}}
    sets.JA['Focus'] = {}
    sets.JA['Dodge'] = {feet="Anch. Gaiters +4"}
    sets.JA['Chakra'] = {hands="Hes. Gloves +3"}
    sets.JA['Boost'] = {}
    sets.JA['Counterstance'] = {}
    sets.JA['Chi Blast'] = {}
    sets.JA['Mantra'] = {}
    sets.JA['Footwork'] = {}
    sets.JA['Perfect Counter'] = {}
    sets.JA['Impetus'] = {}
end
