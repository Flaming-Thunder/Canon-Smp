execute store result score .temp0 Game.Math run time query gametime
scoreboard players operation .temp1 Game.Math = .temp0 Game.Math
scoreboard players operation .temp1 Game.Math %= #5 Game.Math
execute unless entity @a[distance=..2] if score .temp1 Game.Math matches 0 run function game:system/tick/rune/internal11
execute store result score .temp0 Game.Math run time query gametime
execute store result score .temp1 Game.Math run data get entity @s data.End
execute if score .temp0 Game.Math > .temp1 Game.Math run function game:system/tick/rune/cowardice/box/break