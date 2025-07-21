data modify storage game:math temp.Pos set from entity @s Pos
execute store result score .temp0 Game.Math run data get entity @s Pos[0]
execute store result score .temp1 Game.Math run random value -2..2
execute store result entity @s Pos[0] double 1 run scoreboard players operation .temp0 Game.Math += .temp1 Game.Math
execute store result score .temp0 Game.Math run data get entity @s Pos[1]
execute store result score .temp1 Game.Math run random value -2..3
execute store result entity @s Pos[1] double 1 run scoreboard players operation .temp0 Game.Math += .temp1 Game.Math
execute store result score .temp0 Game.Math run data get entity @s Pos[2]
execute store result score .temp1 Game.Math run random value -2..2
execute store result entity @s Pos[2] double 1 run scoreboard players operation .temp0 Game.Math += .temp1 Game.Math
execute at @s if block ~ ~ ~ smooth_basalt run fill ~ ~ ~ ~ ~ ~ air replace smooth_basalt destroy
execute at @s run kill @e[type=item,dx=0,dz=0,dy=0,nbt={Item:{id:"minecraft:smooth_basalt"}},limit=1]
data modify entity @s Pos set from storage game:math temp.Pos