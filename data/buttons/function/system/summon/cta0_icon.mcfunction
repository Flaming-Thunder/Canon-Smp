

$summon block_display ~ ~ ~ {Tags:$(Tags),data:{width:$(w)f,height:$(h)f,cmd:'$(cmd)',text:$(text),animation:$(anim)},interpolation_duration:4,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(w)f,$(h)f,0.1f],translation:[-$(w2)f,0f,-0.1f]},brightness:{sky:15,block:15},block_state:{Name:"$(block)"},Passengers:[{id:"interaction",Tags:["button.button","button.new"],height:$(h),width:$(w)},{id:"item_display",Tags:["button.icon","button.button","button.new"],interpolation_duration:4,item:$(item),brightness:{block:15,sky:15},item_display:"gui",transformation:{left_rotation:[0,0,0,1],right_rotation:[0,1,0,0],scale:[$(h)f,$(h)f,0.01f],translation:[0f,$(h2)f,0.02f]}},{id:"text_display",text:$(text),Tags:["button.text","button.button","button.new"],line_width:2147483647,background:0,brightness:{block:15,sky:15},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(h5)f,$(h5)f,1f],translation:[0f,$(h8)f,0.03125f]}}]}

execute as @e[tag=button.new] run rotate @s ~ 0

execute as @e[tag=button.new,tag=button.cta] run function buttons:system/tick/cta/init

tag @e remove button.new
