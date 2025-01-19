include('Modes')

send_command('bind f9 gs c cycle WeaponMode')
-- ~F9 is defined in job files, Gun, Shield, etc.
send_command('bind f10 gs c cycle MeleeMode')
-- send_command('bind f11 gs c cycle CastingMode')
send_command('bind f12 gs c update')
send_command('bind %~b gs c toggle MagicBurst')

send_command('bind %~1 switch to Mekaider')
send_command('bind %~2 switch to Sodapoppy')
send_command('bind %~3 switch to Sarsaparilla')
send_command('bind %~4 switch to Neonx')
send_command('bind %~5 switch to Haronaru')
send_command('bind %~6 switch to Verain')

function file_unload() 
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f12')

    send_command('unbind ~1')
    send_command('unbind ~2')
    send_command('unbind ~3')
    send_command('unbind ~4')
    send_command('unbind ~5')
    send_command('unbind ~6')
    send_command('unbind ~b')

    if file_unload_custom then
        file_unload_custom()
    end
end

local mage_jobs = S{'WHM','BLM','RDM','PLD','DRK','BRD','NIN','SMN','BLU','SCH','GEO','RUN'}

blue_magic_emnity_spells = S{'Blank Gaze', 'Geist Wall', 'Jettatura', 'Soporific', 'Sheep Song'}
blue_magic_healing_spells = S{'Wild Carrot', 'Healing Breeze', 'Magic Fruit'}

na_spells = S{'Blindna', 'Cursna', 'Paralyna', 'Poisona', 'Silena', 'Stona', 'Viruna'}
bar_element_spells = S{'Barfire', 'Barblizzard', 'Baraero', 'Barstone', 'Barthunder', 'Barwater',
    'Barfira', 'Barblizzara', 'Baraera', 'Barstonra', 'Barthundra', 'Barwatera'}
bar_status_spells = S{'Baramnesia', 'Barvirus', 'Barparalyze', 'Barsilence', 'Barpetrify', 'Barpoison', 'Barblind', 'Barsleep',
    'Baramnesra', 'Barvira', 'Barparalyzra', 'Barsilencera', 'Barpetra', 'Barpoisonra', 'Barblindra', 'Barsleepra'}

elemental_weaponskills = S{'Gust Slash', 'Cyclone', 'Energy Steal', 'Energy Drain', 'Aeolian Edge',
	'Burning Blade', 'Red Lotus Blade', 'Shining Blade', 'Seraph Blade', 'Sanguine Blade',
    'Frostbite', 'Freezebite', 'Herculean Slash',
    'Cloudsplitter', 'Primal Rend',
    'Dark Harvest', 'Shadow of Death', 'Infernal Scythe',
    'Thunder Thrust', 'Raiden Thrust',
    'Blade: Teki', 'Blade: To', 'Blade: Chi', 'Blade: Ei', 'Blade: Yu',
    'Tachi: Goten', 'Tachi: Kagero', 'Tachi: Jinpu', 'Tachi: Koki',
    'Shining Strike', 'Seraph Strike', 'Flash Nova',
    'Rock Crusher', 'Earth Crusher', 'Starburst', 'Sunburst', 'Cataclysm', 'Vidohunir', 'Garland of Bliss', 'Omniscience',
    'Flaming Arrow', 
    'Hot Shot', 'Wildfire', 'Trueflight', 'Leaden Salute'
}

state = {}

-- Modes

-- Internal modes used by the include, not intended for direct use by the user
state.DebugMode = M(false, 'Enable debug logging for gear changes')
state.Display = M(true, 'Enable display box')
state.Moving = M(false, 'Player is moving')
state.Stance = M{['Description']='Stance', 'Normal', 'OneHand', 'TwoHand', 'DualWield'}

-- Weapon Modes
state.WeaponMode = M{['description']='Weapon Mode'}
state.ShieldMode = M{['description']='Shield Mode', 'off'} -- only used for Paladin so far
state.WeaponLock = M(false)

-- Melee Modes
state.MeleeMode = M{['description']='Melee Mode', 'TP', 'DT', 'Acc', 'PDL'}
state.MeleeMode:options('TP','DT','Acc','PDL')
state.MeleeMode:set('TP')

