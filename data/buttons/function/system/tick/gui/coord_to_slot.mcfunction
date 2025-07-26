execute store result score .temp0 buttons.main run data get storage buttons:storage temp.size 100
execute store result score .temp1 buttons.main run data get storage buttons:storage temp.dim[0]
scoreboard players operation .temp2 buttons.main = .dy buttons.main
scoreboard players operation .temp3 buttons.main = .dx buttons.main
execute store result score .temp4 buttons.main run data get storage buttons:storage temp.dim[0] 0.5
execute store result score .temp5 buttons.main run data get storage buttons:storage temp.dim[1]
execute store result score .temp6 buttons.main run data get storage buttons:storage temp.size 50

#scoreboard players operation .temp2 buttons.main -= .temp6 buttons.main
scoreboard players operation .temp2 buttons.main /= .temp0 buttons.main
scoreboard players operation .temp2 buttons.main -= .temp5 buttons.main
scoreboard players operation .temp2 buttons.main *= #-1 buttons.main
scoreboard players remove .temp2 buttons.main 1
execute if score .temp2 buttons.main matches ..-1 run scoreboard players set .temp2 buttons.main 0
scoreboard players operation .temp2 buttons.main *= .temp1 buttons.main


scoreboard players operation .temp3 buttons.main += .temp6 buttons.main
scoreboard players operation .temp3 buttons.main /= .temp0 buttons.main
scoreboard players operation .temp3 buttons.main += .temp4 buttons.main
scoreboard players operation .temp3 buttons.main += .temp2 buttons.main

#scoreboard players operation .temp1 buttons.main %= #2 buttons.main
#scoreboard players operation .temp3 buttons.main += .temp1 buttons.main

execute store result storage buttons:storage temp.slot int 1.0 run scoreboard players get .temp3 buttons.main

#tellraw @a "\n"
#tellraw @a {score:{name:".dy",objective:"buttons.main"}}
#tellraw @a {score:{name:".dx",objective:"buttons.main"}}
#tellraw @a {score:{name:".temp2",objective:"buttons.main"}}
#tellraw @a {score:{name:".temp3",objective:"buttons.main"}}
