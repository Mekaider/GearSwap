function job_setup()
    state.TreasureHunterMode:set('Tag')

    state.Buff['Sneak Attack'] = buffactive['Sneak Attack'] or false
    state.Buff['Trick Attack'] = buffactive['Trick Attack'] or false
end

function get_sets()
    -- Load and initialize the include file.
    include('Mekaider-Include')
end

function init_gear_sets() end
