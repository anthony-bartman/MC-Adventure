#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will run all main lobby functions before the beginning of the map
#--------------------------------------
#The /debug command is useful for measuring performance. Use /debug start to start the profiling, wait a while, then /debug stop to end.
#This produces a file in .minecraft\debug breaking down how long everything took to run. Kind of like the F3 pie-chart, but for the server rather than the client.

#-------
#Stage 0
#-------
#Leader Initialization
#Set Initial Leader
execute if score LP lobbySettings matches 0..2 unless entity @a[tag=leader,limit=1] at @e[type=minecraft:armor_stand,tag=leader,limit=1] as @a[distance=..2] run function lobby:leader/set
#Swap Leader
execute if score LP lobbySettings matches 0..3 at @e[type=minecraft:armor_stand,tag=swapLeader1,limit=1] as @a[distance=..2,tag=leader,limit=1] run function lobby:leader/swap
#Keep Settings book in inventory at all times
execute if score LP lobbySettings matches 0..1 unless entity @a[tag=leader,nbt={Inventory:[{id:"minecraft:written_book",Count:1b,tag:{Tags:["settingsBook"]}}]},limit=1] as @a[tag=leader,limit=1] run function lobby:settings/book/settings_book
execute if score LP lobbySettings matches 2..4 unless entity @a[tag=leader,nbt={Inventory:[{id:"minecraft:written_book",Count:1b,tag:{Tags:["settingsBook"]}}]},limit=1] as @a[tag=leader,limit=1] run function lobby:settings/book/get_ingame_book
execute if score LP lobbySettings matches 0..3 at @a[tag=leader,limit=1] run kill @e[type=item,distance=..3]

#------------
#Potion Effects in Lobby
execute if score LP lobbySettings matches 0.. at @e[type=minecraft:armor_stand,tag=mainLobby,limit=1] run effect give @a[distance=..100] minecraft:night_vision 2 10 true
execute if score LP lobbySettings matches 0.. at @e[type=minecraft:armor_stand,tag=mainLobby,limit=1] run effect give @a[distance=..100] minecraft:saturation 2 10 true
execute if score LP lobbySettings matches 0.. at @e[type=minecraft:armor_stand,tag=mainLobby,limit=1] run effect give @a[distance=..100] minecraft:regeneration 2 50 true
#Particles in Lobby
execute if score LP lobbySettings matches 0.. if score lockTeams lobbySettings matches 0 if score particles lobbySettings matches 1 run function lobby:particles
#Kits
execute if score LP lobbySettings matches 0..3 if score kitsEnabled lobbySettings matches 1 run function lobby:kits/main

#-------
#Stage 1
#-------
#Leader Book Triggered
execute if score LP lobbySettings matches 0.. as @a[tag=leader,scores={book=1..},limit=1] run function lobby:settings/book/main

#Player settings before joining map
execute if score LP lobbySettings matches 0..4 as @a[team=!spectators,tag=!player] run function lobby:settings/player
#Team Joining
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score goldTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=goldTeam,limit=1] as @a[distance=..2,team=!goldTeam] run function lobby:teams/gold/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score purpleTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=purpleTeam,limit=1] as @a[distance=..2,team=!purpleTeam] run function lobby:teams/purple/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score greenTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=greenTeam,limit=1] as @a[distance=..2,team=!greenTeam] run function lobby:teams/green/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score aquaTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=aquaTeam,limit=1] as @a[distance=..2,team=!aquaTeam] run function lobby:teams/aqua/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score redTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=redTeam,limit=1] as @a[distance=..2,team=!redTeam] run function lobby:teams/red/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score yellowTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=yellowTeam,limit=1] as @a[distance=..2,team=!yellowTeam] run function lobby:teams/yellow/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score blueTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=blueTeam,limit=1] as @a[distance=..2,team=!blueTeam] run function lobby:teams/blue/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score blackTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=blackTeam,limit=1] as @a[distance=..2,team=!blackTeam] run function lobby:teams/black/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score cyanTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=cyanTeam,limit=1] as @a[distance=..2,team=!cyanTeam] run function lobby:teams/cyan/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score magentaTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=magentaTeam,limit=1] as @a[distance=..2,team=!magentaTeam] run function lobby:teams/magenta/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score silverTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=silverTeam,limit=1] as @a[distance=..2,team=!silverTeam] run function lobby:teams/silver/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score crimsonTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=crimsonTeam,limit=1] as @a[distance=..2,team=!crimsonTeam] run function lobby:teams/crimson/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score cobaltTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=cobaltTeam,limit=1] as @a[distance=..2,team=!cobaltTeam] run function lobby:teams/cobalt/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score ivyTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=ivyTeam,limit=1] as @a[distance=..2,team=!ivyTeam] run function lobby:teams/ivy/join
execute if score LP lobbySettings matches 0..2 if score lockTeams lobbySettings matches 0 if score opalTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=opalTeam,limit=1] as @a[distance=..2,team=!opalTeam] run function lobby:teams/opal/join
execute if score LP lobbySettings matches 0..2 at @e[type=minecraft:armor_stand,tag=spectators,limit=1] as @a[distance=..2,team=!spectators] run function lobby:teams/spectators/join

#-------
#Stage 2
#-------
#Leader Starts Map, and populates the map
#Players Can Still Select Kits Here until they get teleported
execute if score LP lobbySettings matches 1 as @a[tag=leader,scores={intro=0..},limit=1] run function lobby:populate_map
execute if score LP lobbySettings matches 2 as @a[tag=leader,limit=1] run function lobby:intro/teleport

#-------
#Stage 3
#-------
#Introduction Sequence on how to pleay map
execute if score LP lobbySettings matches 3 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run function lobby:intro/instructions
#Players select when to teleport/Spectators are in spectator mode now...
execute if score LP lobbySettings matches 4 run function lobby:begin_map

