$fill ~ ~ ~ ~ ~ ~ $(Name) destroy
tag @s add Magic.Phase2
scoreboard players add @s Altar.LockDelay 300
data modify entity @s interpolation_duration set value 0
data modify entity @s transformation.scale set value [0,0,0]