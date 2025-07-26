
function buttons:system/tick/slider/get_score with storage buttons:storage temp.score


execute store result score .temp1 buttons.main run data get storage buttons:storage temp.width -50000
execute store result score .temp2 buttons.main run data get storage buttons:storage temp.width 50000
execute store result score .temp3 buttons.main run data get storage buttons:storage temp.score.min
execute store result score .temp4 buttons.main run data get storage buttons:storage temp.score.max
scoreboard players operation .temp4 buttons.main -= .temp3 buttons.main
scoreboard players add .temp4 buttons.main 1

scoreboard players operation .dot buttons.main > .temp1 buttons.main
scoreboard players operation .dot buttons.main < .temp2 buttons.main


#scoreboard players add .temp2 buttons.main 5000


execute if entity @s[type=block_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] -50000
execute if entity @s[type=text_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] -6250

scoreboard players operation .temp6 buttons.main += .temp2 buttons.main
scoreboard players remove .temp6 buttons.main 5000

#scoreboard players operation .temp1 buttons.main = .temp6 buttons.main
scoreboard players operation .temp1 buttons.main = .temp2 buttons.main

execute store result score .temp6 buttons.main run data get storage buttons:storage temp.score.inc
execute if score .temp6 buttons.main matches ..0 run scoreboard players set .temp6 buttons.main 1
scoreboard players operation .temp1 buttons.main *= .temp6 buttons.main
scoreboard players operation .temp1 buttons.main /= .temp4 buttons.main
scoreboard players operation .temp1 buttons.main *= #2 buttons.main
scoreboard players operation .temp6 buttons.main = .temp1 buttons.main
scoreboard players operation .temp6 buttons.main /= #2 buttons.main
scoreboard players operation .dot buttons.main += .temp6 buttons.main
scoreboard players operation .dot buttons.main /= .temp1 buttons.main
scoreboard players operation .dot buttons.main *= .temp1 buttons.main
execute if entity @s[type=block_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] 50000
execute if entity @s[type=text_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] 6250
scoreboard players operation .dot buttons.main += .temp6 buttons.main
scoreboard players remove .dot buttons.main 5000




#tellraw @a {score:{name:".temp6",objective:"buttons.main"}}
#tellraw @a {nbt:"transformation.scale[0]",entity:"@s"}



execute if entity @s[type=block_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] -50000
execute if entity @s[type=text_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] -6250

scoreboard players operation .temp6 buttons.main += .temp2 buttons.main
scoreboard players remove .temp6 buttons.main 5000

scoreboard players operation .dot buttons.main *= #1000 buttons.main
#scoreboard players operation .dot buttons.main /= .temp6 buttons.main
scoreboard players operation .dot buttons.main /= .temp2 buttons.main
scoreboard players add .dot buttons.main 1000
scoreboard players operation .dot buttons.main /= #2 buttons.main
execute if score .dot buttons.main matches ..-1 run scoreboard players set .dot buttons.main 0
execute store result storage buttons:storage temp.pitch float 0.001 run scoreboard players get .dot buttons.main
scoreboard players operation .dot buttons.main *= .temp4 buttons.main
scoreboard players operation .dot buttons.main /= #1000 buttons.main
scoreboard players operation .dot buttons.main += .temp3 buttons.main
#scoreboard players remove .dot buttons.main 1


execute unless score .temp buttons.main = .dot buttons.main unless entity @s[tag=button.flat] run function buttons:system/tick/slider/animation with storage buttons:storage temp
execute unless score .temp buttons.main = .dot buttons.main if entity @s[tag=button.flat] run function buttons:system/tick/slider/flat_rgba/animation with storage buttons:storage temp

