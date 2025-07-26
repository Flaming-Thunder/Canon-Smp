/table
	data modify storage game:game_scape_data battle.spawn_table set value []
	data modify storage game:game_scape_data battle.spawn_table append value {id:"husk",weight:"decrease {m:40,a:20,t:0}",spawner:"ground"}
	data modify storage game:game_scape_data battle.spawn_table append value {id:"skeleton",weight:"decrease {m:27,a:30,t:0}",spawner:"ground"}
	data modify storage game:game_scape_data battle.spawn_table append value {id:"silverfish",weight:"pic {m:10,a:40,t:9}",spawner:"ground"}
	data modify storage game:game_scape_data battle.spawn_table append value {id:"phantom",weight:"increase {m:20,a:10,t:10}",spawner:"air"}


	data modify storage game:game_scape_data battle.group_table set value []
	data modify storage game:game_scape_data battle.group_table append value {id:"husk",proba:[{id:"giant",chance:"0"},{id:"husk",chance:"1..69"},{id:0,chance:"70.."}]}
	data modify storage game:game_scape_data battle.group_table append value {id:"skeleton",proba:[{id:"skeleton",chance:"..39"},{id:0,"chance":"40..79"},{id:"husk",chance:"80.."}]}
	data modify storage game:game_scape_data battle.group_table append value {id:"giant",proba:[{id:0,chance:"0..100"}]}
	data modify storage game:game_scape_data battle.group_table append value {id:"silverfish",proba:[{id:"silverfish",chance:"0..79"}]}
	data modify storage game:game_scape_data battle.group_table append value {id:"phantom",proba:[{id:"phantom",chance:"0..49",id:0,chance:"50.."}]}

#END

