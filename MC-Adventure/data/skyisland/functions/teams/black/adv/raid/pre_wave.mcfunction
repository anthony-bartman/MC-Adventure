#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This takes care of what happens to wave before it gets spawned in (Normal Loop Speed)
#--------------------------------------
scoreboard players add blackTime raidControl 1
execute if score blackTime raidControl matches 100.. at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] run function skyisland:teams/black/adv/get_jerry
execute if score blackTime raidControl matches 100.. run scoreboard players add blackMP mapProgress 1
execute if score blackTime raidControl matches 100.. run scoreboard players set blackTime raidControl 0
