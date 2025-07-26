data modify entity @s start_interpolation set value -1
#execute store result entity @s transformation.scale[1] float 0.008 run data get storage buttons:storage temp.height 100
#execute store result entity @s transformation.translation[1] float 0.001 run data get storage buttons:storage temp.height 100


execute store result entity @s transformation.scale[1] float 0.008 run data get entity @s transformation.scale[1] 100
execute store result entity @s transformation.translation[1] float 0.001 run data get storage buttons:storage temp.height 100


execute store result score @s buttons.main run data get entity @s interpolation_duration


execute at @s run forceload add ~ ~
