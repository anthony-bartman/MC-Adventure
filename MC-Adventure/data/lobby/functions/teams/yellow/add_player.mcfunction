#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will add 1 to max players of the team
#--------------------------------------

#Adds one to max players of 
execute unless score yellowTeam maxPlayers matches 8 run scoreboard players add yellowTeam maxPlayers 1
execute unless score yellowTeam maxPlayers matches 8 run scoreboard players add yPlayersLeft teamPlayers 1
execute unless score yellowTeam maxPlayers matches 8 run tellraw @a[tag=leader] ["",{"text":"\nYellow Team ","color":"yellow","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"yellowTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score yellowTeam maxPlayers matches 8 run tellraw @a[tag=leader] ["",{"text":"\nThere can only be a maximum of ","color":"gray"},{"score":{"name":"yellowTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false},{"text":" per team","color":"gray","bold":false}]

#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0