function buttons:system/tick/gui/coord_to_slot


scoreboard players set .temp0 buttons.main 0
execute on passengers if entity @s[tag=button.description] run scoreboard players set .temp0 buttons.main 1
execute if score .temp0 buttons.main matches 0 run function buttons:system/tick/gui/description/summon

execute on passengers run data modify entity @s brightness set value {block:15,sky:15}
execute on passengers on passengers run data modify entity @s brightness set value {block:13,sky:13}
execute on passengers if data entity @s data.slot if function buttons:system/tick/gui/test_slot run function buttons:system/tick/gui/description/modify



scoreboard players set .break1 buttons.main 0



