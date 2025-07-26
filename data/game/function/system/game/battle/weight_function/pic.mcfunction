scoreboard players operation .x Game.Math = Battle.round Game.Data
$scoreboard players set .temp0 Game.Math $(m)
$scoreboard players set .temp1 Game.Math $(a)
$scoreboard players set .temp2 Game.Math $(t)
scoreboard players operation .x Game.Math -= .temp2 Game.Math
execute if score .x Game.Math matches ..-1 run scoreboard players operation .x Game.Math *= #-1 Game.Math
scoreboard players operation .x Game.Math *= .temp0 Game.Math
scoreboard players operation .x Game.Math += .temp1 Game.Math
scoreboard players operation .temp0 Game.Math *= .temp1 Game.Math
return run scoreboard players operation .temp0 Game.Math /= .x Game.Math