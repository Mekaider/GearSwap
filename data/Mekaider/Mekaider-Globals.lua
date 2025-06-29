function define_user_global_sets()
    gear.left_moonlight_ring = {name="Moonlight Ring", bag="wardrobe2", priority=1}
    gear.right_moonlight_ring = {name="Moonlight Ring", bag="wardrobe4", priority=2}
    gear.left_stikini_ring = {name="Stikini Ring +1", bag="wardrobe3"}
    gear.right_stikini_ring = {name="Stikini Ring +1", bag="wardrobe4"}
end

function user_state_change(state, new_state_value, old_state_value)
    -- todo: make this nicer
    if state == 'WeaponMode' then
        if player.main_job == 'WAR' then
            if new_state_value == 'Naegling' then
                send_command('xb bar Sword')
            elseif new_state_value == 'Club' then
                send_command('xb bar Club')
            elseif new_state_value == 'Chango' then
                send_command('xb bar GreatAxe')
            elseif new_state_value == 'ShiningOne' then
                send_command('xb bar Polearm')
            elseif new_state_value == 'Montante' then
                send_command('xb bar GreatSword')
            end
        elseif player.main_job == 'SAM' then
            if new_state_value == 'Gekkei' then
                send_command('xb bar GK')
            elseif new_state_value == 'ShiningOne' then
                send_command('xb bar Polearm')
            end
        end
    end
end
