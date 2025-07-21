execute store result score .id Game.Math run data get storage game:math temp.recipe[0]
execute unless score @s Altar.CraftID = .id Game.Math run return 0
execute if entity @s[tag=Magic.Basic] run scoreboard players add total.basic Game.Math 1
execute if entity @s[tag=Magic.Advanced] run scoreboard players add total.advanced Game.Math 1
tag @s add Magic.InCraft
data remove storage game:math temp.recipe[0]
execute unless data storage game:math temp.recipe[0] run return 1
execute if data storage game:math temp.recipe[0] at @s facing entity @e[type=item_display,tag=Magic.CraftCenter] feet positioned ^2 ^ ^ as @e[type=item_display,tag=Magic.Pedestal,tag=!Magic.InCraft,tag=!Magic.CraftCenter,tag=!Magic.Altar,scores={Altar.CraftID=0..},sort=nearest,limit=1,distance=..5] run return run function game:system/tick/craft/try_recipe/check_shape/loop