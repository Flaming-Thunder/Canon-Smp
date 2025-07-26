$summon block_display ~ ~ ~ {Tags:$(Tags),data:{width:$(w)f,height:$(h)f,text:$(text),score:$(score)},interpolation_duration:4,start_interpolation:0,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0.1f,$(h)f,0.1f],translation:[-0.05f,0f,-0.1f]},brightness:{sky:15,block:15},block_state:{Name:"$(block)"},Passengers:[{id:"interaction",Tags:["button.button","button.new"],height:$(h),width:$(w)},{id:"block_display",interpolation_duration:4,Tags:["button.lower","button.button","button.new"],block_state:{Name:"$(block)"},brightness:{block:8,sky:8},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0f,$(h)f,0.1f],translation:[0f,0f,-0.1f]}},{id:"block_display",interpolation_duration:4,Tags:["button.higher","button.button","button.new"],block_state:{Name:"$(block)"},brightness:{block:8,sky:8},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(w)f,$(h)f,0.1f],translation:[0f,0f,-0.1f]}},{id:"text_display",Tags:["button.text","button.button","button.new"],line_width:2147483647,background:0,brightness:{block:15,sky:15},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(h5)f,$(h5)f,1f],translation:[0,$(h),-0.05f]}}]}


execute as @e[tag=button.new] run rotate @s ~ 0

execute as @e[tag=button.new,tag=button.slider] run function buttons:system/tick/slider/init
execute as @e[tag=button.new,tag=button.slider] summon item_display run function buttons:system/tick/dir_correction


tag @e remove button.new

