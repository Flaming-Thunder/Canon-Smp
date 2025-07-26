$data modify storage buttons:storage temp.text_box set value $(text_box)
execute unless data storage buttons:storage temp.text_box.text run data modify storage buttons:storage temp.text set value {}
execute if data storage buttons:storage temp.text_box.text run data modify storage buttons:storage temp.text set from storage buttons:storage temp.text_box.text
execute unless data storage buttons:storage temp.text_box.size run data modify storage buttons:storage temp.text_box.size set value 1


$data modify storage buttons:storage temp.bc_box set value $(bc_box)
execute unless data storage buttons:storage temp.bc_box.size run data modify storage buttons:storage temp.w set value 1.3f
execute if data storage buttons:storage temp.bc_box.size run data modify storage buttons:storage temp.w set from storage buttons:storage temp.bc_box.size

execute unless data storage buttons:storage temp.bc_box.block run data modify storage buttons:storage temp.block set value "stone"
execute if data storage buttons:storage temp.bc_box.block run data modify storage buttons:storage temp.block set from storage buttons:storage temp.bc_box.block

execute unless data storage buttons:storage temp.bc_box.color run data modify storage buttons:storage temp.color set value -215402
execute if data storage buttons:storage temp.bc_box.color run data modify storage buttons:storage temp.color set from storage buttons:storage temp.bc_box.color


scoreboard players set on.style buttons.main -1
data modify storage buttons:storage temp.temp set from storage buttons:storage temp.bc_box.on.type
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "text"
execute if score .temp0 buttons.main matches 0 run scoreboard players set on.style buttons.main 1
data modify storage buttons:storage temp.temp set from storage buttons:storage temp.bc_box.on.type
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "item"
execute if score .temp0 buttons.main matches 0 run scoreboard players set on.style buttons.main 2

execute if score on.style buttons.main matches -1 run data modify storage buttons:storage temp.bc_box.on set value {type:"text",text:{text:"ON",color:"green",bold:true}}
execute if score on.style buttons.main matches -1 run scoreboard players set on.style buttons.main 1
execute if score on.style buttons.main matches 1 run data modify storage buttons:storage temp.on set value {id:"text_display",Tags:["button.button","button.new"],background:0,brightness:{block:15,sky:15},text:{},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1f,1f,0.1f],translation:[0f,0f,0.05f]}}
execute if score on.style buttons.main matches 1 run data modify storage buttons:storage temp.on.text set from storage buttons:storage temp.bc_box.on.text
execute if score on.style buttons.main matches 2 run data modify storage buttons:storage temp.on set value {id:"item_display",Tags:["button.button","button.new"],brightness:{block:15,sky:15},item_display:"gui",item:{},transformation:{left_rotation:[0,0,0,1],right_rotation:[0f,1f,0f,0f],scale:[0.5f,0.5f,0.05f],translation:[0f,0f,0.05f]}}
execute if score on.style buttons.main matches 2 run data modify storage buttons:storage temp.on.item set from storage buttons:storage temp.bc_box.on.item


scoreboard players set off.style buttons.main -1
data modify storage buttons:storage temp.temp set from storage buttons:storage temp.bc_box.off.type
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "text"
execute if score .temp0 buttons.main matches 0 run scoreboard players set off.style buttons.main 1
data modify storage buttons:storage temp.temp set from storage buttons:storage temp.bc_box.off.type
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "item"
execute if score .temp0 buttons.main matches 0 run scoreboard players set off.style buttons.main 2

