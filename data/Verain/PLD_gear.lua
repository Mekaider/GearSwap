function user_setup()
    state.WeaponMode:options("Sakpata", "Naegling")
    state.ShieldMode:options('Priwen', 'Duban')
    state.MeleeMode:options('PDT', 'AoE', 'Meva')
    state.MagicMode:set('SIRD')
end


function init_gear_sets()
    sets.weapons["Sakpata"] = {main="Sakpata's Sword"}
    sets.weapons["Naegling"] = {main="Naegling"}

    sets.Moving = {right_ring="Shneddick Ring"}

    sets.idle = {
        ammo="Staunch Tathlum",
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Elite Royal Collar",
        waist="Null Belt",
        left_ear="Odnowa Earring +1",
        right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
        left_ring="Defending Ring",
        right_ring="Warden's Ring",
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Chance of successful block +5',}},
    }

    sets.idle.AoE = set_combine(sets.idle, {
        head="Chev. Armet +2",
        legs="Chev. Cuisses +3",
    })

    sets.engaged = {
        ammo="Staunch Tathlum",
        head="Chev. Armet +2",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands="Sakpata's Gauntlets",
        legs="Chev. Cuisses +3",
        feet="Sakpata's Leggings",
        neck="Elite Royal Collar",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Odnowa Earring +1",
        right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
        left_ring="Defending Ring",
        right_ring="Warden's Ring",
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Chance of successful block +5',}},
    }

    sets.Enmity = {
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet="Chev. Sabatons +2",
        neck="Moonlight Necklace",
        waist="Creed Baudrier",
        left_ring="Eihwaz Ring",
        right_ring="Apeile Ring +1",
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Chance of successful block +5',}},
    }

    sets.precast.FastCast = {
        head={ name="Odyssean Helm", augments={'"Mag.Atk.Bns."+28','"Fast Cast"+3','Magic Damage +6','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
        feet="Chev. Sabatons +2",
        left_ring="Kishar Ring",
    }

    sets.midcast.SIRD = {
        ammo="Staunch Tathlum",
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Founder's Hose", augments={'MND+7','Attack+12',}},
        neck="Moonlight Necklace",
        left_ear="Knightly Earring",
        back={ name="Rudianos's Mantle", augments={'Spell interruption rate down-10%',}},
    }

    sets.midcast.FastCast.SIRD = set_combine(sets.precast.FastCast, sets.midcast.SIRD)

    sets.midcast.Phalanx = {
        main="Sakpata's Sword",
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs="Sakpata's Cuisses",
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    }

    sets.midcast.Phalanx.SIRD = set_combine(sets.midcast.Phalanx, sets.midcast.SIRD)

    sets.midcast.Reprisal = {}
    sets.midcast.Reprisal.SIRD = set_combine(sets.midcast.Reprisal, sets.midcast.SIRD)

    sets.midcast.Cure = set_combine(sets.Enmity, {
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands="Macabre Gaunt. +1",
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        left_ring="Naji's Loop",
    })

    sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure, sets.midcast.SIRD)

    sets.midcast.Flash = set_combine(sets.Enmity, {})
    sets.midcast.Flash.SIRD = set_combine(sets.midcast.Flash, sets.midcast.SIRD)

    sets.midcast['Blue Magic'] = {}
    sets.midcast['Blue Magic'].Enmity = set_combine(sets.Enmity)
    sets.midcast['Blue Magic'].SIRD = set_combine(sets.midcast.SIRD)
    sets.midcast['Blue Magic'].Enmity.SIRD = set_combine(sets.midcast['Blue Magic'].Enmity, sets.midcast['Blue Magic'].SIRD)
    sets.midcast['Blue Magic'].Cure = set_combine(sets.midcast.Cure)
    sets.midcast['Blue Magic'].Cure.SIRD = set_combine(sets.midcast['Blue Magic'].Cure, sets.midcast['Blue Magic'].SIRD)

    sets.JA['Divine Emblem'] = {feet="Chev. Sabatons +2"}

    sets.WS['Savage Blade'] = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
    }
end
