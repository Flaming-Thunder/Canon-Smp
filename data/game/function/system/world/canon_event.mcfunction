execute if score Event.Canon Game.Timer matches 0 if data storage game:data {Data:{Event:{CanonEvent:1b}}} run data merge storage game:data {Data:{Event:{CanonEvent:2b}}}
execute if score Event.Canon Game.Timer matches 0 if data storage game:data {Data:{Event:{CanonEvent:3b}}} run data merge storage game:data {Data:{Event:{CanonEvent:0b}}}
execute if data storage game:data {Data:{Event:{CanonEvent:2b}}} run function game:system/world/canon_event/start
execute if data storage game:data {Data:{Event:{CanonEvent:3b}}} run function game:system/world/canon_event/while
execute if data storage game:data {Data:{Event:{CanonEvent:0b}}} run function game:system/world/canon_event/end
execute if data storage game:data {Data:{Event:{CanonEvent:1b}}} run function game:system/world/canon_event/while_not
execute if score Event.Canon Game.Timer matches 1.. run scoreboard players remove Event.Canon Game.Timer 1
execute if score Event.Canon.Deaths Game.Data matches 5..10 run function game:system/world/canon_event/end_early
execute store result bossbar game:canon_event value run scoreboard players get Event.Canon Game.Timer