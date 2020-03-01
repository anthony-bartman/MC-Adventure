#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will join update statisitcs of teams when a player joins or leaves a team
#--------------------------------------

#Remove 1 from 'Teammates' score of team
execute if entity @s[team=goldTeam] run scoreboard players remove Teammates gdTeamPlayers 1
execute if entity @s[team=purpleTeam] run scoreboard players remove Teammates pTeamPlayers 1
execute if entity @s[team=greenTeam] run scoreboard players remove Teammates grTeamPlayers 1
execute if entity @s[team=aquaTeam] run scoreboard players remove Teammates aTeamPlayers 1
execute if entity @s[team=redTeam] run scoreboard players remove Teammates rTeamPlayers 1
execute if entity @s[team=yellowTeam] run scoreboard players remove Teammates yTeamPlayers 1
execute if entity @s[team=blueTeam] run scoreboard players remove Teammates blueTeamPlayers 1
execute if entity @s[team=blackTeam] run scoreboard players remove Teammates blackTeamPlayers 1
execute if entity @s[team=cyanTeam] run scoreboard players remove Teammates cyTeamPlayers 1
execute if entity @s[team=magentaTeam] run scoreboard players remove Teammates mTeamPlayers 1
execute if entity @s[team=silverTeam] run scoreboard players remove Teammates sTeamPlayers 1
execute if entity @s[team=crimsonTeam] run scoreboard players remove Teammates crTeamPlayers 1
execute if entity @s[team=cobaltTeam] run scoreboard players remove Teammates coTeamPlayers 1
execute if entity @s[team=spectators] run scoreboard players remove Total_Spectators spectators 1

#Remove Players from 'Team' scoreboard
scoreboard players reset @s[team=goldTeam] gdTeamPlayers
scoreboard players reset @s[team=purpleTeam] pTeamPlayers 
scoreboard players reset @s[team=greenTeam] grTeamPlayers 
scoreboard players reset @s[team=aquaTeam] aTeamPlayers 
scoreboard players reset @s[team=redTeam] rTeamPlayers 
scoreboard players reset @s[team=yellowTeam] yTeamPlayers 
scoreboard players reset @s[team=blueTeam] blueTeamPlayers 
scoreboard players reset @s[team=blackTeam] blackTeamPlayers 
scoreboard players reset @s[team=cyanTeam] cyTeamPlayers 
scoreboard players reset @s[team=magentaTeam] mTeamPlayers
scoreboard players reset @s[team=silverTeam] sTeamPlayers 
scoreboard players reset @s[team=crimsonTeam] crTeamPlayers 
scoreboard players reset @s[team=cobaltTeam] coTeamPlayers 
scoreboard players reset @s[team=spectators] spectators 

#Leave Team
team leave @s 

