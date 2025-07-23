execute as @a[tag=Magic.Target,limit=1] run data modify storage game:math temp.item2 set from entity @s SelectedItem
item replace entity @a[tag=Magic.Target,limit=1] weapon.mainhand from entity @s container.0
data modify entity @s item set from storage game:math temp.item2