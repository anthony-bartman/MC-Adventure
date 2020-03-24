#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport all players to their respective areas after introduction
#--------------------------------------

#If teams right click begin... teleport to their starting map area
execute if score goldTeam enabledTeams matches 1 if entity @a[team=goldTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=goldTeam,tag=player] run function lobby:teams/gold/map_tp
execute if score purpleTeam enabledTeams matches 1 if entity @a[team=purpleTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=purpleTeam,tag=player] run function lobby:teams/purple/map_tp
execute if score greenTeam enabledTeams matches 1 if entity @a[team=greenTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=greenTeam,tag=player] run function lobby:teams/green/map_tp
execute if score aquaTeam enabledTeams matches 1 if entity @a[team=aquaTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=aquaTeam,tag=player] run function lobby:teams/aqua/map_tp
execute if score redTeam enabledTeams matches 1 if entity @a[team=redTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=redTeam,tag=player] run function lobby:teams/red/map_tp
execute if score yellowTeam enabledTeams matches 1 if entity @a[team=yellowTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=yellowTeam,tag=player] run function lobby:teams/yellow/map_tp
execute if score blueTeam enabledTeams matches 1 if entity @a[team=blueTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=blueTeam,tag=player] run function lobby:teams/blue/map_tp
execute if score blackTeam enabledTeams matches 1 if entity @a[team=blackTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=blackTeam,tag=player] run function lobby:teams/black/map_tp
execute if score cyanTeam enabledTeams matches 1 if entity @a[team=cyanTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=cyanTeam,tag=player] run function lobby:teams/cyan/map_tp
execute if score magentaTeam enabledTeams matches 1 if entity @a[team=magentaTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=magentaTeam,tag=player] run function lobby:teams/magenta/map_tp
execute if score crimsonTeam enabledTeams matches 1 if entity @a[team=crimsonTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=crimsonTeam,tag=player] run function lobby:teams/crimson/map_tp
execute if score cobaltTeam enabledTeams matches 1 if entity @a[team=cobaltTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=cobaltTeam,tag=player] run function lobby:teams/cobalt/map_tp
execute if score ivyTeam enabledTeams matches 1 if entity @a[team=ivyTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=ivyTeam,tag=player] run function lobby:teams/ivy/map_tp
execute if score opalTeam enabledTeams matches 1 if entity @a[team=opalTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=opalTeam,tag=player] run function lobby:teams/opal/map_tp

#Unlock Teams
execute if score Total_Players intro matches 0 run function lobby:settings/book/unlock_team
#Initiate map settings
execute if score Total_Players intro matches 0 run function lobby:settings/map

#Allow Players to join server after initial intro sequence
execute if score Total_Players intro matches 0 run scoreboard players set lobbyProgress LP 5
