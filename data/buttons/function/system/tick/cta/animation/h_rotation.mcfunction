
execute store result score .temp1 buttons.main run data get entity @s interpolation_duration 0.5
execute if score @s buttons.main = .temp1 buttons.main at @s run rotate @s ~90 ~45
execute if score @s buttons.main = .temp1 buttons.main on passengers if entity @s[tag=button.text,type=text_display] at @s run rotate @s ~90 ~45
execute if score @s buttons.main = .temp1 buttons.main on passengers if entity @s[tag=button.border,type=text_display] at @s run rotate @s ~90 ~45
execute if score @s buttons.main = .temp1 buttons.main on passengers if entity @s[tag=button.icon,type=item_display] at @s run rotate @s ~90 ~45

execute if score @s buttons.main matches 0 at @s run rotate @s ~90 ~-45
execute if score @s buttons.main matches 0 on passengers if entity @s[tag=button.text,type=text_display] at @s run rotate @s ~90 ~-45
execute if score @s buttons.main matches 0 on passengers if entity @s[tag=button.border,type=text_display] at @s run rotate @s ~90 ~-45
execute if score @s buttons.main matches 0 on passengers if entity @s[tag=button.icon,type=item_display] at @s run rotate @s ~90 ~-45
execute if score @s buttons.main matches 0 at @s run function buttons:system/run_cmd with storage buttons:storage temp

scoreboard players operation .temp1 buttons.main *= #-1 buttons.main
execute if score @s buttons.main = .temp1 buttons.main at @s run rotate @s ~90 ~-45
execute if score @s buttons.main = .temp1 buttons.main on passengers if entity @s[tag=button.text,type=text_display] at @s run rotate @s ~90 ~-45
execute if score @s buttons.main = .temp1 buttons.main on passengers if entity @s[tag=button.border,type=text_display] at @s run rotate @s ~90 ~-45
execute if score @s buttons.main = .temp1 buttons.main on passengers if entity @s[tag=button.icon,type=item_display] at @s run rotate @s ~90 ~-45
execute if score @s buttons.main = .temp1 buttons.main on passengers if entity @s[tag=button.icon,type=item_display] run data modify entity @s transformation.scale[0] set from storage buttons:storage temp.height
execute if score @s buttons.main = .temp1 buttons.main on passengers if entity @s[tag=button.icon,type=item_display] run data modify entity @s transformation.scale[1] set from storage buttons:storage temp.height

execute store result score .temp2 buttons.main run data get entity @s interpolation_duration -1
execute if score @s buttons.main = .temp2 buttons.main at @s run forceload remove ~ ~
execute if score @s buttons.main >= .temp2 buttons.main run scoreboard players remove @s buttons.main 1

execute if score @s buttons.main = .temp2 buttons.main run data modify entity @s Rotation[0] set from storage buttons:storage temp.Rotation
execute if score @s buttons.main = .temp2 buttons.main on passengers if entity @s[tag=button.text,type=text_display] run data modify entity @s Rotation[0] set from storage buttons:storage temp.Rotation
execute if score @s buttons.main = .temp2 buttons.main on passengers if entity @s[tag=button.border,type=text_display] run data modify entity @s Rotation[0] set from storage buttons:storage temp.Rotation
execute if score @s buttons.main = .temp2 buttons.main on passengers if entity @s[tag=button.icon,type=item_display] run data modify entity @s Rotation[0] set from storage buttons:storage temp.Rotation
execute if score @s buttons.main = .temp2 buttons.main run scoreboard players remove @s buttons.main 1

execute unless score @s buttons.main > .temp2 buttons.main on passengers if entity @s[type=interaction] run function buttons:system/tick/cta/interaction


