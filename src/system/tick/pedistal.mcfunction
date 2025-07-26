execute on passengers if entity @s[type=item_display] run data modify storage game:math temp.item set from entity @s item
execute on passengers if entity @s[type=item_display] store result score .haveItem Game.Math if data entity @s item
execute if score .haveItem Game.Math matches 0 run data remove storage game:math temp.item

execute store result score .isAltar Game.Math if entity @s[tag=Magic.Altar]


fill ~ ~ ~ ~ ~ ~ air destroy

execute if block ~ ~-0.5 ~ #air run %FILE%/remove

execute unless score @s Altar.LockDelay matches 1.. on passengers if entity @s[type=interaction] run
  execute on target run tag @s add Magic.Target

  execute if data entity @s attack on vehicle if score .haveItem Game.Math matches 1 run %FILE%/drop_item
  execute if data entity @s attack on vehicle if score .haveItem Game.Math matches 0 run %FILE%/remove

  scoreboard players set .temp0 Game.Math 0
  execute if score .haveItem Game.Math matches 1 on target if predicate game:input/sneak unless items entity @s weapon.mainhand * run scoreboard players set .temp0 Game.Math 1
  execute if score .haveItem Game.Math matches 1 on target if predicate game:input/sneak if entity @s[nbt={SelectedItem:{count:1}}] run scoreboard players set .temp0 Game.Math 2
  execute if score .temp0 Game.Math matches 1 on vehicle on passengers if entity @s[type=item_display] run
    item replace entity @a[tag=Magic.Target,limit=1] weapon.mainhand from entity @s container.0
    data remove entity @s item
  #END
  execute if score .temp0 Game.Math matches 2 on vehicle on passengers if entity @s[type=item_display] run
    execute as @a[tag=Magic.Target,limit=1] run data modify storage game:math temp.item2 set from entity @s SelectedItem
    item replace entity @a[tag=Magic.Target,limit=1] weapon.mainhand from entity @s container.0
    data modify entity @s item set from storage game:math temp.item2
  #END

  execute if score .temp0 Game.Math matches 0 on target run data modify storage game:math temp.item2 set from entity @s SelectedItem
  execute if score .temp0 Game.Math matches 0 on target unless data entity @s SelectedItem run data remove storage game:math temp.item2
  execute if score .temp0 Game.Math matches 0 on target if entity @s[gamemode=!creative] run item modify entity @s weapon.mainhand game:item/decrease_by1
  execute if score .temp0 Game.Math matches 0 if data entity @s interaction if data storage game:math temp.item2 on vehicle if score .haveItem Game.Math matches 1 run %FILE%/drop_item
  execute if score .temp0 Game.Math matches 0 if data entity @s interaction if data storage game:math temp.item2 on vehicle on passengers if entity @s[type=item_display] run
    data modify storage game:math temp.item2.count set value 1
    data modify entity @s item set from storage game:math temp.item2
    execute if score .isAltar Game.Math matches 1 if data storage game:math temp.item2.components."minecraft:custom_data".catalyst on vehicle run function game:system/tick/craft
  #END

  tag @a remove Magic.Target
#END

execute on passengers if entity @s[type=interaction] run
  execute if data entity @s interaction run data remove entity @s interaction
  execute if data entity @s attack run data remove entity @s attack
#END


execute if score @s Altar.LockDelay matches 0 if data entity @s data.loot at @s positioned ~ ~4 ~ if data entity @s data.loot run %FILE%/craft_result with entity @s data
execute if score @s Altar.LockDelay matches 0 if data entity @s data.loot at @s positioned ~ ~4 ~ if data entity @s data.cmd run %FILE%/craft_function with entity @s data

execute on passengers if entity @s[type=item_display] at @s run rotate @s ~2 ~

execute if score @s Altar.LockDelay matches 0.. run scoreboard players remove @s Altar.LockDelay 1

%FILE%/support_display

execute store result score .temp0 Game.Math run random value 0..9
execute if score .temp0 Game.Math matches 0 run %FILE%/ambiant_particle

/craft_result
  $loot spawn ~ ~ ~ loot $(loot)
#END

/craft_function
  $$(cmd)
#END

