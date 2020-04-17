#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will enable the specific team
#--------------------------------------

#Updates user its enabled
execute if score goldTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Gold Team ","color":"gold","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"ENABLED","bold":true,"color":"dark_green"},{"text":"]","color":"gray","bold":false}]
execute if score goldTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"Gold Team ","color":"gold","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"goldTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players\n","color":"aqua","bold":false}]

#Already Enabled
execute if score goldTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Gold Team ","color":"gold","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"ENABLED","bold":true,"color":"dark_green"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Summon in armor stands 
execute if score goldTeam enabledTeams matches 0 run function lobby:teams/gold/summon
execute if score goldTeam enabledTeams matches 0 run scoreboard players set goldMP mapProgress -1
execute if score goldTeam enabledTeams matches 0 run scoreboard players set goldTeam enabledTeams 1
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0