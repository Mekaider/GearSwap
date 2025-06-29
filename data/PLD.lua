function job_setup()
    state.MeleeMode:options('PDT', 'AoE', 'Meva', 'TP')
    state.MagicMode:options('Normal', 'SIRD')
end

function get_sets()
    -- Load and initialize the include file.
    include('Mekaider-Include')
end

function job_midcast(spell)
    equipSet = sets.midcast
    message = ''

    if spell.type == 'BlueMagic' then
        if blue_magic_emnity_spells:contains(spell.english) then
            equipSet = equipSet['Blue Magic'].Enmity
            message = 'Blue magic enmity set'
        elseif blue_magic_healing_spells:contains(spell.english) then
            equipSet = equipSet['Blue Magic'].Cure
            message = 'Blue magic healing set'
        end

        if equipSet[state.MagicMode.value] then
            equipSet = equipSet[state.MagicMode.value]
            message = message..' ('..state.MagicMode.value..')'
        end
    end

    if message ~= '' then
        log('job_midcast: '..message)
    end
    return equipSet
end
