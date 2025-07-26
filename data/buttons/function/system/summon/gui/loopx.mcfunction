
execute summon item_display run function buttons:system/summon/gui/slot
execute summon item_display run function buttons:system/summon/gui/slot_background


scoreboard players operation fct.count1 buttons.main += .temp4 buttons.main

scoreboard players add fct.count2 buttons.main 1

execute if score fct.count1 buttons.main < .temp0 buttons.main run function buttons:system/summon/gui/loopx
