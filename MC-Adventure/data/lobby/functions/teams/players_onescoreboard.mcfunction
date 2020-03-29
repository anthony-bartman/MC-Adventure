#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will change 'gdTeamPlayers' to one scoreboard instead of 15
#--------------------------------------

#Create new scoreboard for teammates after
scoreboard objectives add teamPlayers dummy {"text":"Players Left On Team","color":"white","bold":true}

#Transfer 'gdTeamPlayers' to one scoreboard
scoreboard players operation gdPlayersLeft teamPlayers = goldTeam maxPlayers
scoreboard players operation pPlayersLeft teamPlayers = purpleTeam maxPlayers
scoreboard players operation grPlayersLeft teamPlayers = greenTeam maxPlayers
scoreboard players operation aPlayersLeft teamPlayers = aquaTeam maxPlayers
scoreboard players operation rPlayersLeft teamPlayers = redTeam maxPlayers
scoreboard players operation yPlayersLeft teamPlayers = yellowTeam maxPlayers
scoreboard players operation bluePlayersLeft teamPlayers = blueTeam maxPlayers
scoreboard players operation blackPlayersLeft teamPlayers = blackTeam maxPlayers
scoreboard players operation cyPlayersLeft teamPlayers = cyanTeam maxPlayers
scoreboard players operation mPlayersLeft teamPlayers = magentaTeam maxPlayers
scoreboard players operation sPlayersLeft teamPlayers = silverTeam maxPlayers
scoreboard players operation crPlayersLeft teamPlayers = crimsonTeam maxPlayers
scoreboard players operation coPlayersLeft teamPlayers = cobaltTeam maxPlayers
scoreboard players operation iPlayersLeft teamPlayers = ivyTeam maxPlayers
scoreboard players operation oPlayersLeft teamPlayers = opalTeam maxPlayers
scoreboard players operation Total_Spectators teamPlayers = Total_Spectators spectators

scoreboard players operation gdPlayersLeft teamPlayers -= Teammates gdTeamPlayers
scoreboard players operation pPlayersLeft teamPlayers -= Teammates pTeamPlayers
scoreboard players operation grPlayersLeft teamPlayers -= Teammates grTeamPlayers
scoreboard players operation aPlayersLeft teamPlayers -= Teammates aTeamPlayers
scoreboard players operation rPlayersLeft teamPlayers -= Teammates rTeamPlayers
scoreboard players operation yPlayersLeft teamPlayers -= Teammates yTeamPlayers
scoreboard players operation bluePlayersLeft teamPlayers -= Teammates blueTeamPlayers
scoreboard players operation blackPlayersLeft teamPlayers -= Teammates blackTeamPlayers
scoreboard players operation cyPlayersLeft teamPlayers -= Teammates cyTeamPlayers
scoreboard players operation mPlayersLeft teamPlayers -= Teammates mTeamPlayers
scoreboard players operation sPlayersLeft teamPlayers -= Teammates sTeamPlayers
scoreboard players operation crPlayersLeft teamPlayers -= Teammates crTeamPlayers
scoreboard players operation coPlayersLeft teamPlayers -= Teammates coTeamPlayers
scoreboard players operation iPlayersLeft teamPlayers -= Teammates iTeamPlayers
scoreboard players operation oPlayersLeft teamPlayers -= Teammates oTeamPlayers

#Color Code
team join goldTeam gdPlayersLeft
team join purpleTeam pPlayersLeft
team join greenTeam grPlayersLeft
team join aquaTeam aPlayersLeft
team join redTeam rPlayersLeft
team join yellowTeam yPlayersLeft
team join blueTeam bluePlayersLeft
team join blackTeam blackPlayersLeft
team join cyanTeam cyPlayersLeft
team join magentaTeam mPlayersLeft
team join silverTeam sPlayersLeft
team join crimsonTeam crPlayersLeft
team join cobaltTeam coPlayersLeft
team join ivyTeam iPlayersLeft
team join opalTeam oPlayersLeft

#Remove other unneccsary scoreboards 
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
scoreboard objectives remove iTeamPlayers
scoreboard objectives remove oTeamPlayers
scoreboard objectives remove spectators
