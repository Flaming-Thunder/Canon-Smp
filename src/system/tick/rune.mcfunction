
/damage

  execute store result score .damage Game.Math run data get storage game:player myData.LastSelectedItem.components."minecraft:damage"
  execute store result score .max_damage Game.Math run data get storage game:player myData.LastSelectedItem.components."minecraft:max_damage"
  execute unless entity @s[gamemode=creative] run scoreboard players add .damage Game.Math 1
  scoreboard players operation .damage Game.Math -= .max_damage Game.Math
  scoreboard players operation .damage Game.Math *= #-4063 Game.Math
  scoreboard players operation .damage Game.Math /= .max_damage Game.Math
  data modify storage game:math temp.item.item_model set from storage game:player myData.LastSelectedItem.components."minecraft:item_model"
  data modify storage game:math temp.item.custom_model_data set from storage game:player myData.LastSelectedItem.components."minecraft:custom_model_data"
  
  setblock 0 0 0 chest
  data modify storage game:player myData.LastSelectedItem.Slot set value 0b
  data modify block 0 0 0 Items append from storage game:player myData.LastSelectedItem
  item replace entity @s weapon.mainhand from block 0 0 0 container.0 game:item/damage
  setblock 0 0 0 air
  execute if score .damage Game.Math matches ..0 run %FILE%/break
#END
/break
  playsound entity.item.break player @s ~ ~ ~ 0.5 1 0
  
  item replace entity @s weapon.mainhand with air
#END
/use_condition
  function game:system/load/player_data_load
  data modify storage game:math temp.temp set from storage game:player myData.LastSelectedItem
  execute store result score .break Game.Math run data modify storage game:math temp.temp set from entity @s SelectedItem
  return run execute if score .break Game.Math matches 0 unless data entity @s equipment.offhand.components."minecraft:custom_data".MagicRune
