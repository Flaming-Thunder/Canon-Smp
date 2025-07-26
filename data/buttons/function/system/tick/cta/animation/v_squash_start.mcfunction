data modify entity @s start_interpolation set value -1

execute store result entity @s transformation.scale[0] float 0.008 run data get entity @s transformation.scale[0] 100
execute store result entity @s transformation.translation[0] float 0.008 run data get entity @s transformation.translation[0] 100

execute store result score @s buttons.main run data get entity @s interpolation_duration



execute at @s run forceload add ~ ~