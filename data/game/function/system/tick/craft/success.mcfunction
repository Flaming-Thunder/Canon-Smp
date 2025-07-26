data modify entity @s data.loot set from storage game:math temp.array[0].result_table
data modify entity @s data.cmd set from storage game:math temp.array[0].result_command
data modify storage game:math temp.Pos set from entity @s Pos
execute store result score .y Game.Math run data get entity @s Pos[1] 100
scoreboard players add .y Game.Math 150
execute store result storage game:math temp.Pos[1] double 0.01 run scoreboard players get .y Game.Math
tag @s add Magic.InCraft
execute as @e[type=item_display,tag=Magic.InCraft] run function game:system/tick/craft/internal0
playsound entity.evoker.cast_spell block @a ~ ~ ~ 0.5 1.1 0
playsound block.enchantment_table.use block @a ~ ~ ~ 0.2 1 0