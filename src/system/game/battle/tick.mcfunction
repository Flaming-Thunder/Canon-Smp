
execute if score Battle.Ongoing Game.Data matches 1 run %FILE%/ongoing


/ongoing
	execute store result score Battle.GameTime Game.Timer run time query gametime
	scoreboard players operation Battle.GameTime Game.Timer -= Battle.StartTime Game.Timer

	execute store result score Battle.Players Game.Data if entity @a[advancements={game:check/in_battle=true},predicate=game:dimension/game_scape]

	execute if score Battle.inWave Game.Math matches 1 if score Battle.GameTime Game.Timer > Battle.Buy Game.Timer run %FILE%/ongoing/wave/start

	execute if score Battle.inWave Game.Math matches 0 unless data storage game:game_scape_data battle.round[0] unless entity @e[tag=Battle.Enemy] run %FILE%/ongoing/wave/end
	execute if score Battle.inWave Game.Math matches 0 unless score Battle.Survive Game.Timer matches 0 if score Battle.GameTime Game.Timer > Battle.Survive Game.Timer run %FILE%/ongoing/wave/end


	#The time beetween two mobs summon is SpawnRate-round*4 (for SpawnRate = 30s :10s[round 100]-30s[round 0])
	scoreboard players operation Battle.Summon Game.Math = Battle.round Game.Data
	scoreboard players operation Battle.Summon Game.Math *= #4 Game.Math
	scoreboard players operation Battle.Summon Game.Math += Battle.GameTime Game.Timer
	scoreboard players operation Battle.Summon Game.Math %= Battle.SpawnRate Game.Data
	scoreboard players operation Battle.Summon Game.Math /= Battle.Players Game.Data
	execute if score Battle.Summon Game.Math matches 0 run %FILE%/ongoing/wave/summon

	/wave

		/summon
			execute unless score Battle.Survive Game.Timer matches 0 run data modify storage game:game_scape_data battle.round append from storage game:game_scape_data battle.round[0]
			function game:system/game/battle/wave/summon
		#END

		/end
			kill @e[tag=Battle.Enemy]
			scoreboard players set Battle.inWave Game.Math 0
			scoreboard players operation Battle.Buy Game.Timer = Battle.GameTime Game.Timer
			scoreboard players operation Battle.Buy Game.Timer += Battle.Buy_Timer Game.Data
			scoreboard players add Battle.round Game.Data 1
			function game:system/game/battle/wave/generate
		#END

		/start
			scoreboard players set Battle.inWave Game.Math 1

			scoreboard players set Battle.Survive Game.Timer 0
			scoreboard players operation .temp Game.Math = Battle.Seed Game.Data
			scoreboard players operation .temp Game.Math *= Battle.round Game.Data
			scoreboard players operation .temp Game.Math += Battle.round Game.Data
			scoreboard players operation .temp Game.Math *= .temp Game.Math
			scoreboard players operation .temp Game.Math += Battle.round Game.Data
			scoreboard players operation .temp Game.Math %= #50 Game.Math
			execute if score .temp Game.Math matches 0 run
				scoreboard players operation Battle.Survive Game.Timer = Battle.GameTime Game.Timer
				scoreboard players operation Battle.Survive Game.Timer += Battle.Survive_Timer Game.Data
			#END

		#END

	#END
#END




/start
	scoreboard players set Battle.Ongoing Game.Data 1
	execute at @e[type=marker,tag=Battle.Lobby,limit=1] as @a[distance=..20] run
		advancement grant @s only game:check/in_battle
	#END
#END

/end
	scoreboard players set Battle.Ongoing Game.Data 0
	execute as @a[advancements={game:check/in_battle=true}] run %FILE%/lobby/tp
#END


/lobby

	/summon
		summon marker ~ ~ ~ {Tags:["Battle.Lobby"]}
	#END
	/tp
		execute in game:game_scape at @e[type=marker,tag=Battle.Lobby,limit=1] run tp @s ~ ~ ~ ~ ~
    clear @s
		advancement revoke @s only game:check/in_battle
	#END
#END

