execute as @a at @s if score @s Retrive_Life matches 1.. run
  execute if score @s Player.Lives matches 2.. run
    scoreboard players remove @s Player.Lives 1
    function game:api/player_update
    execute if score @s Player.Lives matches 2..10 run
      execute if function game:system/util/inventory_full run loot spawn ~ ~ ~ loot game:give/life_token/classic
      execute unless function game:system/util/inventory_full run loot give @s loot game:give/life_token/classic
    #END
    execute if score @s Player.Lives matches 11..15 run
      execute if function game:system/util/inventory_full run loot spawn ~ ~ ~ loot game:give/life_token/golden
      execute unless function game:system/util/inventory_full run loot give @s loot game:give/life_token/golden
    #END
    playsound block.note_block.guitar ambient @a ~ ~ ~ 1 1 0
    particle trial_spawner_detection ~ ~ ~ 0.3 0 0.3 0 50
  #END
  scoreboard players remove @s Retrive_Life 1
#END

execute as @a at @s if score @s Check_Event_Time matches 1.. run
  scoreboard players operation Event.Canon.Seconds Game.Timer = Event.Canon Game.Timer
  scoreboard players operation Event.Canon.Seconds Game.Timer /= #20 Game.Math
  scoreboard players operation Event.Canon.Seconds Game.Timer %= #60 Game.Math
  scoreboard players operation Event.Canon.Minutes Game.Timer = Event.Canon.Seconds Game.Timer
  scoreboard players operation Event.Canon.Minutes Game.Timer /= #60 Game.Math

  execute if score Event.Canon.Seconds Game.Timer matches 11..60 run tellraw @s [{text:"\n[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold},{score:{name:Event.Canon.Minutes,objective:Game.Timer},color:aqua}, {text:":",color:blue},{score:{name:Event.Canon.Seconds,objective:Game.Timer},color:aqua},{text:"\n",color:aqua}]

  execute if score Event.Canon.Seconds Game.Timer matches 0..10 run tellraw @s [{text:"\n[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold},{score:{name:Event.Canon.Minutes,objective:Game.Timer},color:aqua}, {text:":",color:blue},{text:"0",color:aqua},{score:{name:Event.Canon.Seconds,objective:Game.Timer},color:aqua},{text:"\n",color:aqua}]

  scoreboard players set @s Check_Event_Time 0
#END
execute as @a at @s if score @s Game_Scape matches 1.. run
  scoreboard players set @s Game_Scape 0

  execute if predicate game:dimension/main run function game:api/state/save {dim:"main"}

  execute if predicate game:dimension/dev_world run function game:api/state/save {dim:"dev_world"}
  execute store result score .InGameScape Game.Math if predicate game:dimension/game_scape

  execute if score .InGameScape Game.Math matches 0 run
    execute unless entity @s[advancements={game:check/game_scape_join=true}] run
      execute in game:game_scape run tp @s 0 100 0
      clear @s
      advancement grant @s only game:check/game_scape_join


      function game:api/state/save {dim:"game_scape"}

    function game:api/state/load {dim:"game_scape"}


  execute if score .InGameScape Game.Math matches 1 run
    function game:api/state/save {dim:"game_scape"}
    function game:api/state/load {dim:"main"}
#END



execute as @a at @s if score @s Dev_World matches 1.. run
  scoreboard players set @s Dev_World 0

  execute if predicate game:dimension/main run function game:api/state/save {dim:"main"}

  execute if predicate game:dimension/game_scape run function game:api/state/save {dim:"game_scape"}

  execute store result score .InDevWorld Game.Math if predicate game:dimension/dev_world

  execute if score .InDevWorld Game.Math matches 0 run
    execute unless entity @s[advancements={game:check/dev_world_join=true}] run
      execute in game:dev_world run tp @s 0 100 0
      clear @s
      gamemode creative
      advancement grant @s only game:check/dev_world_join
      


      function game:api/state/save {dim:"dev_world"}

    function game:api/state/load {dim:"dev_world"}


  execute if score .InDevWorld Game.Math matches 1 run
    function game:api/state/save {dim:"dev_world"}
    function game:api/state/load {dim:"main"}

#END

