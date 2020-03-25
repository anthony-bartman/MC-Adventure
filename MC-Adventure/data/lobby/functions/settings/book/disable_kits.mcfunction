#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will disbale the lobby particles
#--------------------------------------

#User update saying Disabled
execute if score kitsEnabled lobbySettings matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Kits have been set to: [","color":"gray"},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray"},{"text":"\n "}]

#Already Been Disabled
execute if score kitsEnabled lobbySettings matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Kits have already been set to: [","color":"gray"},{"text":"DISABLED","bold":true,"color":"red"},{"text":"]","color":"gray"},{"text":"\n "}]

#Updates Score
execute if score kitsEnabled lobbySettings matches 1 run scoreboard objectives remove chooseKit
execute if score kitsEnabled lobbySettings matches 1 run clear @a
execute if score kitsEnabled lobbySettings matches 1 run scoreboard players set kitsEnabled lobbySettings 0

#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0