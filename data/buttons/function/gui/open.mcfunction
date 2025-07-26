$data modify storage buttons:storage temp.dim set value $(dim)

$data modify storage buttons:storage temp.size set value $(size)

$data modify storage buttons:storage temp.color set value $(color)

$data modify storage buttons:storage temp.Tags set value $(Tags)

$data modify storage buttons:storage temp.text_box set value $(text_box)
execute unless data storage buttons:storage temp.text_box.size run data modify storage buttons:storage temp.text_box.size set value 1
execute unless data storage buttons:storage temp.text_box.dx run data modify storage buttons:storage temp.text_box.dx set value 0


data modify storage buttons:storage temp.UUID set from entity @s UUID


$execute at @s[type=player] anchored eyes positioned ^ ^ ^$(dist) run function buttons:system/summon/gui/main

