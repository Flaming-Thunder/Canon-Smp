/classic
  execute as @s if score @s Player.Lives matches 10.. run %FILE%/classic/maxed
  execute as @s if score @s Player.Lives matches 0..9 run %FILE%/classic/used
  execute as @s if score @s Player.Lives matches ..-1 run %FILE%/classic/undead

  /maxed
    loot spawn ~ ~ ~ loot game:give/life_token/classic
    playsound item.shield.break ambient @a ~ ~ ~ 1 1 0
    tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Max Lives Reached!",color:red}]
    damage @s 10 magic
    advancement grant @s only advancements:used_item/life_token/token_declined
  /used
    scoreboard players add @s Player.Lives 1
    function game:api/player_update
    playsound block.beacon.power_select ambient @a ~ ~ ~ 1 1 0
    particle trial_spawner_detection ~ ~.2 ~ 0.3 0.4 0.3 0 50 normal
    particle trial_spawner_detection ~ ~ ~ 0.3 0 0.3 0 40 normal
    advancement grant @s only advancements:used_item/life_token
  /undead
    scoreboard players set @s Player.Lives 1
    function game:api/player_update
    playsound block.beacon.power_select ambient @a ~ ~ ~ 1 1 0
    particle trial_spawner_detection_ominous ~ ~.2 ~ 0.3 0.4 0.3 0 50 normal
    particle trial_spawner_detection_ominous ~ ~ ~ 0.3 0 0.3 0 40 normal
    particle trial_spawner_detection_ominous ~ ~ ~ 0.6 0 0.6 0 40 normal
    advancement grant @s only advancements:used_item/life_token/from_the_grave

  advancement revoke @s only game:use_life_token/classic
#
#
#
#
#
/golden
  execute as @s if score @s Player.Lives matches 16.. run %FILE%/golden/supermaxxed
  execute as @s if score @s Player.Lives matches 10..15 run %FILE%/golden/maxed
  execute as @s if score @s Player.Lives matches 0..9 run %FILE%/golden/used
  execute as @s if score @s Player.Lives matches ..-1 run %FILE%/golden/undead

  /supermaxxed
    loot spawn ~ ~ ~ loot game:give/life_token/golden
    tellraw @s [{text:"[",color:gold}, {text:"Info",color:yellow,bold:true}, {text:"]: ",color:gold}, {text:"Max Lives Reached!",color:red}]
    playsound item.shield.break ambient @a ~ ~ ~ 1 1 0
    damage @s 10 magic
  /maxed
    scoreboard players add @s Player.Lives 1
    function game:api/player_update
    playsound block.enchantment_table.use ambient @a ~ ~ ~ 1 1 0
    particle trial_spawner_detection ~ ~.2 ~ 0.3 0.4 0.3 0 50 normal
    particle trial_spawner_detection ~ ~ ~ 0.3 0 0.3 0 40 normal
    advancement grant @s only advancements:

  /used
    execute as @s if score @s Player.Lives matches 9 run scoreboard players add @s Player.Lives 1
    execute as @s if score @s Player.Lives matches 9 run %FILE%/maxed
    execute as @s if score @s Player.Lives matches 8 run scoreboard players add @s Player.Lives 2
    execute as @s if score @s Player.Lives matches 0..7 run scoreboard players add @s Player.Lives 3
    function game:api/player_update
    playsound block.beacon.power_select ambient @a ~ ~ ~ 1 1 0
    particle trial_spawner_detection ~ ~.2 ~ 0.3 0.4 0.3 0 50 normal
    particle trial_spawner_detection ~ ~ ~ 0.3 0 0.3 0 40 normal
  /undead
    scoreboard players set @s Player.Lives 3
    function game:api/player_update
    playsound block.beacon.power_select ambient @a ~ ~ ~ 1 1 0
    particle trial_spawner_detection_ominous ~ ~.2 ~ 0.3 0.4 0.3 0 50 normal
    particle trial_spawner_detection_ominous ~ ~ ~ 0.3 0 0.3 0 40 normal
    particle trial_spawner_detection_ominous ~ ~ ~ 0.6 0 0.6 0 40 normal

  advancement revoke @s only game:use_life_token/golden