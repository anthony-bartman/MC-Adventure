#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport players on a team to the map spawn
#--------------------------------------

#Teleport all player to team's spawn on map
clear @s 
effect clear @s
advancement revoke @s everything
recipe take @s *
scoreboard objectives setdisplay sidebar.team.dark_red
#Update Players
title @s subtitle ["",{"text":"To "},{"text":"Crimson Team's ","color":"dark_red","bold":true},{"text":"Spawnpoint"}]
title @s title ["",{"text":"Teleporting ","bold":true,"color":"white"}]
function lobby:teams/crimson/teamspawn
#Reset rightclick scoreboard
scoreboard players reset @s introBeginRClick
scoreboard players operation Total_Players intro -= Teammates crTeamPlayers