/drop_item
  execute if entity @s[tag=Magic.Simple] positioned ~ ~1 ~ on passengers if entity @s[type=item_display] run %FILE%/drop_item/macro with entity @s
  execute if entity @s[tag=Magic.Basic,tag=Magic.Altar] positioned ~ ~1 ~ on passengers if entity @s[type=item_display] run %FILE%/drop_item/macro with entity @s
  execute if entity @s[tag=Magic.Basic,tag=!Magic.Altar] positioned ~ ~1.5 ~ on passengers if entity @s[type=item_display] run %FILE%/drop_item/macro with entity @s
  /macro
    $summon item ~ ~ ~ {PickupDelay:10,Item:$(item)}
    data remove entity @s item
  #END
#END

/remove
  execute if entity @s[tag=!Magic.Altar,tag=Magic.Simple] run loot spawn ~ ~ ~ loot game:give/pedestal/simple
  execute if entity @s[tag=!Magic.Altar,tag=Magic.Basic] run loot spawn ~ ~ ~ loot game:give/pedestal/basic
  execute if entity @s[tag=Magic.Altar,tag=Magic.Simple] run loot spawn ~ ~ ~ loot game:give/altar/simple
  execute if entity @s[tag=Magic.Altar,tag=Magic.Basic] run loot spawn ~ ~ ~ loot game:give/altar/basic
  
  execute as @e[type=block_display,limit=1,distance=..0.1,tag=Magic.PedestalHitbox] run %FILE%/remove/hitbox
  execute positioned ~ ~0.125 ~ as @e[type=block_display,limit=1,distance=..0.1,tag=Magic.PedestalHitbox] run %FILE%/remove/hitbox
  execute positioned ~ ~0.625 ~ as @e[type=block_display,limit=1,distance=..0.1,tag=Magic.PedestalHitbox] run %FILE%/remove/hitbox
  
  execute if score .haveItem Game.Math matches 1 run %FILE%/drop_item
  
  execute on passengers run kill @s
  kill @s

  /hitbox
    tp @s ~ -100 ~
    execute on passengers run kill @s
    kill @s
  #END

#END

/support_display
  execute unless data entity @s item.components."minecraft:custom_model_data".strings[1] run data modify entity @s item.components."minecraft:custom_model_data".strings[1] set value "Default"
  execute unless block ~ ~ ~ #game:pedistal_support/all run data modify entity @s item.components."minecraft:custom_model_data".strings[1] set value "Default"

  execute if block ~ ~ ~ #game:pedistal_support/hot run data modify entity @s item.components."minecraft:custom_model_data".strings[1] set value "Hot"
  execute if block ~ ~ ~ #game:pedistal_support/cold run data modify entity @s item.components."minecraft:custom_model_data".strings[1] set value "Cold"
#END

/ambiant_particle
  execute if entity @s[tag=Magic.Altar] run particle falling_dust{block_state:"purpur_block"} ~ ~1.45 ~ 0.2 0.3 0.2 0.03 1 normal
  execute if entity @s[tag=!Magic.Altar,tag=Magic.Simple] run particle falling_dust{block_state:"purpur_block"} ~ ~1.45 ~ 0.2 0.3 0.2 0.03 1 normal
  execute if entity @s[tag=!Magic.Altar,tag=Magic.Basic] run particle falling_dust{block_state:"purpur_block"} ~ ~1.95 ~ 0.2 0.3 0.2 0.03 1 normal
#END

