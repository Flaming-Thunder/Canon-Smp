function game:system/load/player_data_load
$data modify storage game:math temp.State set from storage game:player myData.State.$(dim)
function game:api/state/load/final
execute store result score .Health Game.Math run data get storage game:math temp.State.Health 1000
execute store result score .MaxHealth Game.Math run attribute @s max_health get 1000
scoreboard players operation .MaxHealth Game.Math -= .Health Game.Math
execute store result storage game:player myData.damage float 0.001 run scoreboard players get .MaxHealth Game.Math
effect give @s instant_health 1 10 true
execute store result score .GameType Game.Math run data get storage game:math temp.State.playerGameType
execute if score .GameType Game.Math matches 0 run gamemode survival @s
execute if score .GameType Game.Math matches 1 run gamemode creative @s
execute if score .GameType Game.Math matches 2 run gamemode adventure @s
execute if score .GameType Game.Math matches 3 run gamemode spectator @s
function game:system/load/player_data_save