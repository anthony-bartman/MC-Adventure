#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will run all main lobby functions before the beginning of the map
#--------------------------------------
#The /debug command is useful for measuring performance. Use /debug start to start the profiling, wait a while, then /debug stop to end.
#This produces a file in .minecraft\debug breaking down how long everything took to run. Kind of like the F3 pie-chart, but for the server rather than the client.

#Add the main settings book
#Add a way to change max players from book


#-------
#Step 0
#-------
#Leader Initialization
#Set Initial Leader
execute unless entity @a[tag=leader,limit=1] at @e[type=minecraft:armor_stand,tag=leader,limit=1] as @a[distance=..2] run function lobby:set_leader
#Swap Leader
execute at @e[type=minecraft:armor_stand,tag=swapLeader1,limit=1] as @a[distance=..2,tag=leader,limit=1] run function lobby:swap_leader
#Keep Settings book in inventory at all times
execute unless entity @a[tag=leader,nbt={Inventory:[{id:"minecraft:written_book",Count:1b,tag:{Tags:["settingsBook"]}}]},limit=1] as @a[tag=leader,limit=1] run function lobby:settings/book/settings_book
execute at @a[tag=leader,limit=1] run kill @e[type=item,distance=..3]

#Potion Effects in Lobby
execute if score lobbyProgress LP matches 0.. at @e[tag=mainLobby,limit=1] run effect give @a[distance=..100] minecraft:night_vision 10 10 true
execute if score lobbyProgress LP matches 0.. at @e[tag=mainLobby,limit=1] run effect give @a[distance=..100] minecraft:saturation 10 10 true
execute if score lobbyProgress LP matches 0.. at @e[tag=mainLobby,limit=1] run effect give @a[distance=..100] minecraft:regeneration 10 50 true
#Particles in Lobby
execute if score lobbyProgress LP matches 0.. if score lockTeams lobbySettings matches 0 if score particles lobbySettings matches 1 run function lobby:particles

