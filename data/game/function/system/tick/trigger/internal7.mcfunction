function game:system/game/tick/lobby/tp
advancement grant @s only game:check/game_scape_join
function game:api/state/save {dim:"game_scape"}