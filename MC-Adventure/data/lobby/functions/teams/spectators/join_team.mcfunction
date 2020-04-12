#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will make a spectator go back to the lobby to join a team if they want
#--------------------------------------

#Teleports player in spectator to mainLobby
execute as @s run function lobby:lobby_spawn
title @s title {"text":"You Have Returned","bold":true}
title @s subtitle {"text":"To Team Lobby \u25c0","bold":true,"italic":true,"color":"dark_gray"}

#Change gamemode and remove from team
gamemode adventure @s
team leave @s  