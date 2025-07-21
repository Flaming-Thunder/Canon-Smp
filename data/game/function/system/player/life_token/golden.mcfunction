execute as @s if score @s Player.Lives matches 16.. run function game:system/player/life_token/golden/supermaxxed
execute as @s if score @s Player.Lives matches 10..15 run function game:system/player/life_token/golden/maxed
execute as @s if score @s Player.Lives matches 0..9 run function game:system/player/life_token/golden/used
execute as @s if score @s Player.Lives matches ..-1 run function game:system/player/life_token/golden/undead
advancement revoke @s only game:use_life_token/golden