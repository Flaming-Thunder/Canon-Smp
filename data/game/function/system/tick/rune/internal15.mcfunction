scoreboard players operation .id Game.Math = @s Player.ID
execute as @a if score @s Player.ID = .id Game.Math run tag @s add Magic.Owner
execute store result score .y Game.Math run data get entity @s Pos[1]
scoreboard players add @s Altar.Count 1
execute if score @s Altar.Count matches 1 as @e[tag=!Magic.Owner,distance=0..3] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 2 as @e[tag=!Magic.Owner,distance=3..3.5] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 3 as @e[tag=!Magic.Owner,distance=3.5..4] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 4 as @e[tag=!Magic.Owner,distance=4..4.5] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 5 as @e[tag=!Magic.Owner,distance=4.5..5] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 6 as @e[tag=!Magic.Owner,distance=5..5.5] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 7 as @e[tag=!Magic.Owner,distance=5.5..6] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 8 as @e[tag=!Magic.Owner,distance=6..6.5] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 9 as @e[tag=!Magic.Owner,distance=6.5..7] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 10 as @e[tag=!Magic.Owner,distance=7..7.5] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 11 as @e[tag=!Magic.Owner,distance=7.5..8] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 12 as @e[tag=!Magic.Owner,distance=8..8.5] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 13 as @e[tag=!Magic.Owner,distance=8.5..9] if data entity @s Health run function game:system/tick/rune/spell_inferno/fire/damage
execute if score @s Altar.Count matches 14.. run kill @s
scoreboard players add @s Altar.LockDelay 1
tag @a remove Magic.Owner