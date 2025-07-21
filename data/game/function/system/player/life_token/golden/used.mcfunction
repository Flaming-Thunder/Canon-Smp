execute as @s if score @s Player.Lives matches 9 run scoreboard players add @s Player.Lives 1
execute as @s if score @s Player.Lives matches 9 run function game:system/player/life_token/maxed
execute as @s if score @s Player.Lives matches 8 run scoreboard players add @s Player.Lives 2
execute as @s if score @s Player.Lives matches 0..7 run scoreboard players add @s Player.Lives 3
function game:api/player_update
playsound block.beacon.power_select ambient @a ~ ~ ~ 1 1 0
particle trial_spawner_detection ~ ~.2 ~ 0.3 0.4 0.3 0 50 normal
particle trial_spawner_detection ~ ~ ~ 0.3 0 0.3 0 40 normal