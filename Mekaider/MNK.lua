-- Load and initialize the include file.
include('Mekaider-Include')

lockstyleset = 7
send_command('wait 5; input /lockstyleset '..lockstyleset)

state.WeaponMode:options('Verethragna', 'Godhands', 'Unlocked')
state.WeaponMode:set('Verethragna')

state.MeleeMode:options('TP', 'Acc', 'DT', 'PDL')
state.MeleeMode:set('TP')

function get_sets()
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
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Loricate Torque +1",
        waist="Moonbow Belt +1",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Purity Ring",
    	back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+8','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},  
    }


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    
    sets.engaged = {
		ammo="Coiste Bodhar",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Bhikku Hose +2",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+8','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

    sets.engaged.Acc = set_combine(sets.engaged, {
        right_ear={ name="Bhikku Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Store TP"+4',}},
    })

    sets.engaged.DT = set_combine(sets.engaged, {
		head="Malignance Chapeau", -- 6
		body="Malignance Tabard", -- 9
		hands="Malignance Gloves", -- 5
		legs="Bhikku Hose +2", -- 13
		feet="Malignance Boots", -- 4
	})

    sets.engaged.Impetus = set_combine(sets.engaged, {body="Bhikku Cyclas +2"})
    sets.engaged.DT.Impetus = set_combine(sets.engaged.DT, {body="Bhikku Cyclas +2"})

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

    sets.WS.Impetus = set_combine(sets.WS, {body="Bhikku Cyclas +2"})

    sets.WS['Shijin Spiral'] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Malignance Chapeau",
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

    sets.WS['Victory Smite'].Impetus = set_combine(sets.WS, {body="Bhikku Cyclas +2"})

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- JA Sets -----------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.JA['Berserk'] = {}
    sets.JA['Hundred Fists'] = {legs={ name="Hes. Hose +2", augments={'Enhances "Hundred Fists" effect'}}}
    sets.JA['Focus'] = {}
    sets.JA['Dodge'] = {}
    sets.JA['Chakra'] = {}
    sets.JA['Boost'] = {}
    sets.JA['Counterstance'] = {}
    sets.JA['Chi Blast'] = {}
    sets.JA['Mantra'] = {}
    sets.JA['Footwork'] = {}
    sets.JA['Perfect Counter'] = {}
    sets.JA['Impetus'] = {}
end
