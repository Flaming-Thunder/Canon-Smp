function game:system/tick/rune/damage
damage @s 6 magic
scoreboard players operation .id Game.Math = @s Player.ID
summon item_display ~ ~ ~ {Tags:["Magic.Inferno","Magic.new"],interpolation_duration:14,item:{id:"stick",components:{"item_model":"game:resource/fire_ring"}},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[4,4,4],translation:[0,0,0]},brightness:{block:15,sky:15}}
execute as @e[type=item_display,tag=Magic.new] run function game:system/tick/rune/internal14