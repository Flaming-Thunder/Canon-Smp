tag @s remove Magic.new
scoreboard players set @s Altar.Count 0
scoreboard players operation @s Player.ID = .id Game.Math
execute store result score @s Altar.LockDelay run time query gametime
scoreboard players add @s Altar.LockDelay 2
data modify entity @s start_interpolation set value -1
data modify entity @s transformation.scale set value [24,24,24]