#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport all players to their respective areas after introduction
#--------------------------------------

#---------
#Keep Right Clickable Item to begin map in the player's inventory, to go from intro to spawn
execute if score goldTeam enabledTeams matches 1 unless entity @a[team=goldTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=goldTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score purpleTeam enabledTeams matches 1 unless entity @a[team=purpleTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=purpleTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score greenTeam enabledTeams matches 1 unless entity @a[team=greenTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=greenTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score aquaTeam enabledTeams matches 1 unless entity @a[team=aquaTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=aquaTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score redTeam enabledTeams matches 1 unless entity @a[team=redTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=redTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score yellowTeam enabledTeams matches 1 unless entity @a[team=yellowTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=yellowTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score blueTeam enabledTeams matches 1 unless entity @a[team=blueTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=blueTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score blackTeam enabledTeams matches 1 unless entity @a[team=blackTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=blackTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score cyanTeam enabledTeams matches 1 unless entity @a[team=cyanTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=cyanTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score magentaTeam enabledTeams matches 1 unless entity @a[team=magentaTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=magentaTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score silverTeam enabledTeams matches 1 unless entity @a[team=silverTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=silverTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score crimsonTeam enabledTeams matches 1 unless entity @a[team=crimsonTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=crimsonTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score cobaltTeam enabledTeams matches 1 unless entity @a[team=cobaltTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=cobaltTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score ivyTeam enabledTeams matches 1 unless entity @a[team=ivyTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=ivyTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
execute if score opalTeam enabledTeams matches 1 unless entity @a[team=opalTeam,tag=player,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{}}]},limit=1] as @r[team=opalTeam,tag=player,limit=1] run function lobby:intro/get_beginrclick 
#Kills the item if they throw it on the ground
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] at @a[team=!,tag=player,distance=..50] run kill @e[type=item,distance=..3]

#----------
#If teams right click begin... teleport to their starting map area
execute if score goldTeam enabledTeams matches 1 if entity @a[team=goldTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=goldTeam,tag=player] run function lobby:teams/gold/map_tp
execute if score purpleTeam enabledTeams matches 1 if entity @a[team=purpleTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=purpleTeam,tag=player] run function lobby:teams/purple/map_tp
execute if score greenTeam enabledTeams matches 1 if entity @a[team=greenTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=greenTeam,tag=player] run function lobby:teams/green/map_tp
execute if score aquaTeam enabledTeams matches 1 if entity @a[team=aquaTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=aquaTeam,tag=player] run function lobby:teams/aqua/map_tp
execute if score redTeam enabledTeams matches 1 if entity @a[team=redTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=redTeam,tag=player] run function lobby:teams/red/map_tp
execute if score yellowTeam enabledTeams matches 1 if entity @a[team=yellowTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=yellowTeam,tag=player] run function lobby:teams/yellow/map_tp
execute if score blueTeam enabledTeams matches 1 if entity @a[team=blueTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=blueTeam,tag=player] run function lobby:teams/blue/map_tp
execute if score blackTeam enabledTeams matches 1 if entity @a[team=blackTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=blackTeam,tag=player] run function lobby:teams/black/map_tp
execute if score cyanTeam enabledTeams matches 1 if entity @a[team=cyanTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=cyanTeam,tag=player] run function lobby:teams/cyan/map_tp
execute if score magentaTeam enabledTeams matches 1 if entity @a[team=magentaTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=magentaTeam,tag=player] run function lobby:teams/magenta/map_tp
execute if score silverTeam enabledTeams matches 1 if entity @a[team=silverTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=silverTeam,tag=player] run function lobby:teams/silver/map_tp
execute if score crimsonTeam enabledTeams matches 1 if entity @a[team=crimsonTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=crimsonTeam,tag=player] run function lobby:teams/crimson/map_tp
execute if score cobaltTeam enabledTeams matches 1 if entity @a[team=cobaltTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=cobaltTeam,tag=player] run function lobby:teams/cobalt/map_tp
execute if score ivyTeam enabledTeams matches 1 if entity @a[team=ivyTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=ivyTeam,tag=player] run function lobby:teams/ivy/map_tp
execute if score opalTeam enabledTeams matches 1 if entity @a[team=opalTeam,scores={introBeginRClick=1..},tag=player,limit=1] as @a[team=opalTeam,tag=player] run function lobby:teams/opal/map_tp

#-------------
#== LOBBY RELATED ==
#-------------
#After all players click item...
#Unlock Teams
execute if score Total_Players intro matches ..0 run function lobby:settings/book/unlock_team
#Initiate map settings
execute if score Total_Players intro matches ..0 run function lobby:settings/map
#Enables team friendly fire
execute if score Total_Players intro matches ..0 run function lobby:settings/team_enableff
#Spawn in commandBlock to teleport players to place
execute if score Total_Players intro matches ..0 run function lobby:teams/cmd_blk_tp
#Calculate total amount of spots left in map in order to remove most scorebaords
execute if score Total_Players intro matches ..0 run function lobby:teams/players_onescoreboard
#Death Counter shown to players and reset it
execute if score Total_Players intro matches ..0 run scoreboard players reset @a[tag=player] deathCounter
execute if score Total_Players intro matches ..0 run scoreboard objectives setdisplay list deathCounter
#Indicate to leader and specators how to use /trigger commands
execute if score Total_Players intro matches ..0 run tellraw @a[tag=leader,limit=1] ["",{"text":" \u25b6","color":"aqua"},{"text":" To Use The ","color":"gray"},{"text":"Settings Book","bold":true,"color":"yellow"},{"text":" Again, ","color":"gray"},{"text":"Type Command:","bold":true,"color":"aqua"},{"text":" /trigger book","bold":true,"italic":true,"color":"gold"}]
execute if score Total_Players intro matches ..0 run scoreboard players enable @a[tag=leader,limit=1] book
execute if score Total_Players intro matches ..0 run tellraw @a[gamemode=spectator] ["",{"text":" \u25b6","color":"aqua"},{"text":" To Join A ","color":"gray"},{"text":"Team","bold":true,"color":"yellow"},{"text":", ","color":"gray"},{"text":"Type Command:","bold":true,"color":"aqua"},{"text":" /trigger join","bold":true,"italic":true,"color":"gold"}]
execute if score Total_Players intro matches ..0 run scoreboard players enable @a[gamemode=spectator] join

#-------------
#== SKYISLAND RELATED ==
#-------------






#-------------
#== MAINISLAND RELATED ==
#-------------




#-------------
#== OCEAN RELATED ==
#-------------


#Increment LP of Lobby settings to only do main_after
execute if score Total_Players intro matches ..0 run scoreboard players set LP lobbySettings 5

#Removes Intro Scoreboards
execute if score Total_Players intro matches ..0 run function lobby:intro/remove_scoreboards
