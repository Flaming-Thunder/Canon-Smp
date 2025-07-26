data modify storage game:math temp.id set from storage game:math temp.array[0].id
data modify storage game:math temp.Battle.Seed set from storage game:math temp.array[0].weight
execute store result storage game:math temp.count int 1 run scoreboard players get generate.count Game.Math
function game:system/game/battle/wave/generate/weight/macro with storage game:math temp
scoreboard players add generate.count Game.Math 1
data remove storage game:math temp.array[0]
execute if data storage game:math temp.array[0] run function game:system/game/battle/wave/generate/weight