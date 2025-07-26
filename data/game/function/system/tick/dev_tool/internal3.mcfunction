execute store result score .temp1 Game.Math if entity @s[tag=Dev.Invsee]
execute if score .temp1 Game.Math matches 0 run function game:system/tick/dev_tool/internal4
execute if score .temp1 Game.Math matches 1 run function game:system/tick/dev_tool/internal5