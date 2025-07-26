execute at @a as @e[distance=..20,type=#game:blood_moonable] unless entity @s[nbt={data:{Data:{ Blood_Mooned: 1b }}}] at @s run
  data modify entity @s data.Data.Blood_Mooned set value 1b
  particle trial_spawner_detection_ominous ~ ~ ~ 0.3 0 0.3 0 20 normal

  execute if entity @s[type=zombie] run
    attribute @s scale modifier add game:blood_minion -0.2 add_multiplied_total
    execute summon zombie run
      data merge entity @s {drop_chances:{head:0,chest:0,legs:0,feet:0,mainhand:0,offhand:0},CanPickUpLoot:false,data:{Data:{ Blood_Mooned: 1b }}}
      data modify entity @s attributes set value [{id:scale,base:1.2}]
      item replace entity @s armor.head with iron_helmet 1
      item replace entity @s armor.chest with iron_chestplate 1
      item replace entity @s armor.legs with iron_leggings 1
      item replace entity @s armor.feet with iron_boots 1
      item replace entity @s weapon.mainhand with iron_sword 1
      item replace entity @s weapon.offhand with totem_of_undying 1
    #END
  #END

  execute if entity @s[type=skeleton] run
    kill @s
    execute summon skeleton run
      data merge entity @s {drop_chances:{head:0.5,chest:0,legs:0,feet:0,mainhand:0,offhand:0},CanPickUpLoot:false,data:{Data:{ Blood_Mooned: 1b }}}
      data modify entity @s attributes set value [{id:scale,base:0.75},{id:max_health,base:40}]
      data modify entity @s Health set value 40
      item replace entity @s armor.head with skeleton_skull 1
      item replace entity @s weapon.mainhand with bow[enchantments={power:5,flame:1}] 1
      item replace entity @s weapon.offhand with totem_of_undying[death_protection={death_effects:[{probability:1,type:apply_effects,effects:[{id:"minecraft:resistance",amplifier:1,duration:200,show_particles:false},{id:"minecraft:regeneration",amplifier:1,duration:600,show_particles:false}]}]}] 1

    #END
  #END

#END



