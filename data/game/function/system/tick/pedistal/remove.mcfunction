execute if entity @s[tag=!Magic.Altar,tag=Magic.Simple] run loot spawn ~ ~ ~ loot game:give/pedestal/simple
execute if entity @s[tag=!Magic.Altar,tag=Magic.Basic] run loot spawn ~ ~ ~ loot game:give/pedestal/basic
execute if entity @s[tag=Magic.Altar,tag=Magic.Simple] run loot spawn ~ ~ ~ loot game:give/altar/simple
execute if entity @s[tag=Magic.Altar,tag=Magic.Basic] run loot spawn ~ ~ ~ loot game:give/altar/basic
execute as @e[type=block_display,limit=1,distance=..0.1,tag=Magic.PedestalHitbox] run function game:system/tick/pedistal/remove/hitbox
execute positioned ~ ~0.125 ~ as @e[type=block_display,limit=1,distance=..0.1,tag=Magic.PedestalHitbox] run function game:system/tick/pedistal/remove/hitbox
execute positioned ~ ~0.625 ~ as @e[type=block_display,limit=1,distance=..0.1,tag=Magic.PedestalHitbox] run function game:system/tick/pedistal/remove/hitbox
execute if score .haveItem Game.Math matches 1 run function game:system/tick/pedistal/drop_item
execute on passengers run kill @s
kill @s