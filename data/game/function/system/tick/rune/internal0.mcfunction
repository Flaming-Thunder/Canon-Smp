function game:system/tick/rune/damage
execute store result score .temp0 Game.Math run random value 0..18
execute store result score .temp1 Game.Math run random value 0..13
execute if score .temp0 Game.Math matches 0 run effect give @s absorption 60 0
execute if score .temp0 Game.Math matches 1 run effect give @s conduit_power 60 0
execute if score .temp0 Game.Math matches 2 run effect give @s dolphins_grace 60 0
execute if score .temp0 Game.Math matches 3 run effect give @s fire_resistance 60 0
execute if score .temp0 Game.Math matches 4 unless score .temp1 Game.Math matches 8 run effect give @s haste 60 0
execute if score .temp0 Game.Math matches 5 run effect give @s health_boost 60 0
execute if score .temp0 Game.Math matches 6 unless score .temp1 Game.Math matches 1 run effect give @s hero_of_the_village 60 0
execute if score .temp0 Game.Math matches 7 unless score .temp1 Game.Math matches 6 run effect give @s instant_health 60 0
execute if score .temp0 Game.Math matches 8 unless score .temp1 Game.Math matches 4 run effect give @s invisibility 60 0
execute if score .temp0 Game.Math matches 9 run effect give @s jump_boost 60 0
execute if score .temp0 Game.Math matches 10 unless score .temp1 Game.Math matches 0 run effect give @s luck 60 0
execute if score .temp0 Game.Math matches 11 unless score .temp1 Game.Math matches 3 unless score .temp1 Game.Math matches 2 run effect give @s night_vision
execute if score .temp0 Game.Math matches 12 unless score .temp1 Game.Math matches 10 run effect give @s regeneration 60 0
execute if score .temp0 Game.Math matches 13 run effect give @s resistance 60 0
execute if score .temp0 Game.Math matches 14 unless score .temp1 Game.Math matches 5 run effect give @s saturation 60 0
execute if score .temp0 Game.Math matches 15 unless score .temp1 Game.Math matches 7 run effect give @s slow_falling 60 0
execute if score .temp0 Game.Math matches 16 unless score .temp1 Game.Math matches 11 run effect give @s speed 60 0
execute if score .temp0 Game.Math matches 17 unless score .temp1 Game.Math matches 12 run effect give @s strength 60 0
execute if score .temp0 Game.Math matches 18 run effect give @s water_breathing 60 0
execute if score .temp1 Game.Math matches 0 unless score .temp0 Game.Math matches 10 run effect give @s unluck 60 0
execute if score .temp1 Game.Math matches 1 unless score .temp0 Game.Math matches 6 run effect give @s bad_omen 60 0
execute if score .temp1 Game.Math matches 2 unless score .temp0 Game.Math matches 11 run effect give @s blindness 60 0
execute if score .temp1 Game.Math matches 3 unless score .temp0 Game.Math matches 11 run effect give @s darkness 60 0
execute if score .temp1 Game.Math matches 4 unless score .temp0 Game.Math matches 8 run effect give @s glowing 60 0
execute if score .temp1 Game.Math matches 5 unless score .temp0 Game.Math matches 14 run effect give @s hunger 60 0
execute if score .temp1 Game.Math matches 6 unless score .temp0 Game.Math matches 7 run effect give @s instant_damage 60 0
execute if score .temp1 Game.Math matches 7 unless score .temp0 Game.Math matches 15 run effect give @s levitation 60 0
execute if score .temp1 Game.Math matches 8 unless score .temp0 Game.Math matches 4 run effect give @s mining_fatigue 60 0
execute if score .temp1 Game.Math matches 9 run effect give @s nausea 60 0
execute if score .temp1 Game.Math matches 10 unless score .temp0 Game.Math matches 12 run effect give @s poison 60 0
execute if score .temp1 Game.Math matches 11 unless score .temp0 Game.Math matches 16 run effect give @s slowness 60 0
execute if score .temp1 Game.Math matches 12 unless score .temp0 Game.Math matches 17 run effect give @s weakness 60 0
execute if score .temp1 Game.Math matches 13 run effect give @s wither 60 0
execute store result score .temp0 Game.Math run random value 0..72
execute if score .temp0 Game.Math matches 0 run summon zombie ~ ~ ~
execute if score .temp0 Game.Math matches 1 run summon husk ~ ~ ~
execute if score .temp0 Game.Math matches 2 run summon skeleton ~ ~ ~
execute if score .temp0 Game.Math matches 3 run summon creeper ~ ~ ~
execute if score .temp0 Game.Math matches 4 run summon enderman ~ ~ ~
execute if score .temp0 Game.Math matches 5 run summon spider ~ ~ ~
execute if score .temp0 Game.Math matches 6 run summon cave_spider ~ ~ ~
execute if score .temp0 Game.Math matches 7 run summon breeze ~ ~ ~
execute if score .temp0 Game.Math matches 8 run summon blaze ~ ~ ~
execute if score .temp0 Game.Math matches 9 run summon phantom ~ ~ ~
execute if score .temp0 Game.Math matches 10 run summon bogged ~ ~ ~
execute if score .temp0 Game.Math matches 11 run summon elder_guardian ~ ~ ~
execute if score .temp0 Game.Math matches 12 run summon endermite ~ ~ ~
execute if score .temp0 Game.Math matches 13 run summon guardian ~ ~ ~
execute if score .temp0 Game.Math matches 14 run summon ghast ~ ~ ~
execute if score .temp0 Game.Math matches 15 run summon zoglin ~ ~ ~
execute if score .temp0 Game.Math matches 16 run summon illusioner ~ ~ ~
execute if score .temp0 Game.Math matches 17 run summon magma_cube ~ ~ ~
execute if score .temp0 Game.Math matches 18 run summon piglin ~ ~ ~
execute if score .temp0 Game.Math matches 19 run summon piglin_brute ~ ~ ~
execute if score .temp0 Game.Math matches 20 run summon pillager ~ ~ ~
execute if score .temp0 Game.Math matches 21 run summon ravager ~ ~ ~
execute if score .temp0 Game.Math matches 22 run summon shulker ~ ~ ~
execute if score .temp0 Game.Math matches 23 run summon silverfish ~ ~ ~
execute if score .temp0 Game.Math matches 24 run summon skeleton_horse ~ ~ ~
execute if score .temp0 Game.Math matches 25 run summon stray ~ ~ ~
execute if score .temp0 Game.Math matches 26 run summon strider ~ ~ ~
execute if score .temp0 Game.Math matches 27 run summon vex ~ ~ ~
execute if score .temp0 Game.Math matches 28 run summon witch ~ ~ ~
execute if score .temp0 Game.Math matches 29 run summon wither_skeleton ~ ~ ~
execute if score .temp0 Game.Math matches 30 run summon allay ~ ~ ~
execute if score .temp0 Game.Math matches 31 run summon armadillo ~ ~ ~
execute if score .temp0 Game.Math matches 32 run summon axolotl ~ ~ ~
execute if score .temp0 Game.Math matches 33 run summon bat ~ ~ ~
execute if score .temp0 Game.Math matches 34 run summon bee ~ ~ ~
execute if score .temp0 Game.Math matches 35 run summon camel ~ ~ ~
execute if score .temp0 Game.Math matches 36 run summon cat ~ ~ ~
execute if score .temp0 Game.Math matches 37 run summon chicken ~ ~ ~
execute if score .temp0 Game.Math matches 38 run summon cod ~ ~ ~
execute if score .temp0 Game.Math matches 39 run summon cow ~ ~ ~
execute if score .temp0 Game.Math matches 40 run summon dolphin ~ ~ ~
execute if score .temp0 Game.Math matches 41 run summon donkey ~ ~ ~
execute if score .temp0 Game.Math matches 42 run summon drowned ~ ~ ~
execute if score .temp0 Game.Math matches 43 run summon evoker ~ ~ ~
execute if score .temp0 Game.Math matches 44 run summon fox ~ ~ ~
execute if score .temp0 Game.Math matches 45 run summon frog ~ ~ ~
execute if score .temp0 Game.Math matches 46 run summon glow_squid ~ ~ ~
execute if score .temp0 Game.Math matches 47 run summon goat ~ ~ ~
execute if score .temp0 Game.Math matches 48 run summon hoglin ~ ~ ~
execute if score .temp0 Game.Math matches 49 run summon horse ~ ~ ~
execute if score .temp0 Game.Math matches 50 run summon iron_golem ~ ~ ~
execute if score .temp0 Game.Math matches 51 run summon llama ~ ~ ~
execute if score .temp0 Game.Math matches 52 run summon mooshroom ~ ~ ~
execute if score .temp0 Game.Math matches 53 run summon mule ~ ~ ~
execute if score .temp0 Game.Math matches 54 run summon ocelot ~ ~ ~
execute if score .temp0 Game.Math matches 55 run summon panda ~ ~ ~
execute if score .temp0 Game.Math matches 56 run summon parrot ~ ~ ~
execute if score .temp0 Game.Math matches 57 run summon pig ~ ~ ~
execute if score .temp0 Game.Math matches 58 run summon polar_bear ~ ~ ~
execute if score .temp0 Game.Math matches 59 run summon pufferfish ~ ~ ~
execute if score .temp0 Game.Math matches 60 run summon rabbit ~ ~ ~
execute if score .temp0 Game.Math matches 61 run summon salmon ~ ~ ~
execute if score .temp0 Game.Math matches 62 run summon sheep ~ ~ ~
execute if score .temp0 Game.Math matches 63 run summon slime ~ ~ ~
execute if score .temp0 Game.Math matches 64 run summon sniffer ~ ~ ~
execute if score .temp0 Game.Math matches 65 run summon snow_golem ~ ~ ~
execute if score .temp0 Game.Math matches 66 run summon squid ~ ~ ~
execute if score .temp0 Game.Math matches 67 run summon tropical_fish ~ ~ ~
execute if score .temp0 Game.Math matches 68 run summon turtle ~ ~ ~
execute if score .temp0 Game.Math matches 69 run summon villager ~ ~ ~
execute if score .temp0 Game.Math matches 70 run summon wandering_trader ~ ~ ~
execute if score .temp0 Game.Math matches 71 run summon wolf ~ ~ ~
execute if score .temp0 Game.Math matches 72 run summon zombie_villager ~ ~ ~