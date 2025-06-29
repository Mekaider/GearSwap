function job_setup()
    state.RegenMode = M{['description']='Regen Mode', 'Potency', 'Duration'} -- not currently used
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

    if buffactive['Penury'] and sets.Penury then
        if spell.type == 'WhiteMagic' then
            equipSet = set_combine(equipSet, sets.Penury)
            message = 'sets.Penury'
        end
    end

    if buffactive['Celerity'] and sets.Celerity then
        if spell.type == 'WhiteMagic' then
            equipSet = set_combine(equipSet, sets.Celerity)
            message = 'sets.Celerity'
        end
    end

    if buffactive['Parsimony'] and sets.Parsimony then
        if spell.type == 'BlackMagic' then
            equipSet = set_combine(equipSet, sets.Parsimony)
            message = 'sets.Parsimony'
        end
    end

    if buffactive['Alacrity'] and sets.Alacrity then
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

        if buffactive['Ebullience'] and sets.Ebullience then
            equipSet = set_combine(equipSet, sets.Ebullience)
            message = message..' sets.Ebullience'
        end
    end

    if spell.skill == 'Enhancing Magic' then
        if buffactive['Perpetuance'] and sets.Perpetuance then
            equipSet = set_combine(equipSet, sets.Perpetuance)
            message = 'sets.Perpetuance'
        end
    end

    if spell.skill == 'Healing Magic' or spell.skill == 'Divine Magic' then
        if buffactive['Rapture'] and sets.Rapture then
            equipSet = set_combine(equipSet, sets.Rapture)
            message = 'sets.Rapture'
        end
    end

    if message ~= '' then
        log('job_midcast: '..message)
    end

    return equipSet
end
