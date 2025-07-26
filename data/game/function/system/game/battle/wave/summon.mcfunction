execute if data storage game:game_scape_data battle.round[0] run function game:system/game/battle/wavesummon/macro with storage game:game_scape_data round[0]
execute if data storage game:game_scape_data battle.round[0] run data remove storage game:game_scape_data round[0]
scoreboard players remove zombie.generated Game.Math 1