

scoreboard players set fct.count1 buttons.main 0
scoreboard players operation fct.count1 buttons.main -= .temp0 buttons.main
function buttons:system/summon/gui/loopx

scoreboard players operation fct.count0 buttons.main -= .temp4 buttons.main

execute if score fct.count0 buttons.main matches 1.. run function buttons:system/summon/gui/loopy


