$execute if data storage game:data {Data:{Create_Teams:{$(Class):1b}}} run tellraw @a[tag=Developer] "$(Class) Class Already Made"
$execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} run tellraw @a[tag=Developer] "Creating $(Class) Class..."
$execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} run scoreboard players set Create.Teams.Lives Game.Data 15
$execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} store result storage game:data Data.Create_Teams.Life int 1 run scoreboard players get Create.Teams.Lives Game.Data
$execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} store result storage game:data Data.Create_Teams.Negative int -1 run scoreboard players get Create.Teams.Lives Game.Data
$execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} run data merge storage game:data {Data:{Create_Teams:{Class:"$(Class)"}}}
$execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} run function game:system/util/create_team/loop with storage game:data Data.Create_Teams