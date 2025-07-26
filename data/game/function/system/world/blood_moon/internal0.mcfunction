data modify entity @s data.Data.Blood_Mooned set value 1b
particle trial_spawner_detection_ominous ~ ~ ~ 0.3 0 0.3 0 20 normal
execute if entity @s[type=zombie] run function game:system/world/blood_moon/internal1
execute if entity @s[type=skeleton] run function game:system/world/blood_moon/internal3