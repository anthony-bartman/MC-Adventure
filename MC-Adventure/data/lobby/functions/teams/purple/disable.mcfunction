#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable the specific team
#--------------------------------------

#Updates user its disabled
execute if score purpleTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Purple Team ","color":"dark_purple","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false}]
#Already Enabled
execute if score purpleTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Purple Team ","color":"dark_purple","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Remove Team Armor Stands
execute if score purpleTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=purpleTeam,limit=1] run kill @e[type=minecraft:armor_stand,distance=..2]
#Tell players team has been disabled by server leader
execute if score purpleTeam enabledTeams matches 1 run scoreboard players reset @a pTeamPlayers
execute if score purpleTeam enabledTeams matches 1 run scoreboard players set Teammates pTeamPlayers 0
#Reset Kits
execute if score purpleTeam enabledTeams matches 1 run scoreboard players reset @a[team=purpleTeam] chooseKit
execute if score purpleTeam enabledTeams matches 1 run clear @a[team=purpleTeam]
#Update purple team players
execute if score purpleTeam enabledTeams matches 1 run title @a[team=purpleTeam] subtitle ["",{"text":"Has Been ["},{"text":"DISABLED","color":"red"},{"text":"] by "},{"selector":"@a[tag=leader]"}]
execute if score purpleTeam enabledTeams matches 1 run title @a[team=purpleTeam] title {"text":"Purple Team","bold":true,"italic":true,"color":"dark_purple"}
#All Players Leave their Team
execute if score purpleTeam enabledTeams matches 1 run teleport @a[team=purpleTeam] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute if score purpleTeam enabledTeams matches 1 run team leave @a[team=purpleTeam]

#Disable Team
execute if score purpleTeam enabledTeams matches 1 run scoreboard players reset purpleMP mapProgress
execute if score purpleTeam enabledTeams matches 1 run scoreboard players set purpleTeam enabledTeams 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0