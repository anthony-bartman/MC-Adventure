#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will remove all lobby related items
#--------------------------------------

#Remove Armor Stands
execute at @e[tag=mainLobby] run kill @e[distance=..50,type=!minecraft:player,type=!minecraft:item_frame]

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
team remove spectators

#Remove Scoreboards
scoreboard objectives remove maxPlayers
scoreboard objectives remove chooseKit
scoreboard objectives remove LP

scoreboard objectives remove gdTeamPlayers
scoreboard objectives remove pTeamPlayers
scoreboard objectives remove grTeamPlayers
scoreboard objectives remove aTeamPlayers
scoreboard objectives remove rTeamPlayers
scoreboard objectives remove yTeamPlayers
scoreboard objectives remove blueTeamPlayers
scoreboard objectives remove blackTeamPlayers
scoreboard objectives remove cTeamPlayers
scoreboard objectives remove mTeamPlayers
scoreboard objectives remove spectators



