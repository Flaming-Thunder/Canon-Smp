execute on target run tag @s add Magic.Target
execute if data entity @s attack on vehicle if score .haveItem Game.Math matches 1 run function game:system/tick/pedistal/drop_item
execute if data entity @s attack on vehicle if score .haveItem Game.Math matches 0 run function game:system/tick/pedistal/remove
scoreboard players set .temp0 Game.Math 0
execute if score .haveItem Game.Math matches 1 on target if predicate game:input/sneak unless items entity @s weapon.mainhand * run scoreboard players set .temp0 Game.Math 1
execute if score .haveItem Game.Math matches 1 on target if predicate game:input/sneak if entity @s[nbt={SelectedItem:{count:1}}] run scoreboard players set .temp0 Game.Math 2
execute if score .temp0 Game.Math matches 1 on vehicle on passengers if entity @s[type=item_display] run function game:system/tick/pedistal/internal1
execute if score .temp0 Game.Math matches 2 on vehicle on passengers if entity @s[type=item_display] run function game:system/tick/pedistal/internal2
execute if score .temp0 Game.Math matches 0 on target run data modify storage game:math temp.item2 set from entity @s SelectedItem
execute if score .temp0 Game.Math matches 0 on target unless data entity @s SelectedItem run data remove storage game:math temp.item2
execute if score .temp0 Game.Math matches 0 on target if entity @s[gamemode=!creative] run item modify entity @s weapon.mainhand game:item/decrease_by1
execute if score .temp0 Game.Math matches 0 if data entity @s interaction if data storage game:math temp.item2 on vehicle if score .haveItem Game.Math matches 1 run function game:system/tick/pedistal/drop_item
execute if score .temp0 Game.Math matches 0 if data entity @s interaction if data storage game:math temp.item2 on vehicle on passengers if entity @s[type=item_display] run function game:system/tick/pedistal/internal3
tag @a remove Magic.Target