
execute at @s run function buttons:system/math/trigo/unit_vector

scoreboard players operation .x buttons.main = .dx buttons.main
scoreboard players operation .y buttons.main = .dy buttons.main
scoreboard players operation .z buttons.main = .dz buttons.main

execute at @a[tag=button.user] run function buttons:system/math/trigo/unit_vector

scoreboard players operation .temp1 buttons.main = .dx buttons.main
scoreboard players operation .temp1 buttons.main *= .x buttons.main

scoreboard players operation .temp2 buttons.main = .dy buttons.main
scoreboard players operation .temp2 buttons.main *= .y buttons.main
scoreboard players operation .temp1 buttons.main += .temp2 buttons.main

scoreboard players operation .temp2 buttons.main = .dz buttons.main
scoreboard players operation .temp2 buttons.main *= .z buttons.main
scoreboard players operation .temp1 buttons.main += .temp2 buttons.main

scoreboard players operation .temp1 buttons.main /= #100 buttons.main


execute unless score .temp1 buttons.main matches 0 run function buttons:system/tick/hitbox/coord_intersection


