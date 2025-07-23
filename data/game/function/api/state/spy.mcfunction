function game:api/state/save {dim:"backupSpy"}
$data modify storage game:player myData set from storage game:player data[{name:"$(target)"}]
tellraw @a {nbt:"myData",storage:"game:player"}
$data modify storage game:math temp.State set from storage game:player myData.State.$(dim)
function game:api/state/load/final