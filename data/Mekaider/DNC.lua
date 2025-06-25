-- Load and initialize the include file.
include('Mekaider-Include')

lockstyleset = 20
send_command('wait 5; input /lockstyleset '..lockstyleset)

state.WeaponMode:options('Tauret', 'T/C', 'Karambit', 'Unlocked')
state.WeaponMode:set('Tauret')
state.MeleeMode:options('TP', 'DT', 'PDL')
state.MeleeMode:set('TP')

function get_sets()
    
    sets.weapons['Tauret'] = {main="Tauret", sub="Gleti's Knife"}
    sets.weapons['T/C'] = {main="Tauret", sub="Centovente"}
    sets.weapons['Karambit'] = {main="Karambit"}

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Loricate Torque +1",
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Purity Ring",
        right_ring="Warden's Ring",
        back="Repulse Mantle",
    }
    
    sets.Moving = {right_ring="Shneddick Ring"}

    sets.engaged = {}

    sets.engaged.DualWield = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="Malignance Tabard",
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet="Macu. Toe Sh. +2",
        neck="Anu Torque",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear={ name="Macu. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','"Store TP"+5',}},
        left_ring="Gere Ring",
        right_ring="Epona's Ring",
        back="Null Shawl",
    }

    sets.engaged.DualWield.DT = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        -- neck="Anu Torque",
        neck="Null Loop",
        -- waist="Windbuffet Belt +1",
        waist="Kentarch Belt +1",
        left_ear="Sherida Earring",
        right_ear={ name="Macu. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','"Store TP"+5',}},
        left_ring={name="Moonlight Ring", bag="wardrobe2"},
        right_ring={name="Moonlight Ring", bag="wardrobe4"},
        back="Null Shawl",
    }

    sets.WS = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear={ name="Macu. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','"Store TP"+5',}},
        left_ring="Cornelia's ring",
        right_ring="Regal Ring",
        back="Null Shawl",
    }

    sets.JA = {}

    sets.precast.FastCast = {}
end
