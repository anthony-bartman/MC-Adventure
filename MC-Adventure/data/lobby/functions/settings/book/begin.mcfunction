#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will start the process to begin the map from the lobby
#--------------------------------------

#Executes if a player clicks BEGIN with the book in the lobby to start the map
#TRUE
execute unless entity @a[team=] run function lobby:settings/book/lock_team
#Set Lobby Leader to go spawn things at mainisland
execute unless entity @a[team=] run scoreboard players set @a[tag=leader,limit=1] intro 0
execute unless entity @a[team=] run scoreboard players set introProgress intro 0
execute unless entity @a[team=] run teleport @a[team=!] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute unless entity @a[team=] run gamemode spectator @a[tag=leader,limit=1]
execute unless entity @a[team=] run scoreboard players set lobbyProgress LP 1

#FALSE, player/s have not selected a team yet
execute if score lobbyProgress LP matches 0 run tellraw @a ["",{"text":"\n"},{"text":"Players: [","color":"dark_aqua"},{"selector":"@a[team=]","bold":true,"color":"gray"},{"text":"] have not joined a team.","color":"dark_aqua"},{"text":"\n"},{"text":"Cancelling start of the map...","bold":true,"color":"red"},{"text":"\n "}]

#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0