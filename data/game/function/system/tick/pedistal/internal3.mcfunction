data modify storage game:math temp.item2.count set value 1
data modify entity @s item set from storage game:math temp.item2
execute if score .isAltar Game.Math matches 1 if data storage game:math temp.item2.components."minecraft:custom_data".catalyst on vehicle run function game:system/tick/craft