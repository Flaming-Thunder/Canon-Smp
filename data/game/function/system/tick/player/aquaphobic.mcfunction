execute if predicate game:role_specific/is_not_under_block if predicate game:world/is_raining run function game:system/tick/player/aquaphobic/in_water
execute if predicate game:role_specific/is_not_under_block if predicate game:world/is_thundering run function game:system/tick/player/aquaphobic/in_water
execute if block ~ ~ ~ #game:waterloggable[waterlogged=true] run function game:system/tick/player/aquaphobic/in_water
execute if block ~ ~ ~ water_cauldron run function game:system/tick/player/aquaphobic/in_water
execute if block ~ ~ ~ water run function game:system/tick/player/aquaphobic/in_water