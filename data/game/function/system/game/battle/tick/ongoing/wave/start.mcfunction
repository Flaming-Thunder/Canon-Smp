scoreboard players set Battle.inWave Game.Math 1
scoreboard players set Battle.Survive Game.Timer 0
scoreboard players operation .temp Game.Math = Battle.Seed Game.Data
scoreboard players operation .temp Game.Math *= Battle.round Game.Data
scoreboard players operation .temp Game.Math += Battle.round Game.Data
scoreboard players operation .temp Game.Math *= .temp Game.Math
scoreboard players operation .temp Game.Math += Battle.round Game.Data
scoreboard players operation .temp Game.Math %= #50 Game.Math
execute if score .temp Game.Math matches 0 run function game:system/game/battle/tick/internal0