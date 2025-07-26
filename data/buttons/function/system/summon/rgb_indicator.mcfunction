
$summon text_display ~ ~ ~ {alignment:"center",Tags:$(Tags),data:{width:$(w0)f,height:$(h0)f,score:$(score)},interpolation_duration:4,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[$(w0)f,$(h0)f,0.1f],translation:[-$(w1)f,0f,0f]},brightness:{sky:15,block:15},text:" ",background:0,Passengers:[]}

execute as @e[tag=button.new] run rotate @s ~ 0

tag @e remove button.new
