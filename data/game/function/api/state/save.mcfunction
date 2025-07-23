function game:system/load/player_data_load
data modify storage game:math temp.State.Inventory set from entity @s Inventory
data modify storage game:math temp.State.EnderItems set from entity @s EnderItems
data modify storage game:math temp.State.equipment set from entity @s equipment
data modify storage game:math temp.State.Dimension set from entity @s Dimension
data modify storage game:math temp.State.Pos set from entity @s Pos
data modify storage game:math temp.State.Rotation set from entity @s Rotation
data modify storage game:math temp.State.XpP set from entity @s XpP
data modify storage game:math temp.State.XpLevel set from entity @s XpLevel
data modify storage game:math temp.State.attributes set from entity @s attributes
data modify storage game:math temp.State.Health set from entity @s Health
data modify storage game:math temp.State.playerGameType set from entity @s playerGameType
execute store result storage game:math temp.State.Lives int 1 run scoreboard players get @s Player.Lives
$data modify storage game:player myData.State.$(dim) set from storage game:math temp.State
function game:system/load/player_data_save