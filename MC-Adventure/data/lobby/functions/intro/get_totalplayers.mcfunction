#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will calculate the total amount of players on a team ready to play the game
#--------------------------------------

#Calculates total players on all teams
execute if score goldTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates gdTeamPlayers
execute if score purpleTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates pTeamPlayers
execute if score greenTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates grTeamPlayers
execute if score aquaTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates aTeamPlayers
execute if score redTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates rTeamPlayers
execute if score yellowTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates yTeamPlayers
execute if score blueTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates blueTeamPlayers
execute if score blackTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates blackTeamPlayers
execute if score cyanTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates cyTeamPlayers
execute if score magentaTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates mTeamPlayers
execute if score crimsonTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates crTeamPlayers
execute if score cobaltTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates coTeamPlayers
execute if score ivyTeam enabledTeams matches 1 run scoreboard players operation Total_Players intro += Teammates iTeamPlayers
scoreboard players operation Total_Players intro += Total_Spectators spectators