state.CustomMeleeGroups = L{}

-- Magic Modes
state.MagicMode = M{['description']='Magic Mode', 'Normal', 'M.Acc'}
state.MagicBurst = M(false)

-- Default set definitions

-- Weapon sets
sets.weapons = {}
sets.weapons.Shield = {}
sets.weapons.Gun = {}

-- Idle sets
sets.idle = {}
sets.idle.Moving = {}
sets.idle.Pet = {}
sets.idle.Sublimation = {}

-- Engaged sets
sets.engaged = {}
sets.engaged.DT = {}
sets.engaged.Acc = {}
sets.engaged.PDL = {}
sets.engaged.OneHand = {}
sets.engaged.TwoHand = {}
sets.engaged.DualWield = {}

-- Resting set
sets.resting = {}

-- Precast sets
sets.precast = {}
sets.precast.FastCast = {}
sets.precast.FastCast['Enhancing Magic'] = {}
sets.precast.Cure = {}
sets.precast.QuickMagic = {}
sets.precast.Utsusemi = {}
sets.precast.RangedAttack = {}
sets.precast.RangedAttack.Flurry = {}
sets.precast.RangedAttack.FlurryII = {}

-- Midcast sets
sets.midcast = {}
sets.midcast.FastCast = sets.precast.FastCast
sets.midcast.RangedAttack = {}
sets.midcast.BoostStat = {}
sets.midcast.BarElement = {}
sets.midcast.BarStatus = {}

-- Job ability sets
sets.JA = {}

-- Weaponskill sets
sets.WS = {}

sets.Obi = {}

sets.buff = {}

sets.naked = {main=empty,sub=empty,range=empty,ammo=empty,
    head=empty,neck=empty,ear1=empty,ear2=empty,
    body=empty,hands=empty,ring1=empty,ring2=empty,
    back=empty,waist=empty,legs=empty,feet=empty}

-- Ammunition
ammo = {}
ammo.bullet = {}
ammo.arrow = {}
ammo.bolt = {}

function precast(spell)
    update_melee_groups()

    equipSet = {}
    local message = ''

    if spell.type == 'WeaponSkill' then
        equipSet = select_weaponskill_set(spell)
    elseif spell.type == 'JobAbility' then
        equipSet = sets.JA
        message = 'No JA set'

        if equipSet[spell.english] then
            equipSet = equipSet[spell.english]
            message = 'JA set: '..spell.english
        end
    elseif spell.action_type == 'Magic' then
        equipSet = sets.precast.FastCast
        message = 'Fast Cast precast set'

        if equipSet[spell.english] then -- check for set for this specific spell
            equipSet = equipSet[spell.english]
            message = spell.english..' precast set'
        elseif (spell.english:startswith('Cure') or spell.english:contains('Cura')) and equipSet.Cure then -- todo: Cure 1 hits the condition above, not sure how much I care
            equipSet = equipSet.Cure
            message = 'Cure precast set'
        elseif spell.skill and equipSet[spell.skill] then -- check for set for this magic skill e.g. 'Healing Magic'
            equipSet = equipSet[spell.skill]
            message = spell.skill..' precast set'
        end
    -- elseif spell.type == 'CorsairRoll' then 
    -- elseif spell.type == 'CorsairShot' then
    -- elseif spell.type == 'Ninjutsu' then
    -- elseif spell.type == 'SummonerPact' then
    -- elseif spell.type == 'Waltz' then
    -- ranged?
    end

    if equipSet[state.MagicMode.value] then
        equipSet = equipSet[state.MagicMode.value]
        message = message..' ('..state.MagicMode.value..')'
    end

    -- enforce WeaponMode, even over gear sets, if WeaponLock is true
    if state.WeaponLock.value then
        equipSet = set_combine(equipSet, sets.weapons[state.WeaponMode.value])
    end

    if precast_custom then
        equipSet = set_combine(equipSet, precast_custom(spell))
    end

    if message ~= '' then
        log(message)
    end
    equip(equipSet)
end

