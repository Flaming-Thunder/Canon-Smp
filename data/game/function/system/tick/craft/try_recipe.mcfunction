scoreboard players set count.CraftID Game.Math 0
scoreboard players reset * Altar.CraftID
scoreboard players set @s Altar.CraftID -1
tag @s add Magic.CraftCenter
execute at @s run function game:system/tick/craft/try_recipe/set_id
execute as @e[scores={Altar.CraftID=0..}] run say test
scoreboard players set .basic Game.Math 0
scoreboard players set .advanced Game.Math 0
execute if data storage game:math temp.array[0].tier.basic store result score .basic Game.Math run data get storage game:math temp.array[0].tier.basic
execute if data storage game:math temp.array[0].tier.advanced store result score .advanced Game.Math run data get storage game:math temp.array[0].tier.advanced
scoreboard players set break.tier Game.Math 0
execute if score .basic Game.Math matches 1.. unless entity @s[tag=Magic.Basic] run scoreboard players set break.tier Game.Math 1
execute if score .advanced Game.Math matches 1.. unless entity @s[tag=Magic.Advanced] run scoreboard players set break.tier Game.Math 1
execute if score .advanced Game.Math matches 1.. if entity @s[tag=Magic.Advanced] run scoreboard players set break.tier Game.Math 0
scoreboard players set .shapeless Game.Math 0
execute if data storage game:math temp.array[0].shapeless store result score .shapeless Game.Math run data get storage game:math temp.array[0].shapeless
execute at @s if score break.tier Game.Math matches 0 if score .shapeless Game.Math matches 0 as @e[tag=Magic.Pedestal,scores={Altar.CraftID=0..},distance=..10] run function game:system/tick/craft/try_recipe/check_shape
execute at @s if score break.tier Game.Math matches 0 if score .shapeless Game.Math matches 1 run function game:system/tick/craft/try_recipe/check_shapeless
execute if score Craft.Success Game.Math matches 1 run function game:system/tick/craft/success
tag @e[type=item_display,tag=Magic.InCraft] remove Magic.InCraft
tag @s remove Magic.CraftCenter
scoreboard players reset * Altar.CraftID