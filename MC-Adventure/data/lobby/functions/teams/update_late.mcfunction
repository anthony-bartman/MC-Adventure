#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will join update statisitcs of teams when a player joins or leaves a team after initial start
#--------------------------------------

#Add 1 from 'Teammates' score of teamPlayers
execute if entity @s[team=goldTeam] run scoreboard players add gdPlayersLeft teamPlayers 1
execute if entity @s[team=purpleTeam] run scoreboard players add pPlayersLeft teamPlayers 1
execute if entity @s[team=greenTeam] run scoreboard players add grPlayersLeft teamPlayers 1
execute if entity @s[team=aquaTeam] run scoreboard players add aPlayersLeft teamPlayers 1
execute if entity @s[team=redTeam] run scoreboard players add rPlayersLeft teamPlayers 1
execute if entity @s[team=yellowTeam] run scoreboard players add yPlayersLeft teamPlayers 1
execute if entity @s[team=blueTeam] run scoreboard players add bluePlayersLeft teamPlayers 1
execute if entity @s[team=blackTeam] run scoreboard players add blackPlayersLeft teamPlayers 1
execute if entity @s[team=cyanTeam] run scoreboard players add cyPlayersLeft teamPlayers 1
execute if entity @s[team=magentaTeam] run scoreboard players add mPlayersLeft teamPlayers 1
execute if entity @s[team=silverTeam] run scoreboard players add sPlayersLeft teamPlayers 1
execute if entity @s[team=crimsonTeam] run scoreboard players add crPlayersLeft teamPlayers 1
execute if entity @s[team=cobaltTeam] run scoreboard players add coPlayersLeft teamPlayers 1
execute if entity @s[team=ivyTeam] run scoreboard players add iPlayersLeft teamPlayers 1
execute if entity @s[team=opalTeam] run scoreboard players add oPlayersLeft teamPlayers 1
execute if entity @s[team=spectators] run scoreboard players add Total_Spectators teamPlayers 1

#Leave Team
team leave @s 

