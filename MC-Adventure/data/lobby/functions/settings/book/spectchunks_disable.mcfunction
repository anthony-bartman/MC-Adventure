#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disable spectators flying around to generate world...
#--------------------------------------

#Updates user its enabled
execute if score spectatorChunks lobbySettings matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"DOES NOTHING Spectators generating new chunks has been: [","color":"gray"},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray"},{"text":"\n "}]

#Already Enabled
execute if score spectatorChunks lobbySettings matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"DOES NOTHING Spectators generating new chunks has already been: [","color":"gray"},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray"},{"text":"\n "}]

execute if score spectatorChunks lobbySettings matches 1 run scoreboard players set spectatorChunks lobbySettings 0
#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0