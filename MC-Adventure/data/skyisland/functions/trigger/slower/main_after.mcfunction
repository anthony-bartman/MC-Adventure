#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will handle the help menu during the skyisland adventure for no game loop
#--------------------------------------

#Slower
execute if score @s helpmenu_time matches 1..25 if score @s help matches 3 run function skyisland:trigger/island_settings
execute if score @s helpmenu_time matches 1..25 if score @s help matches 4 run function skyisland:trigger/slower/stuck2
execute if score @s helpmenu_time matches 1..25 if score @s help matches 5 run function mainisland:trigger/slower/adv_help2
execute if score @s helpmenu_time matches 1..25 if score @s help matches 6 run function oceanisland:trigger/slower/adv_help2
#Reset Players Score
execute if score @s helpmenu_time matches 200 run scoreboard players reset @s help
execute if score @s helpmenu_time matches 200 run scoreboard players enable @s help
execute if score @s helpmenu_time matches 200 run scoreboard players reset @s helpmenu_time
