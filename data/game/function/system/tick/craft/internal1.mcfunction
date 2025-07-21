tag @s remove Magic.new
data modify entity @s data.AnimationCenter set from storage game:math temp.Pos
scoreboard players operation @s Altar.LockDelay = Altar_Craft.Delay Game.Data
execute store result score .temp Game.Math run random value 0..1
execute if score .temp Game.Math matches 1 run tag @s add Magic.AnimationInversed