function midcast(spell) 
    equipSet = sets.midcast
    local message = 'No midcast set'

    -- if spell.action_type == 'Magic' then
    --     equipSet = sets.precast.FastCast
    --     message = 'Fast Cast midcast set'
    -- end

    if equipSet[spell.english] then -- check for set for this specific spell
        equipSet = equipSet[spell.english]
        message = spell.english..' set'
    end

    if spell.type == 'WhiteMagic' then 
        if (spell.english:startswith('Cure') or spell.english:contains('Cura')) and equipSet.Cure then
            equipSet = equipSet.Cure
            message = 'Cure set'
            
            if (buffactive['Afflatus Solace'] and equipSet['Afflatus Solace']) and not spell.english:contains('ga') then
                equipSet = equipSet['Afflatus Solace']
                message = message..' (Afflatus Solace)'
            end
        elseif spell.english:contains('Protect') and equipSet.Protect then
            equipSet = equipSet.Protect
            message = 'Protect set'
        elseif na_spells:contains(spell.english) and equipSet.NaSpell then
            equipSet = equipSet.NaSpell
            message = 'Status removal set'
        elseif spell.english:startswith('Boost-') and equipSet.BoostStat then
            equipSet = equipSet.BoostStat
            message = 'Boost stat set'
        elseif bar_element_spells:contains(spell.english) and equipSet.BarElement then
            equipSet = equipSet.BarElement
            message = 'BarElement set'
        elseif bar_status_spells:contains(spell.english) and equipSet.BarStatus then
            equipSet = equipSet.BarStatus
            message = 'BarStatus set'
        elseif spell.english:contains('Regen') and equipSet.Regen then
            equipSet = equipSet.Regen
            message = 'Regen set'
        elseif spell.skill and equipSet[spell.skill] then -- check for set for this magic skill e.g. 'Healing Magic'
            equipSet = equipSet[spell.skill]
            message = spell.skill..' set'
        end
    end

    if equipSet[state.MagicMode.value] then
        equipSet = equipSet[state.MagicMode.value]
        message = message..' ('..state.MagicMode.value..')'
    end

    -- enforce WeaponMode, even over gear sets, if WeaponLock is true
    if state.WeaponLock.value then
        equipSet = set_combine(equipSet, sets.weapons[state.WeaponMode.value])
    end
    
    if message ~= '' then
        log(message)
    end

    equipSet = elemental_check(spell, equipSet)
    
    if midcast_custom then
        equipSet = set_combine(equipSet, midcast_custom(spell))
    end
    equip(equipSet)
end

function aftercast(spell)
    if player.main_job == 'SMN' and pet_midaction() then
        return
    else
        equip(select_set())
    end
end

function status_change(new,old)
    equip(select_set())
end

function select_idle_set()
    -- update_melee_groups() -- not sure I need to do this here

    equipSet = {}
    equipSet = sets.idle
    message = 'sets.idle'

    if equipSet[state.MeleeMode.value] then
        equipSet = equipSet[state.MeleeMode.value]
        message = 'sets.idle.'..state.MeleeMode.value
    end

    if state.Moving.value == true then
        equipSet = set_combine(equipSet, sets.Moving)
        message = 'sets.Moving'
    end

    if buffactive['Sublimation: Activated'] and sets.buff['Sublimation: Activated'] then
        equipSet = set_combine(equipSet, sets.buff['Sublimation: Activated'])
    end

    -- Combine the main/sub defined in weaponmode, unless it's set to unlocked
    if state.WeaponMode.value ~= 'Unlocked' then
        equipSet = set_combine(equipSet, sets.weapons[state.WeaponMode.value])
        -- equipSet = set_combine(equipSet, {main="", sub="", ranged="", ammo=""})
    else
        -- PLD specific handling for multiple shield options
        if state.ShieldMode.value ~= 'off' then
            equipSet = set_combine(equipSet, {sub=state.ShieldMode.value})
        end
    end

    log(message)
    display_box_update()
    return equipSet
end

