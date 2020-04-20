#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will wait for person to change the island settings
#--------------------------------------


#Select Yes (Players can visit)
execute if score @s mapProgress matches 1 run scoreboard players set blackIS mapProgress 1
execute if score @s mapProgress matches 1 run tellraw @s ["",{"text":"Island Settings changed to: "},{"text":"All Players","bold":true,"color":"yellow"},{"text":" can "},{"text":"visit island","color":"green","bold":true}]


#Select No (Players cannot visit)
execute if score @s mapProgress matches 2 run scoreboard players set blackIS mapProgress 1
execute if score @s mapProgress matches 2 run tellraw @s ["",{"text":"Island Settings changed to: "},{"text":"All Players","bold":true,"color":"yellow"},{"text":" will be "},{"text":"teleported away","color":"red","bold":true}]

#Reset Player
scoreboard players reset @s[scores={mapProgress=1..2}] mapProgress