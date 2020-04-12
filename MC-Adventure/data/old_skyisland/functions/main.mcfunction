#This file will iterate through all skyisland functions

#Handles when a player get's rid of their spawn point on accident
function skyisland:skyisland_chunks
execute at @a run function skyisland:inventory
#Outside of each teams island
execute at @a if entity @a[y=0,dy=9,team=!] as @a[y=0,dy=9,team=!] run function skyisland:tp_ocean
#Trigger command to help players get out of the a hole
scoreboard players enable @a[team=!] help
execute as @a[scores={help=1..},limit=1] run function skyisland:trigger/trigger_main


#Teams Adventure
execute if entity @e[tag=blackTeamCen,scores={mapProgress=..31}] if entity @a[team=blackTeam] run function skyisland:black/adventure
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=..31}] if entity @a[team=magentaTeam] run function skyisland:magenta/adventure
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=..31}] if entity @a[team=aquaTeam] run function skyisland:aqua/adventure
execute if entity @e[tag=redTeamCen,scores={mapProgress=..31}] if entity @a[team=redTeam] run function skyisland:red/adventure
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=..31}] if entity @a[team=yellowTeam] run function skyisland:yellow/adventure
execute if entity @e[tag=blueTeamCen,scores={mapProgress=..31}] if entity @a[team=blueTeam] run function skyisland:blue/adventure
execute if entity @e[tag=greenTeamCen,scores={mapProgress=..31}] if entity @a[team=greenTeam] run function skyisland:green/adventure

#Teams Teleportation
execute if entity @e[tag=blackTeamCen,scores={mapProgress=32}] if entity @a[team=blackTeam] run function skyisland:black/teleport
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=32}] if entity @a[team=magentaTeam] run function skyisland:magenta/teleport
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=32}] if entity @a[team=aquaTeam] run function skyisland:aqua/teleport
execute if entity @e[tag=redTeamCen,scores={mapProgress=32}] if entity @a[team=redTeam] run function skyisland:red/teleport
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=32}] if entity @a[team=yellowTeam] run function skyisland:yellow/teleport
execute if entity @e[tag=blueTeamCen,scores={mapProgress=32}] if entity @a[team=blueTeam] run function skyisland:blue/teleport
execute if entity @e[tag=greenTeamCen,scores={mapProgress=32}] if entity @a[team=greenTeam] run function skyisland:green/teleport

