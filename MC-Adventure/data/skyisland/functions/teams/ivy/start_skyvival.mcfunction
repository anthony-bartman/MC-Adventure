#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will allow the players to begin their teams adventure
#--------------------------------------

#===============
#Populate the Skyisland with Villagers and stuff (Stage 1)
#===============
#Based on loopSpeed
execute if score loopSpeed lobbySettings matches 0 as @s[scores={help=1500}] run function skyisland:teams/ivy/start_sky0
execute if score loopSpeed lobbySettings matches 1 as @s[scores={help=1500}] run function skyisland:teams/ivy/start_sky1
execute if score loopSpeed lobbySettings matches 2 as @s[scores={help=1500}] run function skyisland:teams/ivy/start_sky2
execute if score loopSpeed lobbySettings matches 3 as @s[scores={help=1500}] run function skyisland:teams/ivy/start_sky3

#==============
#Start the Skyisland main method(Stage 2)
#===============
execute if entity @s[scores={help=1501}] run scoreboard players set ivyMP mapProgress 0
#Resets Help and reenables
execute if score @s help matches 1501 run scoreboard players enable @s help
scoreboard players set @s[scores={help=1501}] help 0