function select_melee_set()
    check_stance()
    update_melee_groups()

    equipSet = {}
    equipSet = sets.engaged
    message = 'sets.engaged'

    -- check if OneHand, TwoHand, or DualWield and if there is a set defined, use it
    if state.Stance.value ~= "Normal" and equipSet[state.Stance.value] then
        equipSet = equipSet[state.Stance.value]
        message = message..' ('..state.Stance.value..')'
    end

    -- This currently overrides any One/Two Handed or Dual Wield sets instead of augmenting them
    -- Though I currently can't see a use case to augment instead, a weapon specific set must be aware of One/TwoHand, etc. 
    if sets.engaged[state.WeaponMode.value] then 
        equipSet = sets.engaged[state.WeaponMode.value]
        message = 'sets.engaged.'..state.WeaponMode.value
    end

    -- After we've chosen the engaged set, check if there is a sub set for the specific Melee Mode
    if equipSet[state.MeleeMode.value] then
        equipSet = equipSet[state.MeleeMode.value]
        message = 'sets.engaged.'..state.MeleeMode.value
    end

    -- Finally, check for any custom melee groups (e.g. Impetus, Mighty Strikes, etc.)
    for _,group in ipairs(state.CustomMeleeGroups) do
        if equipSet[group] then
            equipSet = equipSet[group]
            message = message..' ('..group..')'
        end
    end

    -- Combine the main/sub defined in weaponmode, unless it's set to unlocked
    if state.WeaponMode.value ~= 'Unlocked' then
        equipSet = set_combine(equipSet, sets.weapons[state.WeaponMode.value])
        -- equipSet = set_combine(equipSet, {main="", sub="", ranged="", ammo=""})
    else
        -- todo: probably something about default shield, e.g. COR, RNG

        -- PLD specific handling for multiple shield options
        if state.ShieldMode.value then
            equipSet = set_combine(equipSet, {sub=state.ShieldMode.value})
        end
    end

    log(message)
    display_box_update()
    return equipSet
end

function select_weaponskill_set(spell) 
    update_melee_groups()

    equipSet = {}
    equipSet = sets.WS
    local message = 'sets.WS'

    if equipSet[spell.english] then
        equipSet = equipSet[spell.english]
        message = 'WS set: '..spell.english
    end

    if equipSet[state.WeaponMode.value] then
        equipSet = equipSet[state.WeaponMode.value]
        message = message..' ('..state.WeaponMode.value..')'
    end

    if equipSet[state.MeleeMode.value] then
        equipSet = equipSet[state.MeleeMode.value]
        message = message..' ('..state.MeleeMode.value..')'
    end

    -- Finally, check for any custom melee groups (e.g. sets.WS['Victory Smite'].Impetus)
    for _,group in ipairs(state.CustomMeleeGroups) do
        if equipSet[group] then
            equipSet = equipSet[group]
            message = message..' ('..group..')'
        end
    end

    log(message)
    return equipSet
end

function select_set()
    equipSet = {}

    if player.status == 'Idle' and player.hp > 0 then
        equipSet = select_idle_set()
    elseif player.status == 'Engaged' then
        equipSet = select_melee_set()
    elseif player.status == 'Resting' then
        equipSet = set_combine(select_idle_set(), sets.resting)
    end

    return equipSet
end

function self_command(cmd) 
    local commandArgs = cmd
    log('self command: '..commandArgs)
    -- todo: improve (specifically that it's slicing based on spaces and sometimes I want a space, 
    -- e.g. gs c set WeaponMode Shining One)
    if #commandArgs:split(' ') >1 then
        commandArgs = T(commandArgs:split(' '))

        if commandArgs[1] == 'cycle' then
            handle_cycle(commandArgs) 
        elseif commandArgs[1] == 'set' then
            handle_set(commandArgs)
        end
    elseif commandArgs == 'update' then
        equip(select_set())
    elseif commandArgs == 'debug' then
        state.DebugMode:toggle()
    elseif commandArgs == 'display' then
        state.Display:toggle()
        if state.Display.value then
            gs_status:show()
        else
            gs_status:hide()
        end
    end

    display_box_update()
end

function handle_cycle(commandArgs) 
    local state_var = get_state(commandArgs[2])

    if state_var then
        local old_value = state_var.current
        state_var:cycle()
        local new_value = state_var.current
        state_change(commandArgs[2], new_value, old_value)
    else
        add_to_chat(123,'self_command: Set: Unknown field ['..commandArgs[2]..']')
    end
