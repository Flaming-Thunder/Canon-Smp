loot spawn ~ ~ ~ loot game:give/life_token/classic
playsound item.shield.break ambient @a ~ ~ ~ 1 1 0
tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Max Lives Reached!",color:red}]
damage @s 10 magic
advancement grant @s only advancements:used_item/life_token/token_declined