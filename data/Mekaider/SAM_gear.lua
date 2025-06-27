function user_setup()
    state.WeaponMode:options('Gekkei', 'ShiningOne')
    state.MeleeMode:options('Normal', 'Meva')

    coroutine.schedule(function()
        send_command('xb bar GK')
    end, 1)
end

function init_gear_sets() 
    sets.weapons['Gekkei'] = {main="Gekkei", sub="Utu Grip"}
    sets.weapons['ShiningOne'] = {main="Shining One", sub="Utu Grip"}
    
    sets.idle = {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Elite Royal Collar",
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warden's Ring",
        back="Repulse Mantle",
    }

    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Kasuga Kabuto +2",
        body="Kasuga Domaru +2",
        hands={ name="Tatena. Gote +1", augments={'Path: A',}},
        legs="Kasuga Haidate +2",
        feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        neck="Moonlight Nodowa",
        waist="Sweordfaetels +1",
        left_ear="Telos Earring",
        right_ear={ name="Kasuga Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
        left_ring="Niqmaddu Ring",
        right_ring="Chirich Ring +1",
        back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+5','"Store TP"+1',}},
    }

    sets.engaged.Meva = set_combine(sets.engaged, {
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        back="Null Shawl"
    })

    sets.WS = {
        ammo="Knobkierrie",
        head="Mpaca's Cap",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Cornelia's ring",
        back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+5','"Store TP"+1',}},
    }

    sets.WS['Tachi: Jinpu'] = set_combine(sets.WS, {
        head={ name="Nyame Helm", augments={'Path: B',}},
        right_ear="Friomisi Earring",   
    })

    sets.JA = {}

    sets.precast.FastCast = {}
end