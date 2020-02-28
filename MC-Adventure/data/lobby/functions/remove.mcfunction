#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will remove all lobby related items
#--------------------------------------

#Title Clear
title @a reset
title @a clear

#Remove Armor Stands
execute at @e[type=minecraft:armor_stand,tag=mainLobby,limit=1] run kill @e[distance=..100,type=!minecraft:player,type=!minecraft:item_frame]

#Remove Teams
team remove goldTeam
team remove purpleTeam
team remove greenTeam
team remove aquaTeam
team remove redTeam
team remove yellowTeam
team remove blueTeam
team remove blackTeam
team remove cyanTeam
team remove magentaTeam
team remove silverTeam
team remove crimsonTeam
team remove cobaltTeam
team remove spectators

#Remove Scoreboards
scoreboard objectives remove maxPlayers
scoreboard objectives remove enabledTeams
scoreboard objectives remove chooseKit
scoreboard objectives remove LP
scoreboard objectives remove leader
scoreboard objectives remove book
scoreboard objectives remove lockTeams
scoreboard objectives remove particles

scoreboard objectives remove gdTeamPlayers
scoreboard objectives remove pTeamPlayers
scoreboard objectives remove grTeamPlayers
scoreboard objectives remove aTeamPlayers
scoreboard objectives remove rTeamPlayers
scoreboard objectives remove yTeamPlayers
scoreboard objectives remove blueTeamPlayers
scoreboard objectives remove blackTeamPlayers
scoreboard objectives remove cyTeamPlayers
scoreboard objectives remove mTeamPlayers
scoreboard objectives remove sTeamPlayers
scoreboard objectives remove crTeamPlayers
scoreboard objectives remove coTeamPlayers
scoreboard objectives remove spectators

#Remove Tags
tag @a remove leader


