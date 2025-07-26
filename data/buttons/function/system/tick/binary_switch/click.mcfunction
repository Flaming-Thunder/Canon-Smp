function buttons:system/tick/binary_switch/get_score with storage buttons:storage temp.score

#scoreboard players add .temp buttons.main 1
#scoreboard players operation .temp buttons.main %= #2 buttons.main
#
#execute on vehicle run data modify entity @s start_interpolation set value -1
#execute if score .temp buttons.main matches 0 on vehicle store result entity @s transformation.translation[0] float -0.009 run data get storage buttons:storage temp.width 100
#execute if score .temp buttons.main matches 1 on vehicle store result entity @s transformation.translation[0] float 0.001 run data get storage buttons:storage temp.width 100
#execute on vehicle on passengers if entity @s[tag=button.icon] if score .temp buttons.main matches 0 store result entity @s transformation.translation[0] float -0.005 run data get storage buttons:storage temp.width 100
#execute on vehicle on passengers if entity @s[tag=button.icon] if score .temp buttons.main matches 1 store result entity @s transformation.translation[0] float 0.005 run data get storage buttons:storage temp.width 100
#
#function buttons:system/tick/binary_switch/set_score with storage buttons:storage temp.score
#
#execute on attacker at @s run playsound ui.button.click neutral @s ~ ~ ~ 0.4 1 0.2
#execute on target at @s run playsound ui.button.click neutral @s ~ ~ ~ 0.4 1 0.2
#
#data remove entity @s attack
#data remove entity @s interaction







scoreboard players add .temp buttons.main 1
scoreboard players operation .temp buttons.main %= #2 buttons.main

execute run data modify entity @s start_interpolation set value -1
execute if score .temp buttons.main matches 0 store result entity @s transformation.translation[0] float -0.0045 run data get storage buttons:storage temp.width 100
execute if score .temp buttons.main matches 1 store result entity @s transformation.translation[0] float 0.0005 run data get storage buttons:storage temp.width 100
execute on passengers if entity @s[tag=button.icon] if score .temp buttons.main matches 0 store result entity @s transformation.translation[0] float -0.005 run data get storage buttons:storage temp.width 100
execute on passengers if entity @s[tag=button.icon] if score .temp buttons.main matches 1 store result entity @s transformation.translation[0] float 0.005 run data get storage buttons:storage temp.width 100

function buttons:system/tick/binary_switch/set_score with storage buttons:storage temp.score

execute as @a[tag=button.user] at @s run playsound ui.button.click neutral @s ~ ~ ~ 0.4 1 0.2
