execute if entity @s[tag=Magic.Altar,tag=Magic.Basic] run loot spawn ~ ~ ~ loot game:give/altar/basic
execute if entity @s[tag=Magic.Altar,tag=Magic.Simple] run loot spawn ~ ~ ~ loot game:give/altar/simple
execute if entity @s[tag=!Magic.Altar,tag=Magic.Basic] run loot spawn ~ ~ ~ loot game:give/pedestal/basic
execute if entity @s[tag=!Magic.Altar,tag=Magic.Simple] run loot spawn ~ ~ ~ loot game:give/pedestal/simple