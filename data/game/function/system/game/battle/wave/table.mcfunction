data modify storage game:game_scape_data battle.spawn_table set value []
data modify storage game:game_scape_data battle.spawn_table append value {id:"husk",weight:"decrease {m:40,a:20,t:0}",spawner:"ground"}
data modify storage game:game_scape_data battle.spawn_table append value {id:"skeleton",weight:"decrease {m:27,a:30,t:0}",spawner:"ground"}
data modify storage game:game_scape_data battle.spawn_table append value {id:"silverfish",weight:"pic {m:10,a:40,t:9}",spawner:"ground"}
data modify storage game:game_scape_data battle.spawn_table append value {id:"phantom",weight:"increase {m:20,a:10,t:10}",spawner:"air"}
data modify storage game:game_scape_data battle.group_table set value []
data modify storage game:game_scape_data battle.group_table append value {id:"husk",proba:[{id:"giant",chance:"0"},{id:"husk",chance:"1..69"},{id:0,chance:"70.."}]}
data modify storage game:game_scape_data battle.group_table append value {id:"skeleton",proba:[{id:"skeleton",chance:"..39"},{id:0,"chance":"40..79"},{id:"husk",chance:"80.."}]}
data modify storage game:game_scape_data battle.group_table append value {id:"giant",proba:[{id:0,chance:"0..100"}]}
data modify storage game:game_scape_data battle.group_table append value {id:"silverfish",proba:[{id:"silverfish",chance:"0..79"}]}
data modify storage game:game_scape_data battle.group_table append value {id:"phantom",proba:[{id:"phantom",chance:"0..49",id:0,chance:"50.."}]}