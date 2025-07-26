
$data modify storage buttons:storage temp.text_box set value $(text_box)
execute unless data storage buttons:storage temp.text_box.text run data modify storage buttons:storage temp.text set value {}
execute if data storage buttons:storage temp.text_box.text run data modify storage buttons:storage temp.text set from storage buttons:storage temp.text_box.text
execute unless data storage buttons:storage temp.text_box.size run data modify storage buttons:storage temp.text_box.size set value 1


$data modify storage buttons:storage temp.bc_box set value $(bc_box)
execute unless data storage buttons:storage temp.bc_box.width run data modify storage buttons:storage temp.w set value 1.3f
execute if data storage buttons:storage temp.bc_box.width run data modify storage buttons:storage temp.w set from storage buttons:storage temp.bc_box.width
execute unless data storage buttons:storage temp.bc_box.height run data modify storage buttons:storage temp.h set value 0.1f
execute if data storage buttons:storage temp.bc_box.height run data modify storage buttons:storage temp.h set from storage buttons:storage temp.bc_box.height
execute unless data storage buttons:storage temp.bc_box.style run data modify storage buttons:storage temp.bc_box.style set value "block"

execute unless data storage buttons:storage temp.bc_box.block run data modify storage buttons:storage temp.block set value "stone"
execute if data storage buttons:storage temp.bc_box.block run data modify storage buttons:storage temp.block set from storage buttons:storage temp.bc_box.block
execute unless data storage buttons:storage temp.bc_box.cursor_block run data modify storage buttons:storage temp.cursor_block set value "cobblestone"
execute if data storage buttons:storage temp.bc_box.cursor_block run data modify storage buttons:storage temp.cursor_block set from storage buttons:storage temp.bc_box.cursor_block

execute unless data storage buttons:storage temp.bc_box.color run data modify storage buttons:storage temp.color set value -115402
execute if data storage buttons:storage temp.bc_box.color run data modify storage buttons:storage temp.color set from storage buttons:storage temp.bc_box.color
execute unless data storage buttons:storage temp.bc_box.cursor_color run data modify storage buttons:storage temp.cursor_color set value -1115402
execute if data storage buttons:storage temp.bc_box.cursor_color run data modify storage buttons:storage temp.cursor_color set from storage buttons:storage temp.bc_box.cursor_color


$data modify storage buttons:storage temp.score set value $(score)
$data modify storage buttons:storage temp.Tags set value $(Tags)
data modify storage buttons:storage temp.Tags append value "button.slider"
data modify storage buttons:storage temp.Tags append value "button.button"
data modify storage buttons:storage temp.Tags append value "button.new"




data modify storage buttons:storage temp.h5 set from storage buttons:storage temp.text_box.size



scoreboard players set .style buttons.main -1

data modify storage buttons:storage temp.temp set from storage buttons:storage temp.bc_box.style
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "block"
execute if score .temp0 buttons.main matches 0 run scoreboard players set .style buttons.main 1

data modify storage buttons:storage temp.temp set from storage buttons:storage temp.bc_box.style
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "flat"
execute if score .temp0 buttons.main matches 0 run scoreboard players set .style buttons.main 2



#execute if data storage buttons:storage temp.bc_box.cursor_width store result score .temp0 buttons.main run data get storage buttons:storage temp.bc_box.cursor_width 1000
#execute if data storage buttons:storage temp.bc_box.cursor_width store result score .temp1 buttons.main run data get storage buttons:storage temp.w 1000
#execute if data storage buttons:storage temp.bc_box.cursor_width run scoreboard players operation .temp0 buttons.main += .temp1 buttons.main
#execute if data storage buttons:storage temp.bc_box.cursor_width store result storage buttons:storage temp.w float 0.001 run scoreboard players get .temp0 buttons.main



execute if score .style buttons.main matches -1 run tellraw @a [{text:"ERROR: backgrouund box style not valid: \""},{nbt:"temp.bc_box.style",storage:"buttons:storage"},{text:"\" (valid input: \"block\"|\"flat\") "}]
execute if score .style buttons.main matches 1 unless data storage buttons:storage temp.score.inc run function buttons:system/summon/slider with storage buttons:storage temp
execute if score .style buttons.main matches 1 if data storage buttons:storage temp.score.inc run function buttons:system/summon/math/bc_style/slider/advanced
execute if score .style buttons.main matches 2 run function buttons:system/summon/math/bc_style/slider/flat




