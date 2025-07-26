#tag @s add inited


data modify storage buttons:storage temp set from entity @s data


function buttons:system/tick/slider/get_score with storage buttons:storage temp.score


execute store result score .temp1 buttons.main run data get storage buttons:storage temp.score.min
execute store result score .temp2 buttons.main run data get storage buttons:storage temp.score.max

scoreboard players operation .temp3 buttons.main = .temp buttons.main
scoreboard players operation .temp3 buttons.main -= .temp1 buttons.main
#scoreboard players add .temp3 buttons.main 1

scoreboard players operation .temp4 buttons.main = .temp2 buttons.main
scoreboard players operation .temp4 buttons.main -= .temp1 buttons.main
scoreboard players add .temp4 buttons.main 1

scoreboard players operation .temp3 buttons.main *= #1000 buttons.main
scoreboard players operation .temp3 buttons.main /= .temp4 buttons.main







## LOWER



execute store result score .temp5 buttons.main run data get storage buttons:storage temp.width 1000
scoreboard players operation .temp3 buttons.main *= .temp5 buttons.main

execute if entity @s[type=block_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] 500000
execute if entity @s[type=text_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] 62500
scoreboard players add .temp6 buttons.main 50000
scoreboard players operation .temp3 buttons.main -= .temp6 buttons.main




#execute store result score .temp5 buttons.main run data get entity @s transformation.scale[0] 6250
#scoreboard players operation .temp3 buttons.main -= .temp5 buttons.main
#scoreboard players remove .temp3 buttons.main 5000





execute if score .temp3 buttons.main matches 1.. on passengers if entity @s[tag=button.lower] store result entity @s transformation.scale[0] float 0.000008 run scoreboard players get .temp3 buttons.main
execute if score .temp3 buttons.main matches 1.. on passengers if entity @s[tag=button.lower] store result entity @s transformation.scale[1] float 0.004 run data get storage buttons:storage temp.height 1000
execute if score .temp3 buttons.main matches ..0 on passengers if entity @s[tag=button.lower] run data modify entity @s transformation.scale[0] set value 0f
execute if score .temp3 buttons.main matches ..0 on passengers if entity @s[tag=button.lower] run data modify entity @s transformation.scale[1] set value 0f


#scoreboard players remove .temp3 buttons.main 5000

execute store result score .temp5 buttons.main run data get storage buttons:storage temp.width -2500000
scoreboard players operation .temp5 buttons.main += .temp3 buttons.main
scoreboard players operation .temp5 buttons.main += .temp3 buttons.main
scoreboard players operation .temp5 buttons.main /= #5 buttons.main
execute on passengers if entity @s[tag=button.lower] store result entity @s transformation.translation[0] float 0.000001 run scoreboard players get .temp5 buttons.main




## SLIDER


scoreboard players add .temp3 buttons.main 50000

execute store result score .temp5 buttons.main run data get storage buttons:storage temp.width 500000
scoreboard players operation .temp3 buttons.main -= .temp5 buttons.main

execute store result score .temp5 buttons.main run data get entity @s transformation.scale[0] 125000
scoreboard players operation .temp5 buttons.main *= #2 buttons.main
scoreboard players operation .temp5 buttons.main /= #5 buttons.main
scoreboard players operation .temp3 buttons.main += .temp5 buttons.main
execute store result entity @s transformation.translation[0] float 0.000001 run scoreboard players get .temp3 buttons.main




## HIGHER


scoreboard players operation .temp3 buttons.main = .temp buttons.main
scoreboard players operation .temp3 buttons.main -= .temp1 buttons.main
scoreboard players operation .temp3 buttons.main *= #-1 buttons.main
scoreboard players operation .temp3 buttons.main *= #1000 buttons.main
scoreboard players operation .temp3 buttons.main /= .temp4 buttons.main
scoreboard players add .temp3 buttons.main 1000
execute if score .temp4 buttons.main matches 16.. run scoreboard players operation .temp5 buttons.main = .temp4 buttons.main
execute if score .temp4 buttons.main matches 16.. run scoreboard players operation .temp5 buttons.main %= #2 buttons.main
execute if score .temp4 buttons.main matches 16.. run scoreboard players operation .temp3 buttons.main += .temp5 buttons.main
scoreboard players set .temp5 buttons.main 1000
scoreboard players operation .temp5 buttons.main /= .temp4 buttons.main
scoreboard players add .temp5 buttons.main 1
execute if score .temp3 buttons.main <= .temp5 buttons.main run scoreboard players operation .temp3 buttons.main = .temp5 buttons.main
execute if score .temp3 buttons.main <= .temp5 buttons.main run scoreboard players remove .temp3 buttons.main 1
execute if score .temp3 buttons.main matches 1000.. run scoreboard players set .temp3 buttons.main 1000




execute store result score .temp5 buttons.main run data get storage buttons:storage temp.width 1000
scoreboard players operation .temp3 buttons.main *= .temp5 buttons.main

execute if entity @s[type=block_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] 500000
execute if entity @s[type=text_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] 62500
scoreboard players add .temp6 buttons.main 50000
scoreboard players operation .temp3 buttons.main += .temp6 buttons.main


execute store result score .temp5 buttons.main run data get entity @s transformation.scale[0] 125000
scoreboard players operation .temp3 buttons.main -= .temp5 buttons.main
scoreboard players remove .temp3 buttons.main 100000


execute on passengers if entity @s[tag=button.higher] store result entity @s transformation.scale[0] float 0.000008 run scoreboard players get .temp3 buttons.main



execute store result score .temp5 buttons.main run data get storage buttons:storage temp.width 2500000
scoreboard players operation .temp5 buttons.main -= .temp3 buttons.main
scoreboard players operation .temp5 buttons.main -= .temp3 buttons.main
scoreboard players operation .temp5 buttons.main -= .temp3 buttons.main
scoreboard players operation .temp5 buttons.main /= #5 buttons.main


execute on passengers if entity @s[tag=button.higher] store result entity @s transformation.translation[0] float 0.000001 run scoreboard players get .temp5 buttons.main

execute if score .temp3 buttons.main matches ..0 on passengers if entity @s[tag=button.higher] run data modify entity @s transformation.scale[0] set value 0f
execute if score .temp3 buttons.main matches ..0 on passengers if entity @s[tag=button.higher] run data modify entity @s transformation.scale[1] set value 0f
execute if score .temp3 buttons.main matches 1.. on passengers if entity @s[tag=button.higher] store result entity @s transformation.scale[1] float 0.004 run data get storage buttons:storage temp.height 1000
