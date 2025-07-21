summon marker ~ ~ ~ {Tags:["Game.Math"]}
function game:system/world/canon_event
execute as @a[tag=!Game.PlayerInited] run function game:system/load/player_id
execute as @a at @s run function game:system/tick/player
execute as @e[type=item_frame,tag=Magic.Pedestal] at @s run function game:system/tick/pedistal/init
execute as @e[type=item_display,tag=Magic.Pedestal] at @s run function game:system/tick/pedistal
execute as @e[type=item_display,tag=Magic.CraftAnimation] at @s run function game:system/tick/craft/animation
execute as @e[type=marker,tag=Magic.CowardiceBox] at @s run function game:system/tick/rune/cowardice/box
execute as @e[type=block_display,tag=Magic.Construction] at @s run function game:system/tick/rune/spell_construction/block
execute as @e[type=item_display,tag=Magic.Inferno] at @s run function game:system/tick/rune/spell_inferno/fire
kill @e[type=marker,tag=Game.Math]
kill @e[type=arrow,tag=Magic.Fire,tag=Magic.ToDelete]
tag @e[type=arrow,tag=Magic.Fire] add Magic.ToDelete