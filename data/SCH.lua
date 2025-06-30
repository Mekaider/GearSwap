function job_setup()
    state.RegenMode = M{['description']='Regen Mode', 'Potency', 'Duration'} -- not currently used

    state.Buff['Light Arts'] = buffactive['Light Arts'] or false
    state.Buff['Dark Arts'] = buffactive['Dark Arts'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
end

function get_sets()
    -- Load and initialize the include file.
    include('Mekaider-Include')
end

function job_precast(spell)
    message = ''
    equipSet = {}

    if (spell.type == 'WhiteMagic' and (buffactive['Light Arts'] or buffactive['Addendum: White'])) or
        (spell.type == 'BlackMagic' and (buffactive['Dark Arts'] or buffactive['Addendum: Black'])) then
            if sets.precast.FastCast.Grimoire then
                equipSet = sets.precast.FastCast.Grimoire
                message = 'sets.precast.FastCast.Grimoire'
            end
    end

    if message ~= '' then
        log('job_precast: '..message)
    end

    return equipSet
end

function job_midcast(spell)
    message = ''
    equipSet = {}

    if state.Buff['Penury'] and sets.Penury then
        if spell.type == 'WhiteMagic' then
            equipSet = set_combine(equipSet, sets.Penury)
            message = 'sets.Penury'
        end
    end

    if state.Buff['Celerity'] and sets.Celerity then
        if spell.type == 'WhiteMagic' then
            equipSet = set_combine(equipSet, sets.Celerity)
            message = 'sets.Celerity'
        end
    end

    if state.Buff['Parsimony'] and sets.Parsimony then
        if spell.type == 'BlackMagic' then
            equipSet = set_combine(equipSet, sets.Parsimony)
            message = 'sets.Parsimony'
        end
    end

    if state.Buff['Alacrity'] and sets.Alacrity then
        if spell.type == 'BlackMagic' then
            equipSet = set_combine(equipSet, sets.Alacrity)
            message = 'sets.Alacrity'
        end
    end

    if spell.skill == 'Elemental Magic' then
        if buffactive['Klimaform'] and spell.element == world.weather_element then
            if sets.Klimaform then
                equipSet = set_combine(equipSet, sets.Klimaform)
                message = 'sets.Klimaform'
            end
        end

        if state.Buff['Ebullience'] and sets.Ebullience then
            equipSet = set_combine(equipSet, sets.Ebullience)
            message = message..' sets.Ebullience'
        end
    end

    if spell.skill == 'Enhancing Magic' then
        if state.Buff['Perpetuance'] and sets.Perpetuance then
            equipSet = set_combine(equipSet, sets.Perpetuance)
            message = 'sets.Perpetuance'
        end
    end

    if spell.skill == 'Healing Magic' or spell.skill == 'Divine Magic' then
        if state.Buff['Rapture'] and sets.Rapture then
            equipSet = set_combine(equipSet, sets.Rapture)
            message = 'sets.Rapture'
        end
    end

    if message ~= '' then
        log('job_midcast: '..message)
    end

    return equipSet
end

function job_update_magic_groups()
    if state.Buff['Immanence'] then
        state.CustomMagicGroups:append('Immanence')
    end
end
