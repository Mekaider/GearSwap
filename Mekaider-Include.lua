include('Modes')

function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f12')

    send_command('unbind ~m')
    send_command('unbind ~q')
    send_command('unbind ~w')
    send_command('unbind ~b')
    send_command('unbind ~s')

    if job_file_unload then
        job_file_unload()
    end
end

local mage_jobs = S{'WHM', 'BLM', 'RDM', 'PLD', 'DRK', 'BRD', 'NIN', 'SMN', 'BLU', 'SCH', 'GEO', 'RUN'}
local ranged_jobs = S{'RNG', 'COR'}

town_zones = S{
    "Northern San d'Oria",
    "Southern San d'Oria",
    "Port San d'Oria",
    "Bastok Markets",
    "Bastok Mines",
    "Port Bastok",
    "Windurst Waters",
    "Windurst Woods",
    "Windurst Walls",
    "Port Windurst",
    "Ru'Lude Gardens",
    "Upper Jeuno",
    "Lower Jeuno",
    "Port Jeuno",
    "Selbina",
    "Mhaura",
    "Nashmau",
    "Aht Urhgan Whitegate",
    "Al Zahbi",
    "Norg",
    "Rabao",
    "Tavnazian Safehold",
    "Adoulin",
    "Western Adoulin",
    "Eastern Adoulin",
    "Celennia Memorial Library",
    "Kazham",
    "Mog Garden",
    "Heavens Tower",
    "Chateau d'Oraguille",
    "Metalworks",
    "The Colosseum",
    "Leafallia",
    "Chocobo Circuit",
    "Silver Knife",
    "Southern San d'Oria [S]",
    "Bastok Markets [S]",
    "Windurst Waters [S]"
}

blue_magic_emnity_spells = S{'Blank Gaze', 'Geist Wall', 'Jettatura', 'Soporific', 'Sheep Song'}
blue_magic_healing_spells = S{'Wild Carrot', 'Healing Breeze', 'Magic Fruit', 'Plenilune Embrace'}
blue_magic_elemental_spells = S{'Anvil Lightning', 'Entomb', 'Spectral Floe', 'Subduction', 'Evryone. Grudge', 'Tenebral Crush'} -- todo: Add all the elemental spells

na_spells = S{'Blindna', 'Cursna', 'Paralyna', 'Poisona', 'Silena', 'Stona', 'Viruna'}
bar_element_spells = S{'Barfire', 'Barblizzard', 'Baraero', 'Barstone', 'Barthunder', 'Barwater', 'Barfira', 'Barblizzara', 'Baraera', 'Barstonra', 'Barthundra', 'Barwatera'}
bar_status_spells = S{'Baramnesia', 'Barvirus', 'Barparalyze', 'Barsilence', 'Barpetrify', 'Barpoison', 'Barblind', 'Barsleep', 'Baramnesra', 'Barvira', 'Barparalyzra', 'Barsilencera', 'Barpetra', 'Barpoisonra', 'Barblindra', 'Barsleepra'}

enhancing_magic_skill_spells = S{"Enfire", "Enblizzard", "Enaero", "Enstone", "Enthunder", "Enwater",
    "Temper", "Temper II",
    'Boost-STR','Boost-DEX','Boost-VIT','Boost-AGI','Boost-INT','Boost-MND','Boost-CHR'}

enfeebling_magic_potency_spells = S{'Paralyze','Paralyze II','Slow','Slow II','Addle','Addle II','Distract','Distract II','Distract III','Frazzle III','Blind','Blind II'}
enfeebling_magic_duration_spells = S{'Sleep','Sleep II','Sleepga','Sleepga II','Diaga','Dia','Dia II','Dia III','Bio','Bio II','Bio III','Silence','Gravity','Gravity II','Inundation','Break','Breakaga','Bind','Bind II'}

elements = {}
elements.weak_to = {
    ['Light']     = 'Dark',
    ['Dark']      = 'Light',
    ['Fire']      = 'Ice',
    ['Ice']       = 'Wind',
    ['Wind']      = 'Earth',
    ['Earth']     = 'Lightning',
    ['Lightning'] = 'Water',
    ['Water']     = 'Fire'
}
elements.strong_to = {
    ['Light']     = 'Dark',
    ['Dark']      = 'Light',
    ['Fire']      = 'Water',
    ['Ice']       = 'Fire',
    ['Wind']      = 'Ice',
    ['Earth']     = 'Wind',
    ['Lightning'] = 'Earth',
    ['Water']     = 'Lightning'
}
elemental_weather_bonus_potency = { [0] = 0, [1] = 10, [2] = 25 }
elemental_weaponskills = S{'GustSlash', 'Cyclone', 'Energy Steal', 'Energy Drain', 'Aeolian Edge',
    'Burning Blade', 'Red Lotus Blade', 'Shining Blade', 'Seraph Blade', 'Sanguine Blade',
    'Frostbite', 'Freezebite', 'Herculean Slash',
    'Cloudsplitter', 'Primal Rend',
    'Dark Harvest', 'Shadow of Death', 'Infernal Scythe',
    'Thunder Thrust', 'Raiden Thrust',
    'Blade: Teki', 'Blade: To', 'Blade: Chi', 'Blade: Ei', 'Blade: Yu',
    'Tachi: Goten', 'Tachi: Kagero', 'Tachi: Jinpu', 'Tachi: Koki',
    'Shining Strike', 'Seraph Strike', 'Flash Nova',
    'Rock Crusher', 'Earth Crusher', 'Starburst', 'Sunburst', 'Cataclysm', 'Vidohunir', 'Garland of Bliss', 'Omniscience',
    'Flaming Arrow',
    'Hot Shot', 'Wildfire', 'Trueflight', 'Leaden Salute'
}

dummy_songs = S{"Shining Fantasia", "Puppet's Operetta", "Gold Capriccio"}

