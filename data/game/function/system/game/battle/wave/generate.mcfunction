data modify storage game:math temp.array set from storage game:game_scape_data battle.spawn_table
scoreboard players reset * Game.Battle.Weight
scoreboard players set generate.count Game.Math 0
function game:system/game/battle/wave/generate/weight
data modify storage game:math temp.array set from storage game:game_scape_data battle.spawn_table
scoreboard players set .generateWave Game.Math 1
scoreboard players set generate.count Game.Math 3
scoreboard players operation generate.count Game.Math *= Battle.round Game.Data
scoreboard players operation generate.count Game.Math /= #2 Game.Math
scoreboard players add generate.count Game.Math 12
data modify storage game:game_scape_data battle.round set value []
scoreboard players set zombie.generated Game.Math 0
function game:system/game/battle/wave/generate/list