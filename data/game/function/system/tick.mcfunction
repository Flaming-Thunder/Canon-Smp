summon marker ~ ~ ~ {Tags:["Game.Math"]}
execute as @a run scoreboard players enable @s Retrive_Life
execute as @a run scoreboard players enable @s Check_Event_Time
execute as @a run scoreboard players enable @s Dev_World
execute as @a[tag=Developer] run scoreboard players enable @s Game_Scape
function game:system/tick/trigger
function game:system/world/canon_event
execute as @a[tag=!Game.PlayerInited] run function game:system/load/player_id
execute as @a at @s run function game:system/tick/player
execute as @e[type=item_frame,tag=Magic.Pedestal] at @s run function game:system/tick/pedistal/init
execute as @e[type=item_display,tag=Magic.Pedestal] at @s if entity @a[distance=..30] run function game:system/tick/pedistal
execute as @e[type=item_display,tag=Magic.CraftAnimation] at @s run function game:system/tick/craft/animation
execute as @e[type=marker,tag=Magic.CowardiceBox] at @s run function game:system/tick/rune/cowardice/box
execute as @e[type=block_display,tag=Magic.Construction] at @s run function game:system/tick/rune/spell_construction/block
execute as @e[type=item_display,tag=Magic.Inferno] at @s run function game:system/tick/rune/spell_inferno/fire
execute store result score .gametime Game.Math run time query gametime
scoreboard players operation .gametime Game.Math %= State.SaveCooldown Game.Data
execute if score .gametime Game.Math matches 0 as @a run function game:api/state/backup
kill @e[type=arrow,tag=Magic.Fire,tag=Magic.ToDelete]
tag @e[type=arrow,tag=Magic.Fire] add Magic.ToDelete
clear @a[tag=!Developer] *[custom_data~{DevTool:true}]
kill @e[type=marker,tag=Game.Math]