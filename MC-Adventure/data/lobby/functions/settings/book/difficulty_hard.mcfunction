#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will set difficulty of the map
#--------------------------------------

#Updates user its enabled
execute if score difficulty lobbySettings matches 1..2 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Map difficulty has been set to: [","color":"gray"},{"text":"HARD","bold":true,"color":"red"},{"text":"]","color":"gray"},{"text":"\n "}]

#Already Enabled
execute if score difficulty lobbySettings matches 3 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Map difficulty has already been set to: [","color":"gray"},{"text":"HARD","bold":true,"color":"red"},{"text":"]","color":"gray"},{"text":"\n "}]

execute if score difficulty lobbySettings matches 1..2 run difficulty hard
execute if score difficulty lobbySettings matches 1..2 run scoreboard players set difficulty lobbySettings 3
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0