#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport players on a team to the introduction sequence
#--------------------------------------

#Check if player has choosen a kit
execute if score @s chooseKit matches 1.. run clear @s 
execute if score @s chooseKit matches 1.. run gamemode spectator @s
execute if score @s chooseKit matches 1.. run scoreboard players add Total_Spectators teamPlayers 1

#Player has not chooose a kit
execute if score @s chooseKit matches 0 run title @s subtitle {"text":"Before Starting Map"}
execute if score @s chooseKit matches 0 run title @s title {"text":"Select A Kit","color":"yellow","bold":true}
execute if score @s chooseKit matches 0 run teleport @s @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
