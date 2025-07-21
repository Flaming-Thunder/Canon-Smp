execute if data storage game:data {Data:{Event:{CanonEvent:1b}}} as @a at @s run playsound minecraft:entity.wither.death record @a ~ ~ ~ 0.1 1 0
execute if data storage game:data {Data:{Event:{CanonEvent:1b}}} as @a run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Canon Event Has ",color:aqua}, {text:"Ended", color:green}]
execute if data storage game:data {Data:{Event:{CanonEvent:3b}}} as @a at @s run playsound minecraft:entity.wither.spawn record @a ~ ~ ~ 0.1 1 0
execute if data storage game:data {Data:{Event:{CanonEvent:3b}}} as @a run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Canon Event Has ",color:aqua}, {text:"Begun", color:green}]
execute store result score Event.Canon Game.Timer run random value 24000..36000
execute store result bossbar game:canon_event max run scoreboard players get Event.Canon Game.Timer
scoreboard players set Event.Canon.Double_Time Game.Data 0
scoreboard players set Event.Canon.Double_Time.Chance Game.Data 50