-- Load and initialize the include file.
include('Mekaider-Include')

lockstyleset = 12
send_command('wait 5; input /lockstyleset '..lockstyleset)

state.WeaponMode:options('Naegling', 'Club', 'Chango', 'Shining One', 'Montante', 'Unlocked')
state.WeaponMode:set('Naegling')
send_command('wait 2; xb bar sword')

state.MeleeMode:options('TP', 'Hybrid', 'PDL')
state.MeleeMode:set('TP')

function get_sets() 

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.weapons['Naegling'] = {main="Naegling", sub="Blurred Shield +1"}
    sets.weapons['Club'] = {main={name="Loxotic Mace +1", augments={'Path: A',}}, sub="Blurred Shield +1"}
    sets.weapons['Chango'] = {main={ name="Chango", augments={'Path: A',}}, sub="Utu Grip"}
    sets.weapons['Shining One'] = {main="Shining One", sub="Utu Grip"}
    sets.weapons['Montante'] = {main="Montante +1", sub="Utu Grip"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Idle Sets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        ammo="Staunch Tathlum",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Loricate Torque +1",
        waist="Carrier's Sash",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Infused Earring",
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.idle.Moving = set_combine(sets.idle, {right_ring="Shneddick Ring"})

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Boii Mask +3",
        body="Hjarrandi Breast.",
        hands="Sakpata's Gauntlets",
        legs="Boii Cuisses +3",
        feet="Pumm. Calligae +3",
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Schere Earring",
        right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
        left_ring="Niqmaddu Ring",
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    } -- 28% DA traits +5% merits = 33% starting DA + 65% gear = 98% DA

    sets.engaged.Hybrid = set_combine(sets.engaged, {
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
    })

    sets.engaged.OneHand = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Boii Mask +3",
        body="Hjarrandi Breast.",
        hands="Sakpata's Gauntlets",
        legs="Boii Cuisses +3",
        feet="Pumm. Calligae +3",
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Schere Earring",
        right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
        left_ring="Niqmaddu Ring",
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.OneHand.Hybrid = set_combine(sets.engaged.OneHand, {
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
    })

    sets.engaged.TwoHand = set_combine(sets.engaged, {
        body="Boii Lorica +3",
    })

    sets.engaged.TwoHand.Hybrid = set_combine(sets.engaged.TwoHand, {
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
    })

    sets.engaged.DualWield = set_combine(sets.engaged, {
        waist="Reiki Yotai",
        left_ear="Eabani Earring"
    })

    sets.engaged.DualWield.SubDNC = set_combine(sets.engaged, {
        waist="Reiki Yotai",
        left_ear="Eabani Earring"
    })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weaponskill Sets --------------------------------------
    ------------------------------------------------------------------------------------------------

    -- default WS set
    sets.WS = {
        ammo="Knobkierrie",
        head="Agoge Mask +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Boii Mufflers +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Fell Cleave'] = {
        ammo="Knobkierrie",
        head="Agoge Mask +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Boii Mufflers +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Steel Cyclone'] = sets.WS['Fell Cleave']

    sets.WS['Upheaval'] = {
        sub="Utu Grip",
        ammo="Knobkierrie",
        head="Agoge Mask +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Boii Mufflers +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    -- sets.WS['Upheaval'].PDL = {}

    sets.WS['King\'s Justice'] = sets.WS['Upheaval']

    sets.WS['Resolution'] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Boii Mask +3",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Boii Cuisses +3",
        feet="Pumm. Calligae +3",
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist="Thunder Belt",
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    -- sets.WS['Resolution'].PDL = {}

    sets.WS['Savage Blade'] = {
        ammo="Knobkierrie",
        head="Agoge Mask +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Boii Mufflers +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Savage Blade'].PDL = set_combine(sets.WS['Savage Blade'], {
        body="Sakpata's Plate",
        legs="Boii Cuisses +3",
        left_ring="Epaminondas's Ring",
        right_ring="Sroda Ring",
    })

    -- sets.WS['Savage Blade'].PDL['Mighty Strikes'] = {}

    sets.WS['Judgment'] = sets.WS['Savage Blade']
    sets.WS['Judgment'].PDL = sets.WS['Savage Blade'].PDL

    sets.WS['Impulse Drive'] = {
        ammo="Knobkierrie",
        head="Boii Mask +3",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Boii Mufflers +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    -- sets.WS['Impulse Drive'].PDL = {}

    sets.WS['Impulse Drive']['Shining One'] = {
        ammo="Knobkierrie",
        head="Boii Mask +3",
        body="Hjarrandi Breast.",
        hands="Boii Mufflers +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Boii Calligae +2",
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    -- sets.WS['Impulse Drive']['Shining One'].PDL = {}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- JA Sets -----------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.JA['Provoke'] = {
        ammo="Sapience Orb",
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Moonlight Necklace",
        left_ring="Petrov Ring",
        right_ring="Apeile Ring +1",
        back="Reiki Cloak",
    }
    sets.JA['Mighty Strikes'] = {hands="Agoge Mufflers"}
    sets.JA['Berserk'] = {feet="Agoge Calligae"}
    sets.JA['Aggressor'] = {body="Agoge Lorica"}
    sets.JA['Warcry'] = {head="Agoge Mask +3"}
    sets.JA['Restraint'] = {hands="Boii Mufflers +3"}
    sets.JA['Tomahawk'] = {ammo="Thr. Tomahawk", feet="Agoge Calligae"}
    sets.JA['Blood Rage'] = {body="Boii Lorica +3"}
end

function state_change_custom(state, new_state_value, old_state_value) 
    if state == 'WeaponMode' then 
        if new_state_value == 'Naegling' then
            send_command('xb bar sword')
        elseif new_state_value == 'Club' then
            send_command('xb bar club')
        elseif new_state_value == 'Shining One' then
            send_command('xb bar polearm')
        elseif new_state_value == 'Chango' then
            send_command('xb bar greataxe')
        elseif new_state_value == 'Montante' then
            send_command('xb bar greatsword')
        end
    end
end