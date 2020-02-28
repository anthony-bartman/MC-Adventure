#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will enable the lobby particles
#--------------------------------------

#Updates user its enabled
execute if score particles particles matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Lobby particle settings have been set to: [","color":"gray"},{"text":"ENABLED","bold":true,"color":"dark_green"},{"text":"]","color":"gray"},{"text":"\n "}]

#Already Enabled
execute if score particles particles matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Lobby particle settings have already been [","color":"gray"},{"text":"ENABLED","bold":true,"color":"dark_green"},{"text":"]","color":"gray"},{"text":"\n "}]

execute if score particles particles matches 0 run scoreboard players set particles particles 1

#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0