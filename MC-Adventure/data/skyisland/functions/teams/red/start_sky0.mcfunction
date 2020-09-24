#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will allow the players to begin their teams adventure
#--------------------------------------

#Timer to slow down Populate Process, less LAG
scoreboard players add @s helpmenu_time 1
execute as @s[scores={helpmenu_time=0..1040}] run function skyisland:teams/red/start_box0
#Add 1 to procedure before timer resets(timer resets when 260 or higher)
scoreboard players set @s[scores={helpmenu_time=1040}] help 1501
#Reset Timer
scoreboard players reset @s[scores={helpmenu_time=1040..}] helpmenu_time