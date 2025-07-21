execute if score Event.Canon Game.Timer matches 0 if data storage game:data {Data:{Event:{CanonEvent:1b}}} run data merge storage game:data {Data:{Event:{CanonEvent:2b}}}
execute if score Event.Canon Game.Timer matches 0 if data storage game:data {Data:{Event:{CanonEvent:3b}}} run data merge storage game:data {Data:{Event:{CanonEvent:0b}}}

execute if data storage game:data {Data:{Event:{CanonEvent:2b}}} run %FILE%/start
execute if data storage game:data {Data:{Event:{CanonEvent:3b}}} run %FILE%/while
execute if data storage game:data {Data:{Event:{CanonEvent:0b}}} run %FILE%/end
execute if data storage game:data {Data:{Event:{CanonEvent:1b}}} run %FILE%/while_not

execute if score Event.Canon Game.Timer matches 1.. run scoreboard players remove Event.Canon Game.Timer 1
execute if score Event.Canon.Deaths Game.Data matches 5..10 run %FILE%/end_early
execute store result bossbar game:canon_event value run scoreboard players get Event.Canon Game.Timer

/start
  difficulty hard
  execute store result score Event.Canon.Chance Game.Data run random value 1..100

  execute if score Event.Canon.Chance Game.Data > Event.Canon.Double_Time.Chance Game.Data run
    data merge storage game:data {Data:{Event:{CanonEvent:3b}}}
    %FILE%/chance_fail
  execute if score Event.Canon.Chance Game.Data <= Event.Canon.Double_Time.Chance Game.Data run
    data merge storage game:data {Data:{Event:{CanonEvent:1b}}}
    %FILE%/chance_pass

/end
  difficulty easy
  scoreboard players set Event.Canon.Deaths Game.Data 0

  execute store result score Event.Canon.Chance Game.Data run random value 1..100
  execute if score Event.Canon.Chance Game.Data > Event.Canon.Double_Time.Chance Game.Data run
    data merge storage game:data {Data:{Event:{CanonEvent:1b}}}
    %FILE%/chance_fail
  execute if score Event.Canon.Chance Game.Data <= Event.Canon.Double_Time.Chance Game.Data run
    data merge storage game:data {Data:{Event:{CanonEvent:3b}}}
    %FILE%/chance_pass

/chance_pass
  execute if data storage game:data {Data:{Event:{CanonEvent:1b}}} as @a run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Canon Event Has Been Delayed",color:aqua}, {text:" God Had Mercy", color:red}]
  execute if data storage game:data {Data:{Event:{CanonEvent:3b}}} as @a run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"",color:aqua}, {text:"DOUBLE TIME", color:red}]
  execute as @a at @s run playsound minecraft:entity.wither.spawn record @a ~ ~ ~ 0.2 1 0

  execute store result score Event.Canon Game.Timer run random value 6000..12000
  execute store result bossbar game:canon_event max run scoreboard players get Event.Canon Game.Timer
  execute if score Event.Canon.Double_Time Game.Data matches 3 run
    scoreboard players set Event.Canon.Double_Time Game.Data 3
    scoreboard players set Event.Canon.Double_Time.Chance Game.Data 0
  execute if score Event.Canon.Double_Time Game.Data matches 2 run
    scoreboard players set Event.Canon.Double_Time Game.Data 3
    scoreboard players set Event.Canon.Double_Time.Chance Game.Data 5
  execute if score Event.Canon.Double_Time Game.Data matches 1 run
    scoreboard players set Event.Canon.Double_Time Game.Data 2
    scoreboard players set Event.Canon.Double_Time.Chance Game.Data 10
  execute if score Event.Canon.Double_Time Game.Data matches 0 run
    scoreboard players set Event.Canon.Double_Time Game.Data 1
    scoreboard players set Event.Canon.Double_Time.Chance Game.Data 25

/chance_fail
  execute if data storage game:data {Data:{Event:{CanonEvent:1b}}} as @a at @s run playsound minecraft:entity.wither.death record @a ~ ~ ~ 0.1 1 0
  execute if data storage game:data {Data:{Event:{CanonEvent:1b}}} as @a run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Canon Event Has ",color:aqua}, {text:"Ended", color:green}]
  
  execute if data storage game:data {Data:{Event:{CanonEvent:3b}}} as @a at @s run playsound minecraft:entity.wither.spawn record @a ~ ~ ~ 0.1 1 0
  execute if data storage game:data {Data:{Event:{CanonEvent:3b}}} as @a run tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Canon Event Has ",color:aqua}, {text:"Begun", color:green}]

  execute store result score Event.Canon Game.Timer run random value 24000..36000
  execute store result bossbar game:canon_event max run scoreboard players get Event.Canon Game.Timer
  scoreboard players set Event.Canon.Double_Time Game.Data 0
  scoreboard players set Event.Canon.Double_Time.Chance Game.Data 50

/while
  bossbar set game:canon_event players @a
  execute as @a[advancements={game:checks/player_kill_player=true}] run %FILE%/while/player_killed_player
  /player_killed_player
    execute if score @s Player.Lives matches -10..-1 run scoreboard players add @s Player.Lives 1
    execute if score @s Player.Lives matches -10..-1 run function game:system/pull/update_player

    advancement revoke @s only game:checks/player_kill_player
/while_not
  bossbar set game:canon_event players @s

  execute if score Event.Canon Game.Timer matches ..600 as @a at @s run %FILE%/while_not/warn
  /warn
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
#
/end_early
  execute if score Event.Canon.Deaths Game.Data matches 5..10 if score Event.Canon Game.Timer matches 1.. run scoreboard players remove Event.Canon Game.Timer 1
  execute if score Event.Canon.Deaths Game.Data matches 6..10 if score Event.Canon Game.Timer matches 1.. run scoreboard players remove Event.Canon Game.Timer 1
  execute if score Event.Canon.Deaths Game.Data matches 7..10 if score Event.Canon Game.Timer matches 1.. run scoreboard players remove Event.Canon Game.Timer 1
  execute if score Event.Canon.Deaths Game.Data matches 8..10 if score Event.Canon Game.Timer matches 1.. run scoreboard players remove Event.Canon Game.Timer 1
  execute if score Event.Canon.Deaths Game.Data matches 9..10 if score Event.Canon Game.Timer matches 1.. run scoreboard players remove Event.Canon Game.Timer 1
  execute if score Event.Canon.Deaths Game.Data matches 10 if score Event.Canon Game.Timer matches 1.. run scoreboard players set Event.Canon Game.Timer 1