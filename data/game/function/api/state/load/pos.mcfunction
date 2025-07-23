$execute in $(Dimension) run tp @s $(x) $(y) $(z) $(rot0) $(rot1)
execute store result storage game:math temp.XpP int 1 run data get storage game:math temp.State.XpP 89842
execute store result storage game:math temp.XpLevel int 1 run data get storage game:math temp.State.XpLevel
function game:api/state/load/xp with storage game:math temp