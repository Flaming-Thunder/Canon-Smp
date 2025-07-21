function game:system/tick/rune/damage
execute if entity @s[tag=Magic.Coward] run damage @s 10 magic
execute if entity @s[tag=Magic.Coward] as @e[tag=Magic.CowardiceBox,distance=..2] run function game:system/tick/rune/cowardice/box/break
effect give @s glowing 600 1 true
effect give @s strength 180 3
effect give @a[distance=0.1..2.5] strength 120 1
effect clear @s slowness