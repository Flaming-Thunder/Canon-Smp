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
execute if score .damage Game.Math matches ..0 run function game:system/tick/rune/break