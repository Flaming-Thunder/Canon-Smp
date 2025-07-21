scoreboard players set Craft.Success Game.Math 0
data modify storage game:math temp.array set from storage game:crafts craft

%FILE%/search_loop

execute if score Craft.Success Game.Math matches 0 run %FILE%/fail


/search_loop
  execute store result score .test Game.Math run %FILE%/search_loop/check with storage game:math temp.array[0]
  
  execute if score .test Game.Math matches 1 run %FILE%/try_recipe
  
  data remove storage game:math temp.array[0]
  execute if data storage game:math temp.array[0] unless score Craft.Success Game.Math matches 1 run %FILE%/search_loop
  
  /check
    $execute on passengers if entity @s[type=item_display,nbt={item:$(catalyst)}] run return 1
    return 0
  #END

#END



/try_recipe
  scoreboard players set count.CraftID Game.Math 0
  scoreboard players reset * Altar.CraftID
  scoreboard players set @s Altar.CraftID -1
  tag @s add Magic.CraftCenter
  
  execute at @s run %FILE%/try_recipe/set_id
  execute as @e[scores={Altar.CraftID=0..}] run say test
  
  scoreboard players set .basic Game.Math 0
  scoreboard players set .advanced Game.Math 0
  execute if data storage game:math temp.array[0].tier.basic store result score .basic Game.Math run data get storage game:math temp.array[0].tier.basic
  execute if data storage game:math temp.array[0].tier.advanced store result score .advanced Game.Math run data get storage game:math temp.array[0].tier.advanced
  scoreboard players set break.tier Game.Math 0
  execute if score .basic Game.Math matches 1.. unless entity @s[tag=Magic.Basic] run scoreboard players set break.tier Game.Math 1
  execute if score .advanced Game.Math matches 1.. unless entity @s[tag=Magic.Advanced] run scoreboard players set break.tier Game.Math 1
  execute if score .advanced Game.Math matches 1.. if entity @s[tag=Magic.Advanced] run scoreboard players set break.tier Game.Math 0
  
  scoreboard players set .shapeless Game.Math 0
  execute if data storage game:math temp.array[0].shapeless store result score .shapeless Game.Math run data get storage game:math temp.array[0].shapeless
  
  execute at @s if score break.tier Game.Math matches 0 if score .shapeless Game.Math matches 0 as @e[tag=Magic.Pedestal,scores={Altar.CraftID=0..},distance=..10] run %FILE%/try_recipe/check_shape
  execute at @s if score break.tier Game.Math matches 0 if score .shapeless Game.Math matches 1 run %FILE%/try_recipe/check_shapeless
  
  execute if score Craft.Success Game.Math matches 1 run %FILE%/success
  
  tag @e[type=item_display,tag=Magic.InCraft] remove Magic.InCraft
  tag @s remove Magic.CraftCenter
  scoreboard players reset * Altar.CraftID

  /set_id
    execute if data storage game:math temp.array[0].pedistals[0].support at @s as @e[type=item_display,tag=Magic.Pedestal,distance=..10] unless score @s Altar.CraftID matches -1.. run %FILE%/try_recipe/set_id/check_support with storage game:math temp.array[0].pedistals[0]
    execute unless data storage game:math temp.array[0].pedistals[0].support at @s as @e[type=item_display,tag=Magic.Pedestal,distance=..10] unless score @s Altar.CraftID matches -1.. run %FILE%/try_recipe/set_id/check_classic with storage game:math temp.array[0].pedistals[0]
    execute unless data storage game:math temp.array[0].pedistals[0].item at @s as @e[type=item_display,tag=Magic.Pedestal,distance=..10] unless score @s Altar.CraftID matches -1.. on passengers if entity @s[type=item_display] unless data entity @s item on vehicle run scoreboard players operation @s Altar.CraftID = count.CraftID Game.Math

    scoreboard players add count.CraftID Game.Math 1
    data remove storage game:math temp.array[0].pedistals[0]
    execute if data storage game:math temp.array[0].pedistals[0] run %FILE%/try_recipe/set_id

    /check_support
      $execute at @s on passengers if entity @s[type=item_display,nbt={item:$(item)}] if block ~ ~-0.1 ~ $(support) on vehicle run scoreboard players operation @s Altar.CraftID = count.CraftID Game.Math
    #END

    /check_classic
      $execute on passengers if entity @s[type=item_display,nbt={item:$(item)}] on vehicle run scoreboard players operation @s Altar.CraftID = count.CraftID Game.Math
    #END

  #END

  /check_shape
    data modify storage game:math temp.recipe set from storage game:math temp.array[0].recipe

    execute if score Craft.Success Game.Math matches 0 run scoreboard players set total.basic Game.Math 0
    execute if score Craft.Success Game.Math matches 0 run scoreboard players set total.advanced Game.Math 0

    execute if score Craft.Success Game.Math matches 0 store result score Craft.Success Game.Math at @s run %FILE%/try_recipe/check_shape/loop

    execute if score Craft.Success Game.Math matches 1 if score total.basic Game.Math < .basic Game.Math run scoreboard players set Craft.Success Game.Math 0
    execute if score Craft.Success Game.Math matches 1 if score total.advanced Game.Math < .advanced Game.Math run scoreboard players set Craft.Success Game.Math 0

    execute if score Craft.Success Game.Math matches 0 run tag @e[type=item_display,tag=Magic.Pedestal,distance=..20] remove Magic.InCraft

    /loop
      execute store result score .id Game.Math run data get storage game:math temp.recipe[0]
      execute unless score @s Altar.CraftID = .id Game.Math run return 0
      
      execute if entity @s[tag=Magic.Basic] run scoreboard players add total.basic Game.Math 1
      execute if entity @s[tag=Magic.Advanced] run scoreboard players add total.advanced Game.Math 1
      tag @s add Magic.InCraft
      
      data remove storage game:math temp.recipe[0]
      execute unless data storage game:math temp.recipe[0] run return 1
      execute if data storage game:math temp.recipe[0] at @s facing entity @e[type=item_display,tag=Magic.CraftCenter] feet positioned ^2 ^ ^ as @e[type=item_display,tag=Magic.Pedestal,tag=!Magic.InCraft,tag=!Magic.CraftCenter,tag=!Magic.Altar,scores={Altar.CraftID=0..},sort=nearest,limit=1,distance=..5] run return run %FILE%/try_recipe/check_shape/loop
    #END
  #END

  /check_shapeless
    data modify storage game:math temp.recipe set from storage game:math temp.array[0].recipe

    execute if score Craft.Success Game.Math matches 0 run scoreboard players set total.basic Game.Math 0
    execute if score Craft.Success Game.Math matches 0 run scoreboard players set total.advanced Game.Math 0

    execute store result score Craft.Success Game.Math run %FILE%/try_recipe/check_shapeless/loop

    execute if score Craft.Success Game.Math matches 1 if score total.basic Game.Math < .basic Game.Math run scoreboard players set Craft.Success Game.Math 0
    execute if score Craft.Success Game.Math matches 1 if score total.advanced Game.Math < .advanced Game.Math run scoreboard players set Craft.Success Game.Math 0

    /loop
      execute store result score .id Game.Math run data get storage game:math temp.recipe[0]
      tellraw @a {score:{name:".id",objective:"Game.Math"}}
      execute as @e[type=item_display,tag=Magic.Pedestal,tag=!Magic.InCraft,tag=!Magic.CraftCenter,tag=!Magic.Altar,scores={Altar.CraftID=0..},distance=..10] if score @s Altar.CraftID = .id Game.Math run tag @s add Magic.temp
      execute unless entity @e[type=item_display,tag=Magic.temp] run return 0
      
      execute as @e[type=item_display,tag=Magic.temp,limit=1] run tag @s add Magic.InCraft
      execute if entity @e[type=item_display,tag=Magic.temp,tag=Magic.InCraft,limit=1,tag=Magic.Basic] run scoreboard players add total.basic Game.Math 1
      execute if entity @e[type=item_display,tag=Magic.temp,tag=Magic.InCraft,limit=1,tag=Magic.Advanced] run scoreboard players add total.advanced Game.Math 1
      tag @e[type=item_display,tag=Magic.temp] remove Magic.temp
      
      data remove storage game:math temp.recipe[0]
      execute unless data storage game:math temp.recipe[0] run return 1
      execute if data storage game:math temp.recipe[0] run return run %FILE%/try_recipe/check_shapeless/loop
    #END

  #END

