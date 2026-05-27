function job_setup() end

function get_sets()
    -- Load and initialize the include file.
    include('Mekaider-Include')
end

function job_pet_midcast(spell)
    if spell.name:contains('Healing Breath') and sets['Healing Breath'] then
        equip(sets['Healing Breath'])
    end
end

function init_gear_sets() end
