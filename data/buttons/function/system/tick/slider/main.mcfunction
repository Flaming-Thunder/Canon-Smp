tag @s add button.current

data modify storage buttons:storage temp set from entity @s data


execute on passengers if entity @s[type=text_display,tag=button.text] run data modify entity @s text set from storage buttons:storage temp.text

execute on passengers if entity @s[type=#buttons:button,tag=button.lower] run data modify storage buttons:storage temp.rot set from entity @s Rotation
data modify entity @s Rotation set from storage buttons:storage temp.rot


scoreboard players reset .dot buttons.main
execute on passengers if entity @s[type=interaction] run function buttons:system/tick/slider/interaction


#execute unless entity @s[tag=button.inited] run scoreboard players operation .dot buttons.main = .temp buttons.main
#execute if score .dot buttons.main matches -2147483648..2147483647 run function buttons:system/tick/slider/set_slider
#execute unless entity @s[tag=button.inited] run tag @s add inited


tag @a remove clicker

tag @s remove button.current
