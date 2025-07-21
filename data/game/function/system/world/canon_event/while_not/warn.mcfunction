execute if score Event.Canon Game.Timer matches 600 run playsound minecraft:block.note_block.pling neutral @s ~ ~ ~ 0.5 1 0
execute if score Event.Canon Game.Timer matches 600 run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Starting Canon Event in... ",color:aqua}, {text:"30 Seconds", color:green}]
execute if score Event.Canon Game.Timer matches 200 run playsound minecraft:block.note_block.pling neutral @s ~ ~ ~ 0.5 1 0
execute if score Event.Canon Game.Timer matches 200 run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Starting Canon Event in... ",color:aqua}, {text:"10 Seconds", color:green}]
execute if score Event.Canon Game.Timer matches 100 run playsound minecraft:block.note_block.pling neutral @s ~ ~ ~ 0.5 1 0
execute if score Event.Canon Game.Timer matches 100 run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Starting Canon Event in ",color:aqua}, {text:"5", color:green}]
execute if score Event.Canon Game.Timer matches 80 run playsound minecraft:block.note_block.pling neutral @s ~ ~ ~ 0.5 1 0
execute if score Event.Canon Game.Timer matches 80 run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Starting Canon Event in ",color:aqua}, {text:"4", color:yellow}]
execute if score Event.Canon Game.Timer matches 60 run playsound minecraft:block.note_block.pling neutral @s ~ ~ ~ 0.5 1 0
execute if score Event.Canon Game.Timer matches 60 run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Starting Canon Event in ",color:aqua}, {text:"3", color:gold}]
execute if score Event.Canon Game.Timer matches 40 run playsound minecraft:block.note_block.pling neutral @s ~ ~ ~ 0.5 1 0
execute if score Event.Canon Game.Timer matches 40 run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Starting Canon Event in ",color:aqua}, {text:"2", color:red}]
execute if score Event.Canon Game.Timer matches 20 run playsound minecraft:block.note_block.pling neutral @s ~ ~ ~ 0.5 1 0
execute if score Event.Canon Game.Timer matches 20 run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Starting Canon Event in ",color:aqua}, {text:"1", color:dark_red,bold:true}]
execute if score Event.Canon Game.Timer matches 10 run playsound minecraft:block.note_block.pling neutral @s ~ ~ ~ 0.5 1 0
execute if score Event.Canon Game.Timer matches 10 run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Rolling Chance...",color:aqua}, {text:"\n", color:dark_red,bold:true}]