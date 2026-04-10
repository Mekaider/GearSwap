function user_setup()
    state.WeaponMode = M{['description']='Weapon', 'Naegling', 'Dagger', 'Sword', 'Club', 'Katana', 'GreatKatana', 'Polearm', 'Scythe', 'Staff', 'GreatSword'}
end

function user_unload() end

function init_gear_sets()
    sets.weapons.Naegling={main="Naegling", sub="Gleti's Knife"}
    sets.weapons.Dagger={main="Qutrub Knife", sub="Extinction"}
    sets.weapons.Sword={main="Nihility", sub="Extinction"}
    sets.weapons.Club={main="Chocobo Wand", sub="Extinction"}
    sets.weapons.Katana={main="Yagyu Shortblade", sub="Extinction"}
    sets.weapons.GreatKatana={main="Zanmato"}
    sets.weapons.Polearm={main="Sha Wujing's Lance"}
    sets.weapons.Scythe={main="Lost Sickle"}
    sets.weapons.Staff={main="Cobra Staff"}
    sets.weapons.GreatSword={main="Lament"}

    sets.idle = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Purity Ring",
        back="Null Shawl",
    }

    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','VIT+5',}},
        neck="Iskur Gorget",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Dedition Earring",
        right_ear="Cessance Earring",
        left_ring="Gere Ring",
        right_ring="Epona's Ring",
        back="Null Shawl",
    }

    sets.WS['Savage Blade'] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Asperity Necklace",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Epaminondas's Ring",
        right_ring="Regal Ring",
        back="Relucent Cape",
    }
end
