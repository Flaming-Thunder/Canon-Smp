attribute @s jump_strength modifier add freeze -10000 add_value
attribute @s movement_speed modifier add freeze -10000 add_value
attribute @s block_interaction_range modifier add freeze -10000 add_value
attribute @s entity_interaction_range modifier add freeze -10000 add_value
tag @s add Dev.Freeze
execute at @s run particle wax_off ~ ~1 ~ 0.5 1 0.5 0.1 20 normal