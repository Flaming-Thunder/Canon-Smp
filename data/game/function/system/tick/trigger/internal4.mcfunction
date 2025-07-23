scoreboard players operation Event.Canon.Seconds Game.Timer = Event.Canon Game.Timer
scoreboard players operation Event.Canon.Seconds Game.Timer /= #20 Game.Math
scoreboard players operation Event.Canon.Seconds Game.Timer %= #60 Game.Math
scoreboard players operation Event.Canon.Minutes Game.Timer = Event.Canon.Seconds Game.Timer
scoreboard players operation Event.Canon.Minutes Game.Timer /= #60 Game.Math
execute if score Event.Canon.Seconds Game.Timer matches 11..60 run tellraw @s [{text:"\n[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold},{score:{name:Event.Canon.Minutes,objective:Game.Timer},color:aqua}, {text:":",color:blue},{score:{name:Event.Canon.Seconds,objective:Game.Timer},color:aqua},{text:"\n",color:aqua}]
execute if score Event.Canon.Seconds Game.Timer matches 0..10 run tellraw @s [{text:"\n[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold},{score:{name:Event.Canon.Minutes,objective:Game.Timer},color:aqua}, {text:":",color:blue},{text:"0",color:aqua},{score:{name:Event.Canon.Seconds,objective:Game.Timer},color:aqua},{text:"\n",color:aqua}]
scoreboard players set @s Check_Event_Time 0