function user_setup()
    state.MeleeMode:options('TP', 'DT')
    state.WeaponMode = M{['description']='Weapon', 'Kenkonken', 'Verethragna', 'Godhands', 'Xiucoatl'}

    send_command('lua l autocontrol')
end

function user_unload()
    send_command('lua u autocontrol')
end

function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.weapons.Kenkonken = {main="Kenkonken", range="Neo Animator"}
    sets.weapons.Verethragna = {main={ name="Verethragna", augments={'Path: A'}}}
    sets.weapons.Godhands = {main="Godhands"}
    sets.weapons.Xiucoatl = {main={ name="Xiucoatl", augments={'Path: C',}}}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Idle Sets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        left_ear="Eabani earring",
        right_ear="Infused Earring",
        left_ring = "Murky Ring",
		right_ring = "Purity Ring",
		neck="Elite Royal Collar",
        waist="Moonbow Belt +1",
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Crit.hit rate+10','Phys. dmg. taken-10%',}},
    }

    sets.idle.Pet = set_combine(sets.idle, {
        left_ear="Enmerkar Earring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Phys. dmg. taken-10%',}},
    })

    sets.idle.Pet.Engaged = {
        head={ name="Taeon Chapeau", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        body={ name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
        hands={ name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
        legs={ name="Taeon Tights", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash",
        left_ear="Enmerkar Earring",
        right_ear="Karagoz Earring +1",
        left_ring="Defending Ring",
        right_ring="Overbearing Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
        head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        body="Mpaca's Doublet",
        hands="Karagoz Guanti +2",
        legs={ name="Ryuo Hakama +1", augments={'Accuracy+25','"Store TP"+5','Phys. dmg. taken -4',}},
        feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','VIT+5',}},
        neck="Shulmanu Collar",
        waist="Moonbow Belt +1",
        left_ear="Schere Earring",
        right_ear="Dedition Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Epona's Ring",
        back="Null Shawl"
    }

    sets.engaged.DT = {
        head="Malignance Chapeau", --6/6
        body="Malignance Tabard", --9/9
        hands="Karagoz Guanti +2",
        legs="Malignance Tights", --7/7
        feet="Malignance Boots", --4/4
        neck="Loricate Torque +1",
        waist="Moonbow Belt +1",
        left_ear="Schere Earring",
        right_ear="Dedition Earring",
        left_ring = "Murky Ring",
        right_ring="Niqmaddu Ring",
        back="Null Shawl"
    }
end
