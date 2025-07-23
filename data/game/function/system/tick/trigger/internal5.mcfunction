scoreboard players set @s Game_Scape 0
execute if predicate game:dimension/main run function game:api/state/save {dim:"main"}
execute if predicate game:dimension/dev_world run function game:api/state/save {dim:"dev_world"}
execute store result score .InGameScape Game.Math if predicate game:dimension/game_scape
execute if score .InGameScape Game.Math matches 0 run function game:system/tick/trigger/internal6
execute if score .InGameScape Game.Math matches 1 run function game:system/tick/trigger/internal8