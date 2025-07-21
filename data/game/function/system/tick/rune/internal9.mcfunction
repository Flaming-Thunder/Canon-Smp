function game:system/tick/rune/damage
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
execute align xyz positioned ~0.5 ~ ~0.5 summon marker run function game:system/tick/rune/internal10
function game:system/load/player_data_save