end

function handle_set(commandArgs) 
    local state_var = get_state(commandArgs[2])

    if state_var then
        local old_value = state_var.current
        state_var:set(commandArgs[3])
        local new_value = state_var.current
        state_change(commandArgs[2], new_value, old_value)
    else
        add_to_chat(123,'self_command: Set: Unknown field ['..commandArgs[2]..']')
    end
end

function log(msg)
    if state.DebugMode.value then
        if msg == nil then
            windower.add_to_chat(80,'-- Value is Nil --')
        elseif type(msg) == "table" then
            for index, value in pairs(msg) do
                windower.add_to_chat(80,'-- '..tostring(value)..' --')
            end
        elseif type(msg) == "number" then
            windower.add_to_chat(80,'-- '..tostring(msg)..' --')
        elseif type(msg) == "string" then
            windower.add_to_chat(80,'-- '..msg..' --')
        elseif type(msg) == "boolean" then
            windower.add_to_chat(80,'-- '..tostring(msg)..' --')
        else
            windower.add_to_chat(80,'-- Unknown Debug Message --')
        end
    end
end

-- Stance check functions
-- https://github.com/Windower/Resources/blob/master/resources_data/skills.lua
function get_equipped_item_data(slot)
    local item = gearswap.items[gearswap.to_windower_bag_api(gearswap.res.bags[gearswap.items.equipment[slot].bag_id].en)][gearswap.items.equipment[slot].slot]
    return player.equipment[slot] ~= empty and item and item.id and gearswap.res.items[item.id] or "empty"
end

function check_stance() 
    state.Stance:reset()

    local sub = get_equipped_item_data('sub')
    local main =  get_equipped_item_data('main')

    if main ~= 'empty' and not S{1,4,6,7,8,10,12}:contains(main.skill) and (sub == 'empty' or not sub.skill) then
        state.Stance:set('OneHand')
    elseif main ~= 'empty' and S{4,6,7,8,10,12}:contains(main.skill) then
        state.Stance:set('TwoHand')
    elseif sub ~= 'empty' and sub.skill and not S{0,30}:contains(sub.skill) then
        state.Stance:set('DualWield')
    end
    log('stance: '..state.Stance.value)
end

