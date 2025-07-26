
execute if score @s buttons.main matches 0 run data modify entity @s start_interpolation set value -1
execute if score @s buttons.main matches 0 on passengers if entity @s[tag=button.border] run data modify entity @s start_interpolation set value -1

execute if score @s[tag=!button.flat] buttons.main matches 0 run data modify entity @s transformation.scale[1] set from storage buttons:storage temp.height
execute if score @s[tag=!button.flat] buttons.main matches 0 run data modify entity @s transformation.translation[1] set value 0f


execute if score @s[tag=button.flat] buttons.main matches 0 store result entity @s transformation.scale[1] float 0.04 run data get storage buttons:storage temp.height 100
execute if score @s[tag=button.flat] buttons.main matches 0 run data modify entity @s transformation.translation[1] set value 0f




execute if score @s buttons.main matches 0 at @s run function buttons:system/run_cmd with storage buttons:storage temp


execute store result score .temp2 buttons.main run data get entity @s interpolation_duration -1
execute if score @s buttons.main = .temp2 buttons.main at @s run forceload remove ~ ~
execute if score @s buttons.main >= .temp2 buttons.main run scoreboard players remove @s buttons.main 1
execute unless score @s buttons.main > .temp2 buttons.main on passengers if entity @s[type=interaction] run function buttons:system/tick/cta/interaction

