data modify storage game:math temp.recipe set from storage game:math temp.array[0].recipe
execute if score Craft.Success Game.Math matches 0 run scoreboard players set total.basic Game.Math 0
execute if score Craft.Success Game.Math matches 0 run scoreboard players set total.advanced Game.Math 0
execute store result score Craft.Success Game.Math run function game:system/tick/craft/try_recipe/check_shapeless/loop
execute if score Craft.Success Game.Math matches 1 if score total.basic Game.Math < .basic Game.Math run scoreboard players set Craft.Success Game.Math 0
execute if score Craft.Success Game.Math matches 1 if score total.advanced Game.Math < .advanced Game.Math run scoreboard players set Craft.Success Game.Math 0