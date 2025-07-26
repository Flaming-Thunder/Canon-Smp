scoreboard players operation .x Game.Math = Battle.round Game.Data
$scoreboard players set .temp0 Game.Math $(m)
$scoreboard players set .temp1 Game.Math $(a)
$scoreboard players set .temp2 Game.Math $(t)
scoreboard players operation .x Game.Math -= .temp2 Game.Math
scoreboard players operation .x Game.Math *= #100 Game.Math
scoreboard players operation .x Game.Math /= .temp1 Game.Math
scoreboard players operation .x Game.Math *= .x Game.Math
scoreboard players operation .x Game.Math /= #100 Game.Math
scoreboard players operation .x Game.Math *= #-1 Game.Math
scoreboard players add .x Game.Math 100
scoreboard players operation .x Game.Math *= .temp0 Game.Math
execute if score Battle.round Game.Data >= .temp2 Game.Math run return run scoreboard players operation .x Game.Math /= #100 Game.Math
execute if score Battle.round Game.Data < .temp2 Game.Math run return 0