execute as @e[type=block_display,tag=button.slider] if function buttons:system/tick/if_player run function buttons:system/tick/slider/main
execute as @e[type=text_display,tag=button.slider] if function buttons:system/tick/if_player run function buttons:system/tick/slider/main

execute as @e[type=block_display,tag=button.cta] if function buttons:system/tick/if_player run function buttons:system/tick/cta/main
execute as @e[type=text_display,tag=button.cta] if function buttons:system/tick/if_player run function buttons:system/tick/cta/main

execute as @e[type=block_display,tag=button.binary_switch] if function buttons:system/tick/if_player run function buttons:system/tick/binary_switch/main

execute as @e[type=item_display,tag=button.gui] if function buttons:system/tick/if_player run function buttons:system/tick/gui/main

execute as @e[type=text_display,tag=button.rgb_indicator] if function buttons:system/tick/if_player run function buttons:system/tick/rgb_indicator/main


forceload add 0 0 0 0

tp 00000001-0000-0002-0000-000300000004 0.0 0.0 0.0

tellraw test {nbt:"Pos",entity:"00000001-0000-0002-0000-000300000004"}




