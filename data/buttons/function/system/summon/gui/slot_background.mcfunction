tag @s add button.button
tag @s add button.gui_background


scoreboard players operation .temp6 buttons.main = fct.count1 buttons.main
scoreboard players operation .temp6 buttons.main += .temp5 buttons.main
execute store result entity @s transformation.translation[0] float 0.01 run scoreboard players get .temp6 buttons.main

scoreboard players operation .temp6 buttons.main = fct.count0 buttons.main
scoreboard players operation .temp6 buttons.main -= .temp5 buttons.main
execute store result entity @s transformation.translation[1] float 0.01 run scoreboard players get .temp6 buttons.main 


execute store result entity @s transformation.scale[0] float 0.0000890 run data get storage buttons:storage temp.size 10000
execute store result entity @s transformation.scale[1] float 0.0000890 run data get storage buttons:storage temp.size 10000
data modify entity @s transformation.scale[2] set value 0.01f

data modify entity @s transformation.translation[2] set value -.005f

data modify entity @s transformation.right_rotation set value [0f,1f,0f,0f]

data modify entity @s item set value {id:"stone",count:1,components:{"minecraft:item_model":"button:slot"}}
data modify entity @s item.components."minecraft:custom_model_data".colors append from storage buttons:storage temp.color
data modify entity @s item.components."minecraft:custom_model_data".strings append value "00"

execute if score fct.count0 buttons.main <= .temp4 buttons.main if score fct.count1 buttons.main = .border+x buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "-1-1"
execute if score fct.count0 buttons.main <= .temp4 buttons.main if score fct.count1 buttons.main = .border-x buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "1-1"
execute if score fct.count0 buttons.main <= .temp4 buttons.main unless score fct.count1 buttons.main = .border-x buttons.main unless score fct.count1 buttons.main = .border+x buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "0-1"

execute if score fct.count0 buttons.main >= .temp1 buttons.main if score fct.count1 buttons.main = .border+x buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "-11"
execute if score fct.count0 buttons.main >= .temp1 buttons.main if score fct.count1 buttons.main = .border-x buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "11"
execute if score fct.count0 buttons.main >= .temp1 buttons.main unless score fct.count1 buttons.main = .border-x buttons.main unless score fct.count1 buttons.main = .border+x buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "01"

execute unless score fct.count0 buttons.main = .temp1 buttons.main unless score fct.count0 buttons.main = .temp4 buttons.main if score fct.count1 buttons.main = .border+x buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "-10"
execute unless score fct.count0 buttons.main = .temp1 buttons.main unless score fct.count0 buttons.main = .temp4 buttons.main if score fct.count1 buttons.main = .border-x buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "10"


execute if score .temp1 buttons.main = .temp4 buttons.main if score fct.count1 buttons.main = .border+x buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "h-1"
execute if score .temp1 buttons.main = .temp4 buttons.main if score fct.count1 buttons.main = .border-x buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "h1"
execute if score .temp1 buttons.main = .temp4 buttons.main unless score fct.count1 buttons.main = .border-x buttons.main unless score fct.count1 buttons.main = .border+x buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "h0"

execute if score .border-x buttons.main = .bordery buttons.main if score fct.count0 buttons.main = .temp4 buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "v-1"
execute if score .border-x buttons.main = .bordery buttons.main if score fct.count0 buttons.main = .temp1 buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "v1"
execute if score .border-x buttons.main = .bordery buttons.main unless score fct.count0 buttons.main = .temp4 buttons.main unless score fct.count0 buttons.main = .temp1 buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "v0"

execute if score .border-x buttons.main = .bordery buttons.main if score fct.count0 buttons.main = .temp4 buttons.main if score fct.count0 buttons.main = .temp1 buttons.main run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "0"


#tellraw @a {score:{name:"fct.count1",objective:"buttons.main"}}
#tellraw @a {score:{name:".border-x",objective:"buttons.main"}}
#tellraw @a {score:{name:".border+x",objective:"buttons.main"}}


data modify entity @s item_display set value "gui"


data modify entity @s brightness set value {block:15,sky:15}



ride @s mount @e[tag=button.new,tag=button.gui,limit=1]



