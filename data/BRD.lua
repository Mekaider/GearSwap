function job_setup()
    state.Buff['Pianissimo'] = buffactive['Pianissimo'] or false
    state.Buff['Troubadour'] = buffactive['Troubadour'] or false
end

function get_sets()
    -- Load and initialize the include file.
    include('Mekaider-Include')
end
