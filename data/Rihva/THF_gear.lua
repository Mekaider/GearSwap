function user_setup()
    state.WeaponMode:options("Tauret", "Aeolian Edge")
end

function init_gear_sets()
    sets.weapons["Tauret"] = {main="Tauret", sub="Gleti's knife"}
    sets.weapons["Aeolian Edge"] = {main="Tauret", sub="Centovente"}

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Elite Royal Collar",
        waist="Carrier's Sash",
        left_ear="Arete del Luna +1",
        right_ear="Infused Earring",
        left_ring="Murky Ring",
        right_ring="Defending Ring",
        back="Null Shawl",
    }

    sets.engaged = {
        main="Tauret",
        sub="Centovente",
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Iskur Gorget",
        waist="Sailfi Belt +1",
        left_ear="Sherida Earring",
        right_ear={ name="Skulk. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Store TP"+4',}},
        left_ring="Epona's Ring",
        right_ring="Gere Ring",
        back="Null Shawl",
    }

    sets.TreasureHunter = {
        head="Volte Cap",
        body="Volte Jupon",
        hands="Plun. Armlets +1",
    }
end
