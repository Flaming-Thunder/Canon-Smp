
#execute as @a[tag=button.clicker] at @s run stopsound @s neutral block.resin.step
#$execute as @a[tag=button.clicker] at @s run playsound block.iron.step neutral @s ~ ~ ~ 0.6 $(pitch) 0.2
$execute as @a[tag=button.clicker] at @s run playsound block.snow.step neutral @s ~ ~ ~ 1 $(pitch) 0.2
#$execute as @a[tag=button.clicker] at @s run playsound block.resin.step neutral @s ~ ~ ~ 1 $(pitch) 0.2




function buttons:system/tick/slider/set_score with storage buttons:storage temp.score

scoreboard players operation .temp buttons.main = .dot buttons.main


data modify entity @s start_interpolation set value -1
execute on passengers if entity @s[tag=button.lower] run data modify entity @s start_interpolation set value -1
execute on passengers if entity @s[tag=button.higher] run data modify entity @s start_interpolation set value -1

execute store result score .temp1 buttons.main run data get storage buttons:storage temp.score.min
execute store result score .temp2 buttons.main run data get storage buttons:storage temp.score.max

scoreboard players operation .temp3 buttons.main = .temp buttons.main
scoreboard players operation .temp3 buttons.main -= .temp1 buttons.main

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
scoreboard players operation .temp3 buttons.main += .temp6 buttons.main


#execute store result score .temp5 buttons.main run data get entity @s transformation.scale[0] 50000
#scoreboard players operation .temp3 buttons.main -= .temp5 buttons.main
#scoreboard players remove .temp3 buttons.main 5000


#execute if score .temp3 buttons.main matches ..-10000 run scoreboard players set .temp3 buttons.main -10000

execute if score .temp3 buttons.main matches 1.. on passengers if entity @s[tag=button.lower] store result entity @s transformation.scale[0] float 0.000001 run scoreboard players get .temp3 buttons.main
execute if score .temp3 buttons.main matches 1.. on passengers if entity @s[tag=button.lower] store result entity @s transformation.scale[1] float 0.001 run data get storage buttons:storage temp.height 1000
execute if score .temp3 buttons.main matches ..0 on passengers if entity @s[tag=button.lower] run data modify entity @s transformation.scale[0] set value 0f
execute if score .temp3 buttons.main matches ..0 on passengers if entity @s[tag=button.lower] run data modify entity @s transformation.scale[1] set value 0f

execute if score .temp3 buttons.main matches 1.. on passengers if entity @s[tag=button.lower] store result entity @s transformation.translation[0] float -0.0005 run data get storage buttons:storage temp.width 1000

execute store result score .temp5 buttons.main run data get storage buttons:storage temp.width -500000
scoreboard players operation .temp5 buttons.main += .temp3 buttons.main
execute if score .temp3 buttons.main matches ..0 on passengers if entity @s[tag=button.lower] store result entity @s transformation.translation[0] float 0.000001 run scoreboard players get .temp5 buttons.main




## SLIDER


scoreboard players add .temp3 buttons.main 50000
execute store result score .temp5 buttons.main run data get storage buttons:storage temp.width 500000
scoreboard players operation .temp3 buttons.main -= .temp5 buttons.main



#scoreboard players operation .temp3 buttons.main < .temp5 buttons.main
#scoreboard players operation .temp5 buttons.main *= #-1 buttons.main
#scoreboard players operation .temp3 buttons.main > .temp5 buttons.main

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


execute store result score .temp5 buttons.main run data get storage buttons:storage temp.width 1000
scoreboard players operation .temp3 buttons.main *= .temp5 buttons.main


execute if entity @s[type=block_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] 500000
execute if entity @s[type=text_display] store result score .temp6 buttons.main run data get entity @s transformation.scale[0] 62500
scoreboard players add .temp6 buttons.main 50000
scoreboard players operation .temp3 buttons.main += .temp6 buttons.main



execute store result score .temp5 buttons.main run data get entity @s transformation.scale[0] 1000000
scoreboard players operation .temp3 buttons.main -= .temp5 buttons.main
scoreboard players remove .temp3 buttons.main 100000



execute on passengers if entity @s[tag=button.higher] store result entity @s transformation.scale[0] float 0.000001 run scoreboard players get .temp3 buttons.main



execute store result score .temp5 buttons.main run data get storage buttons:storage temp.width 500000
scoreboard players operation .temp5 buttons.main -= .temp3 buttons.main

execute on passengers if entity @s[tag=button.higher] store result entity @s transformation.translation[0] float 0.000001 run scoreboard players get .temp5 buttons.main

execute if score .temp3 buttons.main matches ..0 on passengers if entity @s[tag=button.higher] run data modify entity @s transformation.scale[0] set value 0f
execute if score .temp3 buttons.main matches ..0 on passengers if entity @s[tag=button.higher] run data modify entity @s transformation.scale[1] set value 0f
execute if score .temp3 buttons.main matches 1.. on passengers if entity @s[tag=button.higher] store result entity @s transformation.scale[1] float 0.001 run data get storage buttons:storage temp.height 1000





