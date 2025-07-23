execute store result score .id Game.Math run data get storage game:math temp.recipe[0]
execute as @e[type=item_display,tag=Magic.Pedestal,tag=!Magic.InCraft,tag=!Magic.CraftCenter,tag=!Magic.Altar,scores={Altar.CraftID=0..},distance=..10] if score @s Altar.CraftID = .id Game.Math run tag @s add Magic.temp
execute unless entity @e[type=item_display,tag=Magic.temp] run return 0
execute as @e[type=item_display,tag=Magic.temp,limit=1] run tag @s add Magic.InCraft
execute if entity @e[type=item_display,tag=Magic.temp,tag=Magic.InCraft,limit=1,tag=Magic.Basic] run scoreboard players add total.basic Game.Math 1
execute if entity @e[type=item_display,tag=Magic.temp,tag=Magic.InCraft,limit=1,tag=Magic.Advanced] run scoreboard players add total.advanced Game.Math 1
tag @e[type=item_display,tag=Magic.temp] remove Magic.temp
data remove storage game:math temp.recipe[0]
execute unless data storage game:math temp.recipe[0] run return 1
execute if data storage game:math temp.recipe[0] run return run function game:system/tick/craft/try_recipe/check_shapeless/loop