execute store result score .temp0 Game.Math run time query gametime
execute if score .temp0 Game.Math > @s Altar.LockDelay if entity @s[tag=!Magic.Phase2] run function game:system/tick/rune/spell_construction/block/setblock with entity @s block_state
execute if score .temp0 Game.Math > @s Altar.LockDelay if entity @s[tag=Magic.Phase2] run function game:system/tick/rune/spell_construction/block/setair with entity @s block_state
execute if entity @s[tag=Magic.Phase2] if block ~ ~ ~ #air run kill @s