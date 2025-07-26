
summon marker ~ ~ ~ {Tags:["Game.Math"]}




execute as @a run scoreboard players enable @s Retrive_Life
execute as @a run scoreboard players enable @s Check_Event_Time
execute as @a run scoreboard players enable @s Dev_World
execute as @a[tag=Developer] run scoreboard players enable @s Game_Scape

function game:system/tick/trigger


function game:system/world/canon_event

execute as @a[tag=!Game.PlayerInited] run function game:system/load/player_id
execute as @a at @s run %FILE%/player


execute as @e[type=item_frame,tag=Magic.Pedestal] at @s run function game:system/tick/pedistal/init
execute as @e[type=item_display,tag=Magic.Pedestal] at @s if entity @a[distance=..30] run function game:system/tick/pedistal

execute as @e[type=item_display,tag=Magic.CraftAnimation] at @s run function game:system/tick/craft/animation

execute as @e[type=marker,tag=Magic.CowardiceBox] at @s run function game:system/tick/rune/cowardice/box
execute as @e[type=block_display,tag=Magic.Construction] at @s run function game:system/tick/rune/spell_construction/block
execute as @e[type=item_display,tag=Magic.Inferno] at @s run function game:system/tick/rune/spell_inferno/fire

/player

  function game:system/load/player_data_load

  ##                                      -SPECIAL RUNE EFFECTS-
  
  execute store result score .GameTime Game.Math run time query gametime
  execute if entity @s[tag=Magic.Coward] run
    execute store result score .TimeEnd Game.Math run data get storage game:player myData.effects.Cowardice.End
    execute if score .GameTime Game.Math > .TimeEnd Game.Math run data remove storage game:player myData.effects.Cowardice
    execute if score .GameTime Game.Math > .TimeEnd Game.Math run tag @s remove Magic.Coward
  #END

  execute if entity @s[tag=Magic.Frightened] run 
    execute store result score .TimeEnd Game.Math run data get storage game:player myData.effects.Frightened.End
    execute if score .GameTime Game.Math > .TimeEnd Game.Math run data remove storage game:player myData.effects.Frightened
    execute if score .GameTime Game.Math > .TimeEnd Game.Math run tag @s remove Magic.Frightened
  #END

  execute if entity @s[tag=Magic.Frightener] run
    execute store result score .TimeEnd Game.Math run data get storage game:player myData.effects.Frightener.End
    execute if score .GameTime Game.Math > .TimeEnd Game.Math run data remove storage game:player myData.effects.Frightener
    execute if score .GameTime Game.Math > .TimeEnd Game.Math run tag @s remove Magic.Frightener
    execute unless entity @a[tag=Magic.Frightened,distance=..8] run effect give @s poison 1 0 false
  #END
  ##  
  
  execute unless data storage game:player myData.name run
    forceload add 0 0
    setblock 0 0 0 chest
    loot replace block 0 0 0 container.0 loot game:player_head
    data modify storage game:player myData.name set from block 0 0 0 Items[0].components."minecraft:profile".name
    setblock 0 0 0 air
  #END

  execute if data storage game:player myData.damage if data storage game:player myData.damageWait run %FILE%/player/damage with storage game:player myData
  execute if data storage game:player myData.damage unless data storage game:player myData.damageWait run data modify storage game:player myData.damageWait set value true
  #                            ----------------------

  execute if score @s Check.Player.Died matches 1.. run %FILE%/player/died
  # when does this get reset?
  /died

    ##                                 -PLAYER DIED FUNCTION-

    execute if entity @s[tag=Magic.Coward] run data remove storage game:player myData.effects.Cowardice
    execute if entity @s[tag=Magic.Coward] run tag @s remove Magic.Coward
    
    execute if entity @s[tag=Magic.Frightened] run data remove storage game:player myData.effects.Frightened
    execute if entity @s[tag=Magic.Frightened] run tag @s remove Magic.Frightened
    
    execute if entity @s[tag=Magic.Frightener] run data remove storage game:player myData.effects.Frightener
    execute if entity @s[tag=Magic.Frightener] run tag @s remove Magic.Frightener

    execute if data storage game:data {Data:{Event:{CanonEvent:3b}}} if predicate game:dimension/main run
      scoreboard players remove @s Player.Lives 1
      function game:api/player_update
      scoreboard players add Event.Canon.Deaths Game.Data 1
      scoreboard players add @s Player.Canon_Deaths 1
    
    scoreboard players set @s Check.Player.Died 0
  #END
  
  data modify storage game:player myData.LastSelectedItem set from entity @s SelectedItem
  function game:system/load/player_data_save

  ##                                       -PLAYER DEBUFFS-

  execute if entity @s[gamemode=!creative,gamemode=!spectator, tag=Vampirism] if predicate game:role_specific/timer_10t if predicate game:role_specific/vampirism if dimension overworld run %FILE%/player/vampirism
  /vampirism
    scoreboard players add @s Player.Helmet_Breaking 0
    +
    
    execute if score @s Player.Helmet_Breaking matches 1.. unless entity @s[nbt={equipment:{head:{components:{"minecraft:enchantments":{"minecraft:unbreaking":3}}}}}] if entity @s[nbt={equipment:{head:{}}}] run scoreboard players remove @s Player.Helmet_Breaking 4
    execute if entity @s[nbt={equipment:{head:{components:{"minecraft:enchantments":{"minecraft:unbreaking":1}}}}}] run scoreboard players add @s Player.Helmet_Breaking 2
    execute if entity @s[nbt={equipment:{head:{components:{"minecraft:enchantments":{"minecraft:unbreaking":2}}}}}] run scoreboard players add @s Player.Helmet_Breaking 3

    execute if score @s Player.Helmet_Breaking matches -10..0 run
      function game:system/util/damage_helmet
      execute unless items entity @s armor.head * run damage @s 4 on_fire
    ##END
  #END
  execute as @a[gamemode=!creative,gamemode=!spectator, tag= Aquaphobic] if predicate game:role_specific/timer_5t run %FILE%/player/aquaphobic
  /aquaphobic
    execute if predicate game:role_specific/is_not_under_block if predicate game:world/is_raining run %FILE%/player/aquaphobic/in_water
    execute if predicate game:role_specific/is_not_under_block if predicate game:world/is_thundering run %FILE%/player/aquaphobic/in_water
    execute if block ~ ~ ~ #game:waterloggable[waterlogged=true] run %FILE%/player/aquaphobic/in_water
    execute if block ~ ~ ~ water_cauldron run %FILE%/player/aquaphobic/in_water
    execute if block ~ ~ ~ water run %FILE%/player/aquaphobic/in_water
    /in_water
      damage @s 1 on_fire
    #END
  #END
  execute as @a if score @s Player.Lives matches 0 run %FILE%/player/ghostly
  /ghostly
    execute unless predicate game:input/sneak run effect give @s glowing 1 0 true
    execute if predicate game:input/sneak run effect give @s invisibility 1 0 true
    effect give @s slow_falling 1 0 true
  #END

  /damage
    $damage @s $(damage) magic
    data remove storage game:player myData.damage
    data remove storage game:player myData.damageWait
  #END
#END


execute store result score .gametime Game.Math run time query gametime

scoreboard players operation .gametime Game.Math %= State.SaveCooldown Game.Data
execute if score .gametime Game.Math matches 0 as @a run function game:api/state/backup



kill @e[type=arrow,tag=Magic.Fire,tag=Magic.ToDelete]
tag @e[type=arrow,tag=Magic.Fire] add Magic.ToDelete


clear @a[tag=!Developer] *[custom_data~{DevTool:true}]


kill @e[type=marker,tag=Game.Math]