#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will reset max players of the all teams to setMaxPlayers
#--------------------------------------


#Runs Functions
function lobby:teams/set_maxplayers
#Update Leader
tellraw @a[tag=leader] ["",{"text":"\n---------------------------------","color":"gray","bold":false}]
tellraw @a[tag=leader] ["",{"text":"MAX TEAM PLAYERS ","color":"aqua","bold":false},{"text":"have been ","color":"gray","bold":false},{"text":"RESET","color":"red","bold":true}]
execute if score goldTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\nGold Team ","color":"gold","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"goldTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score purpleTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Purple Team ","color":"dark_purple","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"purpleTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score greenTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Green Team ","color":"green","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"greenTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score aquaTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Aqua Team ","color":"aqua","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"aquaTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score redTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Red Team ","color":"red","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"redTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score yellowTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Yellow Team ","color":"yellow","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"yellowTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score blueTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Blue Team ","color":"blue","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"blueTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score blackTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Black Team ","color":"black","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"blackTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score cyanTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Cyan Team ","color":"dark_aqua","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"cyanTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score magentaTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Magenta Team ","color":"light_purple","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"magentaTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score silverTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Silver Team ","color":"gray","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"silverTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score crimsonTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Crimson Team ","color":"dark_red","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"crimsonTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]
execute if score cobaltTeam enabledTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"Cobalt Team ","color":"dark_blue","bold":true},{"text":"has a maximum of ","color":"gray","bold":false},{"score":{"name":"cobaltTeam","objective":"maxPlayers"},"color":"aqua","bold":true},{"text":" Players","color":"aqua","bold":false}]

#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0
