execute store result score Battle.GameTime Game.Timer run time query gametime
scoreboard players operation Battle.GameTime Game.Timer -= Battle.StartTime Game.Timer
execute store result score Battle.Players Game.Data if entity @a[advancements={game:check/in_battle=true},predicate=game:dimension/game_scape]
execute if score Battle.inWave Game.Math matches 1 if score Battle.GameTime Game.Timer > Battle.Buy Game.Timer run function game:system/game/battle/tick/ongoing/wave/start
execute if score Battle.inWave Game.Math matches 0 unless data storage game:game_scape_data battle.round[0] unless entity @e[tag=Battle.Enemy] run function game:system/game/battle/tick/ongoing/wave/end
execute if score Battle.inWave Game.Math matches 0 unless score Battle.Survive Game.Timer matches 0 if score Battle.GameTime Game.Timer > Battle.Survive Game.Timer run function game:system/game/battle/tick/ongoing/wave/end
scoreboard players operation Battle.Summon Game.Math = Battle.round Game.Data
scoreboard players operation Battle.Summon Game.Math *= #4 Game.Math
scoreboard players operation Battle.Summon Game.Math += Battle.GameTime Game.Timer
scoreboard players operation Battle.Summon Game.Math %= Battle.SpawnRate Game.Data
scoreboard players operation Battle.Summon Game.Math /= Battle.Players Game.Data
execute if score Battle.Summon Game.Math matches 0 run function game:system/game/battle/tick/ongoing/wave/summon