data modify storage buttons:storage temp.temp set from storage buttons:storage temp.UUID
execute store result score .temp0 buttons.main run data modify storage buttons:storage temp.temp set from entity @s data.UUID
return run execute if score .temp0 buttons.main matches 0


