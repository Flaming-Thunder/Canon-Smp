execute on passengers if entity @s[type=item_display] run data modify storage game:math temp.item set from entity @s item
execute on passengers if entity @s[type=item_display] store result score .haveItem Game.Math if data entity @s item
execute if score .haveItem Game.Math matches 0 run data remove storage game:math temp.item
execute store result score .isAltar Game.Math if entity @s[tag=Magic.Altar]
fill ~ ~ ~ ~ ~ ~ air destroy
execute if block ~ ~-0.5 ~ #air run function game:system/tick/pedistal/remove
execute unless score @s Altar.LockDelay matches 1.. on passengers if entity @s[type=interaction] run function game:system/tick/pedistal/internal0
execute on passengers if entity @s[type=interaction] run function game:system/tick/pedistal/internal4
execute if score @s Altar.LockDelay matches 0 if data entity @s data.loot at @s positioned ~ ~4 ~ run function game:system/tick/pedistal/craft_result with entity @s data
execute on passengers if entity @s[type=item_display] at @s run rotate @s ~2 ~
execute if score @s Altar.LockDelay matches 0.. run scoreboard players remove @s Altar.LockDelay 1
function game:system/tick/pedistal/support_display
execute store result score .temp0 Game.Math run random value 0..9
execute if score .temp0 Game.Math matches 0 run function game:system/tick/pedistal/ambiant_particle