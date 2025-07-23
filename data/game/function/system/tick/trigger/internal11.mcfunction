execute in game:dev_world run tp @s 0 100 0
clear @s
gamemode creative
advancement grant @s only game:check/dev_world_join
function game:api/state/save {dim:"dev_world"}