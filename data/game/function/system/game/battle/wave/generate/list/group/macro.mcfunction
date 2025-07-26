execute store result score .test Game.Math run data get storage game:math temp.id
$execute if score .rand Game.Math matches $(chance) unless score .test Game.Math matches 0 run function game:system/game/battle/wave/generate/list/group/append {id:"$(id)",spawner:"$(spawner)"}
$execute if score .rand Game.Math matches $(chance) run scoreboard players set .break Game.Math 1