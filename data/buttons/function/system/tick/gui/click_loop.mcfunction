

execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.grid[0].slot set from storage buttons:storage temp.slot

data modify storage buttons:storage temp.cmd set from storage buttons:storage temp.grid[0].command
execute if score .temp0 buttons.main matches 0 at @s run function buttons:system/run_cmd_no_check with storage buttons:storage temp



data remove storage buttons:storage temp.grid[0]
execute if score .temp0 buttons.main matches 1 if data storage buttons:storage temp.grid[0] run function buttons:system/tick/gui/click_loop


