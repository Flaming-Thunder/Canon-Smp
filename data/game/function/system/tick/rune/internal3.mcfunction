particle heart ~ ~ ~ 12.5 12.5 12.5 0.1 100 force
function game:system/tick/rune/damage
execute as @e[distance=..25] if data entity @s Health at @s run function game:system/tick/rune/internal4