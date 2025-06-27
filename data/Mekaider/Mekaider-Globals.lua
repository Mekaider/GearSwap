function user_state_change(state, new_state_value, old_state_value)
    -- todo: make this much nicer
    if player.main_job == 'WAR' then
        if state == 'WeaponMode' then 
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
        end
    elseif player.main_job == 'SAM' then
        if new_state_value == 'Gekkei' then
            send_command('xb bar GK')
        elseif new_state_value == 'ShiningOne' then
            send_command('xb bar Polearm')
        end
    end
end