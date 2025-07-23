scoreboard players add @s Player.Lives 1
function game:api/player_update
playsound block.beacon.power_select ambient @a ~ ~ ~ 1 1 0
particle trial_spawner_detection ~ ~.2 ~ 0.3 0.4 0.3 0 50 normal
particle trial_spawner_detection ~ ~ ~ 0.3 0 0.3 0 40 normal
advancement grant @s only advancements:use_life_token/classic