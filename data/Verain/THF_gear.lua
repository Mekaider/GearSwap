function user_setup()
    state.WeaponMode:options("Aeneas", "MpuGandring")
end

function init_gear_sets()
    sets.weapons["Aeneas"] = {main="Aeneas", sub="Centovente"}
    sets.weapons["MpuGandring"] = {main="Mpu Gandring", sub="Centovente"}

    sets.TreasureHunter = {feet="Skulk. Poulaines +3"}

    sets.idle = {
        ammo="Yamarang",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Gleti's Boots",
        neck="Elite Royal Collar",
        left_ear="Sherida Earring",
        right_ear="Odnowa Earring",
        left_ring="Murky Ring",
        right_ring="Defending Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Gleti's Boots",
        neck="Anu Torque",
        waist="Sailfi Belt +1",
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Epona's Ring",
        right_ring="Gere Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Store TP"+10','Phys. dmg. taken-10%',}},
    }
end
