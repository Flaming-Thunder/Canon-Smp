execute as @s if score @s Player.Lives matches 10.. run function game:system/player/life_token/classic/maxed
execute as @s if score @s Player.Lives matches 0..9 run function game:system/player/life_token/classic/used
execute as @s if score @s Player.Lives matches ..-1 run function game:system/player/life_token/classic/undead
advancement revoke @s only game:use_life_token/classic