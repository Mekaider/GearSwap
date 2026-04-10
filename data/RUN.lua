function job_setup()
    state.Buff['Embolden'] = buffactive['Embolden'] or false
    state.MagicMode:options('Normal', 'SIRD')
end

function job_buff_change(name, gain)
    if name == 'Embolden' then
        if gain and sets.buff.Embolden then
                disable('back')
            else
                enable('back')
        end
    end
end

function get_sets()
    -- Load and initialize the include file.
    include('Mekaider-Include')
end

function init_gear_sets() end
