$execute anchored eyes run particle item{item:{id:"nether_star",components:{"minecraft:item_model":"$(item_model)","minecraft:custom_model_data":$(custom_model_data)}}} ^-0.5 ^ ^0.5 0 0 0 0.1 5 normal @s
playsound entity.item.break player @s ~ ~ ~ 0.5 1 0
item replace entity @s weapon.mainhand with air