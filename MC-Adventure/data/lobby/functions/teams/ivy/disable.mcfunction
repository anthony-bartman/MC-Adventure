#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable the specific team
#--------------------------------------

#Updates user its disabled
execute if score ivyTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Ivy Team ","color":"dark_green","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false}]
#Already Enabled
execute if score ivyTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Ivy Team ","color":"dark_green","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Remove Team Armor Stands
execute if score ivyTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=ivyTeam,limit=1] run kill @e[type=minecraft:armor_stand,distance=..2]
#Tell players team has been disabled by server leader
execute if score ivyTeam enabledTeams matches 1 run scoreboard players reset @a iTeamPlayers
execute if score ivyTeam enabledTeams matches 1 run scoreboard players set Teammates iTeamPlayers 0
#Reset Kits
execute if score ivyTeam enabledTeams matches 1 run scoreboard players reset @a[team=ivyTeam] chooseKit
execute if score ivyTeam enabledTeams matches 1 run clear @a[team=ivyTeam]
#Update ivy team players
execute if score ivyTeam enabledTeams matches 1 run title @a[team=ivyTeam] subtitle ["",{"text":"Has Been ["},{"text":"DISABLED","color":"red"},{"text":"] by "},{"selector":"@a[tag=leader]"}]
execute if score ivyTeam enabledTeams matches 1 run title @a[team=ivyTeam] title {"text":"Ivy Team","bold":true,"italic":true,"color":"dark_green"}
#All Players Leave their Team
execute if score ivyTeam enabledTeams matches 1 run teleport @a[team=ivyTeam] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute if score ivyTeam enabledTeams matches 1 run team leave @a[team=ivyTeam]

#Disable Team
execute if score ivyTeam enabledTeams matches 1 run scoreboard players reset ivyMP mapProgress
execute if score ivyTeam enabledTeams matches 1 run scoreboard players set ivyTeam enabledTeams 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0