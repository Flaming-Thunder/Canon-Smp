execute store result score @s Player.Lives run data get storage game:math temp.State.Lives
forceload add 0 0
setblock 0 0 0 chest
data modify block 0 0 0 Items set from storage game:math temp.State.Inventory
item replace entity @s container.0 from block 0 0 0 container.0
item replace entity @s container.1 from block 0 0 0 container.1
item replace entity @s container.2 from block 0 0 0 container.2
item replace entity @s container.3 from block 0 0 0 container.3
item replace entity @s container.4 from block 0 0 0 container.4
item replace entity @s container.5 from block 0 0 0 container.5
item replace entity @s container.6 from block 0 0 0 container.6
item replace entity @s container.7 from block 0 0 0 container.7
item replace entity @s container.8 from block 0 0 0 container.8
item replace entity @s container.9 from block 0 0 0 container.9
item replace entity @s container.10 from block 0 0 0 container.10
item replace entity @s container.11 from block 0 0 0 container.11
item replace entity @s container.12 from block 0 0 0 container.12
item replace entity @s container.13 from block 0 0 0 container.13
item replace entity @s container.14 from block 0 0 0 container.14
item replace entity @s container.15 from block 0 0 0 container.15
item replace entity @s container.16 from block 0 0 0 container.16
item replace entity @s container.17 from block 0 0 0 container.17
item replace entity @s container.18 from block 0 0 0 container.18
item replace entity @s container.19 from block 0 0 0 container.19
item replace entity @s container.20 from block 0 0 0 container.20
item replace entity @s container.21 from block 0 0 0 container.21
item replace entity @s container.22 from block 0 0 0 container.22
item replace entity @s container.23 from block 0 0 0 container.23
item replace entity @s container.24 from block 0 0 0 container.24
item replace entity @s container.25 from block 0 0 0 container.25
item replace entity @s container.26 from block 0 0 0 container.26
data modify storage game:math temp.Items set value [{delete:true},{delete:true},{delete:true},{delete:true},{delete:true},{delete:true},{delete:true},{delete:true},{delete:true}]
execute if data storage game:math temp.State.Inventory[{Slot:27b}] run data modify storage game:math temp.Items[0] set from storage game:math temp.State.Inventory[{Slot:27b}]
execute if data storage game:math temp.State.Inventory[{Slot:28b}] run data modify storage game:math temp.Items[1] set from storage game:math temp.State.Inventory[{Slot:28b}]
execute if data storage game:math temp.State.Inventory[{Slot:29b}] run data modify storage game:math temp.Items[2] set from storage game:math temp.State.Inventory[{Slot:29b}]
execute if data storage game:math temp.State.Inventory[{Slot:30b}] run data modify storage game:math temp.Items[3] set from storage game:math temp.State.Inventory[{Slot:30b}]
execute if data storage game:math temp.State.Inventory[{Slot:31b}] run data modify storage game:math temp.Items[4] set from storage game:math temp.State.Inventory[{Slot:31b}]
execute if data storage game:math temp.State.Inventory[{Slot:32b}] run data modify storage game:math temp.Items[5] set from storage game:math temp.State.Inventory[{Slot:32b}]
execute if data storage game:math temp.State.Inventory[{Slot:33b}] run data modify storage game:math temp.Items[6] set from storage game:math temp.State.Inventory[{Slot:33b}]
execute if data storage game:math temp.State.Inventory[{Slot:34b}] run data modify storage game:math temp.Items[7] set from storage game:math temp.State.Inventory[{Slot:34b}]
execute if data storage game:math temp.State.Inventory[{Slot:35b}] run data modify storage game:math temp.Items[8] set from storage game:math temp.State.Inventory[{Slot:35b}]
execute if data storage game:math temp.Items[0].id run data modify storage game:math temp.Items[0].Slot set value 0b
execute if data storage game:math temp.Items[1].id run data modify storage game:math temp.Items[1].Slot set value 1b
execute if data storage game:math temp.Items[2].id run data modify storage game:math temp.Items[2].Slot set value 2b
execute if data storage game:math temp.Items[3].id run data modify storage game:math temp.Items[3].Slot set value 3b
execute if data storage game:math temp.Items[4].id run data modify storage game:math temp.Items[4].Slot set value 4b
execute if data storage game:math temp.Items[5].id run data modify storage game:math temp.Items[5].Slot set value 5b
execute if data storage game:math temp.Items[6].id run data modify storage game:math temp.Items[6].Slot set value 6b
execute if data storage game:math temp.Items[7].id run data modify storage game:math temp.Items[7].Slot set value 7b
execute if data storage game:math temp.Items[8].id run data modify storage game:math temp.Items[8].Slot set value 8b
data remove storage game:math temp.Items[{delete:true}]
data modify block 0 0 0 Items set from storage game:math temp.Items
item replace entity @s container.27 from block 0 0 0 container.0
item replace entity @s container.28 from block 0 0 0 container.1
item replace entity @s container.29 from block 0 0 0 container.2
item replace entity @s container.30 from block 0 0 0 container.3
item replace entity @s container.31 from block 0 0 0 container.4
item replace entity @s container.32 from block 0 0 0 container.5
item replace entity @s container.33 from block 0 0 0 container.6
item replace entity @s container.34 from block 0 0 0 container.7
item replace entity @s container.35 from block 0 0 0 container.8
data modify block 0 0 0 Items set from storage game:math temp.State.EnderItems
item replace entity @s enderchest.0 from block 0 0 0 container.0
item replace entity @s enderchest.1 from block 0 0 0 container.1
item replace entity @s enderchest.2 from block 0 0 0 container.2
item replace entity @s enderchest.3 from block 0 0 0 container.3
item replace entity @s enderchest.4 from block 0 0 0 container.4
item replace entity @s enderchest.5 from block 0 0 0 container.5
item replace entity @s enderchest.6 from block 0 0 0 container.6
item replace entity @s enderchest.7 from block 0 0 0 container.7
item replace entity @s enderchest.8 from block 0 0 0 container.8
item replace entity @s enderchest.9 from block 0 0 0 container.9
item replace entity @s enderchest.10 from block 0 0 0 container.10
item replace entity @s enderchest.11 from block 0 0 0 container.11
item replace entity @s enderchest.12 from block 0 0 0 container.12
item replace entity @s enderchest.13 from block 0 0 0 container.13
item replace entity @s enderchest.14 from block 0 0 0 container.14
item replace entity @s enderchest.15 from block 0 0 0 container.15
item replace entity @s enderchest.16 from block 0 0 0 container.16
item replace entity @s enderchest.17 from block 0 0 0 container.17
item replace entity @s enderchest.18 from block 0 0 0 container.18
item replace entity @s enderchest.19 from block 0 0 0 container.19
item replace entity @s enderchest.20 from block 0 0 0 container.20
item replace entity @s enderchest.21 from block 0 0 0 container.21
item replace entity @s enderchest.22 from block 0 0 0 container.22
item replace entity @s enderchest.23 from block 0 0 0 container.23
item replace entity @s enderchest.24 from block 0 0 0 container.24
item replace entity @s enderchest.25 from block 0 0 0 container.25
item replace entity @s enderchest.26 from block 0 0 0 container.26
data modify storage game:math temp.equipment set from storage game:math temp.State.equipment
data modify storage game:math temp.Items set value [{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}]
data modify storage game:math temp.Items[0] set from storage game:math temp.equipment.offhand
data modify storage game:math temp.Items[1] set from storage game:math temp.equipment.head
data modify storage game:math temp.Items[2] set from storage game:math temp.equipment.chest
data modify storage game:math temp.Items[3] set from storage game:math temp.equipment.legs
data modify storage game:math temp.Items[4] set from storage game:math temp.equipment.feet
data modify storage game:math temp.Items[0].Slot set value 0b
data modify storage game:math temp.Items[1].Slot set value 1b
data modify storage game:math temp.Items[2].Slot set value 2b
data modify storage game:math temp.Items[3].Slot set value 3b
data modify storage game:math temp.Items[4].Slot set value 4b
data modify block 0 0 0 Items set from storage game:math temp.Items
item replace entity @s weapon.offhand from block 0 0 0 container.0
item replace entity @s armor.head from block 0 0 0 container.1
item replace entity @s armor.chest from block 0 0 0 container.2
item replace entity @s armor.legs from block 0 0 0 container.3
item replace entity @s armor.feet from block 0 0 0 container.4
setblock 0 0 0 air
data modify storage game:math temp.pos.x set from storage game:math temp.State.Pos[0]
data modify storage game:math temp.pos.y set from storage game:math temp.State.Pos[1]
data modify storage game:math temp.pos.z set from storage game:math temp.State.Pos[2]
data modify storage game:math temp.pos.rot0 set from storage game:math temp.State.Rotation[0]
data modify storage game:math temp.pos.rot1 set from storage game:math temp.State.Rotation[1]
data modify storage game:math temp.pos.Dimension set from storage game:math temp.State.Dimension
function game:api/state/load/pos with storage game:math temp.pos