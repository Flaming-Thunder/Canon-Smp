execute if score @s Player.Lives matches -10..-1 run scoreboard players add @s Player.Lives 1
execute if score @s Player.Lives matches -10..-1 run function game:api/player_update
advancement revoke @s only game:check/player_kill_player