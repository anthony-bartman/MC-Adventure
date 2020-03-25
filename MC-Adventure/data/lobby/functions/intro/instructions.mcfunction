#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will show players how to play the map
#--------------------------------------

execute if score introTimer intro matches 0 run say MAP THINGIES!!! THIS IS INTRODUCTION SEQUENCE BABY


#Clear Inventories to begin map
execute if score introTimer intro matches 0 run clear @a

#Give Players ability to leave to skyisland
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
#Set Spectators to Spectator Mode
execute if score introTimer intro matches 0 run gamemode spectator @a[team=spectators]

#Calculate total number of players needed to teleport still that are not spectators
execute if score introTimer intro matches 0 run function lobby:intro/get_totalplayers
execute if score introTimer intro matches 0 run scoreboard players operation Total_Players intro -= Total_Spectators spectators

#Tell Players to right-click item in inventory to go!
title @a[team=!spectators] subtitle ["",{"text":"To Begin This "},{"text":"Map's ","color":"aqua","bold":true},{"text":"Adventure!"}]
title @a[team=!spectators] title ["",{"text":"Click The Item ","bold":true,"color":"white"}]
#Tell Spectators 
title @a[team=spectators] subtitle ["",{"text":"To Begin "},{"text":"Spectating ","color":"yellow","bold":true},{"text":"Teams!"}]
title @a[team=spectators] title ["",{"text":"Middle Click Mouse ","bold":true,"color":"white"}]

#Implement LP to allow players to use items
execute if score introTimer intro matches 0 run scoreboard players set lobbyProgress LP 4