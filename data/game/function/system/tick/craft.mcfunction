scoreboard players set Craft.Success Game.Math 0
data modify storage game:math temp.array set from storage game:crafts craft
function game:system/tick/craft/search_loop
execute if score Craft.Success Game.Math matches 0 run function game:system/tick/craft/fail