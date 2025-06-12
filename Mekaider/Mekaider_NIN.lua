-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
    -- res = require 'resources'
end

-- Setup vars that are user-independent.
function job_setup()
    no_swap_gear = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)",
              "Trizek Ring", "Echad Ring", "Facility Ring", "Capacity Ring"}

    state.OffenseMode:options('Normal', 'Acc', 'PDL')
    state.WeaponskillMode:options('Normal', 'Acc', 'PDL')
    state.HybridMode:options('Normal', 'DT')
    state.WeaponSet = M{['description']='Weapon', 'Naegling', 'Dagger', 'Sword', 'Club', 'Katana', 'GreatKatana', 'Polearm', 'Scythe', 'Staff', 'GreatSword'}
end

function user_setup()
    lockstyleset = 7
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    sets.Naegling = {main="Naegling", sub="Gleti's Knife"}
    sets.Dagger = {main="Qutrub Knife", sub="Extinction"}
    sets.Sword = {main="Nihility", sub="Extinction"}
    sets.Club = {main="Chocobo Wand", sub="Extinction"}
    sets.Katana = {main="Yagyu Shortblade", sub="Extinction"}
    sets.GreatKatana = {main="Zanmato"}
    sets.Polearm = {main="Sha Wujing's Lance"}
    sets.Scythe = {main="Lost Sickle"}
    sets.Staff = {main="Cobra Staff"}
    sets.GreatSword = {main="Lament"}
    

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.FC = {}

    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.WS = {}

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    sets.precast.WS['Savage Blade'] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Asperity Necklace",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Epaminondas's Ring",
        right_ring="Regal Ring",
        back="Relucent Cape",
    }

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Purity Ring",
        back="Null Shawl",
    }

    sets.Moving = {right_ring="Shneddick Ring"}

    sets.idle.Town = set_combine(sets.idle, sets.Moving)

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Defense Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    
    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','VIT+5',}},
        neck="Iskur Gorget",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Dedition Earring",
        right_ear="Cessance Earring",
        left_ring="Gere Ring",
        right_ring="Epona's Ring",
        back="Null Shawl",
    }

    sets.engaged.Acc = set_combine(sets.engaged, {})

    sets.engaged.PDL = {}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged.Hybrid = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
    }

    sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
    sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.Hybrid)
    sets.engaged.PDL.DT = set_combine(sets.engaged.PDL, sets.engaged.Hybrid)

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.buff.Doom = {
        -- neck="Nicander's Necklace", --20
        -- ring1={name="Eshmun's Ring", bag="wardrobe3"}, --20
        -- ring2={name="Eshmun's Ring", bag="wardrobe4"}, --20
        -- waist="Gishdubar Sash", --10
        }

    -- sets.CP = {back="Mecisto. Mantle"}
    --sets.Reive = {neck="Ygnas's Resolve +1"}

end

function job_handle_equipping_gear(playerStatus, eventArgs)
    check_gear()
    check_weaponset()
end

function customize_idle_set(idleSet)
    -- if state.CP.current == 'on' then
    --     equip(sets.CP)
    --     disable('back')
    -- else
    --     enable('back')
    -- end

    return idleSet
end

function check_gear()
    if no_swap_gear:contains(player.equipment.left_ring) then
        disable("ring1")
    else
        enable("ring1")
    end
    if no_swap_gear:contains(player.equipment.right_ring) then
        disable("ring2")
    else
        enable("ring2")
    end
end

function check_weaponset()
    equip(sets[state.WeaponSet.current])
end

windower.register_event('zone change',
    function()
        if no_swap_gear:contains(player.equipment.left_ring) then
            enable("ring1")
            equip(sets.idle)
        end
        if no_swap_gear:contains(player.equipment.right_ring) then
            enable("ring2")
            equip(sets.idle)
        end
    end
)

function set_lockstyle()
    send_command('wait 3; input /lockstyleset ' .. lockstyleset)
end
