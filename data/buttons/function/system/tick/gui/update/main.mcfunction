
data modify entity @s data.grid set from storage buttons:storage temp.grid




execute on passengers if entity @s[tag=!button.gui_background] run data remove entity @s item
execute on passengers if entity @s[tag=button.gui_background] run data modify entity @s item.components."minecraft:custom_model_data".colors[0] set from storage buttons:storage temp.color

execute if data storage buttons:storage temp.grid[0] run function buttons:system/tick/gui/update/loop


setblock 0 0 0 oak_sign

execute on passengers if entity @s[type=item_display,tag=!button.gui_background] run function buttons:system/tick/gui/update/count

setblock 0 0 0 air

