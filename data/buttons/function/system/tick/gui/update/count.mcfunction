
execute store result score .temp0 buttons.main run data get entity @s item.count
execute if score .temp0 buttons.main matches 1.. run data modify block 0 0 0 front_text.messages[0] set value {score:{name:".temp0",objective:"buttons.main"},color:"white",shadow_color:[0.24,0.24,0.24,1]}

execute if score .temp0 buttons.main matches 2.. on passengers run data modify entity @s text set from block 0 0 0 front_text.messages[0]
execute if score .temp0 buttons.main matches 0..1 on passengers run data modify entity @s text set value ""



