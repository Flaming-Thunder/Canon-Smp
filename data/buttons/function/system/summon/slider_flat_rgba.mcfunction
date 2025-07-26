$summon text_display ~ ~ ~ {Tags:$(Tags),data:{width:$(w)f,height:$(h)f,text:$(text),score:$(score)},interpolation_duration:4,start_interpolation:-1,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(w6)f,$(h9)f,0.1f],translation:[0f,0f,0f]},brightness:{sky:15,block:15},text:" ",background:$(cursor_color),Passengers:[{id:"interaction",Tags:["button.button","button.new"],height:$(h),width:$(w)},{id:"text_display",interpolation_duration:4,Tags:["button.lower","button.button","button.new"],text:" ",background:$(color),brightness:{block:8,sky:8},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0f,$(h9)f,0.1f],translation:[0,0,0]}},{id:"text_display",interpolation_duration:4,Tags:["button.higher","button.button","button.new"],text:" ",background:$(color),brightness:{block:8,sky:8},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(w9)f,$(h9)f,0.1f],translation:[0,0,0]}},{id:"text_display",text:$(text),Tags:["button.text","button.button","button.new"],line_width:2147483647,background:0,brightness:{block:15,sky:15},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(h5)f,$(h5)f,1f],translation:[0,$(h),0]}}]}


execute as @e[tag=button.new] run rotate @s ~ 0

execute as @e[tag=button.new,tag=button.slider] run function buttons:system/tick/slider/flat_rgba/init
execute as @e[tag=button.new,tag=button.slider] summon item_display run function buttons:system/tick/dir_correction

tag @e remove button.new

#exemple : 
#    /function buttons:summon/slider_advanced {score:{name:"items.enchanted.chance",objective:"settings",min:0,max:100,inc:5},text:[{"text":"Enchant: ","color":"dark_purple"},{"score":{"name":"items.enchanted.chance","objective":"settings"},"color":"light_purple"},{"text":"%","color":"light_purple"}],block:"purple_stained_glass",cursor_block:"purple_concrete",width:1.3,height:0.1}