#Kit Selection
execute if score lobbyProgress LP matches 0..2 as @a[team=!,scores={chooseKit=1}] run function lobby:kits/select_knight
execute if score lobbyProgress LP matches 0..2 as @a[team=!,scores={chooseKit=3}] run function lobby:kits/select_archer
execute if score lobbyProgress LP matches 0..2 as @a[team=!,scores={chooseKit=5}] run function lobby:kits/select_heavy
execute if score lobbyProgress LP matches 0..2 as @a[team=!,scores={chooseKit=7}] run function lobby:kits/thing
execute if score lobbyProgress LP matches 0..2 as @a[team=!,scores={chooseKit=9}] run function lobby:kits/thing1
#Makes sure players cannot destroy their kit books and items
execute unless entity @a[team=!,scores={chooseKit=0..},nbt={Inventory:[{id:"minecraft:written_book",Count:1b,tag:{Tags:["kitSelection"]}}]}] as @a[team=!,scores={chooseKit=0..}] run function lobby:kits/selection_book
execute unless entity @a[team=!,scores={chooseKit=2},nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:golden_helmet"},{Slot:102b,Count:1b,id:"minecraft:golden_chestplate"},{Slot:101b,Count:1b,id:"minecraft:golden_leggings"},{Slot:100b,Count:1b,id:"minecraft:golden_boots"},{Slot:7b,Count:1b,id:"minecraft:stone_sword"}]}] as @a[team=!,scores={chooseKit=2}] run function lobby:kits/get_knight
execute unless entity @a[team=!,scores={chooseKit=4},nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:leather_helmet"},{Slot:102b,Count:1b,id:"minecraft:leather_chestplate"},{Slot:101b,Count:1b,id:"minecraft:leather_leggings"},{Slot:100b,Count:1b,id:"minecraft:leather_boots"},{Slot:7b,Count:1b,id:"minecraft:bow"}]}] as @a[team=!,scores={chooseKit=4}] run function lobby:kits/get_archer
execute unless entity @a[team=!,scores={chooseKit=6},nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:iron_helmet"},{Slot:102b,Count:1b,id:"minecraft:iron_chestplate"},{Slot:101b,Count:1b,id:"minecraft:iron_leggings"},{Slot:100b,Count:1b,id:"minecraft:iron_boots"},{Slot:7b,Count:1b,id:"minecraft:wooden_sword"}]}] as @a[team=!,scores={chooseKit=6}] run function lobby:kits/get_heavy
execute at @a[team=!,scores={chooseKit=0..},tag=!leader] run kill @e[type=item,distance=..3]

#-------
#Stage 1
#-------
#Leader Book Triggered
execute if score lobbyProgress LP matches 0..1 run scoreboard players enable @a[tag=leader,limit=1] book
execute if score lobbyProgress LP matches 0..1 as @a[tag=leader,limit=1] run function lobby:settings/book/main

#Player settings before joining map
execute as @a[team=,tag=!leader,tag=!player] run function lobby:settings/player
#Team Joining
execute if score lobbyProgress LP matches 0..1 if score goldTeam enabledTeams matches 1 at @e[tag=goldTeam,limit=1] as @a[distance=..2,team=!goldTeam] run function lobby:teams/gold/join
execute if score lobbyProgress LP matches 0..1 if score purpleTeam enabledTeams matches 1 at @e[tag=purpleTeam,limit=1] as @a[distance=..2,team=!purpleTeam] run function lobby:teams/purple/join
execute if score lobbyProgress LP matches 0..1 if score greenTeam enabledTeams matches 1 at @e[tag=greenTeam,limit=1] as @a[distance=..2,team=!greenTeam] run function lobby:teams/green/join
execute if score lobbyProgress LP matches 0..1 if score aquaTeam enabledTeams matches 1 at @e[tag=aquaTeam,limit=1] as @a[distance=..2,team=!aquaTeam] run function lobby:teams/aqua/join
execute if score lobbyProgress LP matches 0..1 if score redTeam enabledTeams matches 1 at @e[tag=redTeam,limit=1] as @a[distance=..2,team=!redTeam] run function lobby:teams/red/join
execute if score lobbyProgress LP matches 0..1 if score yellowTeam enabledTeams matches 1 at @e[tag=yellowTeam,limit=1] as @a[distance=..2,team=!yellowTeam] run function lobby:teams/yellow/join
execute if score lobbyProgress LP matches 0..1 if score blueTeam enabledTeams matches 1 at @e[tag=blueTeam,limit=1] as @a[distance=..2,team=!blueTeam] run function lobby:teams/blue/join
execute if score lobbyProgress LP matches 0..1 if score blackTeam enabledTeams matches 1 at @e[tag=blackTeam,limit=1] as @a[distance=..2,team=!blackTeam] run function lobby:teams/black/join
execute if score lobbyProgress LP matches 0..1 if score cyanTeam enabledTeams matches 1 at @e[tag=cyanTeam,limit=1] as @a[distance=..2,team=!cyanTeam] run function lobby:teams/cyan/join
execute if score lobbyProgress LP matches 0..1 if score magentaTeam enabledTeams matches 1 at @e[tag=magentaTeam,limit=1] as @a[distance=..2,team=!magentaTeam] run function lobby:teams/magenta/join
execute if score lobbyProgress LP matches 0..1 if score silverTeam enabledTeams matches 1 at @e[tag=silverTeam,limit=1] as @a[distance=..2,team=!silverTeam] run function lobby:teams/silver/join
execute if score lobbyProgress LP matches 0..1 if score crimsonTeam enabledTeams matches 1 at @e[tag=crimsonTeam,limit=1] as @a[distance=..2,team=!crimsonTeam] run function lobby:teams/crimson/join
execute if score lobbyProgress LP matches 0..1 if score cobaltTeam enabledTeams matches 1 at @e[tag=cobaltTeam,limit=1] as @a[distance=..2,team=!cobaltTeam] run function lobby:teams/cobalt/join
execute if score lobbyProgress LP matches 0..1 at @e[tag=spectators,limit=1] as @a[distance=..2,team=!spectators] run function lobby:teams/spectators/join


#-------
#Stage 2
#-------
#Leader Starts Map, and populates the map



#-------
#Stage 3a
#-------
#Introduction Sequence on how to play map


#Players select when to teleport



#-------
#Stage 3b
#-------
#Rejoin available teams after initial Sequence



