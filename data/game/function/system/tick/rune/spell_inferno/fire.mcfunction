execute store result score .temp0 Game.Math run time query gametime
execute if score .temp0 Game.Math > @s Altar.LockDelay run function game:system/tick/rune/internal15