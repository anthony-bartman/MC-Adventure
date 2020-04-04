#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport players on a team to the introduction sequence
#--------------------------------------

#Check if player has choosen a kit
execute if score kitsEnabled lobbySettings matches 0 run clear @s 
execute if score kitsEnabled lobbySettings matches 0 run gamemode spectator @s
execute if score kitsEnabled lobbySettings matches 0 run scoreboard players add Total_Spectators teamPlayers 1
execute if score kitsEnabled lobbySettings matches 0 run scoreboard players enable @s join
execute if score kitsEnabled lobbySettings matches 0 run title @s subtitle ["",{"text":"To Begin "},{"text":"Spectating ","color":"yellow","bold":true},{"text":"Teams!"}]
execute if score kitsEnabled lobbySettings matches 0 run title @s title ["",{"text":"Middle Click Mouse ","bold":true,"color":"white"}]
execute if score kitsEnabled lobbySettings matches 0 run tellraw @s ["",{"text":" \u25b6","color":"aqua"},{"text":" To Join A ","color":"gray"},{"text":"Team","bold":true,"color":"yellow"},{"text":", ","color":"gray"},{"text":"Type Command:","bold":true,"color":"aqua"},{"text":" /trigger join","bold":true,"italic":true,"color":"gold"}]
execute if score kitsEnabled lobbySettings matches 0 run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 100
execute if score kitsEnabled lobbySettings matches 0 run tag @s remove newbie
execute if score kitsEnabled lobbySettings matches 0 run scoreboard players set @s[tag=leader] join -1
execute if score kitsEnabled lobbySettings matches 0 run teleport @s @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]

#Check if player has choosen a kit
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run clear @s 
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run gamemode spectator @s
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 1.. run scoreboard players add Total_Spectators teamPlayers 1
execute if score kitsEnabled lobbySettings matches 1 run title @s subtitle ["",{"text":"To Begin "},{"text":"Spectating ","color":"yellow","bold":true},{"text":"Teams!"}]
execute if score kitsEnabled lobbySettings matches 1 run title @s title ["",{"text":"Middle Click Mouse ","bold":true,"color":"white"}]
execute if score kitsEnabled lobbySettings matches 1 run tellraw @s ["",{"text":" \u25b6","color":"aqua"},{"text":" To Join A ","color":"gray"},{"text":"Team","bold":true,"color":"yellow"},{"text":", ","color":"gray"},{"text":"Type Command:","bold":true,"color":"aqua"},{"text":" /trigger join","bold":true,"italic":true,"color":"gold"}]
execute if score kitsEnabled lobbySettings matches 1 run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 100
execute if score kitsEnabled lobbySettings matches 1 run tag @s remove newbie
execute if score kitsEnabled lobbySettings matches 1 run teleport @s @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
#Player has not chooose a kit
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run title @s subtitle {"text":"Before Starting Map"}
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run title @s title {"text":"Select A Kit","color":"yellow","bold":true}
execute if score kitsEnabled lobbySettings matches 1 if score @s chooseKit matches 0 run teleport @s @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]
