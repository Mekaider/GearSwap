-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Souleater = buffactive.souleater or false
    state.Buff['Last Resort'] = buffactive['Last Resort'] or false

    weapon_list = S{"Apocalypse", "Caladbolg", "Naegling"}
    no_swap_gear = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)",
              "Trizek Ring", "Echad Ring", "Facility Ring", "Capacity Ring"}
    elemental_ws = S{'Dark Harvest','Shadow of Death','Infernal Scythe','Frostbite','Freezebite',
              'Burning Blade','Red Lotus Blade','Shining Blade','Seraph Blade','Sanguine Blade'}

    lockstyleset = 14
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal', 'STP', 'Acc', 'MidAcc', 'HighAcc')
    state.HybridMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT', 'MDT')
    state.IdleMode:options('DT', 'Normal')

    state.WeaponSet = M{['description']='Weapon Set', 'Caladbolg', 'Apocalypse', 'Naegling'}

    state.MagicBurst = M(false, 'Magic Burst')
    state.Critical = M(false, 'Critical Aftermath TP')
    state.CP = M(false, "Capacity Points Mode")

    send_command('bind f9 gs c cycle WeaponSet')
    send_command('bind @f10 gs c cycle OffenseMode')
    send_command('bind f10 gs c cycle HybridMode')
    send_command('bind @f11 gs c cycle IdleMode')
    send_command('bind f12 gs c update user')

    -- send_command('bind !` gs c toggle MagicBurst')
    -- send_command('bind @a gs c toggle Critical')
    -- --send_command('bind @c gs c toggle CP')
    -- send_command('bind @e gs c cycleback WeaponSet')
    -- send_command('bind @r gs c cycle WeaponSet')

    -- send_command('bind !q input /ma "Drain III" <t>')
    -- send_command('bind !w input /ja "Last Resort" <me>')
    -- send_command('bind !e input /ja "Hasso" <me>')
    -- send_command('bind !p input /ma "Dread Spikes" <me>')

    -- if player.sub_job == 'WAR' then
    --     send_command('bind ^numpad/ input /ja "Berserk" <me>')
    --     send_command('bind ^numpad* input /ja "Warcry" <me>')
    --     send_command('bind ^numpad- input /ja "Aggressor" <me>')
    -- elseif player.sub_job == 'SAM' then
    --     send_command('bind ^numpad/ input /ja "Meditate" <me>')
    --     send_command('bind ^numpad* input /ja "Sekkanoki" <me>')
    --     send_command('bind ^numpad- input /ja "Third Eye" <me>')
    -- end


    -- send_command('bind ^numpad7 input /ws "Resolution" <t>')
    -- send_command('bind ^numpad5 input /ws "Torcleaver" <t>')
    -- send_command('bind ^numpad1 input /ws "Freezebite" <t>')

    select_default_macro_book()
    set_lockstyle()


    update_combat_form()
    get_combat_weapon()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind ^c')
    send_command('unbind ^s')
    send_command('unbind ^f')
    send_command('unbind !`')
    send_command('unbind @t')
    send_command('unbind @`')
    send_command('unbind ^insert')
    send_command('unbind ^delete')
    send_command('unbind ^home')
    send_command('unbind ^end')
    send_command('unbind ^pageup')
    send_command('unbind ^pagedown')
    send_command('unbind ^,')
    -- send_command('unbind @c')
    send_command('unbind @q')
    send_command('unbind @w')
    send_command('unbind @e')
    send_command('unbind @r')
    send_command('unbind @d')
    send_command('unbind @f')
    send_command('unbind ^numlock')
    send_command('unbind ^numpad/')
    send_command('unbind ^numpad*')
    send_command('unbind ^numpad-')
    send_command('unbind ^numpad8')
    send_command('unbind ^numpad4')
    send_command('unbind ^numpad5')
    send_command('unbind ^numpad6')
    send_command('unbind ^numpad1')
    send_command('unbind ^numpad2')
    send_command('unbind ^numpad3')
    send_command('unbind numpad0')

    send_command('unbind #`')
    send_command('unbind #1')
    send_command('unbind #2')
    send_command('unbind #3')
    send_command('unbind #4')
    send_command('unbind #5')
    send_command('unbind #6')
    send_command('unbind #7')
    send_command('unbind #8')
    send_command('unbind #9')
    send_command('unbind #0')
    send_command('unbind f9')
    send_command('unbind @f10')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind @f11')
    send_command('unbind f12')
    send_command('unbind numpad0')
    send_command('unbind numpad1')
    send_command('unbind numpad2') 
    send_command('unbind numpad3') 
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    ---- Precast Sets ----

    -- Enmity set
    sets.Enmity = {}

    -- Precast sets to enhance JAs
    sets.precast.JA['Arcane Circle'] = {feet="Ig. Sollerets +3"}
    sets.precast.JA['Blood Weapon'] = {body="Fall. Cuirass +3"}
    sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet +1"}
    sets.precast.JA['Diabolic Eye'] = {hands="Fall. Fin. Gaunt. +3"}
    sets.precast.JA['Last Resort'] = {feet="Fall. Sollerets +3", back=gear.DRK_DA_Cape,}
    sets.precast.JA['Nether Void'] = {legs="Heath. Flanchard +2"}
    sets.precast.JA['Souleater'] = {head="Ig. Burgeonet +3"}
    sets.precast.JA['Weapon Bash'] = {hands="Ig. Gauntlets +3"}

    sets.precast.FC = {
        -- ammo="Sapience Orb", --2
        -- head="Carmine Mask +1", --10
        -- body="Fall. Cuirass +3", --10
        -- hands="Leyline Gloves", --8
        -- legs=gear.Ody_FC_legs, -- 5
        -- feet=gear.Ody_FC_feet, -- 11
        -- neck="Baetyl Pendant", --4
        -- ear1="Loquacious Earring", --2
        -- ear2="Malignance Earring", --4
        -- ring1="Weather. Ring +1", --6(4)
        -- ring2="Medada's Ring", --10
        -- back=gear.DRK_FC_Cape, --10
        }

    --sets.precast.FC['Dark Magic'] = set_combine(sets.precast.FC, {head="Fallen's Burgeonet +1"})


    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.WS = {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Abyssal Beads +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Cornelia's ring",
        right_ring="Sroda ring",
        back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Savage Blade'] = {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Niqmaddu Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
        head="Sakpata's Helm", --7/7
        body="Sakpata's Plate", --10/10
        hands="Sakpata's Gauntlets", --8/8
        legs="Sakpata's Cuisses", --9/9
        feet="Sakpata's Leggings", --6/6
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
    })

    sets.precast.WS['Torcleaver'] = sets.precast.WS

    sets.precast.WS['Shockwave'] = {
        -- ammo="Knobkierrie",
        -- head="Heath. Bur. +3",
        -- body="Fall. Cuirass +3",
        -- hands="Sakpata's Gauntlets",
        -- legs="Sakpata's Cuisses",
        -- feet="Heath. Sollerets +3",
        -- neck="Abyssal Beads +2",
        -- ear1="Moonshade Earring",
        -- ear2="Thrud Earring",
        -- ring1="Regal Ring",
        -- ring2="Niqmaddu Ring",
        -- back=gear.DRK_WS3_Cape,
        -- waist="Fotia Belt",
        }

    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast.WS['Shockwave'], {
        -- neck="Sanctity Necklace",
        -- ear1="Malignance Earring",
        -- ear2="Friomisi Earring",
        -- ring1="Epaminondas's Ring",
        -- waist="Eschan Stone",
        -- back=gear.DRK_WS1_Cape,
        })

    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {
        -- ear1="Lugra Earring +1",
        -- waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        -- back=gear.DRK_WS3_Cape,
        })

    sets.precast.WS['Cross Reaper'] = set_combine(sets.precast.WS, {
        -- head="Heath. Bur. +3",
        -- ring1="Regal Ring",
        -- waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        -- back=gear.DRK_WS3_Cape,
        })

    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS['Resolution'], {
        -- ring1="Metamor. Ring +1",
        -- back=gear.DRK_WS3_Cape,
        })

    sets.precast.WS['Insurgency'] = set_combine(sets.precast.WS['Cross Reaper'], {})

    sets.precast.WS['Quietus'] = set_combine(sets.precast.WS['Cross Reaper'], {
        -- waist="Fotia Belt",
        })

    sets.precast.WS['Shadow of Death'] = set_combine(sets.precast.WS['Herculean Slash'], {
        head="Pixie Hairpin +1",
        -- neck="Sibyl Scarf",
        ear2="Moonshade Earring",
        -- ring2="Archon Ring",
        })

    sets.precast.WS['Infernal Scythe'] = set_combine(sets.precast.WS['Shadow of Death'], {
        -- neck="Baetyl Pendant",
        ear1="Malignance Earring",
        })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast['Enfeebling Magic'] = {
        ammo="Pemphredo Tathlum",
        -- head="Carmine Mask +1",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        -- feet="Heath. Sollerets +3",
        neck="Erra Pendant",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        left_ring={name="Stikini Ring +1", bag="wardrobe3"},
        right_ring={name="Stikini Ring +1", bag="wardrobe4"},
        -- back=gear.DRK_FC_Cape,
        waist="Eschan Stone",
        }

    sets.midcast['Dark Magic'] = {
        ammo="Pemphredo Tathlum",
        -- head="Carmine Mask +1",
        body="Sakpata's Plate",
        -- hands="Fall. Fin. Gaunt. +3",
        -- legs="Heath. Flanchard +2",
        -- feet="Heath. Sollerets +3",
        neck="Erra Pendant",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        left_ring={name="Stikini Ring +1", bag="wardrobe3"},
        right_ring={name="Stikini Ring +1", bag="wardrobe4"},
        -- back=gear.DRK_FC_Cape,
        waist="Eschan Stone",
        }

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        -- hands="Fall. Fin. Gaunt. +3",
        feet="Rat. Sollerets +1",
        -- ear1="Hirudinea Earring",
        -- ring1="Evanescence Ring",
        -- ring2="Archon Ring",
        -- back="Niht Mantle",
        -- waist="Austerity Belt +1",
        })

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {
        -- head="Ig. Burgeonet +3",
        -- hands="Pavor Gauntlets",
        feet="Rat. Sollerets +1",
        ring1="Kishar Ring",
        -- back="Chuparrosa Mantle",
        -- waist="Casso Sash",
        })

    sets.midcast['Absorb-TP'] = set_combine(sets.midcast.Absorb, {hands="Heath. Gauntlets +2"})

    sets.midcast.Stun = sets.midcast['Dark Magic']

    sets.midcast['Dread Spikes'] = set_combine(sets.midcast['Dark Magic'], {
        -- body="Heath. Cuirass +2",
        -- feet="Rat. Sollerets +1",
        -- ear1="Odnowa Earring +1",
        -- ring2="Gelatinous Ring +1",
        -- back="Moonlight Cape",
        })
    sets.midcast['Elemental Magic'] = {
        ammo="Pemphredo Tathlum",
        -- body="Fall. Cuirass +3",
        -- feet="Heath. Sollerets +3",
        neck="Erra Pendant",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        left_ring={name="Stikini Ring +1", bag="wardrobe3"},
        right_ring={name="Stikini Ring +1", bag="wardrobe4"},
        -- back=gear.DRK_FC_Cape,
        waist="Eschan Stone",
        }

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        ear1="Odnowa Earring +1",
        ear2="Eabani Earring",
        left_ring={name="Stikini Ring +1", bag="wardrobe3"},
        right_ring={name="Stikini Ring +1", bag="wardrobe4"},
        }

    sets.idle.DT = set_combine(sets.idle, {
        ammo="Staunch Tathlum +1", --2/2
        neck="Loricate Torque +1", --6/6
        ear1="Odnowa Earring +1", --3/5
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        waist="Flume Belt +1",
    })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Defense Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Flam. Zucchetto +2",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Ig. Flanchard +3",
        feet="Flam. Gambieras +2",
        neck={ name="Abyssal Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Moonlight Ring",
        back="Null Shawl",
    }

    sets.engaged.LowAcc = set_combine(sets.engaged, {})
    sets.engaged.MidAcc = set_combine(sets.engaged.LowAcc, {})
    sets.engaged.HighAcc = set_combine(sets.engaged.MidAcc, {
        -- ammo="Seeth. Bomblet +1",
        -- hands="Gazu Bracelets +1",
        })

    sets.engaged.STP = set_combine(sets.engaged, {
        -- legs=gear.Ody_DA_legs,
        -- ring1={name="Chirich Ring +1", bag="wardrobe3"},
        -- ring2={name="Chirich Ring +1", bag="wardrobe4"},
        })

    sets.engaged.Caladbolg = set_combine(sets.engaged, {})
    -- sets.engaged.Caladbolg.LowAcc = set_combine(sets.engaged.Apocalypse, {})
    -- sets.engaged.Caladbolg.MidAcc = set_combine(sets.engaged.Apocalypse, {
        -- ring1={name="Chirich Ring +1", bag="wardrobe3"},
        -- ring2={name="Chirich Ring +1", bag="wardrobe4"},
        -- })

    -- sets.engaged.Caladbolg.HighAcc = set_combine(sets.engaged.Apocalypse, {
        -- ammo="Seeth. Bomblet +1",
        -- })

    sets.engaged.Caladbolg.Aftermath = {
        body="Dagon Breast."
    }

    -- sets.engaged.Apocalypse = set_combine(sets.engaged, {})

    -- sets.engaged.Apocalypse.LowAcc = set_combine(sets.engaged.Apocalypse, {})
    -- sets.engaged.Apocalypse.MidAcc = set_combine(sets.engaged.Apocalypse, {
    --     -- ring1={name="Chirich Ring +1", bag="wardrobe3"},
    --     -- ring2={name="Chirich Ring +1", bag="wardrobe4"},
    --     })

    -- sets.engaged.Apocalypse.HighAcc = set_combine(sets.engaged.Apocalypse, {
    --     -- ammo="Seeth. Bomblet +1",
    --     -- hands="Gazu Bracelets +1",
    --     })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged.Hybrid = {
        head="Sakpata's Helm", --7/7
        body="Sakpata's Plate", --10/10
        hands="Sakpata's Gauntlets", --8/8
        legs="Sakpata's Cuisses", --9/9
        feet="Sakpata's Leggings", --6/6
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ring={name="Moonlight Ring", bag="wardrobe2", priority=1},
        right_ring={name="Moonlight Ring", bag="wardrobe4", priority=2},
        }

    sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
    -- sets.engaged.LowAcc.DT = set_combine(sets.engaged.LowAcc, sets.engaged.Hybrid)
    -- sets.engaged.MidAcc.DT = set_combine(sets.engaged.MidAcc, sets.engaged.Hybrid)
    -- sets.engaged.HighAcc.DT = set_combine(sets.engaged.HighAcc, sets.engaged.Hybrid)
    sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.engaged.Hybrid)

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.magic_burst = {}

    sets.Moving = {legs="Carmine Cuisses +1"}
    sets.latent_refresh = {} -- {waist="Fucho-no-obi"}
    sets.buff.Doom = {} -- {ring1={name="Saida Ring", bag="wardrobe3"}, ring2={name="Saida Ring", bag="wardrobe4"},}
    sets.CP = {} -- {back="Mecisto. Mantle"}

    sets.Caladbolg = {main="Caladbolg", sub="Utu Grip"}
    sets.Apocalypse = {main="Apocalypse", sub="Utu Grip"}
    sets.Naegling = {main="Naegling", sub="Blurred Shield +1"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_precast(spell, action, spellMap, eventArgs)

end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_aftercast(spell, action, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

function job_state_change(field, new_value, old_value)
    if state.WeaponSet.value == 'Caladbolg' then
        -- send_command('bind ^numpad7 input /ws "Resolution" <t>')
        -- send_command('unbind ^numpad8')
        -- send_command('unbind ^numpad4')
        -- send_command('bind ^numpad5 input /ws "Torcleaver" <t>')
        -- send_command('unbind ^numpad6')
        -- send_command('bind ^numpad1 input /ws "Freezebite" <t>')
    elseif state.WeaponSet.value == "Apocalypse" then
        -- send_command('unbind ^numpad7')
        -- send_command('bind ^numpad8 input /ws "Insurgency" <t>')
        -- send_command('bind ^numpad4 input /ws "Catastrophe" <t>')
        -- send_command('bind ^numpad5 input /ws "Cross Reaper" <t>')
        -- send_command('bind ^numpad6 input /ws "Quietus" <t>')
        -- send_command('bind ^numpad1 input /ws "Infernal Scythe" <t>')
        -- send_command('bind ^numpad0 input /ws "Entropy" <t>')
    end

    check_weaponset()
end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff,gain)

--    if buffactive['Reive Mark'] then
--        if gain then
--            equip(sets.Reive)
--            disable('neck')
--        else
--            enable('neck')
--        end
--    end

    if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            send_command('@input /p Doomed.')
            disable('ring1','ring2','waist')
        else
            enable('ring1','ring2','waist')
            handle_equipping_gear(player.status)
        end
    end

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_handle_equipping_gear(playerStatus, eventArgs)
    check_gear()
    update_combat_form()
end

function job_update(cmdParams, eventArgs)
    handle_equipping_gear(player.status)
    get_combat_weapon()
end

function update_combat_form()
    if DW == true then
        state.CombatForm:set('DW')
    elseif DW == false then
        state.CombatForm:reset()
    end
end

function get_custom_wsmode(spell, action, spellMap)
    local wsmode
    if state.OffenseMode.value == 'MidAcc' or state.OffenseMode.value == 'HighAcc' then
        wsmode = 'Acc'
    end

    return wsmode
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.CP.current == 'on' then
         equip(sets.CP)
         disable('back')
    else
         enable('back')
    end

    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if buffactive['Aftermath: Lv.3'] and player.equipment.main == "Caladbolg" then
        meleeSet = set_combine(meleeSet, sets.engaged.Caladbolg.Aftermath)
    end

    return meleeSet
end


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local cf_msg = ''
    if state.CombatForm.has_value then
        cf_msg = ' (' ..state.CombatForm.value.. ')'
    end

    local m_msg = state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        m_msg = m_msg .. '/' ..state.HybridMode.value
    end

    local ws_msg = state.WeaponskillMode.value

    local c_msg = state.CastingMode.value

    local d_msg = 'None'
    if state.DefenseMode.value ~= 'None' then
        d_msg = state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end

    local i_msg = state.IdleMode.value

    local msg = ''
    if state.MagicBurst.value then
        msg = ' Burst: On |'
    end
    if state.Kiting.value then
        msg = msg .. ' Kiting: On |'
    end

    add_to_chat(002, '| ' ..string.char(31,210).. 'Melee' ..cf_msg.. ': ' ..string.char(31,001)..m_msg.. string.char(31,002)..  ' |'
        ..string.char(31,207).. ' WS: ' ..string.char(31,001)..ws_msg.. string.char(31,002)..  ' |'
        ..string.char(31,060).. ' Magic: ' ..string.char(31,001)..c_msg.. string.char(31,002)..  ' |'
        ..string.char(31,004).. ' Defense: ' ..string.char(31,001)..d_msg.. string.char(31,002)..  ' |'
        ..string.char(31,008).. ' Idle: ' ..string.char(31,001)..i_msg.. string.char(31,002)..  ' |'
        ..string.char(31,002)..msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function get_combat_weapon()
    state.CombatWeapon:reset()
    if weapon_list:contains(player.equipment.main) then
        state.CombatWeapon:set(player.equipment.main)
    end
end

function job_self_command(cmdParams, eventArgs)
end

function check_moving()
    if state.DefenseMode.value == 'None'  and state.Kiting.value == false then
        if state.Auto_Kite.value == false and moving then
            state.Auto_Kite:set(true)
        elseif state.Auto_Kite.value == true and moving == false then
            state.Auto_Kite:set(false)
        end
    end
end

function check_gear()
    if no_swap_gear:contains(player.equipment.left_ring) then
        disable("ring1")
    else
        enable("ring1")
    end
    if no_swap_gear:contains(player.equipment.right_ring) then
        disable("ring2")
    else
        enable("ring2")
    end
end

function check_weaponset()
    equip(sets[state.WeaponSet.current])
end

windower.register_event('zone change',
    function()
        if no_swap_gear:contains(player.equipment.left_ring) then
            enable("ring1")
            equip(sets.idle)
        end
        if no_swap_gear:contains(player.equipment.right_ring) then
            enable("ring2")
            equip(sets.idle)
        end
    end
)

mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if mov.counter>15 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
            local movement = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 ) > 0.1
            if movement and not moving then
                moving = true
                send_command('gs c update')
            elseif not movement and moving then
                moving = false
                send_command('gs c update')
            end
        end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
    end
end)

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(1, 4)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 4)
    else
        set_macro_page(1, 4)
    end
end

function set_lockstyle()
    send_command('wait 5; input /lockstyleset ' .. lockstyleset)
end