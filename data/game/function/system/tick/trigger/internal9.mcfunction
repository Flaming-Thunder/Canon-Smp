scoreboard players set @s Dev_World 0
execute if predicate game:dimension/main run function game:api/state/save {dim:"main"}
execute if predicate game:dimension/game_scape run function game:api/state/save {dim:"game_scape"}
execute store result score .InDevWorld Game.Math if predicate game:dimension/dev_world
execute if score .InDevWorld Game.Math matches 0 run function game:system/tick/trigger/internal10
execute if score .InDevWorld Game.Math matches 1 run function game:system/tick/trigger/internal12