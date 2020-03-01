#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable the specific team
#--------------------------------------

#Updates user its disabled
execute if score greenTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Green Team ","color":"green","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false}]
#Already Enabled
execute if score greenTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Green Team ","color":"green","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Remove Team Armor Stands
execute if score greenTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=greenTeam,limit=1] run kill @e[type=minecraft:armor_stand,distance=..2]
#Tell players team has been disabled by server leader
execute if score greenTeam enabledTeams matches 1 run scoreboard players reset @a grTeamPlayers
execute if score greenTeam enabledTeams matches 1 run scoreboard players set Teammates grTeamPlayers 0
#Reset Kits
execute if score greenTeam enabledTeams matches 1 run scoreboard players reset @a[team=greenTeam] chooseKit
execute if score greenTeam enabledTeams matches 1 run clear @a[team=greenTeam]
#Update green team players
execute if score greenTeam enabledTeams matches 1 run title @a[team=greenTeam] subtitle ["",{"text":"Has Been ["},{"text":"DISABLED","color":"red"},{"text":"] by "},{"selector":"@a[tag=leader]"}]
execute if score greenTeam enabledTeams matches 1 run title @a[team=greenTeam] title {"text":"Green Team","bold":true,"italic":true,"color":"green"}
#All Players Leave their Team
execute if score greenTeam enabledTeams matches 1 run teleport @a[team=greenTeam] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute if score greenTeam enabledTeams matches 1 run team leave @a[team=greenTeam]

#Disable Team
execute if score greenTeam enabledTeams matches 1 run scoreboard players set greenTeam enabledTeams 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0