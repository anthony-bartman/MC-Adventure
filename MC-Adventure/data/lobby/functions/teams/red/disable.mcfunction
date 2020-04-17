#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable the specific team
#--------------------------------------

#Updates user its disabled
execute if score redTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Red Team ","color":"red","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false}]
#Already Enabled
execute if score redTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Red Team ","color":"red","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Remove Team Armor Stands
execute if score redTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=redTeam,limit=1] run kill @e[type=minecraft:armor_stand,distance=..2]
#Tell players team has been disabled by server leader
execute if score redTeam enabledTeams matches 1 run scoreboard players reset @a rTeamPlayers
execute if score redTeam enabledTeams matches 1 run scoreboard players set Teammates rTeamPlayers 0
#Reset Kits
execute if score redTeam enabledTeams matches 1 run scoreboard players reset @a[team=redTeam] chooseKit
execute if score redTeam enabledTeams matches 1 run clear @a[team=redTeam]
#Update red team players
execute if score redTeam enabledTeams matches 1 run title @a[team=redTeam] subtitle ["",{"text":"Has Been ["},{"text":"DISABLED","color":"red"},{"text":"] by "},{"selector":"@a[tag=leader]"}]
execute if score redTeam enabledTeams matches 1 run title @a[team=redTeam] title {"text":"Red Team","bold":true,"italic":true,"color":"red"}
#All Players Leave their Team
execute if score redTeam enabledTeams matches 1 run teleport @a[team=redTeam] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute if score redTeam enabledTeams matches 1 run team leave @a[team=redTeam]

#Disable Team
execute if score redTeam enabledTeams matches 1 run scoreboard players reset redMP mapProgress
execute if score redTeam enabledTeams matches 1 run scoreboard players set redTeam enabledTeams 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0