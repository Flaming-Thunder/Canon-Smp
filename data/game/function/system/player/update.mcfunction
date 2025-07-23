scoreboard players set Player.Teams.Update Game.Data 15
execute as @s run function game:system/player/update/loop {Update:15}
attribute @s armor base reset
attribute @s max_health base reset
attribute @s attack_damage base reset
attribute @s attack_speed base reset
attribute @s entity_interaction_range base set 3.0
attribute @s block_interaction_range base set 4.5
attribute @s block_break_speed base reset
attribute @s jump_strength base reset
attribute @s movement_speed base reset
attribute @s sneaking_speed base reset
attribute @s step_height base reset
attribute @s oxygen_bonus base reset
attribute @s scale base reset
attribute @s safe_fall_distance base reset
attribute @s fall_damage_multiplier base reset
tag @s remove Vampirism
tag @s remove Aquaphobic
execute as @s if score @s Player.Lives matches 0 run function game:system/player/update/internal0
execute as @s if score @s Player.Lives matches -1 run function game:system/player/update/internal1
execute as @s if score @s Player.Lives matches -2 run function game:system/player/update/internal2
execute as @s if score @s Player.Lives matches -3 run function game:system/player/update/internal3
execute as @s if score @s Player.Lives matches -4 run function game:system/player/update/internal4
execute as @s if score @s Player.Lives matches -5 run function game:system/player/update/internal5
execute as @s if score @s Player.Lives matches -6 run function game:system/player/update/internal6
execute as @s if score @s Player.Lives matches -7 run function game:system/player/update/internal7
execute as @s if score @s Player.Lives matches -8 run function game:system/player/update/internal8
execute as @s if score @s Player.Lives matches -9 run function game:system/player/update/internal9
execute as @s if score @s Player.Lives matches ..-10 run function game:system/player/update/internal10