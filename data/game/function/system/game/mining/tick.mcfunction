execute as @a run function game:system/game/mining/tick/internal0
execute as @e[type=item] if items entity @s container.0 #game:ores at @s run function game:system/game/mining/tick/internal1