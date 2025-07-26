

$summon text_display ~ ~ ~ {Tags:$(Tags),data:{width:$(w)f,height:$(h)f,cmd:'$(cmd)',text:$(text),animation:$(anim)},interpolation_duration:4,text:" ",see_through:false,background:$(color),transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(w9)f,$(h9)f,0f],translation:[-$(w3)f,0f,0f]},brightness:{sky:15,block:15},Passengers:[{id:"interaction",Tags:["button.button","button.new"],height:$(h),width:$(w)},{id:"text_display",text:$(text),Tags:["button.text","button.button","button.new"],line_width:2147483647,background:0,brightness:{block:15,sky:15},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(h5)f,$(h5)f,0f],translation:[0f,$(h8)f,0.03125f]}}]}

execute as @e[tag=button.new] run rotate @s ~ 0

execute as @e[tag=button.new,tag=button.cta] run function buttons:system/tick/cta/init

tag @e remove button.new

