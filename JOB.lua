-- Load and initialize the include file.
include('Mekaider-Include')

lockstyleset = 1
send_command('wait 5; input /lockstyleset '..lockstyleset)

state.WeaponMode:options('Unlocked')
state.WeaponMode:set('Unlocked')
state.MeleeMode:options('TP', 'DT', 'PDL')
state.MeleeMode:set('TP')

function get_sets() 

    sets.Moving = {right_ring="Shneddick Ring"}
    
    sets.idle = {}

    sets.engaged = {}

    sets.WS = {}

    sets.JA = {}

    sets.precast.FastCast = {}
end
