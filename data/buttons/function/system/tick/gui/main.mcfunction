data modify storage buttons:storage temp set from entity @s data



data modify storage buttons:storage temp set from entity @s data
execute as @a if function buttons:system/tick/gui/find_user run tag @s add button.user

execute unless entity @a[tag=button.user] run function buttons:remove


scoreboard players set .break1 buttons.main 1


scoreboard players set .break buttons.main 1
execute at @s as @a[tag=button.user,distance=..5] run function buttons:system/tick/hitbox/pre_plane

execute if score .break1 buttons.main matches 1 on passengers if entity @s[tag=button.description] run kill @s




data modify storage buttons:storage temp set from entity @s data
execute as @a if function buttons:system/tick/gui/find_user run tag @s add button.user


execute on passengers if entity @s[type=interaction] run function buttons:system/tick/gui/interaction



tag @a remove button.user

