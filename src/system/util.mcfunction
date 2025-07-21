

/create_team
  $execute if data storage game:data {Data:{Create_Teams:{$(Class):1b}}} run tellraw @a[tag=Developer] "$(Class) Class Already Made"
  $execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} run tellraw @a[tag=Developer] "Creating $(Class) Class..."
  $execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} run scoreboard players set Create.Teams.Lives Game.Data 15
  $execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} store result storage game:data Data.Create_Teams.Life int 1 run scoreboard players get Create.Teams.Lives Game.Data
  $execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} store result storage game:data Data.Create_Teams.Negative int -1 run scoreboard players get Create.Teams.Lives Game.Data
  $execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} run data merge storage game:data {Data:{Create_Teams:{Class:"$(Class)"}}}
  $execute unless data storage game:data {Data:{Create_Teams:{$(Class):1b}}} run %FILE%/create_team/loop with storage game:data Data.Create_Teams
  /loop
    $say $(Class).Lives.$(Life)
    $team add $(Class).Lives.$(Life)
    $execute if score Create.Teams.Lives Game.Data matches -10..-1 run team modify $(Class).Lives.$(Life) seeFriendlyInvisibles false
    $execute if score Create.Teams.Lives Game.Data matches 1..10 run team modify $(Class).Lives.$(Life) seeFriendlyInvisibles false
    $execute if score Create.Teams.Lives Game.Data matches 11 run team modify $(Class).Lives.$(Life) color yellow
    $execute if score Create.Teams.Lives Game.Data matches 10 run team modify $(Class).Lives.$(Life) color white
    $execute if score Create.Teams.Lives Game.Data matches 7..9 run team modify $(Class).Lives.$(Life) color green
    $execute if score Create.Teams.Lives Game.Data matches 4..6 run team modify $(Class).Lives.$(Life) color gold
    $execute if score Create.Teams.Lives Game.Data matches 2..3 run team modify $(Class).Lives.$(Life) color red
    $execute if score Create.Teams.Lives Game.Data matches 1 run team modify $(Class).Lives.$(Life) color dark_red
    $execute if score Create.Teams.Lives Game.Data matches 0 run team modify $(Class).Lives.$(Life) color gray
    $execute if score Create.Teams.Lives Game.Data matches -5..-1 run team modify $(Class).Lives.$(Life) color dark_gray
    $execute if score Create.Teams.Lives Game.Data matches -11..-6 run team modify $(Class).Lives.$(Life) color black

    $execute if score Create.Teams.Lives Game.Data matches 11..15 run team modify $(Class).Lives.$(Life) prefix [{text:""},   {text:"[",color:"#466dec"}, {text:"$(Life)",color:"#5ddfff"} , {text:"❤",color:"#a0ecff"},{text:"] ",color:"#466dec"}]
    $execute if score Create.Teams.Lives Game.Data matches 1..10 run team modify $(Class).Lives.$(Life) prefix [{text:""},   {text:"[",color:"#cf3a3a"}, {text:"$(Life)",color:"#ffbcbc"} , {text:"❤",color:"#c71c1c"},{text:"] ",color:"#cf3a3a"}]

    $execute if score Create.Teams.Lives Game.Data matches 0 run team modify $(Class).Lives.0 prefix [{text:""}, {text:"[",color:"#554f4f"}, {text:"👻",color:"#949494"},{text:"] ",color:"#554f4f"}]

    $execute if score Create.Teams.Lives Game.Data matches -10..-1 run team modify $(Class).Lives.$(Life) prefix [{text:""}, {text:"[",color:"#554f4f"}, {text:"$(Negative)",color:"#dac9c9"} , {text:"☠",color:"#949494"},{text:"] ",color:"#554f4f"}]
    $execute if score Create.Teams.Lives Game.Data matches -11 run team modify $(Class).Lives.$(Life) prefix [{text:""}, {text:"[",color:"#554f4f"}, {text:"+$(Negative)",color:"#dac9c9"} , {text:"☠",color:"#949494"},{text:"] ",color:"#554f4f"}]

    $execute if score Create.Teams.Lives Game.Data matches -10 run data merge storage game:data {Data:{Create_Teams:{$(Class):1b}}}

    $execute if score Create.Teams.Lives Game.Data matches -11 run tellraw @a[tag=Developer] [{text:"$(Class) Created",color:green}]
    scoreboard players remove Create.Teams.Lives Game.Data 1
    execute store result storage game:data Data.Create_Teams.Life int 1 run scoreboard players get Create.Teams.Lives Game.Data
    execute store result storage game:data Data.Create_Teams.Negative int -1 run scoreboard players get Create.Teams.Lives Game.Data

    execute if score Create.Teams.Lives Game.Data matches -11..15 run %FILE%/create_team/loop with storage game:data Data.Create_Teams
  # End
# End

