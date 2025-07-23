scoreboard players set Create.Remove_Teams.Lives Game.Data 15
$data merge storage game:data {Data:{Remove_Teams:{Class:"$(Class)"}}}
$function game:system/util/remove_team/loop {Class:"$(Class)"}