#END
/chaos
  
  advancement revoke @s only game:use_rune/chaos
  execute if function game:system/tick/rune/use_condition run
    %FILE%/damage
    execute store result score .temp0 Game.Math run random value 0..18
    execute store result score .temp1 Game.Math run random value 0..13
    execute if score .temp0 Game.Math matches 0 run effect give @s absorption 60 0
    execute if score .temp0 Game.Math matches 1 run effect give @s conduit_power 60 0
    execute if score .temp0 Game.Math matches 2 run effect give @s dolphins_grace 60 0
    execute if score .temp0 Game.Math matches 3 run effect give @s fire_resistance 60 0
    execute if score .temp0 Game.Math matches 4 unless score .temp1 Game.Math matches 8 run effect give @s haste 60 0
    execute if score .temp0 Game.Math matches 5 run effect give @s health_boost 60 0
    execute if score .temp0 Game.Math matches 6 unless score .temp1 Game.Math matches 1 run effect give @s hero_of_the_village 60 0
    execute if score .temp0 Game.Math matches 7 unless score .temp1 Game.Math matches 6 run effect give @s instant_health 60 0
    execute if score .temp0 Game.Math matches 8 unless score .temp1 Game.Math matches 4 run effect give @s invisibility 60 0
    execute if score .temp0 Game.Math matches 9 run effect give @s jump_boost 60 0
    execute if score .temp0 Game.Math matches 10 unless score .temp1 Game.Math matches 0 run effect give @s luck 60 0
    execute if score .temp0 Game.Math matches 11 unless score .temp1 Game.Math matches 3 unless score .temp1 Game.Math matches 2 run effect give @s night_vision
    execute if score .temp0 Game.Math matches 12 unless score .temp1 Game.Math matches 10 run effect give @s regeneration 60 0
    execute if score .temp0 Game.Math matches 13 run effect give @s resistance 60 0
    execute if score .temp0 Game.Math matches 14 unless score .temp1 Game.Math matches 5 run effect give @s saturation 60 0
    execute if score .temp0 Game.Math matches 15 unless score .temp1 Game.Math matches 7 run effect give @s slow_falling 60 0
    execute if score .temp0 Game.Math matches 16 unless score .temp1 Game.Math matches 11 run effect give @s speed 60 0
    execute if score .temp0 Game.Math matches 17 unless score .temp1 Game.Math matches 12 run effect give @s strength 60 0
    execute if score .temp0 Game.Math matches 18 run effect give @s water_breathing 60 0
    execute if score .temp1 Game.Math matches 0 unless score .temp0 Game.Math matches 10 run effect give @s unluck 60 0
    execute if score .temp1 Game.Math matches 1 unless score .temp0 Game.Math matches 6 run effect give @s bad_omen 60 0
    execute if score .temp1 Game.Math matches 2 unless score .temp0 Game.Math matches 11 run effect give @s blindness 60 0
    execute if score .temp1 Game.Math matches 3 unless score .temp0 Game.Math matches 11 run effect give @s darkness 60 0
    execute if score .temp1 Game.Math matches 4 unless score .temp0 Game.Math matches 8 run effect give @s glowing 60 0
    execute if score .temp1 Game.Math matches 5 unless score .temp0 Game.Math matches 14 run effect give @s hunger 60 0
    execute if score .temp1 Game.Math matches 6 unless score .temp0 Game.Math matches 7 run effect give @s instant_damage 60 0
    execute if score .temp1 Game.Math matches 7 unless score .temp0 Game.Math matches 15 run effect give @s levitation 60 0
    execute if score .temp1 Game.Math matches 8 unless score .temp0 Game.Math matches 4 run effect give @s mining_fatigue 60 0
    execute if score .temp1 Game.Math matches 9 run effect give @s nausea 60 0
    execute if score .temp1 Game.Math matches 10 unless score .temp0 Game.Math matches 12 run effect give @s poison 60 0
    execute if score .temp1 Game.Math matches 11 unless score .temp0 Game.Math matches 16 run effect give @s slowness 60 0
    execute if score .temp1 Game.Math matches 12 unless score .temp0 Game.Math matches 17 run effect give @s weakness 60 0
    execute if score .temp1 Game.Math matches 13 run effect give @s wither 60 0
    execute store result score .temp0 Game.Math run random value 0..72
    execute if score .temp0 Game.Math matches 0 run summon zombie ~ ~ ~
    execute if score .temp0 Game.Math matches 1 run summon husk ~ ~ ~
    execute if score .temp0 Game.Math matches 2 run summon skeleton ~ ~ ~
    execute if score .temp0 Game.Math matches 3 run summon creeper ~ ~ ~
    execute if score .temp0 Game.Math matches 4 run summon enderman ~ ~ ~
    execute if score .temp0 Game.Math matches 5 run summon spider ~ ~ ~
    execute if score .temp0 Game.Math matches 6 run summon cave_spider ~ ~ ~
    execute if score .temp0 Game.Math matches 7 run summon breeze ~ ~ ~
    execute if score .temp0 Game.Math matches 8 run summon blaze ~ ~ ~
    execute if score .temp0 Game.Math matches 9 run summon phantom ~ ~ ~
    execute if score .temp0 Game.Math matches 10 run summon bogged ~ ~ ~
    execute if score .temp0 Game.Math matches 11 run summon elder_guardian ~ ~ ~
    execute if score .temp0 Game.Math matches 12 run summon endermite ~ ~ ~
    execute if score .temp0 Game.Math matches 13 run summon guardian ~ ~ ~
    execute if score .temp0 Game.Math matches 14 run summon ghast ~ ~ ~
    execute if score .temp0 Game.Math matches 15 run summon zoglin ~ ~ ~
    execute if score .temp0 Game.Math matches 16 run summon illusioner ~ ~ ~
    execute if score .temp0 Game.Math matches 17 run summon magma_cube ~ ~ ~
    execute if score .temp0 Game.Math matches 18 run summon piglin ~ ~ ~
    execute if score .temp0 Game.Math matches 19 run summon piglin_brute ~ ~ ~
    execute if score .temp0 Game.Math matches 20 run summon pillager ~ ~ ~
    execute if score .temp0 Game.Math matches 21 run summon ravager ~ ~ ~
    execute if score .temp0 Game.Math matches 22 run summon shulker ~ ~ ~
    execute if score .temp0 Game.Math matches 23 run summon silverfish ~ ~ ~
    execute if score .temp0 Game.Math matches 24 run summon skeleton_horse ~ ~ ~
    execute if score .temp0 Game.Math matches 25 run summon stray ~ ~ ~
    execute if score .temp0 Game.Math matches 26 run summon strider ~ ~ ~
    execute if score .temp0 Game.Math matches 27 run summon vex ~ ~ ~
    execute if score .temp0 Game.Math matches 28 run summon witch ~ ~ ~
    execute if score .temp0 Game.Math matches 29 run summon wither_skeleton ~ ~ ~
    execute if score .temp0 Game.Math matches 30 run summon allay ~ ~ ~
    execute if score .temp0 Game.Math matches 31 run summon armadillo ~ ~ ~
    execute if score .temp0 Game.Math matches 32 run summon axolotl ~ ~ ~
    execute if score .temp0 Game.Math matches 33 run summon bat ~ ~ ~
    execute if score .temp0 Game.Math matches 34 run summon bee ~ ~ ~
    execute if score .temp0 Game.Math matches 35 run summon camel ~ ~ ~
    execute if score .temp0 Game.Math matches 36 run summon cat ~ ~ ~
    execute if score .temp0 Game.Math matches 37 run summon chicken ~ ~ ~
    execute if score .temp0 Game.Math matches 38 run summon cod ~ ~ ~
    execute if score .temp0 Game.Math matches 39 run summon cow ~ ~ ~
    execute if score .temp0 Game.Math matches 40 run summon dolphin ~ ~ ~
    execute if score .temp0 Game.Math matches 41 run summon donkey ~ ~ ~
    execute if score .temp0 Game.Math matches 42 run summon drowned ~ ~ ~
    execute if score .temp0 Game.Math matches 43 run summon evoker ~ ~ ~
    execute if score .temp0 Game.Math matches 44 run summon fox ~ ~ ~
    execute if score .temp0 Game.Math matches 45 run summon frog ~ ~ ~
    execute if score .temp0 Game.Math matches 46 run summon glow_squid ~ ~ ~
    execute if score .temp0 Game.Math matches 47 run summon goat ~ ~ ~
    execute if score .temp0 Game.Math matches 48 run summon hoglin ~ ~ ~
    execute if score .temp0 Game.Math matches 49 run summon horse ~ ~ ~
    execute if score .temp0 Game.Math matches 50 run summon iron_golem ~ ~ ~
    execute if score .temp0 Game.Math matches 51 run summon llama ~ ~ ~
    execute if score .temp0 Game.Math matches 52 run summon mooshroom ~ ~ ~
    execute if score .temp0 Game.Math matches 53 run summon mule ~ ~ ~
    execute if score .temp0 Game.Math matches 54 run summon ocelot ~ ~ ~
    execute if score .temp0 Game.Math matches 55 run summon panda ~ ~ ~
    execute if score .temp0 Game.Math matches 56 run summon parrot ~ ~ ~
    execute if score .temp0 Game.Math matches 57 run summon pig ~ ~ ~
    execute if score .temp0 Game.Math matches 58 run summon polar_bear ~ ~ ~
    execute if score .temp0 Game.Math matches 59 run summon pufferfish ~ ~ ~
    execute if score .temp0 Game.Math matches 60 run summon rabbit ~ ~ ~
    execute if score .temp0 Game.Math matches 61 run summon salmon ~ ~ ~
    execute if score .temp0 Game.Math matches 62 run summon sheep ~ ~ ~
    execute if score .temp0 Game.Math matches 63 run summon slime ~ ~ ~
    execute if score .temp0 Game.Math matches 64 run summon sniffer ~ ~ ~
    execute if score .temp0 Game.Math matches 65 run summon snow_golem ~ ~ ~
    execute if score .temp0 Game.Math matches 66 run summon squid ~ ~ ~
    execute if score .temp0 Game.Math matches 67 run summon tropical_fish ~ ~ ~
    execute if score .temp0 Game.Math matches 68 run summon turtle ~ ~ ~
    execute if score .temp0 Game.Math matches 69 run summon villager ~ ~ ~
    execute if score .temp0 Game.Math matches 70 run summon wandering_trader ~ ~ ~
    execute if score .temp0 Game.Math matches 71 run summon wolf ~ ~ ~
    execute if score .temp0 Game.Math matches 72 run summon zombie_villager ~ ~ ~
  #END
