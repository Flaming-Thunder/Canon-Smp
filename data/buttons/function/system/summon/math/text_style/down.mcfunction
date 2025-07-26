execute store result score .temp0 buttons.main run data get storage buttons:storage temp.text_box.size -100
scoreboard players add .temp0 buttons.main 100
execute store result score .temp1 buttons.main run data get storage buttons:storage temp.h 100
scoreboard players operation .temp1 buttons.main *= .temp0 buttons.main
execute store result storage buttons:storage temp.h8 float 0.00001250 run scoreboard players get .temp1 buttons.main
