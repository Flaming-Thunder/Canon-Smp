forceload add 0 0
setblock 0 0 0 chest
loot replace block 0 0 0 container.0 loot game:player_head
data modify storage game:math temp.target set from block 0 0 0 Items[0].components."minecraft:profile".name
setblock 0 0 0 air
attribute @s jump_strength modifier add invsee -10000 add_value
attribute @s movement_speed modifier add invsee -10000 add_value
attribute @s block_interaction_range modifier add invsee -10000 add_value
attribute @s entity_interaction_range modifier add invsee -10000 add_value
tag @s add Dev.Invsee
scoreboard players set .temp0 Game.Math 1
function game:api/state/save {dim:"invsee"}
execute at @s run particle wax_off ~ ~1 ~ 0.5 1 0.5 0.1 20 normal