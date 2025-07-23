advancement revoke @s only game:use_devs/invsee
scoreboard players set .temp0 Game.Math 0
data modify storage game:math temp.dim set value "invsee"
execute at @s anchored eyes positioned ^ ^ ^3 positioned ~-.5 ~-.5 ~-.5 as @p[dx=0] run function game:system/tick/dev_tool/internal0
data modify storage game:math temp.dim set value "invsee"
execute if score .temp0 Game.Math matches 1 run function game:api/state/spy with storage game:math temp
execute if score .temp0 Game.Math matches 1 run loot give @s loot game:give/devs/invsee
execute if score .temp0 Game.Math matches 2 run function game:api/state/force_inventory with storage game:math temp