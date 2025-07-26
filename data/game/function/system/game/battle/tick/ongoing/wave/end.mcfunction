kill @e[tag=Battle.Enemy]
scoreboard players set Battle.inWave Game.Math 0
scoreboard players operation Battle.Buy Game.Timer = Battle.GameTime Game.Timer
scoreboard players operation Battle.Buy Game.Timer += Battle.Buy_Timer Game.Data
scoreboard players add Battle.round Game.Data 1
function game:system/game/battle/wave/generate