--[[
    Custom commands:

    SongMode may take one of three values: None, Dummy, FullLength

    You can set these via the standard 'set' and 'cycle' self-commands.  EG:
    gs c cycle SongMode
    gs c set SongMode Dummy

    The Dummy state will equip the bonus song instrument and ensure non-duration gear is equipped.
    The FullLength state will simply equip the bonus song instrument on top of standard gear.


    Simple macro to cast a Dummy Daurdabla song:
    /console gs c set SongMode Dummy
    /ma "Shining Fantasia" <me>

    To use a Terpander rather than Daurdabla, set the info.ExtraSongInstrument variable to
    'Terpander', and info.ExtraSongs to 1.
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
    res = require 'resources'
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.SongMode = M{['description']='Song Mode', 'Potency', 'Dummy'}
    state.Buff['Pianissimo'] = buffactive['pianissimo'] or false
    state.Buff['Nightingale'] = buffactive['Nightingale'] or false

    no_swap_gear = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)",
              "Trizek Ring", "Echad Ring", "Facility Ring", "Capacity Ring"}
    elemental_ws = S{"Aeolian Edge"}

    state.Carol = M{['description']='Carol',
        'Fire Carol', 'Fire Carol II', 'Ice Carol', 'Ice Carol II', 'Wind Carol', 'Wind Carol II',
        'Earth Carol', 'Earth Carol II', 'Lightning Carol', 'Lightning Carol II', 'Water Carol', 'Water Carol II',
        'Light Carol', 'Light Carol II', 'Dark Carol', 'Dark Carol II',
        }

    state.Threnody = M{['description']='Threnody',
        'Fire Threnody II', 'Ice Threnody II', 'Wind Threnody II', 'Earth Threnody II',
        'Ltng. Threnody II', 'Water Threnody II', 'Light Threnody II', 'Dark Threnody II',
        }

    state.Etude = M{['description']='Etude', 'Sinewy Etude', 'Herculean Etude', 'Learned Etude', 'Sage Etude',
        'Quick Etude', 'Swift Etude', 'Vivacious Etude', 'Vital Etude', 'Dextrous Etude', 'Uncanny Etude',
        'Spirited Etude', 'Logical Etude', 'Enchanting Etude', 'Bewitching Etude'}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT', 'MEva')

    state.Carol = M{['description']='Carol',
        'Fire Carol', 'Fire Carol II', 'Ice Carol', 'Ice Carol II', 'Wind Carol', 'Wind Carol II',
        'Earth Carol', 'Earth Carol II', 'Lightning Carol', 'Lightning Carol II', 'Water Carol', 'Water Carol II',
        'Light Carol', 'Light Carol II', 'Dark Carol', 'Dark Carol II',
        }

    state.Threnody = M{['description']='Threnody',
        'Fire Threnody II', 'Ice Threnody II', 'Wind Threnody II', 'Earth Threnody II',
        'Ltng. Threnody II', 'Water Threnody II', 'Light Threnody II', 'Dark Threnody II',
        }

    state.Etude = M{['description']='Etude', 'Sinewy Etude', 'Herculean Etude', 'Learned Etude', 'Sage Etude',
        'Quick Etude', 'Swift Etude', 'Vivacious Etude', 'Vital Etude', 'Dextrous Etude', 'Uncanny Etude',
        'Spirited Etude', 'Logical Etude', 'Enchanting Etude', 'Bewitching Etude'}

    state.WeaponSet = M{['description']='Weapon Set', 'Carnwenhan', 'Twashtar', 'Tauret', 'Naegling'}
    state.WeaponLock = M(false, 'Weapon Lock')
    -- state.CP = M(false, "Capacity Points Mode")

    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'

    -- How many extra songs we can keep from Daurdabla/Terpander
    -- info.ExtraSongs = 2

    -- Designates instruments used to sing Horde Lullaby
    info.LullabyHarp = 'Daurdabla'
    info.LullabyHorn = 'Gjallarhorn'
    info.LullabyMaxDuration = 'Marsyas' -- Used with Troubadour

    send_command('bind f11 gs c cycle SongMode')

    -- select_default_macro_book()
    lockstyleset = 3
    set_lockstyle()

    -- state.Auto_Kite = M(false, 'Auto_Kite')
    update_combat_form()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind f11')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Fast cast sets for spells
    sets.precast.FC = {}

    -- sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    -- sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.FC.BardSong = set_combine(sets.precast.FC, {})

    sets.precast.FC.SongDummy = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})

    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak"})

    -- Precast sets to enhance JAs

    sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
    sets.precast.JA.Troubadour = {body="Bihu Jstcorps. +3"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}


    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- General set for recast times.
    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.SpellInterrupt = {}

    sets.midcast.Utsusemi = sets.midcast.SpellInterrupt

    -- Gear to enhance certain classes of songs.
    --sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
    sets.midcast.Carol = {hands="Mousai Gages +1"}
    sets.midcast.Etude = {head="Mousai Turban +1"}
    sets.midcast.HonorMarch = {range="Marsyas", hands="Fili Manchettes +1"}
    sets.midcast.Lullaby = {body="Fili Hongreline +1", hands="Brioso Cuffs +3"}
    sets.midcast.Madrigal = {head="Fili Calot +1", feet="Fili Cothurnes +1"}
    sets.midcast.Mambo = {feet="Mou. Crackows +1"}
    sets.midcast.March = {hands="Fili Manchettes +1"}
    sets.midcast.Minne = {legs="Mou. Seraweels +1"}
    sets.midcast.Minuet = {body="Fili Hongreline +1"}
    sets.midcast.Paeon = {head="Brioso Roundlet +3"}
    sets.midcast.Prelude = {feet="Fili Cothurnes +1"}
    sets.midcast.Threnody = {body="Mou. Manteel +1"}
    sets.midcast['Adventurer\'s Dirge'] = {range="Marsyas", hands="Bihu Cuffs +3"}
    sets.midcast['Foe Sirvente'] = {head="Bihu Roundlet +3"}
    sets.midcast['Magic Finale'] = {legs="Fili Rhingrave +1"}
    sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
    sets.midcast["Chocobo Mazurka"] = {range="Marsyas"}

    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.SongPotency = {
        -- main="Carnwenhan",
        -- range="Gjallarhorn",
        -- head="Fili Calot +1",
        -- body="Fili Hongreline +1",
        -- hands="Fili Manchettes +1",
        -- legs="Inyanga Shalwar +2",
        -- feet="Brioso Slippers +3",
        -- neck="Mnbw. Whistle +1",
        -- ear1="Odnowa Earring +1",
        -- ear2="Etiolation Earring",
        -- ring1="Moonlight Ring",
        -- ring2="Defending Ring",
        -- waist="Plat. Mog. Belt",
        -- back=gear.BRD_Song_Cape,
        }

    -- For song debuffs (duration primary, accuracy secondary)
    sets.midcast.SongEnfeeble = {
        -- main="Carnwenhan",
        -- sub="Ammurapi Shield",
        -- range="Gjallarhorn",
        -- head="Brioso Roundlet +3",
        -- body="Brioso Justau. +3",
        -- hands="Brioso Cuffs +3",
        -- legs="Inyanga Shalwar +2",
        -- feet="Brioso Slippers +3",
        -- neck="Mnbw. Whistle +1",
        -- ear1="Regal Earring",
        -- ear2="Fili Earring +1",
        -- ring1="Metamor. Ring +1",
        -- ring2={name="Stikini Ring +1", bag="wardrobe6"},
        -- waist="Acuity Belt +1",
        -- back=gear.BRD_Song_Cape,
        }

    -- For song defbuffs (accuracy primary, duration secondary)
    sets.midcast.SongEnfeebleAcc = set_combine(sets.midcast.SongEnfeeble, {legs="Brioso Cannions +3"})

    -- For Horde Lullaby maxiumum AOE range.
    sets.midcast.SongStringSkill = {
        -- ear1="Gersemi Earring",
        -- ear2="Darkside Earring",
        -- ring1={name="Stikini Ring +1", bag="wardrobe5"},
        }

    -- Dummy song; minimize duration to make it easy to overwrite.
    sets.midcast.SongDummy = set_combine(sets.midcast.SongPotency, {range=info.ExtraSongInstrument})

    -- Other general spells and classes.
    sets.midcast.Cure = {
        -- main="Daybreak", --30
        -- sub="Ammurapi Shield",
        -- head="Kaykaus Mitra +1", --11
        -- body="Kaykaus Bliaut +1", --(+4)/(-6)
        -- hands="Kaykaus Cuffs +1", --11(+2)/(-6)
        -- legs="Kaykaus Tights +1", --11/(+2)/(-6)
        -- feet="Kaykaus Boots +1", --11(+2)/(-12)
        -- neck="Incanter's Torque",
        -- ear1="Beatific Earring",
        -- ear2="Meili Earring",
        -- ring1="Menelaus's Ring",
        -- ring2="Haoma's Ring",
        -- back="Solemnity Cape", --7
        -- waist="Bishop's Sash",
        }

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        -- neck="Nuna Gorget +1",
        -- ring1={name="Stikini Ring +1", bag="wardrobe5"},
        -- ring2="Metamor. Ring +1",
        -- waist="Luminary Sash",
        })

    sets.midcast.StatusRemoval = {
        -- head="Vanya Hood",
        -- body="Vanya Robe",
        -- legs="Aya. Cosciales +2",
        -- feet="Vanya Clogs",
        -- neck="Incanter's Torque",
        -- ear2="Meili Earring",
        -- ring1="Menelaus's Ring",
        -- ring2="Haoma's Ring",
        -- back=gear.BRD_Song_Cape,
        -- waist="Bishop's Sash",
        }

    sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
        -- hands="Hieros Mittens",
        -- neck="Debilis Medallion",
        -- ear1="Beatific Earring",
        -- back="Oretan. Cape +1",
        })

    sets.midcast['Enhancing Magic'] = {
        -- main="Carnwenhan",
        -- sub="Ammurapi Shield",
        -- head=gear.Telchine_ENH_head,
        -- body=gear.Telchine_ENH_body,
        -- hands=gear.Telchine_ENH_hands,
        -- legs=gear.Telchine_ENH_legs,
        -- feet=gear.Telchine_ENH_feet,
        -- neck="Incanter's Torque",
        -- ear1="Mimir Earring",
        -- ear2="Andoaa Earring",
        -- ring1={name="Stikini Ring +1", bag="wardrobe5"},
        -- ring2={name="Stikini Ring +1", bag="wardrobe6"},
        -- back="Fi Follet Cape +1",
        -- waist="Embla Sash",
        }

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head="Inyanga Tiara +2"})
    sets.midcast.Haste = sets.midcast['Enhancing Magic']
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash", back="Grapevine Cape"})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget", waist="Siegel Sash"})
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {waist="Emphatikos Rope"})
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Shell

    sets.midcast['Enfeebling Magic'] = {
        -- main="Carnwenhan",
        -- sub="Ammurapi Shield",
        -- head=empty;
        -- body="Cohort Cloak +1",
        -- hands="Brioso Cuffs +3",
        -- legs="Brioso Cannions +3",
        -- feet="Brioso Slippers +3",
        -- neck="Mnbw. Whistle +1",
        -- ear1="Regal Earring",
        -- ear2="Fili Earring +1",
        -- ring1="Kishar Ring",
        -- ring2="Metamor. Ring +1",
        -- waist="Acuity Belt +1",
        -- back="Aurist's Cape +1",
        }

    sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {}

    sets.idle.DT = set_combine(sets.idle, {})

    sets.idle.MEva = sets.idle.DT

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Defense Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.Moving = {right_ring="Shneddick Ring"}
    --sets.latent_refresh = {waist="Fucho-no-obi"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    sets.engaged = {}

    sets.engaged.Acc = set_combine(sets.engaged, {})

    -- * DNC Subjob DW Trait: +15%
    -- * NIN Subjob DW Trait: +25%

    -- No Magic Haste (74% DW to cap)
    sets.engaged.DW = {} -- 26%

    sets.engaged.DW.Acc = set_combine(sets.engaged.DW, {})

    sets.engaged.Aftermath = {}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged.DT = set_combine(sets.engaged, {

    })
    sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, {

    })

    sets.engaged.DW.DT = set_combine(sets.engaged.DW, {

    })
    sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.Acc, {

    })


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.SongDWDuration = {main="Carnwenhan", sub="Kali"}

    sets.buff.Doom = {
        neck="Nicander's Necklace", --20
        ring1={name="Eshmun's Ring", bag="wardrobe5"}, --20
        ring2={name="Eshmun's Ring", bag="wardrobe6"}, --20
        waist="Gishdubar Sash", --10
        }

    sets.Obi = {waist="Hachirin-no-Obi"}
    -- sets.CP = {back="Mecisto. Mantle"}
    --sets.Reive = {neck="Ygnas's Resolve +1"}

    sets.Carnwenhan = {main="Carnwenhan", sub="Gleti's Knife"}
    sets.Twashtar = {main="Twashtar", sub="Centovente"}
    sets.Tauret = {main="Tauret", sub="Gleti's Knife"}
    sets.Naegling = {main="Naegling", sub="Centovente"}

    sets.DefaultShield = {sub="Genmei Shield"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if midaction() then
        eventArgs.cancel = true
        eventArgs.handled = true
        return
    end
    
    if spell.type == 'BardSong' then
        if spell.name == 'Honor March' then
            equip({range="Marsyas"})
        end
        if string.find(spell.name,'Lullaby') then
            if buffactive.Troubadour then
                equip({range=info.LullabyMaxDuration})
            elseif spell.english:contains('Horde') then
                equip({range=info.LullabyHarp})
            else
                equip({range=info.LullabyHorn})
            end
        end
    end
    if spellMap == 'Utsusemi' then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
            cancel_spell()
            add_to_chat(123, '**!! '..spell.english..' Canceled: [3+ IMAGES] !!**')
            eventArgs.handled = true
            return
        elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
            send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
        end
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        if elemental_ws:contains(spell.name) then
            -- Matching double weather (w/o day conflict).
            if spell.element == world.weather_element and (get_weather_intensity() == 2 and spell.element ~= elements.weak_to[world.day_element]) then
                equip({waist="Hachirin-no-Obi"})
            -- Target distance under 1.7 yalms.
            -- elseif spell.target.distance < (1.7 + spell.target.model_size) then
            --     equip({waist="Orpheus's Sash"})
            -- Matching day and weather.
            elseif spell.element == world.day_element and spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            -- Target distance under 8 yalms.
            -- elseif spell.target.distance < (8 + spell.target.model_size) then
            --     equip({waist="Orpheus's Sash"})
            -- Match day or weather.
            elseif spell.element == world.day_element or spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            end
        end
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        -- layer general gear on first, then let default handler add song-specific gear.
        local generalClass = get_song_class(spell)
        if generalClass and sets.midcast[generalClass] then
            equip(sets.midcast[generalClass])
        end
        if spell.name == 'Honor March' then
            equip({range="Marsyas"})
        end
        -- hack for dummy songs if I'm being lazy
        if spell.name == 'Shining Fantasia' then
            equip(sets.midcast.SongDummy)
        end
        if spell.name == 'Puppet\'s Operetta' then
            equip(sets.midcast.SongDummy)
        end
        if spell.name == 'Gold Capriccio' then
            equip(sets.midcast.SongDummy)
        end
        if string.find(spell.name,'Lullaby') then
            if buffactive.Troubadour then
                equip(sets.LullabyMaxDuration)
            elseif spell.english:contains('Horde') then
                equip({range=info.LullabyHarp})
            else
                equip({range=info.LullabyHorn})
            end
        end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        if player.status ~= 'Engaged' and state.WeaponLock.value == false and state.CombatForm.value == 'DW' then
            equip(sets.SongDWDuration)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if player.status ~= 'Engaged' and state.WeaponLock.value == false then
        check_weaponset()
    end
end

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

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end

    check_weaponset()
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_handle_equipping_gear(playerStatus, eventArgs)
    check_gear()
    update_combat_form()
    -- check_moving()
end

function job_update(cmdParams, eventArgs)
    handle_equipping_gear(player.status)
end

function update_combat_form()
	current_abilities = windower.ffxi.get_abilities()
	if table.contains(current_abilities.job_traits,18) then -- Dual Wield trait
        state.CombatForm:set('DW')
    else 
        state.CombatForm:reset()
    end
end

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'etude' then
        send_command('@input /ma '..state.Etude.value..' <stpc>')
    elseif cmdParams[1]:lower() == 'carol' then
        send_command('@input /ma '..state.Carol.value..' <stpc>')
    elseif cmdParams[1]:lower() == 'threnody' then
        send_command('@input /ma '..state.Threnody.value..' <stnpc>')
    end
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if buffactive['Aftermath: Lv.3'] and player.equipment.main == "Carnwenhan" then
        meleeSet = set_combine(meleeSet, sets.engaged.Aftermath)
    end

    check_weaponset()

    return meleeSet
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
    -- if state.CP.current == 'on' then
    --     equip(sets.CP)
    --     disable('back')
    -- else
    --     enable('back')
    -- end
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
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

    local i_msg = state.IdleMode.value

    local msg = ''
    if state.Kiting.value then
        msg = msg .. ' Kiting: On |'
    end

    add_to_chat(002, '| ' ..string.char(31,210).. 'Melee' ..cf_msg.. ': ' ..string.char(31,001)..m_msg.. string.char(31,002)..  ' |'
        ..string.char(31,207).. ' WS: ' ..string.char(31,001)..ws_msg.. string.char(31,002)..  ' |'
        ..string.char(31,060).. ' Magic: ' ..string.char(31,001)..c_msg.. string.char(31,002)..  ' |'
        ..string.char(31,008).. ' Idle: ' ..string.char(31,001)..i_msg.. string.char(31,002)..  ' |'
        ..string.char(31,002)..msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Determine the custom class to use for the given song.
function get_song_class(spell)
    -- Can't use spell.targets:contains() because this is being pulled from resources
    if set.contains(spell.targets, 'Enemy') then
        if state.CastingMode.value == 'Resistant' then
            return 'SongEnfeebleAcc'
        else
            return 'SongEnfeeble'
        end
    elseif state.SongMode.value == 'Dummy' then
        return 'SongDummy'
    else
        return 'SongPotency'
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
    if (player.sub_job ~= 'NIN' and player.sub_job ~= 'DNC') then
        equip(sets.DefaultShield)
    elseif player.sub_job == 'NIN' and player.sub_job_level < 10 or player.sub_job == 'DNC' and player.sub_job_level < 20 then
        equip(sets.DefaultShield)
    end
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

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- set_macro_page(1, 14)
end

function set_lockstyle()
    send_command('wait 5; input /lockstyleset ' .. lockstyleset)
end