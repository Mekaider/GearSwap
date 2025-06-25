function job_setup()
    state.WeaponMode:options(
        'SavageBlade',
        'SeraphBlade',
        'BlackHalo',
        'Evisceration',
        'AeolianEdge',
        'Unlocked'
    )
    state.MeleeMode:options('Normal')
    state.MagicMode:options('Normal', 'MagicAcc')
    state.ExtraMagicModes:options('None', 'Immunobreak')
end

function get_sets()
    -- Load and initialize the include file.
    include('Mekaider-Include')
end

function init_gear_sets()
    -- Note: The sets defined here are not intended for use
    -- They are just to highlight relevant sets for the job
    -- and to simplify copy/paste into the appropriate job_gear.lua file


    -- sets.weapons['SavageBlade'] = {main="Naegling", sub="Machaera +2"}
    -- sets.weapons['Seraph Blade'] = {main={ name="Crocea Mors", augments={'Path: C',}}, sub="Daybreak"}
    -- sets.weapons['BlackHalo'] = {main="Maxentius", sub="Machaera +2"}
    -- sets.weapons['Evisceration'] = {main="Tauret", sub="Gleti's Knife"}
    -- sets.weapons['AeolianEdge'] = {main="Tauret", sub="Machaera +2"}

    sets.weapons.Shield = {}

    sets.idle = {}

    sets.engaged = {}

    -- High DW
    -- sets.engaged.DualWield = set_combine(sets.engaged, {})

    -- 11 DW
    -- sets.engaged.DualWield.LowDW = set_combine(sets.engaged, {})

    -- 21 DW
    -- sets.engaged.DualWield.MidDW = set_combine(sets.engaged, {})

    -- sets.WS = {}

    sets.WS['Savage Blade'] = {}

    sets.WS['Black Halo'] = sets.WS['Savage Blade']

    sets.WS['Seraph Blade'] = {}

    sets.WS['Aeolian Edge'] = sets.WS['Seraph Blade']

    sets.WS['Sanguine Blade'] = {}

    sets.JA = {}

    sets.precast.FastCast = {}

    sets.precast.FastCast.Dispelga = set_combine(sets.precast.FastCast, {main="Daybreak", sub="Ammurapi Shield"})

    sets.midcast.Cure = {}

    -- sets.midcast.NaSpell = {}
    -- sets.midcast.Cursna = {}

    sets.midcast['Enhancing Magic'] = {}

    sets.midcast['Enhancing Magic'].Skill = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast['Enhancing Magic'].Composure = sets.midcast['Enhancing Magic']
    sets.midcast['Enhancing Magic'].Composure.Others = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast.Refresh = {}

    -- sets.midcast.BarElement = {}

    -- General enfeebling set for magic accuracy where potency and duration are not important
    sets.midcast['Enfeebling Magic'] = {}

    sets.midcast['Enfeebling Magic'].Immunobreak = set_combine(sets.midcast['Enfeebling Magic'], {})

    -- Potency set
    sets.midcast['Enfeebling Magic'].Potency = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Enfeebling Magic'].Potency.Immunobreak = set_combine(sets.midcast['Enfeebling Magic'].Potency, {})

    sets.midcast['Enfeebling Magic'].Duration = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Enfeebling Magic'].Duration.MagicAcc = set_combine(sets.midcast['Enfeebling Magic'].Duration, {})

    sets.midcast['Enfeebling Magic'].Duration.Immunobreak = set_combine(sets.midcast['Enfeebling Magic'].Duration, {})

    sets.midcast['Elemental Magic'] = {}

    sets.midcast['Elemental Magic'].MagicAcc = set_combine(sets.midcast['Elemental Magic'], {})

    -- sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Dark Magic'] = {}

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.buff['Sublimation: Activated'] = {waist="Embla Sash"}
end

-- function job_precast(spell) end

-- function job_midcast(spell) end
