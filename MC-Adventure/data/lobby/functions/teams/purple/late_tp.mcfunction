#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport players on a team to the map
#--------------------------------------

#Check if player has choosen a kit
execute if score kitsEnabled lobbySettings matches 0 run clear @s 
execute if score kitsEnabled lobbySettings matches 0 run effect clear @s
execute if score kitsEnabled lobbySettings matches 0 run advancement revoke @s everything
execute if score kitsEnabled lobbySettings matches 0 run recipe take @s *
#Update Players
execute if score kitsEnabled lobbySettings matches 0 run title @s subtitle ["",{"text":"To "},{"text":"Purple Team's ","color":"dark_purple","bold":true},{"text":"Spawnpoint"}]
execute if score kitsEnabled lobbySettings matches 0 run title @s title ["",{"text":"Teleporting ","bold":true,"color":"white"}]
execute if score kitsEnabled lobbySettings matches 0 run tag @s remove newbie
execute if score kitsEnabled lobbySettings matches 0 run function lobby:teams/purple/teamspawn


#Check if player has choosen a kit
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run clear @s 
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run effect clear @s
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run advancement revoke @s everything
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run recipe take @s *
#Update Players
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run title @s subtitle ["",{"text":"To "},{"text":"Purple Team's ","color":"dark_purple","bold":true},{"text":"Spawnpoint"}]
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run title @s title ["",{"text":"Teleporting ","bold":true,"color":"white"}]
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run tag @s remove newbie
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run function lobby:teams/purple/teamspawn

#Player has not chooose a kit
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run title @s subtitle {"text":"Before Starting Map"}
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run title @s title {"text":"Select A Kit","color":"yellow","bold":true}
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run teleport @s @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
