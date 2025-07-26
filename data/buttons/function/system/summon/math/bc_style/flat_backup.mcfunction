
data modify storage buttons:storage temp.Tags append value "button.flat"


execute store result storage buttons:storage temp.w9 float 0.08 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.h9 float 0.04 run data get storage buttons:storage temp.h 100


execute store result storage buttons:storage temp.h2 float 0.005 run data get storage buttons:storage temp.h 100


execute store result storage buttons:storage temp.w1 float 0.001 run data get storage buttons:storage temp.w 100



execute store result score .temp0 buttons.main run data get storage buttons:storage temp.border_coeff 100
execute store result score .temp1 buttons.main run data get storage buttons:storage temp.h 100
scoreboard players operation .temp0 buttons.main *= .temp1 buttons.main
execute store result storage buttons:storage temp.h3 float 0.0001 run scoreboard players get .temp0 buttons.main


execute store result score .temp2 buttons.main run data get storage buttons:storage temp.h3 2000

execute store result score .temp1 buttons.main run data get storage buttons:storage temp.w 1000
scoreboard players operation .temp1 buttons.main -= .temp2 buttons.main
execute store result storage buttons:storage temp.w4 float 0.008 run scoreboard players get .temp1 buttons.main

execute store result score .temp1 buttons.main run data get storage buttons:storage temp.h 1000
scoreboard players operation .temp1 buttons.main -= .temp2 buttons.main
execute store result storage buttons:storage temp.h4 float 0.004 run scoreboard players get .temp1 buttons.main
execute store result storage buttons:storage temp.h1 float 0.001 run scoreboard players get .temp1 buttons.main

execute store result storage buttons:storage temp.w3 float 0.000125 run data get storage buttons:storage temp.w4 100


execute store result storage buttons:storage temp.h5 float 0.028571 run data get storage buttons:storage temp.h 100
execute store result score .temp0 buttons.main run data get storage buttons:storage temp.text_box.size 100
execute store result score .temp1 buttons.main run data get storage buttons:storage temp.h5 100
scoreboard players operation .temp0 buttons.main *= .temp1 buttons.main
execute store result storage buttons:storage temp.h5 float 0.0001 run scoreboard players get .temp0 buttons.main




data modify storage buttons:storage temp.temp set from storage buttons:storage temp.text_box.style
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "center"
execute if score .temp0 buttons.main matches 0 run scoreboard players set .style buttons.main 1

data modify storage buttons:storage temp.temp set from storage buttons:storage temp.text_box.style
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "down"
execute if score .temp0 buttons.main matches 0 run scoreboard players set .style buttons.main 2

data modify storage buttons:storage temp.temp set from storage buttons:storage temp.text_box.style
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "up"
execute if score .temp0 buttons.main matches 0 run scoreboard players set .style buttons.main 3

data modify storage buttons:storage temp.temp set from storage buttons:storage temp.text_box.style
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "on"
execute if score .temp0 buttons.main matches 0 run scoreboard players set .style buttons.main 4


execute if score .style buttons.main matches 1 run function buttons:system/summon/math/text_style/center
execute if score .style buttons.main matches 2 run function buttons:system/summon/math/text_style/down
execute if score .style buttons.main matches 3 run function buttons:system/summon/math/text_style/up
execute if score .style buttons.main matches 4 run data modify storage buttons:storage temp.h8 set from storage buttons:storage temp.h


data modify storage buttons:storage temp.temp set from storage buttons:storage temp.item
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value {}
execute if score .temp0 buttons.main matches 0 run function buttons:system/summon/cta_flat_rgba with storage buttons:storage temp
execute if score .temp0 buttons.main matches 1 run function buttons:system/summon/cta_flat_rgba_icon with storage buttons:storage temp



