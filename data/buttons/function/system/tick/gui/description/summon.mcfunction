execute at @s run summon text_display ~ ~ ~ {Tags:["button.button","button.description","button.new"],alignment:"left",background:-1139343032,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[0,0,0.01]}}

ride @e[tag=button.new,limit=1] mount @s

execute on passengers run tag @s[tag=button.description] remove button.new
execute at @s on passengers if entity @s[tag=button.description] run rotate @s ~ 0


execute on passengers if entity @s[tag=button.description] store result entity @s transformation.scale[0] float 0.015 run data get storage buttons:storage temp.size 100
execute on passengers if entity @s[tag=button.description] store result entity @s transformation.scale[1] float 0.015 run data get storage buttons:storage temp.size 100

execute on passengers if entity @s[tag=button.description] store result entity @s transformation.translation[0] float 0.01 run scoreboard players get .dx buttons.main
execute on passengers if entity @s[tag=button.description] store result entity @s transformation.translation[1] float 0.01 run scoreboard players get .dy buttons.main

execute on passengers if entity @s[tag=button.description] run data modify entity @s interpolation_duration set value 1




