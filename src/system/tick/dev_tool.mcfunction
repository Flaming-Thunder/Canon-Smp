


/invsee
  advancement revoke @s only game:use_devs/invsee
	scoreboard players set .temp0 Game.Math 0
	data modify storage game:math temp.dim set value "invsee"
	execute at @s anchored eyes positioned ^ ^ ^3 positioned ~-.5 ~-.5 ~-.5 as @p[dx=0] run

		execute store result score .temp1 Game.Math if entity @s[tag=Dev.Invsee]

		execute if score .temp1 Game.Math matches 0 run
			forceload add 0 0
			setblock 0 0 0 chest
			loot replace block 0 0 0 container.0 loot game:player_head
			data modify storage game:math temp.target set from block 0 0 0 Items[0].components."minecraft:profile".name
			setblock 0 0 0 air
			attribute @s jump_strength modifier add invsee -10000 add_value
			attribute @s movement_speed modifier add invsee -10000 add_value
			attribute @s block_interaction_range modifier add invsee -10000 add_value
			attribute @s entity_interaction_range modifier add invsee -10000 add_value
			tag @s add Dev.Invsee
			scoreboard players set .temp0 Game.Math 1
			function game:api/state/save {dim:"invsee"}

			execute at @s run particle wax_off ~ ~1 ~ 0.5 1 0.5 0.1 20 normal
		#END
		
		execute if score .temp1 Game.Math matches 1 run
			forceload add 0 0
			setblock 0 0 0 chest
			loot replace block 0 0 0 container.0 loot game:player_head
			data modify storage game:math temp.target set from block 0 0 0 Items[0].components."minecraft:profile".name
			setblock 0 0 0 air
			attribute @s jump_strength modifier remove invsee
			attribute @s movement_speed modifier remove invsee
			attribute @s block_interaction_range modifier remove invsee
			attribute @s entity_interaction_range modifier remove invsee
			tag @s remove Dev.Invsee
			scoreboard players set .temp0 Game.Math 2

			execute at @s run particle wax_on ~ ~1 ~ 0.5 1 0.5 0.1 20 normal

		#END
	
	#END
	data modify storage game:math temp.dim set value "invsee"
	execute if score .temp0 Game.Math matches 1 run function game:api/state/spy with storage game:math temp
	execute if score .temp0 Game.Math matches 1 run loot give @s loot game:give/devs/invsee
	execute if score .temp0 Game.Math matches 2 run function game:api/state/force_inventory with storage game:math temp
  #END
#END