function init_include()

    state = {}

    -- Modes

    -- Internal modes used by the include, not intended for direct use by the user
    state.DebugMode = M(false, 'Enable debug logging for gear changes')
    state.Display = M(true, 'Enable display box')
    state.Moving = M(false, 'Player is moving')
    state.Stance = M { ['Description'] = 'Stance', 'Normal', 'OneHand', 'TwoHand', 'DualWield' }

    -- Weapon Modes
    state.WeaponMode = M { ['description'] = 'Weapon Mode' }
    state.ShieldMode = M { ['description'] = 'Shield Mode', 'off' } -- only used for Paladin so far
    state.WeaponLock = M(false)

    -- Melee Modes
    state.MeleeMode = M {['description'] = 'Melee Mode', 'Normal', 'DT', 'Acc'}

    -- WeaponSkill Modes
    state.WeaponSkillMode = M { ['description'] = 'WeaponSkill Mode', 'Normal', 'PDL' }

    state.CustomMeleeGroups = L{}
    state.CustomMagicGroups = L{}

    -- Magic Modes
    state.MagicMode = M { ['description'] = 'Magic Mode', 'Normal', 'M.Acc' }
    state.MagicBurst = M(false)
    state.ExtraMagicModes = M{['description'] = 'Extra Magic Modes', 'None'}

    state.SongMode = M{['description']='Song Mode', 'Potency', 'Dummy', 'MiracleCheer'}

    -- Other Modes
    state.RangedMode = M { ['description'] = 'Ranged Mode', 'Normal', 'PDL', 'Crit' }
    state.QuickDrawMode = M { ['description'] = 'Quick Draw Mode', 'Normal', 'Enhance', 'StoreTP' }

    state.DualWieldNeeded = 0
    state.Flurry = nil

    -- Default set definitions

    -- Weapon sets
    sets.weapons = {}
    sets.weapons.Shield = {}
    sets.weapons.Songs = {}
    -- sets.weapons.Gun = {}
    sets.instruments = {}
    sets.instruments.Potency = {}
    sets.instruments.ExtraSongs = {}
    sets.instruments.LullabyHarp = {}

    -- Idle sets
    sets.idle = {}
    sets.idle.Pet = {}

    -- Engaged sets
    sets.engaged = {}
    sets.engaged.DT = {}
    sets.engaged.Acc = {}
    sets.engaged.OneHand = {}
    sets.engaged.TwoHand = {}
    sets.engaged.DualWield = {}

    -- Resting set
    sets.resting = {}

    -- Precast sets
    sets.precast = {}
    sets.precast.FastCast = {}
    sets.precast.FastCast['Enhancing Magic'] = {}
    sets.precast.FastCast['BardSong'] = {}
    sets.precast.Cure = {}
    sets.precast.QuickMagic = {}
    sets.precast.Utsusemi = {}
    sets.precast.RA = {}
    sets.precast.RA.Flurry = {}
    sets.precast.RA.FlurryII = {}

    -- Midcast sets
    sets.midcast = {}
    sets.midcast.FastCast = sets.precast.FastCast
    sets.midcast.Songs = {}
    sets.midcast.Songs.Potency = {}
    sets.midcast.Songs.Enfeebling = {}
    sets.midcast.RA = {}

    -- Job ability sets
    sets.JA = {}

    -- Special job ability sets
    sets.PhantomRoll = {}

    sets.Waltz = {}
    sets.Jig = {}
    sets.Samba = {}
    sets.Step = {}
    sets.Flourish = {}

    -- Weaponskill sets
    sets.WS = {}

    sets.Obi = {}

    sets.buff = {}

    sets.naked = {
        main = empty,
        sub = empty,
        range = empty,
        ammo = empty,
        head = empty,
        neck = empty,
        ear1 = empty,
        ear2 = empty,
        body = empty,
        hands = empty,
        ring1 = empty,
        ring2 = empty,
        back = empty,
        waist = empty,
        legs = empty,
        feet = empty
    }

    -- Ammunition
    ammo = {}
    ammo.bullet = {}
    ammo.arrow = {}
    ammo.bolt = {}

    optional_include({'user-globals.lua'})

    load_sidecar(player.main_job)

    if job_setup then
        job_setup()
    end

    if user_setup then
        user_setup()
    end

    init_gear_sets()
end

init_include()

