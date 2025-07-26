data merge entity @s {drop_chances:{head:0,chest:0,legs:0,feet:0,mainhand:0,offhand:0},CanPickUpLoot:false,data:{Data:{ Blood_Mooned: 1b }}}
data modify entity @s attributes set value [{id:scale,base:1.2}]
item replace entity @s armor.head with iron_helmet 1
item replace entity @s armor.chest with iron_chestplate 1
item replace entity @s armor.legs with iron_leggings 1
item replace entity @s armor.feet with iron_boots 1
item replace entity @s weapon.mainhand with iron_sword 1
item replace entity @s weapon.offhand with totem_of_undying 1