
execute as @a run
	#scoreboard players operation .temp Game.Data = @s Player.Break.Stone
	#scoreboard players operation .temp Game.Data *= #2 Game.Math
	#scoreboard players operation @s Player.Break.Score += .temp Game.Data
	#scoreboard players set @s Player.Break.Stone 0

  scoreboard players operation @s Player.Break.Score += @s Player.Break.Stone
  scoreboard players remove @s Player.Break.Stone 1
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Diorite
  scoreboard players remove @s Player.Break.Diorite 1
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Granite
  scoreboard players remove @s Player.Break.Granite 1
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Cobblestone
  scoreboard players remove @s Player.Break.Cobblestone 1
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Cobbled_Deepslate
  scoreboard players remove @s Player.Break.Cobbled_Deepslate 1
  
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Deepslate
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Deepslate
  scoreboard players remove @s Player.Break.Deepslate 1
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Tuff
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Tuff
  scoreboard players remove @s Player.Break.Tuff 1
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Calcite
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Calcite
  scoreboard players remove @s Player.Break.Calcite 1
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Dripstone
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Dripstone
  scoreboard players remove @s Player.Break.Dripstone 1
  
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Coal
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Coal
  scoreboard players operation @s Player.Break.Score += @s Player.Break.Coal
  scoreboard players remove @s Player.Break.Coal 1
  
  scoreboard players operation .temp Game.Data += @s Player.Break.Coal
  scoreboard players operation .temp Game.Data += @s Player.Break.Copper
  scoreboard players operation .temp Game.Data += @s Player.Break.Iron
  scoreboard players operation .temp Game.Data += @s Player.Break.Gold
  scoreboard players operation .temp Game.Data += @s Player.Break.Redstone
  scoreboard players operation .temp Game.Data += @s Player.Break.Lapis
  scoreboard players operation .temp Game.Data += @s Player.Break.Emerald
  scoreboard players operation .temp Game.Data += @s Player.Break.Diamond
  
  scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Coal
  scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Copper
  scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Iron
  scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Gold
  scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Redstone
  scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Lapis
  scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Emerald
  scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Diamond


execute as @e[type=item] if items entity @s container.0 #game:ores at @s run
	kill @s


/lobby
	/summon
		summon marker ~ ~ ~ {Tags:["Mining.Lobby"]}
	#END
	/tp
		execute in game:game_scape at @e[type=marker,tag=Mining.Lobby,limit=1] run tp @s ~ ~ ~ ~ ~
    clear @s
		advancement revoke @s only game:check/in_mining
	#END
#END


/generate
	data modify storage game:math temp.pos set value [0,0,0]
	#-20 99 103 20 0 143
	execute store result storage game:math temp.pos[0] double 1 run random value -20..20
	execute store result storage game:math temp.pos[1] double 1 run random value 0..99
	execute store result storage game:math temp.pos[2] double 1 run random value 103..143


#END
