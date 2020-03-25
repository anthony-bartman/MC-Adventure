#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport players on a team to the introduction sequence
#--------------------------------------

#-----------------
#KITS DISABLED
execute if score kitsEnabled lobbySettings matches 0 run clear @s 
execute if score kitsEnabled lobbySettings matches 0 run title @s subtitle ["",{"text":"To The "},{"text":"Introduction","color":"yellow"},{"text":" Of The Map"}]
execute if score kitsEnabled lobbySettings matches 0 run title @s title ["",{"text":"Welcome ","bold":true,"color":"aqua"},{"selector":"@s[team=aquaTeam]","italic":true}]
execute if score kitsEnabled lobbySettings matches 0 run teleport @s @e[type=minecraft:armor_stand,tag=aquaIntro,limit=1]
execute if score kitsEnabled lobbySettings matches 0 run scoreboard players remove Total_Players intro 1

#------------------
#KITS ENABLED
#Check if player has choosen a kit if kits are enabled
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run clear @s 
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run title @s subtitle ["",{"text":"To The "},{"text":"Introduction","color":"yellow"},{"text":" Of The Map"}]
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run title @s title ["",{"text":"Welcome ","bold":true,"color":"aqua"},{"selector":"@s[team=aquaTeam]","italic":true}]
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run teleport @s @e[type=minecraft:armor_stand,tag=aquaIntro,limit=1]
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run scoreboard players remove Total_Players intro 1

#Player has not chooose a kit
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run title @s subtitle {"text":"Before Starting Map"}
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run title @s title {"text":"Select A Kit","color":"yellow","bold":true}
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run teleport @s @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
