execute store result score .dy Game.Math run data get entity @s Pos[1]
scoreboard players operation .dy Game.Math -= .y Game.Math
execute if score .dy Game.Math matches -1..1 at @s anchored eyes positioned ^ ^ ^0.001 run summon arrow ~ ~2 ~ {Tags:["Magic.Fire"],Fire:10,Invulnerable:true,damage:0,pickup:false,Motion:[0d,-5d,0d]}