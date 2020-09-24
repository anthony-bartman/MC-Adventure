#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will handle the help menu during the skyisland adventure for no game loop
#--------------------------------------

#Normal
execute if score @s helpmenu_time matches 1..15 if score @s help matches 3 run function skyisland:trigger/island_settings
execute if score @s helpmenu_time matches 1..15 if score @s help matches 4 run function skyisland:trigger/slowest/stuck3
execute if score @s helpmenu_time matches 1..15 if score @s help matches 5 run function mainisland:trigger/slowest/adv_help3
execute if score @s helpmenu_time matches 1..15 if score @s help matches 6 run function oceanisland:trigger/slowest/adv_help3
#Reset Players Score
execute if score @s helpmenu_time matches 120 run scoreboard players reset @s help
execute if score @s helpmenu_time matches 120 run scoreboard players enable @s help
execute if score @s helpmenu_time matches 120 run scoreboard players reset @s helpmenu_time