#END

/success
  data modify entity @s data.loot set from storage game:math temp.array[0].result_table
  data modify storage game:math temp.Pos set from entity @s Pos
  
  execute store result score .y Game.Math run data get entity @s Pos[1] 100
  scoreboard players add .y Game.Math 150
  execute store result storage game:math temp.Pos[1] double 0.01 run scoreboard players get .y Game.Math
  
  tag @s add Magic.InCraft
  execute as @e[type=item_display,tag=Magic.InCraft] run
    execute if entity @s[tag=Magic.Simple] at @s positioned ~ ~1 ~ on passengers if entity @s[type=item_display] run %FILE%/animation/summon with entity @s
    execute if entity @s[tag=Magic.Basic,tag=!Magic.Altar] at @s positioned ~ ~1.5 ~ on passengers if entity @s[type=item_display] run %FILE%/animation/summon with entity @s
    execute if entity @s[tag=Magic.Basic,tag=Magic.Altar] at @s positioned ~ ~1 ~ on passengers if entity @s[type=item_display] run %FILE%/animation/summon with entity @s

    scoreboard players operation @s Altar.LockDelay = Altar_Craft.Delay Game.Data
    execute on passengers if entity @s[type=item_display] run data remove entity @s item
    say delete
  #END

  playsound entity.evoker.cast_spell block @a ~ ~ ~ 0.5 1.1 0
  playsound block.enchantment_table.use block @a ~ ~ ~ 0.2 1 0
