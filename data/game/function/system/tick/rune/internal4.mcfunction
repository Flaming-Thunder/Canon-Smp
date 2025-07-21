data modify storage game:math temp.effects set value {regeneration_duration:1,regeneration_amplifier:0,strength_duration:1,strength_amplifier:0,speed_duration:1,speed_amplifier:0,strength_amplifier:0,night_vision_duration:1,night_vision_amplifier:0}
execute if data entity @s active_effects[{id:"minecraft:poison"}] store result storage game:math temp.effects.regeneration_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:poison"}].duration
execute if data entity @s active_effects[{id:"minecraft:poison"}] run data modify storage game:math temp.effects.regeneration_amplifier set from entity @s active_effects[{id:"minecraft:poison"}].amplifier
execute if data entity @s active_effects[{id:"minecraft:weakness"}] store result storage game:math temp.effects.strength_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:weakness"}].duration
execute if data entity @s active_effects[{id:"minecraft:weakness"}] run data modify storage game:math temp.effects.strength_amplifier set from entity @s active_effects[{id:"minecraft:weakness"}].amplifier
execute if data entity @s active_effects[{id:"minecraft:slowness"}] store result storage game:math temp.effects.speed_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:slowness"}].duration
execute if data entity @s active_effects[{id:"minecraft:slowness"}] run data modify storage game:math temp.effects.speed_amplifier set from entity @s active_effects[{id:"minecraft:slowness"}].amplifier
execute if data entity @s active_effects[{id:"minecraft:blindness"}] store result storage game:math temp.effects.night_vision_duration int 0.05 run data get entity @s active_effects[{id:"minecraft:blindness"}].duration
execute if data entity @s active_effects[{id:"minecraft:blindness"}] run data modify storage game:math temp.effects.night_vision_amplifier set from entity @s active_effects[{id:"minecraft:blindness"}].amplifier
function game:system/tick/rune/life/macro with storage game:math temp.effects
effect give @s minecraft:instant_health 1 1 true
particle heart ~ ~ ~ 1 1.5 1 0.1 3 force