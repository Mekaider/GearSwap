function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'PDL')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'DT')

    state.WeaponSet = M{['description']='Weapon', 'Trishula', 'Naegling'}

    -- select_default_macro_book()
    -- lockstyleset = 5
    -- set_lockstyle()
end

function user_unload()
end

function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.Trishula = {main="Trishula", sub="Utu Grip"}
    sets.Naegling = {main="Naegling"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Idle Sets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Nyame Flanchard",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Loricate Torque +1",
        waist="Sailfi Belt +1",
        left_ear="Odnowa Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warden's Ring",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.idle.DT = set_combine(sets.idle, {})

    sets.idle.Pet = set_combine(sets.idle, {})

    sets.idle.DT.Pet = set_combine(sets.idle.Pet, {})

    sets.idle.Weak = sets.idle.DT

    sets.Moving = {right_ring="Shneddick Ring"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
        ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body="Pelt. Plackart +3",
        hands="Pel. Vambraces +3",
        legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},        
        feet="Flam. Gambieras +2",
        neck="Vim Torque +1",
        waist="Sailfi Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Chirich Ring +1",
        right_ring="Niqmaddu Ring",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.Acc = set_combine(sets.engaged, {})

    sets.engaged.PDL = set_combine(sets.engaged, {})

    sets.engaged.DT = set_combine(sets.engaged, {
        head="Hjarrandi Helm",
        body="Hjarrandi Breast.",
        neck="Loricate Torque +1",
        left_ring="Defending Ring",
    })

    sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.DT)
    sets.engaged.PDL.DT = set_combine(sets.engaged.PDL, sets.engaged.DT)

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weaponskill Sets --------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.WS = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        -- legs="Pelt. Cuissots +3", -- only while using Shining One - change when get a better polearm
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Ishvara Earring",
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Impulse Drive'] = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +3",
        body="Hjarrandi Breast.",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Impulse Drive'].Acc = sets.precast.WS['Impulse Drive']

    sets.precast.WS['Impulse Drive'].PDL = {
        ammo="Knobkierrie",
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},        
        feet="Gleti's Boots",
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
        -- ammo="Knobkierrie",
        -- head="Flam. Zucchetto +2",
        -- body="Pelt. Plackart +3",
        -- hands="Gleti's Gauntlets",
        -- legs="Gleti's Breeches",
        -- feet="Sulev. Leggings +2",
        -- neck="Anu Torque",
        -- waist="Soil Belt",
        -- left_ear="Sherida Earring",
        -- right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        -- left_ring="Niqmaddu Ring",
        -- right_ring="Regal Ring",
        -- back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    })

    sets.precast.WS['Stardiver'] = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +3",
        body="Pelt. Plackart +3",
        hands="Pel. Vambraces +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Light Belt",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Stardiver'].PDL = set_combine(sets.precast.WS['Stardiver'], {})

    sets.precast.WS['Savage Blade'] = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- JA Sets -----------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.JA['Spirit Surge'] = {body="Ptero. Mail +3"}
    sets.precast.JA['Call Wyvern'] = {body="Ptero. Mail +3"}
    sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais +3"}

    sets.precast.JA['Spirit Link'] = {}

    sets.precast.JA['Steady Wing'] = {}

    sets.precast.JA['Jump'] = {}

    sets.precast.JA['High Jump'] = sets.precast.JA['Jump']
    sets.precast.JA['Spirit Jump'] = sets.precast.JA['Jump']
    sets.precast.JA['Soul Jump'] = set_combine(sets.precast.JA['Jump'], {body="Vishap Mail +3", hands="Emi. Gauntlets +1", legs=gear.Valo_STP_legs})
    sets.precast.JA['Super Jump'] = {}

    sets.precast.JA['Angon'] = {ammo="Angon", hands="Ptero. Fin. G. +3"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Magic Precast Sets ------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Fast cast sets for spells
    sets.precast.FC = {}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Magic Midcast Sets ------------------------------------
    ------------------------------------------------------------------------------------------------

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Other Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.buff.Doom = {
        -- neck="Nicander's Necklace", --20
        -- ring1={name="Eshmun's Ring", bag="wardrobe3"}, --20
        -- ring2={name="Eshmun's Ring", bag="wardrobe4"}, --20
        -- waist="Gishdubar Sash", --10
    }

end