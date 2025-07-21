tag @s add Game.PlayerInited
scoreboard players operation @s Player.ID = ID.Max Player.ID
scoreboard players add ID.Max Player.ID 1
scoreboard players set @s Player.Lives 10
function game:api/player_update
scoreboard players set @s Player.Deaths 0
scoreboard players set @s Check.Player.Died 0
data modify storage game:player data append value {}