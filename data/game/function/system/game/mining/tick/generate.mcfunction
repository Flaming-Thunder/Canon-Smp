data modify storage game:math temp.pos set value [0,0,0]
execute store result storage game:math temp.pos[0] double 1 run random value -20..20
execute store result storage game:math temp.pos[1] double 1 run random value 0..99
execute store result storage game:math temp.pos[2] double 1 run random value 103..143