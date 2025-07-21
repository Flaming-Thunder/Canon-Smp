$execute if score @s Player.Lives matches $(Update) run team join Default.Lives.$(Update)
scoreboard players remove Player.Teams.Update Game.Data 1
execute store result storage game:data Data.Player.Teams.Update int 1 run scoreboard players get Player.Teams.Update Game.Data
execute if score Player.Teams.Update Game.Data matches -11..10 run function game:api/player_update/loop with storage game:data Data.Player.Teams