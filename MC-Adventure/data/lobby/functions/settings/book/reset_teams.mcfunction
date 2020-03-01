#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will reset players to the beginnging of lobby sequence
#--------------------------------------
#Resets more scoreboards
scoreboard players reset @a gdTeamPlayers
scoreboard players reset @a pTeamPlayers
scoreboard players reset @a grTeamPlayers
scoreboard players reset @a aTeamPlayers
scoreboard players reset @a rTeamPlayers
scoreboard players reset @a yTeamPlayers
scoreboard players reset @a blueTeamPlayers
scoreboard players reset @a blackTeamPlayers
scoreboard players reset @a cyTeamPlayers
scoreboard players reset @a mTeamPlayers
scoreboard players reset @a sTeamPlayers
scoreboard players reset @a crTeamPlayers
scoreboard players reset @a coTeamPlayers
scoreboard players reset @a spectators

#Set Teammates score to 0
scoreboard players set Teammates gdTeamPlayers 0
scoreboard players set Teammates pTeamPlayers 0
scoreboard players set Teammates grTeamPlayers 0
scoreboard players set Teammates aTeamPlayers 0
scoreboard players set Teammates rTeamPlayers 0
scoreboard players set Teammates yTeamPlayers 0
scoreboard players set Teammates blueTeamPlayers 0
scoreboard players set Teammates blackTeamPlayers 0
scoreboard players set Teammates cyTeamPlayers 0
scoreboard players set Teammates mTeamPlayers 0
scoreboard players set Teammates sTeamPlayers 0
scoreboard players set Teammates crTeamPlayers 0
scoreboard players set Teammates coTeamPlayers 0
scoreboard players set Total_Spectators spectators 0

#Reset Kits
scoreboard players reset @a chooseKit
clear @a
#All Players Leave their Team
team leave @a
