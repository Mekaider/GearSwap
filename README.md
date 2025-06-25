# GearSwap Luas

## Job GearSwap Progress

| Job | Status | Notes |
|-----|--------|-------|
| Warrior | ✅ | |
| Monk | 🔄 | |
| White Mage | ✅ | |
| Black Mage | ⭕ | |
| Red Mage | ✅ | |
| Thief | ⭕ | |
| Paladin | 🔄 | |
| Dark Knight | ⭕ | |
| Beastmaster | ⭕ | |
| Bard | ⭕ | |
| Ranger | ⭕ | |
| Samurai | ⭕ | |
| Ninja | ⭕ | |
| Dragoon | ⭕ | |
| Summoner | ⭕ | |
| Blue Mage | ⭕ | |
| Corsair | 🔄 | |
| Puppetmaster | ⭕ | |
| Dancer | ⭕ | |
| Scholar | ⭕ | |
| Geomancer | ✅ | |
| Rune Fencer | 🔄 | |

## To-do

- [ ] Finish job luas
- [ ] Aftermath handling
- [ ] Ammo checks, don't shoot special ammo, etc.
- [ ] Treasure hunter modes/gear/etc.
- [ ] Crafting gear set override?
- [ ] Review job_{pre,mid}cast and how that's hooked in (I'm not sure I like the current set_combine logic)
- [ ] TP bonus (moonshade, etc.) handling and accounting for 3k tp
- [ ] Add gear tables for things like AF and add to job files

## User Guide

### Keybindings

The following keybindings are available for all jobs:

- `F9`: Cycle Weapon Mode (e.g., Gun, Shield, etc.)
- `F10`: Cycle Melee Mode (TP, DT, Acc, PDL)
- `F12`: Update gear
- `Alt+B`: Toggle Magic Burst mode
- `Alt+M`: Cycle Magic Mode (Normal, M.Acc)
- `Alt+Q`: Cycle Quick Draw Mode (Normal, Enhance, StoreTP)
- `Alt+W`: Cycle Weapon Lock

### Common Gear Sets

The following gear sets are available across all jobs:

#### Weapon Sets
- `sets.weapons`: Base weapon sets
- `sets.weapons.Shield`: Shield-specific set, only used on PLD so far

##### Functionality:
- When `WeaponLock` is `true`, the current weapon set overrides all other gear changes. This locks the weapons and prevents any changes, even if defined in the gear sets.
- When `WeaponMode` is set to `Unlocked`, the library won't change weapons. However, weapons defined in gear sets will still work as expected. Useful for trial weapons, etc.
- Precast and midcast: any weapons defined in sets will be used, _unless_ state.WeaponLock is true
- Aftercast (engaged and idle): the current weaponset will be used; any weapons defined in sets will be ignored

#### Idle Sets
- `sets.idle`: Standard idle set
- `sets.idle.Moving`: Idle set while moving
- `sets.idle.Pet`: Idle set with pet
- `sets.idle.Sublimation`: Sublimation idle set

#### Engaged Sets
- `sets.engaged`: Standard engaged set
- `sets.engaged.DT`: Damage Taken engaged set
- `sets.engaged.Acc`: Accuracy engaged set
- `sets.engaged.PDL`: Physical Damage Limit engaged set
- `sets.engaged.OneHand`: One-handed weapon engaged set
- `sets.engaged.TwoHand`: Two-handed weapon engaged set
- `sets.engaged.DualWield`: Dual wield engaged set
- `sets.engaged.DualWield.LowDW`: Dual wield extra sets
- `sets.engaged.DualWield.MidDW`: Dual wield extra sets
- `sets.engaged.DualWield.HighDW`: Dual wield extra sets
- `sets.engaged.DualWield.SuperDW`: Dual wield extra sets
- `sets.engaged.DualWield.MaxDW`: Dual wield extra sets

#### Magic Sets
- `sets.precast.FastCast`: Fast cast sets for all magic
- `sets.precast.FastCast['Enhancing Magic']`: Fast cast for enhancing magic
- `sets.precast.Cure`: Cure spell precast set
- `sets.precast.QuickMagic`: Quick magic precast set
- `sets.precast.Utsusemi`: Utsusemi precast set

#### Ranged Attack Sets
- `sets.precast.RA`: Standard ranged attack set
- `sets.precast.RA.Flurry`: Flurry ranged attack set
- `sets.precast.RA.FlurryII`: Flurry II ranged attack set

#### Job Ability Sets
- `sets.JA`: Job ability sets
- `sets.PhantomRoll`: Corsair roll sets
- `sets.QuickDraw`: Quick Draw sets

#### Weaponskill Sets
- `sets.WS`: Weaponskill sets

### Mode Options

