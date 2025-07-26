$execute if score .$(id)$(count) Game.Battle.Weight matches 1.. run scoreboard players operation .test Game.Battle.Weight = .$(id)$(count) Game.Battle.Weight
$execute if score .$(id)$(count) Game.Battle.Weight matches 1.. run scoreboard players operation .test Game.Battle.Weight += .total2 Game.Battle.Weight
$execute if score .$(id)$(count) Game.Battle.Weight matches 1.. if score .test Game.Battle.Weight >= .rand Game.Math run return 1
$execute if score .$(id)$(count) Game.Battle.Weight matches 1.. run scoreboard players operation .total2 Game.Battle.Weight += .$(id)$(count) Game.Battle.Weight
return 0