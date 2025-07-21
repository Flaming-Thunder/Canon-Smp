loot spawn ~ ~ ~ loot game:give/life_token/golden
tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Max Lives Reached!",color:red}]
playsound item.shield.break ambient @a ~ ~ ~ 1 1 0
damage @s 10 magic