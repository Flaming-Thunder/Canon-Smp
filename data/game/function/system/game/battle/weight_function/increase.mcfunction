scoreboard players operation .x Game.Math = Battle.round Game.Data
$scoreboard players set .temp0 Game.Math $(m)
$scoreboard players set .temp3 Game.Math $(t)
$scoreboard players set .temp1 Game.Math $(a)
scoreboard players operation .temp1 Game.Math += .x Game.Math
scoreboard players operation .temp1 Game.Math -= .temp3 Game.Math
$scoreboard players set .temp2 Game.Math $(a)
scoreboard players operation .temp2 Game.Math *= #100 Game.Math
scoreboard players operation .temp2 Game.Math /= .temp1 Game.Math
scoreboard players operation .temp2 Game.Math *= #-1 Game.Math
scoreboard players add .temp2 Game.Math 100
scoreboard players operation .temp2 Game.Math *= .temp0 Game.Math
return run scoreboard players operation .temp2 Game.Math /= #100 Game.Math