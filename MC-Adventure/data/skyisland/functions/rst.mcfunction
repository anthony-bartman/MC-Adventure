#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will reset current skyisland to nothing and remove scoreboards
#--------------------------------------

#Remove Scoreboards Used
function skyisland:setup/remove_scoreboards

#Gets rid of all loot on this island
execute at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] run function skyisland:teams/teams/black/loot/reset
execute at @e[type=minecraft:armor_stand,tag=magentaTeamCen,limit=1] run function skyisland:teams/magenta/loot/reset
execute at @e[type=minecraft:armor_stand,tag=aquaTeamCen,limit=1] run function skyisland:teams/aqua/loot/reset
execute at @e[type=minecraft:armor_stand,tag=redTeamCen,limit=1] run function skyisland:teams/red/loot/reset
execute at @e[type=minecraft:armor_stand,tag=yellowTeamCen,limit=1] run function skyisland:teams/yellow/loot/reset
execute at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] run function skyisland:teams/blue/loot/reset
execute at @e[type=minecraft:armor_stand,tag=blueTeamCen,limit=1] run function skyisland:teams/green/loot/reset
execute at @e[type=minecraft:armor_stand,tag=goldTeamCen,limit=1] run function skyisland:teams/gold/loot/reset
execute at @e[type=minecraft:armor_stand,tag=purpleTeamCen,limit=1] run function skyisland:teams/purple/loot/reset
execute at @e[type=minecraft:armor_stand,tag=cyanTeamCen,limit=1] run function skyisland:teams/cyan/loot/reset
execute at @e[type=minecraft:armor_stand,tag=crimsonTeamCen,limit=1] run function skyisland:teams/crimson/loot/reset
execute at @e[type=minecraft:armor_stand,tag=cobaltTeamCen,limit=1] run function skyisland:teams/cobalt/loot/reset
execute at @e[type=minecraft:armor_stand,tag=ivyTeamCen,limit=1] run function skyisland:teams/ivy/loot/reset

#Kills mainIsland Teleport Pad
execute positioned -211 166 38 run kill @e[type=minecraft:armor_stand,distance=..3]


#Kills all entities with a Tag on them
kill @e[tag=!,type=!player,distance=..150]
#Tp back to lobby
execute as @s run function lobby:lobby_spawn