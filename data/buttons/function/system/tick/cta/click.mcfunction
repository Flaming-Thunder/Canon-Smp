data modify entity @s data.userUUID set from entity @a[tag=button.user,limit=1] UUID

execute store result score .temp1 buttons.main run data get storage buttons:storage temp.animation
execute if score .temp1 buttons.main matches 0 at @s run function buttons:system/run_cmd_no_check with storage buttons:storage temp

execute if score .temp1 buttons.main matches 1 run function buttons:system/tick/cta/animation/v_squash_start
execute if score .temp1 buttons.main matches 2 run function buttons:system/tick/cta/animation/h_squash_start
execute if score .temp1 buttons.main matches 3 run function buttons:system/tick/cta/animation/v_rotation_start
execute if score .temp1 buttons.main matches 4 run function buttons:system/tick/cta/animation/h_rotation_start

execute as @a[tag=button.user] at @s run playsound ui.button.click neutral @s ~ ~ ~ 0.4 1 0.2



