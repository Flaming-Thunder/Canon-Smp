difficulty easy
scoreboard players set Event.Canon.Deaths Game.Data 0
execute store result score Event.Canon.Chance Game.Data run random value 1..100
execute if score Event.Canon.Chance Game.Data > Event.Canon.Double_Time.Chance Game.Data run function game:system/world/canon_event/internal2
execute if score Event.Canon.Chance Game.Data <= Event.Canon.Double_Time.Chance Game.Data run function game:system/world/canon_event/internal3