#END

/spite

  advancement revoke @s only game:use_rune/spite
  execute if function game:system/tick/rune/use_condition run
    particle damage_indicator ~ ~ ~ 12.5 12.5 12.5 0.1 100 force
    %FILE%/damage

    execute as @e[distance=..12.5] if data entity @s Health at @s run
      data modify storage game:math temp.effects set value {poison_duration:1,poison_amplifier:0,weakness_duration:1,weakness_amplifier:0,slowness_duration:1,slowness_amplifier:0,blindness_duration:1,blindness_amplifier:0}

      execute if data entity @s active_effects[{id:"minecraft:regeneration"}] store result storage game:math temp.effects.poison_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:regeneration"}].duration
      execute if data entity @s active_effects[{id:"minecraft:regeneration"}] run data modify storage game:math temp.effects.poison_amplifier set from entity @s active_effects[{id:"minecraft:regeneration"}].amplifier
      
      execute if data entity @s active_effects[{id:"minecraft:strength"}] store result storage game:math temp.effects.weakness_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:strength"}].duration
      execute if data entity @s active_effects[{id:"minecraft:strength"}] run data modify storage game:math temp.effects.weakness_amplifier set from entity @s active_effects[{id:"minecraft:strength"}].amplifier
      
      execute if data entity @s active_effects[{id:"minecraft:speed"}] store result storage game:math temp.effects.slowness_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:speed"}].duration
      execute if data entity @s active_effects[{id:"minecraft:speed"}] run data modify storage game:math temp.effects.slowness_amplifier set from entity @s active_effects[{id:"minecraft:speed"}].amplifier

      execute if data entity @s active_effects[{id:"minecraft:night_vision"}] store result storage game:math temp.effects.blindness_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:night_vision"}].duration
      execute if data entity @s active_effects[{id:"minecraft:night_vision"}] run data modify storage game:math temp.effects.blindness_amplifier set from entity @s active_effects[{id:"minecraft:night_vision"}].amplifier
      
      %FILE%/spite/macro with storage game:math temp.effects

      damage @s 8 magic      
      particle damage_indicator ~ ~ ~ 1 1.5 1 0.1 3 force
    #END
  /macro
    effect clear @s regeneration
    effect clear @s strength
    effect clear @s speed
    effect clear @s night_vision
    $effect give @s poison $(poison_duration) $(poison_amplifier)
    $effect give @s weakness $(weakness_duration) $(weakness_amplifier)
    $effect give @s slowness $(slowness_duration) $(slowness_amplifier)
    $effect give @s blindness $(blindness_duration) $(blindness_amplifier)
  #END
