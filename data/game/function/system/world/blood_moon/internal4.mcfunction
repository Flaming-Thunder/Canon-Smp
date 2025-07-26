data merge entity @s {drop_chances:{head:0.5,chest:0,legs:0,feet:0,mainhand:0,offhand:0},CanPickUpLoot:false,data:{Data:{ Blood_Mooned: 1b }}}
data modify entity @s attributes set value [{id:scale,base:0.75},{id:max_health,base:40}]
data modify entity @s Health set value 40
item replace entity @s armor.head with skeleton_skull 1
item replace entity @s weapon.mainhand with bow[enchantments={power:5,flame:1}] 1
item replace entity @s weapon.offhand with totem_of_undying[death_protection={death_effects:[{probability:1,type:apply_effects,effects:[{id:"minecraft:resistance",amplifier:1,duration:200,show_particles:false},{id:"minecraft:regeneration",amplifier:1,duration:600,show_particles:false}]}]}] 1