function precast(spell)
    update_magic_groups()
    -- table.vprint(state.CustomMagicGroups)

    equipSet = {}
    local message = ''

    if spell.action_type == 'Ranged Attack' then
        equipSet = sets.precast.RA
        message = 'sets.precast.RA'

        if state.Flurry == 1 then
            equipSet = sets.precast.RA.Flurry
            message = 'sets.precast.RA.Flurry'
        elseif state.Flurry == 2 then
            equipSet = sets.precast.RA.FlurryII
            message = 'sets.precast.RA.FlurryII'
        end

        if equipSet[state.RangedMode.value] then
            equipSet = equipSet[state.RangedMode.value]
            message = message .. ' (' .. state.RangedMode.value .. ')'
        end
    elseif spell.type == 'WeaponSkill' then
        equipSet = select_weaponskill_set(spell)
    elseif spell.type == 'JobAbility' then
        equipSet = sets.JA
        message = 'sets.JA'

        if equipSet[spell.english] then
            equipSet = equipSet[spell.english]
            message = 'sets.JA.' .. spell.english
        end
    elseif spell.type == 'CorsairRoll' then
        equipSet = sets.PhantomRoll
        message = 'sets.PhantomRoll'

        if equipSet[spell.english] then
            equipSet = equipSet[spell.english]
            message = message .. ' (' .. spell.english .. ')'
        end
    elseif spell.type == 'CorsairShot' then
        equipSet = sets.QuickDraw
        message = 'sets.QuickDraw'

        if equipSet[spell.english] then
            equipSet = equipSet[spell.english]
            message = message .. ' (' .. spell.english .. ')'
        end

        if equipSet[state.QuickDrawMode.value] then
            equipSet = equipSet[state.QuickDrawMode.value]
            message = message .. ' (' .. state.QuickDrawMode.value .. ')'
        end
    elseif spell.type == 'Waltz' then
        equipSet = sets.Waltz
        message = 'sets.Waltz'

        if equipSet[spell.english] then
            equipSet = equipSet[spell.english]
            message = message .. ' (' .. spell.english .. ')'
        end
    elseif spell.type == 'Samba' then
        equipSet = sets.Samba
        message = 'sets.Samba'
    elseif spell.type == 'Jig' then
        equipSet = sets.Jig
        message = 'sets.Jig'
    elseif spell.type == 'Step' then
        equipSet = sets.Step
        message = 'sets.Step'

        if equipSet[spell.english] then
            equipSet = equipSet[spell.english]
            message = message .. ' (' .. spell.english .. ')'
        end
    elseif spell.type == 'Flourish1' or spell.type == 'Flourish2' or spell.type == 'Flourish3' then
        equipSet = sets.Flourish
        message = 'sets.Flourish'

        if equipSet[spell.english] then
            equipSet = equipSet[spell.english]
            message = message .. ' (' .. spell.english .. ')'
        end
    elseif spell.action_type == 'Magic' then
        equipSet = sets.precast.FastCast
        message = 'sets.precast.FastCast'

        if equipSet[spell.english] then -- check for set for this specific spell
            equipSet = equipSet[spell.english]
            message = 'sets.precast.' .. spell.english
        elseif (spell.english:startswith('Cure') or spell.english:contains('Cura')) and equipSet.Cure then -- todo: Cure 1 hits the condition above, not sure how much I care
            equipSet = equipSet.Cure
            message = 'sets.precast.Cure'
        elseif spell.skill and equipSet[spell.skill] then -- check for set for this magic skill e.g. 'Healing Magic'
            equipSet = equipSet[spell.skill]
            message = 'sets.precast.' .. spell.skill
        elseif spell.type == 'BardSong' then
            if sets.precast.FastCast['BardSong'] then
                equipSet = sets.precast.FastCast['BardSong']
                message = 'sets.precast.FastCast.BardSong'
            end

            if spell.english == 'Honor March' then
                equipSet = set_combine(equipSet, {range="Marsyas"})
            end

            if spell.english == 'Aria of Passion' then
                equipSet = set_combine(equipSet, {range="Loughnashade"})
            end
        end
        -- elseif spell.type == 'Ninjutsu' then
        -- elseif spell.type == 'SummonerPact' then
    end

    if equipSet[state.MagicMode.value] then
        equipSet = equipSet[state.MagicMode.value]
        message = message .. ' (' .. state.MagicMode.value .. ')'
    end

    -- enforce WeaponMode, even over gear sets, if WeaponLock is true
    if state.WeaponLock.value then
        equipSet = set_combine(equipSet, sets.weapons[state.WeaponMode.value])
    end

    if job_precast then
        equipSet = set_combine(equipSet, job_precast(spell))
    end

    if message ~= '' then
        log(message)
    end
    equip(equipSet)
end

