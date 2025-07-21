execute store result score .damage Game.Math run data get entity @s equipment.feet.components."minecraft:damage"
execute store result score .max_damage Game.Math run data get entity @s equipment.feet.components."minecraft:max_damage"
execute unless entity @s[gamemode=creative] run scoreboard players add .damage Game.Math 1
scoreboard players operation .damage Game.Math -= .max_damage Game.Math
scoreboard players operation .damage Game.Math *= #-4063 Game.Math
scoreboard players operation .damage Game.Math /= .max_damage Game.Math
item modify entity @s armor.feet game:item/damage
execute if score .damage Game.Math matches ..0 run item replace entity @s armor.feet with air