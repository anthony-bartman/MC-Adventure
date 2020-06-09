#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will run the adventure for the team
#--------------------------------------

#Trigger menu
execute as @s[scores={help=1..1499}] run function skyisland:trigger/main_after
#This handles the islandSettings Book
execute as @s[scores={mapProgress=0..}] run function skyisland:teams/black/change_is

#Set in survival
#Check if players are trying to build to other islands 
tellraw @s[gamemode=adventure,distance=..60] ["",{"text":"\n >>","color":"white"},{"text":" GAMEMODE","color":"yellow"},{"text":" = ","color":"gray"},{"text":"SURVIVAL\n","color":"green"},{"text":" ","color":"gray"}]
gamemode survival @s[gamemode=adventure,distance=..60]
#Set in adventure if outside circle
tellraw @s[gamemode=survival,distance=60..65] ["",{"text":"\n >>"},{"text":" Sorry, ","color":"gray"},{"text":"no building","color":"red"},{"text":" to other islands. Go back to ","color":"gray"},{"text":"SkyIsland ","color":"gold"},{"text":"for survival mode\n ","color":"gray"},{"text":">>","color":"white"},{"text":" GAMEMODE","color":"yellow"},{"text":" = ","color":"gray"},{"text":"ADVENTURE\n","color":"aqua"},{"text":" ","color":"gray"}]
gamemode adventure @s[gamemode=survival,distance=60..65]
