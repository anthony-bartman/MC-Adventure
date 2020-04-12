#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will remove 1 to max players of the team
#--------------------------------------

#Adds one to max players of 
execute unless score crimsonTeam maxPlayers matches 1 run scoreboard players remove crimsonTeam maxPlayers 1
execute unless score crimsonTeam maxPlayers matches 1 run scoreboard players remove crPlayersLeft teamPlayers 1
execute unless score crimsonTeam maxPlayers matches 1 run tellraw @a[tag=leader] ["",{"text":"\nCrimson Team ","color":"dark_red","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"crimsonTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score crimsonTeam maxPlayers matches 1 run tellraw @a[tag=leader] ["",{"text":"\nThere can only be a minimum of ","color":"gray"},{"score":{"name":"crimsonTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Player","color":"aqua","bold":false},{"text":" per team","color":"gray","bold":false}]

#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0