#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will enable spectators flying around to generate world...
#--------------------------------------

#Updates user its enabled
execute if score spectatorChunks lobbySettings matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"DOES NOTHING Spectators generating new chunks has been: [","color":"gray"},{"text":"ENABLED","bold":true,"color":"dark_green"},{"text":"]","color":"gray"},{"text":"\n "}]

#Already Enabled
execute if score spectatorChunks lobbySettings matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"DOES NOTHING Spectators generating new chunks has already been: [","color":"gray"},{"text":"ENABLED","bold":true,"color":"dark_green"},{"text":"]","color":"gray"},{"text":"\n "}]

execute if score spectatorChunks lobbySettings matches 0 run scoreboard players set spectatorChunks lobbySettings 1
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0