#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will set all parameters needed to set all player settings correctly
#--------------------------------------

#Player settings
tag @s add player
gamemode adventure @s
clear @s

#Teleport players to introSpawn
execute as @s run function lobby:lobby_spawn

