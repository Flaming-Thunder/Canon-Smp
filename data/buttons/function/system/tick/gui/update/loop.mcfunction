

execute if data storage buttons:storage temp.grid[0].Slot store result storage buttons:storage temp.slot int 1.0 run data get storage buttons:storage temp.grid[0].Slot
execute if data storage buttons:storage temp.grid[0].slot store result storage buttons:storage temp.slot int 1.0 run data get storage buttons:storage temp.grid[0].slot
execute on passengers if entity @s[tag=!button.gui_background] if function buttons:system/tick/gui/test_slot run data modify entity @s item set from storage buttons:storage temp.grid[0]


#say a



data remove storage buttons:storage temp.grid[0]
execute if data storage buttons:storage temp.grid[0] run function buttons:system/tick/gui/update/loop



