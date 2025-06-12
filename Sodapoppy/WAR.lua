-- Load and initialize the include file.
include('Mekaider-Include')
send_command('gs c update')

state.WeaponMode:options('Naegling', 'Club')
-- state.WeaponMode:options('Naegling', 'Chango')
state.WeaponMode:set('Naegling')
-- coroutine.schedule(function()
--     send_command('xb bar Sword')
-- end, 3)

state.MeleeMode:options('TP', 'DT')
state.MeleeMode:set('TP')

state.WeaponSkillMode:options('Normal', 'PDL')
state.WeaponSkillMode:set('Normal')

function get_sets() 
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.weapons.Naegling = {main="Naegling", sub="Blurred Shield +1"}
    sets.weapons.Club = {main={name="Loxotic Mace", augments={'Path: A',}}, sub="Blurred Shield +1"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Idle Sets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Elite Royal Collar",
        waist="Null Belt",
        left_ear="Infused Earring",
        right_ear="Etiolation Earring",
        left_ring={name="Chirich Ring +1", bag="wardrobe1"},
        right_ring={name="Chirich Ring +1", bag="wardrobe2"},
        back="Null Shawl"
    }

    sets.Moving = {right_ring="Shneddick Ring"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="War. Beads +2",
        waist="Sailfi Belt +1",
        left_ear={ name="Schere Earring", augments={'Path: A',}},
        right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Crit.hit rate+4',}},
        left_ring={name="Chirich Ring +1", bag="wardrobe1"},
        right_ring={name="Chirich Ring +1", bag="wardrobe2"},
        back="Null Shawl",
    } -- 28% DA traits +5% merits = 33% starting DA + % gear = % DA

    sets.engaged.DT = set_combine(sets.engaged, {
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        -- left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        -- right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
    })

    -- sets.engaged.OneHand = {
    --     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    --     head="Boii Mask +3",
    --     body="Hjarrandi Breast.",
    --     hands="Sakpata's Gauntlets",
    --     legs="Boii Cuisses +3",
    --     feet="Pumm. Calligae +3",
    --     neck={ name="War. Beads +2", augments={'Path: A',}},
    --     waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    --     left_ear="Schere Earring",
    --     right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
    --     left_ring="Niqmaddu Ring",
    --     right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
    --     back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    -- }

    -- sets.engaged.OneHand.DT = set_combine(sets.engaged.OneHand, {
    --     head="Sakpata's Helm",
    --     body="Sakpata's Plate",
    --     hands="Sakpata's Gauntlets",
    --     legs="Sakpata's Cuisses",
    --     feet="Sakpata's Leggings",
    --     left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
    --     right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
    -- })

    -- sets.engaged.TwoHand = set_combine(sets.engaged, {
    --     body="Boii Lorica +3",
    -- })

    -- sets.engaged.TwoHand.DT = set_combine(sets.engaged.TwoHand, {
    --     head="Sakpata's Helm",
    --     body="Sakpata's Plate",
    --     hands="Sakpata's Gauntlets",
    --     legs="Sakpata's Cuisses",
    --     feet="Sakpata's Leggings",
    --     left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
    --     right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
    -- })

    -- sets.engaged.DualWield = set_combine(sets.engaged, {
    --     waist="Reiki Yotai",
    --     left_ear="Eabani Earring"
    -- })
    -- sets.engaged.DualWield.DT = set_combine(sets.engaged.DT, sets.engaged.DualWield)

    -- sets.engaged.DualWield.NoDW = sets.engaged
    -- sets.engaged.DualWield.DT.NoDW = sets.engaged.DT

    -- sets.engaged.DualWield.MinDW = set_combine(sets.engaged, {})
    -- sets.engaged.DualWield.DT.MinDW = set_combine(sets.engaged.DualWield.MinDW, {})

    -- sets.engaged.DualWield.LowDW = set_combine(sets.engaged.DualWield.MinDW, {})
    -- sets.engaged.DualWield.DT.LowDW = set_combine(sets.engaged.DualWield.DT.MinDW, {})

    -- sets.engaged.DualWield.MidDW = set_combine(sets.engaged.DualWield.LowDW, {})
    -- sets.engaged.DualWield.DT.MidDW = set_combine(sets.engaged.DualWield.DT.LowDW, {})

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
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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
        left_ring="Cornelia's ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Steel Cyclone'] = sets.WS['Fell Cleave']

    sets.WS['Upheaval'] = {
        ammo="Knobkierrie",
        head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Boii Mufflers +3",
        legs="Boii Cuisses +3",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Cornelia's Ring",
        back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Upheaval']['Mighty Strikes'] = set_combine(sets.WS['Upheaval'], {
        feet="Boii Calligae +3", 
    })

    sets.WS['Upheaval'].PDL = {
        ammo="Knobkierrie",
        head="Sakpata's Helm",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands="Boii Mufflers +3",
        legs="Boii Cuisses +3",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Cornelia's ring",
        back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.WS['Upheaval'].PDL['Mighty Strikes'] = set_combine(sets.WS['Upheaval'].PDL, {
        feet="Boii Calligae +3", 
    })

    sets.WS['King\'s Justice'] = set_combine(sets.WS['Upheaval'], {
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })

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
        left_ring="Cornelia's ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }


    sets.WS['Savage Blade']['Mighty Strikes'] = set_combine(sets.WS['Savage Blade'], {
        feet="Boii Calligae +3", 
    })

    sets.WS['Savage Blade'].PDL = set_combine(sets.WS['Savage Blade'], {
        body="Sakpata's Plate",
        legs="Boii Cuisses +3",
        left_ring="Cornelia's ring",
        right_ring="Sroda ring",
    })

    sets.WS['Savage Blade'].PDL['Mighty Strikes'] = set_combine(sets.WS['Savage Blade'].PDL, {
        feet="Boii Calligae +3",
    })

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
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    -- sets.WS['Impulse Drive'].PDL = {}

    sets.WS['Impulse Drive']['ShiningOne'] = {
        ammo="Knobkierrie",
        head="Boii Mask +3",
        body="Hjarrandi Breast.",
        hands="Boii Mufflers +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Boii Calligae +3",
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    -- sets.WS['Impulse Drive']['ShiningOne'].PDL = {}

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

-- function state_change_custom(state, new_state_value, old_state_value) 
--     if state == 'WeaponMode' then 
--         if new_state_value == 'Naegling' then
--             send_command('xb bar Sword')
--         elseif new_state_value == 'Club' then
--             send_command('xb bar Club')
--         elseif new_state_value == 'Chango' then
--             send_command('xb bar GreatAxe')
--         elseif new_state_value == 'ShiningOne' then
--             send_command('xb bar Polearm')
--         elseif new_state_value == 'Montante' then
--             send_command('xb bar GreatSword')
--         end
--     end
-- end
