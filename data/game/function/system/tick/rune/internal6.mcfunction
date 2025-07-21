function game:system/load/player_data_load
execute store result storage game:player myData.effects.Frightened.End int 1 run scoreboard players get .temp0 Game.Math
function game:system/load/player_data_save