function midcast(spell)
    if spell.type == 'WeaponSkill' or spell.type == 'JobAbility' or spell.type == "CorsairRoll" or spell.type == 'Samba' or spell.type == 'Jig' or spell.type == 'Step' or spell.type == 'Flourish1' or spell.type == 'Flourish2' or spell.type == 'Flourish3' then return end

    equipSet = sets.midcast
    local message = 'sets.midcast'

    if spell.action_type == 'Ranged Attack' then
        equipSet = sets.midcast.RA
        message = 'sets.midcast.RA'
        -- all the logic between here and equip() doesn't need to run for RA - maybe I should break this out into funcs
    end

    if equipSet[spell.english] then -- check for set for this specific spell
        equipSet = equipSet[spell.english]
        message = message .. '.' .. spell.english
    end

    if (spell.english:startswith('Cure') or spell.english:contains('Cura')) and equipSet.Cure then
        equipSet = equipSet.Cure
        message = 'sets.midcast.Cure'
    elseif spell.english:contains('Protect') and equipSet.Protect then
        equipSet = equipSet.Protect
        message = 'sets.midcast.Protect'
    elseif na_spells:contains(spell.english) and equipSet.NaSpell then
        equipSet = equipSet.NaSpell
        message = 'sets.midcast.NaSpell'
    elseif spell.english:startswith('Boost-') and equipSet.BoostStat then
        equipSet = equipSet.BoostStat
        message = 'sets.midcast.BoostStat'
    elseif bar_element_spells:contains(spell.english) and equipSet.BarElement then
        equipSet = equipSet.BarElement
        message = 'sets.midcast.BarElement'
    elseif bar_status_spells:contains(spell.english) and equipSet.BarStatus then
        equipSet = equipSet.BarStatus
        message = 'sets.midcast.BarStatus'
    elseif spell.english:contains('Regen') and equipSet.Regen then
        equipSet = equipSet.Regen
        message = 'sets.midcast.Regen'
    elseif spell.english:contains('Refresh') and equipSet.Refresh then
        equipSet = equipSet.Refresh
        message = 'sets.midcast.Refresh'
    elseif spell.type == 'Geomancy' then
        equipSet = equipSet.Geomancy
        message = 'sets.midcast.Geomancy'

        if spell.english:startswith('Indi') and equipSet.Indi then
            equipSet = equipSet.Indi
            message = 'sets.midcast.Geomancy.Indi'
        end
    elseif spell.type == 'BardSong' then
        if set.contains(spell.targets, 'Enemy') then
            equipSet = set_combine(sets.weapons.Songs, sets.instruments.Potency, sets.midcast.Songs.Enfeebling)
            message = 'sets.midcast.Songs.Enfeebling'

            if equipSet[spell.english] then
                equipSet = equipSet[spell.english]
                message = message .. '.' .. spell.english
            elseif spell.english:contains('Lullaby') and sets.midcast.Lullaby then
                equipSet = set_combine(equipSet, sets.midcast.Lullaby)
                message = message .. ' (Lullaby)'
            elseif spell.english:contains('Threnody') and sets.midcast.Threnody then
                equipSet = set_combine(equipSet, sets.midcast.Threnody)
                message = message .. ' (Threnody)'
            end

            if spell.english:contains('Horde') then
                equipSet = set_combine(equipSet, sets.instruments.LullabyHarp)
                message = message .. ' (Horde Lullaby)'
            end
        else
            equipSet = set_combine(sets.weapons.Songs, sets.instruments.Potency, sets.midcast.Songs.Potency)
            message = 'sets.midcast.Songs.Potency'

            if equipSet[spell.english] then
                equipSet = equipSet[spell.english]
                message = message .. '.' .. spell.english
            elseif spell.english:contains('Carol') and sets.midcast.Carol then
                equipSet = set_combine(equipSet, sets.midcast.Carol)
                message = message .. '.Carol'
            elseif spell.english:contains('Etude') and sets.midcast.Etude then
                equipSet = set_combine(equipSet, sets.midcast.Etude)
                message = message .. '.Etude'
            elseif spell.english:contains('Madrigal') and sets.midcast.Madrigal then
                equipSet = set_combine(equipSet, sets.midcast.Madrigal)
                message = message .. '.Madrigal'
            elseif spell.english:contains('Mambo') and sets.midcast.Mambo then
                equipSet = set_combine(equipSet, sets.midcast.Mambo)
                message = message .. '.Mambo'
            elseif spell.english:contains('March') and sets.midcast.March then
                equipSet = set_combine(equipSet, sets.midcast.March)
                message = message .. '.March'
            elseif spell.english:contains('Minne') and sets.midcast.Minne then
                equipSet = set_combine(equipSet, sets.midcast.Minne)
                message = message .. '.Minne'
            elseif spell.english:contains('Minuet') and sets.midcast.Minuet then
                equipSet = set_combine(equipSet, sets.midcast.Minuet)
                message = message .. '.Minuet'
            elseif spell.english:contains('Paeon') and sets.midcast.Paeon then
                equipSet = set_combine(equipSet, sets.midcast.Paeon)
                message = message .. '.Paeon'
            elseif spell.english:contains('Prelude') and sets.midcast.Prelude then
                equipSet = set_combine(equipSet, sets.midcast.Prelude)
                message = message .. '.Prelude'
            end

            if spell.english == 'Honor March' then
                equipSet = set_combine(equipSet, {range="Marsyas"})
            end

            if spell.english == 'Aria of Passion' then
                equipSet = set_combine(equipSet, {range="Loughnashade"})
            end

            if dummy_songs:contains(spell.english) or state.SongMode.value == 'Dummy' then
                -- ignore potency midcast set and just use fast cast set for reduced duration
                -- todo: probably add an ExtraSongs set to bring in at least some potency
                equipSet = sets.instruments.ExtraSongs
                message = 'dummy songs set'
            end

            if state.SongMode.value == 'MiracleCheer' then
                equipSet = set_combine(equipSet, sets.instruments.MiracleCheer)
                message = message .. ' (Miracle Cheer)'
            end
        end
    elseif spell.skill and equipSet[spell.skill] then -- check for set for this magic skill e.g. 'Healing Magic'
        equipSet = equipSet[spell.skill]
        message = 'sets.midcast.' .. spell.skill
    end

    if spell.skill == 'Enhancing Magic' and enhancing_magic_skill_spells:contains(spell.english) and equipSet.Skill then
        equipSet = equipSet.Skill
        message = 'sets.midcast.' .. spell.skill .. '.Skill'
    end

    if spell.skill == 'Enfeebling Magic' and enfeebling_magic_potency_spells:contains(spell.english) and equipSet.Potency then
        equipSet = equipSet.Potency
        message = 'sets.midcast.' .. spell.skill .. '.Potency'
    end

    if spell.skill == 'Enfeebling Magic' and enfeebling_magic_duration_spells:contains(spell.english) and equipSet.Duration then
        equipSet = equipSet.Duration
        message = 'sets.midcast.' .. spell.skill .. '.Duration'
    end

    if equipSet[state.MagicMode.value] then
        equipSet = equipSet[state.MagicMode.value]
        message = message .. '.' .. state.MagicMode.value
    end

    if equipSet[state.ExtraMagicModes.value] then
        equipSet = equipSet[state.ExtraMagicModes.value]
        message = message .. '.' .. state.ExtraMagicModes.value
    end

    for _, group in ipairs(state.CustomMagicGroups) do
        if equipSet[group] then
            equipSet = equipSet[group]
            message = message .. '.' .. group
        end
    end

    if equipSet.Self and spell.target.type == 'SELF' then
        equipSet = equipSet.Self
        message = message .. '.Self'
    end

    if equipSet.Others and (spell.target.type == 'PLAYER' or spell.target.type == 'NPC') then
        equipSet = equipSet.Others
        message = message .. '.Others'
    end

    -- enforce WeaponMode, even over gear sets, if WeaponLock is true
    if state.WeaponLock.value and not buffactive['Troubadour'] then
        equipSet = set_combine(equipSet, sets.weapons[state.WeaponMode.value])
    end

    log(message)
    if message == 'sets.midcast' and spell.skill then
        log('Spell: ' .. spell.english .. '  Skill: ' .. spell.skill)
    end

    equipSet = elemental_magic_check(spell, equipSet)

    if job_midcast then
        equipSet = set_combine(equipSet, job_midcast(spell))
    end
    equip(equipSet)
end

function aftercast(spell)
    if player.main_job == 'SMN' and pet_midaction() then
        return
    else
        equip(select_set())
    end
end

function status_change(new, old)
    equip(select_set())
end

