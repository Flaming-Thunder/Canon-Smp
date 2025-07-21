tag @s remove Magic.new
execute store result score @s Altar.LockDelay run time query gametime
scoreboard players add @s Altar.LockDelay 5
data modify entity @s block_state.Name set from storage game:math temp.block
data modify entity @s start_interpolation set value -1
data modify entity @s transformation set value {left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[-0.5,0,-0.5]}
tp @s ~ ~ ~