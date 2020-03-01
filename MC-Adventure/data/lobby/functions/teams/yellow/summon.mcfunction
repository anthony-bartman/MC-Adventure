#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will enable the specific team
#--------------------------------------

execute at @e[tag=mainLobby,limit=1] run summon minecraft:armor_stand ~-30 ~1.5 ~5 {Tags:["yellowTeam"],CustomNameVisible:1b,CustomName:'{"text":"Yellow Team","color":"yellow","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=yellowTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["yellowTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
