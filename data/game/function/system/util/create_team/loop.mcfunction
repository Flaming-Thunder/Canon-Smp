$say $(Class).Lives.$(Life)
$team add $(Class).Lives.$(Life)
$execute if score Create.Teams.Lives Game.Data matches -10..-1 run team modify $(Class).Lives.$(Life) seeFriendlyInvisibles false
$execute if score Create.Teams.Lives Game.Data matches 1..10 run team modify $(Class).Lives.$(Life) seeFriendlyInvisibles false
$execute if score Create.Teams.Lives Game.Data matches 11 run team modify $(Class).Lives.$(Life) color yellow
$execute if score Create.Teams.Lives Game.Data matches 10 run team modify $(Class).Lives.$(Life) color white
$execute if score Create.Teams.Lives Game.Data matches 7..9 run team modify $(Class).Lives.$(Life) color green
$execute if score Create.Teams.Lives Game.Data matches 4..6 run team modify $(Class).Lives.$(Life) color gold
$execute if score Create.Teams.Lives Game.Data matches 2..3 run team modify $(Class).Lives.$(Life) color red
$execute if score Create.Teams.Lives Game.Data matches 1 run team modify $(Class).Lives.$(Life) color dark_red
$execute if score Create.Teams.Lives Game.Data matches 0 run team modify $(Class).Lives.$(Life) color gray
$execute if score Create.Teams.Lives Game.Data matches -5..-1 run team modify $(Class).Lives.$(Life) color dark_gray
$execute if score Create.Teams.Lives Game.Data matches -11..-6 run team modify $(Class).Lives.$(Life) color black
$execute if score Create.Teams.Lives Game.Data matches 11..15 run team modify $(Class).Lives.$(Life) prefix [{text:""},   {text:"[",color:"#466dec"}, {text:"$(Life)",color:"#5ddfff"} , {text:"❤",color:"#a0ecff"},{text:"] ",color:"#466dec"}]
$execute if score Create.Teams.Lives Game.Data matches 1..10 run team modify $(Class).Lives.$(Life) prefix [{text:""},   {text:"[",color:"#cf3a3a"}, {text:"$(Life)",color:"#ffbcbc"} , {text:"❤",color:"#c71c1c"},{text:"] ",color:"#cf3a3a"}]
$execute if score Create.Teams.Lives Game.Data matches 0 run team modify $(Class).Lives.0 prefix [{text:""}, {text:"[",color:"#554f4f"}, {text:"👻",color:"#949494"},{text:"] ",color:"#554f4f"}]
$execute if score Create.Teams.Lives Game.Data matches -10..-1 run team modify $(Class).Lives.$(Life) prefix [{text:""}, {text:"[",color:"#554f4f"}, {text:"$(Negative)",color:"#dac9c9"} , {text:"☠",color:"#949494"},{text:"] ",color:"#554f4f"}]
$execute if score Create.Teams.Lives Game.Data matches -11 run team modify $(Class).Lives.$(Life) prefix [{text:""}, {text:"[",color:"#554f4f"}, {text:"+$(Negative)",color:"#dac9c9"} , {text:"☠",color:"#949494"},{text:"] ",color:"#554f4f"}]
$execute if score Create.Teams.Lives Game.Data matches -10 run data merge storage game:data {Data:{Create_Teams:{$(Class):1b}}}
$execute if score Create.Teams.Lives Game.Data matches -11 run tellraw @a[tag=Developer] [{text:"$(Class) Created",color:green}]
scoreboard players remove Create.Teams.Lives Game.Data 1
execute store result storage game:data Data.Create_Teams.Life int 1 run scoreboard players get Create.Teams.Lives Game.Data
execute store result storage game:data Data.Create_Teams.Negative int -1 run scoreboard players get Create.Teams.Lives Game.Data
execute if score Create.Teams.Lives Game.Data matches -11..15 run function game:system/util/create_team/loop with storage game:data Data.Create_Teams