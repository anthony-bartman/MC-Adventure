#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will handle the help menu during the skyisland adventure for no game loop
#--------------------------------------

#Slower
execute if score @s helpmenu_time matches 1..15 if score @s help matches 3 run function skyisland:trigger/slower/adv_help2
execute if score @s helpmenu_time matches 1..15 if score @s help matches 4 run function skyisland:trigger/slower/stuck2
execute if score @s helpmenu_time matches 1..15 if score @s help matches 5 run function oceanisland:trigger/slower/adv_help2
#Reset Menu
execute if score @s helpmenu_time matches 120 run scoreboard players reset @s help
execute if score @s helpmenu_time matches 120 run scoreboard players enable @s help
execute if score @s helpmenu_time matches 120 run scoreboard players reset @s helpmenu_time