#END

/life

  advancement revoke @s only game:use_rune/life
  execute if function game:system/tick/rune/use_condition run
    particle heart ~ ~ ~ 12.5 12.5 12.5 0.1 100 force
    %FILE%/damage

    execute as @e[distance=..25] if data entity @s Health at @s run
      data modify storage game:math temp.effects set value {regeneration_duration:1,regeneration_amplifier:0,strength_duration:1,strength_amplifier:0,speed_duration:1,speed_amplifier:0,strength_amplifier:0,night_vision_duration:1,night_vision_amplifier:0}

      execute if data entity @s active_effects[{id:"minecraft:poison"}] store result storage game:math temp.effects.regeneration_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:poison"}].duration
      execute if data entity @s active_effects[{id:"minecraft:poison"}] run data modify storage game:math temp.effects.regeneration_amplifier set from entity @s active_effects[{id:"minecraft:poison"}].amplifier

      execute if data entity @s active_effects[{id:"minecraft:weakness"}] store result storage game:math temp.effects.strength_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:weakness"}].duration
      execute if data entity @s active_effects[{id:"minecraft:weakness"}] run data modify storage game:math temp.effects.strength_amplifier set from entity @s active_effects[{id:"minecraft:weakness"}].amplifier

      execute if data entity @s active_effects[{id:"minecraft:slowness"}] store result storage game:math temp.effects.speed_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:slowness"}].duration
      execute if data entity @s active_effects[{id:"minecraft:slowness"}] run data modify storage game:math temp.effects.speed_amplifier set from entity @s active_effects[{id:"minecraft:slowness"}].amplifier

      execute if data entity @s active_effects[{id:"minecraft:blindness"}] store result storage game:math temp.effects.night_vision_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:blindness"}].duration
      execute if data entity @s active_effects[{id:"minecraft:blindness"}] run data modify storage game:math temp.effects.night_vision_amplifier set from entity @s active_effects[{id:"minecraft:blindness"}].amplifier
      
      %FILE%/life/macro with storage game:math temp.effects

      effect give @s minecraft:instant_health 1 1 true
      particle heart ~ ~ ~ 1 1.5 1 0.1 3 force
    #END
  /macro
    effect clear @s poison
    effect clear @s weakness
    effect clear @s slowness
    effect clear @s blindness
    $effect give @s regeneration $(regeneration_duration) $(regeneration_amplifier)
    $effect give @s strength $(strength_duration) $(strength_amplifier)
    $effect give @s speed $(speed_duration) $(speed_amplifier)
    $effect give @s night_vision $(night_vision_duration) $(night_vision_amplifier)
  #END
