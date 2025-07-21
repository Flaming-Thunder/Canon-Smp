$data merge storage game:data {Data:{Remove_Teams:{Class:"$(Class)"}}}
$execute if score Create.Remove_Teams.Lives Game.Data matches -10 run tellraw @a[tag=Developer] [{text:""},{text:"$(Class) Installed"}]
$execute if score Create.Remove_Teams.Lives Game.Data matches -10 run data merge storage game:data {Data:{Create_Teams:{$(Class):0b}}}
scoreboard players remove Remove.Teams.Lives Game.Data 1
execute store result storage game:data Data.Remove_Teams.Life int 1 run scoreboard players get Remove.Teams.Lives Game.Data
execute if score Remove.Teams.Lives Game.Data matches -10..10 run function game:system/util/remove_team with storage game:data Data.Remove_Teams