function display_box_update()
    width = 22
    dialog = {}

    melee_mode_value = state.MeleeMode.value

    if player.status == 'Engaged' and state.Stance.value ~= "Normal" and sets.engaged[state.Stance.value] then
        melee_mode_value = state.MeleeMode.value..' ('..state.Stance.value..')'
    end

    if sets.engaged[state.WeaponMode.value] then
        melee_mode_value = state.MeleeMode.value..' ('..state.WeaponMode.value..')'

        if sets.engaged[state.WeaponMode.value][state.MeleeMode.value] then
            melee_mode_value = state.MeleeMode.value..' ('..state.WeaponMode.value..')'
        end
    end
    
    if state.WeaponLock.value then
        dialog[#dialog+1] = {description='Weapon(L)', value = state.WeaponMode.value}
    else
        dialog[#dialog+1] = {description='Weapon', value = state.WeaponMode.value}
    end

    if player.main_job == 'PLD' then
        dialog[#dialog+1] = {description='Shield', value=state.ShieldMode.value}
    end

    dialog[#dialog+1] = {description='Mode', value = melee_mode_value}

    if mage_jobs:contains(player.main_job) then
        dialog[#dialog+1] = {description='MagicMode', value=state.MagicMode.value}
    end

    lines = T{}
    for k, v in next, dialog do
        lines:insert(v.description ..string.format('[%s]', tostring(v.value)):lpad(' ',width-string.len(tostring(v.description))))
    end
    gs_status:text(lines:concat('\n'))
end

Display_Box = {
    text={
        size=11,
        font='Consolas',
        red=255,
        green=255,
        blue=255,
        alpha=255
    },
    pos={
        x=1600,
        y=1000
    },
    bg={
        visible=true,
        red=0,
        green=0,
        blue=0,
        alpha=102
    },
}
gs_status = {}
gs_status = texts.new("", Display_Box)
if state.Display.value then
    gs_status:show()
end

coroutine.schedule(display_box_update, 0.1)

-- Automatically combine movement speed set into idle set when moving
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
                state.Moving:set(true)
                if player.status ~= 'Engaged' then
                    send_command('gs c update')
                end
            elseif not movement and moving then
                moving = false
                state.Moving:set(false)
                if player.status ~= 'Engaged' then
                    send_command('gs c update')
                end
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

-- Get the state var that matches the requested name. Only returns mode vars.
function get_state(name)
    if state[name] then
        return state[name]._class == 'mode' and state[name] or nil
    else
        local l_name = name:lower()
        for key,var in pairs(state) do
            if key:lower() == l_name then
                return var._class == 'mode' and var or nil
            end
        end
    end
end

-- This function can be extended by defining and calling state_change_custom, if you need to do anything when state vars change
-- see Mekaider/WAR.lua for an example
function state_change(state, new_state_value, old_state_value)
    log('state change: '..state..': '..new_state_value)
    send_command('gs c update')
    if state == 'WeaponMode' then
        send_command('wait 0.8; gs c update')
    end
    
    if state_change_custom then
        state_change_custom(state, new_state_value, old_state_value)
    end
    
    display_box_update()
    -- coroutine.schedule(display_box_update, 1)
end

function update_melee_groups()
    state.CustomMeleeGroups:clear()

    if buffactive['Mighty Strikes'] then
        state.CustomMeleeGroups:append('Mighty Strikes')
    end

    if buffactive['Impetus'] then
        state.CustomMeleeGroups:append('Impetus')
    end

    if buffactive['Footwork'] then
        state.CustomMeleeGroups:append('Footwork')
    end

    -- perhaps refactor this to stop producing Sub job groups and instead just produce the DW tier, e.g. DualWield4
    if player.sub_job == 'DNC' then
        state.CustomMeleeGroups:append('SubDNC')
    elseif player.sub_job == 'NIN' then
        state.CustomMeleeGroups:append('SubNIN')
    end
end

function elemental_check(spell, equipSet)
    -- todo: refactor so it doesn't run in both precast and midcast?
    -- maybe break out weaponskill into it's own check, it's the only one that runs in precast
    if spell.type == 'WeaponSkill' then
        if elemental_weaponskills:contains(spell.name) then
            -- if day or weather
            if (spell.element == world.day_element or spell.element == world.weather_element) and sets.Obi then
                equipSet = set_combine(equipSet, sets.Obi)
            end
        end
    elseif spell.action_type == 'Magic' then
        if spell.english:startswith('Cure') or spell.english:contains('Cura') then
            if (spell.element == world.day_element or spell.element == world.weather_element) and sets.Obi then
                equipSet = set_combine(equipSet, sets.Obi)
            end
        end
        -- todo: elemental magic, divine magic(?), blue magic, etc.
        -- todo: Orpheus Sash check
    end

    return equipSet
end

function buff_change(name,gain,buff_details)
    log('buff change: '..name..' '..tostring(gain))

    if sets.buff[name] then
        log('buff set found: '..name)
        if gain then
            equip(sets.buff[name])
        else
            send_command('gs c update')
        end
    end

    if buff_change_custom then
        buff_change_custom()
    end
end

-- todo list
-- town set
-- full precast and midcast for all types of spells
    -- magic
    -- Non-standard JAs, Phantom Roll, Dancer JAs, etc.
    -- Ranged Attacks
-- default shield if not DualWield, e.g. for COR, RNG
-- add pet sets


--[[ 
weapon mode logic

WeaponMode sets will be used like:

    precast and midcast:
        any weapons defined in sets will be used, _unless_ state.WeaponLock is true, 
        in which case the active weapons will be used instead (essentially preventing weapon changes)

    aftercast (engaged and idle):
        the current weaponset will be used; any weapons defined in sets will be ignored

    Special WeaponMode: 'Unlocked'
        When WeaponMode is set to Unlocked, the include will not change weapons, but weapons defined in sets will work as expected 

    -- enforce WeaponMode, even over gear sets, if WeaponLock is true
    if state.WeaponLock.value then
        equipSet = set_combine(equipSet, sets.weapons[state.WeaponMode.value])
    end

--]]