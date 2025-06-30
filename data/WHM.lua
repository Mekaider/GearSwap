function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
end

function get_sets()
    -- Load and initialize the include file.
    include('Mekaider-Include')
end

function job_update_magic_groups()
    if state.Buff['Afflatus Solace'] then
        state.CustomMagicGroups:append('Afflatus Solace')
    end
end
