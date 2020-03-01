#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will enable the specific team
#--------------------------------------

execute at @e[tag=mainLobby,limit=1] run summon minecraft:armor_stand ~10 ~1.5 ~5 {Tags:["cobaltTeam"],CustomNameVisible:1b,CustomName:'{"text":"Cobalt Team","color":"dark_blue","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=cobaltTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["cobaltTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
