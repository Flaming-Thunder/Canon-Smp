scoreboard players remove @s Player.Lives 1
function game:api/player_update
execute if score @s Player.Lives matches 2..10 run function game:system/tick/trigger/internal2
execute if score @s Player.Lives matches 11..15 run function game:system/tick/trigger/internal3
playsound block.note_block.guitar ambient @a ~ ~ ~ 1 1 0
particle trial_spawner_detection ~ ~ ~ 0.3 0 0.3 0 50