#This file will iterate through all skyisland functions

#Handles when a player get's rid of their spawn point on accident
function skyisland:skyisland_chunks
execute at @a[team=!,scores={survivalOn=0}] run function skyisland:inventory
#Trigger command to help players get out of the a hole, or help with adventure
scoreboard players enable @a[team=!,scores={survivalOn=0}] help
execute as @a[scores={help=1..},limit=1] run function skyisland:trigger/trigger_main

#If a Player falls offs island
execute at @a[team=blackTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=blackTeam,scores={survivalOn=0}] run function skyisland:black/tp_safe
execute at @a[team=magentaTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=magentaTeam,scores={survivalOn=0}] run function skyisland:magenta/tp_safe
execute at @a[team=aquaTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=aquaTeam,scores={survivalOn=0}] run function skyisland:aqua/tp_safe
execute at @a[team=redTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=redTeam,scores={survivalOn=0}] run function skyisland:red/tp_safe
execute at @a[team=yellowTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=yellowTeam,scores={survivalOn=0}] run function skyisland:yellow/tp_safe
execute at @a[team=blueTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=blueTeam,scores={survivalOn=0}] run function skyisland:blue/tp_safe
execute at @a[team=greenTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=greenTeam,scores={survivalOn=0}] run function skyisland:green/tp_safe

#SKYISLAND
#---
#Teams Adventure
execute if entity @e[tag=blackTeamCen,scores={mapProgress=0..31}] if entity @a[team=blackTeam] run function skyisland:black/adventure
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=0..31}] if entity @a[team=magentaTeam] run function skyisland:magenta/adventure
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=0..31}] if entity @a[team=aquaTeam] run function skyisland:aqua/adventure
execute if entity @e[tag=redTeamCen,scores={mapProgress=0..31}] if entity @a[team=redTeam] run function skyisland:red/adventure
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=0..31}] if entity @a[team=yellowTeam] run function skyisland:yellow/adventure
execute if entity @e[tag=blueTeamCen,scores={mapProgress=0..31}] if entity @a[team=blueTeam] run function skyisland:blue/adventure
execute if entity @e[tag=greenTeamCen,scores={mapProgress=0..31}] if entity @a[team=greenTeam] run function skyisland:green/adventure

#Teams Teleportation
execute if entity @e[tag=blackTeamCen,scores={mapProgress=32}] if entity @a[team=blackTeam] run function skyisland:black/teleport
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=32}] if entity @a[team=magentaTeam] run function skyisland:magenta/teleport
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=32}] if entity @a[team=aquaTeam] run function skyisland:aqua/teleport
execute if entity @e[tag=redTeamCen,scores={mapProgress=32}] if entity @a[team=redTeam] run function skyisland:red/teleport
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=32}] if entity @a[team=yellowTeam] run function skyisland:yellow/teleport
execute if entity @e[tag=blueTeamCen,scores={mapProgress=32}] if entity @a[team=blueTeam] run function skyisland:blue/teleport
execute if entity @e[tag=greenTeamCen,scores={mapProgress=32}] if entity @a[team=greenTeam] run function skyisland:green/teleport

