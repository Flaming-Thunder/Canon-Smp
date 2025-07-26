

/base
	item replace entity @s armor.head with barrier[custom_data={"Price":0},item_model="air",unbreakable={},enchantments={"binding_curse":1},tooltip_display={hide_tooltip:true,hidden_components:["enchantments"]}]
  item replace entity @s armor.chest with leather_chestplate[custom_data={"Price":0},unbreakable={},enchantments={"binding_curse":1},tooltip_display={hidden_components:["enchantments"]}]
  item replace entity @s armor.legs with barrier[custom_data={"Price":0},item_model="air",unbreakable={},enchantments={"binding_curse":1},tooltip_display={hide_tooltip:true,hidden_components:["enchantments"]}]
	item replace entity @s armor.feet with leather_boots[custom_data={"Price":0},unbreakable={},enchantments={"binding_curse":1},tooltip_display={hidden_components:["enchantments"]}]
	
  item replace entity @s hotbar.0 with wooden_sword[custom_data={"Price":0},unbreakable={},tooltip_display={hidden_components:["enchantments"]}]

#END


/warrior

	%FILE%/base

  item replace entity @s armor.head with chainmail_helmet[custom_data={"Price":0},unbreakable={},enchantments={"binding_curse":1},tooltip_display={hidden_components:["enchantments"]}]
  item replace entity @s armor.legs with chainmail_leggings[custom_data={"Price":0},unbreakable={},enchantments={"binding_curse":1},tooltip_display={hidden_components:["enchantments"]}]
  
  item replace entity @s hotbar.0 with stone_sword[custom_data={"Price":0},unbreakable={},tooltip_display={hidden_components:["enchantments"]}]

#END



/archer

	%FILE%/base

  item replace entity @s armor.feet with arrow[custom_data={"Price":0},unbreakable={},tooltip_display={hidden_components:["enchantments"]},equippable={asset_id:"leather_boots",slot:"feet"},item_model="leather_boots",item_name={text:"Archer Boots"},rarity="rare",attribute_modifiers=[{type:"armor",id:"archer_boots",amount:1,operation:"add_value"},{type:"movement_speed",id:"archer_boots",amount:0.2,operation:"add_multiplied_base"}],enchantments={"binding_curse":1}]
  
  item replace entity @s hotbar.1 with bow[custom_data={"Price":0},unbreakable={},enchantments={infinity:1},tooltip_display={hidden_components:["enchantments"]}]

#END


