#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will enable the specific team
#--------------------------------------

#Updates user its enabled
execute if score magentaTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Magenta Team ","color":"light_purple","bold":true},{"text":"has been [","color":"gray","bold":false},{"text":"ENABLED","bold":true,"color":"dark_green"},{"text":"]","color":"gray","bold":false}]
execute if score magentaTeam enabledTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"Magenta Team ","color":"light_purple","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"magentaTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players\n","color":"aqua","bold":false}]

#Already Enabled
execute if score magentaTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Magenta Team ","color":"light_purple","bold":true},{"text":"has already been [","color":"gray","bold":false},{"text":"ENABLED","bold":true,"color":"dark_green"},{"text":"]","color":"gray","bold":false},{"text":"\n "}]

#Summon in armor stands 
execute if score magentaTeam enabledTeams matches 0 run function lobby:teams/magenta/summon
execute if score magentaTeam enabledTeams matches 0 run scoreboard players set magentaMP mapProgress -1
execute if score magentaTeam enabledTeams matches 0 run scoreboard players set magentaTeam enabledTeams 1
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0