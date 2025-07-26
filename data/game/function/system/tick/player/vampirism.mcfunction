scoreboard players add @s Player.Helmet_Breaking 0
execute if score @s Player.Helmet_Breaking matches 1.. unless entity @s[nbt={equipment:{head:{components:{"minecraft:enchantments":{"minecraft:unbreaking":3}}}}}] if entity @s[nbt={equipment:{head:{}}}] run scoreboard players remove @s Player.Helmet_Breaking 4
execute if entity @s[nbt={equipment:{head:{components:{"minecraft:enchantments":{"minecraft:unbreaking":1}}}}}] run scoreboard players add @s Player.Helmet_Breaking 2
execute if entity @s[nbt={equipment:{head:{components:{"minecraft:enchantments":{"minecraft:unbreaking":2}}}}}] run scoreboard players add @s Player.Helmet_Breaking 3
execute if score @s Player.Helmet_Breaking matches -10..0 run function game:system/tick/internal5