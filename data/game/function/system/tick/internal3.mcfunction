scoreboard players remove @s Player.Lives 1
function game:api/player_update
scoreboard players add Event.Canon.Deaths Game.Data 1
scoreboard players add @s Player.Canon_Deaths 1