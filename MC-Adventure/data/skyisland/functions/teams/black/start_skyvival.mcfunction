#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will allow the players to begin their teams adventure
#--------------------------------------

#===============
#Populate the Skyisland with Villagers and stuff (Stage 1)
#===============
#Timer to slow down Populate Process, less LAG
scoreboard players add @s[scores={help=1500}] helpmenu_time 1
execute as @s[scores={help=1500,helpmenu_time=0..260}] run function skyisland:teams/black/start_box
#Add 1 to procedure before timer resets(timer resets when 261 or higher)
scoreboard players set @s[scores={help=1500,helpmenu_time=260}] help 1501
#Reset Timer
scoreboard players reset @s[scores={helpmenu_time=260..}] helpmenu_time

#==============
#Start the Skyisland main method(Stage 2)
#===============
execute if entity @s[scores={help=1501}] run scoreboard players set blackMP mapProgress 0
#Resets Help and reenables
scoreboard players reset @s[scores={help=1501}] help
scoreboard players enable @s[scores={help=1501}] help