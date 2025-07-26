execute store result score .value Game.Math run bossbar get game:canon_event value
execute store result score .visible Game.Math run bossbar get game:canon_event visible
execute store result score .max Game.Math run bossbar get game:canon_event max
bossbar remove game:canon_event
bossbar add game:canon_event ""
bossbar set game:canon_event name [{text:"=",font:"game:custom"}]
bossbar set game:canon_event color red
bossbar set game:canon_event style progress
execute store result bossbar game:canon_event max run scoreboard players get .max Game.Math
execute store result bossbar game:canon_event value run scoreboard players get .value Game.Math
execute if score .visible Game.Math matches 1 run bossbar set game:canon_event visible true
bossbar set game:canon_event players @a[predicate=game:dimension/main]