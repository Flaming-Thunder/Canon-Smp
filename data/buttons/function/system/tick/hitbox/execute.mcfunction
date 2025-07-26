data modify storage buttons:storage temp set from entity @s data
execute if score .break buttons.main matches 0 if entity @s[tag=button.slider] run function buttons:system/tick/slider/set_slider
execute if score .break buttons.main matches 0 if entity @s[tag=button.cta] run function buttons:system/tick/cta/click
execute if score .break buttons.main matches 0 if entity @s[tag=button.binary_switch] run function buttons:system/tick/binary_switch/click
execute if score .break buttons.main matches 0 if entity @s[tag=button.gui] run function buttons:system/tick/gui/click
execute if score .break buttons.main matches 1 if entity @s[tag=button.gui] run function buttons:system/tick/gui/see




tag @s remove button.min

