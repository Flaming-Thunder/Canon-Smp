data modify storage buttons:storage temp.Tags append value "button.button"
data modify storage buttons:storage temp.Tags append value "button.gui"
data modify storage buttons:storage temp.Tags append value "button.new"

summon item_display ~ ~ ~ {Tags:["button.new"],Passengers:[{id:"interaction",width:0,height:0,Tags:["button.button"]},{id:"text_display",background:0,Tags:["button.button","button.text"]}]}

data modify entity @e[tag=button.new,limit=1] Tags set from storage buttons:storage temp.Tags

data modify entity @e[tag=button.new,limit=1] data.UUID set from storage buttons:storage temp.UUID
data modify entity @e[tag=button.new,limit=1] data.size set from storage buttons:storage temp.size
data modify entity @e[tag=button.new,limit=1] data.dim set from storage buttons:storage temp.dim
data modify entity @e[tag=button.new,limit=1] data.text set from storage buttons:storage temp.text_box.text


execute as @e[tag=button.button,tag=button.new] on passengers if entity @s[type=text_display,tag=button.text] run data modify entity @s text set from storage buttons:storage temp.text_box.text
execute as @e[tag=button.button,tag=button.new] on passengers if entity @s[type=text_display,tag=button.text] run data modify entity @s transformation.translation[0] set from storage buttons:storage temp.text_box.dx

execute store result score .temp0 buttons.main run data get storage buttons:storage temp.size 100
execute store result score .temp1 buttons.main run data get storage buttons:storage temp.text_box.size 200
scoreboard players operation .temp0 buttons.main *= .temp1 buttons.main
execute as @e[tag=button.button,tag=button.new] on passengers if entity @s[type=text_display,tag=button.text] store result entity @s transformation.scale[0] float 0.0001 run scoreboard players get .temp0 buttons.main
execute as @e[tag=button.button,tag=button.new] on passengers if entity @s[type=text_display,tag=button.text] store result entity @s transformation.scale[1] float 0.0001 run scoreboard players get .temp0 buttons.main


execute store result score .temp0 buttons.main run data get storage buttons:storage temp.dim[0]
execute store result score .temp1 buttons.main run data get storage buttons:storage temp.size 100
scoreboard players operation .temp0 buttons.main *= .temp1 buttons.main
execute as @e[tag=button.new,limit=1] on passengers store result entity @s width float 0.01 run scoreboard players get .temp0 buttons.main
execute as @e[tag=button.new,limit=1] store result entity @s data.width float 0.01 run scoreboard players get .temp0 buttons.main
scoreboard players operation .temp6 buttons.main = .temp0 buttons.main
scoreboard players operation .temp6 buttons.main %= #2 buttons.main
scoreboard players operation .temp0 buttons.main /= #2 buttons.main

execute store result score .temp1 buttons.main run data get storage buttons:storage temp.dim[1]
execute store result score .temp2 buttons.main run data get storage buttons:storage temp.size 100
scoreboard players operation .temp1 buttons.main *= .temp2 buttons.main
execute as @e[tag=button.new,limit=1] on passengers store result entity @s height float 0.01 run scoreboard players get .temp1 buttons.main
execute as @e[tag=button.new,limit=1] store result entity @s data.height float 0.01 run scoreboard players get .temp1 buttons.main

scoreboard players operation .temp3 buttons.main = .temp1 buttons.main
scoreboard players operation .temp3 buttons.main += .temp1 buttons.main
scoreboard players operation .temp3 buttons.main += .temp2 buttons.main
scoreboard players operation .temp3 buttons.main /= #2 buttons.main
execute as @e[tag=button.button,tag=button.new] on passengers if entity @s[type=text_display,tag=button.text] store result score .temp4 buttons.main run data get entity @s transformation.scale[0] 18
scoreboard players operation .temp3 buttons.main -= .temp4 buttons.main
execute as @e[tag=button.button,tag=button.new] on passengers if entity @s[type=text_display,tag=button.text] store result entity @s transformation.translation[1] float 0.01 run scoreboard players get .temp3 buttons.main


scoreboard players operation .temp2 buttons.main = .temp1 buttons.main
scoreboard players operation .temp2 buttons.main /= #2 buttons.main

execute store result score .temp3 buttons.main run data get entity @e[tag=button.new,limit=1] Pos[1] 100
scoreboard players operation .temp3 buttons.main -= .temp1 buttons.main
scoreboard players operation .temp3 buttons.main += .temp2 buttons.main
execute store result entity @e[tag=button.new,limit=1] Pos[1] double 0.01 run scoreboard players get .temp3 buttons.main

scoreboard players operation .temp2 buttons.main = .temp1 buttons.main

scoreboard players set .temp3 buttons.main 0
scoreboard players operation .temp3 buttons.main -= .temp1 buttons.main
scoreboard players operation .temp3 buttons.main += .temp2 buttons.main


execute store result score .temp4 buttons.main run data get storage buttons:storage temp.size 100
execute store result score .temp5 buttons.main run data get storage buttons:storage temp.size 50




scoreboard players set .border-x buttons.main 0
scoreboard players operation .border-x buttons.main -= .temp0 buttons.main

scoreboard players operation .border+x buttons.main = .temp0 buttons.main
scoreboard players operation .border+x buttons.main -= .temp4 buttons.main
scoreboard players operation .border+x buttons.main += .temp6 buttons.main

scoreboard players set .bordery buttons.main 0
scoreboard players operation .bordery buttons.main -= .temp5 buttons.main


scoreboard players set fct.count2 buttons.main 0
scoreboard players operation fct.count0 buttons.main = .temp2 buttons.main
function buttons:system/summon/gui/loopy



execute as @e[tag=button.button,tag=button.new] run rotate @s ~180 0
execute as @e[tag=button.button,tag=button.new] on passengers run rotate @s ~180 0
execute as @e[tag=button.button,tag=button.new] on passengers on passengers run rotate @s ~180 0

tag @e[tag=button.button,tag=button.new] remove button.new
