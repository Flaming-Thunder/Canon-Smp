bossbar set game:canon_event players @a
execute as @a[advancements={game:check/player_kill_player=true}] run function game:system/world/canon_event/while/player_killed_player