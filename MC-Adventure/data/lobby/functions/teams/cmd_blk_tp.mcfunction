#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will setup the command blocks below armor stands in lobby sequence
#--------------------------------------

#Tp Command Blocks
execute at @e[type=minecraft:armor_stand,tag=goldIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=goldIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=goldTeam,tag=player,limit=1] run function lobby:teams/gold/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=purpleIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=purpleIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=purpleTeam,tag=player,limit=1] run function lobby:teams/purple/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=greenIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=greenIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=greenTeam,tag=player,limit=1] run function lobby:teams/green/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=aquaIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=aquaIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=aquaTeam,tag=player,limit=1] run function lobby:teams/aqua/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=redIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=redIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=redTeam,tag=player,limit=1] run function lobby:teams/red/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=yellowIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=yellowIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=yellowTeam,tag=player,limit=1] run function lobby:teams/yellow/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=blueIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=blueIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=blueTeam,tag=player,limit=1] run function lobby:teams/blue/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=blackIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=blackIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=blackTeam,tag=player,limit=1] run function lobby:teams/black/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=cyanIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=cyanIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=cyanTeam,tag=player,limit=1] run function lobby:teams/cyan/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=magentaIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=magentaIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=magentaTeam,tag=player,limit=1] run function lobby:teams/magenta/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=silverIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=silverIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=silverTeam,tag=player,limit=1] run function lobby:teams/silver/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=crimsonIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=crimsonIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=crimsonTeam,tag=player,limit=1] run function lobby:teams/crimson/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=cobaltIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=cobaltIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=cobaltTeam,tag=player,limit=1] run function lobby:teams/cobalt/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=ivyIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=ivyIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=ivyTeam,tag=player,limit=1] run function lobby:teams/ivy/map_tp"} replace
execute at @e[type=minecraft:armor_stand,tag=opalIntro,limit=1] run setblock ~ ~-1.5 ~ minecraft:acacia_button[face=floor] replace
execute at @e[type=minecraft:armor_stand,tag=opalIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:command_block[facing=down]{Command:"/execute as @p[team=opalTeam,tag=player,limit=1] run function lobby:teams/opal/map_tp"} replace


