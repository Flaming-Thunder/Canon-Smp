
tp 00000001-0000-0002-0000-000300000004 0.0 0.0 0.0

execute store result score #x buttons.main run data get entity 00000001-0000-0002-0000-000300000004 Pos[0] 1000

execute as 00000001-0000-0002-0000-000300000004 positioned 0.0 0.0 0.0 rotated ~ 0 run tp @s ^ ^ ^1

execute store result score #dx buttons.main run data get entity 00000001-0000-0002-0000-000300000004 Pos[0] 1000


return run scoreboard players operation #x buttons.main -= #dx buttons.main

