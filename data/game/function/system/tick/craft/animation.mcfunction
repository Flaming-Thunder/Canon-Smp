execute at @s run particle enchant ~ ~ ~ 0 0 0 0 1 normal
data modify entity @e[type=marker,tag=Game.Math,limit=1] Pos set from entity @s data.AnimationCenter
execute store result score .temp0 Game.Math run data get entity @s data.AnimationCenter[1] 100
scoreboard players operation .temp1 Game.Math = @s Altar.LockDelay
scoreboard players operation .temp1 Game.Math *= #300 Game.Math
scoreboard players operation .temp1 Game.Math /= Altar_Craft.Delay Game.Data
scoreboard players remove .temp1 Game.Math 300
scoreboard players operation .temp1 Game.Math *= #-1 Game.Math
scoreboard players operation .temp0 Game.Math += .temp1 Game.Math
execute store result entity @e[type=marker,tag=Game.Math,limit=1] Pos[1] double 0.01 run scoreboard players get .temp0 Game.Math
scoreboard players operation .temp0 Game.Math = @s Altar.LockDelay
scoreboard players operation .temp0 Game.Math *= #100 Game.Math
scoreboard players operation .temp0 Game.Math /= Altar_Craft.Delay Game.Data
execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches 80.. at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^0.1 ^ ^0.01
execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches 80.. at @s run rotate @s ~-5 ~
execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches 40..79 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^0.15 ^ ^0.045
execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches 40..79 at @s run rotate @s ~-7.5 ~
execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches ..40 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^0.2 ^ ^0.15
execute if entity @s[tag=!Magic.AnimationInversed] if score .temp0 Game.Math matches ..40 at @s run rotate @s ~-15 ~
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 80.. at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.1 ^ ^0.01
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 80.. at @s run rotate @s ~5 ~
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 60..79 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.125 ^ ^0.03
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 60..79 at @s run rotate @s ~6.25 ~
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 40..59 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.15 ^ ^0.045
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 40..59 at @s run rotate @s ~7.5 ~
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 25..39 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.2 ^ ^0.15
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 25..39 at @s run rotate @s ~10 ~
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 10..24 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.22 ^ ^0.18
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches 10..24 at @s run rotate @s ~15 ~
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches ..9 at @s facing entity @e[type=marker,tag=Game.Math,limit=1] feet run tp @s ^-0.28 ^ ^0.2
execute if entity @s[tag=Magic.AnimationInversed] if score .temp0 Game.Math matches ..9 at @s run rotate @s ~20 ~
execute if score .temp0 Game.Math matches 80 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
execute if score .temp0 Game.Math matches 60 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
execute if score .temp0 Game.Math matches 40 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
execute if score .temp0 Game.Math matches 25 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
execute if score .temp0 Game.Math matches 10 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
execute if score .temp0 Game.Math matches 5 at @s run particle ominous_spawning ~ ~ ~ 0.02 0.02 0.02 0.1 8 normal
execute if score .temp0 Game.Math matches 2 at @s run particle end_rod ~ ~ ~ 0 0 0 0.2 10 normal
execute if score .temp0 Game.Math matches 80 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 0.7 0
execute if score .temp0 Game.Math matches 60 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 0.8 0
execute if score .temp0 Game.Math matches 40 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 0.9 0
execute if score .temp0 Game.Math matches 25 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 1.0 0
execute if score .temp0 Game.Math matches 10 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 1.1 0
execute if score .temp0 Game.Math matches 5 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 1.2 0
execute if score .temp0 Game.Math matches 2 at @s run playsound minecraft:block.trial_spawner.ominous_activate block @a ~ ~ ~ 0.03 1.2 0
execute if score @s Altar.LockDelay matches 0 at @s run function game:system/tick/craft/internal2
scoreboard players remove @s Altar.LockDelay 1