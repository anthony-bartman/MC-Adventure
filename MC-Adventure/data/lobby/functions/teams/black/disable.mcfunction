#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable the specific team
#--------------------------------------

#Updates user its disabled
execute if score blackTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Black Team ","color":"dark_gray","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false}]
#Already Enabled
execute if score blackTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Black Team ","color":"dark_gray","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Remove Team Armor Stands
execute if score blackTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=blackTeam,limit=1] run kill @e[type=minecraft:armor_stand,distance=..2]
#Tell players team has been disabled by server leader
execute if score blackTeam enabledTeams matches 1 run scoreboard players reset @a blackTeamPlayers
execute if score blackTeam enabledTeams matches 1 run scoreboard players set Teammates blackTeamPlayers 0
#Reset Kits
execute if score blackTeam enabledTeams matches 1 run scoreboard players reset @a[team=blackTeam] chooseKit
execute if score blackTeam enabledTeams matches 1 run clear @a[team=blackTeam]
#Update black team players
execute if score blackTeam enabledTeams matches 1 run title @a[team=blackTeam] subtitle ["",{"text":"Has Been ["},{"text":"DISABLED","color":"red"},{"text":"] by "},{"selector":"@a[tag=leader]"}]
execute if score blackTeam enabledTeams matches 1 run title @a[team=blackTeam] title {"text":"Black Team","bold":true,"italic":true,"color":"dark_gray"}
#All Players Leave their Team
execute if score blackTeam enabledTeams matches 1 run teleport @a[team=blackTeam] @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
execute if score blackTeam enabledTeams matches 1 run team leave @a[team=blackTeam]

#Disable Team
execute if score blackTeam enabledTeams matches 1 run scoreboard players reset blackMP mapProgress
execute if score blackTeam enabledTeams matches 1 run scoreboard players set blackTeam enabledTeams 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0