/remove_team
  $data merge storage game:data {Data:{Remove_Teams:{Class:"$(Class)"}}}

  $execute if score Create.Remove_Teams.Lives Game.Data matches -10 run tellraw @a[tag=Developer] [{text:""},{text:"$(Class) Installed"}]
  $execute if score Create.Remove_Teams.Lives Game.Data matches -10 run data merge storage game:data {Data:{Create_Teams:{$(Class):0b}}}

  scoreboard players remove Remove.Teams.Lives Game.Data 1
  execute store result storage game:data Data.Remove_Teams.Life int 1 run scoreboard players get Remove.Teams.Lives Game.Data
  execute if score Remove.Teams.Lives Game.Data matches -10..10 run %FILE%/remove_team with storage game:data Data.Remove_Teams
# End


/damage_helmet
  execute store result score .damage Game.Math run data get entity @s equipment.head.components."minecraft:damage"
  execute store result score .max_damage Game.Math run data get entity @s equipment.head.components."minecraft:max_damage"
  execute unless entity @s[gamemode=creative] run scoreboard players add .damage Game.Math 1
  scoreboard players operation .damage Game.Math -= .max_damage Game.Math
  scoreboard players operation .damage Game.Math *= #-4063 Game.Math
  scoreboard players operation .damage Game.Math /= .max_damage Game.Math

  item modify entity @s armor.head game:item/damage
  execute if score .damage Game.Math matches ..0 run item replace entity @s armor.head with air


/damage_chest
  execute store result score .damage Game.Math run data get entity @s equipment.chest.components."minecraft:damage"
  execute store result score .max_damage Game.Math run data get entity @s equipment.chest.components."minecraft:max_damage"
  execute unless entity @s[gamemode=creative] run scoreboard players add .damage Game.Math 1
  scoreboard players operation .damage Game.Math -= .max_damage Game.Math
  scoreboard players operation .damage Game.Math *= #-4063 Game.Math
  scoreboard players operation .damage Game.Math /= .max_damage Game.Math

  item modify entity @s armor.chest game:item/damage
  execute if score .damage Game.Math matches ..0 run item replace entity @s armor.chest with air

/damage_legs
  execute store result score .damage Game.Math run data get entity @s equipment.legs.components."minecraft:damage"
  execute store result score .max_damage Game.Math run data get entity @s equipment.legs.components."minecraft:max_damage"
  execute unless entity @s[gamemode=creative] run scoreboard players add .damage Game.Math 1
  scoreboard players operation .damage Game.Math -= .max_damage Game.Math
  scoreboard players operation .damage Game.Math *= #-4063 Game.Math
  scoreboard players operation .damage Game.Math /= .max_damage Game.Math

  item modify entity @s armor.legs game:item/damage
  execute if score .damage Game.Math matches ..0 run item replace entity @s armor.legs with air

/damage_feet
  execute store result score .damage Game.Math run data get entity @s equipment.feet.components."minecraft:damage"
  execute store result score .max_damage Game.Math run data get entity @s equipment.feet.components."minecraft:max_damage"
  execute unless entity @s[gamemode=creative] run scoreboard players add .damage Game.Math 1
  scoreboard players operation .damage Game.Math -= .max_damage Game.Math
  scoreboard players operation .damage Game.Math *= #-4063 Game.Math
  scoreboard players operation .damage Game.Math /= .max_damage Game.Math

  item modify entity @s armor.feet game:item/damage
  execute if score .damage Game.Math matches ..0 run item replace entity @s armor.feet with air


/damage_mainhand
  execute store result score .damage Game.Math run data get entity @s SelectedItem.components."minecraft:damage"
  execute store result score .max_damage Game.Math run data get entity @s SelectedItem.components."minecraft:max_damage"
  execute unless entity @s[gamemode=creative] run scoreboard players add .damage Game.Math 1
  scoreboard players operation .damage Game.Math -= .max_damage Game.Math
  scoreboard players operation .damage Game.Math *= #-4063 Game.Math
  scoreboard players operation .damage Game.Math /= .max_damage Game.Math

  item modify entity @s weapon.mainhand game:item/damage
  execute if score .damage Game.Math matches ..0 run item replace entity @s weapon.mainhand with air

/damage_offhand
  execute store result score .damage Game.Math run data get entity @s equipment.offhand.components."minecraft:damage"
  execute store result score .max_damage Game.Math run data get entity @s equipment.offhand.components."minecraft:max_damage"
  execute unless entity @s[gamemode=creative] run scoreboard players add .damage Game.Math 1
  scoreboard players operation .damage Game.Math -= .max_damage Game.Math
  scoreboard players operation .damage Game.Math *= #-4063 Game.Math
  scoreboard players operation .damage Game.Math /= .max_damage Game.Math

  item modify entity @s weapon.offhand game:item/damage
  execute if score .damage Game.Math matches ..0 run item replace entity @s weapon.offhand with air
