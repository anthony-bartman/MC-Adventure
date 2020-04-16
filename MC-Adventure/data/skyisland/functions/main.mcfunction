#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will handle all of the functions regarding the skyislands
#--------------------------------------

#Handles when a player get's rid of their spawn point on accident
execute positioned 136 180 136 if entity @a[team=!,tag=player,distance=..3] run function skyisland:adv/skyisland_chunks

#RETHINK THIS!!!! ==============================
#execute at @a[team=!,scores={survivalOn=0}] run function skyisland:inventory
#RETHINK THIS!!!!================================

#Trigger command to help players get out of the a hole, or help with adventure
#DO SOME TESTING WITH MULITPLE PLAYERS ACCESSING THIS MENU!!!
execute as @a[team=!,tag=player,scores={help=1..},limit=3] run function skyisland:trigger/main


#If a Player falls offs island.... UPDATE TO MAKE IT TP_OCEAN ISLAND :) :) :)
#==================
#execute at @a[team=blackTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=blackTeam,scores={survivalOn=0}] run function skyisland:black/tp_safe
#execute at @a[team=magentaTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=magentaTeam,scores={survivalOn=0}] run function skyisland:magenta/tp_safe
#execute at @a[team=aquaTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=aquaTeam,scores={survivalOn=0}] run function skyisland:aqua/tp_safe
#execute at @a[team=redTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=redTeam,scores={survivalOn=0}] run function skyisland:red/tp_safe
#execute at @a[team=yellowTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=yellowTeam,scores={survivalOn=0}] run function skyisland:yellow/tp_safe
#execute at @a[team=blueTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=blueTeam,scores={survivalOn=0}] run function skyisland:blue/tp_safe
#execute at @a[team=greenTeam,scores={survivalOn=0}] as @a[y=0,dy=9,team=greenTeam,scores={survivalOn=0}] run function skyisland:green/tp_safe
#====================

#SKYISLAND
#---
#Teams Adventure
# ++ ADD A WAY FOR TEAMS TO EDIT HOW THEY WANT OTHER TEAMS TO GO TO THEIR ISLAND and what to do with them... EDIT THIS IN Help MENU?
execute if entity @e[tag=blackTeamCen,scores={mapProgress=0..31}] if entity @a[team=blackTeam] run function skyisland:teams/black/adventure


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

