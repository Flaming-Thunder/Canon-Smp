data modify storage buttons:storage temp set from entity @s data


execute on passengers if entity @s[type=text_display,tag=button.text] run data modify entity @s text set from storage buttons:storage temp.text


execute store result score .anim buttons.main run data get storage buttons:storage temp.animation

execute if score .anim buttons.main matches 0 on passengers if entity @s[type=interaction] run function buttons:system/tick/cta/interaction
execute if score .anim buttons.main matches 1 run function buttons:system/tick/cta/animation/v_squash
execute if score .anim buttons.main matches 2 run function buttons:system/tick/cta/animation/h_squash
execute if score .anim buttons.main matches 3 run function buttons:system/tick/cta/animation/v_rotation
execute if score .anim buttons.main matches 4 run function buttons:system/tick/cta/animation/h_rotation

