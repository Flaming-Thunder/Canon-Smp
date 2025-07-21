data modify storage game:math temp.effects set value {poison_duration:1,poison_amplifier:0,weakness_duration:1,weakness_amplifier:0,slowness_duration:1,slowness_amplifier:0,blindness_duration:1,blindness_amplifier:0}
execute if data entity @s active_effects[{id:"minecraft:regeneration"}] store result storage game:math temp.effects.poison_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:regeneration"}].duration
execute if data entity @s active_effects[{id:"minecraft:regeneration"}] run data modify storage game:math temp.effects.poison_amplifier set from entity @s active_effects[{id:"minecraft:regeneration"}].amplifier
execute if data entity @s active_effects[{id:"minecraft:strength"}] store result storage game:math temp.effects.weakness_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:strength"}].duration
execute if data entity @s active_effects[{id:"minecraft:strength"}] run data modify storage game:math temp.effects.weakness_amplifier set from entity @s active_effects[{id:"minecraft:strength"}].amplifier
execute if data entity @s active_effects[{id:"minecraft:speed"}] store result storage game:math temp.effects.slowness_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:speed"}].duration
execute if data entity @s active_effects[{id:"minecraft:speed"}] run data modify storage game:math temp.effects.slowness_amplifier set from entity @s active_effects[{id:"minecraft:speed"}].amplifier
execute if data entity @s active_effects[{id:"minecraft:night_vision"}] store result storage game:math temp.effects.blindness_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:night_vision"}].duration
execute if data entity @s active_effects[{id:"minecraft:night_vision"}] run data modify storage game:math temp.effects.blindness_amplifier set from entity @s active_effects[{id:"minecraft:night_vision"}].amplifier
function game:system/tick/rune/spite/macro with storage game:math temp.effects
damage @s 8 magic      
particle damage_indicator ~ ~ ~ 1 1.5 1 0.1 3 force