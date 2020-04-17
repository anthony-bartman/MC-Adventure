#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable the specific team
#--------------------------------------

#Updates user its disabled
execute if score blueTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Blue Team ","color":"blue","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false}]
#Already Enabled
execute if score blueTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Blue Team ","color":"blue","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Remove Team Armor Stands
execute if score blueTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=blueTeam,limit=1] run kill @e[type=minecraft:armor_stand,distance=..2]
#Tell players team has been disabled by server leader
execute if score blueTeam enabledTeams matches 1 run scoreboard players reset @a blueTeamPlayers
execute if score blueTeam enabledTeams matches 1 run scoreboard players set Teammates blueTeamPlayers 0
#Reset Kits
execute if score blueTeam enabledTeams matches 1 run scoreboard players reset @a[team=blueTeam] chooseKit
execute if score blueTeam enabledTeams matches 1 run clear @a[team=blueTeam]
#Update blue team players
execute if score blueTeam enabledTeams matches 1 run title @a[team=blueTeam] subtitle ["",{"text":"Has Been ["},{"text":"DISABLED","color":"red"},{"text":"] by "},{"selector":"@a[tag=leader]"}]
execute if score blueTeam enabledTeams matches 1 run title @a[team=blueTeam] title {"text":"Blue Team","bold":true,"italic":true,"color":"blue"}
#All Players Leave their Team
execute if score blueTeam enabledTeams matches 1 run teleport @a[team=blueTeam] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute if score blueTeam enabledTeams matches 1 run team leave @a[team=blueTeam]

#Disable Team
execute if score blueTeam enabledTeams matches 1 run scoreboard players reset blueMP mapProgress
execute if score blueTeam enabledTeams matches 1 run scoreboard players set blueTeam enabledTeams 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0