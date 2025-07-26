$summon block_display ~ ~ ~ {Tags:$(Tags),data:{width:$(w)f,height:$(h)f,text:$(text),score:$(score)},interpolation_duration:4,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(w6)f,$(h)f,0.1f],translation:[0f,0f,-0.1f]},brightness:{sky:15,block:15},block_state:{Name:"$(cursor_block)"},Passengers:[{id:"interaction",Tags:["button.button","button.new"],height:$(h),width:$(w)},{id:"block_display",interpolation_duration:4,Tags:["button.lower","button.button","button.new"],block_state:{Name:"$(block)"},brightness:{block:8,sky:8},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0f,$(h)f,0.1f],translation:[0f,0f,-0.1f]}},{id:"block_display",interpolation_duration:4,Tags:["button.higher","button.button","button.new"],block_state:{Name:"$(block)"},brightness:{block:8,sky:8},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(w)f,$(h)f,0.1f],translation:[0f,0f,-0.1f]}},{id:"text_display",alignment:"center",Tags:["button.text","button.button","button.new"],line_width:2147483647,text:$(text),background:0,brightness:{block:15,sky:15},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(h5)f,$(h5)f,1f],translation:[0f,$(h)f,-0.05f]}}]}


execute as @e[tag=button.new] run rotate @s ~ 0

execute as @e[tag=button.new,tag=button.slider] run function buttons:system/tick/slider/init

tag @e remove button.new

#exemple : 
#    /function buttons:summon/slider_advanced {score:{name:"items.enchanted.chance",objective:"settings",min:0,max:100,inc:5},text:[{"text":"Enchant: ","color":"dark_purple"},{"score":{"name":"items.enchanted.chance","objective":"settings"},"color":"light_purple"},{"text":"%","color":"light_purple"}],block:"purple_stained_glass",cursor_block:"purple_concrete",width:1.3,height:0.1}

