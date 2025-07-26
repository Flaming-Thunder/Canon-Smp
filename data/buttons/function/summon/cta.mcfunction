

$data modify storage buttons:storage temp.cmd set value '$(command)'


$data modify storage buttons:storage temp.text_box set value $(text_box)
execute unless data storage buttons:storage temp.text_box.text run data modify storage buttons:storage temp.text set value {}
execute if data storage buttons:storage temp.text_box.text run data modify storage buttons:storage temp.text set from storage buttons:storage temp.text_box.text
execute unless data storage buttons:storage temp.text_box.icon run data modify storage buttons:storage temp.item set value {}
execute if data storage buttons:storage temp.text_box.icon run data modify storage buttons:storage temp.item set from storage buttons:storage temp.text_box.icon
execute unless data storage buttons:storage temp.text_box.size run data modify storage buttons:storage temp.text_box.size set value 1
execute unless data storage buttons:storage temp.text_box.style run data modify storage buttons:storage temp.text_box.style set value "center"


$data modify storage buttons:storage temp.bc_box set value $(bc_box)
execute unless data storage buttons:storage temp.bc_box.width run data modify storage buttons:storage temp.w set value 1.6f
execute if data storage buttons:storage temp.bc_box.width run data modify storage buttons:storage temp.w set from storage buttons:storage temp.bc_box.width
execute unless data storage buttons:storage temp.bc_box.height run data modify storage buttons:storage temp.h set value 0.4f
execute if data storage buttons:storage temp.bc_box.height run data modify storage buttons:storage temp.h set from storage buttons:storage temp.bc_box.height
execute unless data storage buttons:storage temp.bc_box.style run data modify storage buttons:storage temp.bc_box.style set value "block"

execute unless data storage buttons:storage temp.bc_box.block run data modify storage buttons:storage temp.block set value "stone"
execute if data storage buttons:storage temp.bc_box.block run data modify storage buttons:storage temp.block set from storage buttons:storage temp.bc_box.block

execute unless data storage buttons:storage temp.bc_box.color run data modify storage buttons:storage temp.color set value 0
execute if data storage buttons:storage temp.bc_box.color run data modify storage buttons:storage temp.color set from storage buttons:storage temp.bc_box.color
#execute unless data storage buttons:storage temp.bc_box.border_color run data modify storage buttons:storage temp.border_color set value 0
#execute if data storage buttons:storage temp.bc_box.border_color run data modify storage buttons:storage temp.border_color set from storage buttons:storage temp.bc_box.border_color
#execute unless data storage buttons:storage temp.bc_box.border_coeff run data modify storage buttons:storage temp.border_coeff set value 0.1f
#execute if data storage buttons:storage temp.bc_box.border_coeff run data modify storage buttons:storage temp.border_coeff set from storage buttons:storage temp.bc_box.border_coeff


$data modify storage buttons:storage temp.animation set value $(animation)
data modify storage buttons:storage temp.anim set value 0

data modify storage buttons:storage temp.temp set from storage buttons:storage temp.animation
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "v_squash"
execute if score .temp0 buttons.main matches 0 run data modify storage buttons:storage temp.anim set value 1

data modify storage buttons:storage temp.temp set from storage buttons:storage temp.animation
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "h_squash"
execute if score .temp0 buttons.main matches 0 run data modify storage buttons:storage temp.anim set value 2

data modify storage buttons:storage temp.temp set from storage buttons:storage temp.animation
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "rotation"
execute if score .temp0 buttons.main matches 0 run data modify storage buttons:storage temp.anim set value 3

data modify storage buttons:storage temp.temp set from storage buttons:storage temp.animation
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "super_rotation"
execute if score .temp0 buttons.main matches 0 run data modify storage buttons:storage temp.anim set value 4


$data modify storage buttons:storage temp.Tags set value $(Tags)
data modify storage buttons:storage temp.Tags append value "button.cta"
data modify storage buttons:storage temp.Tags append value "button.button"
data modify storage buttons:storage temp.Tags append value "button.new"


scoreboard players set .style buttons.main -1

data modify storage buttons:storage temp.temp set from storage buttons:storage temp.bc_box.style
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "block"
execute if score .temp0 buttons.main matches 0 run scoreboard players set .style buttons.main 1

data modify storage buttons:storage temp.temp set from storage buttons:storage temp.bc_box.style
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set value "flat"
execute if score .temp0 buttons.main matches 0 run scoreboard players set .style buttons.main 2


execute if score .style buttons.main matches -1 run tellraw @a [{text:"ERROR: backgrouund box style not valid: \""},{nbt:"temp.bc_box.style",storage:"buttons:storage"},{text:"\" (valid input: \"block\"|\"flat\") "}]
execute if score .style buttons.main matches 1 run function buttons:system/summon/math/bc_style/block
execute if score .style buttons.main matches 2 run function buttons:system/summon/math/bc_style/flat

data modify storage buttons:storage debug set from storage buttons:storage temp




