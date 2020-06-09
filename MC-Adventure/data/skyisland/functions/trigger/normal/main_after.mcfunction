#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will handle the help menu during the skyisland adventure for no game loop
#--------------------------------------

#Normal
execute if score @s helpmenu_time matches 1..75 if score @s help matches 3 run function skyisland:trigger/island_settings
execute if score @s helpmenu_time matches 1..75 if score @s help matches 4 run function skyisland:trigger/normal/stuck1
execute if score @s helpmenu_time matches 1..75 if score @s help matches 5 run function mainisland:trigger/normal/adv_help
execute if score @s helpmenu_time matches 1..75 if score @s help matches 6 run function oceanisland:trigger/normal/adv_help
#Reset Players Score
execute if score @s helpmenu_time matches 600 run scoreboard players reset @s help
execute if score @s helpmenu_time matches 600 run scoreboard players enable @s help
execute if score @s helpmenu_time matches 600 run scoreboard players reset @s helpmenu_time

