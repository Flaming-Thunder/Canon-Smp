function game:system/load/player_data_load
execute store result score .GameTime Game.Math run time query gametime
execute if entity @s[tag=Magic.Coward] run function game:system/tick/internal0
execute if entity @s[tag=Magic.Frightened] run function game:system/tick/internal1
execute if entity @s[tag=Magic.Frightener] run function game:system/tick/internal2
execute if score @s Check.Player.Died matches 1.. run function game:system/tick/player/died
data modify storage game:player myData.LastSelectedItem set from entity @s SelectedItem
function game:system/load/player_data_save
execute as @a[gamemode=!creative,gamemode=!spectator, tag= Vampirism] at @s if predicate game:role_specific/timer_10t if predicate game:role_specific/vampirism if dimension overworld run function game:system/tick/player/vampirism
execute as @a[gamemode=!creative,gamemode=!spectator, tag= Aquaphobic] if predicate game:role_specific/timer_5t run function game:system/tick/player/aquaphobic
execute as @a if score @s Player.Lives matches 0 run function game:system/tick/player/ghostly