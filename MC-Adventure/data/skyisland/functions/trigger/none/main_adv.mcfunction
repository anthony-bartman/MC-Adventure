#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will handle the help menu during the skyisland adventure for no game loop
#--------------------------------------

#None
execute if score @s helpmenu_time matches 1..300 if score @s help matches 3 run function skyisland:trigger/none/adv_help0
execute if score @s helpmenu_time matches 1..300 if score @s help matches 4 run function skyisland:trigger/none/stuck0
execute if score @s helpmenu_time matches 1..300 if score @s help matches 5 run function oceanisland:trigger/none/adv_help0
#Reset Menu
execute if score @s helpmenu_time matches 2500 run scoreboard players reset @s help
execute if score @s helpmenu_time matches 2500 run scoreboard players enable @s help
execute if score @s helpmenu_time matches 2500 run scoreboard players reset @s helpmenu_time

