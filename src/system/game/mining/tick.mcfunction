
#execute as @a run scoreboard players operation .temp Game.Data = @s Player.Break.Stone
#execute as @a run scoreboard players operation .temp Game.Data *= #2 Game.Math
#execute as @a run scoreboard players operation @s Player.Break.Score += .temp Game.Data
#execute as @a run scoreboard players set @s Player.Break.Stone 0

execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Stone
execute as @a run scoreboard players remove @s Player.Break.Stone 1
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Diorite
execute as @a run scoreboard players remove @s Player.Break.Diorite 1
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Granite
execute as @a run scoreboard players remove @s Player.Break.Granite 1
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Cobblestone
execute as @a run scoreboard players remove @s Player.Break.Cobblestone 1
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Cobbled_Deepslate
execute as @a run scoreboard players remove @s Player.Break.Cobbled_Deepslate 1

execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Deepslate
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Deepslate
execute as @a run scoreboard players remove @s Player.Break.Deepslate 1
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Tuff
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Tuff
execute as @a run scoreboard players remove @s Player.Break.Tuff 1
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Calcite
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Calcite
execute as @a run scoreboard players remove @s Player.Break.Calcite 1
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Dripstone
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Dripstone
execute as @a run scoreboard players remove @s Player.Break.Dripstone 1

execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Coal
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Coal
execute as @a run scoreboard players operation @s Player.Break.Score += @s Player.Break.Coal
execute as @a run scoreboard players remove @s Player.Break.Coal 1

execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Coal
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Copper
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Iron
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Gold
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Redstone
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Lapis
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Emerald
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Diamond

execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Coal
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Copper
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Iron
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Gold
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Redstone
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Lapis
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Emerald
execute as @a run scoreboard players operation .temp Game.Data += @s Player.Break.Deepslate_Diamond