/generate
	data modify storage game:math temp.array set from storage game:game_scape_data battle.spawn_table
	scoreboard players reset * Game.Battle.Weight
	scoreboard players set generate.count Game.Math 0

	%FILE%/generate/weight


	data modify storage game:math temp.array set from storage game:game_scape_data battle.spawn_table
	scoreboard players set .generateWave Game.Math 1
	scoreboard players set generate.count Game.Math 3
	scoreboard players operation generate.count Game.Math *= Battle.round Game.Data
	scoreboard players operation generate.count Game.Math /= #2 Game.Math
	scoreboard players add generate.count Game.Math 12


	data modify storage game:game_scape_data battle.round set value []

	scoreboard players set zombie.generated Game.Math 0

	%FILE%/generate/list

	/Battle.Seed
		
		data modify storage game:math temp.id set from storage game:math temp.array[0].id
		data modify storage game:math temp.Battle.Seed set from storage game:math temp.array[0].weight
		execute store result storage game:math temp.count int 1 run scoreboard players get generate.count Game.Math

		%FILE%/generate/weight/macro with storage game:math temp
		/macro
			$execute store result score .$(id)$(count) Game.Battle.Weight run function game:system/game/battle/weight_function/$(weight)
			$execute if score .$(id)$(count) Game.Battle.Weight matches ..0 run scoreboard players reset .$(id)$(count) Game.Battle.Weight
			$execute if score .$(id)$(count) Game.Battle.Weight matches 0.. run scoreboard players operation .total Game.Battle.Weight += .$(id)$(count) Game.Battle.Weight
		#END

		scoreboard players add generate.count Game.Math 1


		data remove storage game:math temp.array[0]
		execute if data storage game:math temp.array[0] run %FILE%/generate/weight
	#END

	/list
		scoreboard players operation .rand Game.Math = Battle.Seed Game.Data
		scoreboard players operation .rand Game.Math += generate.count Game.Math
		scoreboard players operation .rand Game.Math *= Battle.round Game.Data
		scoreboard players operation .rand Game.Math %= .total Game.Battle.Weight


		data modify storage game:math temp.array set from storage game:game_scape_data battle.spawn_table

		scoreboard players set .total2 Game.Battle.Weight 0

		scoreboard players set generate.count2 Game.Math 0

		%FILE%/generate/list/loop

		%FILE%/generate/list/append with storage game:math temp.array[0]


		execute if score generate.count Game.Math matches 1.. run schedule function game:system/game/battle/wave/generate/list 1 append
		execute if score generate.count Game.Math matches 1.. run title @a actionbar {"text": "generating round...","color": "gray"}
		execute if score generate.count Game.Math matches ..0 run title @a actionbar {"text": "round generated","color": "green"}
		execute if score generate.count Game.Math matches ..0 run title @a title [{"text": "Round ","color": "red"},{"score":{"name": ".round","objective": "Game.Math"}}]

		execute if score generate.count Game.Math matches ..0 run scoreboard players set .generateWave Game.Math 0
		execute if score generate.count Game.Math matches ..0 run scoreboard players set .summonCooldown Game.Math 200
	
		/loop
			data modify storage game:math temp.id set from storage game:math temp.array[0].id
			data modify storage game:math temp.weight set from storage game:math temp.array[0].weight
			execute store result storage game:math temp.count int 1 run scoreboard players get generate.count2 Game.Math

			execute store result score .break Game.Math run %FILE%/generate/list/loop/macro with storage game:math temp
			/macro
				$execute if score .$(id)$(count) Game.Battle.Weight matches 1.. run scoreboard players operation .test Game.Battle.Weight = .$(id)$(count) Game.Battle.Weight
				$execute if score .$(id)$(count) Game.Battle.Weight matches 1.. run scoreboard players operation .test Game.Battle.Weight += .total2 Game.Battle.Weight
				$execute if score .$(id)$(count) Game.Battle.Weight matches 1.. if score .test Game.Battle.Weight >= .rand Game.Math run return 1
				$execute if score .$(id)$(count) Game.Battle.Weight matches 1.. run scoreboard players operation .total2 Game.Battle.Weight += .$(id)$(count) Game.Battle.Weight
				return 0
			#END

			scoreboard players add generate.count2 Game.Math 1

			execute if score .break Game.Math matches 0 run data remove storage game:math temp.array[0]
			execute if score .break Game.Math matches 0 if data storage game:math temp.array[0] run %FILE%/generate/list/loop

		#END

		/append
			$data modify storage game:game_scape_data battle.round append value {id:"$(id)",spawner:"$(spawner)"}

			scoreboard players add zombie.generated Game.Math 1

			$data modify storage game:math temp.array1 set from storage game:game_scape_data battle.group_table[{id:"$(id)"}].proba

			scoreboard players operation .rand Game.Math = Battle.Seed Game.Data
			scoreboard players operation .rand Game.Math += generate.count Game.Math
			scoreboard players operation .rand Game.Math *= Battle.round Game.Data
			scoreboard players operation .rand Game.Math *= generate.count Game.Math
			scoreboard players operation .rand Game.Math %= #100 Game.Math

			scoreboard players set generate.count2 Game.Math 0

			scoreboard players remove generate.count Game.Math 1

			$execute if score generate.count Game.Math matches 1.. run %FILE%/generate/list/group {spawner:"$(spawner)"}

		#END
		/group
			scoreboard players set .break Game.Math 0

			data modify storage game:math temp.id set from storage game:math temp.array1[0].id
			data modify storage game:math temp.chance set from storage game:math temp.array1[0].chance
			$data modify storage game:math temp.spawner set value "$(spawner)"
			%FILE%/generate/list/group/macro with storage game:math temp
			/macro
				execute store result score .test Game.Math run data get storage game:math temp.id
				$execute if score .rand Game.Math matches $(chance) unless score .test Game.Math matches 0 run %FILE%/generate/list/group/append {id:"$(id)",spawner:"$(spawner)"}
				$execute if score .rand Game.Math matches $(chance) run scoreboard players set .break Game.Math 1
			#END

			data remove storage game:math temp.array1[0]

			$execute if score .break Game.Math matches 0 if data storage game:math temp.array1[0] run %FILE%/generate/list/group {spawner:"$(spawner)"}

			/append
				$data modify storage game:game_scape_data battle.round append value {id:"$(id)",spawner:"$(spawner)"}
				scoreboard players add zombie.generated Game.Math 1
				$data modify storage game:math temp.array1 set from storage game:game_scape_data battle.group_table[{id:"$(id)"}].proba

				scoreboard players add generate.count2 Game.Math 1

				scoreboard players operation .rand Game.Math = Battle.Seed Game.Data
				scoreboard players operation .rand Game.Math += generate.count Game.Math
				scoreboard players operation .rand Game.Math *= Battle.round Game.Data
				scoreboard players operation .rand Game.Math *= generate.count Game.Math
				scoreboard players operation .rand Game.Math += generate.count2 Game.Math
				scoreboard players operation .rand Game.Math %= #100 Game.Math

				scoreboard players remove generate.count Game.Math 1

				$execute if score generate.count Game.Math matches 1.. run %FILE%/generate/list/group {spawner:"$(spawner)"}

			#END
		#END


	#END

#END


/summon
	execute if data storage game:game_scape_data battle.round[0] run %FILE%summon/macro with storage game:game_scape_data round[0]
	execute if data storage game:game_scape_data battle.round[0] run data remove storage game:game_scape_data round[0]
	scoreboard players remove zombie.generated Game.Math 1
	#END
	/macro
		$execute at @e[type=marker,tag=Battle.Spawner,tag=Battle.$(spawner),limit=1,sort=random] run function game:system/game/battle/summon/$(id)
	#END
#END





