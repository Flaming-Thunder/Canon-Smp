scoreboard players set .break Game.Math 0
data modify storage game:math temp.id set from storage game:math temp.array1[0].id
data modify storage game:math temp.chance set from storage game:math temp.array1[0].chance
$data modify storage game:math temp.spawner set value "$(spawner)"
function game:system/game/battle/wave/generate/list/group/macro with storage game:math temp
data remove storage game:math temp.array1[0]
$execute if score .break Game.Math matches 0 if data storage game:math temp.array1[0] run function game:system/game/battle/wave/generate/list/group {spawner:"$(spawner)"}