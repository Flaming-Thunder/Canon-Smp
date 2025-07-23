execute if entity @s[tag=Magic.Simple] at @s positioned ~ ~1 ~ on passengers if entity @s[type=item_display] run function game:system/tick/craft/animation/summon with entity @s
execute if entity @s[tag=Magic.Basic,tag=!Magic.Altar] at @s positioned ~ ~1.5 ~ on passengers if entity @s[type=item_display] run function game:system/tick/craft/animation/summon with entity @s
execute if entity @s[tag=Magic.Basic,tag=Magic.Altar] at @s positioned ~ ~1 ~ on passengers if entity @s[type=item_display] run function game:system/tick/craft/animation/summon with entity @s
scoreboard players operation @s Altar.LockDelay = Altar_Craft.Delay Game.Data
execute on passengers if entity @s[type=item_display] run data remove entity @s item