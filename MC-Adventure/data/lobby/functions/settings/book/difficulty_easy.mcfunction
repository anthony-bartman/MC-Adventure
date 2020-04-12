#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will set difficulty of the map
#--------------------------------------

#Updates user its enabled
execute if score difficulty lobbySettings matches 2..3 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Map difficulty has been set to: [","color":"gray"},{"text":"EASY","bold":true,"color":"dark_green"},{"text":"]","color":"gray"},{"text":"\n "}]

#Already Enabled
execute if score difficulty lobbySettings matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Map difficulty has already been set to: [","color":"gray"},{"text":"EASY","bold":true,"color":"dark_green"},{"text":"]","color":"gray"},{"text":"\n "}]

execute if score difficulty lobbySettings matches 2..3 run difficulty easy
execute if score difficulty lobbySettings matches 2..3 run scoreboard players set difficulty lobbySettings 1
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0