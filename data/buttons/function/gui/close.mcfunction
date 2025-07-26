
execute if entity @s[type=player] run data modify storage buttons:storage temp.UUID set from entity @s UUID

execute if entity @s[type=player] as @e[tag=button.gui] if function buttons:system/tick/gui/test_uuid run function buttons:remove


execute if entity @s[tag=button.gui] run function buttons:remove