function select_idle_set()
    equipSet = {}
    equipSet = sets.idle
    message = 'sets.idle'

    local weapon_set = state.WeaponMode.value ~= 'Unlocked' and sets.weapons[state.WeaponMode.value] or {}

    if pet.isvalid and equipSet.Pet then
        equipSet = equipSet.Pet
        message = 'sets.idle (pet)'
    end

    if equipSet[state.MeleeMode.value] then
        equipSet = equipSet[state.MeleeMode.value]
        message = 'sets.idle.' .. state.MeleeMode.value
    end

    -- Check if we're in a city zone and combine with movement speed set
    if town_zones:contains(world.zone) then
        equipSet = set_combine(equipSet, sets.Moving)
        message = message .. ' (town movement)'
    elseif state.Moving.value == true then
        equipSet = set_combine(equipSet, sets.Moving)
        message = 'sets.Moving'
    end

    if buffactive['Sublimation: Activated'] and sets.buff['Sublimation: Activated'] then
        equipSet = set_combine(equipSet, sets.buff['Sublimation: Activated'])
    end

    if state.WeaponMode.value ~= 'Unlocked' then
        equipSet = set_combine(equipSet, sets.weapons[state.WeaponMode.value])
        check_stance(equipSet)

        -- PLD specific handling for multiple shield options
        if state.ShieldMode.value ~= 'off' then
            equip({ sub = state.ShieldMode.value })
        end

        -- equip a default shield if defined and not DualWield or TwoHand
        if sets.weapons.Shield and state.Stance.value ~= 'DualWield' and state.Stance.value ~= 'TwoHand' then
            equipSet = set_combine(equipSet, sets.weapons.Shield)
        end
        -- add_to_chat(123, state.Stance.value)
    end

    log(message)
    gs_display_update()
    return equipSet
end

function select_melee_set()
    equipSet = {}
    equipSet = sets.engaged
    message = 'sets.engaged'

    -- Check stance first based on intended weapons or current equipment
    local weapon_set = state.WeaponMode.value ~= 'Unlocked' and sets.weapons[state.WeaponMode.value] or {}
    check_stance(weapon_set)

    update_melee_groups()

    -- check if OneHand, TwoHand, or DualWield and if there is a set defined, use it
    if state.Stance.value ~= "Normal" and equipSet[state.Stance.value] then
        equipSet = equipSet[state.Stance.value]
        message = message .. '.' .. state.Stance.value
    end

    -- After we've chosen the engaged set, check if there is a sub set for the specific Melee Mode
    if equipSet[state.MeleeMode.value] then
        equipSet = equipSet[state.MeleeMode.value]
        message = 'sets.engaged.' .. state.MeleeMode.value
    end

    -- Check if there is a sub set for the specific Weapon Mode
    if equipSet[state.WeaponMode.value] then
        equipSet = equipSet[state.WeaponMode.value]
        message = message .. '.' .. state.WeaponMode.value
    end

    -- Finally, check for any custom melee groups (e.g. Impetus, Mighty Strikes, etc.)
    for _, group in ipairs(state.CustomMeleeGroups) do
        if equipSet[group] then
            equipSet = equipSet[group]
            message = message .. '.' .. group
        end
    end

    if state.WeaponMode.value ~= 'Unlocked' then
        equipSet = set_combine(equipSet, sets.weapons[state.WeaponMode.value])

        -- PLD specific handling for multiple shield options
        if state.ShieldMode.value ~= 'off' then
            equipSet = set_combine(equipSet, { sub = state.ShieldMode.value })
        end

        -- equip a default shield if defined and not DualWield or TwoHand
        if sets.weapons.Shield and state.Stance.value ~= 'DualWield' and state.Stance.value ~= 'TwoHand' then
            equipSet = set_combine(equipSet, sets.weapons.Shield)
        end
        -- todo: probably something about default shield, e.g. COR, RNG
    end

    log(message)
    gs_display_update()
    return equipSet
end

function select_weaponskill_set(spell)
    update_melee_groups()

    equipSet = {}
    equipSet = sets.WS
    local message = 'sets.WS'

    if equipSet[spell.english] then
        equipSet = equipSet[spell.english]
        message = 'sets.WS.' .. spell.english
    end

    if equipSet[state.WeaponMode.value] then
        equipSet = equipSet[state.WeaponMode.value]
        message = message .. ' (' .. state.WeaponMode.value .. ')'
    end

    if spell.skill == "Marksmanship" or spell.skill == "Archery" then
        if equipSet[state.RangedMode.value] then
            equipSet = equipSet[state.RangedMode.value]
            message = message .. ' (' .. state.RangedMode.value .. ')'
        end
    elseif equipSet[state.WeaponSkillMode.value] then
        equipSet = equipSet[state.WeaponSkillMode.value]
        message = message .. ' (' .. state.WeaponSkillMode.value .. ')'
    end

    -- Finally, check for any custom melee groups (e.g. sets.WS['Victory Smite'].Impetus)
    for _, group in ipairs(state.CustomMeleeGroups) do
        if equipSet[group] then
            equipSet = equipSet[group]
            message = message .. ' (' .. group .. ')'
        end
    end

    equipSet = elemental_ws_check(spell, equipSet)

    log(message)
    return equipSet
end

function select_set()
    equipSet = {}

    if player.status == 'Idle' and player.hp > 0 then
        equipSet = select_idle_set()
    elseif player.status == 'Engaged' then
        equipSet = select_melee_set()
    elseif player.status == 'Resting' then
        equipSet = set_combine(select_idle_set(), sets.resting)
    end

    return equipSet
end

function self_command(cmd)
    local commandArgs = cmd
    log('self command: ' .. commandArgs)

    if #commandArgs:split(' ') > 1 then
        commandArgs = T(commandArgs:split(' '))

        if commandArgs[1] == 'cycle' then
            handle_cycle(commandArgs)
        elseif commandArgs[1] == 'set' then
            handle_set(commandArgs)
        elseif commandArgs[1] == 'hasteinfo' then
            state.DualWieldNeeded = tonumber(commandArgs[2])
            if not midaction() then
                equip(select_set())
            end
        end
    elseif commandArgs == 'update' then
        equip(select_set())
    elseif commandArgs == 'debug' then
        state.DebugMode:toggle()
    elseif commandArgs == 'display' then
        state.Display:toggle()
        if state.Display.value then
            gs_display:show()
        else
            gs_display:hide()
        end
    end

    gs_display_update()
end

function handle_cycle(commandArgs)
    local state_var = get_state(commandArgs[2])

    if state_var then
        local old_value = state_var.current
        state_var:cycle()
        local new_value = state_var.current
        state_change(commandArgs[2], new_value, old_value)
    else
        add_to_chat(123, 'self_command: Set: Unknown field [' .. commandArgs[2] .. ']')
    end
end

