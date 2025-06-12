--Relyk

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "1"
MacroBook = "2"  -- Sub Job macro pallets can be defined in the sub_job_change_custom function below
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi +1"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Set to true to run organizer on job changes
Organizer = false

-- Add CRIT the base modes to allow AM3 Critical Builds
-- state.OffenseMode:options('TP','ACC','DT','PDL','CRIT')
state.OffenseMode:options('TP','DT')
state.OffenseMode:set('TP')

--Modes for specific to Corsair
state.WeaponMode:options('Fomalhaut','Death Penalty', 'Savage Blade', 'Aeolian Edge')
state.WeaponMode:set('Savage Blade')

--Enable JobMode for UI.
UI_Name = 'TP Mode'

--Melee or Ranged Mode
state.JobMode:options('Standard','Melee','Ranged')
state.JobMode:set('Melee')

elemental_ws = S{'Aeolian Edge', 'Leaden Salute', 'Wildfire','Earth Shot','Ice Shot','Water Shot','Fire Shot','Wind Shot','Thunder Shot'}

-- load addons
-- send_command('lua l autocor')
send_command('gs c info')

-- Initialize Player
jobsetup(LockStylePallet,MacroBook,MacroSet)

-- Threshold for Ammunition Warning
Ammo_Warning_Limit = 20

