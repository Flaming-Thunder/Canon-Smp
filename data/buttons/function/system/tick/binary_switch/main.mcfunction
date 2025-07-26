data modify storage buttons:storage temp set from entity @s data


execute on passengers if entity @s[type=text_display,tag=button.text] run data modify entity @s text set from storage buttons:storage temp.text

execute on passengers if entity @s[type=interaction] run function buttons:system/tick/binary_switch/interaction


#execute if entity @s[tag=button.!inited] run function buttons:system/tick/binary_switch/init
