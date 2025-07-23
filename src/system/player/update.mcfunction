scoreboard players set Player.Teams.Update Game.Data 15
execute as @s run %FILE%/loop {Update:15}

#                          ##===========================##
#                          ||                           ||
#                          ||       Change  Teams       ||
#                          ||                           ||
#                          ##===========================##

/loop
  $execute if score @s Player.Lives matches $(Update) run team join Default.Lives.$(Update)

  scoreboard players remove Player.Teams.Update Game.Data 1
  execute store result storage game:data Data.Player.Teams.Update int 1 run scoreboard players get Player.Teams.Update Game.Data
  execute if score Player.Teams.Update Game.Data matches -11.. run %FILE%/loop with storage game:data Data.Player.Teams


#                          ##===========================##
#                          ||                           ||
#                          ||      Set Attributes       ||
#                          ||                           ||
#                          ##===========================##

##                                    - Reset -

attribute @s armor base reset
attribute @s max_health base reset
attribute @s attack_damage base reset
attribute @s attack_speed base reset
attribute @s entity_interaction_range base set 3.0
attribute @s block_interaction_range base set 4.5
attribute @s block_break_speed base reset
attribute @s jump_strength base reset
attribute @s movement_speed base reset
attribute @s sneaking_speed base reset
attribute @s step_height base reset
attribute @s oxygen_bonus base reset
attribute @s scale base reset
attribute @s safe_fall_distance base reset
attribute @s fall_damage_multiplier base reset
tag @s remove Vampirism
tag @s remove Aquaphobic

##                                    - Lives 0 -

execute as @s if score @s Player.Lives matches 0 run
  attribute @s entity_interaction_range base set 2.8
  attribute @s block_interaction_range base set 4.25
  attribute @s attack_damage base set -0.2

##                                    - Lives -1 -

execute as @s if score @s Player.Lives matches -1 run
  attribute @s entity_interaction_range base set 2.6
  attribute @s block_interaction_range base set 4
  attribute @s attack_damage base set -0.5
  attribute @s armor base set -2

##                                    - Lives -2 -
  
execute as @s if score @s Player.Lives matches -2 run
  attribute @s entity_interaction_range base set 2.4
  attribute @s block_interaction_range base set 3.75
  attribute @s attack_damage base set -0.8
  attribute @s armor base set -4
  attribute @s movement_speed base set 0.085

##                                    - Lives -3 -
  
execute as @s if score @s Player.Lives matches -3 run
  attribute @s entity_interaction_range base set 2.2
  attribute @s block_interaction_range base set 3.5
  attribute @s attack_damage base set -1
  attribute @s armor base set -6
  attribute @s movement_speed base set 0.08
  attribute @s jump_strength base set 0.35
  attribute @s step_height base set 0.4
  attribute @s safe_fall_distance base set 2.5
  attribute @s fall_damage_multiplier base set 3

##                                    - Lives -4 -
  
execute as @s if score @s Player.Lives matches -4 run
  attribute @s entity_interaction_range base set 2
  attribute @s block_interaction_range base set 3.25
  attribute @s attack_damage base set -2
  attribute @s armor base set -7
  attribute @s movement_speed base set 0.08
  attribute @s jump_strength base set 0.35
  attribute @s step_height base set 0.4
  attribute @s safe_fall_distance base set 2.5
  attribute @s fall_damage_multiplier base set 3
  tag @s add Vampirism
  attribute @s scale base set 0.95
  attribute @s max_health base set 18

##                                    - Lives -5 -
  
execute as @s if score @s Player.Lives matches -5 run
  attribute @s entity_interaction_range base set 1.9
  attribute @s block_interaction_range base set 3
  attribute @s block_break_speed base set 0.6
  attribute @s attack_damage base set -3
  attribute @s armor base set -8
  attribute @s movement_speed base set 0.08
  attribute @s jump_strength base set 0.35
  attribute @s step_height base set 0.4
  attribute @s safe_fall_distance base set 2.5
  attribute @s fall_damage_multiplier base set 3
  tag @s add Vampirism
  attribute @s scale base set 0.9
  attribute @s max_health base set 18

##                                    - Lives -6 -
  
execute as @s if score @s Player.Lives matches -6 run
  attribute @s entity_interaction_range base set 1.8
  attribute @s block_interaction_range base set 2.75
  attribute @s block_break_speed base set 0.25
  attribute @s attack_damage base set -4
  attribute @s armor base set -12
  attribute @s movement_speed base set 0.07
  attribute @s jump_strength base set 0.3
  attribute @s step_height base set 0.4
  attribute @s safe_fall_distance base set 2
  attribute @s fall_damage_multiplier base set 5
  tag @s add Vampirism
  attribute @s scale base set 0.8
  attribute @s max_health base set 16

##                                    - Lives -7 -
  
execute as @s if score @s Player.Lives matches -7 run
  attribute @s entity_interaction_range base set 1.7
  attribute @s block_interaction_range base set 2.5
  attribute @s block_break_speed base set 0.2
  attribute @s attack_damage base set -5
  attribute @s armor base set -12
  attribute @s movement_speed base set 0.065
  attribute @s jump_strength base set 0.3
  attribute @s step_height base set 0.4
  attribute @s safe_fall_distance base set 2
  attribute @s fall_damage_multiplier base set 6
  tag @s add Vampirism
  tag @s add Aquaphobic
  attribute @s scale base set 0.8
  attribute @s max_health base set 14

##                                    - Lives -8 -
  
execute as @s if score @s Player.Lives matches -8 run
  attribute @s entity_interaction_range base set 1.6
  attribute @s block_interaction_range base set 2.25
  attribute @s block_break_speed base set 0.175
  attribute @s attack_damage base set -5.5
  attribute @s armor base set -14
  attribute @s movement_speed base set 0.06
  attribute @s jump_strength base set 0.3
  attribute @s step_height base set 0.4
  attribute @s safe_fall_distance base set 2
  attribute @s fall_damage_multiplier base set 7
  tag @s add Vampirism
  tag @s add Aquaphobic
  attribute @s scale base set 0.8
  attribute @s max_health base set 10

##                                    - Lives -9 -
  
execute as @s if score @s Player.Lives matches -9 run
  attribute @s entity_interaction_range base set 1.5
  attribute @s block_interaction_range base set 2
  attribute @s block_break_speed base set 0.15
  attribute @s attack_damage base set -6
  attribute @s armor base set -14
  attribute @s movement_speed base set 0.055
  attribute @s jump_strength base set 0.3
  attribute @s step_height base set 0.4
  attribute @s safe_fall_distance base set 2
  attribute @s fall_damage_multiplier base set 8
  tag @s add Vampirism
  tag @s add Aquaphobic
  attribute @s scale base set 0.8
  attribute @s max_health base set 8

##                                    - Lives -10 -
  
execute as @s if score @s Player.Lives matches ..-10 run
  attribute @s entity_interaction_range base set 1.5
  attribute @s block_interaction_range base set 1.75
  attribute @s block_break_speed base set 0.125
  attribute @s attack_damage base set -10
  attribute @s armor base set -16
  attribute @s movement_speed base set 0.05
  attribute @s jump_strength base set 0.3
  attribute @s step_height base set 0.4
  attribute @s safe_fall_distance base set 2
  attribute @s fall_damage_multiplier base set 10
  tag @s add Vampirism
  tag @s add Aquaphobic
  attribute @s scale base set 0.8
  attribute @s max_health base set 6