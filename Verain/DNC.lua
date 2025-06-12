-- Load and initialize the include file.
include('Mekaider-Include')

state.WeaponMode:options('Aeneas', 'Tauret')
state.MeleeMode:options('TP', 'DT')

function get_sets()
    
    sets.weapons['Aeneas'] = {main="Aeneas", sub="Centovente"}
    sets.weapons['Tauret'] = {main="Tauret", sub="Crepuscular Knife"}

    sets.idle = {
        ammo="Staunch Tathlum",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Elite Royal Collar",
        waist="Null Belt",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warden's Ring",
        back="Null Shawl",
    }
    
    sets.Moving = {right_ring="Shneddick Ring"}

    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +3",
        neck={ name="Etoile Gorget +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Gere Ring",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    }

    sets.engaged.DualWield = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +3",
        neck={ name="Etoile Gorget +2", augments={'Path: A',}},
        waist={ name="Kentarch Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Gere Ring",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    }

    -- sets.engaged.DualWield.DT = {}

    sets.WS = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Maculele Tiara +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Etoile Gorget +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear="Ishvara Earring",
        left_ring="Ephramad's ring",
        right_ring="Regal Ring",
        back="Null Shawl",
    }

    sets.WS["Rudra's Storm"] = {
        ammo="Oshasha's Treatise",
        head="Maculele Tiara +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Etoile Gorget +2", augments={'Path: A',}},
        waist={ name="Kentarch Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Ephramad's Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    -- sets.WS["Rudra's Storm"].PDL = set_combine(sets.WS["Rudra's Storm"], {})

    sets.WS["Shark Bite"] = {
        ammo="Oshasha's Treatise",
        head="Maculele Tiara +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Caro Necklace",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Ephramad's Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.Waltz = {feet="Maxixi Toe Shoes +1"}
    sets.Waltz['Healing Waltz'] = {}
    sets.Jig = {feet="Maxixi Toe Shoes +1"}
    sets.Samba = {head="Maxixi Tiara +1"}
    sets.Step = {}
    sets.Flourish = {}
    sets.JA = {}

    sets.precast.FastCast = {}
end
