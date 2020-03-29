#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will setup lobby particles for team armor stands 
#--------------------------------------


#Portal Particles around team armor stands
execute if score LP lobbySettings matches 0..4 if score goldTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < goldTeam maxPlayers at @e[tag=goldTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score purpleTeam enabledTeams matches 1 if score Teammates pTeamPlayers < purpleTeam maxPlayers at @e[tag=purpleTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score greenTeam enabledTeams matches 1 if score Teammates grTeamPlayers < greenTeam maxPlayers at @e[tag=greenTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score aquaTeam enabledTeams matches 1 if score Teammates aTeamPlayers < aquaTeam maxPlayers at @e[tag=aquaTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score redTeam enabledTeams matches 1 if score Teammates rTeamPlayers < redTeam maxPlayers at @e[tag=redTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score yellowTeam enabledTeams matches 1 if score Teammates yTeamPlayers < yellowTeam maxPlayers at @e[tag=yellowTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score blueTeam enabledTeams matches 1 if score Teammates blueTeamPlayers < blueTeam maxPlayers at @e[tag=blueTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score blackTeam enabledTeams matches 1 if score Teammates blackTeamPlayers < blackTeam maxPlayers at @e[tag=blackTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score cyanTeam enabledTeams matches 1 if score Teammates cyTeamPlayers < cyanTeam maxPlayers at @e[tag=cyanTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score magentaTeam enabledTeams matches 1 if score Teammates mTeamPlayers < magentaTeam maxPlayers at @e[tag=magentaTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score silverTeam enabledTeams matches 1 if score Teammates sTeamPlayers < silverTeam maxPlayers at @e[tag=silverTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score crimsonTeam enabledTeams matches 1 if score Teammates crTeamPlayers < crimsonTeam maxPlayers at @e[tag=crimsonTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score cobaltTeam enabledTeams matches 1 if score Teammates coTeamPlayers < cobaltTeam maxPlayers at @e[tag=cobaltTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score ivyTeam enabledTeams matches 1 if score Teammates iTeamPlayers < ivyTeam maxPlayers at @e[tag=ivyTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 0..4 if score opalTeam enabledTeams matches 1 if score Teammates oTeamPlayers < opalTeam maxPlayers at @e[tag=opalTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force

#Particle effects after players join the teams
execute if score LP lobbySettings matches 5 if score goldTeam enabledTeams matches 1 if score gdPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=goldTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score purpleTeam enabledTeams matches 1 if score pPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=purpleTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score greenTeam enabledTeams matches 1 if score grPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=greenTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score aquaTeam enabledTeams matches 1 if score aPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=aquaTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score redTeam enabledTeams matches 1 if score rPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=redTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score yellowTeam enabledTeams matches 1 if score yPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=yellowTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score blueTeam enabledTeams matches 1 if score bluePlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=blueTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score blackTeam enabledTeams matches 1 if score blackPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=blackTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score cyanTeam enabledTeams matches 1 if score cyPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=cyanTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score magentaTeam enabledTeams matches 1 if score mPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=magentaTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score silverTeam enabledTeams matches 1 if score sPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=silverTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score crimsonTeam enabledTeams matches 1 if score crPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=crimsonTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score cobaltTeam enabledTeams matches 1 if score coPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=cobaltTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score ivyTeam enabledTeams matches 1 if score iPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=ivyTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score LP lobbySettings matches 5 if score opalTeam enabledTeams matches 1 if score oPlayersLeft teamPlayers >= Min_Team_Players maxPlayers at @e[tag=opalTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
