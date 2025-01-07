include('Modes')

send_command('bind f9 gs c cycle WeaponMode')
-- ~F9 is defined in job files, Gun, Shield, CastingMode, etc.
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
end

local mage_jobs = S{'WHM','BLM','RDM','PLD','DRK','BRD','NIN','SMN','BLU','SCH','GEO','RUN'}

state = {}

-- Modes

-- Internal modes used by the include, not intended for direct use by the user
state.DebugMode = M(false, 'Enable debug logging for gear changes')
state.Display = M(true, 'Enable display box')
state.Moving = M(false, 'Player is moving')
state.Stance = M{['Description']='Stance', 'Normal', 'OneHand', 'TwoHand', 'DualWield'}

-- Weapon Modes
state.WeaponMode = {}
state.WeaponMode = M{['description']='Weapon Specific Mode'}

-- Melee Modes
state.MeleeMode = M{['description']='Melee Mode', 'TP', 'Hybrid', 'Acc', 'PDL'}
state.MeleeMode:options('TP','Hybrid','Acc','PDL')
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
sets.engaged.Hybrid = {}
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

-- Job ability sets
sets.JA = {}

-- Weaponskill sets
sets.WS = {}

-- Ammunition
ammo = {}
ammo.bullet = {}
ammo.arrow = {}
ammo.bolt = {}

function precast(spell)
    update_melee_groups()

    equipSet = {}
    local message = 'empty'

    if spell.type == 'WeaponSkill' then
        equipSet = select_weaponskill_set(spell)
    elseif spell.type == 'JobAbility' then
        equipSet = sets.JA
        message = 'No JA set'

        if equipSet[spell.english] then
            equipSet = equipSet[spell.english]
            message = 'JA set: '..spell.english
        end
    -- elseif spell.type == 'CorsairRoll' then 
    -- elseif spell.type == 'CorsairShot' then
    -- elseif spell.type == 'Ninjutsu' then
    -- elseif spell.type == 'White Magic' then
    -- elseif spell.type == 'Black Magic' then
    -- elseif spell.type == 'SummonerPact' then
    -- elseif spell.type == 'SummonerPact' then
    -- elseif spell.type == 'Waltz' then
    end

    log(message)
    equip(equipSet)
end

function midcast(spell) end

function aftercast(spell)
    if pet_midaction() then
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
        equipSet = set_combine(equipSet, sets.idle.Moving)
        message = 'sets.idle.Moving'
    end

    -- Combine the main/sub defined in weaponmode, unless it's set to unlocked
    if state.WeaponMode.value ~= 'Unlocked' then
        equipSet = set_combine(equipSet, sets.weapons[state.WeaponMode.value])
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
    if #commandArgs:split(' ') >1 then
        commandArgs = T(commandArgs:split(' '))

        if commandArgs[1] == 'cycle' then
            if commandArgs[2]:lower() == 'weaponmode' then
                local state_var = get_state(commandArgs[2])
                if state_var then
                    local old_value = state_var.value
                    state.WeaponMode:cycle()
                    local new_value = state.WeaponMode.value
                    if state_change then
                        state_change(commandArgs[2], new_value, old_value)
                    end
                end

                equip(sets.weapons[state.WeaponMode.value])
            elseif commandArgs[2]:lower() == 'meleemode' then
                local state_var = get_state(commandArgs[2])
                if state_var then
                    local old_value = state_var.value
                    state.MeleeMode:cycle()
                    local new_value = state.MeleeMode.value
                    if state_change then
                        state_change(commandArgs[2], new_value, old_value)
                    end
                end
            end
        elseif commandArgs[1] == 'set' then
            if commandArgs[2]:lower() == 'weaponmode' then
                local state_var = get_state(commandArgs[2])
                if state_var then
                    local old_value = state_var.value
                    state.WeaponMode:set(commandArgs[3])
                    local new_value = state.WeaponMode.value
                    if state_change then
                        state_change(commandArgs[2], new_value, old_value)
                    end
                end
            end
                equip(sets.weapons[state.WeaponMode.value])
            elseif commandArgs[2]:lower() == 'meleemode' then
                local state_var = get_state(commandArgs[2])
                if state_var then
                    local old_value = state_var.value
                state.MeleeMode:set(commandArgs[3])
                local new_value = state.MeleeMode.value
                if state_change then
                    state_change(commandArgs[2], new_value, old_value)
                end
            end
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

function handle_cycle() end -- todo

function handle_set() end -- todo

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
    elseif main ~= 'empty' and S{1,4,6,7,8,10,12}:contains(main.skill) then
        state.Stance:set('TwoHand')
    elseif sub ~= 'empty' and sub.skill and not S{0,30}:contains(sub.skill) then
        state.Stance:set('DualWield')
    end
end

function display_box_update()
    width = 22
    dialog = {}

    melee_mode_value = state.MeleeMode.value

    if player.status == 'Engaged' and state.Stance.value ~= "Normal" then
        melee_mode_value = state.MeleeMode.value..' ('..state.Stance.value..')'
    end

    if sets.engaged[state.WeaponMode.value] then
        melee_mode_value = state.MeleeMode.value..' ('..state.WeaponMode.value..')'

        if sets.engaged[state.WeaponMode.value][state.MeleeMode.value] then
            melee_mode_value = state.MeleeMode.value..' ('..state.WeaponMode.value..')'
        end
    end
    
    dialog[#dialog+1] = {description='Weapon', value = state.WeaponMode.value}
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
                if player.status == 'Idle' then
                    send_command('gs c update')
                end
            elseif not movement and moving then
                moving = false
                state.Moving:set(false)
                if player.status == 'Idle' then
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
    if state == 'WeaponMode' then
        check_stance() 
        send_command('wait 0.7; gs c update')
        display_box_update()
    else
        send_command('gs c update')
    end

    if state_change_custom then
        state_change_custom(state, new_state_value, old_state_value)
    end

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

    if player.sub_job == 'DNC' then
        state.CustomMeleeGroups:append('SubDNC')
    elseif player.sub_job == 'NIN' then
        state.CustomMeleeGroups:append('SubNIN')
    end
end