#### Melee Modes
- `TP`: Standard TP mode
- `DT`: Damage Taken mode
- `Acc`: Accuracy mode
- `PDL`: Physical Damage Limit mode

#### Magic Modes
- `Normal`: Standard magic mode
- `M.Acc`: Magic Accuracy mode

#### Extra Magic Modes
- `None`: Standard casting mode
- `Immunobreak`: Special mode for breaking immunities with enhanced Magic Accuracy gear

#### Ranged Modes
- `Normal`: Standard ranged mode
- `PDL`: Physical Damage Limit mode
- `Crit`: Critical hit mode

#### Quick Draw Modes
- `Normal`: Standard Quick Draw mode
- `Enhance`: Enhanced Quick Draw mode
- `StoreTP`: Store TP Quick Draw mode

### Special Features

- **Weapon Lock**: Toggle with `Alt+W` to lock your weapon set regardless of other gear changes
- **Magic Burst**: Toggle with `Alt+B` to enable/disable magic burst mode
- **Enhanced Magic Casting**: The library now automatically selects appropriate gear sets based on spell classification:
  - **Enhancing Magic Skill Spells**: Spells like Enspells, Temper, and Boost stats automatically use skill-focused gear sets when available (e.g., `sets.midcast['Enhancing Magic'].Skill`)
  - **Enfeebling Magic Potency vs Duration**: The library distinguishes between spells that benefit from potency (Paralyze, Slow, etc.) vs duration (Sleep, Dia, etc.) and selects the appropriate gear set automatically
  - **Custom Magic Groups**: Similar to custom melee groups, you can define special magic casting conditions that are automatically detected
- **Stance Detection**: The library detects and applies the appropriate stance-based gear sets. Available stances are:
  - `Normal`: Default stance
  - `OneHand`: When using a one-handed weapon
  - `TwoHand`: When using a two-handed weapon
  - `DualWield`: When dual wielding

  Example usage:
  ```lua
  sets.engaged.OneHand = set_combine(sets.engaged, {})
  sets.engaged.TwoHand = set_combine(sets.engaged, {})
  sets.engaged.DualWield = set_combine(sets.engaged, {})
  ```

- **Dual Wield Detection**: The library uses HasteInfo to automatically calculate the required dual wield gear needed to reach specific delay reduction thresholds. This allows for optimal gear selection based on your current haste and dual wield values.

  Example usage:
  ```lua
  -- Define your dual wield gear sets with their DW values
    sets.engaged.DualWield.LowDW = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        left_ear="Suppanomimi", -- 5
    })

    sets.engaged.DualWield.MidDW = set_combine(sets.engaged, {
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        right_ear="Suppanomimi", -- 5
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })
  ```

  The library will automatically:
  - Calculate your current haste from gear, buffs, and job abilities
  - Determine the required dual wield value to reach specific delay reduction thresholds
  - Select the appropriate gear set to meet those requirements

- **Custom Melee Groups**: Support for custom melee group definitions. This feature allows you to create specialized gear sets for specific combat situations or buffs. See `function update_melee_group`. The library automatically checks for these groups when selecting gear sets. For example:

  ```lua
  -- Define custom melee groups in your job lua
  state.CustomMeleeGroups = L{'Impetus'}

  -- Use in gear sets
  sets.engaged.Impetus = set_combine(sets.engaged, {body="Bhikku Cyclas +2"})
  ```

  The library will automatically check for these custom groups when selecting gear sets for:
  - Engaged sets
  - Weaponskill sets
  - Any other melee-related gear changes

  This following are built in:
  - Mighty Strikes
  - Impetus
  - Footwork

- **Elemental Weather Bonus**: Automatic calculation of elemental weather bonus potency
- **Elemental Weaponskill Detection**: Automatic detection of elemental weaponskills
- **Automatic Movement Speed Detection**: The library automatically detects when you're moving and equips your movement speed set (`sets.Moving`). Additionally, when in any town zone, it will automatically combine your idle set with the movement speed set.

### Usage Tips

1. Weapon Lock (`Alt+W`) is useful when you want to maintain a specific weapon set regardless of other gear changes
2. Magic Burst mode (`Alt+B`) should be toggled when you know you'll be magic bursting
3. For optimal performance, ensure your gear sets are properly defined for each mode you plan to use
4. The library automatically handles many common scenarios, but you can customize sets in the job-specific lua files

### Debugging

- Enable debug logging by setting `state.DebugMode = true` in your job lua
- The display box can be toggled with `state.Display = false` if you don't want to see the mode information

## Symlinks:

Include:

    mklink "C:\Windower-dev\addons\GearSwap\libs\Mekaider-Include.lua" "%userprofile%\Projects\GearSwap\Mekaider-Include.lua"

Data:

    mklink /D "C:\Windower-dev\addons\GearSwap\data" "%userprofile%\Projects\GearSwap\data"
