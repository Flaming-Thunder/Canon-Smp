function game:system/load/player_data_load
data modify storage game:math temp.temp set from storage game:player myData.LastSelectedItem
execute store result score .break Game.Math run data modify storage game:math temp.temp set from entity @s SelectedItem
return run execute if score .break Game.Math matches 0 unless data entity @s equipment.offhand.components."minecraft:custom_data".MagicRune