#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This takes care of what happens to wave before it gets spawned in (Normal Loop Speed)
#--------------------------------------

# '100' : time for the raid wave to load up 
execute at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] run function skyisland:teams/green/adv/get_jerry
scoreboard players add greenMP mapProgress 1
scoreboard players set greenTime raidControl 0
