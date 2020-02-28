#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disbale the lobby particles
#--------------------------------------

#User update saying Disabled
execute if score particles particles matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Lobby particle settings have been set to: [","color":"gray"},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray"},{"text":"\n "}]

#Already Been Disabled
execute if score particles particles matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Lobby particle settings have already been set to: [","color":"gray"},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray"},{"text":"\n "}]

#Updates Score
execute if score particles particles matches 1 run scoreboard players set particles particles 0

#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0