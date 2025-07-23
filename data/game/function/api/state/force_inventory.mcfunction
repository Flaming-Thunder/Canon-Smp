$data modify storage game:player myData set from storage game:player data[{name:"$(target)"}]
data modify storage game:math temp.State.Inventory set from entity @s Inventory
data modify storage game:math temp.State.EnderItems set from entity @s EnderItems
data modify storage game:math temp.State.equipment set from entity @s equipment
$data modify storage game:player myData.State.$(dim) set from storage game:math temp.State
$data modify storage game:player data[{name:"$(target)"}] set from storage game:player myData
$execute as $(target) run function game:api/state/load {dim:"$(dim)"}
function game:api/state/load {dim:"backupSpy"}