-- Load and initialize the include file.
include('Mekaider-Include')
send_command('gs c update')

-- state.DebugMode:set(true)

state.WeaponMode:options(
    'SavageBlade',
    'BlackHalo',
    'Magical',
    'Learning'
)
state.MeleeMode:options('TP', 'DT', 'Learning')

function get_sets()
    sets.weapons['SavageBlade'] = {main="Naegling", sub="Thibron"}
    sets.weapons['BlackHalo'] = {main="Maxentius", sub="Thibron"}
    sets.weapons['Magical'] = {main="Maxentius", sub="Bunzi's Rod"}
    sets.weapons['Learning'] = {main="Esoteric Athame", sub="Qutrub Knife"}
    sets.weapons.Shield = {sub="Genmei Shield"}

    sets.Moving = {right_ring="Shneddick Ring"}

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body="Shamash Robe",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring={name="Stikini Ring +1", bag="wardrobe3"},
        right_ring={name="Stikini Ring +1", bag="wardrobe4"},
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged = {
        ammo="Coiste Bodhar",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','VIT+5',}},
        neck="Asperity Necklace",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Epona's Ring",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    }

    sets.engaged.DT = set_combine(sets.engaged, {
        head="Malignance Chapeau", --6/6
        body="Malignance Tabard", --9/9
        hands="Malignance Gloves", --5/5
        legs="Malignance Tights", --7/7
        feet="Malignance Boots", --4/4
        left_ring="Defending Ring", --10/10
    })

    -- doubles as MaxDW set
    sets.engaged.DualWield = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        -- hands={ name="Floral Gauntlets", augments={'Rng.Acc.+14','Accuracy+13','"Triple Atk."+2','Magic dmg. taken -3%',}}, -- 5
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}, -- 6
        waist="Reiki Yotai", -- 7
        left_ear="Eabani Earring", -- 4
        right_ear="Suppanomimi", -- 5
    })

    sets.engaged.DualWield.LowDW = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        left_ear="Suppanomimi", -- 5
    })

    sets.engaged.DualWield.MidDW = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        left_ear="Suppanomimi", -- 5
    })

    sets.engaged.DualWield.DT = set_combine(sets.engaged.DT, {
        waist="Reiki Yotai", -- 7
        left_ear="Eabani Earring", -- 4
        right_ear="Suppanomimi", -- 5
    })

    sets.engaged.DualWield.DT.LowDW = set_combine(sets.engaged.DT, {
        waist="Reiki Yotai", -- 7
        left_ear="Eabani Earring", -- 4
    })

    sets.engaged.DualWield.DT.MidDW = set_combine(sets.engaged.DT, {
        waist="Reiki Yotai", -- 7
        left_ear="Eabani Earring", -- 4
    })

    sets.WS = {
        ammo="Coiste Bodhar",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Asperity Necklace",
        waist="Windbuffet Belt +1",
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Epona's Ring",
        left_ring="Epaminondas's Ring",
        back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Savage Blade'] = {
        ammo="Oshasha's Treatise",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Epaminondas's Ring",
        right_ring="Sroda Ring",
        back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Black Halo'] = set_combine(sets.WS['Savage Blade'])

    -- sets.JA
    sets.precast.FastCast = {
        ammo="Sapience Orb",
        body={ name="Taeon Tabard", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="Lengo Pants", augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1',}},
        neck="Voltsurge Torque",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",
    }

    sets.precast.FastCast['Blue Magic'] = set_combine(sets.precast.FastCast, {})

    -- hack until I've done blu spell logic
    sets.midcast.Subduction = {
        ammo="Pemphredo Tathlum",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Shamash Robe",
        hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        left_ear="Crematio Earring",
        right_ear="Regal Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Null Shawl",
    }

    sets.midcast.Entomb = {
        ammo="Pemphredo Tathlum",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Shamash Robe",
        hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        left_ear="Crematio Earring",
        right_ear="Regal Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Null Shawl",
    }

    sets.midcast.Subduction = {
        ammo="Pemphredo Tathlum",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Shamash Robe",
        hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        left_ear="Crematio Earring",
        right_ear="Regal Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Null Shawl",
    }

    sets.midcast['Tenebral Crush'] = {
        ammo="Pemphredo Tathlum",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Shamash Robe",
        hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        left_ear="Crematio Earring",
        right_ear="Regal Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Null Shawl",
    }

    sets.midcast['Spectral Floe'] = {
        ammo="Pemphredo Tathlum",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Shamash Robe",
        hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        left_ear="Crematio Earring",
        right_ear="Regal Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Null Shawl",
    }



    sets.Obi = {waist="Hachirin-no-Obi"}
end
