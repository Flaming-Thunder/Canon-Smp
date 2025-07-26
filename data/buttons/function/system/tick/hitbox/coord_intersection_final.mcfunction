
execute store result score .temp1 buttons.main run data get entity 00000001-0000-0002-0000-000300000004 Pos[0] 100
execute store result score .temp2 buttons.main run data get entity 00000001-0000-0002-0000-000300000004 Pos[1] 100
execute store result score .temp3 buttons.main run data get entity 00000001-0000-0002-0000-000300000004 Pos[2] 100


scoreboard players operation .dx buttons.main *= .x buttons.main
scoreboard players operation .dx buttons.main /= #100 buttons.main
scoreboard players operation .dx buttons.main += .temp1 buttons.main

scoreboard players operation .dy buttons.main *= .x buttons.main
scoreboard players operation .dy buttons.main /= #100 buttons.main
scoreboard players operation .dy buttons.main += .temp2 buttons.main

scoreboard players operation .dz buttons.main *= .x buttons.main
scoreboard players operation .dz buttons.main /= #100 buttons.main
scoreboard players operation .dz buttons.main += .temp3 buttons.main

scoreboard players operation .temp3 buttons.main = .x buttons.main

execute at @s store result score .temp1 buttons.main run function buttons:system/math/trigo/cos
execute at @s store result score .temp2 buttons.main run function buttons:system/math/trigo/sin

execute store result score .x buttons.main run data get entity @s Pos[0] 100
execute store result score .y buttons.main run data get entity @s Pos[1] 100
execute store result score .z buttons.main run data get entity @s Pos[2] 100

scoreboard players operation .dx buttons.main -= .x buttons.main
scoreboard players operation .dy buttons.main -= .y buttons.main
scoreboard players operation .dz buttons.main -= .z buttons.main


scoreboard players operation .dx buttons.main *= .temp1 buttons.main
scoreboard players operation .dz buttons.main *= .temp2 buttons.main

scoreboard players operation .dx buttons.main += .dz buttons.main

#tellraw @a {"score":{"name":".dx","objective":"buttons.main"}}
scoreboard players operation .dot buttons.main = .dx buttons.main
scoreboard players operation .dx buttons.main /= #1000 buttons.main


execute on vehicle run data modify storage buttons:storage temp2 set from entity @s data

execute store result score .temp1 buttons.main run data get storage buttons:storage temp2.width 50000
scoreboard players add .temp1 buttons.main 10000
scoreboard players operation .temp2 buttons.main = .temp1 buttons.main
scoreboard players operation .temp2 buttons.main *= #-1 buttons.main


    #scoreboard players operation .temp3 buttons.main += .dot buttons.main
    #scoreboard players operation .temp3 buttons.main *= #100 buttons.main
    #scoreboard players operation .temp3 buttons.main /= .temp1 buttons.main
    #execute if score .temp3 buttons.main matches ..-1 run scoreboard players operation .temp3 buttons.main *= #-1 buttons.main


execute if score .dot buttons.main < .temp2 buttons.main run scoreboard players reset .dot buttons.main
execute if score .dot buttons.main > .temp1 buttons.main run scoreboard players reset .dot buttons.main


execute store result score .temp1 buttons.main run data get storage buttons:storage temp2.height 100
scoreboard players add .temp1 buttons.main 5

execute if score .dy buttons.main > .temp1 buttons.main run scoreboard players reset .dot buttons.main
execute if score .dy buttons.main matches ..-8 run scoreboard players reset .dot buttons.main

    #scoreboard players operation .temp4 buttons.main = .dy buttons.main
    #scoreboard players operation .temp4 buttons.main *= #100 buttons.main
    #scoreboard players operation .temp4 buttons.main /= .temp1 buttons.main
    #execute if score .temp4 buttons.main matches ..-1 run scoreboard players operation .temp4 buttons.main *= #-1 buttons.main
    #
    #scoreboard players operation .temp3 buttons.main += .temp4 buttons.main

execute if score .dot buttons.main matches -2147483648..2147483647 if score .temp3 buttons.main < .min buttons.main run tag @e[type=#buttons:button,tag=button.button] remove button.min
execute if score .dot buttons.main matches -2147483648..2147483647 if score .temp3 buttons.main < .min buttons.main on vehicle run tag @s add button.min
execute if score .dot buttons.main matches -2147483648..2147483647 if score .temp3 buttons.main < .min buttons.main run scoreboard players operation dx.min buttons.main = .dx buttons.main
execute if score .dot buttons.main matches -2147483648..2147483647 if score .temp3 buttons.main < .min buttons.main run scoreboard players operation dy.min buttons.main = .dy buttons.main
execute if score .dot buttons.main matches -2147483648..2147483647 if score .temp3 buttons.main < .min buttons.main run scoreboard players operation dot.min buttons.main = .dot buttons.main
execute if score .dot buttons.main matches -2147483648..2147483647 if score .temp3 buttons.main < .min buttons.main run scoreboard players operation .min buttons.main = .temp3 buttons.main



