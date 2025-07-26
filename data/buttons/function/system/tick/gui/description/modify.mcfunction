data modify storage buttons:storage temp2 set from entity @s item
data modify entity @s brightness set value {block:5,sky:5}
execute on passengers run data modify entity @s brightness set value {block:5,sky:5}

execute if data entity @s item.id on vehicle on passengers if entity @s[tag=button.description] run function buttons:system/tick/gui/description/modify_final
execute unless data entity @s item.id on vehicle on passengers if entity @s[tag=button.description] run kill @s







