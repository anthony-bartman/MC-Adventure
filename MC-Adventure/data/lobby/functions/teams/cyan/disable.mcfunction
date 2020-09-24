#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable the specific team
#--------------------------------------

#Updates user its disabled
execute if score cyanTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Cyan Team ","color":"dark_aqua","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false}]
#Already Enabled
execute if score cyanTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Cyan Team ","color":"dark_aqua","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Remove Team Armor Stands
execute if score cyanTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=cyanTeam,limit=1] run kill @e[type=minecraft:armor_stand,distance=..2]
#Tell players team has been disabled by server leader
execute if score cyanTeam enabledTeams matches 1 run scoreboard players reset @a cyanTeamPlayers
execute if score cyanTeam enabledTeams matches 1 run scoreboard players set Teammates cyanTeamPlayers 0
#Reset Kits
execute if score cyanTeam enabledTeams matches 1 run scoreboard players reset @a[team=cyanTeam] chooseKit
execute if score cyanTeam enabledTeams matches 1 run clear @a[team=cyanTeam]
#Update cyan team players
execute if score cyanTeam enabledTeams matches 1 run title @a[team=cyanTeam] subtitle ["",{"text":"Has Been ["},{"text":"DISABLED","color":"red"},{"text":"] by "},{"selector":"@a[tag=leader]"}]
execute if score cyanTeam enabledTeams matches 1 run title @a[team=cyanTeam] title {"text":"Cyan Team","bold":true,"italic":true,"color":"dark_aqua"}
#All Players Leave their Team
execute if score cyanTeam enabledTeams matches 1 run teleport @a[team=cyanTeam] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute if score cyanTeam enabledTeams matches 1 run team leave @a[team=cyanTeam]

#Disable Team
execute if score cyanTeam enabledTeams matches 1 run scoreboard players reset cyanMP mapProgress
execute if score cyanTeam enabledTeams matches 1 run scoreboard players set cyanTeam enabledTeams 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0