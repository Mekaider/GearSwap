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

sets.Moving = {right_ring="Shneddick Ring"}
