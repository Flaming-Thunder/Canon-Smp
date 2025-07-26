

/lobby
	/summon
		summon marker ~ ~ ~ {Tags:["GameScape.Lobby"]}
	#END
	/tp
	execute in game:game_scape at @e[type=marker,tag=GameScape.Lobby,limit=1] run tp @s ~ ~ ~ ~ ~
    clear @s
	#END
#END

