bossbar set game:canon_event players @s
execute if score Event.Canon Game.Timer matches ..600 as @a at @s run function game:system/world/canon_event/while_not/warn