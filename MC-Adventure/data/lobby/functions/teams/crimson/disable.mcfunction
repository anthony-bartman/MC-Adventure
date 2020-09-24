#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable the specific team
#--------------------------------------

#Updates user its disabled
execute if score crimsonTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Crimson Team ","color":"dark_red","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false}]
#Already Enabled
execute if score crimsonTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Crimson Team ","color":"dark_red","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Remove Team Armor Stands
execute if score crimsonTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=crimsonTeam,limit=1] run kill @e[type=minecraft:armor_stand,distance=..2]
#Tell players team has been disabled by server leader
execute if score crimsonTeam enabledTeams matches 1 run scoreboard players reset @a crTeamPlayers
execute if score crimsonTeam enabledTeams matches 1 run scoreboard players set Teammates crTeamPlayers 0
#Reset Kits
execute if score crimsonTeam enabledTeams matches 1 run scoreboard players reset @a[team=crimsonTeam] chooseKit
execute if score crimsonTeam enabledTeams matches 1 run clear @a[team=crimsonTeam]
#Update crimson team players
execute if score crimsonTeam enabledTeams matches 1 run title @a[team=crimsonTeam] subtitle ["",{"text":"Has Been ["},{"text":"DISABLED","color":"red"},{"text":"] by "},{"selector":"@a[tag=leader]"}]
execute if score crimsonTeam enabledTeams matches 1 run title @a[team=crimsonTeam] title {"text":"Crimson Team","bold":true,"italic":true,"color":"dark_red"}
#All Players Leave their Team
execute if score crimsonTeam enabledTeams matches 1 run teleport @a[team=crimsonTeam] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute if score crimsonTeam enabledTeams matches 1 run team leave @a[team=crimsonTeam]

#Disable Team
execute if score crimsonTeam enabledTeams matches 1 run scoreboard players reset crimsonMP mapProgress
execute if score crimsonTeam enabledTeams matches 1 run scoreboard players set crimsonTeam enabledTeams 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0