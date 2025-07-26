##https://www.desmos.com/calculator/c5b840e606?lang=fr

/decrease

  #f(x=t,m,a) = m
  #f(x=a+t,m,a) = 0

  scoreboard players operation .x Game.Math = Battle.round Game.Data

  $scoreboard players set .temp0 Game.Math $(m)
  $scoreboard players set .temp1 Game.Math $(a)
  $scoreboard players set .temp2 Game.Math $(t)

  scoreboard players operation .x Game.Math -= .temp2 Game.Math
  scoreboard players operation .x Game.Math *= #100 Game.Math
  scoreboard players operation .x Game.Math /= .temp1 Game.Math
  scoreboard players operation .x Game.Math *= .x Game.Math
  scoreboard players operation .x Game.Math /= #100 Game.Math
  scoreboard players operation .x Game.Math *= #-1 Game.Math
  scoreboard players add .x Game.Math 100
  scoreboard players operation .x Game.Math *= .temp0 Game.Math

  execute if score Battle.round Game.Data >= .temp2 Game.Math run return run scoreboard players operation .x Game.Math /= #100 Game.Math
  execute if score Battle.round Game.Data < .temp2 Game.Math run return 0
#END


/increase
  #f(x=a,m,a) = m/2
  #f(x=0,m,a) = 0
  #f(x=infinity,m,a) = m

  scoreboard players operation .x Game.Math = Battle.round Game.Data

  $scoreboard players set .temp0 Game.Math $(m)
  $scoreboard players set .temp3 Game.Math $(t)
  $scoreboard players set .temp1 Game.Math $(a)
  
  scoreboard players operation .temp1 Game.Math += .x Game.Math
  scoreboard players operation .temp1 Game.Math -= .temp3 Game.Math

  $scoreboard players set .temp2 Game.Math $(a)
  scoreboard players operation .temp2 Game.Math *= #100 Game.Math

  scoreboard players operation .temp2 Game.Math /= .temp1 Game.Math
  scoreboard players operation .temp2 Game.Math *= #-1 Game.Math
  scoreboard players add .temp2 Game.Math 100

  scoreboard players operation .temp2 Game.Math *= .temp0 Game.Math

  return run scoreboard players operation .temp2 Game.Math /= #100 Game.Math
#END

/pic
  #f(x=t,m,a,t) = m
  #f(x<t,m,a,t) < m
  #f(x>t,m,a,t) > m
  #f(x=infinity,m,a,t) = 0

  scoreboard players operation .x Game.Math = Battle.round Game.Data

  $scoreboard players set .temp0 Game.Math $(m)
  $scoreboard players set .temp1 Game.Math $(a)
  $scoreboard players set .temp2 Game.Math $(t)

  scoreboard players operation .x Game.Math -= .temp2 Game.Math
  execute if score .x Game.Math matches ..-1 run scoreboard players operation .x Game.Math *= #-1 Game.Math
  scoreboard players operation .x Game.Math *= .temp0 Game.Math
  scoreboard players operation .x Game.Math += .temp1 Game.Math

  scoreboard players operation .temp0 Game.Math *= .temp1 Game.Math


  return run scoreboard players operation .temp0 Game.Math /= .x Game.Math


#END