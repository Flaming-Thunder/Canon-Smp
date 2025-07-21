execute if data storage game:data {Data:{Event:{CanonEvent:1b}}} as @a run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Canon Event Has Been Delayed",color:aqua}, {text:" God Had Mercy", color:red}]
execute if data storage game:data {Data:{Event:{CanonEvent:3b}}} as @a run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"",color:aqua}, {text:"DOUBLE TIME", color:red}]
execute as @a at @s run playsound minecraft:entity.wither.spawn record @a ~ ~ ~ 0.2 1 0
execute store result score Event.Canon Game.Timer run random value 6000..12000
execute store result bossbar game:canon_event max run scoreboard players get Event.Canon Game.Timer
execute if score Event.Canon.Double_Time Game.Data matches 3 run function game:system/world/canon_event/internal4
execute if score Event.Canon.Double_Time Game.Data matches 2 run function game:system/world/canon_event/internal5
execute if score Event.Canon.Double_Time Game.Data matches 1 run function game:system/world/canon_event/internal6
execute if score Event.Canon.Double_Time Game.Data matches 0 run function game:system/world/canon_event/internal7