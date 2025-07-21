execute store result score .test Game.Math run function game:system/tick/craft/search_loop/check with storage game:math temp.array[0]
execute if score .test Game.Math matches 1 run function game:system/tick/craft/try_recipe
data remove storage game:math temp.array[0]
execute if data storage game:math temp.array[0] unless score Craft.Success Game.Math matches 1 run function game:system/tick/craft/search_loop