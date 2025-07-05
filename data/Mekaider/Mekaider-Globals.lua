function define_user_global_sets()
    gear.left_moonlight_ring = {name="Moonlight Ring", bag="wardrobe2", priority=1}
    gear.right_moonlight_ring = {name="Moonlight Ring", bag="wardrobe4", priority=2}
    gear.left_stikini_ring = {name="Stikini Ring +1", bag="wardrobe3"}
    gear.right_stikini_ring = {name="Stikini Ring +1", bag="wardrobe4"}

    gear.sch_af_head = "Acad. Mortar. +3"
    gear.sch_af_body = "Acad. Gown +3"
    gear.sch_af_hands = "Acad. Bracers +3"
    gear.sch_af_legs = "Acad. Pants +2"
    gear.sch_af_feet = "Acad. Loafers +3"

    gear.sch_relic_head = "Peda. M.Board +1"
    gear.sch_relic_body = "Peda. Gown +1"
    gear.sch_relic_hands = "Peda. Bracers"
    gear.sch_relic_legs = "Pedagogy Pants"
    gear.sch_relic_feet = "Peda. Loafers"

    gear.sch_emp_head = "Arbatel Bonnet +2"
    gear.sch_emp_body = "Arbatel Gown +3"
    gear.sch_emp_hands = "Arbatel Bracers +2"
    gear.sch_emp_legs = "Arbatel Pants +3"
    gear.sch_emp_feet = "Arbatel Loafers +3"
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
