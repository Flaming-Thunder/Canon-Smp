function game:system/tick/rune/damage
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
execute as @a[distance=0.001..12.5] run function game:system/tick/rune/internal6