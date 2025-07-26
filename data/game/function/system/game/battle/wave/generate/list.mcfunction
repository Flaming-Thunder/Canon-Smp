scoreboard players operation .rand Game.Math = Battle.Seed Game.Data
scoreboard players operation .rand Game.Math += generate.count Game.Math
scoreboard players operation .rand Game.Math *= Battle.round Game.Data
scoreboard players operation .rand Game.Math %= .total Game.Battle.Weight
data modify storage game:math temp.array set from storage game:game_scape_data battle.spawn_table
scoreboard players set .total2 Game.Battle.Weight 0
scoreboard players set generate.count2 Game.Math 0
function game:system/game/battle/wave/generate/list/loop
function game:system/game/battle/wave/generate/list/append with storage game:math temp.array[0]
execute if score generate.count Game.Math matches 1.. run schedule function game:system/game/battle/wave/generate/list 1 append
execute if score generate.count Game.Math matches 1.. run title @a actionbar {"text": "generating round...","color": "gray"}
execute if score generate.count Game.Math matches ..0 run title @a actionbar {"text": "round generated","color": "green"}
execute if score generate.count Game.Math matches ..0 run title @a title [{"text": "Round ","color": "red"},{"score":{"name": ".round","objective": "Game.Math"}}]
execute if score generate.count Game.Math matches ..0 run scoreboard players set .generateWave Game.Math 0
execute if score generate.count Game.Math matches ..0 run scoreboard players set .summonCooldown Game.Math 200