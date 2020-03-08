#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will show players how to play the map
#--------------------------------------

execute if score introTimer intro matches 0 run say MAP THINGIES!!! THIS IS INTRODUCTION SEQUENCE BABY





#Give Players ability to leave
execute if score introTimer intro matches 0 if score goldTeam enabledTeams matches 1 as @r[team=goldTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score purpleTeam enabledTeams matches 1 as @r[team=purpleTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score greenTeam enabledTeams matches 1 as @r[team=greenTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score aquaTeam enabledTeams matches 1 as @r[team=aquaTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score redTeam enabledTeams matches 1 as @r[team=redTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score yellowTeam enabledTeams matches 1 as @r[team=yellowTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score blueTeam enabledTeams matches 1 as @r[team=blueTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score blackTeam enabledTeams matches 1 as @r[team=blackTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score cyanTeam enabledTeams matches 1 as @r[team=cyanTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score magentaTeam enabledTeams matches 1 as @r[team=magentaTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score silverTeam enabledTeams matches 1 as @r[team=silverTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score crimsonTeam enabledTeams matches 1 as @r[team=crimsonTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score cobaltTeam enabledTeams matches 1 as @r[team=cobaltTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score ivyTeam enabledTeams matches 1 as @r[team=ivyTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick
execute if score introTimer intro matches 0 if score opalTeam enabledTeams matches 1 as @r[team=opalTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick

#Implement LP to allow players to use items
execute if score introTimer intro matches 0 run scoreboard players set lobbyProgress LP 4