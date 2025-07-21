#                          ##===========================##
#                          ||                           ||
#                          ||         On Boot Up        ||
#                          ||                           ||
#                          ##===========================##
tellraw @a[tag=Developer] [{text:"Loading Bootup..."}]

execute unless data storage game:data {Data:{Event:{CanonEvent:0b}}} unless data storage game:data {Data:{Event:{CanonEvent:1b}}} unless data storage game:data {Data:{Event:{CanonEvent:2b}}} unless data storage game:data {Data:{Event:{CanonEvent:3b}}} run data merge storage game:data {Data:{Event:{CanonEvent:0b}}}

kill @e[type=marker,tag=Magic.Math]
summon marker ~ ~ ~ {Tags:["Magic.Math"]}

forceload add 0 0

tellraw @a[tag=Developer] [{text:"Bootup Complete!",color:green}]
#                          ##===========================##
#                          ||                           ||
#                          ||        Scoreboards        ||
#                          ||                           ||
#                          ##===========================##
tellraw @a[tag=Developer] [{text:"Implementing Scoreboards..."}]

##                                     - Game -

scoreboard objectives add Game.Data dummy
scoreboard objectives add Game.Math dummy
scoreboard objectives add Game.Timer dummy

##                                    - Altar -

scoreboard objectives add Altar.CraftID dummy
scoreboard objectives add Altar.LockDelay dummy
scoreboard objectives add Altar.Count dummy

##                                    - Player -

scoreboard objectives add Player.ID dummy
scoreboard objectives add Player.Lives dummy
scoreboard objectives add Player.Helmet_Breaking dummy
scoreboard objectives add Player.Deaths dummy
scoreboard objectives add Player.Canon_Deaths dummy
scoreboard objectives add Player.Break.Score dummy

##                                    - Checks -

scoreboard objectives add Check.Player.Using_Item dummy
scoreboard objectives add Check.Player.Died deathCount

##                                  - Reset / Set -

scoreboard players set #-4063 Game.Math -4063
scoreboard players set #-2031 Game.Math -2031
scoreboard players set #-1 Game.Math -1
scoreboard players set #2 Game.Math 2
scoreboard players set #5 Game.Math 5
scoreboard players set #100 Game.Math 100
scoreboard players set #300 Game.Math 300
scoreboard players set #500 Game.Math 500
scoreboard players set #1000 Game.Math 1000


execute if score Event.Canon Game.Timer matches ..-1 run scoreboard players set Event.Canon Game.Timer 0

scoreboard players add Event.Canon.Double_Time Game.Data 0
scoreboard players set Event.Canon.Double_Time.Chance Game.Data 50
scoreboard players set Altar_Craft.Delay Game.Data 100

##                                   - Triggers -

scoreboard objectives add Dev_World trigger
scoreboard objectives add Retrive_Life trigger
scoreboard objectives add Check_Event_Time trigger

tellraw @a[tag=Developer] [{text:"Scoreboards Implemented!",color:green}]
#                          ##===========================##
#                          ||                           ||
#                          ||          Bossbars         ||
#                          ||                           ||
#                          ##===========================##
tellraw @a[tag=Developer] [{text:"Implementing Bossbars..."}]

bossbar add game:canon_event ""
bossbar set game:canon_event name [{text:"=",font:"game:custom"}]
bossbar set game:canon_event color red
bossbar set game:canon_event style progress

tellraw @a[tag=Developer] [{text:"Bossbars Implemented!",color:green}]
#                          ##===========================##
#                          ||                           ||
#                          ||     Player Statistics     ||
#                          ||                           ||
#                          ##===========================##
tellraw @a[tag=Developer] [{text:"Implementing Player Statistics..."}]

##                                    - Total -

scoreboard objectives add Player.Deaths.Total deathCount

scoreboard objectives add Player.Kill.Total minecraft.custom:minecraft.mob_kills

##                                    - Kills -

scoreboard objectives add Player.Kill.Player minecraft.custom:player_kills
scoreboard objectives add Player.Kill.Skeleton minecraft.killed:skeleton
scoreboard objectives add Player.Kill.Zombie minecraft.killed:zombie
scoreboard objectives add Player.Kill.Spider minecraft.killed:spider
scoreboard objectives add Player.Kill.Creeper minecraft.killed:creeper

##                                    - Mined -

scoreboard objectives add Player.Break.Gravel mined:minecraft.gravel
scoreboard objectives add Player.Break.Dirt mined:minecraft.dirt

