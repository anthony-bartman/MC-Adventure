#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will enable the specific team
#--------------------------------------

execute at @e[tag=mainLobby,limit=1] run summon minecraft:armor_stand ~5 ~1.5 ~5 {Tags:["crimsonTeam"],CustomNameVisible:1b,CustomName:'{"text":"Crimson Team","color":"dark_red","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score lockTeams lobbySettings matches 0 at @e[tag=crimsonTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["crimsonTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score lockTeams lobbySettings matches 1 at @e[tag=crimsonTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["crimsonLock"],CustomNameVisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}",NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}