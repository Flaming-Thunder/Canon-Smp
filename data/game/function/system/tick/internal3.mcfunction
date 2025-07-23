forceload add 0 0
setblock 0 0 0 chest
loot replace block 0 0 0 container.0 loot game:player_head
data modify storage game:player myData.name set from block 0 0 0 Items[0].components."minecraft:profile".name
setblock 0 0 0 air