data modify storage game:math temp.id set from storage game:math temp.array[0].id
data modify storage game:math temp.weight set from storage game:math temp.array[0].weight
execute store result storage game:math temp.count int 1 run scoreboard players get generate.count2 Game.Math
execute store result score .break Game.Math run function game:system/game/battle/wave/generate/list/loop/macro with storage game:math temp
scoreboard players add generate.count2 Game.Math 1
execute if score .break Game.Math matches 0 run data remove storage game:math temp.array[0]
execute if score .break Game.Math matches 0 if data storage game:math temp.array[0] run function game:system/game/battle/wave/generate/list/loop