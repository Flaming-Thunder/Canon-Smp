tag @s add target


scoreboard players set .break buttons.main 0

execute at @s on attacker run function buttons:system/tick/hitbox/pre_plane
execute at @s on target run function buttons:system/tick/hitbox/pre_plane

execute if data entity @s attack run data remove entity @s attack
execute if data entity @s interaction run data remove entity @s interaction

tag @s remove target


