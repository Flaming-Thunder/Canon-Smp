
$data modify storage buttons:storage temp.w set value $(width)
$data modify storage buttons:storage temp.h set value $(height)
$data modify storage buttons:storage temp.score_name set value $(score_name)
$data modify storage buttons:storage temp.score_objective set value $(score_objective)
$data modify storage buttons:storage temp.Tags set value $(Tags)
data modify storage buttons:storage temp.Tags append value "button.rgb_indicator"
data modify storage buttons:storage temp.Tags append value "button.button"
data modify storage buttons:storage temp.Tags append value "button.new"

execute store result storage buttons:storage temp.w0 float 0.08 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.w1 float 0.008 run data get storage buttons:storage temp.w 100
execute store result storage buttons:storage temp.h0 float 0.04 run data get storage buttons:storage temp.h 100

function buttons:system/summon/rgb_indicator with storage buttons:storage temp








