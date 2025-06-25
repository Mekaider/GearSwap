function define_global_sets()
    sets.Moving = {right_ring="Shneddick Ring"}
end

-------------------------------------------------------------------------------------------------------------------
-- Functions to set user-specified binds, generally on load and unload.
-- Kept separate from the main include so as to not get clobbered when the main is updated.
-------------------------------------------------------------------------------------------------------------------

-- Function to bind GearSwap binds when loading a GS script.
function global_on_load()
    -- Default keybindings for all jobs
    send_command('bind f9 gs c cycle WeaponMode')
    -- ~F9 is defined in job files, Gun, Shield, etc.
    send_command('bind f10 gs c cycle MeleeMode')
    -- send_command('bind f11 gs c cycle CastingMode')
    send_command('bind f12 gs c update')
    send_command('bind %~b gs c toggle MagicBurst')
    send_command('bind %~m gs c cycle MagicMode')
    send_command('bind %~q gs c cycle QuickDrawMode')
    send_command('bind %~w gs c cycle WeaponLock')
    send_command('bind %~s gs c cycle SongMode')
end

-- Function to revert binds when unloading.
function global_on_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f12')

    send_command('unbind ~m')
    send_command('unbind ~q')
    send_command('unbind ~w')
    send_command('unbind ~b')
    send_command('unbind ~s')
end