function handle_set(commandArgs)
    local state_var = get_state(commandArgs[2])

    if state_var then
        local old_value = state_var.current
        state_var:set(commandArgs[3])
        local new_value = state_var.current
        state_change(commandArgs[2], new_value, old_value)
    else
        add_to_chat(123, 'self_command: Set: Unknown field [' .. commandArgs[2] .. ']')
    end
end

function log(msg)
    if state.DebugMode.value then
        if msg == nil then
            windower.add_to_chat(80, '-- Value is Nil --')
        elseif type(msg) == "table" then
            for index, value in pairs(msg) do
                windower.add_to_chat(80, '-- ' .. tostring(value) .. ' --')
            end
        elseif type(msg) == "number" then
            windower.add_to_chat(80, '-- ' .. tostring(msg) .. ' --')
        elseif type(msg) == "string" then
            windower.add_to_chat(80, '-- ' .. msg .. ' --')
        elseif type(msg) == "boolean" then
            windower.add_to_chat(80, '-- ' .. tostring(msg) .. ' --')
        else
            windower.add_to_chat(80, '-- Unknown Debug Message --')
        end
    end
end

function gs_display_update()
    display_data = {}

    melee_mode_value = state.MeleeMode.value

    if player.status == 'Engaged' and state.Stance.value ~= "Normal" and sets.engaged[state.Stance.value] then
        melee_mode_value = state.MeleeMode.value .. ' (' .. state.Stance.value .. ')'
    end

    -- if sets.engaged[state.WeaponMode.value] then
    --     melee_mode_value = state.MeleeMode.value..' ('..state.WeaponMode.value..')'

    --     if sets.engaged[state.WeaponMode.value][state.MeleeMode.value] then
    --         melee_mode_value = state.MeleeMode.value..' ('..state.WeaponMode.value..')'
    --     end
    -- end

    if state.WeaponLock.value then
        display_data[#display_data + 1] = { description = 'Weapon(L)', value = state.WeaponMode.value }
    else
        display_data[#display_data + 1] = { description = 'Weapon', value = state.WeaponMode.value }
    end

    if player.main_job == 'PLD' then
        display_data[#display_data + 1] = { description = 'Shield', value = state.ShieldMode.value }
    end

    display_data[#display_data + 1] = { description = 'Mode', value = melee_mode_value }

    if state.WeaponSkillMode.value ~= 'Normal' then
        display_data[#display_data + 1] = { description = 'WeaponSkillMode', value = state.WeaponSkillMode.value }
    end

    if ranged_jobs:contains(player.main_job) then
        display_data[#display_data + 1] = { description = 'RangedMode', value = state.RangedMode.value }
    end

    if mage_jobs:contains(player.main_job) then
        if state.MagicMode.value ~= 'Normal' then
            display_data[#display_data + 1] = { description = 'MagicMode', value = state.MagicMode.value }
        end

        if state.ExtraMagicModes.value ~= 'None' then
            display_data[#display_data + 1] = { description = 'ExtraMagicModes', value = state.ExtraMagicModes.value }
        end
    end

    if player.main_job == 'COR' then
        display_data[#display_data + 1] = { description = 'QuickDraw', value = state.QuickDrawMode.value }
    end

    if player.main_job == 'BRD' then
        display_data[#display_data + 1] = { description = 'SongMode', value = state.SongMode.value }
    end

    lines = T {}
    for k, v in next, display_data do
        lines:insert(v.description .. ': ' .. string.format('%s', tostring(v.value)) .. '    ')
    end
    gs_display:clear()
    gs_display:append(lines:concat('    '))
end

if gs_display then gs_display:destroy() end
gs_display = {}
gs_display = texts.new()
gs_display:pos(14, 1420)
gs_display:font('Arial')
gs_display:size(12)
gs_display:stroke_width(2)
gs_display:stroke_alpha(192)
gs_display:stroke_color(0, 0, 0)
gs_display:bg_visible(false)
gs_display:bg_color(0, 0, 0)
gs_display:bg_alpha(50)

if state.Display.value then
    gs_display:show()
end

-- hides display during zone change
windower.raw_register_event('incoming chunk', function(id)
    -- 0x0B is the packet ID for zone initiation
    if id == 0x0B then
        if gs_display then
            gs_display:hide()
        end
    elseif id == 0x0A then
        if gs_display then
            gs_display:show()
        end
    end
end)

-- hides display during cutscene
windower.raw_register_event('status change', function(new_status_id)
    -- Status ID 4 is in a cutscene
    if new_status_id == 4 then
        if gs_display then
            gs_display:hide()
        end
    else
        if state.Display.value and gs_display then
            gs_display:show()
        end
    end
end)

-- This displays the display on load, but waits just a moment to avoid default state values being shown
coroutine.schedule(gs_display_update, 0.1)

-- Locals for movement detection
local movement_threshold = 0.1 -- How far player must move to count as "moving"
local check_frequency = 15     -- How often to check position (in frames)

-- Initialize movement tracking
mov = { counter = 0 }
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end

windower.raw_register_event('prerender', function()
    -- Increment counter each frame
    mov.counter = mov.counter + 1

    -- Only check position every check_frequency frames
    if mov.counter > check_frequency then
        local pl = windower.ffxi.get_mob_by_index(player.index)

        -- Make sure we have both current and previous positions
        if pl and pl.x and mov.x then
            -- Calculate 3D distance moved since last check
            local distance = math.sqrt(
                (pl.x - mov.x) ^ 2 +
                (pl.y - mov.y) ^ 2 +
                (pl.z - mov.z) ^ 2
            )

            -- Determine if player is moving based on distance threshold
            local is_moving = distance > movement_threshold

            -- Only update state if movement status has changed
            if is_moving ~= state.Moving.value then
                state.Moving:set(is_moving)
                -- Update gear if needed
                if player.status ~= 'Engaged' and not midaction() then
                    send_command('gs c update')
                end
            end
        end

        -- Store current position for next check
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end

        -- Reset counter
        mov.counter = 0
    end
end)

-- Get the state var that matches the requested name. Only returns mode vars.
function get_state(name)
    if state[name] then
        return state[name]._class == 'mode' and state[name] or nil
    else
        local l_name = name:lower()
        for key, var in pairs(state) do
            if key:lower() == l_name then
                return var._class == 'mode' and var or nil
            end
        end
    end
end

-- This function can be extended by defining and calling state_change_custom, if you need to do anything when state vars change
-- see Mekaider/WAR.lua for an example
function state_change(state, new_state_value, old_state_value)
    log('state change: ' .. state .. ': ' .. new_state_value)
    equip(select_set())

    if state_change_custom then
        state_change_custom(state, new_state_value, old_state_value)
    end

    gs_display_update()
end

function update_melee_groups()
    state.CustomMeleeGroups:clear()

    if buffactive['Mighty Strikes'] then
        state.CustomMeleeGroups:append('Mighty Strikes')
    end

    if buffactive['Impetus'] then
        state.CustomMeleeGroups:append('Impetus')
    end

    if buffactive['Footwork'] then
        state.CustomMeleeGroups:append('Footwork')
    end

    -- not too sure where to put the boundaries for DW sets, but 11 and 21 (/NIN and /DNC) seem the most important for now

    -- /DNC with capped magic haste and haste samba from dnc main OR /NIN with capped magic haste and any haste samba
    if state.DualWieldNeeded == 0 then
        state.CustomMeleeGroups:append('NoDW')

    -- /DNC with capped magic haste and haste samba that isn't dnc main
    elseif state.DualWieldNeeded > 0 and state.DualWieldNeeded <= 9 then
        state.CustomMeleeGroups:append('MinDW')

    -- /NIN with capped magic haste
    elseif state.DualWieldNeeded > 9 and state.DualWieldNeeded <= 11 then
        state.CustomMeleeGroups:append('LowDW')

    -- /DNC with capped magic haste
    elseif state.DualWieldNeeded > 11 and state.DualWieldNeeded <= 21 then
        state.CustomMeleeGroups:append('MidDW')
    elseif state.DualWieldNeeded > 21 and state.DualWieldNeeded <= 31 then
        state.CustomMeleeGroups:append('HighDW')
    elseif state.DualWieldNeeded > 31 and state.DualWieldNeeded <= 42 then
        state.CustomMeleeGroups:append('SuperDW')
    elseif state.DualWieldNeeded > 42 then
        state.CustomMeleeGroups:append('MaxDW')
    end
end

function update_magic_groups()
    state.CustomMagicGroups:clear()

    if state.ExtraMagicModes.value ~= 'None' then
        state.CustomMagicGroups:append(state.ExtraMagicModes.value)
    end

    if buffactive['Afflatus Solace'] then
        state.CustomMagicGroups:append('Afflatus Solace')
    end

    if buffactive['Composure'] then
        state.CustomMagicGroups:append('Composure')
    end
end

function elemental_ws_check(spell, equipSet)
    if spell.type == 'WeaponSkill' and elemental_weaponskills:contains(spell.name) then
        local distance = spell.target.distance - spell.target.model_size
        local orpheus_intensity = 0
        local hachirin_intensity = 0

        orpheus_intensity = (16 - (distance <= 1 and 1 or distance >= 15 and 15 or distance))

        -- log('spell: '..spell.english..' element: '..spell.element..' weather: '..world.weather_element..' day: '..world.day_element)

        if spell.element == world.weather_element then
            hachirin_intensity = hachirin_intensity + elemental_weather_bonus_potency[world.weather_intensity]
        elseif spell.element == elements.weak_to[world.weather_element] then
            hachirin_intensity = hachirin_intensity - elemental_weather_bonus_potency[world.weather_intensity]
        end
        if spell.element == world.day_element then
            hachirin_intensity = hachirin_intensity + 10
        elseif spell.element == elements.weak_to[world.day_element] then
            hachirin_intensity = hachirin_intensity - 10
        end

        if hachirin_intensity > orpheus_intensity and hachirin_intensity >= 5 then
            equipSet = set_combine(equipSet, { waist = "Hachirin-no-Obi" })
            log('using hachirin')
        elseif orpheus_intensity >= 5 then
            equipSet = set_combine(equipSet, { waist = "Orpheus's Sash" })
            log('using orpheus')
        end
    end

    return equipSet
end

function elemental_magic_check(spell, equipSet)
    if spell.element == 'None' then
        return equipSet
    end

    local distance = spell.target.distance - spell.target.model_size
    local orpheus_intensity = 0
    local hachirin_intensity = 0

    orpheus_intensity = (16 - (distance <= 1 and 1 or distance >= 15 and 15 or distance))

    -- log('spell: '..spell.english..' element: '..spell.element..' weather: '..world.weather_element..' day: '..world.day_element)

    if spell.english:contains('helix') then
        if orpheus_intensity >= 5 then
            equipSet = set_combine(equipSet, { waist = "Orpheus's Sash" })
            return equipSet
        end
    end

    -- todo: refactor, cure should probably have an indepedent weather check for Twilight cape and such
    if spell.english:startswith('Cure') or spell.english:contains('Cura') then
        if (spell.element == world.day_element or spell.element == world.weather_element) and sets.Obi then
            equipSet = set_combine(equipSet, sets.Obi)
            return equipSet
        end
    end

    if spell.skill == 'Elemental Magic' or spell.type == 'BlueMagic' then
        if spell.element == world.weather_element then
            hachirin_intensity = hachirin_intensity + elemental_weather_bonus_potency[world.weather_intensity]
        elseif spell.element == elements.weak_to[world.weather_element] then
            hachirin_intensity = hachirin_intensity - elemental_weather_bonus_potency[world.weather_intensity]
        end
        if spell.element == world.day_element then
            hachirin_intensity = hachirin_intensity + 10
        elseif spell.element == elements.weak_to[world.day_element] then
            hachirin_intensity = hachirin_intensity - 10
        end

        if hachirin_intensity > orpheus_intensity and hachirin_intensity >= 5 then
            equipSet = set_combine(equipSet, { waist = "Hachirin-no-Obi" })
            log('using hachirin')
        elseif orpheus_intensity >= 5 then
            equipSet = set_combine(equipSet, { waist = "Orpheus's Sash" })
            log('using orpheus')
        end
    end

    return equipSet
end

function buff_change(name, gain, buff_details)
    log('buff change: ' .. name .. ' ' .. tostring(gain))

    if sets.buff[name] then
        log('buff set found: ' .. name)
        if gain then
            equip(sets.buff[name])
        else
            send_command('gs c update')
        end
    end

    -- todo: move this to a buff_change_custom function in WHM.lua
    if name == 'Sleep' then
        if gain then
            disable('main', 'sub')
            send_command('cancel stoneskin')
        else
            enable('main', 'sub')
        end
    end

    if name == 'Flurry' then
        if not gain then
            state.Flurry = nil
        end
    end

    if buff_change_custom then
        buff_change_custom(name, gain, buff_details)
    end
end

-- todo list
-- town set
-- full precast and midcast for all types of spells
-- magic
-- Non-standard JAs, Phantom Roll, Dancer JAs, etc.
-- magic burst


--[[
weapon mode logic

WeaponMode sets will be used like:

    precast and midcast:
        any weapons defined in sets will be used, _unless_ state.WeaponLock is true,
        in which case the active weapons will be used instead (essentially preventing weapon changes)

    aftercast (engaged and idle):
        the current weaponset will be used; any weapons defined in sets will be ignored

    Special WeaponMode: 'Unlocked'
        When WeaponMode is set to Unlocked, the include will not change weapons, but weapons defined in sets will work as expected

    -- enforce WeaponMode, even over gear sets, if WeaponLock is true
    if state.WeaponLock.value then
        equipSet = set_combine(equipSet, sets.weapons[state.WeaponMode.value])
    end

--]]

-- a little bit of Rubenator black magic
local gear_data_lookup = {}
gearswap.res.items:map(function(data)
    if data.slots and not data.slots:empty() then
        gear_data_lookup[data.en:lower()] = data
        gear_data_lookup[data.enl:lower()] = data
    end
end)
gear_data_lookup = setmetatable(gear_data_lookup, {
    __index = function(t, k)
        return rawget(t, k:lower())
    end,
})
function get_future_equipment_data(slot)
    slot = gearswap.get_default_slot(slot)
    if not slot then return end
    local data = gearswap.equip_list[slot]
    if not data then
        data = get_equipped_item_data(slot)
    elseif type(data) == 'table' and data.name then
        data = gear_data_lookup[data.name]
    else
        data = gear_data_lookup[data]
    end
    return data or 'empty'
end

-- Stance check functions
-- https://github.com/Windower/Resources/blob/master/resources_data/skills.lua
function get_equipped_item_data(slot)
    local item = gearswap.items
    [gearswap.to_windower_bag_api(gearswap.res.bags[gearswap.items.equipment[slot].bag_id].en)]
    [gearswap.items.equipment[slot].slot]
    return player.equipment[slot] ~= empty and item and item.id and gearswap.res.items[item.id] or "empty"
end

function check_stance(set)
    state.Stance:reset()

    local current_abilities = windower.ffxi.get_abilities()

    local main_name = type(set.main) == 'string' and set.main or type(set.main) == 'table' and set.main.name or nil
    local sub_name = type(set.sub) == 'string' and set.sub or type(set.sub) == 'table' and set.sub.name or nil

    local main = main_name and gear_data_lookup[main_name] or get_equipped_item_data('main')
    local sub = sub_name and gear_data_lookup[sub_name] or get_equipped_item_data('sub')

    if main ~= 'empty' and not S { 1, 4, 6, 7, 8, 10, 12 }:contains(main.skill) and (sub == 'empty' or not sub.skill) then
        state.Stance:set('OneHand')
    elseif main ~= 'empty' and S { 4, 6, 7, 8, 10, 12 }:contains(main.skill) then
        state.Stance:set('TwoHand')
    elseif sub ~= 'empty' and sub.skill and not S { 0, 30 }:contains(sub.skill) and table.contains(current_abilities.job_traits, 18) then
        state.Stance:set('DualWield')
    end
    log('stance: ' .. state.Stance.value)
end

function sub_job_change(new, old)
    if sub_job_change_custom then
        sub_job_change_custom()
    end
end

-- Update Flurry state based on action
windower.raw_register_event('action',
    function(act)
        if ranged_jobs:contains(player.main_job) then
            --check if you are a target of spell
            local actionTargets = act.targets
            playerId = windower.ffxi.get_player().id
            isTarget = false
            for _, target in ipairs(actionTargets) do
                if playerId == target.id then
                    isTarget = true
                end
            end
            if isTarget == true then
                if act.category == 4 then
                    local param = act.param
                    if param == 845 and flurry ~= 2 then
                        state.Flurry = 1
                    elseif param == 846 then
                        state.Flurry = 2
                    end
                end
            end
        end
    end)


-- Optional version of include().  If file does not exist, does not attempt to load, and does not throw an error.
-- filenames takes an array of possible file names to include and checks each one.
function optional_include(filenames)
    for _,v in pairs(filenames) do
        local path = gearswap.pathsearch({v})
        if path then
            log(tostring(path))
            include(v)
            return true
        end
    end
end

-- -- Attempt to load user gear files in place of default gear sets.
-- -- Return true if one exists and was loaded.
function load_sidecar(job)
    if not job then return false end

    -- filename format example for user-local files: whm_gear.lua, or playername_whm_gear.lua
    local filenames = {player.name..'_'..job..'_gear.lua', job..'_gear.lua',
        'gear/'..player.name..'_'..job..'_gear.lua', 'gear/'..job..'_gear.lua',
        'gear/'..player.name..'_'..job..'.lua', 'gear/'..job..'.lua'}
    return optional_include(filenames)
end

-- -- Attempt to include user-globals.  Return true if it exists and was loaded.
function load_user_globals()
    local filenames = {player.name..'-globals.lua', 'user-globals.lua'}
    return optional_include(filenames)
end

-- -- Load a sidecar file for the job (if it exists) that may re-define init_gear_sets and file_unload.
load_sidecar(player.main_job)
init_gear_sets()

coroutine.schedule(function()
    send_command('hasteinfo report')
end, 3)
