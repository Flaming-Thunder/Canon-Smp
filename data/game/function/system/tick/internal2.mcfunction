execute store result score .TimeEnd Game.Math run data get storage game:player myData.effects.Frightener.End
execute if score .GameTime Game.Math > .TimeEnd Game.Math run data remove storage game:player myData.effects.Frightener
execute if score .GameTime Game.Math > .TimeEnd Game.Math run tag @s remove Magic.Frightener
execute unless entity @a[tag=Magic.Frightened,distance=..8] run effect give @s poison 1 0 false