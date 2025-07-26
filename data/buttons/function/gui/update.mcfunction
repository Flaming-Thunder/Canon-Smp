$data modify storage buttons:storage temp.grid set value $(Items)
$data modify storage buttons:storage temp.color set value $(color)


execute if entity @s[type=player] run data modify storage buttons:storage temp.UUID set from entity @s UUID
execute if entity @s[type=player] at @s as @e[tag=button.gui] if function buttons:system/tick/gui/test_uuid run function buttons:system/tick/gui/update/main


execute if entity @s[tag=button.gui] run function buttons:system/tick/gui/update/main

