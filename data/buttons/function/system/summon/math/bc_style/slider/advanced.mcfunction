
data modify storage buttons:storage temp.Tags append value "button.advanced"

execute store result storage buttons:storage temp.w0 float 0.008000 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w1 float 0.004500 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w2 float 0.005000 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w3 float 0.015 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w4 float 0.002500 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w5 float 0.02 run data get storage buttons:storage temp.w 100

execute store result storage buttons:storage temp.h0 float 0.008000 run data get storage buttons:storage temp.h 100
execute store result storage buttons:storage temp.h1 float 0.004500 run data get storage buttons:storage temp.h 100
execute store result storage buttons:storage temp.h2 float 0.005000 run data get storage buttons:storage temp.h 100
execute store result storage buttons:storage temp.h3 float 0.015000 run data get storage buttons:storage temp.h 100
execute store result storage buttons:storage temp.h4 float 0.002500 run data get storage buttons:storage temp.h 100

execute store result score .temp0 buttons.main run data get storage buttons:storage temp.score.inc
execute store result score .temp1 buttons.main run data get storage buttons:storage temp.w 1000
execute store result score .temp2 buttons.main run data get storage buttons:storage temp.score.max
execute store result score .temp3 buttons.main run data get storage buttons:storage temp.score.min
scoreboard players operation .temp0 buttons.main *= .temp1 buttons.main
scoreboard players operation .temp2 buttons.main -= .temp3 buttons.main
scoreboard players add .temp2 buttons.main 1
scoreboard players operation .temp0 buttons.main /= .temp2 buttons.main
scoreboard players remove .temp0 buttons.main 100
execute store result storage buttons:storage temp.w6 float 0.001 run scoreboard players get .temp0 buttons.main
execute if data storage buttons:storage temp.bc_box.cursor_width run data modify storage buttons:storage temp.w6 set from storage buttons:storage temp.bc_box.cursor_width


function buttons:system/summon/slider_advanced with storage buttons:storage temp