#END

/frightening
  advancement revoke @s only game:use_rune/frightening
  execute if function game:system/tick/rune/use_condition run

    %FILE%/damage
    damage @s 6 magic

    effect give @s darkness 15 0 true
    tag @s add Magic.Frightener

    effect give @a[distance=0.001..12.5] darkness 30 0 true
    effect give @a[distance=0.001..12.5] blindness 30 0 true

    tag @a[distance=..12.5] add Magic.Frightened


    execute store result score .temp0 Game.Math run time query gametime
    scoreboard players add .temp0 Game.Math 600
    execute store result storage game:player myData.effects.Frightener.End int 1 run scoreboard players get .temp0 Game.Math

    scoreboard players remove .temp0 Game.Math 300
    execute store result storage game:player myData.effects.Frightened.End int 1 run scoreboard players get .temp0 Game.Math

    function game:system/load/player_data_save

    scoreboard players add .temp0 Game.Math 300
    execute as @a[distance=0.001..12.5] run
      function game:system/load/player_data_load
      execute store result storage game:player myData.effects.Frightened.End int 1 run scoreboard players get .temp0 Game.Math
      function game:system/load/player_data_save
#END

/depth
  advancement revoke @s only game:use_rune/depth
  execute if function game:system/tick/rune/use_condition run
    %FILE%/damage
    effect give @s haste 120 4
    effect give @s night_vision 120 0
    effect give @s slowness 300 0
    effect give @s weakness 300 0
#END

/bravery
  advancement revoke @s only game:use_rune/bravery
  execute if function game:system/tick/rune/use_condition run
    %FILE%/damage

    execute if entity @s[tag=Magic.Coward] run damage @s 10 magic
    execute if entity @s[tag=Magic.Coward] as @e[tag=Magic.CowardiceBox,distance=..2] run %FILE%/cowardice/box/break

    effect give @s glowing 600 1 true
    effect give @s strength 180 3
    effect give @a[distance=0.1..2.5] strength 120 1

    effect clear @s slowness
#END

