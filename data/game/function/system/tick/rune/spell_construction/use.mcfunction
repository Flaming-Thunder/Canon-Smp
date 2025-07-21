function game:system/tick/rune/damage
data modify storage game:math temp.block set from entity @s equipment.offhand.id
execute at @s anchored eyes positioned ^ ^ ^0.01 run summon block_display ~ ~ ~ {Tags:["Magic.Construction","Magic.new"],teleport_duration:5,interpolation_duration:5,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0.3,0.3,0.3],translation:[-.15,0,-.15]},brightness:{block:15,sky:15}}
execute as @e[type=block_display,tag=Magic.new] run function game:system/tick/rune/internal12
execute if entity @s[gamemode=!creative] run item modify entity @s weapon.offhand game:item/decrease_by1