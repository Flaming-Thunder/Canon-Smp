tag @s add button.user

scoreboard players set .min buttons.main 1000000000

execute as @e[type=interaction,tag=button.button,distance=..10] if function buttons:system/tick/hitbox/vehicle_is_plane run function buttons:system/tick/hitbox/plane_detection
#execute as @e[type=interaction,tag=button.button,distance=..0.001] run function buttons:system/tick/hitbox/plane_detection

scoreboard players operation .dot buttons.main = dot.min buttons.main
scoreboard players operation .dx buttons.main = dx.min buttons.main
scoreboard players operation .dy buttons.main = dy.min buttons.main
execute as @e[tag=button.min,type=#buttons:button,distance=..10] run function buttons:system/tick/hitbox/execute


scoreboard players reset .dot buttons.main

tag @s remove button.user