/cowardice
  advancement revoke @s only game:use_rune/cowardice
  execute if function game:system/tick/rune/use_condition run
    %FILE%/damage
    effect give @s invisibility 10 0 true
    effect give @s haste 30 0 true
    effect give @s speed 120 0 true

    effect give @s instant_health 1 0 true

    execute if data entity @s active_effects[{id:"minecraft:glowing"}] run damage @s 8 magic
    effect clear @s strength
    effect clear @s glowing

    fill ~-2 ~-2 ~-2 ~2 ~3 ~2 smooth_basalt replace air
    fill ~ ~ ~ ~ ~1 ~ air replace smooth_basalt



    execute store result score .temp0 Game.Math run time query gametime
    scoreboard players add .temp0 Game.Math 2400
    execute store result storage game:player myData.effects.Cowardice.End int 1.0 run scoreboard players get .temp0 Game.Math
    tag @s add Magic.Coward

    execute align xyz positioned ~0.5 ~ ~0.5 summon marker run
      tag @s add Magic.CowardiceBox
      execute store result entity @s data.End int 1.0 run scoreboard players get .temp0 Game.Math





    function game:system/load/player_data_save
  /box
    execute store result score .temp0 Game.Math run time query gametime
    scoreboard players operation .temp1 Game.Math = .temp0 Game.Math
    scoreboard players operation .temp1 Game.Math %= #5 Game.Math

    execute unless entity @a[distance=..2] if score .temp1 Game.Math matches 0 run
      data modify storage game:math temp.Pos set from entity @s Pos
      execute store result score .temp0 Game.Math run data get entity @s Pos[0]
      execute store result score .temp1 Game.Math run random value -2..2
      execute store result entity @s Pos[0] double 1 run scoreboard players operation .temp0 Game.Math += .temp1 Game.Math
      execute store result score .temp0 Game.Math run data get entity @s Pos[1]
      execute store result score .temp1 Game.Math run random value -2..3
      execute store result entity @s Pos[1] double 1 run scoreboard players operation .temp0 Game.Math += .temp1 Game.Math
      execute store result score .temp0 Game.Math run data get entity @s Pos[2]
      execute store result score .temp1 Game.Math run random value -2..2
      execute store result entity @s Pos[2] double 1 run scoreboard players operation .temp0 Game.Math += .temp1 Game.Math
      execute at @s if block ~ ~ ~ smooth_basalt run fill ~ ~ ~ ~ ~ ~ air replace smooth_basalt destroy
      execute at @s run kill @e[type=item,dx=0,dz=0,dy=0,nbt={Item:{id:"minecraft:smooth_basalt"}},limit=1]
      data modify entity @s Pos set from storage game:math temp.Pos



    execute store result score .temp0 Game.Math run time query gametime
    execute store result score .temp1 Game.Math run data get entity @s data.End
    execute if score .temp0 Game.Math > .temp1 Game.Math run %FILE%/cowardice/box/break
    
    /break
      fill ~-2 ~-2 ~-2 ~2 ~3 ~2 air replace smooth_basalt destroy
      execute at @s positioned ~-2 ~-2 ~-2 run kill @e[type=item,dx=4,dz=4,dy=5,nbt={Item:{id:"minecraft:smooth_basalt"}}]
      kill @s
#END

/spell_construction

  advancement revoke @s only game:use_rune/spell_construction

  execute if items entity @s weapon.offhand #game:blocks anchored eyes positioned ^-0.25 ^-0.25 ^2.5 align xyz positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #air unless entity @e[type=block_display,distance=..0.5,tag=Magic.Construction] run %FILE%/spell_construction/use
  execute if items entity @s weapon.offhand #game:blocks anchored eyes positioned ^-0.25 ^0.25 ^2.5 align xyz positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #air unless entity @e[type=block_display,distance=..0.5,tag=Magic.Construction] run %FILE%/spell_construction/use
  execute if items entity @s weapon.offhand #game:blocks anchored eyes positioned ^0.25 ^-0.25 ^2.5 align xyz positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #air unless entity @e[type=block_display,distance=..0.5,tag=Magic.Construction] run %FILE%/spell_construction/use
  execute if items entity @s weapon.offhand #game:blocks anchored eyes positioned ^0.25 ^0.25 ^2.5 align xyz positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #air unless entity @e[type=block_display,distance=..0.5,tag=Magic.Construction] run %FILE%/spell_construction/use

  /use
    %FILE%/damage

    data modify storage game:math temp.block set from entity @s equipment.offhand.id

    execute at @s anchored eyes positioned ^ ^ ^0.01 run summon block_display ~ ~ ~ {Tags:["Magic.Construction","Magic.new"],teleport_duration:5,interpolation_duration:5,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0.3,0.3,0.3],translation:[-.15,0,-.15]},brightness:{block:15,sky:15}}

    execute as @e[type=block_display,tag=Magic.new] run
      tag @s remove Magic.new

      execute store result score @s Altar.LockDelay run time query gametime
      scoreboard players add @s Altar.LockDelay 5

      data modify entity @s block_state.Name set from storage game:math temp.block
      data modify entity @s start_interpolation set value -1
      data modify entity @s transformation set value {left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[-0.5,0,-0.5]}

      tp @s ~ ~ ~


    execute if entity @s[gamemode=!creative] run item modify entity @s weapon.offhand game:item/decrease_by1

  /block
    execute store result score .temp0 Game.Math run time query gametime
    execute if score .temp0 Game.Math > @s Altar.LockDelay if entity @s[tag=!Magic.Phase2] run %FILE%/spell_construction/block/setblock with entity @s block_state
    execute if score .temp0 Game.Math > @s Altar.LockDelay if entity @s[tag=Magic.Phase2] run %FILE%/spell_construction/block/setair with entity @s block_state
    execute if entity @s[tag=Magic.Phase2] if block ~ ~ ~ #air run kill @s

    /setblock
      $fill ~ ~ ~ ~ ~ ~ $(Name) destroy

      tag @s add Magic.Phase2
      scoreboard players add @s Altar.LockDelay 300
      data modify entity @s interpolation_duration set value 0
      data modify entity @s transformation.scale set value [0,0,0]
    #END
    
    /setair
      $fill ~ ~ ~ ~ ~ ~ air replace $(Name) destroy
      kill @s
    #END
