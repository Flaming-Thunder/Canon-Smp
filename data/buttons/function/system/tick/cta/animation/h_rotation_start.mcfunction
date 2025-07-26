execute at @s run rotate @s ~90 ~45
execute on passengers if entity @s[tag=button.text,type=text_display] at @s run rotate @s ~90 ~45
execute on passengers if entity @s[tag=button.border,type=text_display] at @s run rotate @s ~90 ~45
execute on passengers if entity @s[tag=button.icon,type=item_display] at @s run rotate @s ~90 ~45
execute on passengers if entity @s[tag=button.icon,type=item_display] run data modify entity @s transformation.scale set value [0f,0f,0.01f]

execute store result score @s buttons.main run data get entity @s interpolation_duration


