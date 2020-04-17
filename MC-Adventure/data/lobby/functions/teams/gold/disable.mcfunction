#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable the specific team
#--------------------------------------

#Updates user its disabled
execute if score goldTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Gold Team ","color":"gold","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false}]
#Already Enabled
execute if score goldTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Gold Team ","color":"gold","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Remove Team Armor Stands
execute if score goldTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=goldTeam,limit=1] run kill @e[type=minecraft:armor_stand,distance=..2]
#Tell players team has been disabled by server leader
execute if score goldTeam enabledTeams matches 1 run scoreboard players reset @a gdTeamPlayers
execute if score goldTeam enabledTeams matches 1 run scoreboard players set Teammates gdTeamPlayers 0
#Reset Kits
execute if score goldTeam enabledTeams matches 1 run scoreboard players reset @a[team=goldTeam] chooseKit
execute if score goldTeam enabledTeams matches 1 run clear @a[team=goldTeam]
#Update gold team players
execute if score goldTeam enabledTeams matches 1 run title @a[team=goldTeam] subtitle ["",{"text":"Has Been ["},{"text":"DISABLED","color":"red"},{"text":"] by "},{"selector":"@a[tag=leader]"}]
execute if score goldTeam enabledTeams matches 1 run title @a[team=goldTeam] title {"text":"Gold Team","bold":true,"italic":true,"color":"gold"}
#All Players Leave their Team
execute if score goldTeam enabledTeams matches 1 run teleport @a[team=goldTeam] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute if score goldTeam enabledTeams matches 1 run team leave @a[team=goldTeam]

#Disable Team
execute if score goldTeam enabledTeams matches 1 run scoreboard players reset goldMP mapProgress
execute if score goldTeam enabledTeams matches 1 run scoreboard players set goldTeam enabledTeams 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0