#END

/spell_inferno

  advancement revoke @s only game:use_rune/spell_inferno
  execute if function game:system/tick/rune/use_condition run

    %FILE%/damage
    damage @s 6 magic

    scoreboard players operation .id Game.Math = @s Player.ID
    summon item_display ~ ~ ~ {Tags:["Magic.Inferno","Magic.new"],interpolation_duration:14,item:{id:"stick",components:{"item_model":"game:resource/fire_ring"}},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[4,4,4],translation:[0,0,0]},brightness:{block:15,sky:15}}
    execute as @e[type=item_display,tag=Magic.new] run
      tag @s remove Magic.new

      scoreboard players set @s Altar.Count 0
      scoreboard players operation @s Player.ID = .id Game.Math
      execute store result score @s Altar.LockDelay run time query gametime
      scoreboard players add @s Altar.LockDelay 2

      data modify entity @s start_interpolation set value -1
      data modify entity @s transformation.scale set value [24,24,24]
  
  /fire
    execute store result score .temp0 Game.Math run time query gametime
    execute if score .temp0 Game.Math > @s Altar.LockDelay run
      scoreboard players operation .id Game.Math = @s Player.ID

      execute as @a if score @s Player.ID = .id Game.Math run tag @s add Magic.Owner

      execute store result score .y Game.Math run data get entity @s Pos[1]

      scoreboard players add @s Altar.Count 1

      execute if score @s Altar.Count matches 1 as @e[tag=!Magic.Owner,distance=0..3] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 2 as @e[tag=!Magic.Owner,distance=3..3.5] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 3 as @e[tag=!Magic.Owner,distance=3.5..4] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 4 as @e[tag=!Magic.Owner,distance=4..4.5] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 5 as @e[tag=!Magic.Owner,distance=4.5..5] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 6 as @e[tag=!Magic.Owner,distance=5..5.5] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 7 as @e[tag=!Magic.Owner,distance=5.5..6] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 8 as @e[tag=!Magic.Owner,distance=6..6.5] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 9 as @e[tag=!Magic.Owner,distance=6.5..7] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 10 as @e[tag=!Magic.Owner,distance=7..7.5] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 11 as @e[tag=!Magic.Owner,distance=7.5..8] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 12 as @e[tag=!Magic.Owner,distance=8..8.5] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 13 as @e[tag=!Magic.Owner,distance=8.5..9] if data entity @s Health run %FILE%/spell_inferno/fire/damage
      execute if score @s Altar.Count matches 14.. run kill @s

      scoreboard players add @s Altar.LockDelay 1

      tag @a remove Magic.Owner
    /damage
      execute store result score .dy Game.Math run data get entity @s Pos[1]
      scoreboard players operation .dy Game.Math -= .y Game.Math
      execute if score .dy Game.Math matches -1..1 at @s anchored eyes positioned ^ ^ ^0.001 run summon arrow ~ ~2 ~ {Tags:["Magic.Fire"],Fire:10,Invulnerable:true,damage:0,pickup:false,Motion:[0d,-5d,0d]}





  