scoreboard objectives add Player.Break.Stone mined:minecraft.stone
scoreboard objectives add Player.Break.Granite mined:minecraft.granite
scoreboard objectives add Player.Break.Diorite mined:minecraft.diorite
scoreboard objectives add Player.Break.Andesite mined:minecraft.andesite
scoreboard objectives add Player.Break.Deepslate mined:minecraft.deepslate
scoreboard objectives add Player.Break.Cobblestone mined:minecraft.cobblestone
scoreboard objectives add Player.Break.Cobbled_Deepslate mined:minecraft.cobbled_deepslate
scoreboard objectives add Player.Break.Tuff mined:minecraft.tuff
scoreboard objectives add Player.Break.Calcite mined:minecraft.calcite
scoreboard objectives add Player.Break.Dripstone mined:minecraft.dripstone_block

scoreboard objectives add Player.Break.Coal mined:minecraft.coal_ore
scoreboard objectives add Player.Break.Copper mined:minecraft.copper_ore
scoreboard objectives add Player.Break.Iron mined:minecraft.iron_ore
scoreboard objectives add Player.Break.Gold mined:minecraft.gold_ore
scoreboard objectives add Player.Break.Redstone mined:minecraft.redstone_ore
scoreboard objectives add Player.Break.Lapis mined:minecraft.lapis_ore
scoreboard objectives add Player.Break.Emerald mined:minecraft.emerald_ore
scoreboard objectives add Player.Break.Diamond mined:minecraft.diamond_ore

scoreboard objectives add Player.Break.Deepslate_Coal mined:minecraft.deepslate_coal_ore
scoreboard objectives add Player.Break.Deepslate_Copper mined:minecraft.deepslate_copper_ore
scoreboard objectives add Player.Break.Deepslate_Iron mined:minecraft.deepslate_iron_ore
scoreboard objectives add Player.Break.Deepslate_Gold mined:minecraft.deepslate_gold_ore
scoreboard objectives add Player.Break.Deepslate_Redstone mined:minecraft.deepslate_redstone_ore
scoreboard objectives add Player.Break.Deepslate_Lapis mined:minecraft.deepslate_lapis_ore
scoreboard objectives add Player.Break.Deepslate_Diamond mined:minecraft.deepslate_diamond_ore
scoreboard objectives add Player.Break.Deepslate_Emerald mined:minecraft.deepslate_emerald_ore


##                                     - Misc -


tellraw @a[tag=Developer] [{text:"Player Statistics Implemented!",color:green}]
#                          ##===========================##
#                          ||                           ||
#                          ||          Storages         ||
#                          ||                           ||
#                          ##===========================##
tellraw @a[tag=Developer] [{text:"Implementing Storage Data..."}]


execute unless data storage game:player data run data modify storage game:player data set value []
data modify storage game:math temp set value {}
execute store result score .temp0 Game.Math run data get storage game:player data
execute if score .temp0 Game.Math matches 30.. run data modify storage game:player data set value []



tellraw @a[tag=Developer] [{text:"Storage Data Implemented!",color:green}]
#                          ##===========================##
#                          ||                           ||
#                          ||        Magic Setup        ||
#                          ||                           ||
#                          ##===========================##
tellraw @a[tag=Developer] [{text:"Implementing Magic System..."}]


summon item_display ~ ~ ~ {Tags:["Magic.Craft"]}
loot replace entity @e[type=item_display,tag=Magic.Craft] container.0 loot game:crafts
data modify storage game:crafts craft set from entity @e[type=item_display,tag=Magic.Craft,limit=1] item.components."minecraft:custom_data".crafts
kill @e[type=item_display,tag=Magic.Craft]


tellraw @a[tag=Developer] [{text:"Magic System Implemented!",color:green}]
#                          ##===========================##
#                          ||                           ||
#                          ||       Player  Teams       ||
#                          ||                           ||
#                          ##===========================##

##                                    - Lives -
tellraw @a[tag=Developer] [{text:"Implementing Teams..."}]

function game:system/util/create_team {Class:"Default"}

/player_id
  tag @s add Game.PlayerInited
  scoreboard players operation @s Player.ID = ID.Max Player.ID
  scoreboard players add ID.Max Player.ID 1

  scoreboard players set @s Player.Lives 10
  function game:api/player_update
  
  scoreboard players set @s Player.Deaths 0
  scoreboard players set @s Check.Player.Died 0

  data modify storage game:player data append value {}
  


/player_data_load
  execute store result storage game:math temp.id int 1 run scoreboard players get @s Player.ID
  %FILE%/player_data_load/final with storage game:math temp
  /final
    $data modify storage game:player myData set from storage game:player data[$(id)]
#END

/player_data_save
  execute store result storage game:math temp.id int 1 run scoreboard players get @s Player.ID
  %FILE%/player_data_save/final with storage game:math temp

  /final
    $data modify storage game:player data[$(id)] set from storage game:player myData
#END

