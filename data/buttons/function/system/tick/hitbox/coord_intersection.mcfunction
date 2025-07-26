

execute as @a[tag=button.user] at @s anchored eyes positioned ^ ^ ^0.001 run tp 00000001-0000-0002-0000-000300000004 ~ ~ ~ ~ ~


execute store result score .temp2 buttons.main run data get entity @s Pos[0] 100
execute store result score .temp3 buttons.main run data get entity 00000001-0000-0002-0000-000300000004 Pos[0] 100
execute store result score .temp4 buttons.main run data get entity @a[tag=button.user,limit=1] Motion[0] 100
scoreboard players operation .temp2 buttons.main -= .temp3 buttons.main
scoreboard players operation .temp2 buttons.main += .temp4 buttons.main
scoreboard players operation .x buttons.main *= .temp2 buttons.main

execute store result score .temp2 buttons.main run data get entity @s Pos[1] 100
execute store result score .temp3 buttons.main run data get entity 00000001-0000-0002-0000-000300000004 Pos[1] 100
execute store result score .temp4 buttons.main run data get entity @a[tag=button.user,limit=1] Motion[1] 100
scoreboard players operation .temp2 buttons.main -= .temp3 buttons.main
scoreboard players operation .temp2 buttons.main += .temp4 buttons.main
scoreboard players operation .y buttons.main *= .temp2 buttons.main

execute store result score .temp2 buttons.main run data get entity @s Pos[2] 100
execute store result score .temp3 buttons.main run data get entity 00000001-0000-0002-0000-000300000004 Pos[2] 100
execute store result score .temp4 buttons.main run data get entity @a[tag=button.user,limit=1] Motion[2] 100
scoreboard players operation .temp2 buttons.main -= .temp3 buttons.main
scoreboard players operation .temp2 buttons.main += .temp4 buttons.main
scoreboard players operation .z buttons.main *= .temp2 buttons.main

scoreboard players operation .x buttons.main += .y buttons.main
scoreboard players operation .x buttons.main += .z buttons.main
scoreboard players operation .x buttons.main /= .temp1 buttons.main

execute store result score .temp2 buttons.main run attribute @a[tag=button.user,limit=1,sort=nearest] entity_interaction_range get 100 

execute if score .x buttons.main matches 0.. if score .x buttons.main <= .temp2 buttons.main run function buttons:system/tick/hitbox/coord_intersection_final
