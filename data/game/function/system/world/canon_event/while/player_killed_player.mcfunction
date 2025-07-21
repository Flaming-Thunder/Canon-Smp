execute if score @s Player.Lives matches -10..-1 run scoreboard players add @s Player.Lives 1
execute if score @s Player.Lives matches -10..-1 run function game:system/pull/update_player
advancement revoke @s only game:checks/player_kill_player