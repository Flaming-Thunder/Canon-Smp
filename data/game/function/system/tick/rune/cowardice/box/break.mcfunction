fill ~-2 ~-2 ~-2 ~2 ~3 ~2 air replace smooth_basalt destroy
execute at @s positioned ~-2 ~-2 ~-2 run kill @e[type=item,dx=4,dz=4,dy=5,nbt={Item:{id:"minecraft:smooth_basalt"}}]
kill @s