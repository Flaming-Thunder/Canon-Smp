execute store result score .TimeEnd Game.Math run data get storage game:player myData.effects.Cowardice.End
execute if score .GameTime Game.Math > .TimeEnd Game.Math run data remove storage game:player myData.effects.Cowardice
execute if score .GameTime Game.Math > .TimeEnd Game.Math run tag @s remove Magic.Coward