#END

/fail
  function game:system/tick/pedistal/drop_item

  particle explosion ~ ~1 ~ 0.5 0.5 0.5 0.1 10 normal
  playsound entity.generic.explode block @a ~ ~1 ~ 1 1 0.5
#END

/animation
  /summon
    $summon item_display ~ ~ ~ {Tags:["Magic.CraftAnimation","Magic.new"],item:$(item),teleport_duration:1,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0.5,0.5,0.5],translation:[0,0,0]}}
    execute as @e[type=item_display,tag=Magic.new] run
      tag @s remove Magic.new
      data modify entity @s data.AnimationCenter set from storage game:math temp.Pos
      scoreboard players operation @s Altar.LockDelay = Altar_Craft.Delay Game.Data
      execute store result score .temp Game.Math run random value 0..1
      execute if score .temp Game.Math matches 1 run tag @s add Magic.AnimationInversed
    #END
  #END

  execute at @s run particle enchant ~ ~ ~ 0 0 0 0 1 normal
  
  data modify entity @e[type=marker,tag=Game.Math,limit=1] Pos set from entity @s data.AnimationCenter
  
  execute store result score .temp0 Game.Math run data get entity @s data.AnimationCenter[1] 100
  scoreboard players operation .temp1 Game.Math = @s Altar.LockDelay
  scoreboard players operation .temp1 Game.Math *= #300 Game.Math
  scoreboard players operation .temp1 Game.Math /= Altar_Craft.Delay Game.Data
  scoreboard players remove .temp1 Game.Math 300
  scoreboard players operation .temp1 Game.Math *= #-1 Game.Math
  
  scoreboard players operation .temp0 Game.Math += .temp1 Game.Math
  execute store result entity @e[type=marker,tag=Game.Math,limit=1] Pos[1] double 0.01 run scoreboard players get .temp0 Game.Math
  
  scoreboard players operation .temp0 Game.Math = @s Altar.LockDelay
  scoreboard players operation .temp0 Game.Math *= #100 Game.Math
  scoreboard players operation .temp0 Game.Math /= Altar_Craft.Delay Game.Data
  
  
  execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches 80.. at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^0.1 ^ ^0.01
  execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches 80.. at @s run rotate @s ~-5 ~
  
  execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches 40..79 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^0.15 ^ ^0.045
  execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches 40..79 at @s run rotate @s ~-7.5 ~
  
  execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches ..40 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^0.2 ^ ^0.15
  execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches ..40 at @s run rotate @s ~-15 ~
  
  
  
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 80.. at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.1 ^ ^0.01
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 80.. at @s run rotate @s ~5 ~
  
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 60..79 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.125 ^ ^0.03
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 60..79 at @s run rotate @s ~6.25 ~
  
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 40..59 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.15 ^ ^0.045
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 40..59 at @s run rotate @s ~7.5 ~
  
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 25..39 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.2 ^ ^0.15
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 25..39 at @s run rotate @s ~10 ~
  
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 10..24 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.22 ^ ^0.18
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 10..24 at @s run rotate @s ~15 ~
  
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches ..9 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.28 ^ ^0.2
  execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches ..9 at @s run rotate @s ~20 ~
  
  
  execute if score .temp0 Game.Math matches 80 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
  execute if score .temp0 Game.Math matches 60 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
  execute if score .temp0 Game.Math matches 40 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
  execute if score .temp0 Game.Math matches 25 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
  execute if score .temp0 Game.Math matches 10 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
  execute if score .temp0 Game.Math matches 5 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
  
  execute if score .temp0 Game.Math matches 2 at @s run particle end_rod ~ ~ ~ 0 0 0 0.2 10 normal
  
  execute if score .temp0 Game.Math matches 80 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 0.7 0
  execute if score .temp0 Game.Math matches 60 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 0.8 0
  execute if score .temp0 Game.Math matches 40 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 0.9 0
  execute if score .temp0 Game.Math matches 25 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 1.0 0
  execute if score .temp0 Game.Math matches 10 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 1.1 0
  execute if score .temp0 Game.Math matches 5 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 1.2 0
  execute if score .temp0 Game.Math matches 2 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 1.2 0
  
  
  execute if score @s Altar.LockDelay matches 0 at @s run
    kill @s
    particle flash ~ ~ ~
    playsound block.enchantment_table.use block @a ~ ~ ~ 0.1 1 0
    playsound minecraft:entity.evoker.cast_spell block @a ~ ~ ~ 0.15 1 0
  #END


  scoreboard players remove @s Altar.LockDelay 1
#END

