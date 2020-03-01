#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable the specific team
#--------------------------------------

#Updates user its disabled
execute if score aquaTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Aqua Team ","color":"aqua","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false}]
#Already Enabled
execute if score aquaTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Aqua Team ","color":"aqua","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Remove Team Armor Stands
execute if score aquaTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=aquaTeam,limit=1] run kill @e[type=minecraft:armor_stand,distance=..2]
#Tell players team has been disabled by server leader
execute if score aquaTeam enabledTeams matches 1 run scoreboard players reset @a aTeamPlayers
execute if score aquaTeam enabledTeams matches 1 run scoreboard players set Teammates aTeamPlayers 0
#Reset Kits
execute if score aquaTeam enabledTeams matches 1 run scoreboard players reset @a[team=aquaTeam] chooseKit
execute if score aquaTeam enabledTeams matches 1 run clear @a[team=aquaTeam]
#Update aqua team players
execute if score aquaTeam enabledTeams matches 1 run title @a[team=aquaTeam] subtitle ["",{"text":"Has Been ["},{"text":"DISABLED","color":"red"},{"text":"] by "},{"selector":"@a[tag=leader]"}]
execute if score aquaTeam enabledTeams matches 1 run title @a[team=aquaTeam] title {"text":"Aqua Team","bold":true,"italic":true,"color":"aqua"}
#All Players Leave their Team
execute if score aquaTeam enabledTeams matches 1 run teleport @a[team=aquaTeam] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute if score aquaTeam enabledTeams matches 1 run team leave @a[team=aquaTeam]

#Disable Team
execute if score aquaTeam enabledTeams matches 1 run scoreboard players set aquaTeam enabledTeams 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0