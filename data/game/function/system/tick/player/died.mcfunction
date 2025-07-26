execute if entity @s[tag=Magic.Coward] run data remove storage game:player myData.effects.Cowardice
execute if entity @s[tag=Magic.Coward] run tag @s remove Magic.Coward
execute if entity @s[tag=Magic.Frightened] run data remove storage game:player myData.effects.Frightened
execute if entity @s[tag=Magic.Frightened] run tag @s remove Magic.Frightened
execute if entity @s[tag=Magic.Frightener] run data remove storage game:player myData.effects.Frightener
execute if entity @s[tag=Magic.Frightener] run tag @s remove Magic.Frightener
execute if data storage game:data {Data:{Event:{CanonEvent:3b}}} if predicate game:dimension/main run function game:system/tick/internal4
scoreboard players set @s Check.Player.Died 0