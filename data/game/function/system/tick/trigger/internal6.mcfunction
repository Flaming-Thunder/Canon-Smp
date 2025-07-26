execute unless entity @s[advancements={game:check/game_scape_join=true}] run function game:system/tick/trigger/internal7
function game:api/state/load {dim:"game_scape"}
function game:system/util/update_bosssbar
execute if entity @s[advancements={game:check/in_battle=true}] unless score Battle.Ongoing Game.Data matches 1 run function game:system/game/battle/tick/lobby/tp
execute if entity @s[advancements={game:check/in_mining=true}] unless score Mining.Ongoing Game.Data matches 1 run function game:system/game/mining/tick/lobby/tp