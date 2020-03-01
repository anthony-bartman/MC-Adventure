#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable the specific team
#--------------------------------------

#Updates user its disabled
execute if score silverTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Silver Team ","color":"gray","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false}]
#Already Enabled
execute if score silverTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Silver Team ","color":"gray","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Remove Team Armor Stands
execute if score silverTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=silverTeam,limit=1] run kill @e[type=minecraft:armor_stand,distance=..2]
#Tell players team has been disabled by server leader
execute if score silverTeam enabledTeams matches 1 run scoreboard players reset @a sTeamPlayers
execute if score silverTeam enabledTeams matches 1 run scoreboard players set Teammates sTeamPlayers 0
#Reset Kits
execute if score silverTeam enabledTeams matches 1 run scoreboard players reset @a[team=silverTeam] chooseKit
execute if score silverTeam enabledTeams matches 1 run clear @a[team=silverTeam]
#Update silver team players
execute if score silverTeam enabledTeams matches 1 run title @a[team=silverTeam] subtitle ["",{"text":"Has Been ["},{"text":"DISABLED","color":"red"},{"text":"] by "},{"selector":"@a[tag=leader]"}]
execute if score silverTeam enabledTeams matches 1 run title @a[team=silverTeam] title {"text":"Silver Team","bold":true,"italic":true,"color":"gray"}
#All Players Leave their Team
execute if score silverTeam enabledTeams matches 1 run teleport @a[team=silverTeam] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute if score silverTeam enabledTeams matches 1 run team leave @a[team=silverTeam]

#Disable Team
execute if score silverTeam enabledTeams matches 1 run scoreboard players set silverTeam enabledTeams 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0