scoreboard players set @s buttons.main -2147483648

#data modify entity @s teleport_duration set from entity @s interpolation_duration
execute store result entity @s teleport_duration int 0.5 run data get entity @s interpolation_duration
execute on passengers if entity @s[tag=button.text,type=text_display] run data modify entity @s teleport_duration set from entity @e[tag=button.new,tag=button.cta,limit=1,sort=nearest] teleport_duration
execute on passengers if entity @s[tag=button.text,type=text_display] run data modify entity @s interpolation_duration set from entity @e[tag=button.new,tag=button.cta,limit=1,sort=nearest] interpolation_duration
execute on passengers if entity @s[tag=button.border,type=text_display] run data modify entity @s teleport_duration set from entity @e[tag=button.new,tag=button.cta,limit=1,sort=nearest] teleport_duration
execute on passengers if entity @s[tag=button.border,type=text_display] run data modify entity @s interpolation_duration set from entity @e[tag=button.new,tag=button.cta,limit=1,sort=nearest] interpolation_duration
execute on passengers if entity @s[tag=button.icon,type=item_display] run data modify entity @s teleport_duration set from entity @e[tag=button.new,tag=button.cta,limit=1,sort=nearest] teleport_duration
execute on passengers if entity @s[tag=button.icon,type=item_display] run data modify entity @s interpolation_duration set from entity @e[tag=button.new,tag=button.cta,limit=1,sort=nearest] interpolation_duration

execute store result entity @s Rotation[0] float 2 run data get entity @s Rotation[0] 0.5
execute on passengers if entity @s[type=marker] run data modify entity @s data.Rotation set from entity @e[tag=button.new,tag=button.cta,limit=1,sort=nearest] Rotation[0]
execute on passengers run data modify entity @s Rotation[0] set from entity @e[tag=button.new,tag=button.cta,limit=1,sort=nearest] Rotation[0]