execute if score off.style buttons.main matches -1 run data modify storage buttons:storage temp.bc_box.off set value {type:"text",text:{text:"OFF",color:"red",bold:true}}
execute if score off.style buttons.main matches -1 run scoreboard players set off.style buttons.main 1
execute if score off.style buttons.main matches 1 run data modify storage buttons:storage temp.off set value {id:"text_display",Tags:["button.button","button.new"],background:0,brightness:{block:15,sky:15},text:{},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1f,1f,0.1f],translation:[0f,0f,0.05f]}}
execute if score off.style buttons.main matches 1 run data modify storage buttons:storage temp.off.text set from storage buttons:storage temp.bc_box.off.text
execute if score off.style buttons.main matches 2 run data modify storage buttons:storage temp.off set value {id:"item_display",Tags:["button.button","button.new"],brightness:{block:15,sky:15},item_display:"gui",item:{},transformation:{left_rotation:[0,0,0,1],right_rotation:[0f,1f,0f,0f],scale:[0.5f,0.5f,0.05f],translation:[0f,0f,0.05f]}}
execute if score off.style buttons.main matches 2 run data modify storage buttons:storage temp.off.item set from storage buttons:storage temp.bc_box.off.item



$data modify storage buttons:storage temp.score set value $(score)
$data modify storage buttons:storage temp.Tags set value $(Tags)
data modify storage buttons:storage temp.Tags append value "button.binary_switch"
data modify storage buttons:storage temp.Tags append value "button.button"
data modify storage buttons:storage temp.Tags append value "button.new"



execute store result storage buttons:storage temp.w0 float 0.008000 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w1 float 0.004500 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w2 float 0.005000 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w3 float 0.015 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w4 float 0.002500 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w5 float 0.02 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w6 float 0.004000 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w7 float 0.007000 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w8 float 0.003000 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.h float 0.00813 run data get storage buttons:storage temp.w 100


execute if score on.style buttons.main matches 1 run data modify storage buttons:storage temp.on.transformation.scale[0] set from storage buttons:storage temp.w3
execute if score on.style buttons.main matches 1 run data modify storage buttons:storage temp.on.transformation.scale[1] set from storage buttons:storage temp.w3
execute if score on.style buttons.main matches 2 store result storage buttons:storage temp.on.transformation.scale[0] float 0.005 run data get storage buttons:storage temp.w3 100
execute if score on.style buttons.main matches 2 store result storage buttons:storage temp.on.transformation.scale[1] float 0.005 run data get storage buttons:storage temp.w3 100
execute store result storage buttons:storage temp.on.transformation.translation[0] float -0.005 run data get storage buttons:storage temp.w 100
execute if score on.style buttons.main matches 1 run data modify storage buttons:storage temp.on.transformation.translation[1] set from storage buttons:storage temp.w4
execute if score on.style buttons.main matches 2 run data modify storage buttons:storage temp.on.transformation.translation[1] set from storage buttons:storage temp.w6


execute if score off.style buttons.main matches 1 run data modify storage buttons:storage temp.off.transformation.scale[0] set from storage buttons:storage temp.w3
execute if score off.style buttons.main matches 1 run data modify storage buttons:storage temp.off.transformation.scale[1] set from storage buttons:storage temp.w3
execute if score off.style buttons.main matches 2 store result storage buttons:storage temp.off.transformation.scale[0] float 0.005 run data get storage buttons:storage temp.w3 100
execute if score off.style buttons.main matches 2 store result storage buttons:storage temp.off.transformation.scale[1] float 0.005 run data get storage buttons:storage temp.w3 100
data modify storage buttons:storage temp.off.transformation.translation[0] set from storage buttons:storage temp.w2
execute if score off.style buttons.main matches 1 run data modify storage buttons:storage temp.off.transformation.translation[1] set from storage buttons:storage temp.w4
execute if score off.style buttons.main matches 2 run data modify storage buttons:storage temp.off.transformation.translation[1] set from storage buttons:storage temp.w6



execute store result score .temp0 buttons.main run data get storage buttons:storage temp.text_box.size 100
execute store result score .temp1 buttons.main run data get storage buttons:storage temp.w 100
scoreboard players operation .temp0 buttons.main *= .temp1 buttons.main
execute store result storage buttons:storage temp.h0 float 0.0001 run scoreboard players get .temp0 buttons.main



execute if score .style buttons.main matches 1 run function buttons:system/summon/binary_switch with storage buttons:storage temp