function get_sets()

	--Set the weapon options.  This is set below in job customization section

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Savage Blade'] = {
		main="Naegling",
		sub="Gleti's Knife",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}

	sets.Weapons['Fomalhaut'] = {
		main="Naegling",
		range="Fomalhaut",
	}

	sets.Weapons['Death Penalty'] = {
		main={ name="Rostam", augments={'Path: B'}, bag="Wardrobe 2"},
		sub="Tauret",
		range={ name="Death Penalty", augments={'Path: A',}},
	}
	sets.Weapons['Aeolian Edge'] = {
		ammo=Ammo.Bullet.MAG_WS,
		main={ name="Rostam", augments={'Path: B'}, bag="Wardrobe 2"},
		sub="Tauret",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}

	sets.Weapons.Melee = {
		-- sub="Blurred Knife +1",
		sub="Gleti's Knife",
	}

	sets.Weapons.Ranged = {
		main={ name="Rostam", augments={'Path: B'}, bag="Wardrobe 2"},
		-- main="Kustawi +1",
	}

	sets.Weapons.Shield = {
		sub={ name="Nusku Shield", priority=1},
	}

	sets.Weapons.Sleep = {
		range="Earp",
	}

	-- Ammo Selection
	Ammo.Bullet.RA = "Chrono Bullet"		-- TP Ammo
	Ammo.Bullet.WS = "Chrono Bullet"		-- Physical Weaponskills
	Ammo.Bullet.MAB = "Living Bullet"		-- Magical Weaponskills
	Ammo.Bullet.MACC = "Chrono Bullet"		-- Magic Accuracy
	-- Ammo.Bullet.QD = "Hauksbok Bullet"		-- Quick Draw
    Ammo.Bullet.QD = "Living Bullet"		-- Quick Draw
	Ammo.Bullet.MAG_WS = "Living Bullet"	-- Magic Weapon Skills

	-- Standard Idle set with -DT,Refresh,Regen with NO movement gear
	sets.Idle = {
		ammo = Ammo.Bullet.RA,
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Loricate Torque +1",
        waist = "Flume Belt +1",
        left_ear = "Suppanomimi",
        right_ear = "Infused Earring",
        left_ring = "Defending Ring",
        right_ring = "Purity Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.Movement = {
		right_ring = "Shneddick Ring",
	}

	-- Set to be used if you get 
	sets.Cursna_Received = {}

	sets.OffenseMode = {}

	--Base TP set to build off when melee'n
	sets.OffenseMode.TP = {
		ammo = Ammo.Bullet.RA,
        head = { name = "Adhemar Bonnet +1", augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}},
        body = { name = "Adhemar Jacket +1", augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}},
        hands = { name = "Herculean Gloves", augments = {'Accuracy+18', '"Triple Atk."+3', 'STR+3', 'Attack+12'}},
        legs="Samnuha Tights",
        feet = { name = "Herculean Boots", augments = {'Accuracy+25 Attack+25', '"Triple Atk."+3', 'VIT+5'}},
        neck = "Clotharius Torque",
        waist = "Windbuffet Belt +1",
        left_ear = "Digni. Earring",
        right_ear = "Brutal Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	--This set is used when OffenseMode is DT and Enaged
	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
        head = "Malignance Chapeau", -- 6/6
        body = "Malignance Tabard", -- 9/9
        hands = "Malignance Gloves", -- 5/5
        legs = "Malignance Tights", -- 7/7
        feet = "Malignance Boots", -- 4/4
        left_ring = "Defending Ring", -- 10/10
	})

	--This set is used when OffenseMode is PDL and Enaged
	sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {
		legs="Malignance Tights",
	})

	--This set is used when OffenseMode is CRIT and Enaged
	sets.OffenseMode.CRIT = set_combine(sets.OffenseMode.TP, {

	})

	--The following sets augment the base TP set above for Dual Wielding
	sets.DualWield = {
		-- hands="Floral Gauntlets",
		-- legs="Carmine Cuisses +1",
	    -- feet={ name="Taeon Boots", augments={'Accuracy+24','"Dual Wield"+5','STR+7 DEX+7',}},
		waist="Reiki Yotai",
		right_ear="Eabani Earring",
	}

	--This set is used when OffenseMode is ACC and Engaged (Augments the TP base set)
	sets.OffenseMode.ACC = {}

	sets.Precast = {}
	-- 70 snapshot is Cap.  Need 60 due to 10 from gifts
	-- Snapshot / Rapidshot
	-- Rapid shot is like quick magic
	-- Snapshot is like Fast Cast
	-- Flurry is 15% Snapshot
	-- Flurry II 30% Snapshot

	--No flurry - 60 Snapshot needed
	sets.Precast.RA = {
		ammo=Ammo.Bullet.RA,
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
		feet="Meg. Jam. +1", -- 10/0
		neck={ name="Comm. Charm +2", augments={'Path: A',}}, -- 4/0
    } -- Totals 59/43

	-- Flurry - 45 Snapshot Needed
	sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {
		body="Laksa. Frac +1", -- 0/20
	}) -- Totals 45/63

	-- Flurry II - 30 Snapshot Needed
	sets.Precast.RA.Flurry_II = set_combine( sets.Precast.RA.Flurry, { 
		-- feet={ name="Pursuer's Gaiters", augments={'Rng.Acc.+10','"Rapid Shot"+10','"Recycle"+15',}} -- 0/10
    }) -- Totals 35/73

	sets.Precast.RA.ACC = {}

	-- Fast Cast for Magic
	sets.Precast.FastCast = {
	    -- head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, -- 14
		-- body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+44',}}, -- 9
		hands = "Leyline Gloves",
		-- legs={ name="Herculean Trousers", augments={'Mag. Acc.+7','"Fast Cast"+6',}},  -- 6
		-- feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}}, -- 8
		-- neck="Voltsurge Torque", -- 4
		-- waist="Eschan Stone",
		-- left_ear="Loquac. Earring", -- 2
		-- right_ear="Etiolation Earring", -- 1
		-- left_ring="Lebeche Ring",
		-- right_ring="Kishar Ring", -- 4
		-- back={ name="Camulus's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}}, -- 10
	} -- 65 FC

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = {
		ammo=Ammo.Bullet.RA,
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Marked Gorget",
        ring1 = "Regal Ring",
        ring2 = "Rajas Ring",
        back = "Gunslinger's Cape",
        waist = "Yemaya Belt"
	}

	-- Ranged Attack Gear (Triple Shot Midshot)
	sets.Midcast.RA.TripleShot = set_combine(sets.Midcast.RA, {
        -- head="Oshosi Mask +1", -- Missing
        -- body="Chasseur's Frac +3", --14
        -- hands="Lanun Gants +3", -- Tripple shot becomes Quad shot
        -- legs="Osh. Trousers +1", -- Missing
        -- feet="Osh. Leggings +1", --3
    }) --28

	-- Ranged PDL
	sets.Midcast.RA.PDL = set_combine(sets.Midcast.RA, {
		-- left_ring="Sroda Ring",
    })

	-- Ranged CRIT
	sets.Midcast.RA.CRIT = set_combine(sets.Midcast.RA, {
		-- left_ring="Sroda Ring",
		-- head="Ikenga's Hat",
		-- body="Ikenga's Vest",
		-- hands={ name="Ikenga's Gloves", augments={'Path: A',}},
		-- legs={ name="Ikenga's Trousers", augments={'Path: A',}},
		-- feet={ name="Ikenga's Clogs", augments={'Path: A',}},
    })

	sets.Utsusemi = set_combine(sets.Idle, {
	
	})

	sets.Midcast['Utsusemi: Ichi'] = sets.Utsusemi
	sets.Midcast['Utsusemi: Ni'] = sets.Utsusemi

	-- Quick Draw Gear Sets
	sets.QuickDraw = {}

	sets.QuickDraw.ACC = {
		ammo = Ammo.Bullet.QD,
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		-- left_ear="Hermetic Earring",
		-- right_ear="Crep. Earring",
		-- left_ring="Kishar Ring",
		-- right_ring="Crepuscular Ring",
		-- back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.QuickDraw.DMG = {
		ammo = Ammo.Bullet.QD,
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
        waist = "Skrymir Cord",
        left_ear = "Hecate's Earring",
        right_ear = "Friomisi Earring",
	}

	sets.QuickDraw.STP = {
		ammo = Ammo.Bullet.QD,
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		-- neck="Iskur Gorget",
		-- waist="Yemaya Belt",
		-- left_ear="Telos Earring",
		-- right_ear="Crep. Earring",
		-- left_ring="Crepuscular Ring",
		-- right_ring="Ilabrat Ring",
		-- back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	-- Quick Draw 
	sets.QuickDraw["Fire Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Ice Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Wind Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Earth Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Thunder Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Water Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Light Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Dark Shot"] = set_combine( sets.QuickDraw.DMG, {
	    -- right_ring="Archon Ring",
	    head="Pixie Hairpin +1",
	})

	-- Job Abilities
	sets.JA = {}
	sets.JA["Wild Card"] = {
	    -- feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
	}
	sets.JA["Phantom Roll"] = {}
	sets.JA["Random Deal"] = {
	    body={ name="Lanun Frac +1", augments={'Enhances "Loaded Deck" effect',}},
	}
	sets.JA["Snake Eye"] = {
	    legs={ name="Lanun Trews", augments={'Enhances "Snake Eye" effect',}},
	}
	sets.JA["Fold"] = {}			-- Use gloves for bust
	sets.JA["Triple Shot"] = {}		-- Gear to be worn during Midshot
	sets.JA["Cutting Cards"] = {}
	sets.JA["Crooked Cards"] = {}
	sets.JA["Double-Up"] = {
		right_ring="Luzaf's Ring", -- 16 yalm range
	}

	--Base Set used for all rolls
	sets.PhantomRoll = set_combine(sets.Idle, {
		main={ name="Rostam", augments={'Path: C'}, bag="Wardrobe 1", priority=1}, -- +8 Effect and 60 sec Duration
		sub={ name="Nusku Shield", priority=2},
		range="Compensator", -- 20 sec Duration
		head={ name="Lanun Tricorne", augments={'Enhances "Winning Streak" effect',}}, -- 50% Job ability Bonus
		hands="Chasseur's Gants", --60 sec Duration
		-- neck="Regal Necklace", -- 20 sec Duration
		right_ring="Luzaf's Ring", -- 16 yalm range
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	})

	sets.PhantomRoll['Fighter\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Monk\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Healer\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Wizard\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Warlock\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Rogue\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Gallant\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Chaos Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Beast Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Choral Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Hunter\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Samurai Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Ninja Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Drachen Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Evoker\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Magus\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Corsair\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Puppet Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Dancer\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Scholar\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Bolter\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll["Caster\'s Roll"] = set_combine(sets.PhantomRoll, {legs="Chas. Culottes +3",})
	sets.PhantomRoll["Tactician\'s Roll"] = set_combine(sets.PhantomRoll, {body="Chasseur's Frac +3"})
	sets.PhantomRoll["Allies\' Roll"] = set_combine(sets.PhantomRoll, {hands="Chasseur's Gants +3"})
	sets.PhantomRoll['Miser\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Companion\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Avenger\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Naturalist\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll["Courser\'s Roll"] = set_combine(sets.PhantomRoll, {feet="Chass. Bottes +3"})
    sets.PhantomRoll["Blitzer\'s Roll"] = set_combine(sets.PhantomRoll, {head="Chass. Tricorne +3"})

	sets.WS = {
		ammo=Ammo.Bullet.WS,
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Meg. Gloves +2",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
        waist = "Windbuffet Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		-- left_ring="Regal Ring",
		right_ring="Regal Ring",
		back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}

	sets.WS.RA = set_combine (sets.WS, {
		-- body="Laksa. Frac +3",
		-- hands="Chasseur's Gants +3",
		-- left_ring="Regal Ring",
		-- back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
	})

	-- Accuracy set used in OffenseMode.ACC
	sets.WS.ACC = set_combine(sets.WS, {
	})

	-- Equipment to augment the Melee WS for Physical Damage Limit (Capped Attack)
	sets.WS.PDL = set_combine(sets.WS, {
		-- left_ring="Sroda Ring",
	})

	-- Equipment to augment the Ranged WS for Physical Damage Limit (Capped Attack)
	sets.WS.PDL.RA = set_combine(sets.WS, {
		-- left_ring="Sroda Ring",
		-- head="Ikenga's Hat",
		-- body="Ikenga's Vest",
		-- hands={ name="Ikenga's Gloves", augments={'Path: A',}},
		-- legs={ name="Ikenga's Trousers", augments={'Path: A',}},
		-- feet={ name="Ikenga's Clogs", augments={'Path: A',}},
	})

	sets.WS.MAB = set_combine(sets.WS, {
		ammo=Ammo.Bullet.MAB,
		-- feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
        waist = "Skrymir Cord",
        left_ear = "Hecate's Earring",
        right_ear = "Friomisi Earring",
		-- left_ring="Dingir Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Mag. Evasion+15',}},
	})

	sets.WS.MACC = set_combine(sets.WS.MAB, {
		ammo=Ammo.Bullet.MACC,
	})

	sets.WS.WSD = set_combine(sets.WS, {
		ammo=Ammo.Bullet.WS,
	})

	sets.WS["Wildfire"] = set_combine(sets.WS.MAB, {
        waist = "Skrymir Cord",
        left_ear = "Hecate's Earring",
        right_ear = "Friomisi Earring",
		-- left_ring="Dingir Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Mag. Evasion+15',}},
	})

	sets.WS["Leaden Salute"] = set_combine(sets.WS.MAB, {
		head="Pixie Hairpin +1",
		-- right_ring="Archon Ring",
		left_ear="Moonshade Earring",
		-- waist="Svelt. Gouriz +1",   -- Changes based off elemental function
	})

	sets.WS['Aeolian Edge'] = set_combine(sets.WS.MAB, {
		left_ear="Moonshade Earring",
	})

	sets.WS["Savage Blade"] = set_combine(sets.WS.WSD, {
		-- left_ring="Sroda Ring",
	})

	sets.WS["Last Stand"] = set_combine(sets.WS.WSD, sets.WS.RA, {
		-- neck="Fotia Gorget",
		waist="Light Belt",
	})

	-- Uses Default WS set
	sets.WS["Hot Shot"] = sets.WS["Wildfire"]
	sets.WS["Split Shot"] = set_combine(sets.WS, {})
	sets.WS["Sniper Shot"] = set_combine(sets.WS, {})
	sets.WS["Slug Shot"] = set_combine(sets.WS, {})
	sets.WS["Numbing Shot"] = set_combine(sets.WS, {})
	sets.WS["Fast Blade"] = set_combine(sets.WS, {})
	sets.WS["Burning Blade"] = set_combine(sets.WS, {})
	sets.WS["Flat Blade"] = set_combine(sets.WS, {})
	sets.WS["Shining Blade"] = set_combine(sets.WS, {})
	sets.WS["Circle Blade"] = set_combine(sets.WS, {})
	sets.WS["Spirits Within"] = set_combine(sets.WS, {})
	sets.WS["Requiescat"] = set_combine(sets.WS, {})

	sets.TreasureHunter = {
		-- waist="Chaac Belt",
	}
	sets.Jig = {}
end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's subjob changes.
function sub_job_change_custom(new, old)
	-- Typically used for Macro pallet changing
end

--Adjust custom precast actions
function pretarget_custom(spell,action)

end
-- Augment basic equipment sets
function precast_custom(spell)
	equipSet = {}
	if spell.english == 'Fold' then
		equipSet = set_combine(equipSet, {hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}}})
    end
	if spell.id == 123 or spell.type == 'CorsairRoll' then -- Double up and bypass weapon check
		equipSet = set_combine(equipSet, sets.PhantomRoll)
	end
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
	if spell.english == 'Fold' then
		equipSet = set_combine(equipSet, {hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}}})
    end
	if spell.id == 123 or spell.type == 'CorsairRoll' then -- Double up and bypass weapon check
		equipSet = set_combine(equipSet, sets.PhantomRoll)
	end


	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)

end

function user_file_unload()
	send_command('lua u autocor')
end

function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()
	if player.sub_job == 'WAR' then
		if not buffactive['Berserk'] and ja_recasts[1] == 0 then
			buff = "Berserk"
		elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
			buff = "Aggressor"
		elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
			buff = "Warcry"
		end
	end
	return buff
end

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

function Job_Mode_Check(equipSet)
	if state.JobMode.value == 'Melee' then
		equipSet = set_combine(equipSet, sets.Weapons.Melee)
	elseif state.JobMode.value == 'Ranged' then
		equipSet = set_combine(equipSet, sets.Weapons.Ranged)
	end
	return equipSet
end

function PDL_Type_Check()
	if state.JobMode.value == 'Melee' then
		equipSet = set_combine(equipSet, sets.Weapons.Melee)
	elseif state.JobMode.value == 'Ranged' then
		equipSet = set_combine(equipSet, sets.Weapons.Ranged)
	end
	return equipSet
end