/init
  scoreboard players set .temp0 Game.Math 0

  execute if entity @s[tag=Magic.Simple] align xyz unless entity @a[dx=0,dz=0,dy=0,gamemode=!spectator] positioned ~0.5 ~ ~0.5 unless entity @e[type=item_display,tag=Magic.Pedestal,distance=..0.51] run
    execute if entity @s[tag=Magic.Altar] run summon item_display ~ ~ ~ {Tags:["Magic.Pedestal","Magic.Simple","Magic.Altar"],brightness:{block:15,sky:15},item:{id:"nether_star",components:{"!enchantment_glint_override":{},"custom_model_data":{strings:["1 Altar","Default"]}}},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[0,0.5,0]},Passengers:[{id:"item_display",brightness:{block:15,sky:15},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0.5,0.5,0.5],translation:[0,1.45,0]},teleport_duration:1},{id:"interaction",width:1,height:1.1}]}
    execute if entity @s[tag=!Magic.Altar] run summon item_display ~ ~ ~ {Tags:["Magic.Pedestal","Magic.Simple"],brightness:{block:15,sky:15},item:{id:"nether_star",components:{"!enchantment_glint_override":{},"custom_model_data":{strings:["1 Pedistal","Default"]}}},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[0,0.5,0]},Passengers:[{id:"item_display",brightness:{block:15,sky:15},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0.5,0.5,0.5],translation:[0,1.45,0]},teleport_duration:1},{id:"interaction",width:1,height:1.1}]}
    summon block_display ~ ~ ~ {Tags:["Magic.PedestalHitbox"],Passengers:[{id:"shulker",PersistenceRequired:1b,attributes:[{id:"scale",base:0.875}],Silent:1b,Invulnerable:1b,DeathLootTable:"",NoAI:1b,active_effects:[{id:"invisibility",amplifier:255,duration:-1,show_particles:false}]}]}
    summon block_display ~ ~0.125 ~ {Tags:["Magic.PedestalHitbox"],Passengers:[{id:"shulker",PersistenceRequired:1b,attributes:[{id:"scale",base:0.875}],Silent:1b,Invulnerable:1b,DeathLootTable:"",NoAI:1b,active_effects:[{id:"invisibility",amplifier:255,duration:-1,show_particles:false}]}]}
    scoreboard players set .temp0 Game.Math 1
  #END

  execute if entity @s[tag=Magic.Basic] align xyz unless entity @a[dx=0,dz=0,dy=0,gamemode=!spectator] positioned ~0.5 ~ ~0.5 unless entity @e[type=item_display,tag=Magic.Pedestal,distance=..0.51] run 
    execute if entity @s[tag=Magic.Altar] run summon item_display ~ ~ ~ {Tags:["Magic.Pedestal","Magic.Basic","Magic.Altar"],brightness:{block:15,sky:15},item:{id:"nether_star",components:{"!enchantment_glint_override":{},"custom_model_data":{strings:["2 Altar","Default"]}}},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[0,0.5,0]},Passengers:[{id:"item_display",brightness:{block:15,sky:15},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0.5,0.5,0.5],translation:[0,1.45,0]},teleport_duration:1},{id:"interaction",width:1,height:1.1}]}
    execute if entity @s[tag=!Magic.Altar] run summon item_display ~ ~ ~ {Tags:["Magic.Pedestal","Magic.Basic"],brightness:{block:15,sky:15},item:{id:"nether_star",components:{"!enchantment_glint_override":{},"custom_model_data":{strings:["2 Pedistal","Default"]}}},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[0,0.5,0]},Passengers:[{id:"item_display",brightness:{block:15,sky:15},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0.5,0.5,0.5],translation:[0,1.95,0]},teleport_duration:1},{id:"interaction",width:1,height:1.6}]}
    summon block_display ~ ~ ~ {Tags:["Magic.PedestalHitbox"],Passengers:[{id:"shulker",PersistenceRequired:1b,attributes:[{id:"scale",base:0.875}],Silent:1b,Invulnerable:1b,DeathLootTable:"",NoAI:1b,active_effects:[{id:"invisibility",amplifier:255,duration:-1,show_particles:false}]}]}
    execute if entity @s[tag=Magic.Altar] run summon block_display ~ ~0.125 ~ {Tags:["Magic.PedestalHitbox"],Passengers:[{id:"shulker",PersistenceRequired:1b,attributes:[{id:"scale",base:0.875}],Silent:1b,Invulnerable:1b,DeathLootTable:"",NoAI:1b,active_effects:[{id:"invisibility",amplifier:255,duration:-1,show_particles:false}]}]}
    execute if entity @s[tag=!Magic.Altar] run summon block_display ~ ~0.625 ~ {Tags:["Magic.PedestalHitbox"],Passengers:[{id:"shulker",PersistenceRequired:1b,attributes:[{id:"scale",base:0.875}],Silent:1b,Invulnerable:1b,DeathLootTable:"",NoAI:1b,active_effects:[{id:"invisibility",amplifier:255,duration:-1,show_particles:false}]}]}
    scoreboard players set .temp0 Game.Math 1
  #END
  
  execute if score .temp0 Game.Math matches 0 run
    execute if entity @s[tag=Magic.Altar,tag=Magic.Basic] run loot spawn ~ ~ ~ loot game:give/altar/basic
    execute if entity @s[tag=Magic.Altar,tag=Magic.Simple] run loot spawn ~ ~ ~ loot game:give/altar/simple
    execute if entity @s[tag=!Magic.Altar,tag=Magic.Basic] run loot spawn ~ ~ ~ loot game:give/pedestal/basic
    execute if entity @s[tag=!Magic.Altar,tag=Magic.Simple] run loot spawn ~ ~ ~ loot game:give/pedestal/simple

  kill @s
#END

