
execute store result score .temp0 buttons.main run data get storage buttons:storage temp2.components."minecraft:lore"


execute if score .temp0 buttons.main matches 16.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 15 value "\n "
execute if score .temp0 buttons.main matches 15.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 14 value "\n "
execute if score .temp0 buttons.main matches 14.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 13 value "\n "
execute if score .temp0 buttons.main matches 13.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 12 value "\n "
execute if score .temp0 buttons.main matches 12.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 11 value "\n "
execute if score .temp0 buttons.main matches 11.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 10 value "\n "
execute if score .temp0 buttons.main matches 10.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 9 value "\n "
execute if score .temp0 buttons.main matches 9.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 8 value "\n "
execute if score .temp0 buttons.main matches 8.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 7 value "\n "
execute if score .temp0 buttons.main matches 7.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 6 value "\n "
execute if score .temp0 buttons.main matches 6.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 5 value "\n "
execute if score .temp0 buttons.main matches 5.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 4 value "\n "
execute if score .temp0 buttons.main matches 4.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 3 value "\n "
execute if score .temp0 buttons.main matches 3.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 2 value "\n "
execute if score .temp0 buttons.main matches 2.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 1 value "\n "



execute unless data storage buttons:storage temp2.components."minecraft:item_name" unless data storage buttons:storage temp2.components."minecraft:custom_name" run data modify storage buttons:storage temp2.components."minecraft:item_name" set from storage buttons:storage temp2.id
execute unless data storage buttons:storage temp2.components."minecraft:item_name" if data storage buttons:storage temp2.components."minecraft:custom_name" run data modify storage buttons:storage temp2.components."minecraft:item_name" set from storage buttons:storage temp2.components."minecraft:custom_name"
data modify storage buttons:storage temp2.components."minecraft:lore" prepend from storage buttons:storage temp2.components."minecraft:item_name"
execute if score .temp0 buttons.main matches 1.. run data modify storage buttons:storage temp2.components."minecraft:lore" insert 1 value "\n "


execute store result score .temp1 buttons.main run data get storage buttons:storage temp.size 100
execute store result score .temp2 buttons.main run data get storage buttons:storage temp.size 50
scoreboard players operation .dx buttons.main += .temp2 buttons.main
scoreboard players operation .dx buttons.main /= .temp1 buttons.main
scoreboard players operation .dx buttons.main *= .temp1 buttons.main
#scoreboard players operation .dy buttons.main += .temp2 buttons.main
scoreboard players operation .dy buttons.main /= .temp1 buttons.main
scoreboard players operation .dy buttons.main *= .temp1 buttons.main
#scoreboard players operation .dy buttons.main += .temp2 buttons.main

scoreboard players operation .temp1 buttons.main = .temp0 buttons.main
scoreboard players add .temp1 buttons.main 1
execute store result score .temp2 buttons.main run data get entity @s transformation.scale[1] 100
scoreboard players operation .temp1 buttons.main *= .temp2 buttons.main
scoreboard players operation .temp1 buttons.main /= #4 buttons.main
scoreboard players operation .dy buttons.main -= .temp1 buttons.main
scoreboard players add .dy buttons.main 5

data modify storage buttons:storage temp.translation set value [0,0]
execute store result storage buttons:storage temp.translation[0] float 0.01 run scoreboard players get .dx buttons.main
execute store result score .temp2 buttons.main run data modify storage buttons:storage temp.translation[0] set from entity @s transformation.translation[0]
execute store result storage buttons:storage temp.translation[1] float 0.01 run scoreboard players get .dy buttons.main
execute store result score .temp3 buttons.main run data modify storage buttons:storage temp.translation[1] set from entity @s transformation.translation[1]


#

execute if score .temp2 buttons.main matches 1 store result entity @s transformation.translation[0] float 0.01 run scoreboard players get .dx buttons.main
execute if score .temp3 buttons.main matches 1 store result entity @s transformation.translation[1] float 0.01 run scoreboard players get .dy buttons.main





setblock 0 0 0 oak_sign{front_text:{messages:["","","",""]}}

data modify block 0 0 0 front_text.messages[0] set from storage buttons:storage temp2.components."minecraft:lore"
execute store result score .temp1 buttons.main run data modify block 0 0 0 front_text.messages[0] set from entity @s text
execute if score .temp1 buttons.main matches 1 run data modify entity @s text set from storage buttons:storage temp2.components."minecraft:lore"

setblock 0 0 0 air



