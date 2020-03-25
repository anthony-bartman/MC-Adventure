#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport leader to the introduction sequence
#--------------------------------------

#KITS DISABLED
#Check if player has choosen a kit
execute if score kitsEnabled lobbySettings matches 0 run clear @s 
#Give the leader the item to start the map
execute if score kitsEnabled lobbySettings matches 0 as @s run function lobby:intro/get_beginrclick
execute if score kitsEnabled lobbySettings matches 0 run title @s subtitle {"text":"Right Click Item In Inventory To Begin"}
execute if score kitsEnabled lobbySettings matches 0 run title @s title {"text":"Welcome to Map Intro","bold":false,"color":"gold"}
#Teleport leader to center of introsequence
execute if score kitsEnabled lobbySettings matches 0 run teleport @s @e[type=minecraft:armor_stand,tag=introCen,limit=1]
execute if score kitsEnabled lobbySettings matches 0 run scoreboard players remove Total_Players intro 1


#----------------------
#KITS ENABLED
#Check if player has choosen a kit
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run clear @s 
#Give the leader the item to start the map
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. as @s run function lobby:intro/get_beginrclick
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run title @s subtitle {"text":"Right Click Item In Inventory To Begin"}
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run title @s title {"text":"Welcome to Map Intro","bold":false,"color":"gold"}
#Teleport leader to center of introsequence
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run teleport @s @e[type=minecraft:armor_stand,tag=introCen,limit=1]
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run scoreboard players remove Total_Players intro 1

#Player has not chooose a kit
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run title @s subtitle {"text":"Before Starting Map"}
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run title @s title {"text":"Select A Kit","color":"yellow","bold":true}
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run teleport @s @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
