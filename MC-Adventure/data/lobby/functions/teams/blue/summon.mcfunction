#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will enable the specific team
#--------------------------------------

execute at @e[tag=mainLobby,limit=1] run summon minecraft:armor_stand ~15 ~1.5 ~5 {Tags:["blueTeam"],CustomNameVisible:1b,CustomName:'{"text":"Blue Team","color":"blue","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=blueTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["blueTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
