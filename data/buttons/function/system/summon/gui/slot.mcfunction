tag @s add button.button

summon text_display ~ ~ ~ {Tags:["button.button","button.new","button.count"],background:0}

ride @e[tag=button.new,tag=button.count,limit=1] mount @s
execute on passengers run tag @s remove button.new

execute store result entity @s data.slot int 1.0 run scoreboard players get fct.count2 buttons.main 


scoreboard players operation .temp6 buttons.main = fct.count1 buttons.main
scoreboard players operation .temp6 buttons.main += .temp5 buttons.main
execute store result entity @s transformation.translation[0] float 0.01 run scoreboard players get .temp6 buttons.main
scoreboard players operation .temp7 buttons.main = .temp5 buttons.main
scoreboard players operation .temp7 buttons.main /= #2 buttons.main
scoreboard players operation .temp6 buttons.main += .temp7 buttons.main
execute on passengers store result entity @s transformation.translation[0] float 0.01 run scoreboard players get .temp6 buttons.main



scoreboard players operation .temp6 buttons.main = fct.count0 buttons.main
scoreboard players operation .temp6 buttons.main -= .temp5 buttons.main
execute store result entity @s transformation.translation[1] float 0.01 run scoreboard players get .temp6 buttons.main
scoreboard players operation .temp6 buttons.main -= .temp5 buttons.main
execute on passengers store result entity @s transformation.translation[1] float 0.01 run scoreboard players get .temp6 buttons.main





execute store result entity @s transformation.scale[0] float 0.0000890 run data get storage buttons:storage temp.size 10000
execute store result entity @s transformation.scale[1] float 0.0000890 run data get storage buttons:storage temp.size 10000
data modify entity @s transformation.scale[2] set value 0.01f
execute on passengers store result entity @s transformation.scale[0] float 0.0001390 run data get storage buttons:storage temp.size 10000
execute on passengers store result entity @s transformation.scale[1] float 0.0001390 run data get storage buttons:storage temp.size 10000
execute on passengers run data modify entity @s transformation.scale[2] set value 1
execute on passengers run data modify entity @s transformation.translation[2] set value 0.006f

data modify entity @s transformation.right_rotation set value [0f,1f,0f,0f]

#data modify entity @s item set value {id:"stone",count:1}
data modify entity @s item_display set value "gui"

data modify entity @s brightness set value {block:15,sky:15}

ride @s mount @e[tag=button.new,tag=button.gui,limit=1]



