$data modify storage game:game_scape_data battle.round append value {id:"$(id)",spawner:"$(spawner)"}
scoreboard players add zombie.generated Game.Math 1
$data modify storage game:math temp.array1 set from storage game:game_scape_data battle.group_table[{id:"$(id)"}].proba
scoreboard players operation .rand Game.Math = Battle.Seed Game.Data
scoreboard players operation .rand Game.Math += generate.count Game.Math
scoreboard players operation .rand Game.Math *= Battle.round Game.Data
scoreboard players operation .rand Game.Math *= generate.count Game.Math
scoreboard players operation .rand Game.Math %= #100 Game.Math
scoreboard players set generate.count2 Game.Math 0
scoreboard players remove generate.count Game.Math 1
$execute if score generate.count Game.Math matches 1.. run function game:system/game/battle/wave/generate/list/group {spawner:"$(spawner)"}