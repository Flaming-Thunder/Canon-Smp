scoreboard players set @s Player.Lives 1
function game:api/player_update
playsound block.beacon.power_select ambient @a ~ ~ ~ 1 1 0
particle trial_spawner_detection_ominous ~ ~.2 ~ 0.3 0.4 0.3 0 50 normal
particle trial_spawner_detection_ominous ~ ~ ~ 0.3 0 0.3 0 40 normal
particle trial_spawner_detection_ominous ~ ~ ~ 0.6 0 0.6 0 40 normal
advancement grant @s only advancements:use_life_token/from_the_grave