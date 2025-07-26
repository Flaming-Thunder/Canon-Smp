data modify storage buttons:storage temp set from entity @s data

function buttons:system/tick/rgb_indicator/get_score with storage buttons:storage temp.score

scoreboard players remove .temp buttons.main 16777216

execute store result entity @s background int 1.0 run scoreboard players get .temp buttons.main


