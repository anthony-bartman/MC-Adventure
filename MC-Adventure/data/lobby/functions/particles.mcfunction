#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will setup lobby particles for team armor stands 
#--------------------------------------


#Portal Particles around team armor stands
execute if score goldTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < goldTeam maxPlayers at @e[tag=goldTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score purpleTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < purpleTeam maxPlayers at @e[tag=purpleTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score greenTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < greenTeam maxPlayers at @e[tag=greenTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score aquaTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < aquaTeam maxPlayers at @e[tag=aquaTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score redTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < redTeam maxPlayers at @e[tag=redTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score yellowTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < yellowTeam maxPlayers at @e[tag=yellowTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score blueTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < blueTeam maxPlayers at @e[tag=blueTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score blackTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < blackTeam maxPlayers at @e[tag=blackTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score cyanTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < cyanTeam maxPlayers at @e[tag=cyanTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score magentaTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < magentaTeam maxPlayers at @e[tag=magentaTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score silverTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < silverTeam maxPlayers at @e[tag=silverTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score crimsonTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < crimsonTeam maxPlayers at @e[tag=crimsonTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force
execute if score cobaltTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < cobaltTeam maxPlayers at @e[tag=cobaltTeam,limit=1] run particle portal ~ ~ ~ 0 .8 0 .3 2 force

#Particle effects after players join the teams
# execute if score goldTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < goldTeam maxPlayers at @e[tag=goldTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score purpleTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < purpleTeam maxPlayers at @e[tag=purpleTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score greenTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < greenTeam maxPlayers at @e[tag=greenTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score aquaTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < aquaTeam maxPlayers at @e[tag=aquaTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score redTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < redTeam maxPlayers at @e[tag=redTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score yellowTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < yellowTeam maxPlayers at @e[tag=yellowTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score blueTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < blueTeam maxPlayers at @e[tag=blueTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score blackTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < blackTeam maxPlayers at @e[tag=blackTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score cyanTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < cyanTeam maxPlayers at @e[tag=cyanTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score magentaTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < magentaTeam maxPlayers at @e[tag=magentaTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score silverTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < silverTeam maxPlayers at @e[tag=silverTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score crimsonTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < crimsonTeam maxPlayers at @e[tag=crimsonTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
# execute if score cobaltTeam enabledTeams matches 1 if score Teammates gdTeamPlayers < cobaltTeam maxPlayers at @e[tag=cobaltTeam,limit=1] run particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
