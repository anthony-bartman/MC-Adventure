#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will enable the specific team
#--------------------------------------

execute at @e[tag=mainLobby,limit=1] run summon minecraft:armor_stand ~ ~1.5 ~5 {Tags:["blackTeam"],CustomNameVisible:1b,CustomName:'{"text":"Black Team","color":"black","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score lockTeams lobbySettings matches 0 at @e[tag=blackTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["blackTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score lockTeams lobbySettings matches 1 at @e[tag=blackTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["blackLock"],CustomNameVisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}",NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}