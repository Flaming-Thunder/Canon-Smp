

$summon block_display ~ ~ ~ {Tags:$(Tags),data:{width:$(w5)f,height:$(w)f,score:$(score),text:$(text)},interpolation_duration:4,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(w0)f,$(w0)f,0.1f],translation:[-$(w1)f,0f,0f]},brightness:{sky:15,block:15},block_state:{Name:"$(block)"},Passengers:[{id:"interaction",Tags:["button.button","button.new"],height:$(w),width:$(w5)},{id:"text_display",text:$(text),Tags:["button.text","button.button","button.new"],line_width:2147483647,background:0,brightness:{block:15,sky:15},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(h0)f,$(h0)f,1f],translation:[0f,$(h)f,0.12f]}},$(off),$(on)]}

#$say $(on)

execute as @e[tag=button.new] run rotate @s ~ 0

execute as @e[tag=button.new,tag=button.binary_switch] run function buttons:system/tick/binary_switch/init

tag @e remove button.new
